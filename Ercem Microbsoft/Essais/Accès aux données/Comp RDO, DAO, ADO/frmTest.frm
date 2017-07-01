VERSION 5.00
Begin VB.Form frmComparaison 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Comparaison des performances des méthodes d'accès aux données"
   ClientHeight    =   4905
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8160
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4905
   ScaleWidth      =   8160
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnGo 
      Caption         =   "Go !"
      Height          =   495
      Left            =   6720
      TabIndex        =   0
      Top             =   180
      Width           =   1215
   End
End
Attribute VB_Name = "frmComparaison"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTest
' Comparaison des performances des méthodes d'accès aux données
' 23/01/1998 PV
' 13/02/1998 PV
' 28/02/1998 PV ADO 1.5
' 12/08/1998 PV ADO 2.0

Option Explicit

Dim wksJet As Workspace
Dim wksODBC As Workspace

Const sSQL As String = "select * from utilisateur"
Const nb = 1


Private Sub ParcoursRDO()
  Dim cn As New rdoConnection
  Dim rs As rdoResultset
  
  Dim t As Single
  Dim v
  Dim rc As Long
  
  t = Timer
  cn.Connect = "DSN=ercem;Driver={Informix}"
  cn.CursorDriver = rdUseOdbc
  cn.EstablishConnection rdDriverNoPrompt
  t = Timer - t
  Print , Format(t, "0.00"),
  
  t = Timer
  Set rs = cn.OpenResultset(sSQL, rdOpenKeyset, rdConcurRowVer, rdExecDirect)
  While Not rs.EOF
    v = rs!uti_numuti
    v = rs!uti_nom
    rs.MoveNext
    rc = rc + 1
  Wend
  t = Timer - t
  Print Format(t, "0.00"), rc
  
  On Error Resume Next
  rs.MovePrevious: If Err Then Print "Échec au MovePrevious"
  On Error GoTo 0
  
  rs.Close
  cn.Close
End Sub


Private Sub ParcoursDAOJet()
  Dim db As Database
  Dim rs As Recordset
  
  Dim t As Single
  Dim v
  Dim rc As Long
  
  t = Timer
  Set db = wksJet.OpenDatabase("", dbDriverNoPrompt, False, "ODBC;DSN=ercem;UID=sce;PWD=;Hostname=serveur;ServerID=Informix;DBname=/u/ercem;DBuser=;DBauth=;DBoptions=;")
  t = Timer - t
  Print , Format(t, "0.00"),
  
  t = Timer
  Set rs = db.OpenRecordset(sSQL)
  While Not rs.EOF
    v = rs!uti_numuti
    v = rs!uti_nom
    rs.MoveNext
    rc = rc + 1
  Wend
  t = Timer - t
  Print Format(t, "0.00"), rc
  
  On Error Resume Next
  rs.MovePrevious: If Err Then Print "Échec au MovePrevious"
  On Error GoTo 0

  rs.Close
  db.Close
End Sub


Private Sub ParcoursDAOODBCDirectConnexion()
  Dim cx As Connection
  Dim rs As Recordset
  
  Dim t As Single
  Dim v
  Dim rc As Long
  
  t = Timer
  Set cx = wksODBC.OpenConnection("", dbDriverNoPrompt, False, "ODBC;DSN=ercem;UID=sce;PWD=;Hostname=serveur;ServerID=Informix;DBname=/u/ercem;DBuser=;DBauth=;DBoptions=;")
  t = Timer - t
  Print , Format(t, "0.00"),
  
  t = Timer
  Set rs = cx.OpenRecordset(sSQL, dbOpenDynamic, dbExecDirect)
  While Not rs.EOF
    v = rs!uti_numuti
    v = rs!uti_nom
    rs.MoveNext
    rc = rc + 1
  Wend
  t = Timer - t
  Print Format(t, "0.00"), rc
  
  On Error Resume Next
  rs.MovePrevious: If Err Then Print "Échec au MovePrevious"
  On Error GoTo 0
  
  rs.Close
  cx.Close
End Sub


Private Sub ParcoursDAOODBCDirectDataBase()
  Dim db As Database
  Dim rs As Recordset
  
  Dim t As Single
  Dim v
  Dim rc As Long
  
  t = Timer
  Set db = wksODBC.OpenDatabase("", dbDriverNoPrompt, False, "ODBC;DSN=ercem;UID=sce;PWD=;Hostname=serveur;ServerID=Informix;DBname=/u/ercem;DBuser=;DBauth=;DBoptions=;")
  t = Timer - t
  Print , Format(t, "0.00"),
  
  t = Timer
  Set rs = db.OpenRecordset(sSQL, dbOpenDynamic, dbExecDirect)
  While Not rs.EOF
    v = rs!uti_numuti
    v = rs!uti_nom
    rs.MoveNext
    rc = rc + 1
  Wend
  t = Timer - t
  Print Format(t, "0.00"), rc
  
  On Error Resume Next
  rs.MovePrevious: If Err Then Print "Échec au MovePrevious"
  On Error GoTo 0
  
  rs.Close
  db.Close
End Sub


Private Sub ParcoursADO()
  Dim connex As ADODB.Connection
  Dim rsUtil As ADODB.Recordset
  Dim t As Single
  Dim v
  Dim rc As Long
  
  
  t = Timer
  Set connex = New ADODB.Connection
  connex.Open "Provider=MSDASQL;DSN=ercem;Driver={Informix}"
  connex.CursorLocation = adUseClient   ' Le serveur n'implante que des curseurs forward-only
  t = Timer - t
  Print , Format(t, "0.00"),
  
  t = Timer
  Set rsUtil = New ADODB.Recordset
  
  rsUtil.Open sSQL, connex, adOpenDynamic
  
  While Not rsUtil.EOF
    v = rsUtil!uti_numuti
    v = rsUtil!uti_nom
    rsUtil.MoveNext
    rc = rc + 1
  Wend
  t = Timer - t
  Print Format(t, "0.00"), rc
  
  On Error Resume Next
  rsUtil.MovePrevious: If Err Then Print "Échec au MovePrevious"
  On Error GoTo 0
  
  rsUtil.Close
  connex.Close
End Sub



Private Sub btnGo_Click()
  btnGo.Enabled = False
  Screen.MousePointer = vbHourglass
  
  Dim i As Integer
  Print , "Open", "Parcours", "Nb rec"
    
  Set wksJet = DBEngine.CreateWorkspace("JetWorkspace", "admin", "", dbUseJet)
  Set wksODBC = DBEngine.CreateWorkspace("ODBCWorkspace", "admin", "", dbUseODBC)
  
  Print "RDO 2.0"
  For i = 1 To nb: ParcoursRDO: DoEvents: Next
  
  Print "ADO 2.0"
  For i = 1 To nb: ParcoursADO: DoEvents: Next
  
  Print "DAO 3.5 ODBCDirect DataBase"
  For i = 1 To nb: ParcoursDAOODBCDirectDataBase:  DoEvents: Next
  
  Print "DAO 3.5 ODBCDirect Connexion"
  For i = 1 To nb: ParcoursDAOODBCDirectConnexion: DoEvents: Next

  Print "DAO 3.5 Jet"
  For i = 1 To nb: ParcoursDAOJet:  DoEvents: Next
  
  Screen.MousePointer = vbDefault
  btnGo.Enabled = True
End Sub

