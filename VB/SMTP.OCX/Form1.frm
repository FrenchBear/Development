VERSION 5.00
Object = "{3DF2AE33-26A8-11D4-BDD2-00104BFEC09F}#7.0#0"; "SMTP.ocx"
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
   Begin SMTPControl.SMTP SMTP1 
      Left            =   3960
      Top             =   180
      _ExtentX        =   873
      _ExtentY        =   873
      Server          =   ""
      Port            =   ""
      Username        =   ""
      Password        =   ""
      SendTo          =   ""
      CC              =   ""
      BCC             =   ""
      MailFrom        =   ""
      Charset         =   ""
      MailDate        =   ""
      MessageSubject  =   ""
      MessageText     =   ""
      MessageHTML     =   ""
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1740
      TabIndex        =   0
      Top             =   1320
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Essais SMTP.OCX
' 19/12/03 PV

Option Explicit

Private Sub Command1_Click()
  SMTP1.Server = "frpar01"
  SMTP1.Port = 25
  SMTP1.Attachments.Add "c:\autoexec.bat"
  SMTP1.MessageSubject = "Essai de message avec SMTP.OCX"
  SMTP1.MessageText = "ceci est le corps du message" & vbCrLf & "Deuxième et dernière ligne"
  SMTP1.SendTo = "pierre_violent@sgs.com"
  SMTP1.MailFrom = "pierre_violent@sgs.com"
  SMTP1.SendEmail
End Sub

Private Sub SMTP1_CloseSMTP()
  Debug.Print "SMTP1_CloseSMTP"
End Sub

Private Sub smtp1_ConnectSMTP()
  Debug.Print "smtp1_ConnectSMTP"
End Sub

Private Sub SMTP1_ErrorSMTP(ByVal Number As Integer, Description As String)
  Debug.Print "SMTP1_ErrorSMTP: " & Number & ": " & Description
End Sub

Private Sub SMTP1_SendSMTP()
  Debug.Print "SMTP1_SendSMTP"
End Sub
