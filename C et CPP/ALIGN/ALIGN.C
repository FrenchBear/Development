
struct
{ char c1;
  char c2;
  char c3;
  char c4;
} st1;

struct
{ char c1;
  char s1[2];
  char s2[9];
  char c2;
} st2;

struct
{ char c1;
  short h1;
  short h2;
  char c2;
} st3;

struct
{ char c1;
  long l1;
  long l2;
  char c2;
} st4;

struct
{ short h1;
  long  l1;
  short h2;
  long  l2;
} st5;


void draws(char *,int,char *,int,long,char *,int,long,char *,int,long,char *,int,long);


void draws(noms,size,nom1,l1,a1,nom2,l2,a2,nom3,l3,a3,nom4,l4,a4)
char *noms;
int size;
char *nom1,*nom2,*nom3,*nom4;
int l1,l2,l3,l4;
long a1,a2,a3,a4;
{
  long i;

  printf("%s:  ",noms);

  printf("|%s",nom1);
  for (i=1 ; i<l1 ; i++) printf(".  ");
  printf("|");
  for (i=0 ; i<a2-a1-l1 ; i++) printf("xx|");

  printf("%s",nom2);
  for (i=1 ; i<l2 ; i++) printf(".  ");
  printf("|");
  for (i=0 ; i<a3-a2-l2 ; i++) printf("xx|");

  printf("%s",nom3);
  for (i=1 ; i<l3 ; i++) printf(".  ");
  printf("|");
  for (i=0 ; i<a4-a3-l3 ; i++) printf("xx|");

  printf("%s",nom4);
  for (i=1 ; i<l4 ; i++) printf(".  ");
  printf("|");

  for (i=0 ; i<size-l4-(a4-a1) ; i++) printf("$$|");

  printf("\n");

} /* draws */


void main()
{

  draws("st1",sizeof(st1),"c1",1,(long)&st1.c1,"c2",1,(long)&st1.c2,"c3",1,(long)&st1.c3,"c4",1,(long)&st1.c4);
  draws("st2",sizeof(st2),"c1",1,(long)&st2.c1,"s1",2,(long)st2.s1,"s2",9,(long)st2.s2,"c2",1,(long)&st2.c2);
  draws("st3",sizeof(st3),"c1",1,(long)&st3.c1,"h1",2,(long)&st3.h1,"h2",2,(long)&st3.h2,"c2",1,(long)&st3.c2);
  draws("st4",sizeof(st4),"c1",1,(long)&st4.c1,"l1",4,(long)&st4.l1,"l2",4,(long)&st4.l2,"c2",1,(long)&st4.c2);
  draws("st5",sizeof(st5),"h1",2,(long)&st5.h1,"l1",4,(long)&st5.l1,"h2",2,(long)&st5.h2,"l2",4,(long)&st5.l2);

  exit(0);
}

