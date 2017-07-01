// dfree.cpp
// Affiche la capacité des disques et la taille libre restante
// PV mai 93
// 05/02/94 2.0 version C++; calculs en entier uniquement
// 20/02/94 2.1 Total
// 07/03/95 2.2 Liste d'unités; fin de l'option 1

#include <iostream.h>
#include <iomanip.h>    // setw
#include <string.h>
#include <dos.h>
#include <ctype.h>

int    nDisk;           // Nb total d'unités
long   dat, dft;        // DiskAvailable total, DiskFree total


void Identification()
{
  cout << "DFREE 2.2\n"
	   << "Affichage du taux d'occupation des disques durs.\n\n";
}

inline void Usage()
{
  cout << "Usage: DFREE [/?] [d:]...\n"
	   << "Une liste d'unit‚s peut ˆtre pr‚cis‚e\n";
}

inline void Info()
{
  cout << "Fichier:          " << __FILE__  << '\n'
	   << "Date compilation: " << __DATE__ << ' ' << __TIME__ << '\n'
	   << "Date fichier:     " << __TIMESTAMP__ << '\n'
	   << "Compilateur:      " << _MSC_VER << '\n'
	   << "Copyright:        " << "(c) 1994,1995 P.VIOLENT";

}


void Sortie(long df, long da)
{
  long   unite;
  const long KILO = 1024L;
  const long MEGA = KILO*KILO;
  
  
  unite = (df>=MEGA) ? MEGA : KILO;
  cout << setw(10) << df/unite << '.' 
	   << (10*(df%unite))/unite << (unite==MEGA ? 'M' : 'K');

  unite = (da>=MEGA) ? MEGA : KILO;
  cout << setw(7) << da/unite << '.' 
	   << (10*(da%unite))/unite << (unite==MEGA ? 'M' : 'K');
					 
  long libre = 10005-df/(da/10000);                                   
  cout << setw(9) << libre/100 << '.' << (libre%100)/10 << "%\n";

}


void TraiteUnite(int iUnite)
{
  struct diskfree_t di;
  struct find_t     fb;
  long   da,df;
  char   szPath[6], szName[13];
  
  unsigned s = _dos_getdiskfree(iUnite, &di);
  if (s) return;
	
  nDisk++;

  szPath[0] = 'A'+iUnite-1;
  strcpy(szPath+1, ":*.*");
  s = _dos_findfirst(szPath, _A_VOLID, &fb);
  if (s==0)
  { strcpy(szName, fb.name);
	if (strlen(szName)>8) strcpy(szName+8,fb.name+9);
  }
  else
	szName[0] = 0;
	
  cout  << "  " << char('A'+iUnite-1) << ":  "
		<< setw(11) << setiosflags(ios::left) << szName
		<< resetiosflags(ios::left);

  da = (long)di.total_clusters*(long)di.sectors_per_cluster*(long)di.bytes_per_sector;
  df = (long)di.avail_clusters*(long)di.sectors_per_cluster*(long)di.bytes_per_sector*1L;
	
  Sortie(df, da);
  dft += df;
  dat += da;
}


void main(int argc, char **argv)
{
  int    i;

  if (argc>1)
  {
	if (strcmp(argv[1], "/??")==0)
	{ 
	  Identification();
	  Info();
	  return;
	}        

	if (strncmp(argv[1], "/?", 2)==0)
	{ 
	  Identification();
	  Usage();
	  return;
	}        
  }

  cout << "Unit‚ Nom du volume  Disponible   Total    Occupation\n";
  cout << "ÄÄÄÄÄ ÄÄÄÄÄÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄÄÄ ÄÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄÄÄ\n";
  
  dat = dft = 0;  
  nDisk = 0;
  
  if (argc>1)
  {
	for (i=1 ; i<argc ; i++)
	{
	  int u = toupper(argv[i][0]);
	  if (u>='A' && u<='Z') u -= 'A';
	  TraiteUnite(u+1);
	}
  }
  else
	for (i=3 ; i<9 ; i++)
	  TraiteUnite(i);
	  
		
  if (nDisk>1)
  { cout << "      TOTAL:     ";
	Sortie(dft, dat);
  }
  
  cout << '\n';
}
