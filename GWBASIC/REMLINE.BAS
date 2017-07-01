'
'   Microsoft RemLine - Utilitaire de suppression de num‚ros de ligne
'   Copyright (C) Microsoft Corporation 1985-1991
'
'   REMLINE.BAS est un programme qui supprime les num‚ros de ligne d'un
'   programme Microsoft Basic. Il ne supprime les num‚ros que pour les
'   lignes qui ne sont pas r‚f‚renc‚es par les instructions suivantes :
'   GOSUB, RETURN, GOTO, THEN, ELSE, RESUME, RESTORE ou RUN.
'
'   Lorsque REMLINE est ex‚cut‚, vous devez entrer le nom di fichier …
'   traiter et le fichier ou le p‚riph‚rique sur lequel le r‚sultat doit
'   ˆtre envoy‚. Si aucune extension n'est pr‚cis‚e, l'extension .BAS
'   est adopt‚e par d‚faut (sauf pour les p‚riph‚riques de sortie). Si
'   aucun nom de fichier n'est pr‚cis‚, REMLINE vous demande les noms de
'   fichier. Si les fichiers source et cible sont les mˆmes, REMLINE
'   sauvegarde le fichier source avec l'extension .BAK.
'
'   REMLINE fait plusieurs suppositions … propos du programme :
'
'     1. Sa syntaxe doit ˆtre correcte et il doit fonctionner sous
'        l'interpr‚teur BASICA ou GW-BASIC.
'     2. La limite est de 400 lignes. Pour traiter des fichiers plus
'        longs, modifiez la constante MaxLines.
'     3. Le premier nombre rencontr‚ sur une ligne est consid‚r‚ comme
'        un num‚ro de ligne. Les lignes de suite (sp‚cifiques … certains
'        compilateurs) peuvent ne pas ˆtre trait‚es correctement.
'     4. REMLINE peut traiter des expressions simples qui testent la
'        focntion ERL avec des op‚rateurs relationnels tels que =, <
'        et >. Par exemple, l'instruction suivante est trait‚e correctement :
'
'             IF ERL = 100 THEN END
'
'        Le num‚ro de ligne 100 n'est pas supprim‚e du fichier source.
'        Les expressions plus complexes qui contiennent les op‚rateurs
'        +, -, AND, OR, XOR, EQV, MOD ou IMP. Par exemple, dans
'        l'instruction suivante, REMLINE ne considŠre pas la ligne 105
'        comme r‚f‚renc‚e et la supprime du fichier source :
'
'             IF ERL + 5 = 105 THEN END
'
'   Si vous n'aimez pas la fa‡on dont REMLINE formate sa sortie, vous
'   pouvez modifier les lignes de sortie dans la proc‚dure SUB GenOutFile.
'   Un exemple est pr‚sent‚ dans les commentaires.
DEFINT A-Z

' D‚clarations de fonctions et de proc‚dures
DECLARE FUNCTION GetToken$ (Search$, Delim$)
DECLARE FUNCTION StrSpn% (InString$, Separator$)
DECLARE FUNCTION StrBrk% (InString$, Separator$)
DECLARE FUNCTION IsDigit% (Char$)
DECLARE SUB GetFileNames ()
DECLARE SUB BuildTable ()
DECLARE SUB GenOutFile ()
DECLARE SUB InitKeyTable ()

' Donn‚es globales et constantes
CONST TRUE = -1
CONST false = 0
CONST MaxLines = 400

DIM SHARED LineTable!(MaxLines)
DIM SHARED LineCount
DIM SHARED Seps$, InputFile$, OutputFile$, TmpFile$

' Donn‚es pour la recherche des mots-cl‚
CONST KeyWordCount = 9
DIM SHARED KeyWordTable$(KeyWordCount)

KeyData:
   DATA THEN, ELSE, GOSUB, GOTO, RESUME, RETURN, RESTORE, RUN, ERL, ""

' D‚but du code niveau module
   Seps$ = " ,:=<>()" + CHR$(9)
   InitKeyTable
   GetFileNames
   ON ERROR GOTO FileErr1
   OPEN InputFile$ FOR INPUT AS 1
   ON ERROR GOTO 0
   COLOR 7: PRINT "Analyse"; : COLOR 23: PRINT " . . .": COLOR 7: PRINT
   BuildTable
   CLOSE #1
   OPEN InputFile$ FOR INPUT AS 1
   ON ERROR GOTO FileErr2
   OPEN OutputFile$ FOR OUTPUT AS 2
   ON ERROR GOTO 0
   GenOutFile
   CLOSE #1, #2
   IF OutputFile$ <> "CON" THEN CLS

END

FileErr1:
   CLS
   PRINT "      Nom de fichier non valide ": PRINT
   INPUT "      Fichier d'entr‚e (ENTREE pour quitter): ", InputFile$
   IF InputFile$ = "" THEN END
FileErr2:
   INPUT "      Fichier de sortie (ENTREE pour sortie ‚cran) :", OutputFile$
   PRINT
   IF (OutputFile$ = "") THEN OutputFile$ = "CON"
   IF TmpFile$ = "" THEN
      RESUME
   ELSE
      TmpFile$ = ""
      RESUME NEXT
   END IF

'
' BuildTable:
'   Examine tout le fichier texte et recherche les num‚ros de ligne
'   r‚f‚renc‚s par GOTO, GOSUB etc. Chaque num‚ro de ligne trouv‚
'   est entr‚ dans une table des num‚ros de ligne. Cette table est
'   utilis‚e lors d'un seconde passe (voir GenOutFile), o— les
'   num‚ros de ligne non r‚f‚renc‚s sont supprim‚s.
' Entr‚e :
'   Utilise variables globales KeyWordTable$, KeyWordCount et Seps$
' Sortie :
'   Modifie LineTable! et LineCount
'
SUB BuildTable STATIC

   DO WHILE NOT EOF(1)
      ' Lire ligne et extraire premier token
      LINE INPUT #1, InLin$
      Token$ = GetToken$(InLin$, Seps$)
      DO WHILE (Token$ <> "")
         FOR KeyIndex = 1 TO KeyWordCount
            ' Voir si token est un mot-cl‚
            IF (KeyWordTable$(KeyIndex) = UCASE$(Token$)) THEN
               ' Extraire num‚ro de ligne ‚ventuel aprŠs token
               Token$ = GetToken$("", Seps$)
               ' V‚rifier chaque token pour voir si num‚ro de ligne
               ' (LOOP n‚cessaire cas plusieurs num‚ros de ligne pour
               ' ON GOSUB ou ON GOTO). Token non num‚rique implique
               ' fin de recherche.
               DO WHILE (IsDigit(LEFT$(Token$, 1)))
                  LineCount = LineCount + 1
                  LineTable!(LineCount) = VAL(Token$)
                  Token$ = GetToken$("", Seps$)
                  IF Token$ <> "" THEN KeyIndex = 0
               LOOP
            END IF
         NEXT KeyIndex
         ' Token suivant
         Token$ = GetToken$("", Seps$)
      LOOP
   LOOP

END SUB

'
' GenOutFile:
'  G‚nŠre un fichier de sortie avec les num‚ros de ligne non r‚f‚renc‚s.
' Entr‚e :
'  Utilise globals LineTable!, LineCount, and Seps$
' Sortie :
'  Fichier trait‚
'
SUB GenOutFile STATIC

   ' ///Speed up by eliminating comma and colon (can't separate first token)
   Sep$ = " " + CHR$(9)
   DO WHILE NOT EOF(1)
      LINE INPUT #1, InLin$
      IF (InLin$ <> "") THEN
         ' Extrait premier token et le traite si num‚ro de ligne
         Token$ = GetToken$(InLin$, Sep$)
         IF IsDigit(LEFT$(Token$, 1)) THEN
            LineNumber! = VAL(Token$)
            FoundNumber = false
            ' V‚rifie si num‚ro de ligne dans tables des num‚ros de ligne
            FOR index = 1 TO LineCount
               IF (LineNumber! = LineTable!(index)) THEN
                  FoundNumber = TRUE
               END IF
            NEXT index
            ' Modifie ligne
            IF (NOT FoundNumber) THEN
               Token$ = SPACE$(LEN(Token$))
               MID$(InLin$, StrSpn(InLin$, Sep$), LEN(Token$)) = Token$
            END IF
              
            ' Vous pouvez remplacer les lignes pr‚c‚dentes par votre
            ' code de sortie pour changer le format de sortie.
            ' Par exemple :
               
            'TmpPos1 = StrSpn(InLin$, Sep$) + LEN(Token$)
            'TmpPos2 = TmpPos1 + StrSpn(MID$(InLin$, TmpPos1), Sep$)
            '
            'IF FoundNumber THEN
            '   InLin$ = LEFT$(InLin$, TmpPos1 - 1) + CHR$(9) + MID$(InLin$, TmpPos2)
            'ELSE
            '   InLin$ = CHR$(9) + MID$(InLin$, TmpPos2)
            'END IF

         END IF
      END IF
      ' Envoie la ligne sur fichier ou … l'‚cran
      IF OutputFile$ = "CON" THEN
         PRINT InLin$
      ELSE
         PRINT #2, InLin$
      END IF
   LOOP

END SUB

'
' GetFileNames:
'  Obtient nom de fichier de l'utilisateur.
' Entr‚e :
'  Entr‚e utilisateur
' Sortie :
'  D‚finit InputFiles$ et OutputFiles$
'
SUB GetFileNames STATIC

    CLS
    PRINT " Microsoft RemLine: Utilitaire de suppression de num‚ros de ligne"
    PRINT "       (.BAS par d‚faut si pas de fichier sp‚cifi‚)"
    PRINT
    INPUT "      Fichier d'entr‚e (ENTREE pour quitter): ", InputFile$
    IF InputFile$ = "" THEN END
    INPUT "      Fichier de sortie (ENTREE pour sortie ‚cran): ", OutputFile$
    PRINT
    IF (OutputFile$ = "") THEN OutputFile$ = "CON"

   IF INSTR(InputFile$, ".") = 0 THEN
      InputFile$ = InputFile$ + ".BAS"
   END IF

   IF INSTR(OutputFile$, ".") = 0 THEN
      SELECT CASE OutputFile$
         CASE "CON", "SCRN", "PRN", "COM1", "COM2", "LPT1", "LPT2", "LPT3"
            EXIT SUB
         CASE ELSE
            OutputFile$ = OutputFile$ + ".BAS"
      END SELECT
   END IF

   DO WHILE InputFile$ = OutputFile$
      TmpFile$ = LEFT$(InputFile$, INSTR(InputFile$, ".")) + "BAK"
      ON ERROR GOTO FileErr1
      NAME InputFile$ AS TmpFile$
      ON ERROR GOTO 0
      IF TmpFile$ <> "" THEN InputFile$ = TmpFile$
   LOOP

END SUB

'
' GetToken$:
'  Extrait les tokens d'une chaŒne. Un token est un mot entour‚ de
'  s‚parateurs, tels que des espaces ou des virgules. Les tokens sont
'  extraits lors de l'analyse de ligne ou de commande. Pour utiliser
'  GetToken$, passez-lui la chaŒne … analyser lors du premier appel.
'  Ensuite, passez une chaŒne vide pour les appels suivant, jusqu'…
'  ce que la focntion retourne une chaŒne vide pour indiquer que toute
'  la chŒne a ‚t‚ analys‚e.
' Entr‚e :
'  Search$ = chaŒne … analyser
'  Delim$  = chaŒne de s‚parateurs
' Sortie :
'  GetToken$ = token suivant
'
FUNCTION GetToken$ (Search$, Delim$) STATIC

   ' SaveStr$ et BegPos doivent ˆtre statiques
   ' (les autres variables sont statiques pour raisons d'efficacit‚).
   ' Lors du premier appel, copier la chaŒne
   IF (Search$ <> "") THEN
      BegPos = 1
      SaveStr$ = Search$
   END IF
  
   ' Trouver le d‚but du token suivant
   NewPos = StrSpn(MID$(SaveStr$, BegPos, LEN(SaveStr$)), Delim$)
   IF NewPos THEN
      ' Position = d‚but du token
      BegPos = NewPos + BegPos - 1
   ELSE
      ' Si pas de token, quitter et retourner chaŒne vide
      GetToken$ = ""
      EXIT FUNCTION
   END IF

   ' Trouver la fin du token
   NewPos = StrBrk(MID$(SaveStr$, BegPos, LEN(SaveStr$)), Delim$)
   IF NewPos THEN
      ' position = fin du token
      NewPos = BegPos + NewPos - 1
   ELSE
      ' Si pas de fin de token, positionner en fin de chaŒne
      NewPos = LEN(SaveStr$) + 1
   END IF
   ' Extraire token de la chaŒne
   GetToken$ = MID$(SaveStr$, BegPos, NewPos - BegPos)
   ' Fixer nouvelle position de d‚part
   BegPos = NewPos

END FUNCTION

'
' InitKeyTable:
'  Initialise la table des mots-cl‚. Les mots-cl‚ doivent ˆtre
'  reconnus pour distinguer les num‚ros de ligne des constantes
'  num‚riques.
' Entr‚e :
'  Utilise KeyData
' Sortie :
'  Modifie le tableau global KeyWordTable$
'
SUB InitKeyTable STATIC

   RESTORE KeyData
   FOR Count = 1 TO KeyWordCount
      READ KeyWord$
      KeyWordTable$(Count) = KeyWord$
   NEXT

END SUB

'
' IsDigit:
'  Retourne valeur 'vrai' si le caractŠre pass‚ est un chiffre d‚cimal.
'  Comme tout token Basic commen‡ant par un chiffre est un nombre, la
'  fonction se contente de v‚rifier le premier chiffre. Ne v‚rifie pas
'  les nombres n‚gatifs, non n‚cessaire.
' Entr‚e :
'  Char$ - premier caractŠre de la chaŒne … analyser
' Sortie :
'  IsDigit - vrai si compris entre 0 et 9
'
FUNCTION IsDigit (Char$) STATIC

   IF (Char$ = "") THEN
      IsDigit = false
   ELSE
      CharAsc = ASC(Char$)
      IsDigit = (CharAsc >= ASC("0")) AND (CharAsc <= ASC("9"))
   END IF

END FUNCTION

'
' StrBrk:
'  Analyse Instring$ pour trouver le premier caractŠre parmi ceux dans
'  Separator$. Retourne l'indice de ce caractŠre. Cette fonction peut
'  ˆtre utilis‚e pour trouver la fin d'un token.
' Entr‚e :
'  InString$ = chaŒne … analyser
'  Separator$ = caractŠres … rechercher
' Sortie :
'  StrBrk = indice du premier caractŠre trouv‚, 0 si aucun
'
FUNCTION StrBrk (InString$, Separator$) STATIC

   Ln = LEN(InString$)
   BegPos = 1
   ' Recherche la fin du token (premier car. d‚limiteur)
   DO WHILE INSTR(Separator$, MID$(InString$, BegPos, 1)) = 0
      IF BegPos > Ln THEN
         StrBrk = 0
         EXIT FUNCTION
      ELSE
         BegPos = BegPos + 1
      END IF
   LOOP
   StrBrk = BegPos
  
END FUNCTION

'
' StrSpn:
'  Analyse InString$ pour trouver le premier caractŠre qui n'est pas
'  dans ceux de Separator$. Retourne l'indice de caractŠre. Cette
'  focntion peut ˆtre utilis‚e pour trouver le d‚but d'un token.
' Entr‚e :
'  InString$ = chaŒne … analyser
'  Separator$ = caractŠres … rechercher
' Sortie :
'  StrSpn = indice du premier caractŠre  qui n'est pas dans InString$
'           or 0 si tous dans Instring$
'
FUNCTION StrSpn% (InString$, Separator$) STATIC

   Ln = LEN(InString$)
   BegPos = 1
   ' Recherche d‚but de token (carac. non s‚parateur)
   DO WHILE INSTR(Separator$, MID$(InString$, BegPos, 1))
      IF BegPos > Ln THEN
         StrSpn = 0
         EXIT FUNCTION
      ELSE
         BegPos = BegPos + 1
      END IF
   LOOP
   StrSpn = BegPos

END FUNCTION
