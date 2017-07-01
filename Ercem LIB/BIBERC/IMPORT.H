// import.h
// Module de portabilit‚ pour la version partag‚e de la biblio BIBERC
// 12/01/95 PV

#ifdef SHLIB

#undef waddch
#undef wgetstr
#undef initscr

#define initscr		(*_be_initscr)
#define endwin		(*_be_endwin)
#define newwin		(*_be_newwin)
#define delwin		(*_be_delwin)
#define waddstr		(*_be_waddstr)
#define waddch		(*_be_waddch)
#define winch		(*_be_winch)
#define wgetstr		(*_be_wgetstr)
#define wgetch		(*_be_wgetch)
#define wprintw		(*_be_wprintw)
#define printw		(*_be_printw)
#define w32attroff	(*_be_w32attroff)
#define w32attron	(*_be_w32attron)
#define wclrtoeol	(*_be_wclrtoeol)
#define wmove		(*_be_wmove)
#define touchwin	(*_be_touchwin)
#define doupdate	(*_be_doupdate)
#define wrefresh	(*_be_wrefresh)
#define wnoutrefresh	(*_be_wnoutrefresh)
#define idlok		(*_be_idlok)
#define cbreak		(*_be_cbreak)
#define nl			(*_be_nl)
#define noecho		(*_be_noecho)
#define keypad		(*_be_keypad)
#define LINES		(*_be_LINES)
#define COLS		(*_be_COLS)
#define stdscr		(*_be_stdscr)
#define curscr		(*_be_curscr)

#define ctime		(*_be_ctime)
#define localtime	(*_be_localtime)
#define toupper		(*_be_toupper)
#define alarm		(*_be_alarm)
#define exit		(*_be_exit)
#define system		(*_be_system)
#define popen		(*_be_popen)
#define pclose		(*_be_pclose)
#define sscanf		(*_be_sscanf)
#define vsprintf	(*_be_vsprintf)
#define qsort		(*_be_qsort)
#define strdup		(*_be_strdup)
#define sys_errlist	(*_be_sys_errlist)
#define sys_nerr	(*_be_sys_nerr)


extern int initscr();
extern int endwin();
extern void *newwin();
extern int delwin();
extern int waddstr();
extern int waddch();
extern int winch();
extern int wgetstr();
extern int wgetch();
extern int wprintw();
extern int printw();
extern int w32attroff();
extern int w32attron();
extern int wclrtoeol();
extern int wmove();
extern int touchwin();
extern int doupdate();
extern int wrefresh();
extern int wnoutrefresh();
extern int idlok();
extern int cbreak();
extern int nl();
extern int noecho();
extern int keypad();
extern int LINES, COLS;
extern void *stdscr;
extern void *curscr;

extern char *ctime();
extern void *localtime();
extern int toupper();
extern unsigned int alarm();
extern void exit();
extern int system();
extern FILE *popen();
extern int pclose();
extern int sscanf();
extern int vsprintf();
extern int qsort();
extern char *strdup();
extern char *sys_errlist[];
extern int sys_nerr;

#endif
