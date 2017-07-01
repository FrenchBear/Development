// ds.h
// Interface du module d'accŠs SQL Dynamique

struct Dynaset;

struct Dynaset *ds_CreateDynaset(char *szRequete);
void ds_Dump(struct Dynaset *ds);
int ds_CloseDynaset(struct Dynaset *ds);
int ds_iEOF(struct Dynaset *ds);
int ds_iGetFieldNum(struct Dynaset *ds, char *szChamp);
int ds_iGetFieldNumInd(struct Dynaset *ds, int iIndice);
char *ds_szGetFieldStr(struct Dynaset *ds, char *szChamp, char *szBuffer, int iTailleBuffer);
char *ds_szGetFieldStrInd(struct Dynaset *ds, int iIndice, char *szBuffer, int iTailleBuffer);
int ds_MoveNext(struct Dynaset *ds);

// Truc bƒtard mais pratique...
int ds_ExpressGetNum(char *szRequete);

