VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnTest 
      Caption         =   "Test"
      Height          =   495
      Left            =   3240
      TabIndex        =   0
      Top             =   180
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const sOk As String = "ƒ ¡¢£¥¦ª«¬°±²µ·º»¼½¿ÄÅÆÇÉÑÖÜßàáâäåæçèéêëìíîïñòóôö÷ùúûüÿ"
Dim fso As FileSystemObject
Dim nfi As Long, nfo As Long

Private Sub Build_Supported_Charlist()
    On Error Resume Next
    Dim i As Integer, s As String
    For i = 128 To 255
        Err.Clear
        s = "\\gigats\data\8bit\" & Format(i) & " " & Chr(i)
        MkDir s
        If Err = 0 Then
            If Dir(s, vbDirectory) = Format(i) & " " & Chr(i) Then Debug.Print Chr(i);
        End If
    Next
    Debug.Print
End Sub


Private Sub btnTest_Click()
    Set fso = New FileSystemObject
    Open "c:\result.txt" For Output As #1
    Test "C:\"
    Print #1, nfi & " files"
    Print #1, nfo & " folders"
    Close #1
    MsgBox "Done"
End Sub

Sub Test(ByVal sFolder As String)
    nfo = nfo + 1
    Debug.Print sFolder
    DoEvents
    
    Dim fo As Folder
    Set fo = fso.GetFolder(sFolder)
    Dim fi As File
    For Each fi In fo.Files
        CheckPath sFolder, fi.Name
        nfi = nfi + 1
    Next
    Dim sfo As Folder
    For Each sfo In fo.SubFolders
        If sfo.Name <> "." And sfo.Name <> ".." Then
            CheckPath sFolder, sfo.Name & "\"
            Test sFolder & sfo.Name & "\"
        End If
    Next
End Sub

Private Sub CheckPath(sFolder As String, sFile As String)
    Dim i As Integer, c As String
    For i = 1 To Len(sFile)
        c = Mid(sFile, i, 1)
        If c < " " Or c > "~" Then
            If InStr(1, sOk, c) = 0 Then
                Print #1, sFolder & sFile
                Exit Sub
            End If
        End If
    Next
End Sub
