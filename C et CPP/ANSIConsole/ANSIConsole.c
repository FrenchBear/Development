// ANSIConsole.c
// Support for Windows 10 ANSI/VT codes for console
//
// 2018-08-28	PV
// Note that this doesn't work, console mode is lost when this app terminates
// It seems it's per application
// ==> Do a CS version, easier to start a process

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include <string.h>
#include <ctype.h>

// Convenient helpers
#define false 0
#define true 1
#define print(s) fputs(s, stdout)

#include <Windows.h>

// Windows 10 supports ANSI color sequences if requested politely
// From https://docs.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences
// cmd: 0=reset, 1=set, -1=show status
int EnableVTMode(int cmd)
{
	// Set output mode to handle virtual terminal sequences
	HANDLE hOut = GetStdHandle(STD_OUTPUT_HANDLE);
	if (hOut == INVALID_HANDLE_VALUE)
		return false;

	DWORD dwMode = 0;
	if (!GetConsoleMode(hOut, &dwMode))
		return false;
	if (cmd < 0)
	{
		int on = (dwMode & ENABLE_VIRTUAL_TERMINAL_PROCESSING) == ENABLE_VIRTUAL_TERMINAL_PROCESSING;
		printf("Virtual Terminal Processing %s\n", on ? "On" : "Off");
		return true;
	}

	if (cmd == 1)
		dwMode |= ENABLE_VIRTUAL_TERMINAL_PROCESSING;
	else
		dwMode &= ~ENABLE_VIRTUAL_TERMINAL_PROCESSING;
	if (!SetConsoleMode(hOut, dwMode))
		return false;

	return true;
}

void Usage()
{
	print("Usage: ANSIConsole [on|off]\n"
		  "Turns support for ANSI codes on or off.  Without argument, shows current mode.\n");
}

int main(int argc, char **argv)
{
	if (argc > 2)
	{
		fprintf(stderr, "ANSIConsole: invalid argument, use option -h for help.\n");
		return 1;
	}

	// No argument, show current state
	if (argc == 1)
	{
		EnableVTMode(-1);
		return 0;
	}

	char *arg = argv[1];
	if (strcmp(arg, "?") == 0 || strcmp(arg, "-?") == 0 || _stricmp(arg, "-h") == 0)
	{
		Usage();
		return 1;
	}

	if (_stricmp(arg, "on") == 0)
	{
		EnableVTMode(1);
		return 0;
	}

	if (_stricmp(arg, "off") == 0)
	{
		EnableVTMode(1);
		return 0;
	}

	fprintf(stderr, "ANSIConsole: invalid argument, use option -h for help.\n");
	return 1;
}
