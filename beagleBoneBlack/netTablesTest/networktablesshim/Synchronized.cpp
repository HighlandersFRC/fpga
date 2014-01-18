#include "Synchronized.h"
#include <semaphore.h>

ReentrantSemaphore::ReentrantSemaphore() {
	pthread_mutexattr_init(&attrs);
	pthread_mutexattr_settype(&attrs,PTHREAD_MUTEX_RECURSIVE);
	pthread_mutex_init(&mutex,&attrs);
}

ReentrantSemaphore::~ReentrantSemaphore() {
	pthread_mutex_destroy(&mutex);
	pthread_mutexattr_destroy(&attrs);
}

void ReentrantSemaphore::take() {
	pthread_mutex_lock(&mutex);
}

void ReentrantSemaphore::give() {
	pthread_mutex_unlock(&mutex);
}

Synchronized::Synchronized(ReentrantSemaphore& _sem):sem(_sem) {
	sem.take();
}

Synchronized::~Synchronized() {
	sem.give();
}
