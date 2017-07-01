TITLE   Notre premier programme
; **********************************
; * Projet: Programme de bienvenue *
; *                                *
; * Assemblage:    MASM LIST1      *
; *                LINK LIST1      *
; **********************************
DOSSEG                                               ; ModŠle de segmentation DOS
; ************************************************
; *** Fixe le modŠle de segmentation pour MASM ***
; ************************************************
.MODEL SMALL                                         ; Petit modŠle
; ************************************************
; ***    Fixe la taille du segment de pile     ***
; ************************************************
.STACK 100H                                          ; 256 octets pour la pile
; ************************************************
; ***       D‚but du segment de donn‚es        ***
; ************************************************     
.DATA
QUESTION  DB 13,10,"Tapez votre nom SVP (max. 12 caractŠres) :",13,10,"$"
PHRASE    DB "Bonjour,"
INPUT     DB 13,14 DUP (32)
          DB " c'est votre programme en assembleur qui vous parle !!",13,10,"$"
; ************************************************
; ***          D‚but du programme              ***
; ************************************************
.CODE
        MOV AX,@DATA                                 ; Transmet … DS
        MOV DS,AX                                    ; le segment de donn‚es
; ---------------------------------------------------
;                                                   -
        MOV AH,09H               ; Pose la question -
        MOV DX,OFFSET QUESTION   ;                  -
        INT 21H                  ;                  -
;                                                   -
; ---------------------------------------------------
        MOV AH,0CH                                   ; Attend la saisie
        MOV AL,0AH                                   ; Encore
        MOV DX,OFFSET INPUT                          ; une
        INT 21H                                      ; fonction de DOS
        MOV BL,BYTE PTR [INPUT+1]
        MOV BH,0
        MOV WORD PTR [INPUT],"  "
        MOV BYTE PTR [INPUT+2+BX],","
        MOV CX,12                                    ; A r‚p‚ter 12 x 
BOUCLE:
         MOV AH,09H                                  ; Affiche la phrase
         MOV DX,OFFSET PHRASE                        ; … l'‚cran
         INT 21H                                     ; (fonction de DOS)
        LOOP BOUCLE                                  ; Recommence si CX<>0
        MOV AX,4C00H                                 ; Termine le programme
        INT 21H                                      ; sans message d'erreur
END                                                  ; Fin du listing
