#include <stdio.h>
#include <dos.h>

static union REGS regs;

int _curseskey()
{
  regs.h.ah = 0x00;
  int86(0x16, &regs, &regs);
  if (regs.h.al != 0)
    return (int)(regs.x.ax & 0x00ff);
  return (int)regs.x.ax;
} /* _curseskey */


int main()
{
  for(;;)
  {
    int c = _curseskey();
    if (c==32) break;
    printf("%04x\n", c);
  }
  return 0;
}