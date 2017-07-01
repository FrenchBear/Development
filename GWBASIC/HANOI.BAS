DEFINT A-Z
DECLARE SUB Init ()
DECLARE SUB DisplayGameScreen ()
DECLARE SUB MakeMoves (NumMoves%)
DECLARE SUB DisplayMove ()
DECLARE SUB INCR (x%)
DECLARE SUB DECR (x%)
'ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
'³   This  program demostrates a recursive version of the popular "Towers    ³
'³ of Hanoi" game.                                                           ³
'³                                                                           ³
'³      In order to run this program do the following:                       ³
'³        1. Load Turbo Basic by typing TB at the DOS prompt.                ³
'³        2. Load the file HANOI.BAS from the Load option of the File        ³
'³           pulldown menu.                                                  ³
'³        3. Select Run from the Main menu                                   ³
'ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

'$STACK 32767 ' allocate plenty of stack space since it's a recursive program

KX% = 1    ' named constants used for indexing and screen positioning
KY% = 0
PromptLine% = 24   ' named constant indicating line for all user prompts
MaxDisks% = 13     ' named constant indicating maximum number of disks
CursorOff% = 0

' global variable declarations
DIM NumberOfDisks%(MaxDisks% + 1), SourceTower%(MaxDisks% + 1)
DIM TargetTower%(MaxDisks% + 1), Disk$(MaxDisks% + 1)
DIM DisksPosition%(MaxDisks%, 1), TowerHeight%(3)

NumberOfMoves% = 0               ' used to keep track of number of moves made
BottomLine% = 24                 ' used to indicate bottom line of display
TowerBase% = 2


' start of main program
CALL Init

' initialize the array of disks
FOR x% = 1 TO NumberOfDisks%(1)        ' for the number of disks
  Disk$(x%) = STRING$(26, 32) ' fill the array with spaces
  ' put the correct size disk in the array element
  ' 219  ( Û ) is character used to make disks
  MID$(Disk$(x%), MaxDisks% + 1 - x%, x% * 2 - 1) = STRING$(30, 219)
NEXT x%

' display the initial disks
Top% = TowerBase% - NumberOfDisks%(1)
FOR x% = 1 TO NumberOfDisks%(1)
  DisksPosition%(x%, KY%) = Top% + x%     ' assign row display
  DisksPosition%(x%, KX%) = 1             ' assign column display
  LOCATE Top% + x%, 1, CursorOff%' position cursor
  COLOR x% MOD 14 + 1, 0      ' change color
  PRINT Disk$(x%);            ' display the current disk
NEXT x%

CALL DisplayGameScreen         ' display game screen

TowerHeight%(1) = Top%              ' initialize global variables
TowerHeight%(2) = TowerBase%
TowerHeight%(3) = TowerBase%
SourceTower%(1) = 1
TargetTower%(1) = 3
RecursionDepth% = 0

LOCATE 1, 1, CursorOff%: PRINT "Start time: "; TIME$

CALL MakeMoves(NumberOfMoves%) ' start game

LOCATE 2, 1, CursorOff%: PRINT "Stop time : "; TIME$

LOCATE PromptLine%, 26, CursorOff%
PRINT "DONE IN"; NumberOfMoves%; "MOVES";

END  ' end of program

DEFSNG A-Z
SUB DECR (x%)
  x% = x% - 1
END SUB

DEFINT A-Z
SUB DisplayGameScreen  ' This procedure displays a message on the screen
  SHARED NumberOfDisks%(), TowerBase%   ' indicate which global vars we need
  SHARED CursorOff%, KX%

  LOCATE 1, 26, CursorOff%              ' position the cursor and turn it on
  COLOR 4, 0                            ' set the display color
  PRINT "TOWERS OF HANOI FOR"; NumberOfDisks%(1); "DISKS"
  LOCATE TowerBase% + 1, KX%, CursorOff%   ' position the cursor
  COLOR 1, 0                              ' set the display color
  PRINT STRING$(80, 176);                 ' display a bar on the screen
  COLOR 7, 0                              ' set the display color
END SUB  ' end procedure DisplayGameScreen

SUB DisplayMove
  ' specify the global variables we need
  SHARED Column%, RecursionDepth%, NumberOfDisks%(), SourceTower%()
  SHARED TowerHeight%(), DisksPosition%()
  SHARED TargetTower%(), Disk$()
  SHARED KX%, KY%, CursorOff%

  ' based on current tower, set display column
  IF TargetTower%(RecursionDepth%) = 1 THEN
    Column% = 1
  ELSEIF TargetTower%(RecursionDepth%) = 2 THEN
    Column% = 27
  ELSEIF TargetTower%(RecursionDepth%) = 3 THEN
    Column% = 54
  END IF

  ' go to the position of the next disk to move
  LOCATE DisksPosition%(NumberOfDisks%(RecursionDepth%), KY%), DisksPosition%(NumberOfDisks%(RecursionDepth%), KX%), CursorOff%
  COLOR 7, 0
  PRINT SPACE$(26)      ' erase current disk

  ' increment the height of the tower the disk is moving to
  INCR TowerHeight%(SourceTower%(RecursionDepth%))

  ' position cursor at top of destination tower
  LOCATE TowerHeight%(TargetTower%(RecursionDepth%)), Column%, CursorOff%

  ' get the color
  COLOR NumberOfDisks%(RecursionDepth%) MOD 14 + 1, 0
  PRINT Disk$(NumberOfDisks%(RecursionDepth%));   ' display the disk

  COLOR 7, 0

  ' update the current position of this disk
  DisksPosition%(NumberOfDisks%(RecursionDepth%), KY%) = TowerHeight%(TargetTower%(RecursionDepth%))
  DisksPosition%(NumberOfDisks%(RecursionDepth%), KX%) = Column%

  ' decrement the height of the tower the disk came from
  TowerHeight%(TargetTower%(RecursionDepth%)) = TowerHeight%(TargetTower%(RecursionDepth%)) - 1
END SUB ' end procedure DisplayMove

DEFSNG A-Z
SUB INCR (x%)
  x% = x% + 1
END SUB

DEFINT A-Z
SUB Init   ' This procedure is used to initialize the screen and get the number
	   ' of disks to use.
  SHARED NumberOfDisks%(), TowerBase%  ' indicate which global vars we need
  SHARED PromptLine%, KX%, CursorOff%, MaxDisks%

  KEY OFF                                 ' turn key display off
  COLOR 7, 0                              ' initialize screen color
  CLS
  COLOR 4, 0
  LOCATE 1, 26, CursorOff%
  PRINT "TOWERS OF HANOI"                 ' display the program banner
  COLOR 6, 0
  LOCATE PromptLine%, KX%, CursorOff%
  PRINT "Number of Disks (1 TO " + STR$(MaxDisks%) + ") ";
  DO   ' get the number of disks from the user
    LOCATE PromptLine%, LEN("Number of Disks (1 TO " + STR$(MaxDisks%) + ") ") + 1, CursorOff%
    INPUT NumberOfDisks%(1)
    IF NumberOfDisks%(1) > MaxDisks% THEN BEEP
  LOOP UNTIL NumberOfDisks%(1) <= MaxDisks%
  TowerBase% = TowerBase% + NumberOfDisks%(1)
  COLOR 7, 0
  LOCATE PromptLine%, KX%, CursorOff%
  PRINT SPACE$(79)                        ' clear prompt line
END SUB  ' end procedure Init

SUB MakeMoves (NumMoves%)
  ' specify the global variables we need
  SHARED RecursionDepth%, NumberOfDisks%(), SourceTower%()
  SHARED TargetTower%(), TowerHeight%()
  ' increment level of recursion
  INCR RecursionDepth%

  ' check if we should exit routine
  IF NumberOfDisks%(RecursionDepth%) = 0 THEN
    DECR RecursionDepth%
    EXIT SUB
  END IF

  NumberOfDisks%(RecursionDepth% + 1) = NumberOfDisks%(RecursionDepth%) - 1
  SourceTower%(RecursionDepth% + 1) = SourceTower%(RecursionDepth%)
  TargetTower%(RecursionDepth% + 1) = 6 - SourceTower%(RecursionDepth%) - TargetTower%(RecursionDepth%)
  CALL MakeMoves(NumMoves%)

  INCR NumMoves%
  CALL DisplayMove
  NumberOfDisks%(RecursionDepth% + 1) = NumberOfDisks%(RecursionDepth%) - 1
  SourceTower%(RecursionDepth% + 1) = 6 - SourceTower%(RecursionDepth%) - TargetTower%(RecursionDepth%)
  TargetTower%(RecursionDepth% + 1) = TargetTower%(RecursionDepth%)
  CALL MakeMoves(NumMoves%)
  DECR RecursionDepth%
END SUB ' end procedure MakeMoves

