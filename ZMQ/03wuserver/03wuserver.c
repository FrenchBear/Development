// 03wuserver.c - Weather Update Server
// 2016-06-22	PV

/*
#include <zmq.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#ifndef _WIN32
	#include <unistd.h>
#else
	#define sleep(n) Sleep(1000*n)
	#include <windows.h>
#endif
*/

#include "zhelpers.h"

int main(void)
{
	//  Prepare our context and publisher
	void *context = zmq_ctx_new();
	void *publisher = zmq_socket(context, ZMQ_PUB);
	int rc = zmq_bind(publisher, "tcp://*:5556");
	assert(rc == 0);

	//  Initialize random number generator
	srandom((unsigned)time(NULL));
	while (1) {
		//  Get values that will fool the boss
		int zipcode, temperature, relhumidity;
		zipcode = randof(100000);
		temperature = randof(215) - 80;
		relhumidity = randof(50) + 10;

		//  Send message to all subscribers
		char update[20];
		sprintf(update, "%05d %d %d", zipcode, temperature, relhumidity);
		s_send(publisher, update);
	}
	zmq_close(publisher);
	zmq_ctx_destroy(context);
	return 0;
}
