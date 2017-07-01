
#include <stdio.h>
#include <stdlib.h>

#include <io.h>

char char_hp[] = "±\
±±±±±±±±±±±±±±±±\
±±±±±±±±±±±±±±±±\
 AAEEEII'`^.~UUœ\
-  ø€‡¥¤­¨oœŸ›\
ƒˆ“–aeou…Šo—„‰”\
Œí’†¡í‘”š‹áO\
AAaDdiiOOOoSsUY˜\
pp    -¬«¦§®ş¯ñ ";

#define UC unsigned char
#define ESC 27


/* char filename[] = "../laser/tr240bpn.r8p"; */
char filename[] = "../apsylog/sgr12r.hrp";

int h;
UC  c;

void main(void);
UC   nextchar(void);
int  get2(void);
void stop(int);
char *getsz(int);
void dump_fdescr(void);
void dump_detccar(void);
void dump_car(void);
void print_bitmap(UC);


#define get1()	nextchar()


void main()
{
  printf("\nAnalyse de police HP t‚l‚chargeable\n");
  printf(  "-----------------------------------\n\n");
  h = open(filename,0);
  if (h<0)
  { printf("chec … l'ouverture de %s: %d\n",filename,errno);
    exit(1);
  }

  dump_fdescr();
  for (;;)
  { dump_detccar();
    dump_car();
  }

  close(h);
  exit(0);

} /* main */


void dump_car()
{
  int num;
  int i,j;
  int hc,lc;
  int nboh;

  if (nextchar()!=ESC) stop(21);
  if (nextchar()!='(') stop(22);
  if (nextchar()!='s') stop(23);

  num = 0;
  while (nextchar()>='0' && c<='9')
    num = num*10 + c-'0';
  if (c!='W') stop(24);

  printf("\nT‚l‚chargement de caractŠre\n");
  printf("  Nbre d'octets de la cmd:  %d (%c)\n",num,num<127?num:char_hp[num-127]);
  printf("  (4):                      %d\n",get1());
  printf("  (0):                      %d\n",get1());
  printf("  (14):                     %d\n",get1());
  printf("  (1):                      %d\n",get1());
  printf("  Orientation:              %d\n",get1());
  printf("  (0):                      %d\n",get1());
  printf("  D‚calage de gauche:       %d\n",get2());
  printf("  D‚calage du haut:         %d\n",get2());
  printf("  Largeur de caractŠre:     %d\n",lc=get2());
  printf("  Hauteur de caractŠre:     %d\n",hc=get2());
  printf("  Delta X:                  %d\n",get2());

  nboh = (lc+7)/8;
  for (i=0 ; i<hc ; i++)
  { for (j=0 ; j<nboh ; j++)
      print_bitmap(get1());
    printf("\n");
  }
  printf("\n");

} /* dump_car */


void print_bitmap(c)
unsigned char c;
{
  static tp2[] = {128, 64, 32, 16, 8, 4, 2, 1};
  int i;

  for (i=0 ; i<8 ; i++)
    printf((c&tp2[i])?"Û":"ù");
}


void dump_detccar()
{
  int num;

  if (nextchar()!=ESC) stop(11);
  if (nextchar()!='*') stop(12);
  if (nextchar()!='c') stop(13);

  num = 0;
  while (nextchar()>='0' && c<='9')
    num = num*10 + c-'0';
  if (c!='E') stop(14);

  printf("\nCommande de d‚termination du code de caractŠre\n");
  printf("  CaractŠre:                %d (%c)\n",num,num<127?num:char_hp[num-127]);

} /* dump_detccar */


void dump_fdescr()
{
  int num;
  int i,j,n;
  int szd;
  UC  *p;


  if (nextchar()!=ESC) stop(1);
  if (nextchar()!=')') stop(2);
  if (nextchar()!='s') stop(3);

  num = 0;
  while (nextchar()>='0' && c<='9')
    num = num*10 + c-'0';
  if (c!='W') stop(4);

  printf("Descripteur de fonte      #: %d\n\n",num);

  printf("  Taille du descripteur:    %d\n",szd=get2());
  printf("  (0):                      %d\n",get1());
  printf("  Type de fonte:            %d ",get1());
  printf("(%c bits)\n",c?'8':'7');
  printf("  (0 0):                    %d\n",get2());
  printf("  Pos. de la ligne de base: %d\n",get2());
  printf("  Largeur de la cellule:    %d\n",get2());
  printf("  Hauteur de la cellule:    %d\n",get2());
  printf("  Orientation:              %d ",get1());
  printf("(%s)\n",c?"landscape":"portrait");
  printf("  Fixe/proportionnelle:     %d ",get1());
  printf("(%s)\n",c?"proportionnelle":"fixe");
  printf("  Jeu de symboles:          %d ",i=get2());
  printf("(%d%c)\n",i/32,(i%32)+64);
  printf("  Interlettrage:            %d\n",get2());
  printf("  Hauteur:                  %d\n",get2());
  printf("  (0 0):                    %d\n",get2());
  printf("  (0):                      %d\n",get1());
  printf("  Style:                    %d ",get1());
  printf("(%s)\n",c?"italique":"droit");
  printf("  Face:                     %d\n",(char)get1());
  printf("  Oeil:                     %d\n",get1());
  printf("  (0)                       %d\n",get1());
  printf("  Style 'serif':            %d\n",get1());
  printf("  (0 0):                    %d\n",get2());
  printf("  Distance de soulignement: %d\n",get1());
  printf("  Hauteur de soulignement:  %d\n",get1());
  printf("  Largeur du texte:         %d\n",get2());
  printf("  Hauteur du texte:         %d\n",get2());
  printf("  1er caractŠre:            %d\n",get2());
  printf("  Dernier caractŠre:        %d\n",get2());
  printf("  Pitch extended:           %d\n",get1());
  printf("  Height extended:          %d\n",get1());
  printf("  (0 0):                    %d\n",get2());
  printf("  (0 0):                    %d\n",get2());
  printf("  (0 0):                    %d\n",get2());
  printf("  Nom de la police:         %s\n\n",getsz(16));
  printf("  Taille du rab:            %d\n",n=num-szd);

#define SZ_DUMPRAB 18
  p = getsz(n);
  for (i=0 ; i<n ; i+=SZ_DUMPRAB)
  { printf("    ");
    for (j=0 ; j<SZ_DUMPRAB ; j++)
      if (i+j>=n) printf("   ");
      else printf("%02x ",p[i+j]);
    printf("³ ");
    for (j=0 ; j<SZ_DUMPRAB ; j++)
      if (i+j<n) printf("%c",p[i+j]>=32?p[i+j]:'.');
    printf("\n");
  }
  printf("\n");

} /* dump_fdescr */


int get2()
{
  int i = nextchar();
  i = 256*i + nextchar();
  return i;

} /* get2 */


char *getsz(nb)
int nb;
{
  static char buffer[256];

  read(h,buffer,nb);
  buffer[nb] = 0;
  return buffer;

} /* getsz */


void stop(n)
int n;
{
  printf("Arrˆt pr‚matur‚, code: %d\n",n);
  exit(0);

} /* stop */


UC nextchar()
{
  UC buffer[1];

  read(h,buffer,1);
  c = *buffer;
  return c;

} /* nextchar */
