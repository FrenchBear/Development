VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmMain 
   Caption         =   "Essais"
   ClientHeight    =   5265
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10095
   LinkTopic       =   "Form1"
   ScaleHeight     =   5265
   ScaleWidth      =   10095
   StartUpPosition =   3  'Windows Default
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid hf 
      Height          =   4215
      Left            =   2160
      TabIndex        =   6
      Top             =   900
      Width           =   7755
      _ExtentX        =   13679
      _ExtentY        =   7435
      _Version        =   393216
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
   End
   Begin VB.CommandButton btnEtat3 
      Caption         =   "Utilisateurs3 (Code)"
      Height          =   495
      Left            =   60
      TabIndex        =   5
      Top             =   4260
      Width           =   1755
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Utilisateurs2 (DataEnvironnement)"
      Height          =   495
      Left            =   60
      TabIndex        =   4
      Top             =   3600
      Width           =   1755
   End
   Begin VB.CommandButton btnEtat2 
      Caption         =   "Etat utilisateurs"
      Height          =   495
      Left            =   60
      TabIndex        =   3
      Top             =   2940
      Width           =   1215
   End
   Begin VB.CommandButton btnCurseurADO 
      Caption         =   "Curseur ADO"
      Height          =   495
      Left            =   60
      TabIndex        =   2
      Top             =   2220
      Width           =   1215
   End
   Begin VB.CommandButton btnEtat 
      Caption         =   "Etat 1"
      Height          =   495
      Left            =   60
      TabIndex        =   1
      Top             =   1500
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Parcours recordset"
      Height          =   495
      Left            =   60
      TabIndex        =   0
      Top             =   840
      Width           =   1215
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Essais d'états VB
' 1/4/99 PV


Option Explicit


Private Sub Form_Click()
  Print de.rsUnités.Source
  Print de.rsUnités.ActiveConnection
  Stop
End Sub



Private Sub btnCurseurADO_Click()
  Dim connex As ADODB.Connection
  Dim rsUtil As ADODB.Recordset
  
  Set connex = New ADODB.Connection
  connex.Open "Provider=MSDASQL;DSN=serveur;Driver={Informix}"
  connex.CursorLocation = adUseClient   ' Le serveur n'implante que des curseurs forward-only
  
  Set rsUtil = New ADODB.Recordset
  rsUtil.Source = "select * from pays"
  rsUtil.ActiveConnection = connex
  
  rsUtil.Open
  While Not rsUtil.EOF
    Print rsUtil!pay_pays, rsUtil!pay_libelle
    rsUtil.MoveNext
  Wend
  rsUtil.Close
End Sub

Private Sub btnEtat_Click()
  drPays.Show
End Sub

Private Sub btnEtat2_Click()
  Dim connex As ADODB.Connection
  Dim rsUtil As ADODB.Recordset
  
  Set connex = New ADODB.Connection
  connex.Open "Provider=MSDASQL;DSN=serveur;Driver={Informix}"
  connex.CursorLocation = adUseClient   ' Le serveur n'implante que des curseurs forward-only
  
  Set rsUtil = New ADODB.Recordset
  rsUtil.Source = "select uti_numuti,uti_nom,uti_unite from utilisateur group by 3,1,2"
  rsUtil.ActiveConnection = connex
  rsUtil.Open
  Set drUtil.DataSource = rsUtil
  drUtil.Show
End Sub

Private Sub Command1_Click()
  Dim r As Recordset
  
  Set r = de.rsPays
  r.Open
  While Not r.EOF
    Print r!pay_pays, r!pay_libelle
    r.MoveNext
  Wend
  r.Close
End Sub

Private Sub Command2_Click()
  drUtilisateurs2.Show
End Sub

Private Sub btnEtat3_Click()
  Dim connex As ADODB.Connection
  Dim rsUtil As ADODB.Recordset
  
  Set connex = New ADODB.Connection
  connex.Open "Provider=MSDataShape.1;Persist Security Info=True;Connect Timeout=15;Mode=Read|Write;Data Source=serveur;User ID=sce;Password="""";Data Provider=MSDASQL.1"
  connex.CursorLocation = adUseClient   ' Le serveur n'implante que des curseurs forward-only
  
  Set rsUtil = New ADODB.Recordset
  rsUtil.Source = "SHAPE {select * from unite} AS Unités APPEND ({select * from utilisateur} AS Utilisateurs RELATE 'uni_numunite' TO 'uti_unite') AS Utilisateurs"

  rsUtil.ActiveConnection = connex
'  rsUtil.CacheSize = 100
  rsUtil.Open
  MsgBox "Nom: " & rsUtil.ActiveCommand.Name
'Stop
  Set hf.DataSource = rsUtil
  Set drUtilisateurs3.DataSource = rsUtil
  drUtilisateurs3.Show
End Sub

