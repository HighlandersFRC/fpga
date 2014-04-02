/* boneCV.cpp
 * 
 */

#include<stdio.h>
#include<string>
#include<stdlib.h>
#include<sys/time.h>
#include<math.h>
#include<iostream>
#include<fstream>
#include<pthread.h>
#include<unistd.h>
#include<opencv2/opencv.hpp>
//#include "networktables/NetworkTable.h"
#include "../netTablesTest/nttools/NetworkTableTools.h"
using namespace std;
using namespace cv;

unsigned long currentTimeMillis()
{
  struct timeval tv;
  gettimeofday(&tv, NULL);
  return tv.tv_sec*1000 + tv.tv_usec/1000;
}

Mat currentFrame;
pthread_mutex_t framelock = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t frameCond;
pthread_mutex_t frameCondLock;
Mat frame, blue, green, red, gray, edge, ballPlane, targetDraw, ballDraw;

struct interpPoint {
  double theta;
  double mag;
  double elev;
  double power;
};

vector< interpPoint > shotLookup;

ifstream conf("config.txt");

bool redTeam(true);
bool enableBalls(true);
double goalHeight;
double pixelSqAngle(1.19e-6);
double pixelAngle(0.001462);
int nearVertThresh(20);
int aspectRatioMin(15);
int aspectRatioMax(27);
int ballBlurSize(5);
int ballMinRadius(30);
int ballMaxRadius(200);
int ballAccThresh(20);
int ballCannyThresh(150);
const int imageWidth(800);
const int imageHeight(600);
double camElevation(0);

ITable* table;

void readconfig() {
  cout << "starting read config\n";
  //conf.open("config.txt");
  while (conf.good()) {
    cout << "entered loop\n";
    double temptheta;
    double tempmag;
    double tempelev;
    double temppower;
    cout << "input operators\n";
    conf >> temptheta;
    conf >> tempmag;
    conf >> tempelev;
    conf >> temppower;
    cout << "end input operators\n";
    interpPoint * temppoint = new interpPoint();
    cout << "setting up point\n";
    temppoint->theta = temptheta;
    temppoint->mag = tempmag;
    temppoint->elev = tempelev;
    temppoint->power = temppower;
    cout << "adding point\n";
    shotLookup.push_back(*temppoint);
    printf("read config entry: (%f, %f) => (%f, %f)", temptheta, tempmag, tempelev, temppower);
  }
  cout << "read config file\n";
}

int calcQuadArea(vector<Point> points) {
  int crosssum = 0;
  vector<Point> sides(4);
  for (int s = 0; s < 4; ++s) {
    sides[s] = points[s] - points[(s+1) % 4];
  }
  for (int n = 0; n < 4; ++n) {
    crosssum += abs(sides[n].x * sides[(n+1)%4].y + sides[n].y * sides[(n+1)%4].x);
  }
  return crosssum / 4;
}

void *readVideo(void *arg) {
  Mat tempFrame;
  cout << "attempting to create capture\n";
  VideoCapture capture("http://10.44.99.11/mjpg/video.mjpg");
  if(!capture.isOpened()){
    cout << "Failed to connect to the camera." << endl;
  }
  //capture.set(CV_CAP_PROP_FRAME_WIDTH,800);
  //capture.set(CV_CAP_PROP_FRAME_HEIGHT,600);
  cout << "capture set up\n";
  while (true) {
    capture >> tempFrame;
    pthread_mutex_lock(&framelock);
    currentFrame = tempFrame;
    pthread_mutex_unlock(&framelock);
    pthread_mutex_lock(&frameCondLock);
    //cout << "signaling new frame\n";
    pthread_cond_signal(&frameCond);
    pthread_mutex_unlock(&frameCondLock);
    usleep(50000);
  }
}

double calcdist(double x, double y) {
  return sqrt(x*x+y*y);
}

void targetShot(double range) {
  double theta, mag;
  double vx = 4.90333 * goalHeight * 0.451601 * sqrt(range) / range;
  double vy = 9.80665 * 0.451601 * sqrt(range);
  vx = vx - table->GetNumber("RobotVelocity", 0);
  theta = atan2(vy, vx);
  mag = calcdist(vx, vy);
  interpPoint * p1 = NULL;
  interpPoint * p2 = NULL;
  interpPoint * p3 = NULL;
  for (int n = 0; n < shotLookup.size(); ++n) {
    if (p1 == NULL) {
      p1 = &shotLookup[n];
    } else {
      if (calcdist(theta - shotLookup[n].theta, mag - shotLookup[n].mag) > calcdist(theta - p1->theta, mag - p1->mag)) {
	if (p2 == NULL) {
	  p2 = &shotLookup[n];
	} else {
	  if (calcdist(theta - shotLookup[n].theta, mag - shotLookup[n].mag) > calcdist(theta - p2->theta, mag - p2->mag)) {
	    double slope1 = atan2(p1->theta - p2->theta, p1->mag - p2->mag);
	    double slope2 = atan2(p1->theta - shotLookup[n].theta, p1->mag - shotLookup[n].mag);
	    if (slope1 - slope2 > 0.001) {
	      if (p3 == NULL) {
		p3 = &shotLookup[n];
	      } else {
		if (calcdist(theta - shotLookup[n].theta, mag - shotLookup[n].mag) > calcdist(theta - p3->theta, mag - p3->mag)) {
		  //discard point
		} else {
		  p3 = &shotLookup[n];
		}
	      }
	    }
	  } else {
	    p2 = &shotLookup[n];
	  }
	}
      } else {
	p1 = &shotLookup[n];
      }
    }
  }
  if (p1 != NULL && p2 != NULL && p3 != NULL) {
    double r1 = calcdist(theta - p1->theta, mag - p1->mag);
    double r2 = calcdist(theta - p2->theta, mag - p2->mag);
    double r3 = calcdist(theta - p3->theta, mag - p3->mag);
    double elev = (p1->elev * r1 + p2->elev * r2 + p3->elev * r3)/(r1 + r2 + r3);
    double power = (p1->power * r1 + p2->power * r2 + p3->power * r3)/(r1 + r2 + r3);
    table->PutNumber("shotTheta", theta);
    table->PutNumber("shotMag", mag);
    table->PutNumber("shotElevation", elev);
    table->PutNumber("shotPower", power);
  }
}

void detectTarget() {

  blur(green, green, Size(3,3));
  Canny(green, edge, 50, 100, 3);
  //printf("edge detection finished at %lu\n", currentTimeMillis());
  //dilate(edge, edge, getStructuringElement(MORPH_RECT, Size(5,5), Point(3,3)));
  vector<vector<Point> > contours;
  vector<Vec4i> hierarchy;
  findContours(edge, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE);
  //printf("contours found at %lu\n", currentTimeMillis());
  vector<vector<Point> > polys(contours.size());
  for (int n = 0; n < contours.size(); ++n) {
    approxPolyDP(contours[n], polys[n], 6, true);
  }
  Scalar quadcolor(0, 255, 255);
  //printf("polygons approximated at %lu\n", currentTimeMillis());
  vector<vector<Point> > quads;
  for (int n = 0; n < polys.size(); ++n) {
    if (polys[n].size() == 4) {
      quads.push_back(polys[n]);
    }
  }
  //printf("quads filtered at %lu\n", currentTimeMillis());
  vector<vector<Point> > rects;
  for (int n = 0; n < quads.size(); ++n) {
    vector<Point> sides(4);
    putText(targetDraw, "quad "+std::to_string(n), quads[n][0], FONT_HERSHEY_PLAIN, 1.0, quadcolor);
    for (int s = 0; s < 4; s++) {
      sides[s] = quads[n][s] - quads[n][(s+1) % 4];
      //printf("corner %d of quad %d is (%d, %d)\n", s, n, quads[n][s].x, quads[n][s].y);
      //printf("side %d of quad %d is (%d, %d)\n", s, n, sides[s].x, sides[s].y);
    }
    int nearvertcount(0);
    bool sign(false);
    bool samesign(true);
    for (int s = 0; s < 4; s++) {
      if (abs(sides[s].x)/abs((double)sides[s].y+1) < nearVertThresh/100.0) {
	++nearvertcount;
      }
      int zcross(sides[s].x * sides[(s+1)%4].y - sides[s].y * sides[(s+1)%4].x);
      if (s == 0) {
	sign = signbit(zcross);
      }
      if (signbit(zcross) != sign) {
	samesign = false;
      }
    }
    if (nearvertcount == 2 & samesign) {
      rects.push_back(quads[n]);
      printf("quad %d is a rectangle with orientation %d\n", n, sign);
    }
  }
  //printf("rectangles filtered at %lu\n", currentTimeMillis());
  printf("%lu rectangles found\n", rects.size());
  Scalar contourcolor(0, 0, 255);
  drawContours(targetDraw, contours, -1, contourcolor);
  Scalar polycolor(255, 0, 0);
  drawContours(targetDraw, polys, -1, polycolor);
  drawContours(targetDraw, quads, -1, quadcolor);
  Scalar rectcolor(0, 255, 0);
  drawContours(targetDraw, rects, -1, rectcolor, 3);
  Scalar targetcolor(255, 255, 255);
  bool detected(false);
  double range(1e30);
  int targetx(0), targety(0);
  for (int n = 0; n < rects.size(); ++n) {
    vector<Point> currect(4);
    int ydiffm1 = 0;
    int ydiffm2 = 0;
    int xcoord1, xcoord2;
    for (int s = 0; s < 4; ++s) {
      int ydiff = abs(rects[n][s].y - rects[n][(s+1)%4].y);
      if (ydiff > ydiffm1) {
	ydiffm2 = ydiffm1;
	xcoord2 = xcoord1;
	ydiffm1 = ydiff;
	xcoord1 = rects[n][s].x;
      } else if (ydiff > ydiffm2) {
	ydiffm2 = ydiff;
	xcoord2 = rects[n][s].x;
      }
    }
    double ar = ydiffm1 /double(abs(xcoord1-xcoord2));
    if (aspectRatioMin/100.0 < ar && aspectRatioMax/100.0 > ar) {
      //double newrange((1/tan(sqrt(calcQuadArea(rects[n]) * pixelSqAngle))) * 9.695);
      double newrange(4/tan(ydiffm1*pixelAngle));
      printf("target found at (%d, %d) with ydiff %d and range %f\n", rects[n][0].x, rects[n][0].y, ydiffm1, newrange);
      if (range > newrange) {
	range = newrange;
	//targetx = bounds.x;
	//targety = bounds.y;
      }
      drawContours(targetDraw, rects, n, targetcolor, 2);
      detected = true;
    }
  }
  if (detected) {
    table->PutNumber("Vision_Range", range);
    targetShot(range * 0.0254);
  } else {
    table->PutNumber("Vision_Range", -1);
  }
  cout << "finished detectTarget\n";
}

void teamCheckCallback(int state, void* userdata) {
  redTeam = (state == 1);
}
void ballCheckCallback(int state, void* userdata) {
  enableBalls = (state == 1);
}

void detectBalls() {
  cout << "starting detectBalls\n";
  if (redTeam) {
    ballPlane = red.clone();
  } else {
    ballPlane = blue.clone();
  }
  addWeighted(ballPlane, 1, green, -0.25, 0, ballPlane);
  addWeighted(ballPlane, 1, red, -0.25, 0, ballPlane);
  addWeighted(ballPlane, 3, blue, -0.75, 0, ballPlane);
  //threshold(ballPlane, ballPlane, 100, 255, THRESH_BINARY);
  vector<Vec3f> circles;
  Point maxCenter(0, 0);
  int maxRadius(0);
  blur(ballPlane, ballPlane, Size(ballBlurSize, ballBlurSize));
  ballDraw = ballPlane.clone();
  HoughCircles( ballPlane, circles, CV_HOUGH_GRADIENT, 1, ballPlane.rows/8, ballCannyThresh, ballAccThresh, ballMinRadius, ballMaxRadius );
  printf("\n%lu circles detected\n", circles.size());
  for( size_t i = 0; i < circles.size(); i++ ) {
    Point center(cvRound(circles[i][0]), cvRound(circles[i][1]));
    int radius = cvRound(circles[i][2]);
    // circle center
    circle(ballDraw, center, 3, Scalar(0,255,0), -1, 8, 0 );
    // circle outline
    circle(ballDraw, center, radius, Scalar(0,0,255), 3, 8, 0 );
    if (radius > maxRadius) {
      maxRadius = radius;
      maxCenter = center;
    }
  }
  double ballRho(24/tan(maxRadius*pixelAngle));
  double ballTheta((maxCenter.x - imageWidth/2)*pixelAngle);
  double ballPhi((maxCenter.y - imageHeight/2)*pixelAngle + camElevation);
  double ballx(ballRho * cos(ballPhi) * sin(ballTheta));
  double bally(ballRho * cos(ballPhi) * cos(ballTheta));
  double ballz(ballRho * sin(ballPhi));
  table->PutNumber("BallPosRho", ballRho);
  table->PutNumber("BallPosPhi", ballPhi);
  table->PutNumber("BallPosTheta", ballTheta);
  table->PutNumber("BallPosX", ballx);
  table->PutNumber("BallPosY", bally);
  table->PutNumber("BallPosZ", ballz);
}

int main()
{
  printf("starting at %lu\n", currentTimeMillis());
  cout << "gui mode enabled\n";
  readconfig();
  pthread_cond_init(&frameCond, NULL);
  pthread_mutex_init(&frameCondLock, NULL);
  pthread_t readerThread;
  int rc(pthread_create(&readerThread, NULL, readVideo, (void *)0));
  VideoWriter targetVidWrite("targetOutput.mpeg", CV_FOURCC('M', 'P', 'E', 'G'), 30, Size(imageWidth,imageHeight));
  VideoWriter ballVidWrite("ballOutput.mpeg", CV_FOURCC('M', 'P', 'E', 'G'), 30, Size(imageWidth,imageHeight));
  table = NetworkTableTools::GetClientTable("10.44.99.2", "SmartDashboard");
  namedWindow("target_output", 1);
  namedWindow("ball_output", 1);
  namedWindow("raw_input", 1);
  createTrackbar("nearVertThresh", "target_output", &nearVertThresh, 100);
  createTrackbar("aspectRatioMin", "target_output", &aspectRatioMin, 100);
  createTrackbar("aspectRatioMax", "target_output", &aspectRatioMax, 100);
  createTrackbar("ballBlurSize", "ball_output", &ballBlurSize, 15);
  createTrackbar("ballMinRadius", "ball_output", &ballMinRadius, 300);
  createTrackbar("ballMaxRadius", "ball_output", &ballMaxRadius, 300);
  createButton("redTeam", teamCheckCallback, NULL, CV_CHECKBOX);
  createButton("ballDetect", ballCheckCallback, NULL, CV_CHECKBOX);
  createTrackbar("ballAccThresh", "ball_output", &ballAccThresh, 100);
  createTrackbar("ballCannyThresh", "ball_output", &ballCannyThresh, 200);
  vector<Mat> planes(3);
  planes[0] = blue;
  planes[1] = green;
  planes[2] = red;
  double stime(currentTimeMillis());
  for (int framenum = 0; framenum < 900; ++framenum) {
    printf("start of frame %d at %lu\n", framenum, currentTimeMillis());
    pthread_mutex_lock(&frameCondLock);
    //cout << "waiting for new frame\n";
    pthread_cond_wait(&frameCond, &frameCondLock);
    //cout << "finished waiting for new frame\n";
    pthread_mutex_lock(&framelock);
    frame = currentFrame;
    pthread_mutex_unlock(&framelock);
    pthread_mutex_unlock(&frameCondLock);
    if(frame.empty()){
      cout << "Failed to capture an image" << endl;
      return 1;
    }
    printf("frame captured at %lu\n", currentTimeMillis());
    //cvtColor(frame, gray, CV_BGR2GRAY);
    split(frame, planes);
    blue = planes[0];
    green = planes[1];
    red = planes[2];
    //printf("frame split into planes at %lu\n", currentTimeMillis());
    targetDraw = frame.clone();
    ballDraw = frame.clone();
    if (enableBalls) {
      detectBalls();
    } else {
      detectTarget();
    }



    printf("end of frame %d at %lu\n", framenum, currentTimeMillis());
    imshow("ball_output", ballDraw);
    imshow("target_output", targetDraw);
    imshow("raw_input", frame);
    if (waitKey(10) >= 0) {
      break;
    }
    //updateWindow("processed_output");
    targetVidWrite.write(targetDraw);
    ballVidWrite.write(ballDraw);
    //imwrite("draw.png", draw);
    usleep(50000);
  }
  printf("finished at %lu\n", currentTimeMillis());
  while (waitKey(10) >= 0);
  while (waitKey(10) < 0);
  //imwrite("edge.png", edge);
  //imwrite("gray.png", gray);
  //imwrite("red.png", red);
  //imwrite("blue.png", blue);
  //imwrite("green.png", green);
  //imwrite("capture.png", frame);
  return 0;
}
