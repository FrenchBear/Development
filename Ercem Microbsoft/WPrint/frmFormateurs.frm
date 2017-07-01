VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmFormateurs 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Formateurs"
   ClientHeight    =   2970
   ClientLeft      =   1605
   ClientTop       =   2475
   ClientWidth     =   6585
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2970
   ScaleWidth      =   6585
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   2460
      Width           =   1095
   End
   Begin MSComctlLib.ListView lwFormateurs 
      Height          =   1995
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   6375
      _ExtentX        =   11245
      _ExtentY        =   3519
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   327680
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MouseIcon       =   "frmFormateurs.frx":0000
      NumItems        =   0
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Liste des formateurs enregistrés :"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2310
   End
End
Attribute VB_Name = "frmFormateurs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnOk_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  lwFormateurs.View = lvwReport
  Dim ch As ColumnHeader
  Set ch = lwFormateurs.ColumnHeaders.Add
  ch.Text = "Formateur"
  ch.Width = 800
  Set ch = lwFormateurs.ColumnHeaders.Add
  ch.Text = "Path"
  ch.Width = 4500
  
  Dim i As Integer
  For i = 0 To UBound(tFormateurs, 1)
    Dim itmX As ListItem
    Set itmX = lwFormateurs.ListItems.Add
    itmX.Text = tFormateurs(i, 0)
    itmX.SubItems(1) = tFormateurs(i, 1)
  Next
End Sub

