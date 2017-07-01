VERSION 5.00
Begin VB.Form frmCardio 
   Appearance      =   0  'Flat
   BackColor       =   &H00000000&
   Caption         =   "Cardioïde"
   ClientHeight    =   5895
   ClientLeft      =   1335
   ClientTop       =   1530
   ClientWidth     =   7290
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Icon            =   "CARDIO.frx":0000
   LinkMode        =   1  'Source
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5895
   ScaleWidth      =   7290
End
Attribute VB_Name = "frmCardio"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Dessin d'une cardioïde en couleurs et gestion
' de message Repaint réentrante (DoEvents)
' PV 15/8/93
'
' En paramètre de lancement:
' Une valeur quelconque interdit la réentrance
'
' Au clavier:
' + Ajoute une instance
' - Enlève une instance
' espace Réorganise les instances
' R réaffiche l'instance courante


'Option Explicit

Const DegToRad = 3.1416 / 180
Dim PaintEnCours As Integer
Dim Recommence As Integer

Private Sub Form_KeyPress(KeyAscii As Integer)
  Select Case Chr$(KeyAscii)
    Case "+":
      Dim f As New frmCardio
      f.Top = Me.Top + Screen.TwipsPerPixelX * 80
      f.Left = Me.Left + Screen.TwipsPerPixelY * 80
      f.Show

    Case "-":
      If Not PaintEnCours Then Unload Me Else Beep

    Case " ":
      nbCasesX = -Int(-Sqr(Forms.Count))
      nbCasesY = -Int(-(Forms.Count / nbCasesX))
      xWidth = Screen.Width / nbCasesX
      yWidth = Screen.Height / nbCasesY
      For i = 0 To Forms.Count - 1
        Forms(i).Visible = False
        Forms(i).Move xWidth * (i Mod nbCasesX), yWidth * (i \ nbCasesX)
        Forms(i).Width = xWidth
        Forms(i).Height = yWidth
      Next
      For i = 0 To Forms.Count - 1
        Forms(i).Visible = True
      Next

    Case "r", "R":
      Refresh
  End Select
End Sub

Private Sub Form_Load()
  PaintEnCours = False
  Recommence = False
  If Command <> "" Then Caption = "Cardioïde sans DoEvents"
End Sub

Private Sub Form_Paint()
  If PaintEnCours Then Recommence = True: Exit Sub
  PaintEnCours = True
Repaint:
  Recommence = False
  ScaleMode = 3  ' Pixel
  If ScaleHeight = 0 Then GoTo Fin
  Line (ScaleLeft, ScaleTop)-Step(ScaleWidth - 1, ScaleHeight - 1), RGB(255, 255, 255), B
  Scale (-1.1, -1.1)-(1.1, 1.1)
  c = 0
  For a = 0 To 359 Step 3
    c = c Mod 15 + 1
    t = a * DegToRad
    Line (Cos(t), -Sin(t))-(Cos(t + t), -Sin(t + t)), QBColor(c)
    If Command = "" And c = 1 Then DoEvents: If Recommence Then GoTo Repaint
  Next
Fin:
  PaintEnCours = False
End Sub

Private Sub Form_Resize()
  Refresh
End Sub

