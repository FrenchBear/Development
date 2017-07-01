
#include <stdio.h>
#include <io.h>

struct _finddata_t fd;

int test()
{
  long hf;
  int i;

  hf = _findfirst("*.*", &fd);
  if (hf>0)
    do
    {
      printf("%-20.20s  %8ld  %02x\n", fd.name, fd.size, fd.attrib);
  	  i = _findnext(hf, &fd);
    } while (i!=-1);
  _findclose(hf);
  return 0;
}

#include "msd_dir.h"

int main()
{
  DIR *d;
  struct dirent *de;

  d = opendir(".");
  while ((de = readdir(d))!=NULL)
  {
    printf("%s\n", de->d_name);
  }

  closedir(d);
  return 0;
}

