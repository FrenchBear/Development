VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmHistorique 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Historique"
   ClientHeight    =   5970
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8370
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   398
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   558
   Begin FEUetFME.BDCombo bdcPersonne 
      Height          =   330
      Left            =   1320
      TabIndex        =   4
      Top             =   4020
      Width           =   6975
      _ExtentX        =   12303
      _ExtentY        =   582
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   -2147483630
      DataField       =   "sec_opercreat"
   End
   Begin MSComctlLib.ListView lvHistorique 
      Height          =   3975
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8355
      _ExtentX        =   14737
      _ExtentY        =   7011
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   0
      NumItems        =   6
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Date"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Pers"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Poste"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Application"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "Opération"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Text            =   "Trace"
         Object.Width           =   2540
      EndProperty
   End
   Begin MSWLess.WLText txtTrace 
      Height          =   1515
      Left            =   1320
      TabIndex        =   3
      Top             =   4380
      Width           =   6975
      _ExtentX        =   12303
      _ExtentY        =   2672
      _Version        =   393216
      ScrollBars      =   2
      MultiLine       =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblTrace 
      AutoSize        =   -1  'True
      Caption         =   "Trace :"
      Height          =   210
      Left            =   60
      TabIndex        =   2
      Top             =   4440
      Width           =   645
   End
   Begin VB.Label lblPersonne 
      AutoSize        =   -1  'True
      Caption         =   "Personne :"
      Height          =   210
      Left            =   60
      TabIndex        =   1
      Top             =   4080
      Width           =   1035
   End
End
Attribute VB_Name = "frmHistorique"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' frmHistorique
' Affichage de l'historique des opérations sur un enregistrement
' 29/11/01 PV
' 31/11/2001 FF Historique des modifications

Option Explicit

Public Sub AfficheHistorique(ByVal sWP As String)
  Me.Caption = "Historique " & sWP

  Show
  ZOrder 0
  
  lvHistorique.ListItems.Clear
  bdcPersonne = ""
  txtTrace = ""
  Screen.MousePointer = vbHourglass
  
  Dim x As ListItem
  Dim ch As New BDCurseur
  ch.OpenCurseur "select * from journal where " & sWP & " order by jou_domaine,jou_timestamp desc"
  Do Until ch.EOF
    Set x = lvHistorique.ListItems.Add
    x.Text = ch!jou_timestamp
    x.SubItems(1) = ch!jou_pers
    x.SubItems(2) = ch!jou_tty
    x.SubItems(3) = ch!jou_application
    x.SubItems(4) = ch!jou_operation
    x.SubItems(5) = ch!jou_description
    ch.MoveNext
  Loop
  ch.CloseCurseur
  If lvHistorique.ListItems.Count = 0 Then
    Set x = lvHistorique.ListItems.Add
    x.Text = "Aucune information d'historique associée à cet enregistrement."
  End If
  AjusteListView Me, lvHistorique
  Set lvHistorique.SelectedItem = Nothing
  lvHistorique.ListItems(1).Selected = False
  Screen.MousePointer = vbNormal
End Sub


Private Sub Form_Load()
   'Chargement des combos
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcPersonne.AddItem u.uti_numuti, u.uti_nom
  Next

End Sub


Private Sub Form_Resize()
  On Error Resume Next
  lvHistorique.Move 0, 0, ScaleWidth, ScaleHeight - 133
  lblPersonne.Move 4, ScaleHeight - 126
  bdcPersonne.Move 88, ScaleHeight - 126, ScaleWidth - 93
  lblTrace.Move 4, ScaleHeight - 102
  txtTrace.Move 88, ScaleHeight - 102, ScaleWidth - 93
End Sub


Private Sub lvHistorique_Click()
  Dim x As ListItem
  Set x = lvHistorique.SelectedItem
  If x Is Nothing Then
    bdcPersonne = ""
    txtTrace = ""
  Else
    bdcPersonne = x.SubItems(1)
    txtTrace = x.SubItems(5)
  End If
End Sub

'=================================================================================
' Fonctions de service

Public Sub MsgErr(ByVal iErr As Integer)
  Select Case iErr
    Case 1:
      MsgBox "L'historique n'est disponible qu'après une sélection d'enregistrements.", vbExclamation, App.Title
    Case Else:
      MsgBox "frmHistorique: Erreur " & iErr & " non documentée.", vbExclamation, App.Title
  End Select
End Sub

