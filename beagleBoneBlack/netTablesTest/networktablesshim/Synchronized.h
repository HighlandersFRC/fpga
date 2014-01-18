#ifndef SYNCHRONIZED_H
#define SYNCHRONIZED_H

#include <pthread.h>

class ReentrantSemaphore {
public:
	ReentrantSemaphore();
	~ReentrantSemaphore();
	void take();
	void give();
private:
	pthread_mutexattr_t attrs;
	pthread_mutex_t mutex;
};

class Synchronized {
public:
	Synchronized(ReentrantSemaphore&);
	~Synchronized();
private:
	ReentrantSemaphore& sem;
};

#endif // SYNCHRONIZED_H
