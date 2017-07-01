VERSION 5.00
Begin VB.Form frmConversion 
   Caption         =   "Conversion"
   ClientHeight    =   7125
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   7125
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   3360
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmConversion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim cs As New Collection
Dim ce As New Collection

Dim nbEtb As Long
Dim sPréfixe As String


Private Sub Command1_Click()
  ChDrive "C:"
  ChDir "C:\Fimebio"
  
  Open "etbf.unl" For Output As #2
  Open "secf.unl" For Output As #3
  Print #3, "1000|FIMEBIO|1000|FIMEBIO SANS GRILLE|1999-11-12 19:30:00|"
  
  Print "Analyse cobac.txt"
  sPréfixe = "COB"
  Open "cobac.txt" For Input As #1
  Do Until EOF(1)
    LitEtb
  Loop
  Close #1
  
  Print "Analyse lac.txt"
  sPréfixe = "LAC"
  Open "lac.txt" For Input As #1
  Do Until EOF(1)
    LitEtb
  Loop
  Close #1

  Print "Analyse laa.txt"
  Open "laa.txt" For Input As #1
  sPréfixe = "LAA"
  Do Until EOF(1)
    LitEtb
  Loop
  Close #1
  
  Close #3    ' Secteurs
  
  Print "Génération du fichier etb"
  Dim e As etbFim
  Dim t As Date
  t = TimeSerial(0, 0, 1)
  For Each e In ce
    Print #2, sANSItoOEM(e.numetb & "|FIMEBIO|F|" & e.numsec & "|" & e.préfixe & "|" & e.nom & "|" & e.adr1 & "|" & e.adr2 & "|" & e.cpost & "|" & e.bdist & "|" & e.corresp & "|" & e.tel & "|" & e.fax & "|" & e.pays & "|1|N|13/11/1999|1415|46|1999-11-13 " & Format(t, "hh:mm:ss") & "|")
    t = t + TimeSerial(0, 0, 1)
  Next
  Close #2
  
  Print "Terminé, "; nbEtb & " etbs"
  Set ce = New Collection
  Set cs = New Collection
  Unload Me
End Sub


Private Sub LitEtb()
  Dim sLigne As String
  Dim tChamps
  Dim e As New etbFim
  Dim sClé As String, sNomCandidat As String
  Dim iCompte As Integer
  Const sRef As String = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzéèçàùî0123456789.:;,+-()/%""'&!?°^$*"

  Line Input #1, sLigne
  sLigne = Replace(sLigne, "ø", "o")
  sLigne = Replace(sLigne, "Š", "è")
  sLigne = Replace(sLigne, "ƒ", "â")
  sLigne = Replace(sLigne, "‚", "é")
  sLigne = Replace(sLigne, "â", "O")
  sLigne = Replace(sLigne, "…", "à")
  sLigne = Replace(sLigne, "ˆ", "^")
  sLigne = Replace(sLigne, "Œ", "î")
  
  Dim i As Integer
  For i = 1 To Len(sLigne)
    If InStr(1, sRef, Mid(sLigne, i, 1)) = 0 Then Stop
  Next
  
  tChamps = Split(sLigne, ",")
  
  e.numetb = Val(tChamps(0)) & tChamps(1)
  e.nombase = Trim(tChamps(2))
  e.adr1 = Trim(tChamps(3))
  e.adr2 = Trim(tChamps(4))
  e.cpost = Trim(tChamps(5))
  e.bdist = Trim(tChamps(6))
  e.corresp = Trim(tChamps(7))
  e.tel = Trim(tChamps(8))
  e.telex = Trim(tChamps(9))
  e.fax = Trim(tChamps(10))
  e.grille = Trim(tChamps(11))
  
  If e.grille = "" Then
    e.préfixe = sPréfixe
    e.numsec = 1000
  Else
    e.préfixe = sPréfixe & "." & e.grille
    e.numsec = 1000 + Val(e.grille)
  End If
  
  e.pays = 0 ' Par défaut
  
  If e.nombase = "" Then Exit Sub           ' Pas de nom !
  If e.bdist = "" Then e.bdist = "."
  If e.cpost = "" Then
    e.cpost = "."
  ElseIf Len(e.cpost) <> 5 Or e.cpost <> Format(Val(e.cpost), "00000") Then
    If InStr(1, sLigne, "BELGI", vbTextCompare) <> 0 Or InStr(1, sLigne, "BRUXEL", vbTextCompare) <> 0 Or InStr(1, sLigne, "CHARLEROI", vbTextCompare) <> 0 Or InStr(1, sLigne, "ANTWERPEN", vbTextCompare) <> 0 Or InStr(1, sLigne, "ICHTEGEM", vbTextCompare) <> 0 Then
      e.pays = 2
    ElseIf InStr(1, sLigne, " UK ", vbTextCompare) <> 0 Or InStr(1, sLigne, "SCOTLAND", vbTextCompare) <> 0 Or InStr(1, sLigne, "BRADFORD", vbTextCompare) <> 0 Then
      e.pays = 4
    ElseIf InStr(1, sLigne, "R F A", vbTextCompare) <> 0 Then
      e.pays = 6
    ElseIf InStr(1, sLigne, "HOLLANDE", vbTextCompare) <> 0 Or InStr(1, sLigne, "VEENENDAAL", vbTextCompare) <> 0 Then
      e.pays = 3
    ElseIf InStr(1, sLigne, "ITALI", vbTextCompare) <> 0 Then
      e.pays = 7
    ElseIf InStr(1, sLigne, "SUISS", vbTextCompare) <> 0 Or InStr(1, sLigne, "SWITZERLAND", vbTextCompare) <> 0 Then
      e.pays = 1
    ElseIf InStr(1, sLigne, "TUNISIE", vbTextCompare) <> 0 Then
      e.pays = 16
    ElseIf e.cpost = "9470O" Then
      e.cpost = "94700"
    ElseIf e.cpost = "9310" Then
      e.cpost = "93100"
    Else
      Debug.Print sLigne
    End If
  End If
  
  ' on détermine un nom d'établissement unique
  e.nom = MajAZ(e.nombase)
  sClé = e.préfixe & " " & e.nom
  On Error Resume Next
  ce.Add e, sClé
  If Err Then
    On Error GoTo 0
    Dim f As etbFim
    Set f = ce(sClé)
    ce.Remove sClé
    AjouteEtb f
    AjouteEtb e
  End If
  
  ' Secteurs
  On Error Resume Next
  cs.Add "X", "S" & e.numsec
  If Err = 0 Then
    On Error GoTo 0
    If e.numsec > 1000 Then Print #3, e.numsec & "|FIMEBIO|1000|GRILLE FIMEBIO " & e.numsec - 1000 & "|1999-11-12 19:30:00|"
  End If
  On Error GoTo 0
  
  nbEtb = nbEtb + 1
End Sub


Private Sub AjouteEtb(e As etbFim)
  Dim iCompte As Integer
  Dim sBD As String
  Dim p As Integer
  
  sBD = e.bdist
  p = InStr(1, sBD, "CEDEX", vbTextCompare)
  If p > 0 Then sBD = Trim(Left(sBD, p - 1))
  iCompte = 1
  Do
    If iCompte = 1 Then
      e.nom = e.nombase & " (" & sBD & ")"
      If Len(e.nom) > 41 Then
        e.nom = e.nombase & " (" & Left(sBD, 41 - Len(e.nombase) - 3) & ")"
      End If
    Else
      e.nom = e.nombase & " (" & sBD & " #" & iCompte & ")"
      If Len(e.nom) > 41 Then
        e.nom = e.nombase & " (" & Left(sBD, 41 - Len(e.nombase) - 6) & " #" & iCompte & ")"
      End If
    End If
    If Len(e.nom) > 41 Then Stop
    e.nom = MajAZ(e.nom)
    
    On Error Resume Next
    ce.Add e, e.préfixe & " " & e.nom
    If Err = 0 Then Exit Sub
    On Error GoTo 0
    iCompte = iCompte + 1
   Loop
End Sub


Public Function MajAZ(ByVal s As String) As String
  Dim i As Integer, p As Integer
  Const s1 As String = "ÈÊËÏÎÖÔÇÀÄÂÙÜÛ"
  Const s2 As String = "EEEIIOOCAAAUUU"
  s = UCase(s)
  For i = 1 To Len(s)
    p = InStr(1, s1, Mid(s, i, 1))
    If p > 0 Then Mid(s, i, 1) = Mid(s2, p, 1)
  Next
  MajAZ = s
End Function
