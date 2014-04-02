/*
 * DefaultThreadManager.h
 *
 *  Created on: Sep 21, 2012
 *      Author: Mitchell Wills
 */

#ifndef DEFAULTTHREADMANAGER_H_
#define DEFAULTTHREADMANAGER_H_

class DefaultThreadManager;
class PeriodicNTThread;

#include "networktables2/thread/PeriodicRunnable.h"
#include "networktables2/thread/NTThreadManager.h"
#include "networktables2/thread/NTThread.h"
#ifdef _WRS_KERNEL
#include "Task.h"
#else
#include <pthread.h>
#endif




class DefaultThreadManager : public NTThreadManager{
	virtual NTThread* newBlockingPeriodicThread(PeriodicRunnable* r, const char* name);
};

class PeriodicNTThread : public NTThread {
private:
	const char* name;
#ifdef _WRS_KERNEL
	Task* thread;
#else
	pthread_t thread;
#endif
	PeriodicRunnable* r;
	bool run;
	int _taskMain();
#ifdef _WRS_KERNEL
	static int taskMain(void* o);
#else
	static void* taskMain(void* o);
#endif
public:
	PeriodicNTThread(PeriodicRunnable* r, const char* name);
	virtual ~PeriodicNTThread();
	virtual void stop();
	virtual bool isRunning();
};


#endif /* DEFAULTTHREADMANAGER_H_ */
