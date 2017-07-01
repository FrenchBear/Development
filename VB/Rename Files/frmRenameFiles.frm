VERSION 5.00
Begin VB.Form frmRenameFIles 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "File Rename"
   ClientHeight    =   3510
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4680
   Icon            =   "frmRenameFiles.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3510
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "When renamed file already exists"
      Enabled         =   0   'False
      Height          =   1275
      Left            =   60
      TabIndex        =   7
      Top             =   1680
      Width           =   4455
      Begin VB.OptionButton optRenum 
         Caption         =   "&Add _1 suffix to renamed file"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   960
         Width           =   3255
      End
      Begin VB.OptionButton optDelNewFile 
         Caption         =   "Delete e&xisting file (keep renamed file)"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   720
         Width           =   3255
      End
      Begin VB.OptionButton optDelOldFile 
         Caption         =   "&Delete renamed file (keep existing file)"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   480
         Width           =   3255
      End
      Begin VB.OptionButton optDoNothing 
         Caption         =   "&Keep old file (do not rename)"
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Width           =   3255
      End
   End
   Begin VB.CheckBox chkRecurse 
      Caption         =   "I&nclude subdirectories"
      Enabled         =   0   'False
      Height          =   255
      Left            =   1200
      TabIndex        =   2
      Top             =   420
      Width           =   1935
   End
   Begin VB.TextBox txtPath 
      Height          =   315
      Left            =   1200
      TabIndex        =   1
      Top             =   60
      Width           =   3315
   End
   Begin VB.TextBox txtReplace 
      Height          =   315
      Left            =   1200
      TabIndex        =   6
      Top             =   1200
      Width           =   3315
   End
   Begin VB.TextBox txtSearch 
      Height          =   315
      Left            =   1200
      TabIndex        =   4
      Top             =   840
      Width           =   3315
   End
   Begin VB.CommandButton btnGo 
      Caption         =   "&Replace"
      Enabled         =   0   'False
      Height          =   375
      Left            =   60
      TabIndex        =   12
      Top             =   3060
      Width           =   1215
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "&Path"
      Height          =   195
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   330
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "R&eplace"
      Height          =   195
      Left            =   60
      TabIndex        =   5
      Top             =   1260
      Width           =   600
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Search"
      Height          =   195
      Left            =   60
      TabIndex        =   3
      Top             =   900
      Width           =   510
   End
End
Attribute VB_Name = "frmRenameFIles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Option Compare Text

Private Sub btnGo_Click()
    If txtPath = "" Then
        MsgBox "Enter a path.", vbExclamation
        txtPath.SetFocus
        Exit Sub
    End If
    
    On Error GoTo pbPath
    ChDrive txtPath
    ChDir txtPath
    
    On Error GoTo 0
    Dim s As String
    s = Dir(txtPath & "\*.*")
    
    Dim nDel As Integer, nRen As Integer
    nDel = 0: nRen = 0
    
    While s <> ""
        Dim p As Integer
        p = InStr(1, s, txtSearch.Text, vbTextCompare)
        If p > 0 Then
            Dim s2 As String
            s2 = Left(s, p - 1) & txtReplace.Text & Mid(s, p + Len(txtSearch))
            On Error Resume Next
            Name txtPath & "\" & s As txtPath & "\" & s2
            If Err = 58 Then Kill s: nDel = nDel + 1 Else nRen = nRen + 1
            On Error GoTo 0
        End If
        s = Dir
    Wend
    MsgBox "Ren: " & nRen & ", Del: " & nDel
    Exit Sub
    
pbPath:
    MsgBox "Invalid or non-existent path:" & vbCrLf & "Error " & Err.Number & " (" & Err.Source & "): " & Err.Description, vbExclamation
    Exit Sub
End Sub

Private Sub txtSearch_Change()
    btnGo.Enabled = txtSearch.Text <> ""
End Sub


Private Sub txtPath_GotFocus()
    AutoSelect txtPath
End Sub

Private Sub txtSearch_GotFocus()
    AutoSelect txtSearch
End Sub

Private Sub txtReplace_GotFocus()
    AutoSelect txtReplace
End Sub

