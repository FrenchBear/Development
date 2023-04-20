a$ = "Bonjour"
b$ = StrR$(a$, "jour")
Print a$
Print b$

Function StrR$ (myString$, whatToRemove$) 'noncase sensitive
    Dim a$, b$
    Dim As Long i

    a$ = myString$
    b$ = LCase$(whatToRemove$)
    i = InStr(LCase$(a$), b$)
    Do While i
        a$ = Left$(a$, i - 1) + Right$(a$, Len(a$) - i - Len(b$) + 1)
        i = InStr(LCase$(a$), b$)
    Loop
    StrR$ = a$
End Function

