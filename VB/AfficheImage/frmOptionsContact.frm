VERSION 5.00
Begin VB.Form frmOptionsContact 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Options de la planche de contact"
   ClientHeight    =   1875
   ClientLeft      =   3435
   ClientTop       =   3345
   ClientWidth     =   5280
   Icon            =   "frmOptionsContact.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1875
   ScaleWidth      =   5280
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      Caption         =   "&Image"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   120
      TabIndex        =   5
      Top             =   960
      Width           =   3375
      Begin VB.TextBox txtImageLignes 
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   6
         Text            =   "637"
         Top             =   300
         Width           =   735
      End
      Begin VB.TextBox txtImageColonnes 
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1680
         TabIndex        =   8
         Text            =   "1016"
         Top             =   300
         Width           =   735
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "lignes x"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   960
         TabIndex        =   7
         Top             =   345
         Width           =   660
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "colonnes"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   2520
         TabIndex        =   9
         Top             =   345
         Width           =   750
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "&Vignettes"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3375
      Begin VB.TextBox txtVignettesColonnes 
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1680
         TabIndex        =   3
         Text            =   "8"
         Top             =   300
         Width           =   735
      End
      Begin VB.TextBox txtVignettesLignes 
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   1
         Text            =   "7"
         Top             =   300
         Width           =   735
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "colonnes"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   2520
         TabIndex        =   4
         Top             =   345
         Width           =   750
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "lignes x"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   960
         TabIndex        =   2
         Top             =   345
         Width           =   660
      End
   End
   Begin VB.CheckBox chkOk 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   200
      Left            =   4920
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   1320
      Visible         =   0   'False
      Width           =   200
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4080
      TabIndex        =   11
      Top             =   720
      Width           =   1095
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4080
      TabIndex        =   10
      Top             =   240
      Width           =   1095
   End
End
Attribute VB_Name = "frmOptionsContact"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmOptionsContact
' Options de génération de la feuille de contact
' PV

Option Explicit

Private Sub btnAnnuler_Click()
    Hide
End Sub

Private Sub btnOK_Click()
    chkOk = 1

    If Not CtrlNumeric(txtVignettesLignes, "nombre de vignettes par ligne", 2, 10) Then
        chkOk = 0
    ElseIf Not CtrlNumeric(txtVignettesColonnes, "nombre de vignettes par colonne", 2, 10) Then
        chkOk = 0
    ElseIf Not CtrlNumeric(txtImageLignes, "nombre de lignes par image", 100, 740) Then
        chkOk = 0
    ElseIf Not CtrlNumeric(txtImageColonnes, "nombre de colonnes par image", 100, 1018) Then
        chkOk = 0
    Else
        Hide
    End If
End Sub

Private Sub Form_Load()
    chkOk = 0
    txtVignettesLignes.SelStart = 0
    txtVignettesColonnes.SelLength = 99
End Sub
