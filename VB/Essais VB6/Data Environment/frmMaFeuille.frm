VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmMaFeuille 
   Caption         =   "Form1"
   ClientHeight    =   5460
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7485
   LinkTopic       =   "Form1"
   ScaleHeight     =   5460
   ScaleWidth      =   7485
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnNb 
      Caption         =   "Nb"
      Height          =   435
      Left            =   6240
      TabIndex        =   23
      Top             =   1620
      Width           =   1155
   End
   Begin VB.CommandButton btnSuivant 
      Caption         =   "Suivant"
      Height          =   435
      Left            =   6240
      TabIndex        =   22
      Top             =   960
      Width           =   1215
   End
   Begin VB.TextBox txtComments 
      DataField       =   "Comments"
      DataMember      =   "Editeurs"
      DataSource      =   "MesDonnées"
      Height          =   285
      Left            =   2025
      TabIndex        =   20
      Top             =   3600
      Width           =   3375
   End
   Begin VB.TextBox txtFax 
      DataField       =   "Fax"
      DataMember      =   "Editeurs"
      DataSource      =   "MesDonnées"
      Height          =   285
      Left            =   2025
      TabIndex        =   18
      Top             =   3225
      Width           =   2475
   End
   Begin VB.TextBox txtTelephone 
      DataField       =   "Telephone"
      DataMember      =   "Editeurs"
      DataSource      =   "MesDonnées"
      Height          =   285
      Left            =   2025
      TabIndex        =   16
      Top             =   2835
      Width           =   2475
   End
   Begin VB.TextBox txtZip 
      DataField       =   "Zip"
      DataMember      =   "Editeurs"
      DataSource      =   "MesDonnées"
      Height          =   285
      Left            =   2025
      TabIndex        =   14
      Top             =   2460
      Width           =   2475
   End
   Begin VB.TextBox txtState 
      DataField       =   "State"
      DataMember      =   "Editeurs"
      DataSource      =   "MesDonnées"
      Height          =   285
      Left            =   2025
      TabIndex        =   12
      Top             =   2085
      Width           =   1650
   End
   Begin VB.TextBox txtCity 
      DataField       =   "City"
      DataMember      =   "Editeurs"
      DataSource      =   "MesDonnées"
      Height          =   285
      Left            =   2025
      TabIndex        =   10
      Top             =   1695
      Width           =   3300
   End
   Begin VB.TextBox txtAddress 
      DataField       =   "Address"
      DataMember      =   "Editeurs"
      DataSource      =   "MesDonnées"
      Height          =   285
      Left            =   2025
      TabIndex        =   8
      Top             =   1320
      Width           =   3375
   End
   Begin VB.TextBox txtCompanyName 
      DataField       =   "Company Name"
      DataMember      =   "Editeurs"
      DataSource      =   "MesDonnées"
      Height          =   285
      Left            =   2025
      TabIndex        =   6
      Top             =   945
      Width           =   3375
   End
   Begin VB.TextBox txtName 
      DataField       =   "Name"
      DataMember      =   "Editeurs"
      DataSource      =   "MesDonnées"
      Height          =   285
      Left            =   2025
      TabIndex        =   4
      Top             =   555
      Width           =   3375
   End
   Begin VB.TextBox txtPubID 
      DataField       =   "PubID"
      DataMember      =   "Editeurs"
      DataSource      =   "MesDonnées"
      Height          =   285
      Left            =   2025
      TabIndex        =   2
      Top             =   180
      Width           =   660
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   6240
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
      Bindings        =   "frmMaFeuille.frx":0000
      Height          =   1200
      Left            =   180
      TabIndex        =   21
      Top             =   4035
      Width           =   5250
      _ExtentX        =   9260
      _ExtentY        =   2117
      _Version        =   393216
      FixedCols       =   0
      AllowUserResizing=   3
      DataMember      =   "Titres"
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Comments:"
      Height          =   255
      Index           =   9
      Left            =   180
      TabIndex        =   19
      Top             =   3645
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Fax:"
      Height          =   255
      Index           =   8
      Left            =   180
      TabIndex        =   17
      Top             =   3270
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Telephone:"
      Height          =   255
      Index           =   7
      Left            =   180
      TabIndex        =   15
      Top             =   2880
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Zip:"
      Height          =   255
      Index           =   6
      Left            =   180
      TabIndex        =   13
      Top             =   2505
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "State:"
      Height          =   255
      Index           =   5
      Left            =   180
      TabIndex        =   11
      Top             =   2130
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "City:"
      Height          =   255
      Index           =   4
      Left            =   180
      TabIndex        =   9
      Top             =   1740
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Address:"
      Height          =   255
      Index           =   3
      Left            =   180
      TabIndex        =   7
      Top             =   1365
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Company Name:"
      Height          =   255
      Index           =   2
      Left            =   180
      TabIndex        =   5
      Top             =   990
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Name:"
      Height          =   255
      Index           =   1
      Left            =   180
      TabIndex        =   3
      Top             =   600
      Width           =   1815
   End
   Begin VB.Label lblFieldLabel 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "PubID:"
      Height          =   255
      Index           =   0
      Left            =   180
      TabIndex        =   1
      Top             =   225
      Width           =   1815
   End
End
Attribute VB_Name = "frmMaFeuille"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnNb_Click()
  Dim rsChild As Recordset
  Set rsChild = MesDonnées.rsEditeurs.Fields("Titres").Value
  MsgBox "Nb: " & rsChild.RecordCount
End Sub

Private Sub btnSuivant_Click()
  MesDonnées.rsEditeurs.MoveNext
End Sub

Private Sub Command1_Click()
  Print "Nb recordsets: "; MesDonnées.Recordsets.Count
  
  Dim r As Recordset
  Set r = MesDonnées.rsEditeurs
  r.Open
  While Not r.EOF
    Print r!Name, r!titres.Value.RecordCount
    r.MoveNext
  Wend
  r.Close
End Sub

Private Sub Form_Load()
  Debug.Print "Form_Load"
End Sub
