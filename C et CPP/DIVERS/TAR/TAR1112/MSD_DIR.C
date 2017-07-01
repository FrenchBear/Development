/*
 * @(#)msd_dir.c 1.4 87/11/06	Public Domain.
 *
 *  A public domain implementation of BSD directory routines for
 *  MS-DOS.  Written by Michael Rendell ({uunet,utai}michael@garfield),
 *  August 1897
 */

#include	"msd_dir.h"
#include	<stdlib.h>
#include	<string.h>
#include	<io.h>
#include	<sys/stat.h>

#ifndef	NULL
# define	NULL	0
#endif /* NULL */

#ifndef	MAXPATHLEN
# define	MAXPATHLEN	255
#endif /* MAXPATHLEN */

#define	Newisnull(a, t)		((a = (t *) malloc(sizeof(t))) == (t *) NULL)
#define ATTRIBUTES	(A_RONLY | A_SYSTEM | A_DIR)

static long	hf;
static struct _finddata_t fd;

static char *getdirent ();
static void free_dircontents ();


DIR *opendir (char *name)
{
  struct _stat statb;
  DIR *dirp;
  char c;
  char *s;
  struct _dircontents *dp;
  char nbuf[MAXPATHLEN + 1];

  if (stat (name, &statb) < 0 || (statb.st_mode & _S_IFMT) != _S_IFDIR)
    return (DIR *) NULL;
  if (Newisnull (dirp, DIR))
    return (DIR *) NULL;
  if (*name && (c = name[strlen (name) - 1]) != '\\' && c != '/')
    (void) strcat (strcpy (nbuf, name), "\\*.*");
  else
    (void) strcat (strcpy (nbuf, name), "*.*");
  dirp->dd_loc = 0;
  dirp->dd_contents = dirp->dd_cp = (struct _dircontents *) NULL;
  if ((s = getdirent (nbuf)) == (char *) NULL)
    return dirp;
  do
  {
    if (Newisnull (dp, struct _dircontents) || (dp->_d_entry =
		     malloc ((unsigned) (strlen (s) + 1))) == (char *) NULL)
	{
	  if (dp)
	    free ((char *) dp);
	  free_dircontents (dirp->dd_contents);
	  return (DIR *) NULL;
	}
    if (dirp->dd_contents)
	  dirp->dd_cp = dirp->dd_cp->_d_next = dp;
    else
	  dirp->dd_contents = dirp->dd_cp = dp;
    strcpy (dp->_d_entry, s);
    dp->_d_next = (struct _dircontents *) NULL;
  }
  while ((s = getdirent ((char *) NULL)) != (char *) NULL);
  dirp->dd_cp = dirp->dd_contents;
  _findclose(hf);

  return dirp;
}

void closedir (DIR *dirp)
{
  free_dircontents (dirp->dd_contents);
  free ((char *) dirp);
}

struct dirent *readdir (DIR *dirp)
{
  static struct dirent dp;

  if (dirp->dd_cp == (struct _dircontents *) NULL)
    return (struct dirent *) NULL;
  dp.d_namlen = dp.d_reclen =
    strlen (strcpy (dp.d_name, dirp->dd_cp->_d_entry));
  strlwr (dp.d_name);		/* JF */
  dp.d_ino = 0;
  dirp->dd_cp = dirp->dd_cp->_d_next;
  dirp->dd_loc++;

  return &dp;
}

void seekdir (DIR *dirp, long off)
{
  long i = off;
  struct _dircontents *dp;

  if (off < 0)
    return;
  for (dp = dirp->dd_contents; --i >= 0 && dp; dp = dp->_d_next)
    ;
  dirp->dd_loc = off - (i + 1);
  dirp->dd_cp = dp;
}

long telldir (DIR *dirp)
{
  return dirp->dd_loc;
}

static void free_dircontents (struct _dircontents *dp)
{
  struct _dircontents *odp;

  while (dp)
    {
      if (dp->_d_entry)
	free (dp->_d_entry);
      dp = (odp = dp)->_d_next;
      free ((char *) odp);
    }
}

static char *getdirent(char *dir)
{
  int i;

  do
  {
    if (dir != (char *) NULL)
	{ i = hf = _findfirst(dir, &fd);
	  dir = NULL;
	}
	else
	  i = _findnext(hf, &fd);
  }
  while (i>=0 && (fd.attrib&(_A_HIDDEN|_A_SYSTEM|_A_SUBDIR))!=0);

  if (i<0)
    return (char *) NULL;

  return fd.name;
}
