VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Utilisateur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion des utilisateurs, de la recherche, …"
' Classe utilisateur
'  4/02/1998 PV
' 10/02/1998 PV uti_sysbal et uti_passwd !
' 21/07/1998 PV Fin de uti_lettres, uti_uniteercem
' 18/08/1999 PV sNumUti pour aligner les clés dans bdcombo
' 20/03/2000 PV +uti_bal


Option Explicit

Public uti_numuti As Integer    ' N° d'utilisateur
Public uti_nom As String        ' Nom (Prénom NOM)
Public uti_bal As String        ' BAL / Identifiant de connexion
Public uti_unite                ' Unité de rattachement réelle
Public uti_systemes As String   ' Lettres de systèmes sur lesquels l'utilisateur peut se connecter
Public uti_niveau               ' Niveau de privilège

Public uti_passwdlogin          ' Mot de passe de BAL, pas stocké dans le cache


Function Copie() As Utilisateur
Attribute Copie.VB_Description = "Duplique un objet de type Utilisateur"
  Dim k As New Utilisateur
  With k
    .uti_numuti = uti_numuti
    .uti_nom = uti_nom
    .uti_bal = uti_bal
    .uti_unite = uti_unite
    .uti_systemes = uti_systemes
    .uti_niveau = uti_niveau
    
    .uti_passwdlogin = uti_passwdlogin
  End With
  Set Copie = k
End Function

Sub DiskWrite(iNumFic As Integer)
  Write #iNumFic, uti_numuti
  Write #iNumFic, uti_nom
  Write #iNumFic, uti_bal
  Write #iNumFic, uti_unite
  Write #iNumFic, uti_systemes
  Write #iNumFic, uti_niveau
End Sub

Sub DiskRead(iNumFic As Integer)
  Input #iNumFic, uti_numuti
  Input #iNumFic, uti_nom
  Input #iNumFic, uti_bal
  Input #iNumFic, uti_unite
  Input #iNumFic, uti_systemes
  Input #iNumFic, uti_niveau
  
  uti_passwdlogin = ""    ' Le mot de passe n'est pas stocké dans le cache
End Sub
  
' Formate le n° d'unité sur 3 positions, les espaces à droite étant remplacés par 2 blancs
Function sNumUti() As String
  If uti_numuti < 10 Then
    sNumUti = uti_numuti & "    "
  ElseIf uti_numuti < 100 Then
    sNumUti = uti_numuti & "  "
  Else
    sNumUti = uti_numuti
  End If
End Function
