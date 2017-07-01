// stristr.c
// 30/09/1996 DJ
// Compare 2 chaines en ignorant les diff�rences maj/min/accent


#include<stdio.h>
#include<biberc.h>
#include<clib.ref>


//#define TEST


char *stristr(const char *szLigne,const char *szATrouver)
{
	int i;		// Indice courant dans la cha�ne parcourue
	int x;		// Indice courant dans la cha�ne � trouver
	int t;		// Indice de sauvegarde dans la cha�ne � parcourir
	int	iLLigne, iLATrouver;	// Longueur des cha�nes

	// Garde-fou
	Assert(szLigne!=NULL);
	Assert(szATrouver!=NULL);

    iLLigne = strlen(szLigne);
	iLATrouver = strlen(szATrouver);

	for (i=0 ; i<=iLLigne-iLATrouver ; i++)
	{
		t = i;	// On m�morise la position courante

		x = 0;
		while(majAZ(szLigne[i])==majAZ(szATrouver[x]))
		{
			i++;x++;
			if (szATrouver[x]==0)	// Fin de szATrouver -> trouv�!
				return (char *)szLigne+i-x;
		}
		// On sort de la boucle: on n'a pas trouve ici
		i = t;

		// On passe � la position suivante
	}

	// On n'a pas trouv� du tout
	return(NULL);
}


#ifdef TEST

char szNomApp[] = "stristr";

void main(void)
{
	char *ret;

	ret=stristr("�A�b�","��bA");

	printf("R�sultat: '%s'.\n",ret);
}

#endif
