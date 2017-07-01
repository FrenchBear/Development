VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form frmODBC 
   Caption         =   "ODBC Grid Sample"
   ClientHeight    =   4350
   ClientLeft      =   1230
   ClientTop       =   1650
   ClientWidth     =   5790
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmODBC.frx":0000
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4350
   ScaleWidth      =   5790
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Height          =   3615
      Left            =   0
      OleObjectBlob   =   "frmODBC.frx":0442
      TabIndex        =   3
      Top             =   0
      Width           =   5775
   End
   Begin VB.Frame Frame1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   0
      TabIndex        =   0
      Top             =   3600
      Width           =   3615
      Begin VB.CommandButton Command4 
         Caption         =   "Ã"
         BeginProperty Font 
            Name            =   "Wingdings"
            Size            =   18
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   3120
         TabIndex        =   5
         ToolTipText     =   "Move Last"
         Top             =   240
         Width           =   375
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Æ"
         BeginProperty Font 
            Name            =   "Wingdings"
            Size            =   18
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2760
         TabIndex        =   4
         ToolTipText     =   "Move First"
         Top             =   240
         Width           =   375
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Disconnect"
         Height          =   375
         Left            =   1320
         TabIndex        =   2
         Top             =   240
         Width           =   1095
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Connect"
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   1095
      End
   End
End
Attribute VB_Name = "frmODBC"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim Sink As New clsOdbc

Private Sub Command1_Click()
    Sink.Connect Me.hWnd, "DSN=biblio", "Select * From titles"
    Sink.Attach TDBGrid1
    TDBGrid1.Bookmark = Null
    TDBGrid1.ReBind
    TDBGrid1.SetFocus
End Sub

Private Sub Command2_Click()
    Sink.Disconnect
    Sink.Attach Nothing
    TDBGrid1.ReBind
    TDBGrid1.Bookmark = Null
    TDBGrid1.Close True
End Sub

Private Sub Command3_Click()
    TDBGrid1.MoveFirst
    TDBGrid1.SetFocus
End Sub

Private Sub Command4_Click()
    TDBGrid1.MoveLast
    TDBGrid1.SetFocus
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    If WindowState <> vbMinimized Then
        TDBGrid1.Width = Me.ScaleWidth
        TDBGrid1.Height = Me.ScaleHeight - 750
        Frame1.Move 0, Me.ScaleHeight - 750
    End If
End Sub

