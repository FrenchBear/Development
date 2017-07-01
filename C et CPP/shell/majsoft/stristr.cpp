// stristr.c
// 30/09/1996 DJ
// Compare 2 chaines en ignorant les diffÇrences maj/min/accent


#include<stdio.h>
#include<biberc.h>
#include<clib.ref>


//#define TEST


char *stristr(const char *szLigne,const char *szATrouver)
{
	int i;		// Indice courant dans la chaåne parcourue
	int x;		// Indice courant dans la chaåne Ö trouver
	int t;		// Indice de sauvegarde dans la chaåne Ö parcourir
	int	iLLigne, iLATrouver;	// Longueur des chaånes

	// Garde-fou
	Assert(szLigne!=NULL);
	Assert(szATrouver!=NULL);

    iLLigne = strlen(szLigne);
	iLATrouver = strlen(szATrouver);

	for (i=0 ; i<=iLLigne-iLATrouver ; i++)
	{
		t = i;	// On mÇmorise la position courante

		x = 0;
		while(majAZ(szLigne[i])==majAZ(szATrouver[x]))
		{
			i++;x++;
			if (szATrouver[x]==0)	// Fin de szATrouver -> trouvÇ!
				return (char *)szLigne+i-x;
		}
		// On sort de la boucle: on n'a pas trouve ici
		i = t;

		// On passe Ö la position suivante
	}

	// On n'a pas trouvÇ du tout
	return(NULL);
}


#ifdef TEST

char szNomApp[] = "stristr";

void main(void)
{
	char *ret;

	ret=stristr("ÉAÑbÖ","ÑÖbA");

	printf("RÇsultat: '%s'.\n",ret);
}

#endif
