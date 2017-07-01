#include <sqlfm.h>
#include <sqlhdr.h>
static _SQCURSOR _SQ2, _SQ1;
#line 1 "/tmp/ds.ec"
#line 1 "ds.ec"




#line 1 "/usr/include/stdio.h"


#pragma comment(exestr, "@(#) stdio.h 7.5 91/10/24 ")


#line 7 "/usr/include/stdio.h"


























#pragma comment(exestr, "@(#) stdio.h 7.1 91/08/14 ")


#line 37 "/usr/include/stdio.h"



#line 41 "/usr/include/stdio.h"

#line 1 "/usr/include/limits.h"

























#pragma comment(exestr, "@(#) limits.h 7.3 91/08/15 ")


#line 30 "/usr/include/limits.h"







#line 38 "/usr/include/limits.h"









#line 48 "/usr/include/limits.h"























































#line 104 "/usr/include/limits.h"








#line 113 "/usr/include/limits.h"










#line 124 "/usr/include/limits.h"





#line 130 "/usr/include/limits.h"

#line 132 "/usr/include/limits.h"













#line 146 "/usr/include/limits.h"

#line 148 "/usr/include/limits.h"

#line 43 "/usr/include/stdio.h"

#line 45 "/usr/include/stdio.h"



typedef   long              fpos_t;
#line 50 "/usr/include/stdio.h"






#line 57 "/usr/include/stdio.h"

#line 59 "/usr/include/stdio.h"
#line 60 "/usr/include/stdio.h"



typedef   unsigned int      size_t;
#line 65 "/usr/include/stdio.h"



typedef   char         *va_list;

#line 71 "/usr/include/stdio.h"
#line 72 "/usr/include/stdio.h"





























#line 102 "/usr/include/stdio.h"

typedef struct {

	int            __cnt;
	unsigned char   *__ptr;



#line 111 "/usr/include/stdio.h"
	unsigned char   *__base;
	char            __flag;
	char            __file;
} FILE;



#line 119 "/usr/include/stdio.h"

#line 121 "/usr/include/stdio.h"

















#line 139 "/usr/include/stdio.h"







#line 147 "/usr/include/stdio.h"





#line 153 "/usr/include/stdio.h"








































































#line 226 "/usr/include/stdio.h"
extern   int            remove(const char *);
extern   int            rename(const char *, const char *);
extern   FILE           *tmpfile(void);
extern   char           *tmpnam(char *);
extern   int            fclose(FILE *);
extern   int            fflush(FILE *);
extern   FILE           *fopen(const char *, const char *);
extern   FILE           *freopen(const char *, const char *, FILE *);
extern   void           setbuf(FILE *, char *);
extern   int            setvbuf(FILE *, char *, int, size_t);
extern   int            fprintf(FILE *, const char *, ...);
extern   int            fscanf(FILE *, const char *, ...); 
extern   int            printf(const char *, ...);
extern   int            scanf(const char *, ...);
extern   int            sprintf(char *, const char *, ...);
extern   int            sscanf(const char *, const char *, ...);

extern   int            vfprintf(FILE *, const char *, va_list);
extern   int            vprintf(const char *, va_list);
extern   int            vsprintf(char *, const char *, va_list);




#line 251 "/usr/include/stdio.h"
extern   int            fgetc(FILE *);
extern   char           *fgets(char *, int, FILE *);
extern   int            fputc(int, FILE *);
extern   int            fputs(const char *, FILE *);
extern   int            getc(FILE *);
extern   int            getchar(void);
extern   char           *gets(char *);
extern   int            putc(int, FILE *);
extern   int            putchar(int);
extern   int            puts(const char *);
extern   int            ungetc(int, FILE *);



#line 266 "/usr/include/stdio.h"
extern   size_t         fread(void *, size_t, size_t, FILE *);
extern   size_t         fwrite(const void *, size_t, size_t, FILE *);
#line 269 "/usr/include/stdio.h"
extern   int            fgetpos(FILE *, fpos_t *);
extern   int            fseek(FILE *, long int, int);
extern   int            fsetpos(FILE *, const fpos_t *);
extern   long           ftell(const FILE *);
extern   void           rewind(FILE *);
extern   void           clearerr(FILE *);
extern   int            feof(FILE *);
extern   int            ferror(FILE *);
extern   void           perror(const char *);

extern   int            unlink(const char *);
extern   int            _filbuf(FILE *);
extern   int            _flsbuf(unsigned char, FILE *);
extern   char           *ctermid(char *);
extern   char           *cuserid(char *);
extern   int            system(const char *);




#line 290 "/usr/include/stdio.h"


extern int         putw(int, FILE *);
extern int         getw(FILE *);
extern FILE        *popen(const char *, const char *);
extern int         pclose(FILE *);
extern char        *tempnam(const char *,const char *);
#line 298 "/usr/include/stdio.h"


extern FILE        *fdopen(int, const char *);
extern int	    fileno(FILE *);
#line 303 "/usr/include/stdio.h"

#line 305 "/usr/include/stdio.h"

extern   unsigned char  *_bufendtab[];
extern   FILE           _iob[60];



#line 312 "/usr/include/stdio.h"





#line 318 "/usr/include/stdio.h"



#line 322 "/usr/include/stdio.h"

#line 1 "/usr/include/errno.h"



























#pragma comment(exestr, "@(#) errno.h 6.1 91/06/06 ")


#line 32 "/usr/include/errno.h"

#line 1 "/usr/include/sys/errno.h"



#pragma comment(exestr, "@(#) errno.h 25.2 92/09/09 ")


#line 8 "/usr/include/sys/errno.h"





















#line 30 "/usr/include/sys/errno.h"



#line 34 "/usr/include/sys/errno.h"





















#line 56 "/usr/include/sys/errno.h"












#line 69 "/usr/include/sys/errno.h"


































































































































#line 200 "/usr/include/sys/errno.h"


































#line 235 "/usr/include/sys/errno.h"
#line 236 "/usr/include/sys/errno.h"

#line 238 "/usr/include/sys/errno.h"
#line 34 "/usr/include/errno.h"



#line 38 "/usr/include/errno.h"

extern int errno;


extern int sys_nerr;
extern char *sys_errlist[];


#line 47 "/usr/include/errno.h"
extern void perror(const char *);
#line 49 "/usr/include/errno.h"
#line 50 "/usr/include/errno.h"



#line 54 "/usr/include/errno.h"

#line 56 "/usr/include/errno.h"
#line 324 "/usr/include/stdio.h"





#line 330 "/usr/include/stdio.h"



















#line 350 "/usr/include/stdio.h"









#line 360 "/usr/include/stdio.h"

#line 362 "/usr/include/stdio.h"
#line 363 "/usr/include/stdio.h"

#line 365 "/usr/include/stdio.h"
#line 6 "ds.ec"
#line 1 "/ercem/include/clib.ref"









































































#line 75 "/ercem/include/clib.ref"



extern size_t fread(void *, unsigned int, unsigned int, FILE *);
extern size_t fwrite(const void *, unsigned int, unsigned int, FILE *);
extern void *malloc(unsigned int);
extern void *realloc(void *, unsigned int);
extern int chown(const char *, unsigned short, unsigned short);
extern short fork(void);



#line 88 "/ercem/include/clib.ref"
extern void (*signal(int, void(*)(int)))(int);
#line 90 "/ercem/include/clib.ref"

extern void (*sigset(int, void (*)(int)))();
extern int (*ssignal(int, int (*)(int)))();
extern void *memcpy(void *, const void *, size_t);
extern void *memset(void *, int, size_t);
extern char *strncpy(char *, const char *, size_t);
extern char *strncat(char *, const char *, size_t);
extern int strncmp(const char *, const char *, size_t);
extern size_t strcspn(const char *, const char *);
extern size_t strlen(const char *);
extern size_t strspn(const char *, const char *);
extern void *calloc(size_t, size_t);
extern void *bsearch(const void *, const void *, size_t, size_t, int (*)(const void *, const void *));
extern void qsort(void *, size_t, size_t, int(*)(const void *, const void *));

#line 106 "/ercem/include/clib.ref"

extern int  lockf(int,int,long);
extern int  _filbuf(FILE *), _flsbuf(unsigned char, FILE *);
extern char *logname(void);
extern char *crypt(char *, char *);
extern char *ctermid(char *);
extern char *ctime(const long *);
extern char *cuserid(char *);
extern char *ecvt(double, int, int *, int *);
extern char *errstr(int);
extern char *fcvt(double, int, int *, int *);
extern char *fgets(char *, int, FILE *);
extern char *gcvt(double, int, char *);
extern char *getenv(const char *);
extern char *getlogin(void);
extern char *getpass(char *);
extern char *gets(char *);
extern char *l64a(long);
extern char *lsearch(char *, char *, int *, int, int (*)());
extern char *mktemp(char *);
extern char *sbrk(int);
extern int putenv(const char*);

extern char *strcpy(char *, const char *);
extern char *strcat(char *, const char *);
extern char *strchr(const char *, int);
extern char *strpbrk(const char *, const char *);
extern char *strrchr(const char *, int);
extern char *strtok(char *, const char *);
extern char *strdup(const char *);
extern char *strstr(const char *, const char *);

extern char *tmpnam(char *);
extern char *ttyname(int);
extern double atof(const char *);
extern double frexp(double, int *);
extern double ldexp(double, int);
extern double modf(double, double *);
extern void abort(void);
extern int abs(int);
extern int access(const char *, int);
extern int acct(char *);
extern int atoi(const char *);
extern int chdir(const char *);
extern int chmod(const char *, unsigned short);
extern int chroot(char *);
extern int close(int);
extern int creat(const char *, unsigned short);
extern int dup(int);
extern int dup2(int, int);
extern int endgrent(void);
extern int endpwent(void);
extern int execl(const char *, const char *, ...);
extern int execle(const char *, const char *, ...);
extern int execlp(const char *, const char *, ...);
extern int execv(const char *, const char *[0]);
extern int execve(const char *, const char *[0], const char *[0]);
extern int execvp(const char *, const char *[0]);
extern void exit(int);
extern int fclose(FILE *);
extern int fcntl(int, int, ...);
extern int fflush(FILE *);
extern int fgetc(FILE *);
extern int fprintf(FILE *, const char *, ...);
extern int fputc(int, FILE *);
extern int fputs(const char *, FILE *);
extern int fscanf(FILE *, const char *, ...);
extern int fseek(FILE *, long, int);
extern int fstat(int, struct stat *);
extern int ftime(struct timeb *);
extern int fxlist(int, struct xlist [0]);
extern unsigned short getegid(void);
extern unsigned short geteuid(void);
extern unsigned short getgid(void);
extern int getopt(int, char * *, char *);
extern short getpgrp(void);
extern short getpid(void);
extern short getppid(void);
extern int getpw(int, char *);
extern unsigned short getuid(void);
extern char *getcwd(char *, int);
extern int getw(FILE *);
extern int gsignal(int);
extern int ioctl(int, int, ...);
extern int kill(short, int);
extern int link(const char *, const char *);
extern void longjmp(int [], int);
extern int mknod(char *, int, int);
extern int mount(char *, char *, int);
extern int nice(int);
extern int nlist(char *, struct nlist [0]);
extern int open(const char *, int, ...);
extern int pause(void);
extern int pclose(FILE *);
extern void perror(const char *);
extern int pipe(int [2]);
extern int printf(const char *, ...);
extern int ptrace(int, int, struct segadr *, int);
extern int putpwent(struct passwd *, FILE *);
extern int puts(const char *);
extern int putw(int, FILE *);
extern int rand(void);
extern int read(int, void *, unsigned int);
extern int scanf(const char *, ...);
extern int setgid(unsigned short);
extern int setgrent(void);
extern int setjmp(int [5]);
extern int setpgrp(void);
extern int setpwent(void);
extern int setuid(unsigned short);
extern int sprintf(char *, const char *, ...);
extern int sscanf(const char *, const char *, ...);
extern int stat(const char *, struct stat *);
extern int stime(long *);
extern int strcmp(const char *, const char *);
extern int sync(void);
extern int system(const char *);
extern int tolower(int);
extern int toupper(int);
extern int ttyslot(void);
extern unsigned short umask(unsigned short);
extern int umount(char *);
extern int uname(struct utsname *);
extern int ungetc(int, FILE *);
extern int unlink(const char *);
extern int ustat(short, struct ustat *);
extern int wait(int *);
extern int write(int, const void *, unsigned int);
extern int xlist(char *, struct xlist [0]);
extern long a64l(char *);
extern long atol(const char *);
extern long ftell(const FILE *);
extern long lseek(int, long, int);
extern long time(long *);
extern long times(struct tms *);
extern long ulimit(int, long);
extern FILE *fdopen(int, const char *);
extern FILE *fopen(const char *, const char *);
extern FILE *freopen(const char *, const char *, FILE *);
extern FILE *popen(const char *, const char *);
extern FILE *tmpfile(void);
extern struct group *getgrent(void);
extern struct group *getgrgid(int);
extern struct group *getgrnam(char *);
extern struct passwd *getpwent(void);
extern struct passwd *getpwnam(char *);
extern struct passwd *getpwuid(int);
extern struct tm *gmtime(const long *);
extern struct tm *localtime(const long *);
extern unsigned int alarm(unsigned int);
extern unsigned int sleep(unsigned int);
extern void encrypt(char *, int);
extern void free(void *);
extern void l3tol(long *, char *, int);
extern void ltol3(char *, long *, int);
extern void monitor(int (*)(), int (*)(), short [0], int, int);
extern void profil(char *, int, int, int);
extern void setbuf(FILE *, char *);
extern void setkey(char *);
extern void srand(unsigned int);
extern void swab(short *, short *, int);
extern void tzset(void);
extern int tgetent(char *, char *);
extern char *tgetstr(char *, char **);
extern char *tgoto(char *, int, int);
extern void tputs(char *, int, int (*)());

extern int vprintf(const char *, char *);
extern int vsprintf(char *, const char *, char *);
extern int vfprintf(FILE *, const char *, char *);
































































#line 341 "/ercem/include/clib.ref"
#line 7 "ds.ec"

#line 1 "/ercem/include/biberc.h"























#line 1 "/usr/include/stdio.h"


#pragma comment(exestr, "@(#) stdio.h 7.5 91/10/24 ")


#line 7 "/usr/include/stdio.h"






































































































































































































































































































































































#line 25 "/ercem/include/biberc.h"
#line 1 "/usr/include/curses.h"

#pragma comment(exestr, "@(#) curses.h 7.1 91/08/09 ")


#line 6 "/usr/include/curses.h"













































#line 52 "/usr/include/curses.h"



#line 56 "/usr/include/curses.h"




#line 61 "/usr/include/curses.h"







#line 69 "/usr/include/curses.h"



#line 73 "/usr/include/curses.h"
#line 1 "/usr/include/tinfo.h"
#ident	"@(#) curses.ed 7.5 91/08/19 "

























#line 1 "/usr/include/stdio.h"


#pragma comment(exestr, "@(#) stdio.h 7.5 91/10/24 ")


#line 7 "/usr/include/stdio.h"






































































































































































































































































































































































#line 28 "/usr/include/tinfo.h"



#line 32 "/usr/include/tinfo.h"



#line 1 "/usr/include/termio.h"

























#pragma comment(exestr, "@(#) termio.h 5.2 91/05/04 ")


#line 30 "/usr/include/termio.h"

#line 1 "/usr/include/sys/termio.h"



#pragma comment(exestr, "@(#) termio.h 25.3 92/09/11 ")


#line 8 "/usr/include/sys/termio.h"

























#line 34 "/usr/include/sys/termio.h"





#line 40 "/usr/include/sys/termio.h"





































#line 78 "/usr/include/sys/termio.h"














#line 93 "/usr/include/sys/termio.h"





#line 99 "/usr/include/sys/termio.h"





#line 105 "/usr/include/sys/termio.h"



#line 109 "/usr/include/sys/termio.h"





#line 115 "/usr/include/sys/termio.h"

































#line 149 "/usr/include/sys/termio.h"



















#line 169 "/usr/include/sys/termio.h"





#line 175 "/usr/include/sys/termio.h"


























#line 202 "/usr/include/sys/termio.h"







#line 210 "/usr/include/sys/termio.h"









#line 220 "/usr/include/sys/termio.h"


typedef unsigned char   cc_t;           
typedef unsigned long   speed_t;        
typedef unsigned short  tcflag_t;       





struct termio {
	unsigned short	c_iflag;	
	unsigned short	c_oflag;	
	unsigned short	c_cflag;	
	unsigned short	c_lflag;	
	char	c_line;		
	unsigned char	c_cc[8];	
};




#line 243 "/usr/include/sys/termio.h"



#line 247 "/usr/include/sys/termio.h"









#line 257 "/usr/include/sys/termio.h"




























































































struct	termcb	{
	char	st_flgs;	
	char	st_termt;	
	char	st_crow;	
	char	st_ccol;	
	char	st_vrow;	
	char	st_lrow;	
};





struct	termss {
	char	ss_start; 	
	char 	ss_stop;	
};






#line 373 "/usr/include/sys/termio.h"














#line 388 "/usr/include/sys/termio.h"

#line 390 "/usr/include/sys/termio.h"











#line 402 "/usr/include/sys/termio.h"




#line 407 "/usr/include/sys/termio.h"
















struct termios {
        tcflag_t        c_iflag;        
        tcflag_t        c_oflag;        
        tcflag_t        c_cflag;        
        tcflag_t        c_lflag;        


#line 431 "/usr/include/sys/termio.h"
	char            c_line;         
#line 433 "/usr/include/sys/termio.h"
	cc_t            c_cc[8+5];     
        char            __c_xxx;        
        char            __c_yyy;        
};




































#line 474 "/usr/include/sys/termio.h"














#line 489 "/usr/include/sys/termio.h"

#line 491 "/usr/include/sys/termio.h"
#line 32 "/usr/include/termio.h"

#line 34 "/usr/include/termio.h"
#line 36 "/usr/include/tinfo.h"
#line 37 "/usr/include/tinfo.h"
    typedef struct termio SGTTY;













#line 52 "/usr/include/tinfo.h"

typedef	unsigned char bool;









	typedef unsigned long chtype;
#line 65 "/usr/include/tinfo.h"






typedef unsigned short _ochtype;
#line 73 "/usr/include/tinfo.h"





#line 79 "/usr/include/tinfo.h"


#line 82 "/usr/include/tinfo.h"


#line 85 "/usr/include/tinfo.h"


#line 88 "/usr/include/tinfo.h"


typedef struct _win_st	WINDOW;
typedef struct screen	SCREEN;

struct _win_st
{
	short		_cury, _curx;	
	short		_maxy, _maxx;	
	short		_begy, _begx;	
	unsigned char	_flags;
	short		_yoffset;	
	bool		_clear,	
			_leave,	
			_immed,	
			_sync;		
	WINDOW		*_padwin;	

	_ochtype	**_y16;	
#line 108 "/usr/include/tinfo.h"
	short		*_firstch;	
	short		*_lastch;	
	short		_tmarg, _bmarg;	
				
	unsigned	_scroll		: 1;	
	unsigned	_use_idl	: 1;	
	unsigned	_use_keypad	: 1;
	unsigned	_notimeout	: 1;
	unsigned	_use_idc	: 1;	
	chtype		_attrs;	
	chtype		_bkgd;		
	int		_delay;		




	short		_ndescs;	
	short		_parx, _pary;	
	WINDOW		*_parent;	
	chtype		**_y;			
};

























#line 155 "/usr/include/tinfo.h"









extern	int	LINES, COLS, TABSIZE, COLORS, COLOR_PAIRS;

extern	short	curs_errno;

extern	WINDOW	*stdscr, *curscr;

extern	unsigned char	ttytype[];
#line 172 "/usr/include/tinfo.h"








extern	SCREEN	*newscreen(char *, int, int, int, FILE *, FILE *),
		*setcurscreen(SCREEN *);

extern	WINDOW	*initscr(void),
		*newwin(int, int, int, int),
		*newpad(int, int),
		*derwin(WINDOW *, int, int, int, int),
		*dupwin(WINDOW *),
		*getwin(FILE *);

extern	chtype	winch(WINDOW *);

extern bool 	can_change_color(void),
		has_colors(void);

extern	int	baudrate(void),
		beep(void),
		color_content(short, short *, short *, short *),
		copywin(WINDOW *, WINDOW *, int, int, int, int, int, int, int),
		delwin(WINDOW *),
		delay_output(int),
		doupdate(void),
		echo(void), noecho(void),
		endwin(void), isendwin(void),
		filter(void),
		flash(void),
		halfdelay(int),
		has_ic(void),
		has_il(void),
		idlok(WINDOW *, char),
		init_color(short, short, short, short),
		init_pair(short, short, short),
		intrflush(WINDOW *, int), 
		keypad(WINDOW *, int),
		meta(WINDOW *, int), 
		mvcur(int, int, int, int),
		mvprintw(int, int, char *, ...),
		mvscanw(int, int, char *, ...),
		mvwaddch(WINDOW *, int, int),
		mvwdelch(WINDOW *, int, int),
		mvwin(WINDOW *, int, int),
		mvwprintw(WINDOW *, int, int, char *, ...),
		mvwscanw(WINDOW *, int, int, char *, ...),
		napms(int),
		nl(void), nonl(void),
		overlay(WINDOW *, WINDOW *),
		overwrite(WINDOW *, WINDOW *),
		pair_content(short, short *, short *),
		prefresh(WINDOW *, int, int, int, int, int, int),
		pnoutrefresh(WINDOW *, int, int, int, int, int, int),
		printw(char *, ...),
		scanw(char *, ...),
		scroll(WINDOW *),
		setupterm(char *, int, int *),
		start_color(void),
		touchwin(WINDOW *), touchline(WINDOW *, int, int),
		ttimeout(int),
		typeahead(int),
		vwprintw(WINDOW *, char *, ...),
		vwscanw(WINDOW *, char *, ...);

extern	int	waddstr(WINDOW *, const char *),
		waddnstr(WINDOW *, char *, int),
		wclear(WINDOW *), wclrtobot(WINDOW *), wclrtoeol(WINDOW *),
		wdelch(WINDOW *),
		wdeleteln(WINDOW *),
		werase(WINDOW *),
		wgetch(WINDOW *), 
		wgetstr(WINDOW *, char *),
		winsdelln(WINDOW *, int),
		winsertln(WINDOW *),
		wmove(WINDOW *, int, int),
		wnoutrefresh(WINDOW *),
		wprintw(WINDOW *, char *, ...),
		wredrawln(WINDOW *, int, int),
		wrefresh(WINDOW *),
		wscanw(WINDOW *, char *, ...),
		wscrl(WINDOW *, int),
		wsetscrreg(WINDOW *, int, int);


#line 262 "/usr/include/tinfo.h"















#line 278 "/usr/include/tinfo.h"



#line 282 "/usr/include/tinfo.h"



extern unsigned char
#line 287 "/usr/include/tinfo.h"


	*longname(void),	
	*termname(void),	
	*keyname(int),		
	*slk_label(int),
	erasechar(void),
	killchar(void),







#line 303 "/usr/include/tinfo.h"
	curs_parm_err[],
	*curs_err_strings[];


#line 308 "/usr/include/tinfo.h"









#line 318 "/usr/include/tinfo.h"
#line 319 "/usr/include/tinfo.h"
extern	void	vidupdate(chtype, chtype, int (*)()), 
		wsyncup(WINDOW *), wsyncdown(WINDOW *),
		delkeymap(void *),
		_ring(char), delscreen(SCREEN *), curserr(void),
		_setqiflush(char), 
		immedok(WINDOW *, int), 
		wtimeout(WINDOW *, int), wbkgdset(WINDOW *, chtype),
		wcursyncup(WINDOW *);



#line 331 "/usr/include/tinfo.h"

extern	int	cbreak(void), nocbreak(void), 
		curs_set(int),
		draino(int),
		reset_prog_mode(void), reset_shell_mode(void),
		def_prog_mode(void), def_shell_mode(void), 
		raw(void),
		_setecho(int), _setnonl(int),
		savetty(void), traceon(void), _meta(int), 
		traceoff(void), noraw(void), flushinp(void), 
		_getsyx(int *, int *),
		nodelay(WINDOW *, int), 
		_overlap(WINDOW *, WINDOW *, int),
		resetty(void), 
		ripoffline(int, int (*)()), 
		scr_init(char *),
		scr_dump(char *),
		scr_restore(char *),
		_scr_all(char *, int),
		setsyx(int, int), 
		slk_clear(void),
		slk_init(int), slk_set(int, char *, int),
		slk_refresh(void), slk_noutrefresh(void),
		slk_restore(void), 
		slk_touch(void),
		tgetent(char *, char *), tgetflag(char *), tgetnum(char *),
		tigetflag(char *), tigetnum(char *),
		notimeout(WINDOW *, int), 
		clearok(WINDOW *, int), 
		leaveok(WINDOW *, int), 
		scrollok(WINDOW *, int), 
		wstandend(WINDOW *), wstandout(WINDOW *); 

extern	int	crmode(void), nocrmode(void), ungetch(int);



#line 369 "/usr/include/tinfo.h"




















#line 390 "/usr/include/tinfo.h"

























#line 416 "/usr/include/tinfo.h"




extern	int getcurx(WINDOW *), getcury(WINDOW *);
extern	int getbegx(WINDOW *), getbegy(WINDOW *);
extern	int getmaxx(WINDOW *), getmaxy(WINDOW *);
extern	int getparx(WINDOW *), getpary(WINDOW *);
extern	chtype getbkgd(WINDOW *), getattrs(WINDOW *);


#line 428 "/usr/include/tinfo.h"
#line 429 "/usr/include/tinfo.h"
#line 430 "/usr/include/tinfo.h"








extern	SCREEN	*newterm32(char *, FILE *, FILE *),
		*set_term(SCREEN *);

extern	WINDOW	*initscr32(void),
		*subwin(WINDOW *, int, int, int, int),
		*subpad(WINDOW *, int, int, int, int);

extern	int	box32(WINDOW *, chtype, chtype),
		p32echochar(WINDOW *, chtype);

extern	int	w32addch(WINDOW *, chtype),
		w32insch(WINDOW *, chtype),
		w32echochar(WINDOW *, chtype);







#line 459 "/usr/include/tinfo.h"
extern _ochtype	*acs_map;
extern  chtype	*acs32map;


#line 464 "/usr/include/tinfo.h"
























#line 489 "/usr/include/tinfo.h"





extern	int	w32attroff(WINDOW *, chtype), 
		w32attron(WINDOW *, chtype), 
		w32attrset(WINDOW *, chtype);


#line 500 "/usr/include/tinfo.h"



















































































#line 584 "/usr/include/tinfo.h"








#line 1 "/usr/include/unctrl.h"






























#pragma comment(exestr, "@(#) unctrl.h 5.3 91/05/04 ")


#line 35 "/usr/include/unctrl.h"




extern unsigned char	*_unctrl[];
#line 41 "/usr/include/unctrl.h"





#line 47 "/usr/include/unctrl.h"

#line 49 "/usr/include/unctrl.h"
#line 593 "/usr/include/tinfo.h"














#line 608 "/usr/include/tinfo.h"













































































































































































#line 782 "/usr/include/tinfo.h"


















































	








































					
					
					
					


























































































































#line 1000 "/usr/include/tinfo.h"
#line 74 "/usr/include/curses.h"
#line 75 "/usr/include/curses.h"

#line 77 "/usr/include/curses.h"

#line 26 "/ercem/include/biberc.h"



#line 30 "/ercem/include/biberc.h"

extern WINDOW *current_window;
WINDOW *newwin2(int nlines, int ncols, int begin_y, int begin_x);
void delwin2(WINDOW *win);
void wrefresh2(WINDOW *win);



extern char szSysteme[];
extern char szNomOperateur[];
extern unsigned char *szBoxd, *szBoxs;
extern int iModeCurses;


int stricmp(unsigned char *, unsigned char *);
int strnicmp(unsigned char *, unsigned char *, int);
#line 47 "/ercem/include/biberc.h"

int strpcmp(char *,char *);
unsigned char   *strinsnc(unsigned char *, int);
unsigned char   *strdelnc(unsigned char *, int);
int strpat(char *p_buff, char *p_masque);
char *GetEnvString(char *, char *, char *);
char *szDateFr(void);
char *szRTrim(char *);
char *szLTrim(char *);
char *szFiltreO(char *);

char *fgets2(char *buffer, int taille, FILE *f);

char *strncpy2(char *dest, char *source, unsigned count);

long unixtime(int, int, int);
long unixtimeex(int, int, int, int, int, int);
long unixtimeix(long);
long ixtimeunix(long);

void AfficheHeure(void);
void InitHeure(void);
void FinHeure(void);

























































typedef char *MENU[];

typedef struct
{ int	iType;
  int	iLig, iCol;
  int	iLgr;
  char	*szVar;
  char	*szValid;
} GRILLE;


void	stopcurses(void);
int		traitesignal(int);
void	startcurses(void);
void	SignalDefaut(void);
void	SignalApp(void);
void	InitEcran(void);
void	InitWin(WINDOW *w);
void	FinEcran(void);
void	NoDelInterrupt(void);
int		getch2(void);
int		wgetch2(WINDOW *);
void	Refresh(void);
void	Cartouche(char *, char *, char *);
void	CartoucheStd(char *);
void	ClsZone(int, int);
void	ClsClient(void);
void	Titre(char *);
void	FkeysL(unsigned char *, int);
void	Fkeys(unsigned char *);
void	Message(char *);
void	Pause(void);
void	itemMenu(int, int ,char *, int);
void	AfficheMenu(char * *);
int		iDoMenu(char * *);


void	drawbox(unsigned char *,int ,int ,int ,int );
void	wdrawbox(WINDOW *,unsigned char *,int ,int ,int ,int );
void	drawvline(unsigned char *,int ,int ,int);
void	wdrawvline(WINDOW *,unsigned char *,int ,int ,int);
void	drawhline(unsigned char *,int ,int ,int);
void	wdrawhline(WINDOW *,unsigned char *,int ,int ,int);

int		iAlert(const char *, const char *, int, int, const char *);
void	AlertOk(const char *, const char *);
void	aprintf(const char *szTitre, const char *szFormat, ...);
void	AlertErr(const char *, const char *, const char *);
void	InputMode(int, int);
int		iInput(int ,int ,unsigned char *,int ,int , unsigned char *);
int		iWInput(WINDOW *, int ,int ,unsigned char *,int ,int , unsigned char *);
void	AfficheGrille(GRILLE *);
int		iSaisieGrille(GRILLE *);
void	ErrorLog(const char *, const char *, const char *, const char *);

int 	fileselect(char *,char *,int,char *,char *,char *,char *);
int 	exist(char *);

int 	instring(unsigned char *,unsigned char);
unsigned char		maj(unsigned char);
unsigned char		majAZ(unsigned char);
unsigned char		minaz(unsigned char);
int		iValid(unsigned char *,unsigned char,int *);

unsigned char		*szUCase(unsigned char *);
unsigned char		*szLCase(unsigned char *);

char 	*szInputBox(char *, char *, char *, int);

FILE	*fopenpath(char *, char *, char *);

void	SQLFatal(char *szApplication, char *szFichier, int iLigne, int iErr, char *szMsgUser);


void BibercAssert(const char *szExpression, const char *szFichier, const int iLigne);



#line 206 "/ercem/include/biberc.h"

#line 208 "/ercem/include/biberc.h"
#line 9 "ds.ec"
#line 1 "/usr/informix4/incl/esqlc.h"











#line   22 "ds.ec"
extern struct
  {
    long sqlcode;
    char sqlerrm[72];
    char sqlerrp[8];
    long sqlerrd[6];
    char sqlawarn[8];
  }  sqlca;
#line   29 "ds.ec"
int status;
#line   30 "ds.ec"
extern int efcode;
#line   31 "ds.ec"
extern int int_flag;
#line   32 "ds.ec"
extern int quit_flag;
#line   33 "ds.ec"


extern void _iqprepare(_SQCURSOR *, char *);
extern void _iqxecute(_SQCURSOR *, int, char *, char *, char *);
extern void _iqdclcur(_SQCURSOR *, char *, char **, int, struct sqlvar_struct *, int, struct sqlvar_struct *, int);
extern void _iqcopen(_SQCURSOR *, int, char *, char *, char *, int);
extern void _iqnftch(_SQCURSOR *, int, struct sqlvar_struct *, void *, int, long, int, char *, char *, int);
extern void _iqclose(_SQCURSOR *);
extern void _iqfree(_SQCURSOR *);
extern void _iqdatabase(char *, int, int, char *);
extern void _iqdbclose(void);
extern void _iqddclcur(_SQCURSOR *, char *, int);
extern void _iqslct(_SQCURSOR *, char **, int, struct sqlvar_struct *, int, struct sqlvar_struct *, int);
extern void _iqstmnt(_SQSTMT *, char **, int, struct sqlvar_struct *, char *);
extern void _iqdscribe(_SQCURSOR *, struct sqlda **);












#line 10 "ds.ec"
#line 1 "/usr/informix4/incl/sqltypes.h"


























 



















































































#line 112 "/usr/informix4/incl/sqltypes.h"
#line 11 "ds.ec"

#line 1 "ds.h"



struct Dynaset;

struct Dynaset *ds_CreateDynaset(char *szRequete);
void ds_Dump(struct Dynaset *ds);
int ds_CloseDynaset(struct Dynaset *ds);
int ds_iEOF(struct Dynaset *ds);
int ds_iGetFieldNum(struct Dynaset *ds, char *szChamp);
char *ds_szGetFieldStr(struct Dynaset *ds, char *szChamp, char *szBuffer, int iTailleBuffer);
int ds_MoveNext(struct Dynaset *ds);

#line 13 "ds.ec"

extern char szNomApp[];

struct Dynaset
{
  char	szType[4];			
  struct sqlda sda;			
  int	sqlcode;			
  _SQCURSOR _SQ1;			
};



struct Dynaset *ds_CreateDynaset(szRequete)
#line   28 "ds.ec"
char *szRequete;
#line   29 "ds.ec"
{
  int i;
  struct Dynaset *ds;
  struct sqlda *sda;		
  char	*m;

  
  ds = malloc(sizeof(struct Dynaset));
  (((ds!=((void *)0))== 0)?BibercAssert("ds!=NULL", "ds.ec", 36):((void)0));
  strcpy(ds->szType, "DYN");

  

/*
 *   $prepare prep from $szRequete;
 */
 {
#line   41 "ds.ec"
 _iqprepare(&_SQ1, szRequete);
 }
#line   42 "ds.ec"
  if (sqlca.sqlcode<0) SQLFatal(szNomApp, "ds.ec", 41, sqlca.sqlcode, ((void *)0));

  

/*
 *   $describe prep into sda;
 */
 {
#line   45 "ds.ec"
 _iqdscribe(&_SQ1, &sda);
 }
#line   46 "ds.ec"
  if (sqlca.sqlcode<0) SQLFatal(szNomApp, "ds.ec", 45, sqlca.sqlcode, ((void *)0));

  
  ds->sda.sqld = sda->sqld;
  ds->sda.sqlvar = (struct sqlvar_struct *)malloc(sda->sqld*sizeof(struct sqlvar_struct));

  
  for (i=0 ; i<sda->sqld ; i++)
  {
	ds->sda.sqlvar[i].sqlname = strdup(sda->sqlvar[i].sqlname);
	switch(sda->sqlvar[i].sqltype)
	{
	  case 1:		
	  case 2:
	  case 7:
	  case 6:
		m = malloc(2+sizeof(int));
		ds->sda.sqlvar[i].sqltype = 102;
		ds->sda.sqlvar[i].sqllen = sizeof(int);
		ds->sda.sqlvar[i].sqlind = (short *)m;
		ds->sda.sqlvar[i].sqldata = m+2;
		break;
	  case 0:
		m = malloc(3+sda->sqlvar[i].sqllen);
		ds->sda.sqlvar[i].sqltype = 100;
		ds->sda.sqlvar[i].sqllen = (short)(1+sda->sqlvar[i].sqllen);
		ds->sda.sqlvar[i].sqlind = (short *)m;
		ds->sda.sqlvar[i].sqldata = m+2;
		break;
	  case 10:
		m = malloc(2+20);
		ds->sda.sqlvar[i].sqltype = 100;
		ds->sda.sqlvar[i].sqllen = 20;
		ds->sda.sqlvar[i].sqlind = (short *)m;
		ds->sda.sqlvar[i].sqldata = m+2;
		break;
  	default:
		printf("Type %d non trait‚ par ds_CreateDynaset\n",
		  sda->sqlvar[i].sqltype);
		exit(1);
	}
	ds->sda.sqlvar[i].sqlformat = ((void *)0);
	ds->sda.sqlvar[i].sqlilen = 0;
	ds->sda.sqlvar[i].sqlitype = 0;
	ds->sda.sqlvar[i].sqlidata = ((void *)0);
  }


/*
 *   $declare curs cursor for prep;
 */
 {
#line   93 "ds.ec"
 _iqddclcur(&_SQ1, "curs", 0);
 }
#line   94 "ds.ec"
  if (sqlca.sqlcode<0) SQLFatal(szNomApp, "ds.ec", 93, sqlca.sqlcode, ((void *)0));


/*
 *   $open curs;
 */
 {
#line   96 "ds.ec"
 _iqcopen(&_SQ1, 0, (char *) 0, (char *) 0, (char *) 0, 0);
 }
#line   97 "ds.ec"
  if (sqlca.sqlcode<0) SQLFatal(szNomApp, "ds.ec", 96, sqlca.sqlcode, ((void *)0));

  
  ds->_SQ1 = _SQ1;

  
  ds_MoveNext(ds);

  return ds;
}

void ds_Dump(struct Dynaset *ds)
{
  int i;

  (((ds!=((void *)0))== 0)?BibercAssert("ds!=NULL", "ds.ec", 111):((void)0)); (((strcmp((char *)ds, "DYN")==0)== 0)?BibercAssert("strcmp((char *)ds, \"DYN\")==0", "ds.ec", 111):((void)0));

  printf("@ds:%x nb:%d sqlvar:%x\n", ds, ds->sda.sqld, ds->sda.sqlvar);
  for (i=0 ; i<ds->sda.sqld ; i++)
	printf("%d: %-18.18s %3d %2d %x\n", i, ds->sda.sqlvar[i].sqlname, ds->sda.sqlvar[i].sqltype, ds->sda.sqlvar[i].sqllen, ds->sda.sqlvar[i].sqldata);
}


int ds_CloseDynaset(struct Dynaset *ds)
{
  int i;

  (((ds!=((void *)0))== 0)?BibercAssert("ds!=NULL", "ds.ec", 123):((void)0)); (((strcmp((char *)ds, "DYN")==0)== 0)?BibercAssert("strcmp((char *)ds, \"DYN\")==0", "ds.ec", 123):((void)0));

  ds->szType[0] = 0;	
  
  for (i=0 ; i<ds->sda.sqld ; i++)
  { free(ds->sda.sqlvar[i].sqlind);
	free(ds->sda.sqlvar[i].sqlname);
  }

  
  _SQ1 = ds->_SQ1;


/*
 *   $close curs;
 */
 {
#line  136 "ds.ec"
 _iqclose(&_SQ1);
 }
#line  137 "ds.ec"
  if (sqlca.sqlcode<0) SQLFatal(szNomApp, "ds.ec", 136, sqlca.sqlcode, ((void *)0));


/*
 *   $free curs;
 */
 {
#line  139 "ds.ec"
 _iqfree(&_SQ1);
 }
#line  140 "ds.ec"
  if (sqlca.sqlcode<0) SQLFatal(szNomApp, "ds.ec", 139, sqlca.sqlcode, ((void *)0));

  
  free(ds->sda.sqlvar);
  
  free(ds);

  return 1;
}

int ds_iEOF(struct Dynaset *ds)
{
  (((ds!=((void *)0))== 0)?BibercAssert("ds!=NULL", "ds.ec", 151):((void)0)); (((strcmp((char *)ds, "DYN")==0)== 0)?BibercAssert("strcmp((char *)ds, \"DYN\")==0", "ds.ec", 151):((void)0));
  return ds->sqlcode==100;
}

int ds_iGetFieldNum(struct Dynaset *ds, char *szChamp)
{
  int i;

  (((ds!=((void *)0))== 0)?BibercAssert("ds!=NULL", "ds.ec", 159):((void)0)); (((strcmp((char *)ds, "DYN")==0)== 0)?BibercAssert("strcmp((char *)ds, \"DYN\")==0", "ds.ec", 159):((void)0));
  (((szChamp!=((void *)0))== 0)?BibercAssert("szChamp!=NULL", "ds.ec", 160):((void)0));
  (((!ds_iEOF(ds))== 0)?BibercAssert("!ds_iEOF(ds)", "ds.ec", 161):((void)0));

  for (i=0 ; i<ds->sda.sqld ; i++)
	if (stricmp(ds->sda.sqlvar[i].sqlname, szChamp)==0)
	{
	  switch (ds->sda.sqlvar[i].sqltype)
	  {
		case 102:
		  return *(int *)ds->sda.sqlvar[i].sqldata;
  default:
		  aprintf("DS", "ds_iGetFieldNum: Le champ %s n'est pas de type num‚rique !", szChamp);
		  return 0;
	  }
	}
  aprintf("DS", "ds_iGetFieldNum: Champ %s inconnu !", szChamp);
  return 0;
}

char *ds_szGetFieldStr(struct Dynaset *ds, char *szChamp, char *szBuffer, int iTailleBuffer)
{
  int i;

  (((ds!=((void *)0))== 0)?BibercAssert("ds!=NULL", "ds.ec", 183):((void)0)); (((strcmp((char *)ds, "DYN")==0)== 0)?BibercAssert("strcmp((char *)ds, \"DYN\")==0", "ds.ec", 183):((void)0));
  (((szChamp!=((void *)0))== 0)?BibercAssert("szChamp!=NULL", "ds.ec", 184):((void)0));
  (((!ds_iEOF(ds))== 0)?BibercAssert("!ds_iEOF(ds)", "ds.ec", 185):((void)0));

  for (i=0 ; i<ds->sda.sqld ; i++)
	if (stricmp(ds->sda.sqlvar[i].sqlname, szChamp)==0)
	  switch (ds->sda.sqlvar[i].sqltype)
	  {
		case 100:
		  return strncpy2(szBuffer, ds->sda.sqlvar[i].sqldata, iTailleBuffer);
  default:
		  aprintf("DS", "ds_iGetFieldStr: Le champ %s n'est pas de type chaŒne !", szChamp);
		  return ((void *)0);
	  }
  aprintf("DS", "ds_iGetFieldStr: Champ %s inconnu !", szChamp);
  return ((void *)0);
}

int ds_MoveNext(struct Dynaset *ds)
{
  struct sqlda *sda;		

  (((ds!=((void *)0))== 0)?BibercAssert("ds!=NULL", "ds.ec", 205):((void)0)); (((strcmp((char *)ds, "DYN")==0)== 0)?BibercAssert("strcmp((char *)ds, \"DYN\")==0", "ds.ec", 205):((void)0));
ds_Dump(ds);

  
  _SQ1 = ds->_SQ1;

  
  sda = &ds->sda;


/*
 *   $fetch curs using descriptor sda;
 */
 {
#line  215 "ds.ec"
 _iqnftch(&_SQ1, 0, (char *) 0, sda, 1, (long) 0, 0, (char *) 0, (char *) 0, 0);
 }
#line  216 "ds.ec"
  if (sqlca.sqlcode<0) SQLFatal(szNomApp, "ds.ec", 215, sqlca.sqlcode, ((void *)0));
  ds->sqlcode = sqlca.sqlcode;

  
  ds->_SQ1 = _SQ1;
  return ds->sqlcode;
}

