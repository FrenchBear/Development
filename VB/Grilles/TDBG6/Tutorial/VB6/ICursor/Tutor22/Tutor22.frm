VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - Tutorial 22"
   ClientHeight    =   4050
   ClientLeft      =   1500
   ClientTop       =   1635
   ClientWidth     =   6585
   LinkTopic       =   "Form1"
   ScaleHeight     =   4050
   ScaleWidth      =   6585
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor22.frx":0000
      Height          =   2775
      Left            =   120
      OleObjectBlob   =   "Tutor22.frx":0014
      TabIndex        =   0
      Top             =   600
      Width           =   6375
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Retrieve APEX Layout"
      Height          =   495
      Left            =   4560
      TabIndex        =   3
      Top             =   3480
      Width           =   1935
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Save Layout"
      Height          =   495
      Left            =   2280
      TabIndex        =   2
      Top             =   3480
      Width           =   1935
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Retrieve Layout"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   3480
      Width           =   1935
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   "C:\TDBG6\TUTORIAL\TDBGDEMO.MDB"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   420
      Left            =   120
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "Composer"
      Top             =   120
      Width           =   6420
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
On Error GoTo Err:
' Load the layout
    TDBGrid1.LayoutName = "TestLayout"
    TDBGrid1.LayoutFileName = App.Path & "\Tutor22.grx"
    TDBGrid1.LoadLayout
    Exit Sub
Err:
    MsgBox Err.Description
End Sub

Private Sub Command2_Click()
' Save current layout
    TDBGrid1.LayoutFileName = App.Path & "\Tutor22.grx"
    TDBGrid1.Layouts.Add "TestLayout"
End Sub

Private Sub Command3_Click()
' Load layout from APEX
    TDBGrid1.LayoutName = "APEX"
    
' Start the download
    TDBGrid1.LayoutURL = "ftp://ftp.apexsc.com/pub/files/tutor22.grx"
    
' Set the order of records (by Country)
    Data1.RecordSource = "Select * From Composer Order By Country"
    Data1.Refresh
End Sub

Private Sub TDBGrid1_LayoutReady()
' Load layout as soon as it is available
    TDBGrid1.LoadLayout
End Sub
