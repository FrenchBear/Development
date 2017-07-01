VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmVerrouillage 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des verrous"
   ClientHeight    =   3435
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8910
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmVerrouillage.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3435
   ScaleWidth      =   8910
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnFermer 
      Cancel          =   -1  'True
      Caption         =   "Fermer"
      Default         =   -1  'True
      Height          =   330
      Left            =   7500
      TabIndex        =   3
      Top             =   300
      Width           =   1350
   End
   Begin VB.CommandButton btnSupprimer 
      Caption         =   "&Supprimer"
      Height          =   330
      Left            =   7500
      TabIndex        =   2
      Top             =   1320
      Width           =   1350
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   7500
      TabIndex        =   1
      Top             =   720
      Width           =   1350
   End
   Begin MSComctlLib.ListView lvVerrous 
      Height          =   3075
      Left            =   60
      TabIndex        =   0
      Top             =   300
      Width           =   7335
      _ExtentX        =   12938
      _ExtentY        =   5424
      View            =   3
      LabelEdit       =   1
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   5
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "R�f�rence"
         Object.Width           =   2346
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Pers."
         Object.Width           =   1147
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Proc."
         Object.Width           =   1499
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Programme"
         Object.Width           =   2469
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Pos� le"
         Object.Width           =   3528
      EndProperty
   End
   Begin VB.Label lblListe 
      AutoSize        =   -1  'True
      Caption         =   "Liste des verrous :"
      Height          =   210
      Left            =   120
      TabIndex        =   4
      Top             =   60
      Width           =   1770
   End
End
Attribute VB_Name = "frmVerrouillage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Visualisation (et bricolage) des verrous de CRA sur le syst�me Unix"
' frmVerrouillage
' Visualisation (et bricolage) des verrous de RA sur le syst�me Unix
' 14/11/97 PV
' 12/05/98 PV Trace des suppressions forc�es de verrous
' 01/02/99 NC Internationalisation
' 11/04/00 PV Suppression de verrous multiples


Option Explicit

Private Sub btnAide_Click()
  Aide "frmverrou"
End Sub

Private Sub btnFermer_Click()
  Unload Me
End Sub

Private Sub btnSupprimer_Click()
  If lvVerrous.SelectedItem Is Nothing Then Beep: Exit Sub
  
  Dim iRep As VbMsgBoxResult
  Dim sMsg As String
  sMsg = sGetIntlLib("CR274", "Question 274")
  iRep = MsgBox(sMsg, vbExclamation + vbYesNo + vbDefaultButton2, sNomApp)
  'iRep = MsgBox("ATTENTION !" & vbCrLf & vbCrLf & _
    "Cette commande permet de lib�rer de force un verrou pos� sur une r�f�rence, qui emp�che l'acc�s � un RA." & vbCrLf & vbCrLf & _
    "Elle peut �tre utilis�e UNIQUEMENT si le blocage est cons�cutif � un cas de plantage d'un programme de saisie du SL, alors que ce RA �tait affich�. Dans toute autre circonstance, pr�venir la DI." & vbCrLf & vbCrLf & _
    "Ok pour continuer ?", _
    vbExclamation + vbYesNo + vbDefaultButton2, sNomApp)
  If iRep = vbNo Then Exit Sub
  
  Dim l As ListItem
  For Each l In lvVerrous.ListItems
    If l.Selected Then
      ' On garde une trace
      D�monJournalUnix "Verrou", "Lib�re forc�", "(forc� r�el) Ref=" & l.Text
      Lib�reVerrou UCase(l.Text), True
    End If
  Next
restart:
  For Each l In lvVerrous.ListItems
    If l.Selected Then
      lvVerrous.ListItems.Remove l.Index
      GoTo restart
    End If
  Next
End Sub


Private Sub Form_Load()
  Internationalisation
  lblListe = sprintf(sGetIntlLib("CO093", "Liste des verrous actuellement pos�s sur %1 :"), sSyst�meDistant)
  
  ' On efface la liste
  lvVerrous.ListItems.Clear
  
  ' On envoie la requ�te de table des verrous au d�mon
  Bloquer
    Dim br As New Rev
    tcps.Envoie "TVER"
    
    Dim sLigne As String
    Dim itmX As ListItem
    Dim sRef As String, iPers As Integer, iProc As Long, sApp As String, dCr�ation As Date
    Do
      sLigne = tcps.Re�oit
      If Left(sLigne, 2) = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sRef, iPers, iProc, dCr�ation, sApp
      
      Set itmX = lvVerrous.ListItems.Add
      itmX.Text = sRef
      itmX.SubItems(1) = iPers
      itmX.SubItems(2) = iProc
      itmX.SubItems(3) = sApp
      itmX.SubItems(4) = dCr�ation
    Loop
  Rel�cher
End Sub


Sub AfficheVerrous()
  If bBlocageEnCours Then
    MsgBox2i "CR275"
    'MsgBox "Affichage des verrous non disponible, attendez quelques secondes�", vbInformation, sNomApp
    Exit Sub
  End If
  
  Show 1
End Sub


'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "VGCaption"
  
  SetLib btnFermer, "Caption", "btnFermer"
  SetLib btnAide, "Caption", "btnAide"
  SetLib btnSupprimer, "Caption", "btnSupprimer"
    
  SetLib lblListe, "Caption", "VGlblListe"
    
End Sub

