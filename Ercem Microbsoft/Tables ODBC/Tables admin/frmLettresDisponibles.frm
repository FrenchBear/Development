VERSION 5.00
Begin VB.Form frmLettresDisponibles 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Lettres disponibles"
   ClientHeight    =   7320
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10200
   ClipControls    =   0   'False
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmLettresDisponibles.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   488
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   680
   Begin VB.Label lblSystème 
      AutoSize        =   -1  'True
      Caption         =   "Système"
      Height          =   210
      Index           =   0
      Left            =   300
      TabIndex        =   3
      Top             =   900
      Visible         =   0   'False
      Width           =   810
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Positionner le pointeur de la souris sur des lettres pour voir l'affectation. L'impression est disponible."
      Height          =   210
      Left            =   60
      TabIndex        =   2
      Top             =   240
      Width           =   9525
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Sur fond blanc, les lettres disponibles. Sur fond en couleur, les lettres affectées."
      Height          =   210
      Left            =   60
      TabIndex        =   1
      Top             =   0
      Width           =   7560
   End
   Begin VB.Label btnLettres 
      Alignment       =   2  'Center
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "WW"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   240
      TabIndex        =   0
      Top             =   540
      Visible         =   0   'False
      Width           =   390
   End
End
Attribute VB_Name = "frmLettresDisponibles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmLettresDisponibles
' Représentation visuelle de l'affectation des lettres
'  2/02/1998 PV
' 30/03/1999 PV Impression (hardcopy)
' 25/08/1999 PV Nom du système dans le tooltip; couleurs


Option Explicit

Private Const x0 As Integer = 5
Private Const y0 As Integer = 35
Private Const dx As Integer = 27
Private Const dy As Integer = 18
Private Const offx As Integer = 100   ' Offset des noms des systèmes

Private colCouleurs As New Collection


Private Sub AjouteCouleur(k As Integer, cSys As String, iRed As Integer, iGreen As Integer, iBlue As Integer)
  colCouleurs.Add RGB(iRed, iGreen, iBlue), cSys
  
  Load btnLettres(1000 + k)
  With btnLettres(1000 + k)
    .Caption = cSys
    .Move x0, y0 + dy * k
    .Visible = True
    .BackColor = RGB(iRed, iGreen, iBlue)
  End With
  
  Load lblSystème(1000 + k)
  With lblSystème(1000 + k)
    If cSys = "?" Then
      .Caption = "(autre)"
    Else
      .Caption = sNomSystème(cSys)
    End If
    .Move x0 + 30, y0 + dy * k
    .Visible = True
  End With
End Sub

Private Function Couleur(cSys As String) As Long
  On Error Resume Next
  Couleur = colCouleurs(cSys)
  If Err = 0 Then Exit Function
  Couleur = RGB(180, 180, 180)
End Function


Private Sub btnLettres_DblClick(Index As Integer)
  Dim sLettres As String
  sLettres = Chr(((Index - 1) \ 26) + 65) & Chr((Index - 1) Mod 26 + 65)
  frmLettres.AfficheLettres "let_lettres=" & Chr(34) & sLettres & Chr(34)
End Sub


Private Sub Form_Load()
  Dim i As Integer, j As Integer, k As Integer
  
  Width = (26 * dx + 3 * x0 + 1 + offx) * Screen.TwipsPerPixelX
  Height = (26 * dy + x0 + y0 + 28) * Screen.TwipsPerPixelY
  
  Visible = True
  
  EffaceCollection colCouleurs
  AjouteCouleur 0, "G", 255, 128, 128     ' Grenoble
  AjouteCouleur 1, "P", 128, 128, 255     ' Massy1
  AjouteCouleur 2, "R", 128, 255, 128     ' Microbe
  AjouteCouleur 3, "L", 255, 255, 128     ' Chimie
  AjouteCouleur 4, "H", 255, 128, 255     ' Hagar
  AjouteCouleur 5, "T", 128, 255, 255     ' Tripoli
  AjouteCouleur 6, "B", 180, 128, 128     ' Bergamo
  AjouteCouleur 7, "X", 128, 180, 128     ' Brux
  AjouteCouleur 8, "Y", 128, 128, 180     ' Lyon
  AjouteCouleur 9, "W", 180, 180, 128     ' Serveur
  AjouteCouleur 10, "S", 128, 180, 255    ' Spip
  AjouteCouleur 11, "C", 180, 0, 128      ' CO2
  AjouteCouleur 12, "O", 180, 128, 0      ' Osny
  AjouteCouleur 13, "K", 5, 155, 255      ' Kilt
  AjouteCouleur 14, "?", 180, 180, 180    ' Autre
  
  For i = 0 To 25
    For j = 0 To 25
      k = 26 * j + i + 1
      Load btnLettres(k)
      With btnLettres(k)
        .Caption = Chr(65 + j) & Chr(65 + i)
        .Move x0 + dx * i + offx, y0 + dy * j
        .Visible = True
      End With
    Next
  Next
  
  Refresh
  
  j = Asc("F") - 65
  For i = 0 To 25
    k = 26 * j + i + 1
    With btnLettres(k)
      .ToolTipText = "Réservé FDA (L)"
      .BackColor = Couleur("L")
      .Refresh
    End With
  Next
  
  Dim cLettres As New BDCurseur
  cLettres.OpenCurseur "select let_systeme,let_lettres,let_pers from lettre"
  While Not cLettres.EOF
    k = (Asc(Left(cLettres!let_lettres, 1)) - 65) * 26 + (Asc(Right(cLettres!let_lettres, 1)) - 65) + 1
    With btnLettres(k)
      .ToolTipText = sNomUtilisateur(cLettres!let_pers) & " (" & cLettres!let_systeme & ")"
      .BackColor = Couleur(cLettres!let_systeme)
      .Refresh
    End With
    cLettres.MoveNext
  Wend
  cLettres.CloseCurseur
End Sub



'=================================================================================
' Impression

Public Sub Imprime()
  PrintForm
End Sub

