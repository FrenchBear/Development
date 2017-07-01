VERSION 4.00
Begin VB.Form frmHelp 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   540
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   1710
   ControlBox      =   0   'False
   Height          =   945
   Left            =   1080
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   540
   ScaleWidth      =   1710
   Top             =   1170
   Width           =   1830
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Label1"
      Height          =   195
      Left            =   210
      TabIndex        =   0
      Top             =   135
      Width           =   480
   End
End
Attribute VB_Name = "frmHelp"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'feuille utilisée pour afficher les bulles d'aide
Private Sub Form_Load()

      ' Get rid of the forms Caption so title bar does not display:
      Me.Caption = ""
 
      ' Give the form and label a light yellow background:
      Me.BackColor = &H80FFFF
      Label1.BackColor = &H80FFFF
 
      ' Inset label by 1 pixel:
      Label1.Left = 1 * Screen.TwipsPerPixelX
      Label1.Top = 0

End Sub


