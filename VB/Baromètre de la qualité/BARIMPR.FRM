VERSION 4.00
Begin VB.Form Décor 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   Caption         =   "Décors d'Impression"
   ClientHeight    =   5310
   ClientLeft      =   1845
   ClientTop       =   1365
   ClientWidth     =   5430
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   0
      weight          =   700
      size            =   8.25
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Height          =   5715
   Left            =   1785
   LinkMode        =   1  'Source
   LinkTopic       =   "Form1"
   ScaleHeight     =   5310
   ScaleWidth      =   5430
   Top             =   1020
   Visible         =   0   'False
   Width           =   5550
   Begin VB.PictureBox Soleil 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   4995
      Left            =   240
      Picture         =   "BARIMPR.frx":0000
      ScaleHeight     =   4965
      ScaleWidth      =   4965
      TabIndex        =   1
      Top             =   120
      Width           =   4995
   End
   Begin VB.PictureBox Orage 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   4995
      Left            =   240
      Picture         =   "BARIMPR.frx":0594
      ScaleHeight     =   4965
      ScaleWidth      =   4965
      TabIndex        =   2
      Top             =   120
      Width           =   4995
   End
   Begin VB.PictureBox Nuage 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   4995
      Left            =   240
      Picture         =   "BARIMPR.frx":147A
      ScaleHeight     =   4965
      ScaleWidth      =   4965
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   4995
   End
End
Attribute VB_Name = "Décor"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
