VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmConfigImprimante 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Configuration des imprimantes"
   ClientHeight    =   1905
   ClientLeft      =   1710
   ClientTop       =   2565
   ClientWidth     =   6300
   Icon            =   "frmConfigImprimante.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   127
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   420
   ShowInTaskbar   =   0   'False
   Begin VB.Frame fraImpLaser 
      Caption         =   "Imprimante laser"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   120
      TabIndex        =   0
      Top             =   60
      Width           =   6075
      Begin VB.ComboBox cboLaser 
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         ItemData        =   "frmConfigImprimante.frx":0442
         Left            =   120
         List            =   "frmConfigImprimante.frx":0444
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Tag             =   "Choisissez l'imprimante pour les fiches de prélèvement"
         Top             =   240
         Width           =   5775
      End
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   4500
      TabIndex        =   4
      Top             =   1020
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   360
      TabIndex        =   2
      Top             =   1020
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   2460
      TabIndex        =   3
      Top             =   1020
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   5
      Top             =   1590
      Width           =   6300
      _ExtentX        =   11113
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "frmConfigImprimante"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Gère le choix des imprimantes"
' frmConfigImprimante
' Gère le choix des imprimantes
' 30/10/00 FG    Gestion de la liste via collection


Option Explicit

Private sSystèmeOrigine As String                 ' Nom du système qui a fourni la liste des imprimantes
Private colImprimantesLaser As New Collection     ' Liste d'imprimantes laser disponibles

Public Function bOkImprimantes() As Boolean
  If sImprimanteLaser = "" Then Show vbModal
  bOkImprimantes = sImprimanteLaser <> ""
End Function

Public Sub InitImprimantes()
    
  sImprimanteLaser = GetSetting(sApplicationGlobale, "Impression", "ImprimanteLaser." & sSystèmeDistant, "")
    
    If sImprimanteLaser = "" Then Show vbModal
  frmGImp.sbStatus.Panels("Impr").Text = sImprimanteLaser
End Sub


Private Sub btnAide_Click()
  Aide "frmconfi"
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub MémoriseImprimantes()
  DémonJournalUnix "Impression", "ChoixImprimante", "Laser=" & sImprimanteLaser
  
  SaveSetting sApplicationGlobale, "Impression", "ImprimanteLaser." & sSystèmeDistant, sImprimanteLaser
End Sub


Private Sub btnOk_Click()
  Dim p As Integer
  Dim sLaserChoisie As String
  
  If cboLaser.ListIndex >= 0 Then
    p = InStr(cboLaser.List(cboLaser.ListIndex), ",")
    sLaserChoisie = Left(cboLaser.List(cboLaser.ListIndex), p - 1)
  Else
    MsgBox2i "CFcboLaser.tag"
    cboLaser.SetFocus
    Exit Sub
  End If

  If sImprimanteLaser <> sLaserChoisie Then
    sImprimanteLaser = sLaserChoisie
    
    MémoriseImprimantes
    frmGImp.sbStatus.Panels("Impr").Text = sImprimanteLaser
  End If
  
  Unload Me
End Sub


Private Sub Form_Activate()
  Dim s
  
  cboLaser.Clear
  For Each s In colImprimantesLaser
    cboLaser.AddItem s
    If StrComp(sImprimanteLaser, Left(s, InStr(1, s, ",") - 1), vbTextCompare) = 0 Then cboLaser.ListIndex = cboLaser.NewIndex
  Next
End Sub


Sub ChargeListeImprimantes()
  Dim sLigne As String, i As Integer
  Dim sNomImp As String, sCommentaire As String
  Dim br As New Rev
  
  ' Si la liste est en mémoire, terminé !
  If sSystèmeOrigine = sSystèmeDistant Then Exit Sub
  
  sSystèmeOrigine = sSystèmeDistant
  cboLaser.Clear
  For i = 1 To colImprimantesLaser.count
    colImprimantesLaser.Remove 1
  Next
    
  br.AddField 17       ' Enum imprimantes classe 1(laser) + 16(wprint)
  Bloquer
    tcps.Envoie "EIMP " & br.Buffer
    
    Do
      sLigne = tcps.Reçoit
      If Left(sLigne, 2) = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sNomImp, sCommentaire
      colImprimantesLaser.Add sNomImp & ", " & sCommentaire
    Loop
  Relâcher
End Sub


Private Sub Form_Load()
  Internationalisation
  
  ChargeListeImprimantes
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub



Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  
  On Error GoTo FinGotFocus
  ActiveControl.SelStart = 0
  ActiveControl.SelLength = 100
FinGotFocus:

End Sub

Private Sub cboLaser_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub


'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "CICaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  SetLib fraImpLaser, "Caption", "CIfraImpLaser"
  SetLib cboLaser, "Tag", "CIcboLaser.tag"
End Sub
