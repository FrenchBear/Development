
#include <io.h>

extern int errno;

long start = 0x75;
char filename[] = "hv300bpp.pfm";

char char_hp[] = "盶
北北北北北北北北\
北北北北北北北北\
 AAEEEII'`^.~UU淺
-  鴢嚗き╫湞煕\
儓摉aeou厞o梽墧乗
弻頀啞響帊敋悑酧\
AAaDdiiOOOoSsUY榎
pp    -Η ";

main()
{
  int h;
  int size;
  int i;

  h = open(filename,0);
  if (h<0)
  { printf("恈hec � l'ouverture de %s: %d\n",filename,errno);
    exit(1);
  }
  lseek(h,start,0);
  for (i=32 ; i<=255 ; i++)
  { do
    { read(h,&size,2);
    } while (size==0);
    printf("%c: %4d�",i>=127?char_hp[i-127]:i,size);
  }
  close(h);

}
