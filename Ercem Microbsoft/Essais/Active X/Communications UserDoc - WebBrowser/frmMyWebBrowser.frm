VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "SHDOCVW.DLL"
Begin VB.Form frmMyWebBrowser 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "frmMyWebBrowser"
   ClientHeight    =   3465
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5040
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3465
   ScaleWidth      =   5040
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnDéfinit 
      Caption         =   "Définir"
      Default         =   -1  'True
      Height          =   375
      Left            =   3360
      TabIndex        =   2
      Top             =   2820
      Width           =   1395
   End
   Begin VB.TextBox txtAutre 
      Height          =   375
      Left            =   180
      TabIndex        =   1
      Top             =   2820
      Width           =   2775
   End
   Begin SHDocVwCtl.WebBrowser wb 
      Height          =   2235
      Left            =   180
      TabIndex        =   0
      Top             =   240
      Width           =   4515
      ExtentX         =   7964
      ExtentY         =   3942
      ViewMode        =   1
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   -1  'True
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   ""
   End
End
Attribute VB_Name = "frmMyWebBrowser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnDéfinit_Click()
  wb.Document.CustomerID = txtAutre
End Sub

Private Sub Form_Load()
  'wb.Navigate "D:\VB5\UserDocument1.vbd"
  wb.Navigate "D:\Microbsoft\Essais Active X\Comm UD WB\docMyWebDocument.vbd"
End Sub

