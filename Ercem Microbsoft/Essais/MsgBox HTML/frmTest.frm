VERSION 5.00
Begin VB.Form frmTest 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1080
      TabIndex        =   0
      Top             =   600
      Width           =   1215
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
  Dim sMsg As String
  
  sMsg = _
    "<table bgcolor=""#000000"">" & _
    "<tr>" & _
    "<td> <img src=""D:\Microbsoft\Essais\MsgBox HTML\fire2.gif"" WIDTH=48 HEIGHT=78> </td>" & _
    "<td valign=bottom> <h1> Fiche d'Envoi Urgent </h1> </td>" & _
    "<td> <img src=""D:\Microbsoft\Essais\MsgBox HTML\fire2.gif"" WIDTH=48 HEIGHT=78> </td>" & _
    "</tr>" & _
    "</table>" & _
    "<P>Il était un petit navire, qui n'avait <a href=""http://www.google.com"">jamais</a> navigué.</P>" & _
    "<script language=""VBScript"">" & vbCrLf & _
    "Option Explicit" & vbCrLf & _
    "Sub Toto()" & vbCrLf & _
    "  MsgBox ""Clock !""" & vbCrLf & _
    "End Sub" & vbCrLf & _
    "</script>" & vbCrLf & _
    "<input type=""button"" name=""btnCalc"" value=""Calculatrice"" onclick=""navigate('interne:calc')"">" & vbCrLf & _
    "<a name=""Lien"" href=""exec:calc"">Calculatrice</a> " & _
    "<a name=""Lien interne"" href=""interne:link"">Lien Interne</a>"
  
  Clipboard.Clear
  Clipboard.SetText sMsg
    
  HMsgBox sMsg, vbExclamation
End Sub
