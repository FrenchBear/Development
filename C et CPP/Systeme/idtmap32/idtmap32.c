
#include <stdio.h>

typedef int BOOL;
typedef unsigned char BYTE;
typedef unsigned short WORD;
typedef unsigned long DWORD;

#define LOWORD(dw)     ((WORD)(dw))
#define HIWORD(dw)     ((WORD)((DWORD)(dw) >> 16))

#define P(flags)            ((flags) >> 7)
#define DPL(flags)          (((flags) >> 5) & 3)
#define TYPE(flags)         ((TYPES) ((flags) & 0x0f))

#define MAKELONG(hi, lo)    ((((DWORD) hi) << 16L) + (lo))

#define MK_FP(seg, ofs)     ((void *) (((unsigned long) (seg) << 16) | (ofs)))


#pragma pack(1)
typedef struct {
    WORD ofs_lo, sel;
    BYTE reserved, flags;
    WORD ofs_hi;
    } GATE;

typedef struct { WORD limit; DWORD base; } IDTR;
#pragma pack()

typedef enum { 
    UNDEFINED=0, AVAIL_286_TSS=1, LDT=2, BUSY_286_TSS=3, 
    CALLGATE_286=4, TASK_GATE=5, INTGATE_286=6, TRAPGATE_286=7,
    UNDEFINED2=8, AVAIL_386_TSS=9, UNDEFINED3=10, BUSY_386_TSS=11,
    CALLGATE=12, UNDEFINED4=13, INTERRUPT_GATE=14, TRAP_GATE=15,
    } TYPES;
    
char *type_names[] = { 
    "UNDEF0", "TSS16 ", "LDT   ", "BUSYT2",
    "CALL16", "TASK  ", "INT16 ", "TRAP16",
    "UNDEF2", "TSS   ", "UNDEF3", "BUSYT3",
    "CALL  ", "UNDEF4", "INTR  ", "TRAP  ",
    } ;

void sidt(IDTR *pidtr)
{
  _asm mov ebx, dword ptr [pidtr]
  _asm sidt fword ptr [ebx]
}

void show_gate(GATE *fpgate)
{
  DWORD ofs = MAKELONG(fpgate->ofs_hi, fpgate->ofs_lo);
  printf("%s ", type_names[TYPE(fpgate->flags)]);
    
  printf(" %04X:%08lX (%d)", fpgate->sel, ofs, DPL(fpgate->flags));
}



WORD dpmi_alloc_selector(void)
{
    _asm xor ax, ax
    _asm mov cx, 1
    _asm int 31h
    _asm jc error
    _asm jmp short ok
error:
    return 0;
ok:;
    // return value in AX
}

WORD dpmi_free_selector(WORD sel)
{
    _asm mov ax, 1
    _asm mov bx, sel
    _asm int 31h
    _asm jc error
    _asm jmp short ok
error:
    return sel; // act like the Window function
ok:
    return 0;
}

WORD dpmi_set_selector_base(WORD sel, DWORD base)
{
    _asm mov ax, 7
    _asm mov bx, sel
    _asm mov cx, word ptr base+2
    _asm mov dx, word ptr base
    _asm int 31h
    _asm jc error
    _asm jmp short ok
error:
    return sel;
ok:
    return 0;
}

WORD dpmi_set_selector_limit(WORD sel, DWORD limit)
{
    _asm mov ax, 8
    _asm mov bx, sel
    _asm mov cx, word ptr limit+2
    _asm mov dx, word ptr limit
    _asm int 31h
    _asm jc error
    _asm jmp short ok
error:
    return sel;
ok:
    return 0;
}


#define AllocSelector(x)        dpmi_alloc_selector()
#define FreeSelector(x)         dpmi_free_selector(x)
#define SetSelectorBase(x,y)    dpmi_set_selector_base((x), (y))
#define SetSelectorLimit(x,y)   dpmi_set_selector_limit((x), (y))

static DWORD base = 0;      // for data in other VMs

void *map_linear(DWORD lin_addr, DWORD num_bytes)
{
  WORD sel;
    
  /* allocate a selector similar to our current DS 
     (i.e., a data selector) */
  _asm mov sel, ds
  if ((sel = AllocSelector(sel)) == 0)
    return (void *) 0;
    
  /* set the base and limit of the new selector; variable "base"
     allows access to data in other VMs */
  SetSelectorBase(sel, base + lin_addr);
  SetSelectorLimit(sel, num_bytes - 1);   
    
  /* turn into a far pointer */
  return (void *)sel;
}

void free_mapped_linear(void *fp)
{
  FreeSelector((WORD)fp);
}




static IDTR pm_idtr;

int main()
{
  GATE *pm, *pm_idt;
  WORD size;
  int i;

  sidt(&pm_idtr);
  printf("PM IDT base=%08lX size=%04X\n", pm_idtr.base, pm_idtr.limit + 1);

/*
  pm_idt = (GATE *) map_linear(pm_idtr.base, pm_idtr.limit + 1);
  size = (pm_idtr.limit + 1) / 8;

  for (i=0, pm=pm_idt; i<size; i++, pm++)
  {
	printf("%04X\t", i);
	show_gate(pm);  printf("\n");
  }

  free_mapped_linear(pm_idt);
*/

  return 0;
}


#ifdef TOTO
/* 
IDTMAP.C
bcc doesn't like FWORD PTR in sidt(), so assemble:
bcc -c -2 -B -DDPMI_APP idtmap.c
bcc -2 -DDPMI_APP idtmap.obj dpmish.c prot.c ctrl_c.asm

Can run with VXDNAME: idtmap | vxdname
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <dos.h>
//#include "prot.h"
//#include "dpmish.h"

#define LOWORD(dw)     ((WORD)(dw))
#define HIWORD(dw)     ((WORD)((DWORD)(dw) >> 16))



#define P(flags)            ((flags) >> 7)
#define DPL(flags)          (((flags) >> 5) & 3)
#define TYPE(flags)         ((TYPES) ((flags) & 0x0f))

#define MAKELONG(hi, lo)    ((((DWORD) hi) << 16L) + (lo))

static IDTR v86_idtr;
static IDTR pm_idtr;

void sidt(IDTR *pidtr)
{
    _asm les bx, pidtr
    _asm sidt fword ptr es:[ebx]
}

#define PUT(s)                { fputs(s, stderr); fputs("\n", stderr); }

void fail(const char *s, ...) { PUT(s); _dos_exit(1); }

int real_main(int argc, char *argv[])   
{
    PUT("IDTMAP -- Display Interrupt Descriptor Table");
    PUT("From \"Unauthorized Windows\" (IDG Books, 1994)");
    PUT("Copyright (c) 1994 Andrew Schulman.  All rights reserved.\n");

    sidt(&v86_idtr);
	if (argc < 2)
		printf("V86 IDT base=%08lX size=%04X\n",
			v86_idtr.base, v86_idtr.limit + 1);
    return 0;
}

WORD get_pm_cb_seg(void)	// get protected-mode callback segment
{
	static WORD pm_cb_seg = 0;
	static int is_win = -1;
	if (is_win == -1)		// one-time initialization
	{
		WORD rax;
		_asm mov ax, 1600h
		_asm int 2fh
		_asm mov word ptr rax, ax
		is_win = ((rax != 0) && (rax != 0x80));
	}
	if (! is_win)
		return 0;
	if (! pm_cb_seg)		// one-time initialization
	{
		_asm push di
		_asm mov ax, 1684h		// get VxD PM API
		_asm mov bx, 5			// for any VxD that has one
		_asm int 2fh
		_asm mov word ptr pm_cb_seg, es
		_asm pop di
	}
	return pm_cb_seg;
}


int pmode_main(int argc, char *argv[])  
{
    GATE *v86_idt, *pm_idt;
    GATE *v86, *pm;
    WORD i, v86_size, pm_size, size;
    
    sidt(&pm_idtr);
	if (argc < 2)
		printf("PM IDT base=%08lX size=%04X\n",
			pm_idtr.base, pm_idtr.limit + 1);
    
    v86_idt = (GATE *) map_linear(v86_idtr.base, v86_idtr.limit + 1);
    v86_size = (v86_idtr.limit + 1) / 8;
    pm_idt = (GATE far *) map_linear(pm_idtr.base,
        pm_idtr.limit + 1);
    pm_size = (pm_idtr.limit + 1) / 8;
//    #define min(x, y)   ((x) < (y) ? (x) : (y))
    size = min(v86_size, pm_size);

    printf("Intno\tV86\t\t\t\tPM\n");

	if (argc < 2)
	{
		for (i=0, pm=pm_idt, v86=v86_idt; i<size; i++, pm++, v86++)
		{
			printf("%04X\t", i);
			if (memcmp(v86, pm, 8) == 0)
			{
				show_gate(v86); printf("\tsame\n");
			}
			else
			{
				show_gate(v86);	printf("\t");
				show_gate(pm);  printf("\n");
			}
		}
		if (v86_size != pm_size)
			PUT("Whoops, only printed some entries!");
	}
	else
	{
		for (i=1; i<argc; i++)
		{
			int intno;
			sscanf(argv[i], "%04X", &intno);
			printf("%04X\t", intno);
			if ((intno >= v86_size) || (intno >= pm_size))
				fail("Interrupt number too high");
			v86 = &v86_idt[intno];
			pm = &pm_idt[intno];
			if (memcmp(v86, pm, 8) == 0)
			{
				show_gate(v86); printf("\tsame\n");
			}
			else
			{
				show_gate(v86);	printf("\t");
				show_gate(pm);	printf("\n");
			}
		}
	}
        
    free_mapped_linear(pm_idt);
    free_mapped_linear(v86_idt);
    return 0;
}

#endif
