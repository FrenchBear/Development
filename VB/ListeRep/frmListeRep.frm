VERSION 5.00
Begin VB.Form frmListeRep 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Liste de répertoires"
   ClientHeight    =   5940
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8730
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5940
   ScaleWidth      =   8730
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lstTrace 
      Height          =   4935
      Left            =   120
      TabIndex        =   6
      Top             =   900
      Width           =   8475
   End
   Begin VB.CommandButton btnExplorer 
      Caption         =   "Explorer"
      Default         =   -1  'True
      Height          =   315
      Left            =   7380
      TabIndex        =   5
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton btnRecherche 
      Caption         =   "..."
      Height          =   315
      Left            =   6780
      TabIndex        =   2
      Top             =   120
      Width           =   375
   End
   Begin VB.TextBox txtSortie 
      Height          =   315
      Left            =   1680
      TabIndex        =   4
      Text            =   "c:\makerep.bat"
      Top             =   420
      Width           =   4995
   End
   Begin VB.TextBox txtDépart 
      Height          =   315
      Left            =   1680
      TabIndex        =   1
      Text            =   "c:\temp"
      Top             =   60
      Width           =   4995
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "&Fichier généré :"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   480
      Width           =   1095
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Départ de l'analyse :"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1440
   End
End
Attribute VB_Name = "frmListeRep"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Dim nbRep As Long
Dim nbTrunc As Integer


Private Sub btnExplorer_Click()
  On Error Resume Next
  Open txtSortie.Text For Output As #1
  
  If Err <> 0 Then
    MsgBox "Echec à la création de '" & txtSortie & "':" & vbCrLf & vbCrLf & Err.Source & " (" & Err.Number & "): " & Err.Description, vbExclamation, AppName
    Exit Sub
  End If
  Err.Clear
  
  Dim fso As FileSystemObject
  Set fso = New FileSystemObject
  
  Dim fo As Folder
  Set fo = fso.GetFolder(txtDépart)
  If Err <> 0 Then
    MsgBox "Echec lors de l'accès au répertoire '" & txtDépart & "':" & vbCrLf & vbCrLf & Err.Source & " (" & Err.Number & "): " & Err.Description, vbExclamation, AppName
    Exit Sub
  End If
  
  ' C'est parti !
  btnExplorer.Enabled = False
  nbRep = 0
  nbTrunc = Len(fo.Path) + 1
  If Right(fo.Path, 1) <> "\" Then nbTrunc = nbTrunc + 1
  
  Analyse fo
  AddTrace ""
  AddTrace "Terminé, " & nbRep & " dossier(s) explorés."
  Close #1
  btnExplorer.Enabled = True
End Sub

Sub AddTrace(ByVal sMsg As String)
  While lstTrace.ListCount > 100
    lstTrace.RemoveItem 0
  Wend
  lstTrace.AddItem sMsg
  lstTrace.ListIndex = lstTrace.ListCount - 1
  DoEvents
End Sub

Sub Analyse(fd As Folder)
  Dim f As Folder
  
  For Each f In fd.SubFolders
    AddTrace f.Path
    Print #1, "md """ & sANSItoOEM(Mid(f.Path, nbTrunc)) & """"
    nbRep = nbRep + 1
    Analyse f
  Next
End Sub

Private Sub btnRecherche_Click()
  Dim sRepNouv As String
  Dim sRep As String
  
  sRep = txtDépart
  sRepNouv = sBrowseForFolder(Me.hwnd, sRep, "Sélectionnez le répertoire point de départ de l'analyse.")
  If sRepNouv = "" Then Exit Sub
  txtDépart = sRepNouv
End Sub

