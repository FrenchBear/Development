VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmTest 
   Caption         =   "Test ADO"
   ClientHeight    =   6915
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11745
   LinkTopic       =   "Form1"
   ScaleHeight     =   6915
   ScaleWidth      =   11745
   StartUpPosition =   3  'Windows Default
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
      Bindings        =   "frmTest.frx":0000
      Height          =   6315
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   9795
      _ExtentX        =   17277
      _ExtentY        =   11139
      _Version        =   393216
      DataMember      =   "Authors"
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
   End
   Begin VB.CommandButton btnTest 
      Caption         =   "Test"
      Height          =   495
      Left            =   10320
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

