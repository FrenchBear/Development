
#include <io.h>

extern int errno;

long start = 0x75;
char filename[] = "hv300bpp.pfm";

char char_hp[] = "±\
±±±±±±±±±±±±±±±±\
±±±±±±±±±±±±±±±±\
 AAEEEII'`^.~UUœ\
-  ø€‡¥¤­¨oœŸ›\
ƒˆ“–aeou…Šo—„‰”\
Œí’†¡í‘”š‹áO\
AAaDdiiOOOoSsUY˜\
pp    -¬«¦§®ş¯ñ ";

main()
{
  int h;
  int size;
  int i;

  h = open(filename,0);
  if (h<0)
  { printf("chec … l'ouverture de %s: %d\n",filename,errno);
    exit(1);
  }
  lseek(h,start,0);
  for (i=32 ; i<=255 ; i++)
  { do
    { read(h,&size,2);
    } while (size==0);
    printf("%c: %4d³",i>=127?char_hp[i-127]:i,size);
  }
  close(h);

}
