// dfree.cpp
// Affiche la capacité des disques et la taille libre restante
// PV mai 93
// 05/02/94 2.0 version C++; calculs en entier uniquement
// 20/02/94 2.1 Total
// 07/03/95 2.2 Liste d'unités; fin de l'option 1
// 30/11/97 3.0 Calculs en int64; gestion des volumes FAT32 de plus de 2Go

#include <windows.h>
#include <iostream.h>
#include <iomanip.h>     // setw
#include <string.h>
#include <stdio.h>		 // sprintf

int		nDisk;           // Nb total d'unités
__int64 dat, dft;        // DiskAvailable total, DiskFree total


void Identification()
{
  cout << "DFREE 3.0\n"
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
	   << "Copyright:        " << "(c) 1993-1997 P.VIOLENT";

}


// L'opérateur << des ostream ne sait pas gérer les __int64
ostream &operator <<(ostream &o, const __int64 &ll)
{
  char szBuffer[32];

  sprintf(szBuffer, "%I64d", ll);
  o << szBuffer;
  return o;
}


void Sortie(__int64 df, __int64 da)
{
  __int64   unite;
  const __int64 KILO = 1024L;
  const __int64 MEGA = KILO*KILO;
  
  unite = (da>=MEGA) ? MEGA : KILO;
  cout << setw(10) << da/unite << '.';
  cout << (10*(da%unite))/unite << (unite==MEGA ? 'M' : 'K');

  unite = (df>=MEGA) ? MEGA : KILO;
  cout << setw(10);
  cout << df/unite << '.';
  cout << (10*(df%unite))/unite << (unite==MEGA ? 'M' : 'K');

  __int64 libre = 10005-df/(da/10000);                                   
  cout << setw(9) << libre/100 << '.' << (libre%100)/10 << "%\n";

}


void TraiteUnite(int iUnite)
{
  char		szVolumeName[13];
  BOOL		bRet;
  char		szRootPathname[4];
  __int64	FreeBytesAvailableToCaller;
  __int64	TotalNumberOfBytes;
  __int64	TotalNumberOfFreeBytes;

  szRootPathname[0] = 'A'+iUnite-1;
  szRootPathname[1] = ':';
  szRootPathname[2] = '\\';
  szRootPathname[3] = 0;

  bRet = GetDiskFreeSpaceEx(szRootPathname, (union _ULARGE_INTEGER *)&FreeBytesAvailableToCaller, (union _ULARGE_INTEGER *)&TotalNumberOfBytes, (union _ULARGE_INTEGER *)&TotalNumberOfFreeBytes);
  if (!bRet) return;

  nDisk++;

  DWORD MaximumComponentLength;		// system's maximum filename length
  DWORD FileSystemFlags;
  char szFileSystemNameBuffer[31];

  bRet = GetVolumeInformation(szRootPathname, szVolumeName, sizeof(szVolumeName), NULL, &MaximumComponentLength, &FileSystemFlags, szFileSystemNameBuffer, sizeof(szFileSystemNameBuffer));
  
  cout  << "  " << char('A'+iUnite-1) << ":   "
	    << setw(8) << setiosflags(ios::left) << szFileSystemNameBuffer
		<< setw(11) << szVolumeName 
		<< resetiosflags(ios::left);

  Sortie(TotalNumberOfFreeBytes, TotalNumberOfBytes);
  dft += TotalNumberOfFreeBytes;
  dat += TotalNumberOfBytes;

/*
  long   da,df;
  da = (long)di.total_clusters*(long)di.sectors_per_cluster*(long)di.bytes_per_sector;
  df = (long)di.avail_clusters*(long)di.sectors_per_cluster*(long)di.bytes_per_sector*1L;
	
  Sortie(df, da);

  dft += df;
  dat += da;
*/
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

  cout << "Unit‚  Type    Nom du volume  Total       Disponible  Occupation\n";
  cout << "ÄÄÄÄÄ  ÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄÄÄ\n";
  
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
  { cout << "       TOTAL:             ";
	Sortie(dft, dat);
  }
  
  cout << '\n';
}
