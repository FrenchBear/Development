// info32.c
// manipulations en mode 32 bits...
// 6/6/95 PV

#include <stdio.h>
#include <time.h>

typedef int BOOL;
typedef unsigned char BYTE;
typedef unsigned short WORD;
typedef unsigned long DWORD;

#pragma pack(1)
typedef struct
{ WORD limit; 
  DWORD base;
} IDTR;
#pragma pack()

void sidt(IDTR *pidtr)
{
  _asm mov ebx, dword ptr [pidtr]
  _asm sidt fword ptr [ebx]
}

int iopl()
{
	_asm pushf
	_asm pop ax
	_asm shr ax, 12
	_asm and ax, 3
}

int pe(void)    // is processor Protect Enable bit set?
{
  _asm smsw ax			/* Store Machine Status Word: low CR0 */
  _asm and ax, 1
  // retval in AX
}



static IDTR pm_idtr;

int main()
{
  time_t t1, t2;
  int i;
  #define ITER	1000000

  sidt(&pm_idtr);
  printf("PM IDT base=%08lX size=%04X\n", pm_idtr.base, pm_idtr.limit + 1);

  printf("IOPL=%d\n", iopl());
 
  printf("PE (protect enable) bit %s\n", (pe() & 1) ? "SET" : "NOT set");

  printf("analyse...\n");
  time(&t1); 
  for (i=0; i<ITER; i++)
  {
	_asm cli

	// section critique

	_asm sti
  }
  time(&t2);
  printf("%d CLI/STI in %lu seconds\n", ITER, t2-t1);
	
  return 0;
}
