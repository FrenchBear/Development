VERSION 5.00
Begin VB.Form frmTestSHFileOperation 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      Height          =   495
      Left            =   1740
      TabIndex        =   1
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1740
      TabIndex        =   0
      Top             =   1380
      Width           =   1215
   End
End
Attribute VB_Name = "frmTestSHFileOperation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTestSHFileOperation
' 11/11/97 PV

Option Explicit

Private Sub Command1_Click()
   Dim result As Long
   Dim fileop As SHFILEOPSTRUCT
   With fileop
      .hwnd = Me.hwnd

      .wFunc = FO_COPY

      'The files to copy separated by Nulls and terminated by 2
      'null. The files VB.HLP and VB.CNT are installed by a complete
      'installation of Microsoft Visual Basic. If you do not have
      'these files, you can alter this sample to point to existing
      'files.

      .pFrom = "F:\VB5\HELP\VB5.HLP" & vbNullChar & "F:\VB5\HELP\VB5.CNT" & vbNullChar & vbNullChar

      'or to copy all files use this line
      '.pFrom = "C:\*.*" & vbNullChar & vbNullChar

      'The directory or filename(s) to copy into terminated in 2
      'nulls.
      .pTo = "C:\tmp\" & vbNullChar & vbNullChar

      .fFlags = FOF_SIMPLEPROGRESS Or FOF_FILESONLY
      '.fFlags = FOF_CREATEPROGRESSDLG Or FOF_FILESONLY
      
   End With

   result = SHFileOperation(fileop)

   If result <> 0 Then        'Operation failed
      MsgBox Err.LastDllError 'Msgbox the error that occurred in the
                              'API.
   Else
      If fileop.fAnyOperationsAborted <> 0 Then
         MsgBox "Operation Failed"
      End If
   End If
End Sub

Private Sub Command2_Click()
   Dim DelFileOp As SHFILEOPSTRUCT
   Dim result As Long
   With DelFileOp
      .hwnd = Me.hwnd
      .wFunc = FO_DELETE
      'Delete the files you just moved to C:\tmp.
      'The files VB.HLP and VB.CNT are installed by a complete
      'installation of Microsoft Visual Basic. If you do not have
      'these files, you can alter this sample to point to existing
      'files.

      .pFrom = "C:\tmp\vb5.hlp" & vbNullChar & _
               "c:\tmp\vb5.cnt" & vbNullChar & vbNullChar
      'Allow undo--in other words, place the files into the Recycle
      'Bin
      .fFlags = FOF_ALLOWUNDO Or FOF_NOCONFIRMATION
   End With
   result = SHFileOperation(DelFileOp)
   If result <> 0 Then        'Operation failed
      MsgBox Err.LastDllError 'Msgbox the error that occurred in the
                              'API.
   Else
      If DelFileOp.fAnyOperationsAborted <> 0 Then
         MsgBox "Operation Failed"
      End If
   End If
End Sub

Private Sub Form_Load()
   Command1.Caption = "Copy Test"
   Command2.Caption = "Recycle Test"
End Sub

