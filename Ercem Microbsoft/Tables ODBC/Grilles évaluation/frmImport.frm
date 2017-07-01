VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmImport 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Import de données"
   ClientHeight    =   4380
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9765
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmImport.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4380
   ScaleWidth      =   9765
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnImporter 
      Caption         =   "&Importer"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   330
      Left            =   60
      TabIndex        =   2
      Top             =   4020
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Enabled         =   0   'False
      Height          =   330
      Left            =   1500
      TabIndex        =   1
      Top             =   4020
      Width           =   1350
   End
   Begin MSComctlLib.ListView lvImport 
      Height          =   3915
      Left            =   0
      TabIndex        =   0
      Top             =   60
      Width           =   9735
      _ExtentX        =   17171
      _ExtentY        =   6906
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   0
   End
End
Attribute VB_Name = "frmImport"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmImport
' Feuille de visualisation des données avant import
' 10/03/2000 PV


Public fCallBack As Form

Option Explicit

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnImporter_Click()
  fCallBack.ImportCallBack
End Sub
