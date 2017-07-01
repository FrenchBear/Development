// cperr.cpp : Copie de fichier en ignorant les erreurs
// 20/08/01 PV

#include "stdafx.h"

#include <io.h>
#include <stdio.h>
#include <fcntl.h>

#include <sys/types.h>
#include <sys/stat.h>

#define BLOCKSIZE (1024*32*8)

int main(int argc, char* argv[])
{
	const char szNomficSce[] = "J:\\Star Trek TNG - 7x11 - Parallels.avi";
	const char szNomficDest[] = "G:\\ATrier\\Star Trek TNG - 7x11 - Parallels.avi";
	struct _stat statBuf;
	int iStatus;

	iStatus = _stat(szNomficSce, &statBuf);
	if (iStatus<0)
	{
		fprintf(stderr, "Echec au stat \'%s\'", szNomficSce);
		perror(NULL);
		return 1;
	}

	int s;
	s = _open(szNomficSce, _O_BINARY | _O_RDONLY | _O_SEQUENTIAL);
	if (s<0)
	{
		fprintf(stderr, "Echec au open source \'%s\'", szNomficSce);
		perror(NULL);
		return 1;
	}

	int d;
	d = _open(szNomficDest, _O_BINARY | _O_WRONLY | _O_SEQUENTIAL | O_CREAT, 0777);
	if (d<0)
	{
		fprintf(stderr, "Echec au open dest \'%s\'", szNomficDest);
		perror(" ");
		return 1;
	}


	int l = statBuf.st_size;
	char tbBuffer[BLOCKSIZE];
	int iBloc = 0, iErreur = 0;
	int lr; 
	int nbb=(l-1)/BLOCKSIZE+1;
	while (l>0)
	{
	    nbb--;
		iBloc++;
		lr = l>BLOCKSIZE ? BLOCKSIZE : l;
		iStatus = read(s, tbBuffer, lr);
		if (iStatus<0)
		{
		  iErreur++;
		  printf("*(%d)", nbb);
		}
		else
		{
		  printf(".");
		}
		fflush(stdout);
		write(d, tbBuffer, lr);
		l -= lr;
	}

	close(s);
	close(d);

	printf("%d blocs copiés\n", iBloc);
	printf("%d bloc(s) en erreur\n", iErreur);

	return 0;
}

