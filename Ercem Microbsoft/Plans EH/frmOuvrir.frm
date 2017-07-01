VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmOuvrir 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Ouvrir un plan"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7485
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmOuvrir.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   7485
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ListView lwPlans 
      Height          =   2655
      Left            =   120
      TabIndex        =   1
      Top             =   420
      Width           =   5955
      _ExtentX        =   10504
      _ExtentY        =   4683
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   327682
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   2
      BeginProperty ColumnHeader(1) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Plan"
         Object.Width           =   1411
      EndProperty
      BeginProperty ColumnHeader(2) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   1
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Titre"
         Object.Width           =   7056
      EndProperty
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   6300
      TabIndex        =   3
      Top             =   600
      Width           =   1095
   End
   Begin VB.CommandButton btnOuvrir 
      Caption         =   "&Ouvrir"
      Default         =   -1  'True
      Height          =   375
      Left            =   6300
      TabIndex        =   2
      Top             =   120
      Width           =   1095
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Liste des plans :"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1560
   End
End
Attribute VB_Name = "frmOuvrir"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmOuvrir
' Sélectionne un plan à ouvrir dans la base
' 26/04/1998 PV

Option Explicit

Dim sPlan As String

Function sPlanAOuvrir() As String
  sPlan = ""
  Show vbModal
  sPlanAOuvrir = sPlan
End Function

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnOuvrir_Click()
  If Not lwPlans.SelectedItem Is Nothing Then
    sPlan = lwPlans.SelectedItem.Text
    Unload Me
  End If
End Sub

Private Sub Form_Load()
  If Not bOuvreBase Then Unload Me: Exit Sub
  
  Dim rs As Recordset
  Set rs = db.OpenRecordset("select * from plan")
  While Not rs.EOF
    Dim itmX As ListItem
    Set itmX = lwPlans.ListItems.Add
    itmX.Text = rs!pla_plan
    itmX.SubItems(1) = rs!pla_titre
    rs.MoveNext
  Wend
  rs.Close
  
  FermeBase
  
  ' On présélectionne le premier de la liste
  If lwPlans.ListItems.Count > 0 Then lwPlans.ListItems(1).Selected = True
    
End Sub

Private Sub lwPlans_DblClick()
  btnOuvrir_Click
End Sub
