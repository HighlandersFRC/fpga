/*
 * DefaultThreadManger.cpp
 *
 *  Created on: Sep 21, 2012
 *      Author: Mitchell Wills
 */

#include "networktables2/thread/DefaultThreadManager.h"
#include <stdio.h>
#include <stdint.h>


PeriodicNTThread::PeriodicNTThread(PeriodicRunnable* _r, const char* _name) :
#ifdef _WRS_KERNEL
			name(_name), thread(new Task(name, (FUNCPTR)PeriodicNTThread::taskMain)), r(_r), run(true){
#else
                        name(_name), r(_r), run(true){
#endif
	fprintf(stdout, "Starting task: %s\n", name);
	fflush(stdout);
#ifdef _WRS_KERNEL
	thread->Start((UINT32)this);
#else
        pthread_create(&thread,NULL,PeriodicNTThread::taskMain,(void*)this);
	pthread_setname_np(thread,name);
#endif
}

PeriodicNTThread::~PeriodicNTThread(){
	//TODO somehow do this async
	//delete thread;
}

#ifdef _WRS_KERNEL
int PeriodicNTThread::taskMain(void* o){//static wrapper
	return ((PeriodicNTThread*)o)->_taskMain();
#else
void* PeriodicNTThread::taskMain(void* o){//static wrapper
	return (void*)((intptr_t)((PeriodicNTThread*)o)->_taskMain());
#endif
}
int PeriodicNTThread::_taskMain(){
	try {
		while(run){
			r->run();
		}
	} catch (...) {
		fprintf(stdout, "Task exited with uncaught exception %s\n", name);
		fflush(stdout);
		return 1;
	}
	fprintf(stdout, "Task exited normally: %s\n", name);
	fflush(stdout);
	return 0;
}
void PeriodicNTThread::stop() {
	run = false;
#ifdef _WRS_KERNEL
	//TODO thread->Stop();
#else
	pthread_cancel(thread);
#endif
}
bool PeriodicNTThread::isRunning() {
#ifdef _WRS_KERNEL
	return thread->IsReady();
#else
	return run;
#endif
}

NTThread* DefaultThreadManager::newBlockingPeriodicThread(PeriodicRunnable* r, const char* name) {
	return new PeriodicNTThread(r, name);
}
