
/* strings.c
** Affiche les cha�nes de caract�res contenues dans un fichier quelconque
** PV ao�t 92
*/

#include <stdio.h>
#include <io.h>
#include <fcntl.h>
#include <string.h>

typedef unsigned char uchar;

int iMode = 1;
uchar iNiveau = '2';
#define MINLG 5

#define BUFSIZE 30000
uchar szBuffer[BUFSIZE];
uchar szTmpBuf[MINLG];

uchar szCharset[2][257] = {
	"................................"
	" !\"#$%&'()*+,-./0123456789:;<=>?"
	"@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_"
	"`abcdefghijklmnopqrstuvwxyz{|}~"
	"��������������������������������"
	"��������������������������������"
	"��������������������������������"
	"��������������������������������",

	"................................"
	" !\"#$%&'()*+,-./0123456789:;<=>?"
	"@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_"
	"`abcdefghijklmnopqrstuvwxyz{|}~"
	"��,�,_���%S<O����`'\"\"�-_��s>o��Y"
	" �����\"c���-r_���3'��,1����_�"
	"AAAA����E�EEIIIID�OOOO�xOUUU�Y_�"
	"���a������������d����o��o����y_�"
};

uchar szClasse[2][257] = {
	"00000000000000000000000000000000"
	"22211122221122212222222222221112"
	"12222222222222222222222222211111"
	"12222222222222222222222222211110"
	"22222222222222111112212211111111"
	"11111100000000000000000000000000"
	"00000000000000000000000000000000"
	"00000000000000000000000000000000",

	"00000000000000000000000000000000"
	"22211122221122212222222222221112"
	"12222222222222222222222222211111"
	"12222222222222222222222222211110"
	"00000000000000000000000000000000"
	"00000000000000000000000000000000"
	"11111111111111111111111111111111"
	"22222212222222222222222122222212"
};

void Identification()
{
  puts("STRINGS 1.1\n"
       "Exraction des cha�nes imprimables d'un fichier binaire.\n");
}

__inline void Usage()
{
  puts("Usage: STRINGS [/?] nomfic...");
}

__inline void Info()
{
  puts("Fichier:          " __FILE__ "\n"
  	   "Date compilation: " __DATE__ " " __TIME__ "\n"
  	   "Date fichier:     " __TIMESTAMP__ "\n"
       "Copyright:        (c) 1994 P.VIOLENT");
}

__inline int isOk(uchar c)
{
  return szClasse[iMode][c]>=iNiveau;
}

void DoStrings(char *szNomFic, int iEditeNom)
{
  int h;
  int i, j, l, n;
  uchar c;

  if (iEditeNom && szNomFic!=NULL)
    printf("*** Fichier %s\n", szNomFic);

  if (szNomFic!=NULL)
    h = open(szNomFic, O_RDONLY|O_BINARY);
  else
    h = 0;
    
  if (h<0)
  { fprintf(stderr, "*** Echec � l'ouverture du fichier \"%s\": ", szNomFic);
    perror("");
    return;
  }

  n = 0;
  while((l=read(h, szBuffer, BUFSIZE))>0)
    for (i = 0 ; i<l ; i++)
    {
      if (isOk(c=szBuffer[i]))
      { n++;
	if (n>=MINLG)
	{ if (n==MINLG)
	    for (j=0 ; j<MINLG-1 ; j++)
	      putchar(szCharset[iMode][szTmpBuf[j]]);
	  putchar(szCharset[iMode][c]);
	}
	else
	  szTmpBuf[n-1] = c;
      }
      else if (n>0)
      {
	if (n>=MINLG) putchar('\n');
	n=0;
      }
    }

  if (n>=MINLG) putchar('\n');

  if (szNomFic!=NULL)
    close(h);

}

int main(int argc, char **argv)
{
  int i;

  if (argc>1)
  {
    if (strcmp(argv[1], "/??")==0)
    { 
      Identification();
      Info();
      return 0;
    }        

    if (strncmp(argv[1], "/?", 2)==0)
    { 
      Identification();
      Usage();
      return 0;
    }        
    
  }           
  
  if (argc<2)
    DoStrings(NULL, 0);
  else
    for (i=1 ; i<argc ; i++)
      DoStrings(argv[i], argc>2);
  return 0;
}
