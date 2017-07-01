VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmLogo 
   Caption         =   "Logos"
   ClientHeight    =   5970
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9585
   LinkTopic       =   "Form1"
   Picture         =   "frmLogo.frx":0000
   ScaleHeight     =   5970
   ScaleWidth      =   9585
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ImageList ilProprio 
      Left            =   120
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   10
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmLogo.frx":841A
            Key             =   "E"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmLogo.frx":8734
            Key             =   "L"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmLogo.frx":8A4E
            Key             =   "O"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmLogo.frx":8D68
            Key             =   "I"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmLogo.frx":8EC4
            Key             =   "B"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmLogo.frx":9020
            Key             =   "?"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmLogo.frx":9474
            Key             =   "F"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmLogo.frx":98C8
            Key             =   "S"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmLogo.frx":9D1C
            Key             =   "V"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmLogo.frx":9E78
            Key             =   "NV"
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmLogo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmLogo
' Gestion des logos des diverses marques
' 02/03/1999 PV
'  7/10/1999 PV Clé = code proprio, tout simplement; rattrapage d'erreur


Option Explicit

Public Function GetPicture(txtProprio As String)
  On Error Resume Next
  Set GetPicture = ilProprio.ListImages(txtProprio).ExtractIcon
  If Err Then Set GetPicture = ilProprio.ListImages("?").ExtractIcon
End Function
