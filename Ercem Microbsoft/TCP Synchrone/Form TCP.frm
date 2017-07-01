VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmTCP 
   Caption         =   "Communications TCP/IP"
   ClientHeight    =   2940
   ClientLeft      =   8550
   ClientTop       =   7305
   ClientWidth     =   6375
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   196
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   425
   ShowInTaskbar   =   0   'False
   Begin MSWinsockLib.Winsock TCP 
      Left            =   5400
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.TextBox txtSelect 
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   60
      Locked          =   -1  'True
      TabIndex        =   2
      Top             =   2580
      Width           =   6255
   End
   Begin VB.CheckBox chkTrace 
      Caption         =   "&Trace"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Value           =   1  'Checked
      Width           =   975
   End
   Begin VB.ListBox lstTrace 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1950
      Left            =   60
      TabIndex        =   0
      Top             =   480
      Width           =   6255
   End
End
Attribute VB_Name = "frmTCP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille de la bibliothèque TCPSynchrone, interne, pour supporter le contrôle TCP et le code événementiel"
' frmTCP
' Feuille de la bibliothèque TCPSynchrone, interne, pour supporter le contrôle TCP et le code événementiel
' Contient le contrôle TCP utilisé (on ne peut pas le gérer directement dans une classe)

Option Explicit

Private sBufferRéception As String  ' Réception sous forme de buffer caractère
Public tcps As TCPSynchrone

Sub Envoie(ByVal sCmd As String)
  Do
    If Len(sCmd) <= 250 Then
      TCP.SendData sCmd + Chr(10)
      Trace "E", sCmd
    Exit Do
    End If
    TCP.SendData Left(sCmd, 250) + "&" + Chr(10)
    Trace "E", Left(sCmd, 250) + "&"
    sCmd = Mid(sCmd, 251)
  Loop
End Sub

Sub Ferme()
  TCP.Close
  TCP.LocalPort = 0
End Sub

Function bConnect(ByVal sHost As String, ByVal iPort As Integer) As Boolean
  Dim t As Single
  t = Timer
  TCP.Connect sHost, iPort
  Do
    DoEvents
  Loop Until TCP.State = sckConnected Or TCP.State = sckError Or Timer - t > 10
  If TCP.State = sckConnected Then
    bConnect = True
  Else
    bConnect = False
    TCP.Close
  End If
End Function

Sub Connect(ByVal sHost As String, ByVal iPort As Integer)
  bConnect sHost, iPort
End Sub

Function GetState() As Integer
  GetState = TCP.State
End Function

Private Sub Trace(cType As String, sMessage As String)
  If chkTrace Then
    lstTrace.AddItem cType + " " + sMessage
    If lstTrace.ListCount = 300 Then lstTrace.RemoveItem 0
    lstTrace.ListIndex = lstTrace.ListCount - 1
  End If
End Sub

Private Sub Form_Resize()
  If ScaleWidth > 200 And ScaleHeight > 100 Then
    lstTrace.Width = 417 + ScaleWidth - 425
    lstTrace.height = 134 + ScaleHeight - 196
    txtSelect.Width = 417 + ScaleWidth - 425
    txtSelect.Top = 172 + ScaleHeight - 196
  End If
End Sub

Private Sub lstTrace_Click()
  txtSelect = lstTrace.Text
End Sub

' Reçoit les données
' Les découpe en lignes (terminées par combinaison de \r ou \n)
' Les ranges dans la file FileRéception
Private Sub TCP_DataArrival(ByVal bytesTotal As Long)
  Dim vtData As String
  Dim p As Integer, p1 As Integer, p2 As Integer
  
  TCP.GetData vtData

  sBufferRéception = sBufferRéception + vtData
  Do
    p1 = InStr(sBufferRéception, Chr(10))
    p2 = InStr(sBufferRéception, Chr(13))
    If p1 = 0 Then p1 = 1000
    If p2 = 0 Then p2 = 1000
    p = p1
    If p2 < p Then p = p2
    If p = 1000 Then Exit Do
  
    ' Commandes spéciales à l'initiative du démon
    If Left(sBufferRéception, 4) = "%BYE" Then
      MsgBox "Programme inactif depuis plus d'une heure, sortie forcée par le serveur.", vbCritical, App.Title
      EmergencyExit
    End If

    tcps.AjouteLigne Left(sBufferRéception, p - 1)
    Trace "R", Left(sBufferRéception, p - 1)
    Do
      p = p + 1
      If p > Len(sBufferRéception) Then Exit Do
      If Mid(sBufferRéception, p, 1) <> Chr(13) And Mid(sBufferRéception, p, 1) <> Chr(10) Then Exit Do
    Loop
    sBufferRéception = Mid(sBufferRéception, p)
  Loop
End Sub

Private Sub TCP_Close()
  Trace "-", "TCP Close"
End Sub

Private Sub TCP_Error(ByVal Number As Integer, Description As String, ByVal sCode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
  Trace "-", "TCP Error Number:" & Number & " Description:" & Description & " Scode:" & sCode & " Source:" & Source & " HelpFile:" & HelpFile & " HelpContext:" & HelpContext & " CancelDisplay:" & CancelDisplay
  'MsgBox2i "CO071", Number, Description, sCode, Source, HelpFile, HelpContext, CancelDisplay
  MsgBox "TCP ERROR !" & vbCrLf & vbCrLf & "TCP Error Number: " & Number & vbCrLf & "Description: " & Description & vbCrLf & "sCode: " & sCode & vbCrLf & "Source: " & Source & vbCrLf & "HelpFile: " & HelpFile & vbCrLf & "HelpContext: " & HelpContext & vbCrLf & "CancelDisplay: " & CancelDisplay, vbCritical, sNomApp
End Sub



'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "TCCaption"
  
  SetLib chkTrace, "Caption", "TCchkTrace"
End Sub


