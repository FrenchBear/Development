VERSION 5.00
Begin VB.Form frmRaccourcis 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Raccourcis"
   ClientHeight    =   6195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5670
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmRaccourcis.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6195
   ScaleWidth      =   5670
   Begin VB.CheckBox chkTrace 
      Caption         =   "Traces détaillées"
      Height          =   390
      Left            =   4200
      TabIndex        =   5
      Top             =   480
      Width           =   1275
   End
   Begin VB.CommandButton btnMenuDémarrerAutres 
      Caption         =   "Menu Démarrer Autres"
      Height          =   735
      Left            =   2820
      TabIndex        =   2
      Tag             =   "Mettre à jour la base de registre"
      Top             =   60
      Width           =   1275
   End
   Begin VB.ListBox lstTrace 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5280
      Left            =   0
      TabIndex        =   4
      Top             =   900
      Width           =   5655
   End
   Begin VB.CommandButton btnMenuDémarrerMicrobsoft 
      Caption         =   "Menu Démarrer Microb'Soft"
      Height          =   735
      Left            =   1440
      TabIndex        =   1
      Tag             =   "Mettre à jour la base de registre"
      Top             =   60
      Width           =   1275
   End
   Begin VB.CommandButton btnODBC 
      Caption         =   "Sources ODBC"
      Height          =   735
      Left            =   60
      TabIndex        =   0
      Tag             =   "Mettre à jour la base de registre"
      Top             =   60
      Width           =   1275
   End
   Begin VB.CommandButton btnQuitter 
      Cancel          =   -1  'True
      Caption         =   "&Quitter"
      Height          =   375
      Left            =   4260
      TabIndex        =   3
      Tag             =   "Quitter l'application"
      Top             =   60
      Width           =   1275
   End
End
Attribute VB_Name = "frmRaccourcis"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmRaccourcis
' Feuille interactive du programme de mise à jour des raccourcis de Microb'Soft
' 21/08/1998 SS
' 31/08/1998 PV Remise en forme complète du code
' 24/02/2000 PV 1.2 Prise en compte de l'Italie
'  7/04/2000 PV 1.3 Windows 2000
' 19/04/2000 PV 1.4 Utilisation de SocketInfo au lieu de winsock.ocx
' 16/10/2000 PV 1.5 Z: -> X:


Option Explicit
  
Const sNomApp As String = "Mise à jour des raccourcis Microb'Soft"



Private Sub btnODBC_Click()
  MAJODBC
  Trace "Terminé"
  Beep
End Sub

Private Sub btnMenuDémarrerMicrobsoft_Click()
  MAJMenuMicrobsoft
  Trace "Terminé"
  Beep
End Sub

Private Sub btnMenuDémarrerAutres_Click()
  MAJMenuDémarrer
  Trace "Terminé"
  Beep
End Sub


Private Sub btnQuitter_Click()
  Unload Me
End Sub


' -----------------------------

Private Sub Form_Load()
  Dim sApp As String
  Select Case LangueSystème
    Case LANG_ITALIAN:
      sApp = "Collegamenti"
      btnMenuDémarrerAutres.Enabled = False
      btnQuitter.Caption = "&Esci"
      sExplorateurWindows = "Explorateur Windows"
      
    Case LANG_DUTCH:
      sApp = "Snelkoppeling"
      btnMenuDémarrerAutres.Enabled = False
      btnQuitter.Caption = "&Einde"
      sExplorateurWindows = "Windows Verkenner"
      
    Case Else:
      sApp = "Raccourcis"
      sExplorateurWindows = "Explorateur Windows"
  End Select
  
  Caption = sApp & " " & App.Major & "." & App.Minor & "." & App.Revision

  On Error GoTo Problème
  InitRaccourcis
  Trace ""

  If StrComp(Command, "-i", vbTextCompare) = 0 Then
    InstallationWShell
    EmergencyExit
  ElseIf StrComp(Command, "-tout", vbTextCompare) = 0 Then
    MAJODBC
    MAJMenuMicrobsoft
    MAJMenuDémarrer
    EmergencyExit
  ElseIf StrComp(Command, "-1", vbTextCompare) = 0 Then
    MAJMenuDémarrer
    EmergencyExit
  Else
    ' Centrage de la feuille à l'écran
    Move (Screen.Width - Width) \ 2, (Screen.Height - Height) \ 2
  End If
  Exit Sub
  
Problème:
  Show
  Dim MessageErreur As String
  MessageErreur = Err.Description
  If Err = 429 Or Err = 430 Then
    MessageErreur = MessageErreur & vbCrLf & "Vous devez installer WSHShell !" & vbCrLf & vbCrLf & "Voulez-vous l'installer maintenant ?"
    If vbYes = MsgBox("Échec à l'éxécution: " & vbCrLf & Err.Number & " (" & Err.Source & "): " & MessageErreur, vbCritical + vbYesNo, sNomApp) Then
      InstallationWShell
    End If
  Else
    MsgBox "Échec à l'éxécution: " & vbCrLf & Err.Number & " (" & Err.Source & ") " & MessageErreur, vbCritical, sNomApp
  End If
  End
End Sub


Public Sub EmergencyExit()
  Dim f As Form
  On Error Resume Next
  For Each f In Forms
    Unload f
  Next
  End
End Sub


Private Sub InstallationWShell()
  Dim sApp As String
  Select Case LangueSystème
    Case LANG_ITALIAN: sApp = "X:\Install.ber\ste51it Windows Scripting.exe"
    Case LANG_FRENCH: sApp = "X:\Install\Windows Updates\ste51fr Windows Scripting 5.1 fr.exe"
    Case Else: MsgBox "L'installation de Windows Scripting n'est pas disponible dans la langue " & LangueSystème: Exit Sub
  End Select
  
  Shell """" & sApp & """ /q", vbNormalFocus
End Sub

