OPEN "f1" FOR OUTPUT AS #1

FOR i = 0 TO 255
  PRINT #1, "  /* ";
  PRINT #1, USING "### "; i;
  PRINT #1, "0x"; RIGHT$(HEX$(256 + i), 2); " ";
  IF i < 32 THEN C$ = "\" + RIGHT$(OCT$(i + 512), 3) ELSE C$ = CHR$(i)
  PRINT #1, C$;
  PRINT #1, " */"; CHR$(9); "'"; UCASE$(C$); "',"; CHR$(9);
  PRINT #1, "'"; UCASE$(C$); "',"; CHR$(9);
  PRINT #1, "'"; LCASE$(C$); "',"; CHR$(9); "0";

  IF (i >= 65 AND i <= 90) OR (i >= 97 AND i <= 122) OR (i >= 128 AND i <= 154) THEN PRINT #1, "|FCC_CARACTERE";
  IF (i >= 65 AND i <= 90) THEN PRINT #1, "|FCC_MAJUSCULE";
  IF (i >= 97 AND i <= 122) OR (i >= 128 AND i <= 154) THEN PRINT #1, "|FCC_MINUSCULE";
  PRINT #1, ","
NEXT



