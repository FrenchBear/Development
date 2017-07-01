VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmComparaison 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Comparaison des dictionnaires"
   ClientHeight    =   5385
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7260
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5385
   ScaleWidth      =   7260
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox chkVarEgalVarChar 
      Caption         =   "char = varchar"
      Height          =   195
      Left            =   3780
      TabIndex        =   9
      Top             =   480
      Value           =   1  'Checked
      Width           =   1755
   End
   Begin VB.CommandButton btnIndex 
      Caption         =   "Analyse index"
      Height          =   315
      Left            =   3780
      TabIndex        =   8
      Top             =   60
      Width           =   1695
   End
   Begin VB.CommandButton btnQuitter 
      Cancel          =   -1  'True
      Caption         =   "Quitter"
      Height          =   315
      Left            =   5700
      TabIndex        =   5
      Top             =   420
      Width           =   1515
   End
   Begin VB.ComboBox cboSource2 
      Height          =   330
      Left            =   1080
      Sorted          =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   420
      Width           =   2415
   End
   Begin VB.ComboBox cboSource1 
      Height          =   330
      Left            =   1080
      Sorted          =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   60
      Width           =   2415
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   7
      Top             =   5070
      Width           =   7260
      _ExtentX        =   12806
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TreeView tvTrace 
      Height          =   4215
      Left            =   60
      TabIndex        =   6
      Top             =   840
      Width           =   7155
      _ExtentX        =   12621
      _ExtentY        =   7435
      _Version        =   393217
      HideSelection   =   0   'False
      Indentation     =   441
      LabelEdit       =   1
      LineStyle       =   1
      Style           =   7
      Appearance      =   1
   End
   Begin VB.CommandButton btnComparaison 
      Caption         =   "Comparaison"
      Default         =   -1  'True
      Height          =   315
      Left            =   5700
      TabIndex        =   4
      Top             =   60
      Width           =   1515
   End
   Begin VB.Label lblSource2 
      AutoSize        =   -1  'True
      Caption         =   "Source 2:"
      Height          =   210
      Left            =   60
      TabIndex        =   2
      Top             =   480
      Width           =   900
   End
   Begin VB.Label lblSource1 
      AutoSize        =   -1  'True
      Caption         =   "Source 1:"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   900
   End
End
Attribute VB_Name = "frmComparaison"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' CompareDicos
' Compare les dictionnaires de deux sources ODBC
' 16/08/1999 PV version rapide
' 17/08/1999 PV Compensation du bug du driver Informix qui inverse le booleen required !
' 16/11/1999 PV Analyse des index

Option Explicit

Dim sSource1 As String
Dim sSource2 As String

Dim c1 As rdoConnection
Dim c2 As rdoConnection

Dim tHN(10) As Integer   ' Historique des clés de noeuds par niveau dans le treeview


Private Declare Function SQLDataSources Lib "ODBC32.DLL" (ByVal henv&, ByVal fDirection%, ByVal szDSN$, ByVal cbDSNMax%, pcbDSN%, ByVal szDescription$, ByVal cbDescriptionMax%, pcbDescription%) As Integer
Private Declare Function SQLAllocEnv% Lib "ODBC32.DLL" (env&)
Const SQL_SUCCESS As Long = 0
Const SQL_FETCH_NEXT As Long = 1



Public Sub RemplitListeSourcesODBC(cboDSNList As ComboBox, Optional sSourceDéfaut As String = "")
  Dim i As Integer
  Dim sDSNItem As String * 1024
  Dim sDRVItem As String * 1024
  Dim sDSN As String
  Dim sDRV As String
  Dim iDSNLen As Integer
  Dim iDRVLen As Integer
  Dim lHenv As Long         ' Descripteur de l'environnement.

  On Error Resume Next
'  cboDSNList.AddItem "(Aucun)"

  ' Obtient les DSN.
  If SQLAllocEnv(lHenv) <> -1 Then
      Do Until i <> SQL_SUCCESS
          sDSNItem = Space$(1024)
          sDRVItem = Space$(1024)
          i = SQLDataSources(lHenv, SQL_FETCH_NEXT, sDSNItem, 1024, iDSNLen, sDRVItem, 1024, iDRVLen)
          sDSN = Left$(sDSNItem, iDSNLen)
          sDRV = Left$(sDRVItem, iDRVLen)
              
          If sDSN <> Space(iDSNLen) And (InStr(1, sDRV, "Vision", vbTextCompare) <> 0 Or InStr(1, sDRV, "Informix", vbTextCompare) <> 0) Then
            cboDSNList.AddItem sDSN
          End If
      Loop
  End If
  
  cboDSNList.ListIndex = -1
End Sub



Private Sub OpenConnexion(c As rdoConnection, sNomSource As String)
  Set c = New rdoConnection
  
  Status "Ouverture " & sNomSource
  c.Connect = "DSN=" & sNomSource & ";Driver={SCO Vision ODBC}"
  c.CursorDriver = rdUseOdbc
  c.EstablishConnection rdDriverNoPrompt
  c.QueryTimeout = 120
End Sub


' Affiche un message dans la barre d'état
Sub Status(sMsg As String)
  sbStatus.SimpleText = sMsg
  'sbStatus.Refresh
  'tvTrace.Refresh
  DoEvents
End Sub

' Ajoute un message de trace d'un niveau de décalage donné
Sub Trace(iNiv As Integer, ByVal sMsg As String)
  Dim i As Node
  
  If iNiv = 0 Then
    Open "c:\CompareDicos " & sSource1 & "-" & sSource2 & ".txt" For Output As #1
    Set i = tvTrace.Nodes.Add(, , , sMsg)
    i.Expanded = True
  Else
    Set i = tvTrace.Nodes.Add(tHN(iNiv - 1), tvwChild, , sMsg)
  End If
  Print #1, Space(2 * iNiv) & sMsg
  tHN(iNiv) = i.Index
End Sub


Private Sub btnComparaison_Click()
  If cboSource1.ListIndex < 0 Or cboSource2.ListIndex < 0 Then
    MsgBox "Sélectionnez les deux sources avant de lancer la comparaison.", vbExclamation, App.Title
    Exit Sub
  End If
  
  If cboSource1.ListIndex = cboSource2.ListIndex Then
    MsgBox "Sélectionnez deux sources différentes.", vbExclamation, App.Title
    Exit Sub
  End If
  
  sSource1 = cboSource1.Text
  sSource2 = cboSource2.Text
  
  btnIndex.Enabled = False
  btnComparaison.Enabled = False
  cboSource1.Locked = True
  cboSource2.Locked = True
  
  Screen.MousePointer = vbHourglass
  tvTrace.Nodes.Clear
  Dim i As Integer
  For i = 0 To 10
    tHN(i) = 0
  Next
  
  Trace 0, "Comparaison " & sSource1 & "/" & sSource2 & " " & Now
  OpenConnexion c1, sSource1
  OpenConnexion c2, sSource2
  
  Status "Comparaison des listes de tables"
  Trace 1, "Tables sur " & sSource1 & " (" & c1.rdoTables.Count & ")"
  Dim t As rdoTable
  
  Dim colT1 As New Collection   ' Tables de source1 pas sur source2
  Dim colT2 As New Collection   ' Tables de source2 pas sur source1
  Dim colT As New Collection    ' Tables communes
  
  For Each t In c1.rdoTables
    On Error Resume Next        ' Doublons dus aux 'private synonym' possibles…
    colT.Add t.Name, t.Name
    colT1.Add t.Name, t.Name
    On Error GoTo 0
    Trace 2, t.Name
  Next
  
  Trace 1, "Tables sur " & sSource2 & " (" & c2.rdoTables.Count & ")"
  For Each t In c2.rdoTables
    On Error Resume Next
    colT1.Remove t.Name
    colT2.Add t.Name, t.Name
    On Error GoTo 0
    Trace 2, t.Name
  Next
  On Error Resume Next
  For Each t In c1.rdoTables
    colT2.Remove t.Name
  Next
  On Error GoTo 0
  
  Dim s
  Trace 1, "Tables sur " & sSource1 & " et pas sur " & sSource2 & " (" & colT1.Count & ")"
  For Each s In colT1
    Trace 2, s
    colT.Remove s
  Next

  Trace 1, "Tables sur " & sSource2 & " et pas sur " & sSource1 & " (" & colT2.Count & ")"
  For Each s In colT2
    Trace 2, s
  Next

  Trace 1, "Tables communes (" & colT.Count & ")"
  For Each s In colT
    Trace 2, s
  Next

  ' Comparaison des tables communes
  Trace 1, "Tables communes avec différences"
  i = 0
  For Each s In colT
    i = i + 1
    Status "Comparaison des tables communes " & i & "/" & colT.Count & ": " & s
    DiffTable s
  Next

  Close
  Status ""
  
  btnComparaison.Enabled = True
  btnIndex.Enabled = True
  cboSource1.Locked = False
  cboSource2.Locked = False
  
  c1.Close
  c2.Close
  Set c1 = Nothing
  Set c2 = Nothing
  
  Screen.MousePointer = vbNormal
End Sub


Sub DiffTable(ByVal sNomTable As String)
  Dim t1 As rdoTable
  Dim t2 As rdoTable
  Dim bTraceTable As Boolean
  
  bTraceTable = False
  Set t1 = c1.rdoTables(sNomTable)
  Set t2 = c2.rdoTables(sNomTable)
  
  Dim cc1 As New Collection   ' Colonnes dans t1 et pas dans t2
  Dim cc2 As New Collection   ' Colonnes dans t2 et pas dans t1
  Dim cc As New Collection    ' Colonnes communes
  
  Dim c As rdoColumn
  For Each c In t1.rdoColumns
    On Error Resume Next
    cc1.Add c.Name, c.Name
    cc.Add c.Name, c.Name
    On Error GoTo 0
  Next
  For Each c In t2.rdoColumns
    On Error Resume Next
    cc2.Add c.Name, c.Name
    On Error GoTo 0
  Next
  For Each c In t1.rdoColumns
    On Error Resume Next
    cc2.Remove c.Name
    On Error GoTo 0
  Next
  For Each c In t2.rdoColumns
    On Error Resume Next
    cc1.Remove c.Name
    On Error GoTo 0
  Next
  
  Dim nc
  If cc1.Count <> 0 Then
    If Not bTraceTable Then Trace 2, sNomTable: bTraceTable = True
    For Each nc In cc1
      Trace 3, "Colonne " & nc & " sur " & sSource1 & " et pas sur " & sSource2
      cc.Remove nc
    Next
  End If
  
  If cc2.Count <> 0 Then
    If Not bTraceTable Then Trace 2, sNomTable: bTraceTable = True
    For Each nc In cc2
      Trace 3, "Colonne " & nc & " sur " & sSource2 & " et pas sur " & sSource1
    Next
  End If
  
  ' Comparaison des colonnes communes
  For Each nc In cc
    If tr(t1(nc).Type) <> tr(t2(nc).Type) Then
      If Not bTraceTable Then Trace 2, sNomTable: bTraceTable = True
      Trace 3, "Colonne " & nc & " Type " & t1(nc).Type & " sur " & sSource1 & ", Type " & t2(nc).Type & " sur " & sSource2
    End If
    If t1(nc).Size <> t2(nc).Size Then
      If Not bTraceTable Then Trace 2, sNomTable: bTraceTable = True
      Trace 3, "Colonne " & nc & " Size " & t1(nc).Size & " sur " & sSource1 & ", Size " & t2(nc).Size & " sur " & sSource2
    End If
    
    Dim t1r As Boolean, t2r As Boolean
    t1r = t1(nc).Required
    t2r = t2(nc).Required
    ' Bug driver informix qui inverse le booleen required !
    If InStr(1, c1.Connect, "service", vbTextCompare) <> 0 Then t1r = Not t1r
    If InStr(1, c2.Connect, "service", vbTextCompare) <> 0 Then t2r = Not t2r
    
    If t1r <> t2r Then
      If Not bTraceTable Then Trace 2, sNomTable: bTraceTable = True
      Trace 3, "Colonne " & nc & " Required " & t1r & " sur " & sSource1 & ", Required " & t2r & " sur " & sSource2
    End If
  Next
End Sub


' Type Réduit :   varchar = char
Private Function tr(ByVal iType As Integer) As Integer
  If chkVarEgalVarChar.Value = vbChecked Then If iType = 12 Then iType = 1
  tr = iType
End Function


Private Sub btnIndex_Click()
  Dim ci As New Collection
  
  If cboSource1.ListIndex < 0 Then
    MsgBox "Sélectionnez une source avant d'analyser les index.", vbExclamation, App.Title
    Exit Sub
  End If
  
  sSource1 = cboSource1.Text
  
  btnComparaison.Enabled = False
  btnIndex.Enabled = False
  cboSource1.Locked = True
  cboSource2.Locked = True

  OpenConnexion c1, sSource1
  Trace 0, "Analyse des index sur " & sSource1
  Status "Analyse des index"

  Dim rs As rdoResultset
  Set rs = c1.OpenResultset("select * from sysindexes,systables where sysindexes.tabid=systables.tabid and systables.tabid>=100", rdOpenKeyset, rdConcurRowVer, rdExecDirect)
  Do Until rs.EOF
    Dim si As String
    Dim ti(1 To 8) As Integer
    Dim i As Integer
    
    ti(1) = rs!part1
    ti(2) = rs!part2
    ti(3) = rs!part3
    ti(4) = rs!part4
    ti(5) = rs!part5
    ti(6) = rs!part6
    ti(7) = rs!part7
    ti(8) = rs!part8
    
    On Error Resume Next
    ci.Add "X", sCléIndex(rs!tabid, ti)
    If Err Then
      On Error GoTo 0
      Trace 1, "Index inutile table " & rs!tabname
    Else
      On Error GoTo 0
      For i = 8 To 1 Step -1
        If ti(i) Then Exit For
      Next
      Do While i > 1
        ti(i) = 0
        si = sCléIndex(rs!tabid, ti)
        On Error Resume Next
        ci.Add "X", si
        If Err Then
          Trace 1, "Index inutile table " & rs!tabname
          Exit Do
        End If
        On Error GoTo 0
        i = i - 1
      Loop
    End If
    
    rs.MoveNext
  Loop
  rs.Close
  
  Close
  Status ""
  
  btnComparaison.Enabled = True
  btnIndex.Enabled = True
  cboSource1.Locked = False
  cboSource2.Locked = False
  
  c1.Close
  Set c1 = Nothing
End Sub

Private Function sCléIndex(iTable As Integer, ti() As Integer) As String
  Dim i As Integer
  
  sCléIndex = "I" & iTable & "_"
  For i = 1 To 8
    sCléIndex = sCléIndex & Right(Str(1000 + ti(i)), 3)
  Next
End Function


Private Sub btnQuitter_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  RemplitListeSourcesODBC cboSource1
  RemplitListeSourcesODBC cboSource2
End Sub
