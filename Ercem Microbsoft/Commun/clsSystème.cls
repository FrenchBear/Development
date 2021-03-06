VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Syst�me"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "G�re les syst�mes informatiques Ercem/LBF"
' Classe Syst�me
' G�re les Syst�mes analytiques Ercem/LBF

Option Explicit

Public sys_systeme As String      ' Lettre du syst�me
Public sys_nom As String          ' Nom du syst�me
Public sys_description As String  ' Machine+site
Public sys_balsite As String      ' lettre du syst�e qui g�re les BAL sur le site
Public timestamp As Date          ' timestamp de l'enregistrement

Function Copie() As Syst�me
  Dim k As New Systeme
  With k
    .sys_systeme = sys_systeme
    .sys_nom = sys_nom
    .sys_description = sys_description
    .uni_titre = uni_titre
    .uni_adr1 = uni_adr1
    .uni_adr2 = uni_adr2
    .uni_adr3 = uni_adr3
    .uni_telfax = uni_telfax
    .uni_uvent = uni_uvent
    .uni_msgid = uni_msgid
    .uni_web = uni_web
  End With
  Set Copie = k
End Function

Sub DiskWrite(iNumFic As Integer)
  Write #iNumFic, "UNI1"
  Write #iNumFic, uni_numSysteme
  Write #iNumFic, uni_code
  Write #iNumFic, uni_type
  Write #iNumFic, uni_titre
  Write #iNumFic, uni_adr1
  Write #iNumFic, uni_adr2
  Write #iNumFic, uni_adr3
  Write #iNumFic, uni_telfax
  Write #iNumFic, uni_uvent
  Write #iNumFic, uni_msgid
  Write #iNumFic, uni_web
End Sub

Sub DiskRead(iNumFic As Integer)
  Dim sCl� As String
  Input #1, sCl�
  If sCl� <> "UNI1" Then
    MsgBox "Erreur interne - Syst�me.DiskRead" & vbCrLf & "Cl� attendue: UNI1" & vbCrLf & "Cl� lue: " & sCl�, vbCritical, sNomApp
    Stop
  End If
  Input #iNumFic, uni_numSysteme
  Input #iNumFic, uni_code
  Input #iNumFic, uni_type
  Input #iNumFic, uni_titre
  Input #iNumFic, uni_adr1
  Input #iNumFic, uni_adr2
  Input #iNumFic, uni_adr3
  Input #iNumFic, uni_telfax
  Input #iNumFic, uni_uvent
  Input #iNumFic, uni_msgid
  Input #iNumFic, uni_web
End Sub

