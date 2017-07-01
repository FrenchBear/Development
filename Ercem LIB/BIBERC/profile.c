/* Gestion de fichiers profile (.ini) … section
** Bas‚es sur le SDK Windows et du code Wine
**
** Principe
** Lors du premier accŠs, le profile est lu en m‚moire o— il r‚side.
** La date/heure de derniŠre modification et sa taille sont m‚moris‚es.
** A chaque accŠs ult‚rieur, ces deux paramŠtres sont contr“l‚s et si
** le fichier a ‚t‚ modifi‚, alors il est relu.
** Le fichier est r‚‚crit lors de chaque appel … WritePrivateProfileString
** qui a pour effet de modifier r‚ellement le fichier.
**
** Il n'y a pas de diff‚rence entre majuscules et minuscules pour
** les noms de sections et de cl‚s.
** Taille maximum d'un nom de section, de cl‚ et de valeur: 1K (cste STRSIZE)
** Les profiles sont stock‚s par d‚faut dans /ercem/conf sous Unix
** et C:\ERCEM\CONF sous Dos, mais si le nom du profile contient / ou \
** (ex: c:\machin\bidule.ini ./MyApp.ini), il est consid‚r‚ comme
** un chemin direct.
**
** Enum‚rations de cl‚s:  KeyName==NULL dans GetPrivateProfileString
** Enum‚rations de sections:  AppName==NULL dans GetPrivateProfileString
** La liste est retourn‚e dans le buffer de r‚sultats, les valeurs sont
** s‚par‚es par \0 et la liste se termine par \0\0
**
** 24/05/95 PV
** 28/05/95 PV	Verrouillage de l'accŠs au profile par locking()
**/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#if defined(DOS) || defined(WIN32)
#include <io.h>    // locking
#endif
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/locking.h>

#include "biberc.h"
#include "import.h"

#define STRSIZE 1024
#define overflow (next==&CharBuffer[STRSIZE-1])

// Etats de l'automate … ‚tat de lecture du .ini
static enum { FirstBrace, CommentTete, OnSecHeader, IgnoreToEOL, KeyDef, KeyValue, Comment };

typedef struct TKeys
{
  char			*KeyName;		// Nom de la cl‚, ou NULL si la ligne complŠte est un commentaire
  char			*Value;			// Valeur de la cl‚, toujours en string 0
  char			*Comment;		// Commentaire ‚ventuel, point-virgule compris. Les espaces pr‚c‚dents font partie de la valeur de la cl‚
  struct TKeys	*link;			// Cl‚ suivante dans le mˆme section
} TKeys;

typedef struct TSecHeader
{
  char			*AppName;		// Nom de la section, ou NULL pour une section fictive pour stocker les commentaires en tˆte du profile
  TKeys			*Keys;			// PremiŠre cl‚ de la section
  struct TSecHeader *link;		// Section suivante dans le mˆme profile
} TSecHeader;
    
typedef struct TProfile
{
  char			*szFullPath;	// Chemin du fichier sur disque
  TSecHeader	*Section;		// 1Šre section du profile
  struct TProfile *link;		// Profile suivant dans la liste charg‚e en m‚moire
  long			lSize;			// Taille du fichier disque
  time_t		tDateMAJ;		// Date+Heure de derniŠre modification du fichier disque
} TProfile;

static TProfile *Current = 0;
static TProfile *Base = 0;

#ifdef UNIX
#define __inline
#endif

static __inline int imin(int a, int b)
{
  if (a<b)
    return a;
  else
    return b;
}

//==============================================================================
// Ecriture des profiles

static void dump_keys(FILE *profile, TKeys *p)
{
  if (!p)
	return;
  dump_keys(profile, p->link);
  if (p->KeyName!=NULL)
    fprintf(profile, "%s=%s", p->KeyName, p->Value);
  if (p->Comment!=NULL)
    fprintf(profile, "%s", p->Comment);
  fputc('\n', profile);
}

static void dump_sections(FILE *profile, TSecHeader *p)
{
  if (!p)
	return;
  dump_sections(profile, p->link);
  if (p->AppName!=NULL)
  {
    if (p->link!=NULL && p->link->AppName!=NULL)
      fputc('\n', profile);
    fprintf(profile, "[%s]\n", p->AppName);
  }
  dump_keys(profile, p->Keys);
}

static void dump_profile(TProfile *p)
{
  FILE *profile;
  struct stat sb;
    
  if ((profile = fopen(p->szFullPath, "w")) != NULL)
  {
  	int i = locking(fileno(profile), LK_LOCK, 1);
	Assert(i>=0);

	dump_sections(profile, p->Section);

	// On enlŠve le verrou
	rewind(profile);
	locking(fileno(profile), LK_UNLCK, 1);

	fclose(profile);

    if (stat(p->szFullPath, &sb)>=0)
    {
      p->lSize = sb.st_size;
      p->tDateMAJ = sb.st_mtime;
    }
  }
}

//==============================================================================
// Parcourt la liste des profiles lus en m‚moire
// Retourne un pointeur sur le profile, ou NULL

static TProfile *isProfileLoaded(char *szFullPath)
{
  TProfile *p = Base;
    
  while (p)
  {
	if (!stricmp(szFullPath, p->szFullPath))
	{
	  Current = p;
	  return p;
	}
    p = p->link;
  }
  return NULL;
}

// Charge un profile en m‚moire

static TSecHeader *load(char *szFullPath, time_t *ptDateMAJ, long *plSize)
{
  FILE	*f;
  int	state;
  TSecHeader *SecHeader = 0;
  char CharBuffer [STRSIZE];
  char	*next, *file;
  char	c;
  int	i;
  struct stat sb;

  file = szFullPath;
  *ptDateMAJ = 0;
  *plSize = 0;

#ifdef _DEBUG
  fprintf(stderr,"Load %s\n", file);
#endif
  if ((f = fopen(file, "r"))==NULL)
	return NULL;

  // On pose un verrou
  i = locking(fileno(f), LK_LOCK, 1);

#ifdef _DEBUG
  fprintf(stderr,"Loading %s\n", file);
#endif

  // On r‚cupŠre la taille et la date de derniŠre modif
  i = fstat(fileno(f), &sb);
  Assert(i>=0);
  *plSize = sb.st_size;
  *ptDateMAJ = sb.st_mtime;

  state = FirstBrace;
  while (!feof(f))
  { 
    c = getc(f);
    
	if (c == '\r')		/* Ignore Carriage Return */
	  continue;
	
	switch (state)
	{
      case OnSecHeader:
	    if (c == ']' || overflow)
	    {
		  *next = '\0';
		  next = CharBuffer;
		  SecHeader->AppName = strdup(CharBuffer);
		  state = IgnoreToEOL;
#ifdef _DEBUG
		  fprintf(stderr,"%s: section %s\n", file, CharBuffer);
#endif
	    } 
	    else
		  *next++ = c;
	    break;

	  case IgnoreToEOL:
	    if (c == '\n')
	    {
		  state = KeyDef;
		  next = CharBuffer;
	    }
	    break;

	  case FirstBrace:
	  case KeyDef:
	    if (c == '[')
	    {
		  TSecHeader *temp;
		
		  temp = SecHeader;
		  SecHeader = (TSecHeader *) malloc(sizeof(TSecHeader));
		  SecHeader->link = temp;
		  SecHeader->Keys = 0;
		  state = OnSecHeader;
		  next = CharBuffer;
		  break;
	    }
	    
	    if (state == FirstBrace) /* Tout ce qui pr‚cŠde la 1Šre section est un commentaire */
	    {
		  TKeys *temp;
		  
	      if (SecHeader==NULL)
	      {
		    TSecHeader *tempS;
		
		    tempS = SecHeader;
		    SecHeader = (TSecHeader *) malloc(sizeof(TSecHeader));
		    SecHeader->link = tempS;
		    SecHeader->Keys = NULL;
		    SecHeader->AppName = NULL;
		  }
		  
		  temp = SecHeader->Keys;
		  SecHeader->Keys = (TKeys *) malloc(sizeof(TKeys));
		  SecHeader->Keys->link = temp;
		  SecHeader->Keys->KeyName = NULL;
		  SecHeader->Keys->Value = NULL;
		  SecHeader->Keys->Comment = NULL;
		  state = CommentTete;
		  next = CharBuffer;
		  *next++ = c;
		  if (c=='\n') goto fincomment;
		  break;
		}

	    if (c == '\t')
		  break;
	    
	    if (c == '\n' || c == ';' || overflow) /* Abort Definition */
		  next = CharBuffer;

	    if (c == ';')	// Commentaire sans cl‚
	    {
		  TKeys *temp;

		  temp = SecHeader->Keys;
		  SecHeader->Keys = (TKeys *) malloc(sizeof(TKeys));
		  SecHeader->Keys->link = temp;
		  SecHeader->Keys->KeyName = NULL;
		  SecHeader->Keys->Value = NULL;
		  SecHeader->Keys->Comment = NULL;
		  state = Comment;
		  *next++ = c;
		  break;
	    }
	    
	    if (c == '=' || overflow)
	    {
		  TKeys *temp;

		  temp = SecHeader->Keys;
		  while(next[-1]==' ')
		    next--;
		  *next = '\0';
		  SecHeader->Keys = (TKeys *) malloc(sizeof(TKeys));
		  SecHeader->Keys->link = temp;
		  SecHeader->Keys->KeyName = strdup(CharBuffer);
		  SecHeader->Keys->Comment = NULL;
		  state = KeyValue;
		  next = CharBuffer;
#ifdef _DEBUG
		  fprintf(stderr,"%s:   key %s\n", file, CharBuffer);
#endif
	    }
	    else
		  *next++ = c;
	    break;

	  case KeyValue:
	    if (overflow || c == '\n')
	    {
		  *next = '\0';
		  SecHeader->Keys->Value = strdup(CharBuffer);
		  state = c == '\n' ? KeyDef : IgnoreToEOL;
		  next = CharBuffer;
#ifdef _DEBUG
		  fprintf(stderr, "[%s] (%s)=%s\n", SecHeader->AppName,
			SecHeader->Keys->KeyName, SecHeader->Keys->Value);
#endif
	    }
	    else if (c==';')
	    {
		  *next = '\0';
		  SecHeader->Keys->Value = strdup(CharBuffer);
		  state = Comment;
		  next = CharBuffer;
		  *next++ = c;
	    }
	    else
		  *next++ = c;
	    break;

	  case Comment:
	  case CommentTete:
	  fincomment:
	    if (overflow || c == '\n')
	    {
		  *next = '\0';
		  SecHeader->Keys->Comment = strdup(CharBuffer);
		  if (state==Comment)
		    state = c=='\n' ? KeyDef : IgnoreToEOL;
		  else
		    state = FirstBrace;
		  next = CharBuffer;
#ifdef _DEBUG
		  fprintf(stderr, "[%s] (%s)=%s comment: %s\n", SecHeader->AppName,
			SecHeader->Keys->KeyName, SecHeader->Keys->Value, SecHeader->Keys->Comment);
#endif
	    }
	    else
		  *next++ = c;
	    break;
	    
	} /* switch */
	
  } /* while ((c = getc(f)) != EOF) */
  
  // On enlŠve le verrou
  rewind(f);
  locking(fileno(f), LK_UNLCK, 1);

  fclose(f);

  return SecHeader;
}

static void new_key(TSecHeader *section, char *KeyName, char *Value)
{
  TKeys *key;
	    
  key = (TKeys *) malloc(sizeof(TKeys));
  key->KeyName = strdup(KeyName);
  key->Value   = strdup(Value);
  key->Comment = NULL;
  key->link = section->Keys;
  section->Keys = key;
}


static void DetruitSection(TSecHeader *s)
{
  TKeys      *Key, *KeySuiv;
  
  Key = s->Keys;
  while (Key!=NULL)
  {
    KeySuiv = Key->link;
    if (Key->KeyName!=NULL)
      free(Key->KeyName);
    if (Key->Value!=NULL)
      free(Key->Value);
    if (Key->Comment!=NULL)
      free(Key->Comment);
    free(Key);
	Key  = KeySuiv;
  } 
}

// Elimine les structures de donn‚es d'un profile en m‚moire, mais pas la structure TProfile elle-mˆme
static void DetruitProfile(TProfile *p)
{
  TSecHeader *Section, *SectionSuiv;
  
  Section = p->Section;
  while (Section!=NULL)
  {
    SectionSuiv = Section->link;
    DetruitSection(Section);
    if (Section->AppName!=NULL)
      free(Section->AppName);
    free(Section);
    Section = SectionSuiv;
  }
}


static int GetSetProfile(int set, char *AppName, char *KeyName, char *Default, char *ReturnedString, size_t Size, char *szFileName)
{
  TProfile   *Profile;
  TSecHeader *section;
  TKeys      *key;
  char		 szFullPath[256];
  long		 lActualSize;			// Taille r‚elle du profile sur disque
  time_t	 tActualDateMAJ;		// Date r‚elle de derniŠre mofification du profile
  
  /* Supposedly Default should NEVER be NULL.  But sometimes it is.  */
  if (Default == NULL)
	Default = "";

  // Si le nom contient / ou \ il est suppos‚ absolu	
  if (strchr(szFileName, '/') || strchr(szFileName, '\\'))
	strcpy(szFullPath, szFileName);
  else
  {
#ifdef UNIX
	strcpy(szFullPath, "/ercem/conf/");
#else
	strcpy(szFullPath, "c:/ercem/conf/");
#endif
	strcat(szFullPath, szFileName);
  }

  if (Profile = isProfileLoaded(szFullPath))
  {
    struct stat sb;
	if (stat(szFullPath, &sb)==0)
	{ lActualSize = sb.st_size;
	  tActualDateMAJ = sb.st_mtime;
	}
	else
	{ lActualSize = 0;
	  tActualDateMAJ = 0;
	}
  }

  if (Profile==NULL || lActualSize!=Profile->lSize || tActualDateMAJ!=Profile->tDateMAJ)
  {
    if (Profile)
    {
      DetruitProfile(Profile);
#ifdef _DEBUG
	  fprintf(stderr,"GetSetProfile: Le fichier disque a chang‚, relecture de %s\n", szFullPath);
	  fprintf(stderr,"GetSetProfile: Origine (taille, date): %ld  %s", Profile->lSize, ctime(&Profile->tDateMAJ));
	  fprintf(stderr,"GetSetProfile: Actuel  (taille, date): %ld  %s", lActualSize, ctime(&tActualDateMAJ));
#endif
    }
    else
	  Profile = (TProfile *) malloc(sizeof(TProfile));
	Profile->link = Base;
	Profile->szFullPath = strdup(szFullPath);
	Profile->Section = load(szFullPath, &Profile->tDateMAJ, &Profile->lSize);
	Base = Profile;
	Current = Profile;
  }
  
  section = Profile->Section;
  
  // Sans valeur de section, on liste les sections
  if (!AppName)
  {
	char *p = ReturnedString;
	int left = Size-2;
	int slen;
	
	if (set)
	{
#ifdef _DEBUG
	  fprintf(stderr,"GetSetProfile // AppName==NULL interdit en ‚criture !\n");
#endif
	  return -1;
	}

#ifdef _DEBUG
	fprintf(stderr,"GetSetProfile // AppName==NULL, Enum‚ration des sections !\n");
#endif
    for (; section; section = section->link)
    {
      if (section->AppName==NULL)
        continue;
        
	  if (left<1)
	  {
#ifdef _DEBUG
		fprintf(stderr,"GetSetProfile // No more storage for enum !\n");
#endif
		return Size-2;
	  }
	  slen = imin(strlen(section->AppName)+1, left);
	  strncpy(p, section->AppName, slen);
#ifdef _DEBUG
	  fprintf(stderr,"GetSetProfile // enum section '%s' !\n", p);
#endif
	  left -= slen;
	  p += slen;
	}
	*p = '\0';
#ifdef _DEBUG
	fprintf(stderr,"GetSetProfile // normal end of enum section !\n");
#endif
	return Size-2-left;
  }
    
  // Recherche de la section
  for ( ; section ; section=section->link)
  {
    // On ignore la section virtuelle de commentaires de tˆte
    if (section->AppName==NULL)
      continue;
      
	// Si c'est pas la bonne on passe … la suivante !
	if (stricmp(section->AppName, AppName))
	  continue;

	// Si KeyName==NULL, on ‚numŠre les cl‚s
	if (!KeyName)
	{
	  char *p = ReturnedString;
	  int left = Size-2;
	  int slen;
	  
	   if (set)
	   {
#ifdef _DEBUG
		fprintf(stderr,"GetSetProfile // KeyName==NULL interdit en ‚criture !\n");
#endif
	     return -1;
	   }

#ifdef _DEBUG
	  fprintf(stderr,"GetSetProfile // KeyName == NULL, Enum‚ration des cl‚s !\n");
#endif
	  for (key = section->Keys; key; key = key->link)
	  {
	    if (key->KeyName==NULL)
	      continue;
	    
	    if (left<1)
	    {
#ifdef _DEBUG
		  fprintf(stderr,"GetSetProfile // No more storage for enum !\n");
#endif
		  return Size-2;
		}
		slen = imin(strlen(key->KeyName)+1, left);
		strncpy(p, key->KeyName, slen);
#ifdef _DEBUG
		fprintf(stderr,"GetSetProfile // enum cl‚ '%s' !\n", p);
#endif
		left -= slen;
		p += slen;
	  }
	  *p = '\0';
#ifdef _DEBUG
	  fprintf(stderr,"GetSetProfile // normal end of enum key !\n");
#endif
	  return Size-2-left;
	}

	for (key=section->Keys ; key ; key=key->link)
	{
	  if (key->KeyName==NULL)
	    continue;
	  
	  if (stricmp(key->KeyName, KeyName))
		continue;
	  if (set)
	  {
	    if (strcmp(key->Value, Default ? Default : "")==0)
	      return 1;
	      
		free(key->Value);
		key->Value = strdup(Default ? Default : "");
		dump_profile(Current);
		return 1;
	  }
	  ReturnedString [Size-1] = 0;
	  strncpy(ReturnedString, key->Value, Size-1);
	  return 1; 
	}
	
	/* If Getting the information, then don't write the information
	   to the INI file, need to run a couple of tests with windog */
	/* No key found */
	if (set)
	{
	  new_key(section, KeyName, Default);
	  dump_profile(Current);
    }
    else
    {
      ReturnedString [Size-1] = 0;
      strncpy(ReturnedString, Default, Size-1);
	}
	return 1;
  }
    
    /* Non existent section */
  if (set)
  {
	section = (TSecHeader *) malloc(sizeof(TSecHeader));
	section->AppName = strdup(AppName);
	section->Keys = 0;
	new_key(section, KeyName, Default);
	section->link = Current->Section;
	Current->Section = section;
	dump_profile(Current);
  } 
  else
  {
	ReturnedString [Size-1] = 0;
	strncpy(ReturnedString, Default, Size-1);
  }
  return 1;
}

size_t GetPrivateProfileString(char *AppName, char *KeyName, char *Default, char *ReturnedString, size_t Size, char *szFullPath)
{
  int v;

#ifdef _DEBUG
  fprintf(stderr,"GetPrivateProfileString('%s', '%s', '%s', %p, %d, %s\n", 
	AppName, KeyName, Default, ReturnedString, Size, szFullPath);
#endif
  v = GetSetProfile(0,AppName,KeyName,Default,ReturnedString,Size,szFullPath);
  if (AppName)
	return strlen(ReturnedString);
  else
	return Size-v;
}


int GetPrivateProfileInt(char *AppName, char *KeyName, int Default, char *FileName)
{
  static char IntBuf [6];
  static char buf [6];

  sprintf(buf, "%d", Default);
    
  /* Check the exact semantic with the SDK */
  GetPrivateProfileString(AppName, KeyName, buf, IntBuf, 6, FileName);
  if (!stricmp(IntBuf, "true"))
    return 1;
  if (!stricmp(IntBuf, "yes"))
    return 1;
  return atoi(IntBuf);
}

    
int WritePrivateProfileString(char *AppName, char *KeyName, char *String, char *szFileName)
{
  return GetSetProfile(1, AppName, KeyName, String, "", 0, szFileName);
}

