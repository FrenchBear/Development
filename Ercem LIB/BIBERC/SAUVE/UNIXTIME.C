/* unixtime.c
** convertit une date (jj/mm/aa) en date au format unix
** Nb: la date est 1 seconde du matin pour des pb d'arrondi !!!
** 
** ParamŠtres d'appel :
** jour entre 1 et 31
** mois entre 1 et 12
** ann‚e >100: consid‚r‚ comme l'ann‚e sur 4 chiffres
** ann‚e  0..20: 2000 … 2020
** ann‚e 21..99: 1921 … 1999
**
** Par convention, si j ou m, retour 0 (date NULLE)
**
** 29/12/92 PV	Enfin mis en bibliothŠque ! (traŒnait un peu partout...)
** 18/02/94 PV	Ann‚e sur 4 chiffres
*/

long unixtime(j,m,a)
int j,m,a;
{
  int i;
  long dj;
  static int tjm[]={31,28,31,30,31,30,31,31,30,31,30,31};

  if (j==0 && m==0) return 0;

  /* convention: 00..20: 2000 … 2020
  **		 21..99: 1921 … 1999
  */
  if (a<100)
    if (a<=20)
      a += 2000;
    else
      a += 1900;

  tjm[1]=(a%4)?28:29;
  dj = 365*(a-1970)+(a-1970+1)/4+j-1;
  for (i=0 ; i<m-1 ; i++)
    dj+=tjm[i];
  return dj*24*60*60+1; /* 1 sec aprŠs minuit */
}

