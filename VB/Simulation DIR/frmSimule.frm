VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.2#0"; "COMCTL32.OCX"
Begin VB.Form frmSimule 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Simulation de la commande DIR"
   ClientHeight    =   4770
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9360
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   318
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   624
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin ComctlLib.ListView lw 
      Height          =   4515
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   9195
      _ExtentX        =   16219
      _ExtentY        =   7964
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   327682
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   7
      BeginProperty ColumnHeader(1) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Paramètre"
         Object.Width           =   3175
      EndProperty
      BeginProperty ColumnHeader(2) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   1
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Drive"
         Object.Width           =   529
      EndProperty
      BeginProperty ColumnHeader(3) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   2
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Path"
         Object.Width           =   2646
      EndProperty
      BeginProperty ColumnHeader(4) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   3
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "File / Modèle"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(5) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   4
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "CD"
         Object.Width           =   2381
      EndProperty
      BeginProperty ColumnHeader(6) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   5
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "CD?"
         Object.Width           =   529
      EndProperty
      BeginProperty ColumnHeader(7) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   6
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "NbFic"
         Object.Width           =   1323
      EndProperty
   End
End
Attribute VB_Name = "frmSimule"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
 toto
End Sub

Sub toto2(ByVal sModèle As String)
  Dim sDrive As String, sPath As String
  Dim sDernierComposant As String
  Dim iPos As Integer
  
  sPath = sModèle
  iPos = Len(sPath)
  Do While iPos > 0
    If Mid(sPath, iPos, 1) = ":" Or Mid(sPath, iPos, 1) = "\" Then Exit Do
    iPos = iPos - 1
  Loop
  sPath = Left(sModèle, iPos)
  sDernierComposant = Mid(sModèle, iPos + 1)
  
  If sPath = "" Then
    sDrive = ""
  Else
    sDrive = UCase(Left(sPath, 1))
    If sDrive < "A" Or sDrive > "Z" Or Mid(sPath, 2, 1) <> ":" Then
      sDrive = ""
    Else
      sPath = Mid(sPath, 3)
    End If
  End If
  
  
  Dim sTestCD As String
  If sDrive = "" Then
    sTestCD = Left(CurDir, 2)
  Else
    sTestCD = sDrive & ":"
  End If
  If sPath = "" Then
    sTestCD = sTestCD & Mid(CurDir(Left(sTestCD, 1)), 3)
  Else
    sTestCD = sTestCD & sPath
  End If
  If Right(sTestCD, 1) <> "\" Then sTestCD = sTestCD & "\"
  sTestCD = sTestCD & sDernierComposant
  
  
  ' 2. On remplace les parties non renseignées (drive, path) par le disque et
  ' le path courants, et on vérifie si le tout n'est pas un répertoire
  Dim bOkDir As Boolean
  If InStr(sDernierComposant, "*") <> 0 Or InStr(sDernierComposant, "?") <> 0 Then
    bOkDir = False
  Else
    Dim sSauveCurDir As String
    sSauveCurDir = CurDir
    On Error Resume Next
    ChDir sTestCD
    If Err Then
      bOkDir = False
    Else
      bOkDir = True
    End If
    On Error GoTo 0
    ChDir sSauveCurDir
  End If
  
  
  ' On prépare la recherche finale
  Dim sFullPath As String, sPattern As String
  If bOkDir Then
    sFullPath = sTestCD
    sPattern = "*.*"
  Else
    sFullPath = sDrive & ":" & sPath
    If Right(sFullPath, 1) <> "\" Then sFullPath = sFullPath & "\"
    sPattern = sDernierComposant
  End If
  
  
  Dim sFinal As String
  Dim f As String, iNb As Integer
  iNb = 0
  On Error Resume Next
  f = Dir(sFullPath & sPattern, vbNormal + vbDirectory)
  If Err Then
    sFinal = "Err: " & Err
    On Error GoTo 0
  Else
    On Error GoTo 0
    Do While f <> ""
      iNb = iNb + 1
      f = Dir
    Loop
    sFinal = iNb
  End If
  
  
  Dim itmX As ListItem
  Set itmX = lw.ListItems.Add
  itmX.Text = sModèle
  itmX.SubItems(1) = sDrive
  itmX.SubItems(2) = sPath
  itmX.SubItems(3) = sDernierComposant
  itmX.SubItems(4) = sTestCD
  itmX.SubItems(5) = bOkDir
  itmX.SubItems(6) = sFinal
End Sub

Public Sub toto()
  toto2 ""
  toto2 "\"
  toto2 "Windows"
  toto2 "C:"
  toto2 "C:\"
  toto2 "C:Windows"
  toto2 "C:\Program files"
  toto2 "C:\Program files\"
  toto2 "*.bat"
  toto2 "\*.bat"
  toto2 "C:*.bat"
  toto2 "C:\*.bat"
  toto2 "C:\Program files\*.bat"
  toto2 "C:\Program files\f1.htm"
  toto2 "C:\Program files\f2.htm"
End Sub

