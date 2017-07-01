// CloseDos.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <stdio.h>

int main(int argc, char* argv[])
{
	HWND w;

	w = FindWindow(NULL, "Invite de commandes");
	printf("%x\n", w);

	getchar();
	return 0;
}
