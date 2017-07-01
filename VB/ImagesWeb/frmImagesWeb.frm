VERSION 5.00
Begin VB.Form frmImagesWeb 
   Caption         =   "ImagesWeb"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnGénérer 
      Caption         =   "Générer"
      Height          =   495
      Left            =   2340
      TabIndex        =   0
      Top             =   300
      Width           =   1215
   End
End
Attribute VB_Name = "frmImagesWeb"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Const sPath As String = "D:\Web\sites\cergy2\"

Private Sub btnGénérer_Click()
  Dim p As Photo
  Dim colPhotos As New Collection
  
  Open sPath & "liste.txt" For Input As #1
  Do Until EOF(1)
    Dim sLigne As String
    Line Input #1, sLigne
    Dim pb As Integer
    pb = InStr(1, sLigne, " ")
    Set p = New Photo
    p.sFic = Left(sLigne, pb - 1)
    p.sTitre = Mid(sLigne, pb + 1)
    colPhotos.Add p
  Loop
  Close #1
  
  Open sPath & "photos.htm" For Output As #1
  Print #1, "<HTML>"
  Print #1, "<HEAD>"
  Print #1, "<TITLE>Images de Cergy 2</TITLE>"
  Print #1, "<link rel=""STYLESHEET"" href=""../../style.css"" type=""text/css"">"
  Print #1, "</HEAD>"
  Print #1, "<body bgcolor=""#FFFFFF"" text=""#000000"" link=""#003366"" vlink=""#0099CC"" alink=""#003366"" topmargin=""3"" leftmargin=""4"">"
  Print #1, "<H1>Images du site de Cergy 2</H1>"
  Print #1, "<p>Photos du 12/12/2001</p>"
  Print #1, "<table width=""100"">"

  Dim i As Integer
  For i = 1 To colPhotos.Count
    If (i Mod 4) = 1 Then
      If i <> 1 Then Print #1, "</TR>"
      Print #1, "<TR>"
    End If
    Print #1, "<td valign=""top"" align=""center"" width=""25%"">"
    Print #1, "<a href=""" & colPhotos(i).sFic & ".htm""><img src=""vig/" & colPhotos(i).sFic & ".jpg"" ></a><br>"
    Print #1, colPhotos(i).sTitre
    Print #1, "</TD>"
    
    Open sPath & colPhotos(i).sFic & ".htm" For Output As #2
    Print #2, "<HTML>"
    Print #2, "<HEAD>"
    Print #2, "<TITLE>" & colPhotos(i).sTitre & "</TITLE>"
    Print #2, "<link rel=""STYLESHEET"" href=""../../style.css"" type=""text/css"">"
    Print #2, "</HEAD>"
    Print #2, "<body bgcolor=""#FFFFFF"" text=""#000000"" link=""#003366"" vlink=""#0099CC"" alink=""#003366"" topmargin=""3"" leftmargin=""4"">"
    Print #2, "<H1>" & colPhotos(i).sTitre & "</H1>"
    If i <> colPhotos.Count Then Print #2, "<a href=""" & colPhotos(i + 1).sFic & ".htm"">Suiv</a>"
    If i <> 1 Then Print #2, "<a href=""" & colPhotos(i - 1).sFic & ".htm"">Prec</a>"
    Print #2, "<a href=""photos.htm"">Index</a><br>"
    Print #2, "<a href=""p100/" & colPhotos(i).sFic & ".jpg""><img src=""p50/" & colPhotos(i).sFic & ".jpg""></a>"
    Close #2
  Next
  
  Print #1, "</tr>"
  Print #1, "</table>"
  Print #1, "<hr color=""#000000"">"
  Print #1, "<p style=""margin-top=0pt""><a href=""../index.htm""><img src=""../../images/site0.gif"" align=""bottom"" border=""0"" width=""20"" height=""21""></a>"
  Print #1, "Retour au <a href=""index.htm"">Site de Cergy 2</a></p>"
  Print #1, "<address>"
  Print #1, "  (c) INF 2001"
  Print #1, "</address>"
  Print #1, "</BODY>"
  Close #1
  
  Beep
  Print "Terminé"
  
End Sub
