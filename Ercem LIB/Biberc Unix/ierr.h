/* ierr.h Module de gestion des erreurs
**  7/11/94 FG
** Ce module contient la d‚finition du prototype de la fonction
** d'erreur de rappel iErr ansi qu'un appel simplifi‚ avec le
** nom du fichier et la num‚ro de ligne.
** Cette fonction est une variable globale et peut ˆtre appel‚e
** aprŠs chaque erreur dans un module.
** Elle doit retourner :
**	 0 pour continuer le programme normalement (return aprŠs erreur)
**	-1 pour que le programme signalant l'erreur tente une reprise
**	-2 pour ignorer le message et ne pas quitter la fonction o—
**	   se produit l'erreur

Pour red‚finir cette fonction d'erreur (si il y a une d‚finition
dans la bibliothŠque qui utilise cette m‚thode) il faut :

   1. D‚finir une fonction du type
int iXyz(char *szNomApp, char *szFichier, int iLigne, char *szMessage)
{
  printf("Erreur dans prog %s fichier %s ligne %d\n", szNomApp, szFichier, iLigne);
  if(szMessage!=NULL) printf("Message = %s\n",szMessage);
  return 0;
}
   2. Au d‚but du programme, affecter IERR = iXyz;
Si la fonction est d‚finie dans la bibliothŠque et si on ne veut
aucun traitement au moment de l'erreur, il suffit d'affecter IERR = NULL
*/

#ifndef _IERR_H
#define _IERR_H

/* Macro pour d‚finition du prototype de la fonction d'erreur de rappel */
#define IERR		fiErr
int (*IERR)();
#define DEFIERR		(int *IERR)(char *szNomApp, char *szFichier, int iLigne, char *szMessage, int iCode)

/* Macro d'appel de la fonction d'erreur */
#define FERR(szMsg, iCode)	IERR!=NULL?IERR(szNomApp, __FILE__, __LINE__, szMsg, iCode):0

#endif /* _IERR_H */
