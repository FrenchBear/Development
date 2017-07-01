VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5955
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   7215
   LinkTopic       =   "Form1"
   ScaleHeight     =   5955
   ScaleWidth      =   7215
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   60
      TabIndex        =   1
      Top             =   60
      Width           =   1215
   End
   Begin SHDocVwCtl.WebBrowser WB 
      Height          =   5115
      Left            =   60
      TabIndex        =   0
      Top             =   720
      Width           =   6975
      ExtentX         =   12303
      ExtentY         =   9022
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   ""
   End
End
Attribute VB_Name = "Form1"
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
    "<STYLE TYPE=""text/css"">" & vbCrLf & _
    "<!--" & vbCrLf & _
    "BODY      {color: #000000; font: 10pt Verdana, Arial;}" & vbCrLf & _
    "H1        {color: #FF3300; font: 13pt Verdana, Arial; font-weight:bold; background: #FFCC00}" & vbCrLf & _
    "A:link    {color: #0000FF; font: 10pt Verdana, Arial; font-weight:bold}" & vbCrLf & _
    "A:visited {color: #FF00FF; font: 10pt Verdana, Arial; font-weight:bold}" & vbCrLf & _
    "-->" & vbCrLf & _
    "</STYLE>" & _
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

    
    WB.Document.script.Document.Clear
    WB.Document.script.Document.Write sMsg
    WB.Document.script.Document.Close
End Sub

Private Sub Form_Load()
    WB.Navigate2 "about:blank"
    Command1_Click
End Sub
