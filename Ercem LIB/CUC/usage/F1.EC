
#include <decimal.h>
#include <locator.h>
#include <datetime.h>
#include <stdio.h>
#include <fglrep.h>
$extern struct {
long sqlcode; char sqlerrm[72]; char sqlerrp[8];
long sqlerrd[6]; char sqlawarn[8];
} sqlca;
$extern int status;
extern int efcode;
extern int _expcode;
extern short _anyerr;
$extern int int_flag;
$extern int quit_flag;
static char *fgl_modname = "f15.4gl";
main(argc, argv)
int argc;  char *argv[];

{
$  short igerme;
$  char slibelle [31];
$  char sts [20];
fgl_init(argc, argv);
fgl_siginit();
du0: _anyerr = 0;
$  database "ercem";
status = sqlca.sqlcode;
if (status < 0)
{
fgl_fatal(fgl_modname, 5, status);
}
$  declare curs cursor for select ger_indice , ger_libelle , timestamp from
 germe where ger_langue = "F";
status = sqlca.sqlcode;
if (status < 0)
{
fgl_fatal(fgl_modname, 7, status);
}
$  open curs;
status = sqlca.sqlcode;
if (status < 0)
{
fgl_fatal(fgl_modname, 7, status);
}
while (1)
{
$  fetch curs into $igerme , $slibelle , $sts;
status = sqlca.sqlcode;
if (status < 0)
{
fgl_fatal(fgl_modname, 8, status);
}
du1: _anyerr = 0;
if (status == 100) break;
$  display $igerme , $slibelle , $sts;
status = efcode;
if (status < 0)
{
fgl_fatal(fgl_modname, 9, status);
}
}
$  close curs;
status = sqlca.sqlcode;
if (status < 0)
{
fgl_fatal(fgl_modname, 9, status);
}
du2: _anyerr = 0;
$  exit form mode;
_autofree(0);
}
