/* Prototypes for functions defined in
amigapk.c
 */

extern struct NetSupportLibrary * NetSupportBase;

void FreeSystem(void);

int main(int , unsigned char ** );

void post(unsigned char * , unsigned char * );

void warn(unsigned char * );

/* Prototypes for functions defined in
encode.c
 */

int encode(struct __iobuf * , struct __iobuf * , unsigned char * , struct __iobuf * , unsigned char * , unsigned char * , long , unsigned char * , unsigned char * );

/* Prototypes for functions defined in
codes.c
 */

int to64(struct __iobuf * , struct __iobuf * , long );

void output64chunk(int , int , int , int , struct __iobuf * );

int PendingBoundary(unsigned char * , unsigned char ** , int * );

void from64(struct __iobuf * , struct __iobuf * , unsigned char ** , int , unsigned char ** , int * );

void fromqp(struct __iobuf * , struct __iobuf * , unsigned char ** , unsigned char ** , int * );

void fromnone(struct __iobuf * , struct __iobuf * , unsigned char ** , unsigned char ** , int * );

unsigned char * md5digest(struct __iobuf * , long * );

/* Prototypes for functions defined in
magic.c
 */

unsigned char * magic_look(struct __iobuf * infile);

/* Prototypes for functions defined in
amigados.c
 */

extern int overwrite_files;

extern int __buffsize;

extern int didchat;

unsigned char * os_genid(void);

unsigned char * os_idtodir(unsigned char * );

void os_donewithdir(unsigned char * );

struct __iobuf * os_newtypedfile(unsigned char * , unsigned char * , int );

void os_warnMD5mismatch(void);

void os_perror(unsigned char * );

unsigned char * __getenv(unsigned char const * );

unsigned char * myGetConfig(unsigned char * , unsigned char * );

int os_binhex(struct __iobuf *, int, int);

int os_closetypedfile(struct __iobuf * );

/* Prototypes for functions defined in
string.c
 */

int cistrcmp(register unsigned char * s1,
             register unsigned char * s2);

int cistrncmp(register unsigned char * s1,
              register unsigned char * s2,
              int n);

/* Prototypes for functions defined in
xmalloc.c
 */

unsigned char * xmalloc(int size);

unsigned char * xrealloc(unsigned char * ptr,
                         int size);

unsigned char * strsave(unsigned char * str);

/* Prototypes for functions defined in
md5c.c
 */

void MD5Init(struct { unsigned long state[4]; unsigned long count[2]; unsigned char buffer[64];  }  * );

void MD5Update(struct { unsigned long state[4]; unsigned long count[2]; unsigned char buffer[64];  }  * , unsigned char * , unsigned int );

void MD5Final(unsigned char * , struct { unsigned long state[4]; unsigned long count[2]; unsigned char buffer[64];  }  * );

/* Prototypes for functions defined in
amigaunpk.c
 */

extern int quiet;

extern long OldDir;

extern struct NetSupportLibrary * NetSupportBase;

void FreeSystem(void);

int main(int , unsigned char ** );

void warn(unsigned char * );

void chat(unsigned char * );

/* Prototypes for functions defined in
decode.c
 */

int handleMessage(struct __iobuf * infile,
                  unsigned char * defaultContentType,
                  int inAppleDouble,
                  int extractText,
                  struct boundary * boundaries);

void SkipWhitespace(unsigned char ** s);

unsigned char * ParseHeaders(struct __iobuf * infile,
                             unsigned char ** subjectp,
                             unsigned char ** contentTypep,
                             enum encoding * contentEncodingp,

       unsigned char ** contentDispositionp,
                             unsigned char ** contentMD5p,
                             struct boundary * boundaries);

enum encoding parseEncoding(unsigned char * s);

unsigned char ** ParseContent(unsigned char ** headerp);

unsigned char * getParam(unsigned char ** cParams,
                         unsigned char * key);

unsigned char * getDispositionFilename(unsigned char * disposition);

int handlePartial(struct __iobuf * infile,
                  unsigned char * headers,
                  unsigned char ** contentParams,
                  int extractText,
                  struct boundary * boundaries);

int ignoreMessage(struct __iobuf * infile,
                  struct boundary * boundaries);

int handleMultipart(struct __iobuf * infile,
                    unsigned char * contentType,
                    unsigned char ** contentParams,
                    int extractText,
                    struct boundary * boundaries);

int handleText(struct __iobuf * infile,
               enum encoding contentEncoding,
               struct boundary * boundaries);

int saveToFile(struct __iobuf * infile,
               int inAppleDouble,
               unsigned char * contentType,
               unsigned char ** contentParams,
               enum encoding contentEncoding,
               unsigned char *
contentDisposition,
               unsigned char * contentMD5,
               struct boundary * boundaries);

/* Prototypes for functions defined in
uudecode.c
 */

int handleUuencode(struct __iobuf * infile,
                   unsigned char * subject);

int saveUuFile(struct __iobuf * infile,
               unsigned char * fname,
               int part,
               int nparts,
               unsigned char * firstline);

int parseSubject(unsigned char * subject,
                 unsigned char ** fnamep,
                 int * partp,
                 int * npartsp);

int uudecodefiles(unsigned char * dir,
                  int nparts);

void uudecodeline(unsigned char * line,
                 struct __iobuf * outfile);

