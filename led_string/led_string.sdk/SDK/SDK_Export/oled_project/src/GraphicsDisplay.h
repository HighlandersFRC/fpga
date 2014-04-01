/*
 * GraphicsDisplay.h
 *
 *  Created on: Jan 5, 2014
 *      Author: DGronlund
 */

#ifndef GRAPHICSDISPLAY_H_
#define GRAPHICSDISPLAY_H_

class GraphicsDisplay {
private:
	bool** pixels;
	int width;
	int height;
public:
	GraphicsDisplay(int, int);
	virtual ~GraphicsDisplay();
	void pixelSet(int, int, bool);
	void spi_flush();
};

#endif /* GRAPHICSDISPLAY_H_ */
