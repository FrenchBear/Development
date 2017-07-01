VERSION 5.00
Begin VB.Form AddForm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Add Account..."
   ClientHeight    =   1665
   ClientLeft      =   2535
   ClientTop       =   2145
   ClientWidth     =   5775
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Icon            =   "GLADD.frx":0000
   LinkTopic       =   "Form2"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1665
   ScaleWidth      =   5775
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   240
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   1080
      Visible         =   0   'False
      Width           =   2655
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H80000005&
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   4560
      TabIndex        =   5
      Top             =   1080
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H80000005&
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   3360
      TabIndex        =   4
      Top             =   1080
      Width           =   1095
   End
   Begin VB.TextBox Desc 
      DataSource      =   "Data1"
      Height          =   285
      Left            =   1380
      TabIndex        =   3
      Top             =   540
      Width           =   4215
   End
   Begin VB.TextBox AccountID 
      DataSource      =   "Data1"
      Height          =   285
      Left            =   1380
      TabIndex        =   2
      Top             =   180
      Width           =   1575
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "Description:"
      Height          =   255
      Left            =   180
      TabIndex        =   1
      Top             =   600
      Width           =   1155
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Caption         =   "Account #:"
      Height          =   255
      Left            =   180
      TabIndex        =   0
      Top             =   240
      Width           =   1095
   End
End
Attribute VB_Name = "AddForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ---------------------------------------------------------
'       Copyright ©1995-1998 APEX Software Corporation
'
' You have a royalty-free right to use, modify, reproduce,
' and distribute the True DBGrid Pro 6 sample application files
' (and/or any modified version) in any way you find useful,
' provided that you agree that APEX Software Corporation
' has no warranty, obligations, or liability for any sample
' application files.
' ---------------------------------------------------------
Option Explicit

Private Sub Command1_Click()
    On Error GoTo ermsg
    ' Create a new account entry and display an error
    ' message if there's an error (such as a duplicate).

    'Set flag for cloning unbound columns to True
    Main.doreclone = True
    'Set Criteria string to return to new record
    Main.Criteria = "AccountID = " & AccountID.Text
    
    If Data1.Recordset.EditMode = dbEditAdd Then
        Data1.Recordset.Update
        'Requery the data control so the account appears in proper
        'sorted order.
        Main.Data1.Recordset.Requery
    End If
    
    'Position to the account we just added.
    Main.Data1.Recordset.FindFirst Main.Criteria
    
    Main.TDBGrid1.PostMsg 2
    Unload AddForm
    
Exit Sub
ermsg:
  MsgBox Error$
  Exit Sub
End Sub

Private Sub Command2_Click()
    If Data1.Recordset.EditMode <> dbEditNone Then
        Data1.Recordset.CancelUpdate
    End If
    Main.TDBGrid1.ReBind
    Main.TDBGrid1.PostMsg 2
    Unload AddForm
End Sub

Private Sub Form_Load()
    Set Data1.Recordset = Main.Data1.Recordset
    Main.TDBGrid1.Close (False)
    AccountID.DataField = "AccountID"
    Desc.DataField = "AccountName"
    Data1.Recordset.AddNew
End Sub
