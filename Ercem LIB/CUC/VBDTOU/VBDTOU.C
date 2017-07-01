// vbdtou.c
// Conversion d'une feuille de contr“les du VB Dos en fichier C … inclure pour CUC Form
// P.VIOLENT 8/7/94


#include <stdio.h>
#include <time.h>
#include <clib.ref>


struct CTL
{
  char	szNom[32];
  char	szType[32];
  int	iTop,		iLeft;
  int	iHeight,	iWidth;
  int	iMin,		iMax;
  int	iSmallChange, iLargeChange;
  int	iDefault,	iCancel;
  int	iAlignment;
  int	iTabIndex;
  char	szParent[100];
  char	szText[100];
};

struct CTL tCtl[100];
int		nbCtl;
FILE	*fVB, *fCUC;
char	szLigne[200];
char	szPrefixeFeuille[32];
char	szPrefixeFeuilleUC[32];
char	tszParent[4][32];


char *szToUpper(char *s)
{
  int i;
  
  for (i=strlen(s) ; i-- ; )
    s[i] = toupper(s[i]);
  return s;
}

//=====================================================================

void AjouteControle(struct CTL *pCtl)
{
  fprintf(fCUC, "  %s,%*c", pCtl->szNom, 16-strlen(pCtl->szNom), ' ');
  
  if      (strcmp(pCtl->szType, "ComboBox")==0)      fprintf(fCUC, "CUCT_COMBOBOX,      ");
  else if (strcmp(pCtl->szType, "Label")==0)         fprintf(fCUC, "CUCT_LABEL,         ");
  else if (strcmp(pCtl->szType, "Frame")==0)         fprintf(fCUC, "CUCT_FRAME,         ");
  else if (strcmp(pCtl->szType, "OptionButton")==0)  fprintf(fCUC, "CUCT_OPTIONBUTTON,  ");
  else if (strcmp(pCtl->szType, "ListBox")==0)       fprintf(fCUC, "CUCT_LIST,          ");
  else if (strcmp(pCtl->szType, "TextBox")==0)       fprintf(fCUC, "CUCT_TEXTEDIT,      ");
  else if (strcmp(pCtl->szType, "CheckBox")==0)      fprintf(fCUC, "CUCT_CHECKBOX,      ");
  else if (strcmp(pCtl->szType, "CommandButton")==0) fprintf(fCUC, "CUCT_COMMANDBUTTON, ");
  else if (strcmp(pCtl->szType, "HScrollBar")==0)    fprintf(fCUC, "CUCT_HSCROLLBAR,    ");
  else if (strcmp(pCtl->szType, "VScrollBar")==0)    fprintf(fCUC, "CUCT_VSCROLLBAR,    ");
  else if (strcmp(pCtl->szType, "Form")==0)          fprintf(fCUC, "CUCT_FORM,          ");
  else fprintf(fCUC, "%-16s,   ", pCtl->szType);
  
  fprintf(fCUC, "%-2d, %-2d, %-2d, %-2d, %s,%*c%s,\n", 1+pCtl->iTop, 1+pCtl->iLeft, pCtl->iHeight, pCtl->iWidth, pCtl->szParent, 16-strlen(pCtl->szParent), ' ', pCtl->szText);
}


void InitialiseControle(struct CTL *pCtl)
{
  if (strcmp(pCtl->szType, "HScrollBar")==0 || strcmp(pCtl->szType, "VScrollBar")==0)
  {
    fprintf(fCUC, "  CUC_FormSetMinMax(f%s, %s, %d, %d, 1);\n", szPrefixeFeuille, pCtl->szNom, pCtl->iMin, pCtl->iMax);
    fprintf(fCUC, "  CUC_FormSetPropNum(f%s, %s, CUCP_SMALLCHANGE, %d);\n", szPrefixeFeuille, pCtl->szNom, pCtl->iSmallChange);
    fprintf(fCUC, "  CUC_FormSetPropNum(f%s, %s, CUCP_LARGECHANGE, %d);\n", szPrefixeFeuille, pCtl->szNom, pCtl->iLargeChange);
  }
  else if (strcmp(pCtl->szType, "CommandButton")==0)
  {
    if (pCtl->iDefault) fprintf(fCUC, "  CUC_FormSetPropNum(f%s, %s, CUCP_DEFAULT, 1);\n", szPrefixeFeuille, pCtl->szNom);
    if (pCtl->iCancel)  fprintf(fCUC, "  CUC_FormSetPropNum(f%s, %s, CUCP_CANCEL, 1);\n", szPrefixeFeuille, pCtl->szNom);
  }
  else if (strcmp(pCtl->szType, "Label")==0)
  {
    if (pCtl->iAlignment) fprintf(fCUC, "  CUC_FormSetPropNum(f%s, %s, CUCP_ALIGNMENT, %d);\n", szPrefixeFeuille, pCtl->szNom, pCtl->iAlignment);
  }
}


void GenereFeuilleUnix()
{
  int		i;
  time_t	t;
  
  fprintf(fCUC, "// %s.h\n", szPrefixeFeuille);
  t = time(0L);
  fprintf(fCUC, "// Feuille CUC g‚n‚r‚e par VBDTOU le %s\n", ctime(&t));

  fprintf(fCUC,"struct CUC_Form   *f%s;\t\t\t// Pointeur de feuille\n\n", szPrefixeFeuille);
  
  fprintf(fCUC, "#define %-16.16s 100\t\t// Base des contr“les de la feuille\n", szPrefixeFeuilleUC);
  for (i=1 ; i<nbCtl ; i++)
    fprintf(fCUC, "#define %-16.16s (%s+%d)\n", tCtl[i].szNom, szPrefixeFeuilleUC, i);
  fprintf(fCUC, "\n\n");

  fprintf(fCUC, "struct FormControl t%sControls[] =\n{\n", szPrefixeFeuille);
  for (i=0 ; i<nbCtl ; i++)
    AjouteControle(tCtl+i);
  fprintf(fCUC, "  -1\n};\n\n");
  
  fprintf(fCUC, "// Configuration initiale des contr“les\nvoid %s_InitCtrl()\n{\n", szPrefixeFeuille);
  for (i=1 ; i<nbCtl ; i++)
    InitialiseControle(tCtl+i);
  fprintf(fCUC, "};\n\n");
  
  fprintf(fCUC, "\n// Proc‚dures d'‚v‚nement\n\n");
  fprintf(fCUC, "void %s_Load()\n{\n  %s_InitCtrl();\n\n  // Initialisations diverses\n\n}\n\n", szPrefixeFeuille, szPrefixeFeuille);
  
  fprintf(fCUC, "// Sortie de secours...\n");
  fprintf(fCUC, "void %s_Key(int *piKey)\n{\n  if (*piKey==KEY_CTRL_D)\n\tCUC_FormExit(f%s);\n}\n\n", szPrefixeFeuille, szPrefixeFeuille);
  
  fprintf(fCUC, "struct FormEvent t%sEvents[] =\n{\n", szPrefixeFeuille);
  fprintf(fCUC, "  %s,           CUCE_LOAD,            %s_Load,\n", szPrefixeFeuilleUC, szPrefixeFeuille);
  fprintf(fCUC, "  %s,           CUCE_KEY,             %s_Key,\n", szPrefixeFeuilleUC, szPrefixeFeuille);
  fprintf(fCUC, "  -1\n};\n\n");
  
  fprintf(fCUC, "\n\n// Exploitation de la feuille\n\n");
  fprintf(fCUC, "void DoForm%s()\n{\n", szPrefixeFeuille);
  fprintf(fCUC, "  if (CUC_FormCreate(&f%s,t%sControls,t%sEvents,NULL)<0)\n", szPrefixeFeuille, szPrefixeFeuille, szPrefixeFeuille);
  fprintf(fCUC, "\taprintf(\"DoForm%s\", \"Echec … la cr‚ation de la grille !\");\n", szPrefixeFeuille);
  fprintf(fCUC, "  else\n  {\n\t// CUC_FormDeactivate(feuille_inferieure);\n\tCUC_FormShow(f%s);\n\n", szPrefixeFeuille);
  fprintf(fCUC, "\tCUC_FormExec(f%s);\n", szPrefixeFeuille);
  fprintf(fCUC, "\tCUC_FormDestruct(f%s);\n\t// CUC_FormActivate(feuille_inferieure);\n  }\n}\n", szPrefixeFeuille);
}

//=====================================================================

int iVal(char *szVal)
{
  if (strncmp(szVal, "Char(", 5)==0)
    return atoi(szVal+5);
  else
    return atoi(szVal);
}

void DecodeValeurs(struct CTL *pCtl, int iNiv)
{
  char	szProp[32];
  char	szVal[200];
  char	szType[32];
  char	szToken[32];
  char	szNom[32];
  
  pCtl->szNom[0] = 0;
  pCtl->iTop = pCtl->iLeft = pCtl->iHeight = pCtl->iWidth = 0;
  pCtl->iMin = pCtl->iMax = pCtl->iDefault = pCtl->iCancel = 0;
  pCtl->iSmallChange = pCtl->iLargeChange = 0;
  pCtl->iAlignment = 0;
  pCtl->iTabIndex = 0;
  
  strcpy(pCtl->szParent, tszParent[iNiv-1]);
  strcpy(pCtl->szText, "\"\"");
  
  sscanf(szLigne, " %s %s %s", szToken, szType, szNom);
  if (strcmp(szToken, "BEGIN")!=0)
  { printf("DecodeValeurs: szLigne doit commencer par BEGIN !\n");
    exit(1);
  }
  
  if (strcmp(szType, "Form")==0) szToUpper(szNom);
  
  strcpy(pCtl->szNom, szNom);
  strcpy(pCtl->szType, szType);
  
  while (fgets(szLigne, 200, fVB)!=NULL)
  {
    sscanf(szLigne, " %s = %[^\n]", szProp, szVal);
    if (strcmp(szProp, "BEGIN")==0 || strcmp(szProp, "END")==0) return;	// Fin des propri‚t‚s du contr“le ou de la feuille
    
    if (strcmp(szProp, "Top")==0)
      pCtl->iTop = iVal(szVal);
    else if (strcmp(szProp, "Left")==0)
      pCtl->iLeft = iVal(szVal);
    else if (strcmp(szProp, "Width")==0)
      pCtl->iWidth = iVal(szVal);
    else if (strcmp(szProp, "Height")==0)
    {
      pCtl->iHeight = iVal(szVal);
      if (strcmp(szType, "ComboBox")==0 && pCtl->iHeight<3)
        pCtl->iHeight = 8;
    }
    else if (strcmp(szProp, "Caption")==0 || strcmp(szProp, "Text")==0)
    {
      if (strcmp(szType, "ComboBox")==0)
        strcpy(pCtl->szText, "\"\"");
      else
        strcpy(pCtl->szText, szVal);
    }
    else if (strcmp(szProp, "Min")==0)
      pCtl->iMin = iVal(szVal);
    else if (strcmp(szProp, "Max")==0)
      pCtl->iMax = iVal(szVal);
    else if (strcmp(szProp, "Default")==0)
      pCtl->iDefault = iVal(szVal);
    else if (strcmp(szProp, "Cancel")==0)
      pCtl->iCancel = iVal(szVal);
    else if (strcmp(szProp, "SmallChange")==0)
      pCtl->iSmallChange = iVal(szVal);
    else if (strcmp(szProp, "LargeChange")==0)
      pCtl->iLargeChange = iVal(szVal);
    else if (strcmp(szProp, "Alignment")==0)
      pCtl->iAlignment = iVal(szVal);
    else if (strcmp(szProp, "TabIndex")==0)
      pCtl->iTabIndex = iVal(szVal);
  }
  
}


int cmpCtl(const struct CTL **pp1, const struct CTL **pp2)
{
  return (*pp1)->iTabIndex - (*pp2)->iTabIndex;
}


void DoConv(char *szPrefixe)
{
  char	szFeuilleVB[64];
  char	szFeuilleCUC[64];
  char	szNomParent[32];
  int	iNiv;

  if (strlen(szPrefixe)>4 && 
      ( strcmp(szPrefixe+strlen(szPrefixe)-4, ".frm")==0 ||
        strcmp(szPrefixe+strlen(szPrefixe)-4, ".FRM")==0))
    szPrefixe[strlen(szPrefixe)-4] = 0;
  
  strcat(strcpy(szFeuilleVB, szPrefixe), ".frm");  
  strcat(strcpy(szFeuilleCUC, szPrefixe), ".h");
  
  fVB = fopen(szFeuilleVB, "r");
  if (fVB==NULL)
  { fprintf(stderr, "Echec … l'ouverture de la feuille VB \"%s\": ", szFeuilleVB);
    perror("");
    return;
  }
  
  fgets(szLigne, 200, fVB);
  if (strncmp(szLigne, "Version 1", 9))
  { fprintf(stderr, "Format du fichier \"%s\" inconnu !\nLa premiŠre ligne doit commencer par \"Version 1\"\n", szFeuilleVB);
    fclose(fVB);
    return;
  }
    
  fCUC = fopen(szFeuilleCUC, "w");
  if (fCUC==NULL)
  { fprintf(stderr, "Echec … l'ouverture de la feuille CUC \"%s\": ", szFeuilleCUC);
    perror("");
    return;
  }
  
  printf("Analyse et conversion de la feuille %s -> %s\n", szFeuilleVB, szFeuilleCUC);
  nbCtl = 0;      
  iNiv = 0;
    
  fgets(szLigne, 200, fVB);
  strcpy(tszParent[0], "0");

  for (;;)	// while (!feof(fVB))
  {
    char szToken[32];
    
    sscanf(szLigne, " %s %*s %s", szToken, szNomParent);
    if (strcmp(szToken, "BEGIN")==0)
    { 
      iNiv++;
      if (iNiv==1)
      { strcpy(szPrefixeFeuille, szNomParent);
        strcpy(szPrefixeFeuilleUC, szToUpper(szNomParent));
      }
      strcpy(tszParent[iNiv], szNomParent);
    }
    else if (strcmp(szToken, "END")==0)
    {
      iNiv--;
      if (iNiv==0)
        break;
    }
    
    if (strcmp(szToken, "BEGIN")!=0)
    { fgets(szLigne, 200, fVB);
      continue;
    }
    
    DecodeValeurs(tCtl+nbCtl, iNiv);
    nbCtl++;
  }
  
  qsort(tCtl+1, nbCtl-1, sizeof(tCtl[0]), cmpCtl);
  GenereFeuilleUnix();
  
  fclose(fVB);
  fclose(fCUC);
  
  printf("Termin‚ !\n");
}


void main(int argc, char **argv)
{
  printf("vbdtou 1.0\nConversion de grille VB dos en grille CUC\n\n");
  
  if (argc!=2)
  {
    fprintf(stderr, "Usage: vbdtou fichier.frm\n");
    exit(1);
  }
  
  DoConv(argv[1]);
  exit(0);
}
