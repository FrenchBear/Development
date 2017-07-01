VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form AddForm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Add Account...  (OLE DB)"
   ClientHeight    =   1665
   ClientLeft      =   2115
   ClientTop       =   1665
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
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   375
      Left            =   480
      Top             =   1200
      Visible         =   0   'False
      Width           =   2175
      _ExtentX        =   3836
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   8
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   ""
      OLEDBString     =   ""
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   ""
      Caption         =   "Adodc1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
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
      Height          =   285
      Left            =   1380
      TabIndex        =   3
      Top             =   540
      Width           =   4215
   End
   Begin VB.TextBox AccountID 
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
    ' Create a new account entry and display an error
    ' message if there's an error (such as a duplicate).

    On Error GoTo ermsg

    'Set flag for cloning unbound columns to True
    Main.doReclone = True
    'Set Criteria string to return to new record
    Main.Criteria = "AccountID = " & AccountID.Text

    If Adodc1.Recordset.EditMode = adEditAdd Then
        Adodc1.Recordset.Update
        Main.Adodc1.Recordset.Requery
    End If

    Main.Adodc1.Recordset.Find Main.Criteria, , adSearchForward
    Main.TDBGrid1.PostMsg 2
    Unload AddForm

Exit Sub
ermsg:
  MsgBox Error$
  Exit Sub
End Sub

Private Sub Command2_Click()
    If Adodc1.Recordset.EditMode <> adEditNone Then
        Adodc1.Recordset.CancelUpdate
    End If
    Main.TDBGrid1.Refresh
    Main.TDBGrid1.PostMsg 2
    Unload AddForm
End Sub


Private Sub Form_Load()
    Set Adodc1.Recordset = Main.Adodc1.Recordset
    Set AccountID.DataSource = Adodc1
    Set Desc.DataSource = Adodc1
    Main.TDBGrid1.Close (False)
 
    AccountID.DataField = "AccountID"
    Desc.DataField = "AccountName"
    Adodc1.Recordset.AddNew
End Sub
