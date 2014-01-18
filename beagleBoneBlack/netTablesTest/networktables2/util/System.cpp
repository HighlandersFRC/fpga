/*
 * System.cpp
 *
 *  Created on: Sep 26, 2012
 *      Author: Mitchell Wills
 */

#include "networktables2/util/System.h"
#include <stdio.h>
#ifdef _WRS_KERNEL
#include "semLib.h"
#include <sysLib.h> // for sysClkRateGet
#include <usrLib.h> // for taskDelay
#else
#include <unistd.h>
#include <sys/time.h>
#include <time.h>
#endif

void sleep_ms(unsigned long ms){
#ifdef _WRS_KERNEL
	taskDelay((INT32)((double)sysClkRateGet() * ms / 1000));
#else
	usleep(ms*1000);
#endif
}
unsigned long currentTimeMillis(){
	struct timeval tv;
	gettimeofday(&tv, NULL);
	return tv.tv_sec*1000 + tv.tv_usec/1000;
        //FIXME: undefined reference
        //return 0;
}
void writeWarning(const char* message){
	fprintf(stderr, "%s\n", message);
	fflush(stderr);
	//TODO implement write warning with wpilib error stuff
}
