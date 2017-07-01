VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmRésultats 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Taille en double"
   ClientHeight    =   5520
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5160
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5520
   ScaleWidth      =   5160
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnDel2 
      Caption         =   "Efface pic 2"
      Height          =   375
      Left            =   3960
      TabIndex        =   6
      Top             =   1380
      Width           =   1155
   End
   Begin ComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   5
      Top             =   5205
      Width           =   5160
      _ExtentX        =   9102
      _ExtentY        =   556
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   3
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            AutoSize        =   1
            Object.Width           =   4163
            MinWidth        =   3528
            Key             =   "Msg"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Panel2 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            AutoSize        =   1
            Object.Width           =   2399
            MinWidth        =   1764
            Key             =   "Exceptions"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Panel3 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            AutoSize        =   1
            Object.Width           =   2399
            MinWidth        =   1764
            Key             =   "Ignorés"
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton btnException 
      Caption         =   "Exception"
      Height          =   375
      Left            =   3960
      TabIndex        =   4
      Top             =   900
      Width           =   1155
   End
   Begin VB.ListBox lstDoublons 
      Height          =   2400
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   3735
   End
   Begin VB.CommandButton btnAnalyse 
      Caption         =   "&Lancer analyse"
      Height          =   615
      Left            =   3960
      TabIndex        =   0
      Top             =   120
      Width           =   1155
   End
   Begin VB.Label Label2 
      Height          =   255
      Left            =   2640
      MousePointer    =   2  'Cross
      TabIndex        =   3
      Top             =   2640
      Width           =   2295
   End
   Begin VB.Label Label1 
      Height          =   255
      Left            =   120
      MousePointer    =   2  'Cross
      TabIndex        =   2
      Top             =   2640
      Width           =   2295
   End
   Begin VB.Image Image2 
      Height          =   2055
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   2295
   End
   Begin VB.Image Image1 
      Height          =   2055
      Left            =   120
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   2295
   End
End
Attribute VB_Name = "frmRésultats"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' TailleEnDouble
' Analyse un répertoire contenant des images et génère la liste des fichiers ayant la même taille
' 22/06/97 PV 1ère version
' 15/08/97 PV Liste, affichage et suppression des images en double
'  3/01/98 PV Effacement du fichier dans la corbeille
' 16/05/98 PV Effacement réel des fichiers... (dim sNom)
' 26/07/98 PV Gestion d'une liste permanente d'exceptions
'  2/01/99 PV Récupération rapide de la liste des fichiers avec dir
'  9/05/99 PV Gestion de la hiérarchie dans d:\pic\x\pic
' 15/02/03 PV Reprise sous XP

Option Explicit

Const sPicDrive = "C:"
Const sPath As String = sPicDrive & "\pic2\pic\01"
Const sFichierDir As String = sPicDrive & "\Pic2\VB\Taille~1\dir.txt"

Dim cFic As New Collection
Dim sNomficExceptions As String
Dim iNbExceptions As Integer
Dim t1() As String, t2() As String

Sub SupprimeLigne()
  Dim i As Integer
  i = lstDoublons.ListIndex
  lstDoublons.RemoveItem lstDoublons.ListIndex
  If i = lstDoublons.ListCount Then i = i - 1
  If i >= 0 Then
    lstDoublons.ListIndex = -1
    lstDoublons.ListIndex = i
  Else
    Label1 = ""
    Label2 = ""
    Image1.Picture = LoadPicture
    Image2.Picture = LoadPicture
  End If
End Sub

Private Sub btnDel2_Click()
  Label2_Click
End Sub

Private Sub btnException_Click()
  If lstDoublons.ListIndex < 0 Then Beep: Exit Sub
  
  Open sNomficExceptions For Append As #1
  Write #1, Label1.Caption, Label2.Caption
  Close #1
  AjouteException Label1.Caption, Label2.Caption
  SupprimeLigne
End Sub


Private Sub btnAnalyse_Click()
  Dim sNom As String
  Dim tNom() As String, tTaille() As Long
  Dim iNbIgnoré As Integer
  
  btnAnalyse.Enabled = False
  lstDoublons.Clear
  Label1 = ""
  Label2 = ""
  Image1.Picture = LoadPicture
  Image2.Picture = LoadPicture
  sbStatus.Panels("Ignorés") = ""
  sbStatus.Panels("Exceptions") = ""
  
' 1ère partie, on crée la liste des fichiers et des tailles
'  Dim t As Single
'  t = Timer
  
  Dim iNb As Integer
  sbStatus.Refresh
  
#If False Then
' Deux fois plus long avec l'objet filesystem qu'avec dir !!!
  Dim o As New FileSystemObject
  Dim fs As Files
  Dim f As File
  
  Set fs = o.GetFolder(sPath).Files
  ReDim tNom(fs.Count), tTaille(fs.Count)
  For Each f In fs
    If Left(f.Name, 1) <> "!" Then
      iNb = iNb + 1
      If (iNb Mod 100) = 0 Then
        sbStatus.Panels("Msg") = "Liste " & iNb
        DoEvents
      End If
      tNom(iNb) = f.Name
      tTaille(iNb) = f.Size
    End If
  Next
#End If

#If False Then
' Dir est quand même très long...
  sNom = Dir("*", vbNormal Or vbArchive)
  Do While sNom <> ""
    If Left(sNom, 1) <> "!" Then
      iNb = iNb + 1
      If (iNb Mod 100) = 0 Then
        sbStatus.Panels("Msg") = "Liste " & iNb
        DoEvents
      End If
      ReDim Preserve tNom(iNb), tTaille(iNb)
      tNom(iNb) = sNom
      tTaille(iNb) = FileLen(sNom)
    End If
    sNom = Dir
  Loop
  sbStatus.Panels("Msg") = "Liste " & iNb
#End If
  
  
  Dim sLigne As String
  ShellWait "cmd /c dir /-c " & sPath & " >" & sFichierDir
  Sleep 1000
  Dim sCurrentPath As String
  
  Open sFichierDir For Input As #1
  Do Until EOF(1)
    Line Input #1, sLigne
    If Len(sLigne) = 0 Then GoTo continue
    If Left(sLigne, 1) = " " Then GoTo continue
    If Mid(sLigne, 22, 5) = "<REP>" Then GoTo continue
    If Left(sLigne, 10) = "R‚pertoire" Then
      sCurrentPath = Mid(sLigne, 15)
      GoTo continue
    End If
    
    sNom = Mid(sLigne, 37)
    If Left(sNom, 1) <> "!" Then
      iNb = iNb + 1
      If (iNb Mod 100) = 0 Then
        sbStatus.Panels("Msg") = "Liste " & iNb
        sbStatus.Refresh
        'DoEvents
      End If
      ReDim Preserve tNom(iNb), tTaille(iNb)
      tNom(iNb) = sCurrentPath & sNom
      tTaille(iNb) = Val(Mid(sLigne, 20, 16))
    End If
    
continue:
  Loop
  Close #1
  sbStatus.Panels("Ignorés") = ""
  
'  t = Timer - t
'  MsgBox "Analyse: " & Format(t, "0.0") & "s"
'  End
  
  ' 2ème partie, analyse de la liste
  Dim i As Integer, j As Integer, k As Integer
  Dim t0 As Single
  Dim bIgnoré As Boolean
  sbStatus.Panels("Msg") = "Analyse"
  t0 = Timer
  For i = 1 To iNb
    sbStatus.Panels("Msg") = "Analyse " & Int((100# * i) / iNb) & "%"
    DoEvents
    For j = i + 1 To iNb
      If tTaille(i) = tTaille(j) Then
        bIgnoré = False
        For k = 1 To iNbExceptions
          If StrComp(tNom(i), t1(k), vbTextCompare) = 0 And StrComp(tNom(j), t2(k), vbTextCompare) = 0 Or StrComp(tNom(i), t2(k), vbTextCompare) = 0 And StrComp(tNom(j), t1(k), vbTextCompare) = 0 Then
            iNbIgnoré = iNbIgnoré + 1
            sbStatus.Panels("Ignorés") = "Ign: " & iNbIgnoré
            bIgnoré = True
            Exit For
          End If
        Next
        
        If Not bIgnoré Then
          lstDoublons.AddItem tNom(i) & ":" & tNom(j) & ":" & tTaille(i)
          lstDoublons.Refresh
        End If
      End If
    Next
  Next
  t0 = Timer - t0
  
  sbStatus.Panels("Msg") = Format(t0, "0.00") & " s"
  btnAnalyse.Enabled = True
  
End Sub

Private Sub AjouteException(ByVal f1 As String, ByVal f2 As String)
  iNbExceptions = iNbExceptions + 1
  ReDim Preserve t1(iNbExceptions), t2(iNbExceptions)
  t1(iNbExceptions) = f1
  t2(iNbExceptions) = f2
  sbStatus.Panels("Exceptions") = "Exc: " & iNbExceptions
End Sub

Private Sub ChargeExceptions()
  Dim f1 As String, f2 As String
  sNomficExceptions = App.Path & "\exceptions.txt"
  
  On Error GoTo fin
  Open sNomficExceptions For Input As #1
  On Error Resume Next
  While Not EOF(1)
    Input #1, f1, f2
    AjouteException f1, f2
  Wend
  Close #1
fin:
End Sub

Private Sub Form_Load()
  ChDir sPath
  ChDrive sPicDrive
  ChargeExceptions
End Sub

Private Sub Label1_Click()
  If Label1.Caption <> "" Then
    Dim sNom As String
    sNom = Label1.Caption
    Label1.Caption = ""
    Image1.Picture = LoadPicture
    DoEvents
    EffaceFichierCorbeille hwnd, sNom
    SupprimeLigne
  End If
End Sub

Private Sub Label2_Click()
  If Label2.Caption <> "" Then
    Dim sNom As String
    sNom = Label2.Caption
    Label2.Caption = ""
    Image2.Picture = LoadPicture
    DoEvents
    EffaceFichierCorbeille hwnd, sNom
    SupprimeLigne
  End If
End Sub

Private Sub lstDoublons_Click()
  Dim sLigne As String
  Dim sNom1 As String, sNom2 As String
  
  sLigne = lstDoublons.Text
  
  Dim p1 As Integer, p2 As Integer
  p1 = InStr(sLigne, ":")
  p2 = InStr(p1 + 1, sLigne, ":")
  
  sNom1 = Left(sLigne, p1 - 1)
  sNom2 = Mid(sLigne, p1 + 1, p2 - p1 - 1)
  Label1.Caption = sNom1
  Label2.Caption = sNom2
  On Error GoTo pb
  Image1.Picture = LoadPicture(sNom1)
  Image2.Picture = LoadPicture(sNom2)
  Exit Sub
  
pb:
  Image1.Picture = LoadPicture
  Image2.Picture = LoadPicture
  SupprimeLigne
End Sub
