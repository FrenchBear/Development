Attribute VB_Name = "ModLicence"
Option Explicit

Const KEY_BASE = "Base"

Const BASE_NB_MAX_CHAR = 8
Public Function LicenceCoder(ByVal ch As String)

Dim ch1 As String
Dim i As Integer
    
    ch1 = ""
    For i = 1 To Len(ch)
        ch1 = ch1 + Chr$(Asc(Mid$(ch, i, 1)) Xor (2 * (Len(ch) - i)))
    Next
    LicenceCoder = ch1

End Function

Public Function LicenceDécoder(ByVal ch As String)

    LicenceDécoder = LicenceCoder(ch)

End Function


Public Function LicenceGénérerBase() As String

Dim i As Integer
Dim chBase As String
Dim c As String

    Randomize
    For i = 1 To BASE_NB_MAX_CHAR
        c = Chr$(Int(iif2(Rnd > 0.3, Asc("0") + Rnd * 9, Asc("A") + Rnd * 26)))
        chBase = chBase & c
    Next
    LicenceGénérerBase = chBase

End Function


Public Sub LicenceCacherBase(ByVal Base As String)

    SaveSetting "Win.ini", NomApplication, KEY_BASE, LicenceCoder(Base)
    
End Sub
Public Function LicenceLireBase(Base As String) As Integer

Dim ch As String
Const CHAINE_DEFAULT = "&-&"

    ch = GetSetting("Win.ini", NomApplication, KEY_BASE, CHAINE_DEFAULT)
    If ch = CHAINE_DEFAULT Then
        LicenceLireBase = False
    Else
        If Len(ch) = BASE_NB_MAX_CHAR Then
            Base = LicenceDécoder(ch)
            LicenceLireBase = True
        Else
            LicenceLireBase = False
        End If
    End If
    
End Function

Public Function LicenceGénérerClé(ByVal Base As String, ByVal NumSérie As String)

Dim Clé As String
Dim i As Integer
Dim ch1 As String
Dim ch2 As String

    ch1 = Base
    ch2 = NumSérie
    If Len(ch1) > Len(ch2) Then
        ch2 = ch2 & String$(Len(ch1) - Len(ch2), "-")
    Else
        ch1 = ch1 & String$(Len(ch2) - Len(ch1), "-")
    End If
    For i = 1 To Len(ch1)
        Clé = Clé & Chr$((Asc(Mid$(ch1, i, 1)) * Asc(Mid$(ch2, i, 1))) Mod 26 + Asc("A"))
    Next
    LicenceGénérerClé = Clé

End Function
Public Function LicenceOk(ByVal NumSérie As String, ByVal Clé As String) As Integer

Dim Base As String

    If LicenceLireBase(Base) Then
        If LicenceGénérerClé(Base, NumSérie) = Clé Then
            LicenceOk = True
        Else
            LicenceOk = False
        End If
    Else
        LicenceOk = False
    End If

End Function
