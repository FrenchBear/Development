
#include <stdio.h>
#include <dos.h>

#define KILO 1024L
#define MEGA (1024L*1024L)

void main()
{
  int i;
  unsigned s;
  struct diskfree_t di;
  struct find_t     fb;
  long da,df;
  long unite;
  char path[6], name[13];

  putch('\n');
  puts("Unit‚ Nom du volume  Disponible   Total    Occupation");
  puts("ÄÄÄÄÄ ÄÄÄÄÄÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄÄÄ ÄÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄÄÄ");

  for (i=3 ; i<9 ; i++)
  {
    s = _dos_getdiskfree(i, &di);
    if (s) break;

    printf("  %c:  ", 'A'+i-1);

    sprintf(path,"%c:*.*", 'A'+i-1);
    s = _dos_findfirst(path, _A_VOLID, &fb);
    if (s==0)
    { strcpy(name, fb.name);
      if (strlen(name)>8) strcpy(name+8,fb.name+9);
    }
    else
      name[0] = 0;
    printf("%-11.11s       ", name);

    da = (long)di.total_clusters*(long)di.sectors_per_cluster*(long)di.bytes_per_sector;
    df = (long)di.avail_clusters*(long)di.sectors_per_cluster*(long)di.bytes_per_sector*1L;

    unite = (df>=MEGA) ? MEGA : KILO;
    printf("%3ld.%1ld%c    ", df/unite, (10*(df%unite))/unite, (unite==MEGA)?'M':'K');

    unite = (da>=MEGA) ? MEGA : KILO;
    printf("%3ld.%1ld%c      ", da/unite, (10*(da%unite))/unite, (unite==MEGA)?'M':'K');

    printf("%5.1lf%%\n", 100.0-(100.0*df)/da);

//    printf("total clusters: %6u  ", di.total_clusters);
//    printf("avail clusters: %6u\n", di.avail_clusters);

  }
  putch('\n');
  exit(0);
}
