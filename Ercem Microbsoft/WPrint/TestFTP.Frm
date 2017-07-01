VERSION 4.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   8490
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   6645
   Height          =   8895
   Left            =   1080
   LinkTopic       =   "Form1"
   ScaleHeight     =   8490
   ScaleWidth      =   6645
   Top             =   1170
   Width           =   6765
   Begin VB.CommandButton Command2 
      Caption         =   "GetFile"
      Height          =   495
      Left            =   3060
      TabIndex        =   1
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Connect"
      Height          =   495
      Left            =   3060
      TabIndex        =   0
      Top             =   1800
      Width           =   1215
   End
   Begin FTPCTLib.FTP FTP 
      Left            =   4980
      Top             =   540
      _ExtentX        =   741
      _ExtentY        =   741
      RemoteHost      =   "127.0.0.1"
      RemotePort      =   21
      ConnectTimeout  =   0
      RecvTimeout     =   0
      NotificationMode=   0
      UserId          =   ""
      Password        =   ""
      AppendToFile    =   0   'False
      ListItemNotify  =   -1  'True
      RemoteFile      =   ""
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
' TestFTP
' 18/03/97 PV

Option Explicit

Private Sub Command1_Click()
  FTP.RemoteHost = "serveur.ercem.com"
  FTP.UserId = "root"
  FTP.Password = "ercem"
  FTP.Connect
End Sub

Private Sub Command2_Click()
  FTP.RemoteFile = "/tmp/wprint.out"
  FTP.DocOutput.filename = "c:\tmp\wprint.out"
  FTP.GetFile "/tmp/wprint.out", "c:\tmp\wprint.out"
End Sub

Private Sub FTP_Abort()
  Print "FTP_Abort"
End Sub

Private Sub FTP_Account()
  Print "FTP_Account"
End Sub

Private Sub FTP_Busy(ByVal isBusy As Boolean)
  Print "FTP_Busy "; isBusy
End Sub

Private Sub FTP_Cancel()
  Print "FTP_Cancel"
End Sub

Private Sub FTP_ChangeDir()
  Print "FTP_ChangeDir"
End Sub

Private Sub FTP_CreateDir()
  Print "FTP_CreateDir"
End Sub

Private Sub FTP_DeleteDir()
  Print "FTP_DeleteDir"
End Sub

Private Sub FTP_DelFile()
  Print "FTP_DelFile"
End Sub

Private Sub FTP_DocInput(ByVal DocInput As DocInput)
'
End Sub

Private Sub FTP_DocOutput(ByVal DocOutput As DocOutput)
'
End Sub

Private Sub FTP_Error(Number As Integer, Description As String, Scode As Long, Source As String, HelpFile As String, HelpContext As Long, CancelDisplay As Boolean)
  Print "FTP_Error -> "; Number; " "; Description; " "; Scode; " "; Source
End Sub

Private Sub FTP_Execute()
  Print "FTP_Execute"
End Sub

Private Sub FTP_Help()
  Print "FTP_Help"
End Sub

Private Sub FTP_ListItem(ByVal Item As FTPDirItem)
  Print "FTP_ListItem"
End Sub

Private Sub FTP_Log()
  Print "FTP_Log"
End Sub

Private Sub FTP_mode()
  Print "FTP_Mode"
End Sub

Private Sub FTP_Noop()
  Print "FTP_Noop"
End Sub

Private Sub FTP_ParentDir()
  Print "FTP_ParentDir"
End Sub

Private Sub FTP_PrintDir()
  Print "FTP_PrintDir"
End Sub

Private Sub FTP_ProtocolStateChanged(ByVal ProtocolState As Integer)
  Print "FTP_ProtocolStateChanged -> "; ProtocolState
End Sub

Private Sub FTP_Reinitialize()
  Print "FTP_Reinitialize"
End Sub

Private Sub FTP_Site()
  Print "FTP_Site"
End Sub

Private Sub FTP_StateChanged(ByVal State As Integer)
  Print "FTP_StateChanged -> "; State
End Sub

Private Sub FTP_Status()
  Print "FTP_Status"
End Sub

Private Sub FTP_System()
  Print "FTP_System"
End Sub

Private Sub FTP_Timeout(ByVal event As Integer, Continue As Boolean)
  Print "FTP_Timeout -> "; event; " "; Continue
End Sub

Private Sub FTP_Type()
  Print "FTP_Type"
End Sub
