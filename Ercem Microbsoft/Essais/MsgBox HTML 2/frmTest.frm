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
    "<html>" & _
    "<head>" & _
    "<STYLE TYPE=""text/css"">" & _
    vbCrLf & "<!--" & vbCrLf & _
    "BODY      {color: #000000; font: 10pt Verdana, Arial;}" & vbCrLf & _
    "H1        {color: #FF3300; font: 13pt Verdana, Arial; font-weight:bold; background: #FFCC00}" & vbCrLf & _
    "A:link    {color: #0000FF; font: 10pt Verdana, Arial; font-weight:bold}" & vbCrLf & _
    "A:visited {color: #FF00FF; font: 10pt Verdana, Arial; font-weight:bold}" & vbCrLf & _
    "-->" & vbCrLf & _
    "</STYLE>" & vbCrLf & _
    "</head>" & vbCrLf
    
  sMsg = sMsg & _
    "<body bgcolor=""#F0E0C0"">" & _
    "<table bgcolor=""#000000"">" & _
    "<tr>" & _
    "<td> <img src=""file:///" & App.Path & "\fire2.gif"" WIDTH=48 HEIGHT=78> </td>" & _
    "<td valign=bottom> <h1> Fiche d'Envoi Urgent (FEU) </h1> </td>" & _
    "<td> <img src=""File:///" & App.Path & "\fire2.gif"" WIDTH=48 HEIGHT=78> </td>" & _
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
  
  HMsgBox sMsg, vbExclamation
End Sub
