VERSION 5.00
Begin VB.Form frmImage 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Image à glisser"
   ClientHeight    =   855
   ClientLeft      =   5925
   ClientTop       =   1590
   ClientWidth     =   2325
   ControlBox      =   0   'False
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
   LinkTopic       =   "Feuille1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   855
   ScaleWidth      =   2325
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      DragIcon        =   "ALLMSGI.frx":0000
      DragMode        =   1  'Automatic
      ForeColor       =   &H80000008&
      Height          =   510
      Left            =   240
      Picture         =   "ALLMSGI.frx":030A
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   240
      Width           =   510
   End
End
Attribute VB_Name = "frmImage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
