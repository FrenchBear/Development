#include <graph.h>

main()
{
  int i;

  _setvideomode(_MRES16COLOR);
  _setviewport(0,0,200,200);
  _clearscreen(_GCLEARSCREEN);

  for (i=0 ; i<16 ; i++)
  {
    /* _setcolor(i); */
    _ellipse(_GBORDER,10+i,10+i,30+10*i,30+10*i);
  }

  return 0;
}
