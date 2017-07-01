// bibdefs.c

int (*_be_initscr)() = 0;
int (*_be_endwin)() = 0;
void (*_be_newwin)() = 0;
int (*_be_delwin)() = 0;
int (*_be_waddstr)() = 0;
int (*_be_waddch)() = 0;
int (*_be_winch)() = 0;
int (*_be_wgetstr)() = 0;
int (*_be_wgetch)() = 0;
int (*_be_wprintw)() = 0;
int (*_be_printw)() = 0;
int (*_be_w32attron)() = 0;
int (*_be_w32attroff)() = 0;
int (*_be_wclrtoeol)() = 0;
int (*_be_wmove)() = 0;
int (*_be_touchwin)() = 0;
int (*_be_doupdate)() = 0;
int (*_be_wrefresh)() = 0;
int (*_be_wnoutrefresh)() = 0;
int (*_be_idlok)() = 0;
int (*_be_cbreak)() = 0;
int (*_be_nl)() = 0;
int (*_be_noecho)() = 0;
int (*_be_keypad)() = 0;
int *_be_LINES = 0;
int *_be_COLS = 0;
void *_be_stdscr = 0;
void *_be_curscr = 0;

int (*_be_ctime)() = 0;
int (*_be_localtime)() = 0;
int (*_be_toupper)() = 0;
int (*_be_alarm)() = 0;
int (*_be_exit)() = 0;
int (*_be_system)() = 0;
int (*_be_popen)() = 0;
int (*_be_pclose)() = 0;
int (*_be_sscanf)() = 0;
int (*_be_vsprintf)() = 0;
int (*_be_qsort)() = 0;
int (*_be_strdup)() = 0;
int *_be_sys_nerr = 0;
char **_be_sys_errlist = 0;

