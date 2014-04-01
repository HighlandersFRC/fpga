/*
 * GraphicsDisplay.cpp
 *
 *  Created on: Jan 5, 2014
 *      Author: DGronlund
 */

#include "GraphicsDisplay.h"

GraphicsDisplay::GraphicsDisplay(int w, int h) {
	width = w;
	height = h;
	pixels = new bool*[height];
	for (int n = 0; n < height; ++n) {
		pixels[n] = new bool[width];
	}

}

GraphicsDisplay::~GraphicsDisplay() {
	for (int n = 0; n < height; ++n) {
		delete pixels[n];
	}
	delete pixels;
}

void GraphicsDisplay::pixelSet(int x, int y, bool state) {
	if (x > 0 && x < width) {
		if (y > 0 && y < height) {
			pixels[y][x] = state;
		}
	}
}

//void GraphicsDisplay::spi_flush
