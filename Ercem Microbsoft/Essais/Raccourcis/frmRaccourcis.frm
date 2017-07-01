VERSION 5.00
Begin VB.Form frmRaccourcis 
   Caption         =   "Form1"
   ClientHeight    =   3645
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7290
   LinkTopic       =   "Form1"
   ScaleHeight     =   3645
   ScaleWidth      =   7290
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnSpecialFolders 
      Caption         =   "SpecialFolders"
      Height          =   495
      Left            =   6000
      TabIndex        =   3
      Top             =   1920
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Liste programmes"
      Height          =   495
      Left            =   6000
      TabIndex        =   2
      Top             =   1260
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Liste raccourcis"
      Height          =   495
      Left            =   6000
      TabIndex        =   1
      Top             =   660
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Crée raccourci"
      Height          =   495
      Left            =   6000
      TabIndex        =   0
      Top             =   60
      Width           =   1215
   End
End
Attribute VB_Name = "frmRaccourcis"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub btnSpecialFolders_Click()
  Cls
  Dim WSHShell As Object
  Set WSHShell = CreateObject("WScript.Shell")
  
'  Dim i As Integer
'  On Error GoTo pb
'  For i = 0 To 20
'    Print i, WSHShell.SpecialFolders(i)
'  Next
'pb:
  
  Dim s
  For Each s In Array("AllUsersDesktop", "AllUsersStartMenu", "AllUsersPrograms", "AllUsersStartup", "Desktop", "Favorites", "Fonts", "MyDocuments", "NetHood", "PrintHood", "Programs", "Recent", "SendTo", "StartMenu", "Startup", "Templates")
    Print s, WSHShell.SpecialFolders(s)
  Next
End Sub


Private Sub Command1_Click()
  Cls
  Dim WSHShell As Object
  Set WSHShell = CreateObject("WScript.Shell")
  
  Dim MyShortcut, MyDesktop, DesktopPath
  
  ' Lecture du chemin du Bureau en utilisant l'objet WshSpecialFolders
  DesktopPath = WSHShell.SpecialFolders("Desktop")
  
  Print "Programmes dans " & WSHShell.SpecialFolders("Programs")
  
  ' Création d'un objet raccourci sur le Bureau
  Set MyShortcut = WSHShell.CreateShortcut(DesktopPath & "\Raccourci vers le Bloc-notes.lnk")
  
  ' Paramétrage des propriétés de l'objet raccourci et sauvegarde
  MyShortcut.TargetPath = WSHShell.ExpandEnvironmentStrings("%windir%\notepad.exe")
  MyShortcut.WorkingDirectory = WSHShell.ExpandEnvironmentStrings("%windir%")
  MyShortcut.WindowStyle = 4
  MyShortcut.IconLocation = WSHShell.ExpandEnvironmentStrings("%windir%\notepad.exe, 0")
  MyShortcut.Save
  
  MsgBox "Un raccourci vers le Bloc-notes est maintenant présent sur votre Bureau."
End Sub

Private Sub Command2_Click()
  Cls
  Dim s As String
  s = Dir("C:\WINDOWS\Menu Démarrer\Programmes\Microb'Soft\*.lnk")
  While s <> ""
    Print s
    s = Dir
  Wend
End Sub

Private Sub Command3_Click()
  Cls
  Dim s As String
  s = Dir("C:\Program files\Microbsoft\*.exe")
  While s <> ""
    Print s
    s = Dir
  Wend
End Sub
