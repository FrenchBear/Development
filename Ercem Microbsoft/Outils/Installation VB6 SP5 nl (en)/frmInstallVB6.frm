VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Installation des composants VB6 (SP4)"
   ClientHeight    =   2925
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4950
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2925
   ScaleWidth      =   4950
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin TrueOleDBGrid60.TDBDropDown TDBDropDown1 
      Height          =   555
      Left            =   180
      OleObjectBlob   =   "frmInstallVB6.frx":0000
      TabIndex        =   4
      Top             =   1800
      Width           =   1215
   End
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Height          =   555
      Left            =   180
      OleObjectBlob   =   "frmInstallVB6.frx":200F
      TabIndex        =   3
      Top             =   1200
      Width           =   1215
   End
   Begin MSComCtl2.UpDown UpDown1 
      Height          =   795
      Left            =   2220
      TabIndex        =   2
      Top             =   1980
      Width           =   240
      _ExtentX        =   344
      _ExtentY        =   1402
      _Version        =   393216
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   3420
      Top             =   1320
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   393216
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1860
      TabIndex        =   1
      Top             =   1380
      Width           =   1215
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   1620
      Top             =   2040
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin SHDocVwCtl.WebBrowser WebBrowser1 
      Height          =   615
      Left            =   720
      TabIndex        =   0
      Top             =   420
      Width           =   1635
      ExtentX         =   2884
      ExtentY         =   1085
      ViewMode        =   1
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   -1  'True
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   ""
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   4020
      Top             =   240
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSWLess.WLText WLText1 
      Height          =   315
      Left            =   3060
      TabIndex        =   5
      Top             =   2160
      Width           =   1035
      _ExtentX        =   1826
      _ExtentY        =   556
      _Version        =   393216
      Text            =   "WLText1"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' InstallVB6
' Projet 'factice' pour installer sur une machine tous les fichiers
' nécessaires au VB6
' 25/07/1999 PV VB6+SP3
'  4/11/1999 PV TrueDBGrid+XArrayDB
' 10/07/2000 PV SP4+WindowLess controls
' 25/10/2001 PV SP5, Dutch


Dim x As XArrayDB

' Une référence au DataReport, pour éviter les optimisations
' qui conduiraient à éliminer le DataReport de l'exécutable final
' si celui-ci n'est pas référencé

Private Sub Command1_Click()
  DataReport1.Show
End Sub
