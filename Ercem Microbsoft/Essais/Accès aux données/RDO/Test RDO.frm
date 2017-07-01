VERSION 5.00
Begin VB.Form frmTestRDO 
   Caption         =   "Test RDO 2.0"
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
Attribute VB_Name = "frmTestRDO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Test RDO
' Essais d'accès aux données via RDO 2.0
' 27/02/1998 PV

Option Explicit

Const sSQL As String = "select uti_numuti,uti_nom from utilisateur where uti_numuti<=2"

Private Sub Command1_Click()
  Dim cn As New rdoConnection
  Dim rs As rdoResultset
  
  
  cn.Connect = "DSN=ercem;Driver={SCO Vision ODBC}"
  'cn.Connect = "DSN=""w:\commun\dsn\ercem.dsn"";Driver={SCO Vision ODBC}"
  
  ' Par défaut, utilise les curseurs ODBC
  ' cn.CursorDriver = rdUseServer  ' Plante au MovePrevious
  cn.EstablishConnection rdDriverNoPrompt
  Print "CursorDriver: "; cn.CursorDriver
  
  Set rs = cn.OpenResultset(sSQL, rdOpenDynamic, rdConcurRowVer, rdExecDirect)
  
  Print rs!uti_numuti, rs!uti_nom
  rs.MoveNext
  Print rs!uti_numuti, rs!uti_nom
  rs.MovePrevious
  Print rs!uti_numuti, rs!uti_nom
  
  rs.Close
  cn.Close
End Sub
