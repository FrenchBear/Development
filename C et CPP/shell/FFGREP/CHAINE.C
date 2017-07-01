
/*  CHAINE.C	1.20 P.Violent
**
**
**  Routines:
**  ---------
**  instring	Teste la pr‚sence d'un caractŠre dans une chaŒne
**  maj 	Conversion -> majuscules
**  majAZ	Conversion -> majuscules non accentu‚es
**  minaz	Conversion -> minuscules non accentu‚es
**  iValid	Validation d'un caractŠre par rapport … un modŠle
*/

#define UC unsigned char


/* instring	Rend vrai ou faux selon que le caractŠre est dans la chaŒne
**		ch ou pas. (En fait, renvoie le premier trouv‚, entre le
**		caractŠre et la fin de chaŒne)
*/

int instring(ch,car)
UC car;
UC *ch;
{
  while(*ch && *ch!=car) ch++;
  return *ch;
}

/*============================================================================*/

/* maj		Convertit un caractŠre en majuscule (si c'est possible) en
**		conservant le plus possible les accents. Ainsi, le caractŠre
**		‚ est converti en , alors que ˆ, Š, ‰ et e sont convertis
**		en E.
**		Si la conversion n'est pas possible, le caractŠre est rendu
**		tel quel. (ex: '$')
*/

static UC tabmaj[72]=
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~\177€šAA€EEEIII’’O™OUUY™š›œFAIOU¥¥";

int maj(c)
int c;
{
  if (c<0) c+=256;
  return (c>='a' && c<='¥')?(int)tabmaj[c-'a']:c;

} /* maj */

/*============================================================================*/

/* majAZ	Convertit un caractŠre en majuscule (si c'est possible) entre
**		A et Z, c'est … dire non accentu‚e.  Ainsi, toutes les lettres
**		suivantes sont converties en 'E':  e ‚ ˆ ‰ Š 
**		Si la conversion n'est pas possible, le caractŠre est rendu
**		tel quel. (ex: '$')
*/

static UC tabmajAZ[72]=
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~\177CUEAAAACEEEIIIAAE’‘OOOUUYOU›œŸAIOUNN";

int majAZ(c)
int c;
{
  if (c<0) c+=256;
  return (c>='a' && c<=(UC)'¥')?(int)tabmajAZ[c-'a']:c;

} /* majAZ */

/*============================================================================*/

/* minaz	Convertit un caractŠre en minuscule (si c'est possible) entre
**		a et z, c'est … dire non accentu‚e.  Ainsi, toutes les lettres
**		suivantes sont converties en 'e':  E ‚ ˆ ‰ Š 
**		Si la conversion n'est pas possible, le caractŠre est rendu
**		tel quel. (ex: '$')
*/

static UC tabminaz[38]=
  "cueaaaaceeeiiiaae’‘ooouuyou›œŸaiounn";

int minaz(c)
int c;
{
  if (c<0) c+=256;
  if (c>='A' && c<='Z') return c+32;
  return (c>='€' && c<='¥')?(int)tabminaz[c-'€']:c;

} /* minaz */

/*============================================================================*/

/* iValid	Cette fonction v‚rifie si un caractŠre correspond bien … un
**		modŠle donn‚, et fait ‚ventuellement une conversion.
**
**	ParamŠtres:
**	-----------
**	modele: Un char* sur une chaŒne de caractŠres. D‚crit plus loin.
**	c:	Le caractŠre … tester
**	ptrok:	Un int*, remplit la zone point‚e avec vrai si le caractŠre
**		correspond au modŠle (ou si il a pu ˆtre converti), faux
**		sinon.
**
**	Retour:
**	-------
**	Le caractŠre, ‚ventuellement converti. Si *ptrok est … faux, le
**	caractŠre c est retourn‚ tel quel.
**
*/

int iValid(modele,c,ptrok)
int c;
int *ptrok;
char *modele;
{
  register int  d,t;

  if (c<0) c+=256;

       if (c>='A' && c<='Z') d='A';
  else if (c>='a' && c<='z') d='a';
  else if (c>='€' && c<='¥') d='…';
  else if (c>='0' && c<='9') d='1';
  else d=c;

  if (*ptrok = instring(modele,(char)c)|instring(modele,(char)d)|instring(modele,'X'))
    return c;

  t=0;
  if (instring(modele,'A')) t+=1;
  if (instring(modele,'a')) t+=2;
  if (instring(modele,'…')) t+=4;

  switch (t)
  {
    case 1: c=(char)majAZ(c);
	    *ptrok=((c>='A')&(c<='Z'));
	    break;
    case 2: c=(char)minaz(c);
	    *ptrok=((c>='a')&(c<='z'));
	    break;
    case 3: if (c>='€') { c=(char)minaz(c);
			  *ptrok=((c>='a')&(c<='z'));
			}
	    break;
    case 4:
    case 6: if (c<='Z') { c=(char)minaz(c);
			  *ptrok=((c>='a')&(c<='z'));
			} /* Pas de break */
    case 5:
    case 7: *ptrok |= (d=='a');
  }

  return c;

} /* valid */
