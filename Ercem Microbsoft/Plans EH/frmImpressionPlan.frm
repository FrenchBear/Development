VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmImpressionPlan 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Impression d'un plan"
   ClientHeight    =   1560
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmImpressionPlan.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1560
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtTitre 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1200
      Locked          =   -1  'True
      TabIndex        =   5
      Top             =   480
      Width           =   3375
   End
   Begin VB.TextBox txtFichier 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1200
      Locked          =   -1  'True
      TabIndex        =   2
      Top             =   840
      Width           =   3375
   End
   Begin VB.TextBox txtPlan 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1200
      Locked          =   -1  'True
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   4
      Top             =   1245
      Width           =   4680
      _ExtentX        =   8255
      _ExtentY        =   556
      Style           =   1
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Object.Tag             =   ""
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Titre :"
      Height          =   210
      Left            =   120
      TabIndex        =   6
      Top             =   540
      Width           =   555
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Fichier :"
      Height          =   210
      Left            =   120
      TabIndex        =   3
      Top             =   900
      Width           =   735
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Plan :"
      Height          =   210
      Left            =   120
      TabIndex        =   1
      Top             =   180
      Width           =   540
   End
End
Attribute VB_Name = "frmImpressionPlan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmImpressionPlan
' Code actif de l'impression d'un plan
' 26/04/1998 PV

Option Explicit

Public Sub doImpression(p As Plan, colCases As Collection)
  txtPlan = p.pla_plan
  txtTitre = p.pla_titre
  txtFichier = p.pla_fichier
  sbStatus.SimpleText = "Impression en cours, patientez…"
  
  Me.Show
  Me.Refresh
  
  Dim CmToTwip As Single, offX As Single, offY As Single
  CmToTwip = 1440 / 2.54
  offX = 0.05 * CmToTwip
  offY = 0.05 * CmToTwip
  
  Printer.Orientation = IIf(p.pla_portrait = "O", vbPRORPortrait, vbPRORLandscape)
  Printer.PaintPicture LoadPicture(p.pla_fichier), 0, 0
  
  On Error Resume Next
  Printer.Font = "Verdana"
  Printer.FontSize = 8
  On Error GoTo 0
  
  Dim c As CaseItem
  For Each c In colCases
    Printer.Line (c.X * CmToTwip, c.Y * CmToTwip)-Step(495, 270), RGB(0, 255, 0), BF
    Printer.Line (c.X * CmToTwip + offX, c.Y * CmToTwip + offY)-Step(495 - 2 * offX, 270 - 2 * offY), RGB(255, 255, 255), BF
    
    If c.sValeur <> "" Then
      Printer.CurrentX = (c.X + 0.08) * CmToTwip
      Printer.CurrentY = (c.Y + 0.05) * CmToTwip
      Printer.Print c.sValeur;
    End If
  Next
  
  Unload Me
End Sub

