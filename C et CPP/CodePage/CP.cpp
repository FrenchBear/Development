// CP.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

int main(int argc, char* argv[])
{
  printf("Pages de code\n");
  printf("OEM CP: %d\n", GetOEMCP());
  printf("ANSI CP: %d\n", GetACP());
  printf("Thread locale: %d\n\n", GetThreadLocale());

  printf("SetThreadLocale(LOCALE_SYSTEM_DEFAULT)\n");
  SetThreadLocale(LOCALE_SYSTEM_DEFAULT);
  printf("Pages de code\n");
  printf("OEM CP: %d\n", GetOEMCP());
  printf("ANSI CP: %d\n", GetACP());
  printf("Thread locale: %d\n\n", GetThreadLocale());

  return 0;
}

