#line 1 "tar.c"

























#line 1 "E:\\MSVC32\\INCLUDE\\stdio.h"
























#line 26 "E:\\MSVC32\\INCLUDE\\stdio.h"
#line 27 "E:\\MSVC32\\INCLUDE\\stdio.h"



typedef unsigned int size_t;

#line 33 "E:\\MSVC32\\INCLUDE\\stdio.h"


typedef unsigned short wchar_t;

#line 38 "E:\\MSVC32\\INCLUDE\\stdio.h"


typedef wchar_t wint_t;
typedef wchar_t wctype_t;

#line 44 "E:\\MSVC32\\INCLUDE\\stdio.h"


typedef char *	va_list;

#line 49 "E:\\MSVC32\\INCLUDE\\stdio.h"
















#line 66 "E:\\MSVC32\\INCLUDE\\stdio.h"





struct _iobuf {
	char *_ptr;
	int   _cnt;
	char *_base;
	int   _flag;
	int   _file;
	int   _charbuf;
	int   _bufsiz;
	char *_tmpfname;
	};
typedef struct _iobuf FILE;

#line 84 "E:\\MSVC32\\INCLUDE\\stdio.h"






#line 91 "E:\\MSVC32\\INCLUDE\\stdio.h"































#line 123 "E:\\MSVC32\\INCLUDE\\stdio.h"
#line 124 "E:\\MSVC32\\INCLUDE\\stdio.h"





 extern FILE _iob[];
#line 131 "E:\\MSVC32\\INCLUDE\\stdio.h"





typedef long fpos_t;

#line 139 "E:\\MSVC32\\INCLUDE\\stdio.h"


























 int __cdecl _filbuf(FILE *);
 int __cdecl _flsbuf(int, FILE *);

 FILE * __cdecl _fsopen(const char *, const char *, int);

 void __cdecl clearerr(FILE *);
 int __cdecl fclose(FILE *);
 int __cdecl _fcloseall(void);
 FILE * __cdecl _fdopen(int, const char *);
 int __cdecl feof(FILE *);
 int __cdecl ferror(FILE *);
 int __cdecl fflush(FILE *);
 int __cdecl fgetc(FILE *);
 int __cdecl _fgetchar(void);
 int __cdecl fgetpos(FILE *, fpos_t *);
 char * __cdecl fgets(char *, int, FILE *);
 int __cdecl _fileno(FILE *);
 int __cdecl _flushall(void);
 FILE * __cdecl fopen(const char *, const char *);
 int __cdecl fprintf(FILE *, const char *, ...);
 int __cdecl fputc(int, FILE *);
 int __cdecl _fputchar(int);
 int __cdecl fputs(const char *, FILE *);
 size_t __cdecl fread(void *, size_t, size_t, FILE *);
 FILE * __cdecl freopen(const char *, const char *, FILE *);
 int __cdecl fscanf(FILE *, const char *, ...);
 int __cdecl fsetpos(FILE *, const fpos_t *);
 int __cdecl fseek(FILE *, long, int);
 long __cdecl ftell(FILE *);
 size_t __cdecl fwrite(const void *, size_t, size_t, FILE *);
 int __cdecl getc(FILE *);
 int __cdecl getchar(void);
 char * __cdecl gets(char *);
 int __cdecl _getw(FILE *);
 void __cdecl perror(const char *);
 int __cdecl _pclose(FILE *);
 FILE * __cdecl _popen(const char *, const char *);
 int __cdecl printf(const char *, ...);
 int __cdecl putc(int, FILE *);
 int __cdecl putchar(int);
 int __cdecl puts(const char *);
 int __cdecl _putw(int, FILE *);
 int __cdecl remove(const char *);
 int __cdecl rename(const char *, const char *);
 void __cdecl rewind(FILE *);
 int __cdecl _rmtmp(void);
 int __cdecl scanf(const char *, ...);
 void __cdecl setbuf(FILE *, char *);
 int __cdecl setvbuf(FILE *, char *, int, size_t);
 int __cdecl _snprintf(char *, size_t, const char *, ...);
 int __cdecl sprintf(char *, const char *, ...);
 int __cdecl sscanf(const char *, const char *, ...);
 char * __cdecl _tempnam(char *, char *);
 FILE * __cdecl tmpfile(void);
 char * __cdecl tmpnam(char *);
 int __cdecl ungetc(int, FILE *);
 int __cdecl _unlink(const char *);
 int __cdecl vfprintf(FILE *, const char *, va_list);
 int __cdecl vprintf(const char *, va_list);
 int __cdecl _vsnprintf(char *, size_t, const char *, va_list);
 int __cdecl vsprintf(char *, const char *, va_list);


































#line 261 "E:\\MSVC32\\INCLUDE\\stdio.h"


#line 264 "E:\\MSVC32\\INCLUDE\\stdio.h"







































#line 304 "E:\\MSVC32\\INCLUDE\\stdio.h"






#line 311 "E:\\MSVC32\\INCLUDE\\stdio.h"
#line 27 "tar.c"
#line 1 "E:\\MSVC32\\INCLUDE\\sys/types.h"















typedef long time_t;

#line 19 "E:\\MSVC32\\INCLUDE\\sys/types.h"


typedef unsigned short _ino_t;		



#line 26 "E:\\MSVC32\\INCLUDE\\sys/types.h"

#line 28 "E:\\MSVC32\\INCLUDE\\sys/types.h"


typedef unsigned int _dev_t;			



#line 35 "E:\\MSVC32\\INCLUDE\\sys/types.h"

#line 37 "E:\\MSVC32\\INCLUDE\\sys/types.h"


typedef long _off_t;			



#line 44 "E:\\MSVC32\\INCLUDE\\sys/types.h"

#line 46 "E:\\MSVC32\\INCLUDE\\sys/types.h"


#line 49 "E:\\MSVC32\\INCLUDE\\sys/types.h"
#line 28 "tar.c"
#line 1 "getopt.h"






























extern char *optarg;













extern int optind;




extern int opterr;






















struct option
{

  const char *name;


#line 80 "getopt.h"
  

  int has_arg;
  int *flag;
  int val;
};













#line 100 "getopt.h"
extern int getopt ();
#line 102 "getopt.h"
extern int getopt_long (int argc, char *const *argv, const char *shortopts,
		        const struct option *longopts, int *longind);
extern int getopt_long_only (int argc, char *const *argv,
			     const char *shortopts,
		             const struct option *longopts, int *longind);


extern int _getopt_internal (int argc, char *const *argv,
			     const char *shortopts,
		             const struct option *longopts, int *longind,
			     int long_only);






#line 120 "getopt.h"





#line 126 "getopt.h"
#line 29 "tar.c"
#line 1 "regex.h"





































typedef unsigned reg_syntax_t;


































































































extern reg_syntax_t re_syntax_options;



 














































































 

























typedef enum
{
  REG_NOERROR = 0,	
  REG_NOMATCH,		

  

  REG_BADPAT,		
  REG_ECOLLATE,		
  REG_ECTYPE,		
  REG_EESCAPE,		
  REG_ESUBREG,		
  REG_EBRACK,		
  REG_EPAREN,		 
  REG_EBRACE,		
  REG_BADBR,		
  REG_ERANGE,		
  REG_ESPACE,		
  REG_BADRPT,		

  
  REG_EEND,		
  REG_ESIZE,		
  REG_ERPAREN		
} reg_errcode_t;







struct re_pattern_buffer
{

	


  unsigned char *buffer;

	
  unsigned long allocated;

	
  unsigned long used;	

        
  reg_syntax_t syntax;

        


  char *fastmap;

        



  char *translate;

	
  size_t re_nsub;

        




  unsigned can_be_null : 1;

        






  unsigned regs_allocated : 2;

        

  unsigned fastmap_accurate : 1;

        

  unsigned no_sub : 1;

        
 
  unsigned not_bol : 1;

        
  unsigned not_eol : 1;

        
  unsigned newline_anchor : 1;


};

typedef struct re_pattern_buffer regex_t;







typedef int regoff_t;




struct re_registers
{
  unsigned num_regs;
  regoff_t *start;
  regoff_t *end;
};







#line 373 "regex.h"





typedef struct
{
  regoff_t rm_so;  
  regoff_t rm_eo;  
} regmatch_t;

















#line 401 "regex.h"



extern reg_syntax_t re_set_syntax (reg_syntax_t syntax);




extern const char *re_compile_pattern
  
(const char *pattern, int length, struct re_pattern_buffer *buffer);





extern int re_compile_fastmap (struct re_pattern_buffer *buffer);







extern int re_search
  
(struct re_pattern_buffer *buffer, const char *string, int length, int start, int range, struct re_registers *regs);




extern int re_search_2
  

(struct re_pattern_buffer *buffer, const char *string1, int length1, const char *string2, int length2, int start, int range, struct re_registers *regs, int stop);




extern int re_match
  
(struct re_pattern_buffer *buffer, const char *string, int length, int start, struct re_registers *regs);



extern int re_match_2 
  

(struct re_pattern_buffer *buffer, const char *string1, int length1, const char *string2, int length2, int start, struct re_registers *regs, int stop);














extern void re_set_registers
  
(struct re_pattern_buffer *buffer, struct re_registers *regs, unsigned num_regs, regoff_t *starts, regoff_t *ends);


extern char *re_comp (const char *);
extern int re_exec (const char *);


extern int regcomp (regex_t *preg, const char *pattern, int cflags);
extern int regexec
  
(const regex_t *preg, const char *string, size_t nmatch, regmatch_t pmatch[], int eflags);
extern size_t regerror
  
(int errcode, const regex_t *preg, char *errbuf, size_t errbuf_size);
extern void regfree (regex_t *preg);

#line 483 "regex.h"








#line 30 "tar.c"






#line 1 "tar.h"



















#line 1 "testpad.h"

#line 21 "tar.h"































struct sparse
  {
    char offset[12];
    char numbytes[12];
  };

struct sp_array
  {
    int offset;
    int numbytes;
  };

union record
  {
    char charptr[512];
    struct header
      {
	char arch_name[100];
	char mode[8];
	char uid[8];
	char gid[8];
	char size[12];
	char mtime[12];
	char chksum[8];
	char linkflag;
	char arch_linkname[100];
	char magic[8];
	char uname[32];
	char gname[32];
	char devmajor[8];
	char devminor[8];
	
	
	char atime[12];
	char ctime[12];
	char offset[12];
	char longnames[4];

	char pad;
#line 92 "tar.h"
	struct sparse sp[4];
	char isextended;
	char realsize[12];	
	

      }
    header;
    struct extended_header
      {
	struct sparse sp[21];
	char isextended;
      }
    ext_hdr;
  };






















































 union record *ar_block;	
 union record *ar_record;	
 union record *ar_last;	
 char ar_reading;	
 int blocking;	
 int blocksize;	
 char *info_script;	
 char *name_file;	
 char filename_terminator;	
 char *tar;		
 struct sp_array *sparsearray;	
 int sp_array_size;	
 int tot_written;	
 struct re_pattern_buffer
 *label_pattern;		
 char **ar_files;	
 int n_ar_files;	
 int cur_ar_file;	
 int ar_files_len;	
 char *current_file_name, *current_link_name;




 int cmd_mode;












 int f_reblock;	


#line 201 "tar.h"
 int f_run_script_at_end;	
 int f_gnudump;	
 int f_follow_links;	
 int f_ignorez;	
 int f_keep;		
 int f_startfile;	
 int f_local_filesys;	
 int tape_length;	
 int f_modified;	
 int f_multivol;	
 int f_new_files;	
 int f_oldarch;	
 int f_exstdout;	
 int f_use_protection;
 int f_absolute_paths;
 int f_sayblock;	
 int f_sorted_names;	
 int f_sparse_files;	
 int f_namefile;	
 int f_verbose;	
 char *f_volhdr;	
 int f_confirm;	
 int f_verify;	
 int f_exclude;	
 char *f_compressprog;	
 int f_do_chown;	
 int f_totals;	
 int f_remove_files;	
 int f_ignore_failed_read;	
 int f_checkpoint;	
 int f_show_omitted_dirs;	
 char *f_volno_file;	
 int f_force_local;	
 int f_atime_preserve;
 int f_compress_block; 
















struct name
  {
    struct name *next;
    short length;		
    char found;			
    char firstch;		
    char regexp;		
    char *change_dir;		
    char *dir_contents;		
    char fake;			
    char name[1];
  };

 struct name *namelist;	
 struct name *namelast;	

 int archive;		
 int errors;		

 char *gnu_dumpfile;




 char read_error_flag;





union record *findrec ();
void userec ();
union record *endofrecs ();
void anno ();


void msg (char *,...);
void msg_perror (char *,...);



#line 294 "tar.h"
#line 37 "tar.c"

#line 1 "port.h"

























#line 27 "port.h"



char *alloca ();
#line 32 "port.h"
#line 33 "port.h"
#line 34 "port.h"

#line 1 "pathmax.h"





























#line 31 "pathmax.h"



#line 35 "pathmax.h"



#line 39 "pathmax.h"




#line 44 "pathmax.h"



#line 48 "pathmax.h"



#line 52 "pathmax.h"

#line 54 "pathmax.h"
#line 36 "port.h"











#line 48 "port.h"




#line 53 "port.h"











typedef long off_t;
#line 66 "port.h"






#line 73 "port.h"




#line 78 "port.h"




#line 83 "port.h"




#line 88 "port.h"









#line 1 "E:\\MSVC32\\INCLUDE\\string.h"





















































 void * __cdecl _memccpy(void *, const void *, int, unsigned int);
 void * __cdecl memchr(const void *, int, size_t);
	int __cdecl memcmp(const void *, const void *, size_t);
 int __cdecl _memicmp(const void *, const void *, unsigned int);
	void * __cdecl memcpy(void *, const void *, size_t);
 void * __cdecl memmove(void *, const void *, size_t);
	void * __cdecl memset(void *, int, size_t);
	char * __cdecl strcat(char *, const char *);
 char * __cdecl strchr(const char *, int);
	int __cdecl strcmp(const char *, const char *);
 int __cdecl _strcmpi(const char *, const char *);
 int __cdecl _stricmp(const char *, const char *);
 int __cdecl strcoll(const char *, const char *);
 int __cdecl _stricoll(const char *, const char *);
	char * __cdecl strcpy(char *, const char *);
 size_t __cdecl strcspn(const char *, const char *);
 char * __cdecl _strdup(const char *);
 char * __cdecl _strerror(const char *);
 char * __cdecl strerror(int);
	size_t __cdecl strlen(const char *);
 char * __cdecl _strlwr(char *);
 char * __cdecl strncat(char *, const char *, size_t);
 int __cdecl strncmp(const char *, const char *, size_t);
 int __cdecl _strnicmp(const char *, const char *, size_t);
 char * __cdecl strncpy(char *, const char *, size_t);
 char * __cdecl _strnset(char *, int, size_t);
 char * __cdecl strpbrk(const char *, const char *);
 char * __cdecl strrchr(const char *, int);
 char * __cdecl _strrev(char *);
	char * __cdecl _strset(char *, int);
 size_t __cdecl strspn(const char *, const char *);
 char * __cdecl strstr(const char *, const char *);
 char * __cdecl strtok(char *, const char *);
 char * __cdecl _strupr(char *);
 size_t __cdecl strxfrm (char *, const char *, size_t);


 wchar_t * __cdecl wcscat(wchar_t *, const wchar_t *);
 wchar_t * __cdecl wcschr(const wchar_t *, wchar_t);
 int __cdecl wcscmp(const wchar_t *, const wchar_t *);
 wchar_t * __cdecl wcscpy(wchar_t *, const wchar_t *);
 size_t __cdecl wcscspn(const wchar_t *, const wchar_t *);
 size_t __cdecl wcslen(const wchar_t *);
 wchar_t * __cdecl wcsncat(wchar_t *, const wchar_t *, size_t);
 int __cdecl wcsncmp(const wchar_t *, const wchar_t *, size_t);
 wchar_t * __cdecl wcsncpy(wchar_t *, const wchar_t *, size_t);
 wchar_t * __cdecl wcspbrk(const wchar_t *, const wchar_t *);
 wchar_t * __cdecl wcsrchr(const wchar_t *, wchar_t);
 size_t __cdecl wcsspn(const wchar_t *, const wchar_t *);
 wchar_t * __cdecl wcsstr(const wchar_t *, const wchar_t *);
 wchar_t * __cdecl wcstok(wchar_t *, const wchar_t *);

 wchar_t * __cdecl _wcsdup(const wchar_t *);
 int __cdecl _wcsicmp(const wchar_t *, const wchar_t *);
 int __cdecl _wcsnicmp(const wchar_t *, const wchar_t *, size_t);
 wchar_t * __cdecl _wcsnset(wchar_t *, wchar_t, size_t);
 wchar_t * __cdecl _wcsrev(wchar_t *);
 wchar_t * __cdecl _wcsset(wchar_t *, wchar_t);

 wchar_t * __cdecl _wcslwr(wchar_t *);
 wchar_t * __cdecl _wcsupr(wchar_t *);
 size_t __cdecl wcsxfrm(wchar_t *, const wchar_t *, size_t);
 int __cdecl wcscoll(const wchar_t *, const wchar_t *);
 int __cdecl _wcsicoll(const wchar_t *, const wchar_t *);





#line 124 "E:\\MSVC32\\INCLUDE\\string.h"























#line 148 "E:\\MSVC32\\INCLUDE\\string.h"






#line 155 "E:\\MSVC32\\INCLUDE\\string.h"
#line 98 "port.h"


#line 101 "port.h"













#line 115 "port.h"


#line 1 "E:\\MSVC32\\INCLUDE\\stdlib.h"




























































typedef int (__cdecl * _onexit_t)(void);



#line 66 "E:\\MSVC32\\INCLUDE\\stdlib.h"

#line 68 "E:\\MSVC32\\INCLUDE\\stdlib.h"






typedef struct _div_t {
	int quot;
	int rem;
} div_t;

typedef struct _ldiv_t {
	long quot;
	long rem;
} ldiv_t;


#line 86 "E:\\MSVC32\\INCLUDE\\stdlib.h"










 extern int __mb_cur_max;
#line 98 "E:\\MSVC32\\INCLUDE\\stdlib.h"

























 extern int errno;			
 extern unsigned long _doserrno; 	
#line 126 "E:\\MSVC32\\INCLUDE\\stdlib.h"

 extern char * _sys_errlist[];		
 extern int _sys_nerr;			

 extern int __argc;		
 extern char ** __argv;		

 extern char ** _environ;	

 extern int _fmode;		
 extern int _fileinfo;		

 extern char * _pgmptr;		



 extern unsigned int _osver;
 extern unsigned int _winver;
 extern unsigned int _winmajor;
 extern unsigned int _winminor;



 void   __cdecl abort(void);
	int __cdecl abs(int);
	int    __cdecl atexit(void (__cdecl *)(void));
 double __cdecl atof(const char *);
 int    __cdecl atoi(const char *);
 long   __cdecl atol(const char *);
 void * __cdecl bsearch(const void *, const void *, size_t, size_t,
	int (__cdecl *)(const void *, const void *));
 void * __cdecl calloc(size_t, size_t);
 div_t  __cdecl div(int, int);
 void   __cdecl exit(int);
 void   __cdecl free(void *);
 char * __cdecl getenv(const char *);
 char * __cdecl _itoa(int, char *, int);
	long __cdecl labs(long);
 ldiv_t __cdecl ldiv(long, long);
 char * __cdecl _ltoa(long, char *, int);
 void * __cdecl malloc(size_t);
 int    __cdecl mblen(const char *, size_t);
 size_t __cdecl _mbstrlen(const char *s);
 int    __cdecl mbtowc(wchar_t *, const char *, size_t);
 size_t __cdecl mbstowcs(wchar_t *, const char *, size_t);
 void   __cdecl qsort(void *, size_t, size_t, int (__cdecl *)
	(const void *, const void *));
 int    __cdecl rand(void);
 void * __cdecl realloc(void *, size_t);
 void   __cdecl srand(unsigned int);
 double __cdecl strtod(const char *, char **);
 long   __cdecl strtol(const char *, char **, int);
 unsigned long __cdecl strtoul(const char *, char **, int);
 int    __cdecl system(const char *);
 char * __cdecl _ultoa(unsigned long, char *, int);
 int    __cdecl wctomb(char *, wchar_t);
 size_t __cdecl wcstombs(char *, const wchar_t *, size_t);









#line 193 "E:\\MSVC32\\INCLUDE\\stdlib.h"

 char * __cdecl _ecvt(double, int, int *, int *);
 void   __cdecl _exit(int);
 char * __cdecl _fcvt(double, int, int *, int *);
 char * __cdecl _fullpath(char *, const char *, size_t);
 char * __cdecl _gcvt(double, int, char *);
	unsigned long __cdecl _lrotl(unsigned long, int);
	unsigned long __cdecl _lrotr(unsigned long, int);
 void   __cdecl _makepath(char *, const char *, const char *, const char *,
	const char *);
	_onexit_t __cdecl _onexit(_onexit_t);
 void   __cdecl perror(const char *);
 int    __cdecl _putenv(const char *);
	unsigned int __cdecl _rotl(unsigned int, int);
	unsigned int __cdecl _rotr(unsigned int, int);
 void   __cdecl _searchenv(const char *, const char *, char *);
 void   __cdecl _splitpath(const char *, char *, char *, char *, char *);
 void   __cdecl _swab(char *, char *, int);


 int __cdecl tolower(int);
#line 215 "E:\\MSVC32\\INCLUDE\\stdlib.h"


 int __cdecl toupper(int);
#line 219 "E:\\MSVC32\\INCLUDE\\stdlib.h"































#line 251 "E:\\MSVC32\\INCLUDE\\stdlib.h"
#line 118 "port.h"



#line 122 "port.h"



#line 1 "E:\\MSVC32\\INCLUDE\\io.h"

































typedef unsigned long _fsize_t; 

#line 37 "E:\\MSVC32\\INCLUDE\\io.h"



struct _finddata_t {
    unsigned	attrib;
    time_t	time_create;	
    time_t	time_access;	
    time_t	time_write;
    _fsize_t	size;
    char	name[260];
};


#line 51 "E:\\MSVC32\\INCLUDE\\io.h"












 int __cdecl _access(const char *, int);
 int __cdecl _chmod(const char *, int);
 int __cdecl _chsize(int, long);
 int __cdecl _close(int);
 int __cdecl _commit(int);
 int __cdecl _creat(const char *, int);
 int __cdecl _dup(int);
 int __cdecl _dup2(int, int);
 int __cdecl _eof(int);
 long __cdecl _filelength(int);
 long __cdecl _findfirst(char *, struct _finddata_t *);
 int __cdecl _findnext(long, struct _finddata_t *);
 int __cdecl _findclose(long);
 int __cdecl _isatty(int);
 int __cdecl _locking(int, int, long);
 long __cdecl _lseek(int, long, int);
 char * __cdecl _mktemp(char *);
 int __cdecl _open(const char *, int, ...);
 int __cdecl _pipe(int *, unsigned int, int);
 int __cdecl _read(int, void *, unsigned int);
 int __cdecl remove(const char *);
 int __cdecl rename(const char *, const char *);
 int __cdecl _setmode(int, int);
 int __cdecl _sopen(const char *, int, int, ...);
 long __cdecl _tell(int);
 int __cdecl _umask(int);
 int __cdecl _unlink(const char *);
 int __cdecl _write(int, const void *, unsigned int);


 long __cdecl _get_osfhandle(int);
 int __cdecl _open_osfhandle(long, int);
























#line 120 "E:\\MSVC32\\INCLUDE\\io.h"






#line 127 "E:\\MSVC32\\INCLUDE\\io.h"
#line 126 "port.h"


#line 129 "port.h"
char *getcwd ();
#line 131 "port.h"







#line 139 "port.h"


#line 142 "port.h"


#line 145 "port.h"


#line 148 "port.h"


#line 151 "port.h"

#line 1 "E:\\MSVC32\\INCLUDE\\sys/stat.h"




























#line 1 "E:\\MSVC32\\INCLUDE\\sys/types.h"
















































#line 30 "E:\\MSVC32\\INCLUDE\\sys/stat.h"












#pragma pack(push,4)
#line 44 "E:\\MSVC32\\INCLUDE\\sys/stat.h"

struct _stat {
	_dev_t st_dev;
	_ino_t st_ino;
	unsigned short st_mode;
	short st_nlink;
	short st_uid;
	short st_gid;
	_dev_t st_rdev;
	_off_t st_size;
	time_t st_atime;
	time_t st_mtime;
	time_t st_ctime;
	};



















#line 78 "E:\\MSVC32\\INCLUDE\\sys/stat.h"


#pragma pack(pop)
#line 82 "E:\\MSVC32\\INCLUDE\\sys/stat.h"


#line 85 "E:\\MSVC32\\INCLUDE\\sys/stat.h"













 int __cdecl _fstat(int, struct _stat *);
 int __cdecl _stat(const char *, struct _stat *);
















#line 117 "E:\\MSVC32\\INCLUDE\\sys/stat.h"






#line 124 "E:\\MSVC32\\INCLUDE\\sys/stat.h"
#line 153 "port.h"


#line 156 "port.h"


#line 159 "port.h"


#line 162 "port.h"


#line 165 "port.h"


#line 168 "port.h"



#line 172 "port.h"


#line 175 "port.h"


#line 178 "port.h"



#line 182 "port.h"


#line 185 "port.h"


#line 188 "port.h"


#line 191 "port.h"


#line 1 "msd_dir.h"













typedef int ino_t;
typedef int dev_t;
#line 17 "msd_dir.h"

struct dirent
  {
    ino_t d_ino;		
    int d_reclen;		
    int d_namlen;		
    char d_name[12 + 1];	
  };

struct _dircontents
  {
    char *_d_entry;
    struct _dircontents *_d_next;
  };

typedef struct _dirdesc
  {
    int dd_id;			
    long dd_loc;		
    struct _dircontents *dd_contents;	
    struct _dircontents *dd_cp;	
  } DIR;

extern DIR *opendir ();
extern struct dirent *readdir ();
extern void seekdir ();
extern long telldir ();
extern void closedir ();
#line 194 "port.h"





















#line 216 "port.h"
#line 39 "tar.c"
#line 1 "fnmatch.h"

































#line 35 "fnmatch.h"










#line 46 "fnmatch.h"






extern int fnmatch 
(const char *__pattern, const char *__string, int __flags);





#line 60 "fnmatch.h"
#line 40 "tar.c"






void * ck_malloc ();
void * ck_realloc ();
extern int getoldopt ();
extern void read_and ();
extern void list_archive ();
extern void extract_archive ();
extern void diff_archive ();
extern void create_archive ();
extern void update_archive ();
extern void junk_archive ();
extern void init_volume_number ();
extern void closeout_volume_number ();


extern time_t get_date ();

time_t new_time;

static FILE *namef;		
static char **n_argv;		
static int n_argc;		
static char **n_ind;		
static int n_indalloc;		
static int n_indused;		
static int n_indscan;		


extern FILE *msg_file;

int check_exclude ();
void add_exclude ();
void add_exclude_file ();
void addname ();
void describe ();
void diff_init ();
void extr_init ();
int is_regex ();
void name_add ();
void name_init ();
void options ();
char *un_quote_string ();



#line 91 "tar.c"



#line 95 "tar.c"



#line 99 "tar.c"








struct option long_options[] =
{
  {"create", 0, 0, 'c'},
  {"append", 0, 0, 'r'},
  {"extract", 0, 0, 'x'},
  {"get", 0, 0, 'x'},
  {"list", 0, 0, 't'},
  {"update", 0, 0, 'u'},
  {"catenate", 0, 0, 'A'},
  {"concatenate", 0, 0, 'A'},
  {"compare", 0, 0, 'd'},
  {"diff", 0, 0, 'd'},
  {"delete", 0, 0, 14},
  {"help", 0, 0, 12},

  {"null", 0, 0, 16},
  {"directory", 1, 0, 'C'},
  {"record-number", 0, &f_sayblock, 1},
  {"files-from", 1, 0, 'T'},
  {"label", 1, 0, 'V'},
  {"exclude-from", 1, 0, 'X'},
  {"exclude", 1, 0, 15},
  {"file", 1, 0, 'f'},
  {"block-size", 1, 0, 'b'},
  {"version", 0, 0, 11},
  {"verbose", 0, 0, 'v'},
  {"totals", 0, &f_totals, 1},

  {"read-full-blocks", 0, &f_reblock, 1},
  {"starting-file", 1, 0, 'K'},
  {"to-stdout", 0, &f_exstdout, 1},
  {"ignore-zeros", 0, &f_ignorez, 1},
  {"keep-old-files", 0, 0, 'k'},
  {"same-permissions", 0, &f_use_protection, 1},
  {"preserve-permissions", 0, &f_use_protection, 1},
  {"modification-time", 0, &f_modified, 1},
  {"preserve", 0, 0, 10},
  {"same-order", 0, &f_sorted_names, 1},
  {"same-owner", 0, &f_do_chown, 1},
  {"preserve-order", 0, &f_sorted_names, 1},

  {"newer", 1, 0, 'N'},
  {"after-date", 1, 0, 'N'},
  {"newer-mtime", 1, 0, 13},
  {"incremental", 0, 0, 'G'},
  {"listed-incremental", 1, 0, 'g'},
  {"multi-volume", 0, &f_multivol, 1},
  {"info-script", 1, 0, 'F'},
  {"new-volume-script", 1, 0, 'F'},
  {"absolute-paths", 0, &f_absolute_paths, 1},
  {"interactive", 0, &f_confirm, 1},
  {"confirmation", 0, &f_confirm, 1},

  {"verify", 0, &f_verify, 1},
  {"dereference", 0, &f_follow_links, 1},
  {"one-file-system", 0, &f_local_filesys, 1},
  {"old-archive", 0, 0, 'o'},
  {"portability", 0, 0, 'o'},
  {"compress", 0, 0, 'Z'},
  {"uncompress", 0, 0, 'Z'},
  {"block-compress", 0, &f_compress_block, 1},
  {"gzip", 0, 0, 'z'},
  {"ungzip", 0, 0, 'z'},
  {"use-compress-program", 1, 0, 18},
    

  {"same-permissions", 0, &f_use_protection, 1},
  {"sparse", 0, &f_sparse_files, 1},
  {"tape-length", 1, 0, 'L'},
  {"remove-files", 0, &f_remove_files, 1},
  {"ignore-failed-read", 0, &f_ignore_failed_read, 1},
  {"checkpoint", 0, &f_checkpoint, 1},
  {"show-omitted-dirs", 0, &f_show_omitted_dirs, 1},
  {"volno-file", 1, 0, 17},
  {"force-local", 0, &f_force_local, 1},
  {"atime-preserve", 0, &f_atime_preserve, 1},

  {0, 0, 0, 0}
};




void
_main (argc, argv)
     int argc;
     char **argv;
{
  extern char version_string[];

  tar = argv[0];		
  filename_terminator = '\n';
  errors = 0;

  options (argc, argv);

  if (!n_argv)
    name_init (argc, argv);

  if (f_volno_file)
    init_volume_number ();

  switch (cmd_mode)
    {
    case 1:
    case 6:
    case 4:
      update_archive ();
      break;
    case 8:
      junk_archive ();
      break;
    case 2:
      create_archive ();
      if (f_totals)
	fprintf ((&_iob[2]), "Total bytes written: %d\n", tot_written);
      break;
    case 7:
      if (f_volhdr)
	{
	  const char *err;
	  label_pattern = (struct re_pattern_buffer *)
	    ck_malloc (sizeof *label_pattern);
	  err = re_compile_pattern (f_volhdr, strlen (f_volhdr),
				    label_pattern);
	  if (err)
	    {
	      fprintf ((&_iob[2]), "Bad regular expression: %s\n",
		       err);
	      errors++;
	      break;
	    }

	}
      extr_init ();
      read_and (extract_archive);
      break;
    case 5:
      if (f_volhdr)
	{
	  const char *err;
	  label_pattern = (struct re_pattern_buffer *)
	    ck_malloc (sizeof *label_pattern);
	  err = re_compile_pattern (f_volhdr, strlen (f_volhdr),
				    label_pattern);
	  if (err)
	    {
	      fprintf ((&_iob[2]), "Bad regular expression: %s\n",
		       err);
	      errors++;
	      break;
	    }
	}
      read_and (list_archive);



#line 265 "tar.c"
      break;
    case 3:
      diff_init ();
      read_and (diff_archive);
      break;
    case 9:
      fprintf ((&_iob[2]), "%s\n", version_string);
      break;
    case 0:
      msg ("you must specify exactly one of the r, c, t, x, or d options\n");
      fprintf ((&_iob[2]), "For more information, type ``%s --help''.\n", tar);
      exit (1);
    }
  if (f_volno_file)
    closeout_volume_number ();
  exit (errors);
  
}





void
options (argc, argv)
     int argc;
     char **argv;
{
  register int c;		
  int ind = -1;

  
  blocking = 20;	
  ar_files = (char **) ck_malloc (sizeof (char *) * 10);
  ar_files_len = 10;
  n_ar_files = 0;
  cur_ar_file = 0;

  
  while ((c = getoldopt (argc, argv,
	       "-01234567Ab:BcC:df:F:g:GhikK:lL:mMN:oOpPrRsStT:uvV:wWxX:zZ",
			 long_options, &ind)) != (-1))
    {
      switch (c)
	{
	case 0:		
	  break;
	case 1:
	  
	  name_add (optarg);
	  break;
	case 'C':
	  name_add ("-C");
	  name_add (optarg);
	  break;
	case 10:		
	  f_use_protection = f_sorted_names = 1;
	  break;
	case 11:
	  if (cmd_mode != 0)
	    goto badopt;
	  cmd_mode = 9;
	  break;
	case 12:		
	  printf ("This is GNU tar, the tape archiving program.\n");
	  describe ();
	  exit (1);
	case 13:
	  f_new_files++;
	  goto get_newer;

	case 14:		
	  if (cmd_mode != 0)
	    goto badopt;
	  cmd_mode = 8;
	  break;

	case 15:
	  f_exclude++;
	  add_exclude (optarg);
	  break;

	case 16:		
	  filename_terminator = '\0';
	  break;

	case 17:
	  f_volno_file = optarg;
	  break;

	case 18:
	  if (f_compressprog)
	    {
	      msg ("Only one compression option permitted\n");
	      exit (1);
	    }
	  f_compressprog = optarg;
	  break;

	case 'g':		



	  if (f_oldarch)
	    goto badopt;
	  f_gnudump++;
	  gnu_dumpfile = optarg;
	  break;


	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	  {
	    

	    int d, add;
	    static char buf[50];

	    d = getoldopt (argc, argv, "lmh");







#line 398 "tar.c"
	    if (d == 'l')
	      add = 0;
	    else if (d == 'm')
	      add = 8;
	    else if (d == 'h')
	      add = 16;
	    else
	      goto badopt;

	    sprintf (buf, "/dev/rmt%d", add + c - '0');
#line 409 "tar.c"
	    if (n_ar_files == ar_files_len)
	      ar_files
		= (char **)
		ck_malloc (sizeof (char *)
			   * (ar_files_len *= 2));
	    ar_files[n_ar_files++] = buf;
	  }
	  break;

	case 'A':		


	  if (cmd_mode != 0)
	    goto badopt;
	  cmd_mode = 1;
	  break;

	case 'b':		
	  blocking = atoi (optarg);
	  break;

	case 'B':		
	  f_reblock++;		
	  break;

	case 'c':		
	  if (cmd_mode != 0)
	    goto badopt;
	  cmd_mode = 2;
	  break;






#line 446 "tar.c"

	case 'd':		
	  if (cmd_mode != 0)
	    goto badopt;
	  cmd_mode = 3;
	  break;

	case 'f':		
	  if (n_ar_files == ar_files_len)
	    ar_files
	      = (char **) ck_malloc (sizeof (char *)
				     * (ar_files_len *= 2));

	  ar_files[n_ar_files++] = optarg;
	  break;

	case 'F':
	  
	  f_run_script_at_end++;
	  info_script = optarg;	
	  f_multivol++;
	  break;

	case 'G':		



	  if (f_oldarch)
	    goto badopt;
	  f_gnudump++;
	  gnu_dumpfile = 0;
	  break;

	case 'h':
	  f_follow_links++;	
	  break;

	case 'i':
	  f_ignorez++;		
	  




	  break;

	case 'k':		




	  f_keep++;
#line 499 "tar.c"
	  break;

	case 'K':
	  f_startfile++;
	  addname (optarg);
	  break;

	case 'l':		


	  f_local_filesys++;
	  break;

	case 'L':
	  tape_length = atoi (optarg);
	  f_multivol++;
	  break;
	case 'm':
	  f_modified++;
	  break;

	case 'M':		



	  f_multivol++;
	  break;

	case 'N':		
	get_newer:
	  f_new_files++;
	  new_time = get_date (optarg, (void *) 0);
	  if (new_time == (time_t) - 1)
	    {
	      msg ("invalid date format `%s'", optarg);
	      exit (1);
	    }
	  break;

	case 'o':		
	  if (f_gnudump  )
	    goto badopt;
	  f_oldarch++;
	  break;

	case 'O':
	  f_exstdout++;
	  break;

	case 'p':
	  f_use_protection++;
	  break;

	case 'P':
	  f_absolute_paths++;
	  break;

	case 'r':		
	  if (cmd_mode != 0)
	    goto badopt;
	  cmd_mode = 4;
	  break;

	case 'R':
	  f_sayblock++;		
	  break;		

	case 's':
	  f_sorted_names++;	
	  break;

	case 'S':		
	  f_sparse_files++;
	  break;
	case 't':
	  if (cmd_mode != 0)
	    goto badopt;
	  cmd_mode = 5;
	  f_verbose++;		
	  break;

	case 'T':
	  name_file = optarg;
	  f_namefile++;
	  break;

	case 'u':		


	  if (cmd_mode != 0)
	    goto badopt;
	  cmd_mode = 6;
	  break;

	case 'v':
	  f_verbose++;
	  break;

	case 'V':
	  f_volhdr = optarg;
	  break;

	case 'w':
	  f_confirm++;
	  break;

	case 'W':
	  f_verify++;
	  break;

	case 'x':		
	  if (cmd_mode != 0)
	    goto badopt;
	  cmd_mode = 7;
	  break;

	case 'X':
	  f_exclude++;
	  add_exclude_file (optarg);
	  break;

	case 'z':
	  if (f_compressprog)
	    {
	      msg ("Only one compression option permitted\n");
	      exit (1);
	    }
	  f_compressprog = "gzip";
	  break;

	case 'Z':
	  if (f_compressprog)
	    {
	      msg ("Only one compression option permitted\n");
	      exit (1);
	    }
	  f_compressprog = "compress";
	  break;

	case '?':
	badopt:
	  msg ("Unknown option.  Use '%s --help' for a complete list of options.", tar);
	  exit (1);

	}
    }

  blocksize = blocking * 512;
  if (n_ar_files == 0)
    {
      n_ar_files = 1;
      ar_files[0] = getenv ("TAPE");	
      if (ar_files[0] == 0)
	ar_files[0] = "tar.out";	
    }
  if (n_ar_files > 1 && !f_multivol)
    {
      msg ("Multiple archive files requires --multi-volume\n");
      exit (1);
    }
  if (f_compress_block && !f_compressprog)
    {
      msg ("You must use a compression option (--gzip, --compress\n\
or --use-compress-program) with --block-compress.\n");
      exit (1);
    }
}










void
describe ()
{
  puts ("choose one of the following:");
  fputs ("\
-A, --catenate,\n\
    --concatenate	append tar files to an archive\n\
-c, --create		create a new archive\n\
-d, --diff,\n\
    --compare		find differences between archive and file system\n\
--delete		delete from the archive (not for use on mag tapes!)\n\
-r, --append		append files to the end of an archive\n\
-t, --list		list the contents of an archive\n\
-u, --update		only append files that are newer than copy in archive\n\
-x, --extract,\n\
    --get		extract files from an archive\n", (&_iob[1]));

  fprintf ((&_iob[1]), "\
Other options:\n\
--atime-preserve	don't change access times on dumped files\n\
-b, --block-size N	block size of Nx512 bytes (default N=%d)\n", 20);
  fputs ("\
-B, --read-full-blocks	reblock as we read (for reading 4.2BSD pipes)\n\
-C, --directory DIR	change to directory DIR\n\
--checkpoint		print directory names while reading the archive\n\
", (&_iob[1]));			
  fprintf ((&_iob[1]), "\
-f, --file [HOSTNAME:]F	use archive file or device F (default %s)\n",
	   "tar.out");
  fputs ("\
--force-local		archive file is local even if has a colon\n\
-F, --info-script F\n\
    --new-volume-script F run script at end of each tape (implies -M)\n\
-G, --incremental	create/list/extract old GNU-format incremental backup\n\
-g, --listed-incremental F create/list/extract new GNU-format incremental backup\n\
-h, --dereference	don't dump symlinks; dump the files they point to\n\
-i, --ignore-zeros	ignore blocks of zeros in archive (normally mean EOF)\n\
--ignore-failed-read	don't exit with non-zero status on unreadable files\n\
-k, --keep-old-files	keep existing files; don't overwrite them from archive\n\
-K, --starting-file F	begin at file F in the archive\n\
-l, --one-file-system	stay in local file system when creating an archive\n\
-L, --tape-length N	change tapes after writing N*1024 bytes\n\
", (&_iob[1]));			
  fputs ("\
-m, --modification-time	don't extract file modified time\n\
-M, --multi-volume	create/list/extract multi-volume archive\n\
-N, --after-date DATE,\n\
    --newer DATE	only store files newer than DATE\n\
-o, --old-archive,\n\
    --portability	write a V7 format archive, rather than ANSI format\n\
-O, --to-stdout		extract files to standard output\n\
-p, --same-permissions,\n\
    --preserve-permissions extract all protection information\n\
-P, --absolute-paths	don't strip leading `/'s from file names\n\
--preserve		like -p -s\n\
", (&_iob[1]));			
  fputs ("\
-R, --record-number	show record number within archive with each message\n\
--remove-files		remove files after adding them to the archive\n\
-s, --same-order,\n\
    --preserve-order	list of names to extract is sorted to match archive\n\
--same-owner		create extracted files with the same ownership \n\
-S, --sparse		handle sparse files efficiently\n\
-T, --files-from F	get names to extract or create from file F\n\
--null			-T reads null-terminated names, disable -C\n\
--totals		print total bytes written with --create\n\
-v, --verbose		verbosely list files processed\n\
-V, --label NAME	create archive with volume name NAME\n\
--version		print tar program version number\n\
-w, --interactive,\n\
    --confirmation	ask for confirmation for every action\n\
", (&_iob[1]));			
  fputs ("\
-W, --verify		attempt to verify the archive after writing it\n\
--exclude FILE		exclude file FILE\n\
-X, --exclude-from FILE	exclude files listed in FILE\n\
-Z, --compress,\n\
    --uncompress      	filter the archive through compress\n\
-z, --gzip,\n\
    --ungzip		filter the archive through gzip\n\
--use-compress-program PROG\n\
			filter the archive through PROG (which must accept -d)\n\
--block-compress	block the output of compression program for tapes\n\
-[0-7][lmh]		specify drive and density\n\
", (&_iob[1]));
}

void
name_add (name)
     char *name;
{
  if (n_indalloc == n_indused)
    {
      n_indalloc += 10;
      n_ind = (char **) (n_indused ? ck_realloc (n_ind, n_indalloc * sizeof (char *)): ck_malloc (n_indalloc * sizeof (char *)));
    }
  n_ind[n_indused++] = name;
}






void
name_init (argc, argv)
     int argc;
     char **argv;
{

  if (f_namefile)
    {
      if (optind < argc)
	{
	  msg ("too many args with -T option");
	  exit (1);
	}
      if (!strcmp (name_file, "-"))
	{
	  namef = (&_iob[0]);
	}
      else
	{
	  namef = fopen (name_file, "r");
	  if (namef == ((void *)0))
	    {
	      msg_perror ("can't open file %s", name_file);
	      exit (2);
	    }
	}
    }
  else
    {
      
      n_argc = argc;
      n_argv = argv;
    }
}





char *
read_name_from_file (buffer, pbuffer_size, stream)
     char *buffer;
     size_t *pbuffer_size;
     FILE *stream;
{
  register int c;
  register int indx = 0;
  register size_t buffer_size = *pbuffer_size;

  while ((c = (--(stream)->_cnt >= 0 ? 0xff & *(stream)->_ptr++ : _filbuf(stream))) != (-1) && c != filename_terminator)
    {
      if (indx == buffer_size)
	{
	  buffer_size += 100;
	  buffer = ck_realloc (buffer, buffer_size + 2);
	}
      buffer[indx++] = c;
    }
  if (indx == 0 && c == (-1))
    return ((void *)0);
  if (indx == buffer_size)
    {
      buffer_size += 100;
      buffer = ck_realloc (buffer, buffer_size + 2);
    }
  buffer[indx] = '\0';
  *pbuffer_size = buffer_size;
  return buffer;
}











char *
name_next (change_dirs)
     int change_dirs;
{
  static char *buffer;		
  static int buffer_siz;
  register char *p;
  register char *q = 0;
  register int next_name_is_dir = 0;
  extern char *un_quote_string ();

  if (buffer_siz == 0)
    {
      buffer = ck_malloc (100 + 2);
      buffer_siz = 100;
    }
  if (filename_terminator == '\0')
    change_dirs = 0;
tryagain:
  if (namef == ((void *)0))
    {
      if (n_indscan < n_indused)
	p = n_ind[n_indscan++];
      else if (optind < n_argc)
	
	p = n_argv[optind++];
      else
	{
	  if (q)
	    msg ("Missing filename after -C");
	  return ((void *)0);
	}

      


      if (change_dirs && !q && p[0] == '-' && p[1] == 'C' && p[2] == '\0')
	{
	  q = p;
	  goto tryagain;
	}
      if (q)
	{
	  if (chdir (p) < 0)
	    msg_perror ("Can't chdir to %s", p);
	  q = 0;
	  goto tryagain;
	}
      




#line 914 "tar.c"
      return un_quote_string (p);
    }
  while (p = read_name_from_file (buffer, &buffer_siz, namef))
    {
      buffer = p;
      if (*p == '\0')
	continue;		
      q = p + strlen (p) - 1;
      while (q > p && *q == '/')
	*q-- = '\0';
      if (change_dirs && next_name_is_dir == 0
	  && p[0] == '-' && p[1] == 'C' && p[2] == '\0')
	{
	  next_name_is_dir = 1;
	  goto tryagain;
	}
      if (next_name_is_dir)
	{
	  if (chdir (p) < 0)
	    msg_perror ("Can't change to directory %s", p);
	  next_name_is_dir = 0;
	  goto tryagain;
	}



#line 941 "tar.c"
      return un_quote_string (p);
    }
  return ((void *)0);
}





void
name_close ()
{

  if (namef != ((void *)0) && namef != (&_iob[0]))
    fclose (namef);
}













void
name_gather ()
{
  register char *p;
  static struct name *namebuf;	
  static namelen;
  static char *chdir_name;

  if (f_sorted_names)
    {
      if (!namelen)
	{
	  namelen = 100;
	  namebuf = (struct name *) ck_malloc (sizeof (struct name) + 100);
	}
      p = name_next (0);
      if (p)
	{
	  if (*p == '-' && p[1] == 'C' && p[2] == '\0')
	    {
	      chdir_name = name_next (0);
	      p = name_next (0);
	      if (!p)
		{
		  msg ("Missing file name after -C");
		  exit (1);
		}
	      namebuf->change_dir = chdir_name;
	    }
	  namebuf->length = strlen (p);
	  if (namebuf->length >= namelen)
	    {
	      namebuf = (struct name *) ck_realloc (namebuf, sizeof (struct name) + namebuf->length);
	      namelen = namebuf->length;
	    }
	  strncpy (namebuf->name, p, namebuf->length);
	  namebuf->name[namebuf->length] = 0;
	  namebuf->next = (struct name *) ((void *)0);
	  namebuf->found = 0;
	  namelist = namebuf;
	  namelast = namelist;
	}
      return;
    }

  
  while (p = name_next (0))
    addname (p);
}




void
addname (name)
     char *name;		
{
  register int i;		
  register struct name *p;	
  static char *chdir_name;
  char *new_name ();

  if (name[0] == '-' && name[1] == 'C' && name[2] == '\0')
    {
      chdir_name = name_next (0);
      name = name_next (0);
      if (!chdir_name)
	{
	  msg ("Missing file name after -C");
	  exit (1);
	}
      if (chdir_name[0] != '/')
	{
	  char *path = ck_malloc (255);

	  if (!getcwd (path, 255))
	    {
	      msg ("Couldn't get current directory.");
	      exit (4);
	    }








#line 1059 "tar.c"
	  chdir_name = new_name (path, chdir_name);
	  free (path);
	}
    }

  if (name)
    {
      i = strlen (name);
      
      p = (struct name *) malloc ((unsigned) (sizeof (struct name) + i));
    }
  else
    p = (struct name *) malloc ((unsigned) (sizeof (struct name)));
  if (!p)
    {
      if (name)
	msg ("cannot allocate mem for name '%s'.", name);
      else
	msg ("cannot allocate mem for chdir record.");
      exit (4);
    }
  p->next = (struct name *) ((void *)0);
  if (name)
    {
      p->fake = 0;
      p->length = i;
      strncpy (p->name, name, i);
      p->name[i] = '\0';	
    }
  else
    p->fake = 1;
  p->found = 0;
  p->regexp = 0;		
  p->firstch = 1;		
  p->change_dir = chdir_name;
  p->dir_contents = 0;		
  if (name)
    {
      if (strchr (name, '*') || strchr (name, '[') || strchr (name, '?'))
	{
	  p->regexp = 1;	
	  if (name[0] == '*' || name[0] == '[' || name[0] == '?')
	    p->firstch = 0;	
	}
    }

  if (namelast)
    namelast->next = p;
  namelast = p;
  if (!namelist)
    namelist = p;
}





int
name_match (p)
     register char *p;
{
  register struct name *nlp;
  register int len;

again:
  if (0 == (nlp = namelist))	
    return 1;
  if (nlp->fake)
    {
      if (nlp->change_dir && chdir (nlp->change_dir))
	msg_perror ("Can't change to directory %d", nlp->change_dir);
      namelist = 0;
      return 1;
    }
  len = strlen (p);
  for (; nlp != 0; nlp = nlp->next)
    {
      
      if (nlp->firstch && nlp->name[0] != p[0])
	continue;

      
      if (nlp->regexp)
	{
	  if (fnmatch (nlp->name, p, (1 << 3)) == 0)
	    {
	      nlp->found = 1;	
	      if (f_startfile)
		{
		  free ((void *) namelist);
		  namelist = 0;
		}
	      if (nlp->change_dir && chdir (nlp->change_dir))
		msg_perror ("Can't change to directory %s", nlp->change_dir);
	      return 1;		
	    }
	  continue;
	}

      
      if (nlp->length <= len	
	  && (p[nlp->length] == '\0' || p[nlp->length] == '/')
      
	  && strncmp (p, nlp->name, nlp->length) == 0)	
	{
	  nlp->found = 1;	
	  if (f_startfile)
	    {
	      free ((void *) namelist);
	      namelist = 0;
	    }
	  if (nlp->change_dir && chdir (nlp->change_dir))
	    msg_perror ("Can't change to directory %s", nlp->change_dir);
	  return 1;		
	}
    }

  






  if (f_sorted_names && namelist->found)
    {
      name_gather ();		
      if (!namelist->found)
	goto again;
    }
  return 0;
}





void
names_notfound ()
{
  register struct name *nlp, *next;
  register char *p;

  for (nlp = namelist; nlp != 0; nlp = next)
    {
      next = nlp->next;
      if (!nlp->found)
	msg ("%s not found in archive", nlp->name);

      









    }
  namelist = (struct name *) ((void *)0);
  namelast = (struct name *) ((void *)0);

  if (f_sorted_names)
    {
      while (0 != (p = name_next (1)))
	msg ("%s not found in archive", p);
    }
}



void
name_expand ()
{
  ;
}






struct name *
name_scan (p)
     register char *p;
{
  register struct name *nlp;
  register int len;

again:
  if (0 == (nlp = namelist))	
    return 0;
  len = strlen (p);
  for (; nlp != 0; nlp = nlp->next)
    {
      
      if (nlp->firstch && nlp->name[0] != p[0])
	continue;

      
      if (nlp->regexp)
	{
	  if (fnmatch (nlp->name, p, (1 << 3)) == 0)
	    return nlp;		
	  continue;
	}

      
      if (nlp->length <= len	
	  && (p[nlp->length] == '\0' || p[nlp->length] == '/')
      
	  && strncmp (p, nlp->name, nlp->length) == 0)	
	return nlp;		
    }

  






  if (f_sorted_names && namelist->found)
    {
      name_gather ();		
      if (!namelist->found)
	goto again;
    }
  return (struct name *) 0;
}





struct name *gnu_list_name;

char *
name_from_list ()
{
  if (!gnu_list_name)
    gnu_list_name = namelist;
  while (gnu_list_name && gnu_list_name->found)
    gnu_list_name = gnu_list_name->next;
  if (gnu_list_name)
    {
      gnu_list_name->found++;
      if (gnu_list_name->change_dir)
	if (chdir (gnu_list_name->change_dir) < 0)
	  msg_perror ("can't chdir to %s", gnu_list_name->change_dir);
      return gnu_list_name->name;
    }
  return (char *) 0;
}

void
blank_name_list ()
{
  struct name *n;

  gnu_list_name = 0;
  for (n = namelist; n; n = n->next)
    n->found = 0;
}

char *
new_name (path, name)
     char *path, *name;
{
  char *path_buf;

  path_buf = (char *) malloc (strlen (path) + strlen (name) + 2);
  if (path_buf == 0)
    {
      msg ("Can't allocate memory for name '%s/%s", path, name);
      exit (4);
    }
  (void) sprintf (path_buf, "%s/%s", path, name);
  return path_buf;
}



int
confirm (action, file)
     char *action, *file;
{
  int c, nl;
  static FILE *confirm_file = 0;
  extern FILE *msg_file;
  extern char TTY_NAME[];

  fprintf (msg_file, "%s %s?", action, file);
  fflush (msg_file);
  if (!confirm_file)
    {
      confirm_file = (archive == 0) ? fopen (TTY_NAME, "r") : (&_iob[0]);
      if (!confirm_file)
	{
	  msg ("Can't read confirmation from user");
	  exit (4);
	}
    }
  c = (--(confirm_file)->_cnt >= 0 ? 0xff & *(confirm_file)->_ptr++ : _filbuf(confirm_file));
  for (nl = c; nl != '\n' && nl != (-1); nl = (--(confirm_file)->_cnt >= 0 ? 0xff & *(confirm_file)->_ptr++ : _filbuf(confirm_file)))
    ;
  return (c == 'y' || c == 'Y');
}

char *x_buffer = 0;
int size_x_buffer;
int free_x_buffer;

char **exclude = 0;
int size_exclude = 0;
int free_exclude = 0;

char **re_exclude = 0;
int size_re_exclude = 0;
int free_re_exclude = 0;

void
add_exclude (name)
     char *name;
{
  
  
  int size_buf;

  un_quote_string (name);
  size_buf = strlen (name);

  if (x_buffer == 0)
    {
      x_buffer = (char *) ck_malloc (size_buf + 1024);
      free_x_buffer = 1024;
    }
  else if (free_x_buffer <= size_buf)
    {
      char *old_x_buffer;
      char **tmp_ptr;

      old_x_buffer = x_buffer;
      x_buffer = (char *) ck_realloc (x_buffer, size_x_buffer + 1024);
      free_x_buffer = 1024;
      for (tmp_ptr = exclude; tmp_ptr < exclude + size_exclude; tmp_ptr++)
	*tmp_ptr = x_buffer + ((*tmp_ptr) - old_x_buffer);
      for (tmp_ptr = re_exclude; tmp_ptr < re_exclude + size_re_exclude; tmp_ptr++)
	*tmp_ptr = x_buffer + ((*tmp_ptr) - old_x_buffer);
    }

  if (is_regex (name))
    {
      if (free_re_exclude == 0)
	{
	  re_exclude = (char **) (re_exclude ? ck_realloc (re_exclude, (size_re_exclude + 32) * sizeof (char *)): ck_malloc (sizeof (char *) * 32));
	  free_re_exclude += 32;
	}
      re_exclude[size_re_exclude] = x_buffer + size_x_buffer;
      size_re_exclude++;
      free_re_exclude--;
    }
  else
    {
      if (free_exclude == 0)
	{
	  exclude = (char **) (exclude ? ck_realloc (exclude, (size_exclude + 32) * sizeof (char *)): ck_malloc (sizeof (char *) * 32));
	  free_exclude += 32;
	}
      exclude[size_exclude] = x_buffer + size_x_buffer;
      size_exclude++;
      free_exclude--;
    }
  strcpy (x_buffer + size_x_buffer, name);
  size_x_buffer += size_buf + 1;
  free_x_buffer -= size_buf + 1;
}

void
add_exclude_file (file)
     char *file;
{
  FILE *fp;
  char buf[1024];

  if (strcmp (file, "-"))
    fp = fopen (file, "r");
  else
    
    

    fp = (&_iob[0]);

  if (!fp)
    {
      msg_perror ("can't open %s", file);
      exit (2);
    }
  while (fgets (buf, 1024, fp))
    {
      
      char *end_str;

      end_str = strrchr (buf, '\n');
      if (end_str)
	*end_str = '\0';
      add_exclude (buf);

    }
  fclose (fp);
}

int
is_regex (str)
     char *str;
{
  return strchr (str, '*') || strchr (str, '[') || strchr (str, '?');
}


int
check_exclude (name)
     char *name;
{
  int n;
  char *str;
  extern char *strstr ();

  for (n = 0; n < size_re_exclude; n++)
    {
      if (fnmatch (re_exclude[n], name, (1 << 3)) == 0)
	return 1;
    }
  for (n = 0; n < size_exclude; n++)
    {
      


      if ((str = strstr (name, exclude[n]))
	  && (str == name || str[-1] == '/')
	  && str[strlen (exclude[n])] == '\0')
	return 1;
    }
  return 0;
}
