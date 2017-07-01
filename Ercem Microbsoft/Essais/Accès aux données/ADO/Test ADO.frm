VERSION 5.00
Begin VB.Form frmTestADO 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1740
      TabIndex        =   0
      Top             =   1380
      Width           =   1215
   End
End
Attribute VB_Name = "frmTestADO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Test ADO
' Essais d'accès aux données via ADO 1.5 / ODBC
' 27/02/1998 PV
' 12/08/1998 PV ADO 2.0

Option Explicit

Const sSQL As String = "select uti_numuti,uti_nom from utilisateur where uti_numuti<=2"

Private Sub Command1_Click()
  Dim connex As ADODB.Connection
  Dim rsUtil As ADODB.Recordset
  
  
  Set connex = New ADODB.Connection
  connex.CursorLocation = adUseClient   ' Le serveur n'implante que des curseurs forward-only
  connex.Open "Provider=MSDASQL;DSN=ercem;Driver={Informix}"
  
  Set rsUtil = New ADODB.Recordset
  rsUtil.Open sSQL, connex, adOpenDynamic
  Print "CursorType: "; rsUtil.CursorType
  
  Print rsUtil!uti_numuti, rsUtil!uti_nom
  rsUtil.MoveNext
  Print rsUtil!uti_numuti, rsUtil!uti_nom
  rsUtil.MovePrevious
  Print rsUtil!uti_numuti, rsUtil!uti_nom
  
  rsUtil.Close
  connex.Close
End Sub
