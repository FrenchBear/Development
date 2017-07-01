VERSION 5.00
Begin VB.Form frmContact 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Planche de contact"
   ClientHeight    =   3195
   ClientLeft      =   3690
   ClientTop       =   2955
   ClientWidth     =   4680
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   213
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   312
   Begin VB.Image Img 
      Height          =   495
      Left            =   1800
      Top             =   1320
      Visible         =   0   'False
      Width           =   1215
   End
End
Attribute VB_Name = "frmContact"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' AfficheImage - frmContact
' Feuille utilisée pour la génération des plances de contact
' PV mai 97


Option Explicit

' Dessine une vignette contenant le nom et l'image d'un fichier
Sub Vignette(i As Integer, j As Integer, sRep As String, sFic As String, iVignettesColonnes As Integer, iVignettesLignes As Integer)
Attribute Vignette.VB_Description = "Dessine une vignette sur la planche de contact"
  Dim x As Single, y As Single
  Dim w As Single, h As Single
  
  w = (ScaleWidth - 1) / iVignettesColonnes
  h = (ScaleHeight - 1) / iVignettesLignes
  x = i * w
  y = h * j
  Line (x, y)-Step(w, h), , B
  
  TexteCentré Me, x, x + w, y + h - TextHeight(sFic), sFic
  
  x = x + 2
  y = y + 2
  w = w - 3
  h = h - 4
  
  h = h - TextHeight(sFic)
  On Error Resume Next
  Img.Picture = LoadPicture(sRep & sFic)
  If Err Then Img.Picture = LoadPicture
  On Error GoTo 0
  
  Dim r1 As Single, r2 As Single, r As Single
  r1 = w / Img.Width
  r2 = h / Img.Height
  If r1 < r2 Then     ' Image plus large que haute
    y = y + (h - r1 * Img.Height) / 2
    r = r1
  Else                ' Image plus haute que large
    x = x + (w - r2 * Img.Width) / 2
    r = r2
  End If
  On Error Resume Next
  PaintPicture Img.Picture, x, y, Img.Width * r, Img.Height * r
  On Error GoTo 0
  DoEvents
End Sub


Private Sub TexteCentré(o As Object, x1 As Single, x2 As Single, y As Single, sTexte As String)
Attribute TexteCentré.VB_Description = "Centre un texte sur un objet graphique"
  o.CurrentX = x1 + (x2 - x1 - o.TextWidth(sTexte)) / 2
  o.CurrentY = y
  o.Print sTexte;
End Sub

