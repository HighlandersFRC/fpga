/* boneCV.cpp
 * 
 */

#include<stdio.h>
#include<string>
#include<stdlib.h>
#include<sys/time.h>
#include<math.h>
#include<iostream>
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

double pixelSqAngle(1.19e-6);
double pixelAngle(0.001462);
int nearVertThresh(20);

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
  VideoCapture capture("http://10.44.99.11/mjpg/video.mjpg");
  if(!capture.isOpened()){
    cout << "Failed to connect to the camera." << endl;
  }
  capture.set(CV_CAP_PROP_FRAME_WIDTH,640);
  capture.set(CV_CAP_PROP_FRAME_HEIGHT,480);
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

int main()
{
  printf("starting at %lu\n", currentTimeMillis());
  cout << "gui mode enabled\n";
  pthread_cond_init(&frameCond, NULL);
  pthread_mutex_init(&frameCondLock, NULL);
  pthread_t readerThread;
  int rc(pthread_create(&readerThread, NULL, readVideo, (void *)0));
  VideoWriter vidwrite("videoOutput.mpeg", CV_FOURCC('M', 'P', 'E', 'G'), 30, Size(800,600));
  ITable* table = NetworkTableTools::GetClientTable("10.44.99.2", "SmartDashboard");
  namedWindow("processed_output", 1);
  namedWindow("raw_input", 1);
  createTrackbar("nearVertThresh", "processed_output", &nearVertThresh, 100);
  Mat frame, blue, green, red, gray, edge, draw;
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
    blur(green, green, Size(3,3));
    Canny(green, edge, 100, 200, 3);
    //printf("edge detection finished at %lu\n", currentTimeMillis());
    //dilate(edge, edge, getStructuringElement(MORPH_RECT, Size(5,5), Point(3,3)));
    vector<vector<Point> > contours;
    vector<Vec4i> hierarchy;
    findContours(edge, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE);
    //printf("contours found at %lu\n", currentTimeMillis());
    vector<vector<Point> > polys(contours.size());
    for (int n = 0; n < contours.size(); ++n) {
      approxPolyDP(contours[n], polys[n], 4, true);
    }
    draw = frame.clone();
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
      putText(draw, "quad "+std::to_string(n), quads[n][0], FONT_HERSHEY_PLAIN, 1.0, quadcolor);
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
    drawContours(draw, contours, -1, contourcolor);
    Scalar polycolor(255, 0, 0);
    drawContours(draw, polys, -1, polycolor);
    drawContours(draw, quads, -1, quadcolor);
    Scalar rectcolor(0, 255, 0);
    drawContours(draw, rects, -1, rectcolor, 3);
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
      if (ydiffm1 < abs(xcoord1-xcoord2)) {
	//double newrange((1/tan(sqrt(calcQuadArea(rects[n]) * pixelSqAngle))) * 9.695);
	double newrange(4/tan(ydiffm1*pixelAngle));
	printf("target found at (%d, %d) with ydiff %d and range %f\n", rects[n][0].x, rects[n][0].y, ydiffm1, newrange);
	if (range > newrange) {
	  range = newrange;
	  //targetx = bounds.x;
	  //targety = bounds.y;
	}
	drawContours(draw, rects, n, targetcolor, 2);
	detected = true;
      }
    }
    if (detected) {
      table->PutNumber("Vision_Range", range);
      //table->PutNumber("Vision_X", targetx);
      //table->PutNumber("Vision_Y", targety);
    } else {
      table->PutNumber("Vision_Range", -1);
    }
    printf("end of frame %d at %lu\n", framenum, currentTimeMillis());
    imshow("processed_output", draw);
    imshow("raw_input", frame);
    if (waitKey(10) >= 0) {
      break;
    }
    //updateWindow("processed_output");
    vidwrite.write(draw);
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
