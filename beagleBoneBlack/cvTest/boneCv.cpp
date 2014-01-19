 /* boneCV.cpp
 * 
 */

#include<stdio.h>
#include<sys/time.h>
#include<iostream>
#include<opencv2/opencv.hpp>
using namespace std;
using namespace cv;

unsigned long currentTimeMillis(){
	struct timeval tv;
	gettimeofday(&tv, NULL);
	return tv.tv_sec*1000 + tv.tv_usec/1000;
}

int main()
{
    printf("starting at %d\n", currentTimeMillis());
    VideoCapture capture("http://10.44.99.11/mjpg/video.mjpg");
	VideoWriter vidwrite("videoOutput.wmv", CV_FOURCC('W', 'M', 'V', '1'), 5, Size(800,600));
    capture.set(CV_CAP_PROP_FRAME_WIDTH,640);
    capture.set(CV_CAP_PROP_FRAME_HEIGHT,480);
    if(!capture.isOpened()){
            cout << "Failed to connect to the camera." << endl;
    }
    Mat frame, blue, green, red, gray, edge, draw;
    vector<Mat> planes(3);
    planes[0] = blue;
    planes[1] = green;
    planes[2] = red;
    for (int framenum = 0; framenum < 60; ++framenum) {
		printf("start of frame %d at %d\n", framenum, currentTimeMillis());
		capture >> frame;
		if(frame.empty()){
					cout << "Failed to capture an image" << endl;
					return -1;
		}
		printf("frame captured at %d\n", currentTimeMillis());
		//cvtColor(frame, gray, CV_BGR2GRAY);
		split(frame, planes);
		blue = planes[0];
		green = planes[1];
		red = planes[2];
		printf("frame split into planes at %d\n", currentTimeMillis());
		blur(green, green, Size(3,3));
		Canny(green, edge, 100, 200, 3);
		printf("edge detection finished at %d\n", currentTimeMillis());
		//dilate(edge, edge, getStructuringElement(MORPH_RECT, Size(5,5), Point(3,3)));
		vector<vector<Point> > contours;
		vector<Vec4i> hierarchy;
		findContours(edge, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE);
		printf("contours found at %d\n", currentTimeMillis());
		vector<vector<Point> > polys(contours.size());
		for (int n = 0; n < contours.size(); ++n) {
			approxPolyDP(contours[n], polys[n], 4, true);
		}
		printf("polygons approximated at %d\n", currentTimeMillis());
		vector<vector<Point> > quads;
		for (int n = 0; n < polys.size(); ++n) {
			if (polys[n].size() == 4) {
				quads.push_back(polys[n]);
			}
		}
		printf("quads filtered at %d\n", currentTimeMillis());
		vector<vector<Point> > rects;
		for (int n = 0; n < quads.size(); ++n) {
			vector<Point> sides(4);
			for (int s = 0; s < 4; s++) {
				sides[s] = quads[n][s] - quads[n][(s+1) % 4];
				//printf("corner %d of quad %d is (%d, %d)\n", s, n, quads[n][s].x, quads[n][s].y);
				//printf("side %d of quad %d is (%d, %d)\n", s, n, sides[s].x, sides[s].y);
			}
			bool rectflag(true);
			for (int s = 0; s < 4; s++) {
				if (abs(sides[s].ddot(sides[(s+1)%4])/norm(sides[s])/norm(sides[(s+1)%4])) > 0.25) {
					rectflag = false;
					break;
				}
			}
			if (rectflag) {
				rects.push_back(quads[n]);
			}
		}
		printf("rectangles filtered at %d\n", currentTimeMillis());
		printf("%d rectangles found\n", rects.size());
		draw = frame.clone();
		Scalar contourcolor(0, 0, 255);
		drawContours(draw, contours, -1, contourcolor);
		Scalar polycolor(255, 0, 0);
		drawContours(draw, polys, -1, polycolor);
		Scalar quadcolor(0, 255, 255);
		drawContours(draw, quads, -1, quadcolor);
		Scalar rectcolor(0, 255, 0);
		drawContours(draw, rects, -1, rectcolor, 3);
		Scalar targetcolor(255, 255, 255);
		for (int n = 0; n < rects.size(); ++n) {
			Rect r1(rects[n][0], rects[n][1]), r2(rects[n][2], rects[n][3]);
			Rect bounds = r1 | r2;
			double ar = bounds.height / (double)bounds.width;
			printf("rectangle %d has aspect ratio %f\n", n, ar);
			if (ar > 0.12 & ar < 0.37) {
				printf("target found at (%d, %d)\n", bounds.x, bounds.y);
				drawContours(draw, rects, n, targetcolor, 2);
			}
		}
		printf("end of frame %d at %d\n", framenum, currentTimeMillis());
		vidwrite.write(draw);
		//imwrite("draw.png", draw);
    }
    printf("finished at %d\n", currentTimeMillis());
    //imwrite("edge.png", edge);
    //imwrite("gray.png", gray);
    //imwrite("red.png", red);
    //imwrite("blue.png", blue);
    //imwrite("green.png", green);
    //imwrite("capture.png", frame);
    return 0;
}
