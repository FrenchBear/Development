VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmTestADO2 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Test ADO plus pouss�s"
   ClientHeight    =   3150
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8985
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3150
   ScaleWidth      =   8985
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ListView lwR�sultats 
      Height          =   3015
      Left            =   60
      TabIndex        =   1
      Top             =   60
      Width           =   7395
      _ExtentX        =   13044
      _ExtentY        =   5318
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   327682
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   2
      BeginProperty ColumnHeader(1) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Cl�"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   1
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Valeur"
         Object.Width           =   5080
      EndProperty
   End
   Begin VB.CommandButton btnTest 
      Caption         =   "&Test"
      Height          =   495
      Left            =   7620
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmTestADO2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTestADO2
' Tests ADO plus pouss�s
'  2/03/1998 PV
' 12/08/1998 PV ADO 2.0, colonnes d'une table pr�cise

Option Explicit

Private Sub AddInfo(sCl� As String, Optional sValeur As String)
  Dim x As ListItem
  Set x = lwR�sultats.ListItems.Add
  x.Text = sCl�
  x.SubItems(1) = sValeur
  Set lwR�sultats.SelectedItem = x
  lwR�sultats.Refresh
End Sub

Private Function NV(x) As String
  If IsNull(x) Then
    NV = ""
  Else
    NV = x
  End If
End Function

Private Sub Sch�ma(c As ADODB.Connection, k As ADODB.SchemaEnum, sSchemaEnum As String)
  Dim rs As ADODB.Recordset
  
  AddInfo ""
  AddInfo "OpenSchema(" & sSchemaEnum & ")"
  On Error Resume Next
  Set rs = c.OpenSchema(k)
  If Err Then
    AddInfo "Erreur", Err & ": " & Error
    Exit Sub
  End If
  
  On Error GoTo 0
  Do Until rs.EOF
    AddInfo NV(rs.Fields(0)), NV(rs.Fields(1))
    rs.MoveNext
  Loop
  rs.Close
End Sub

Private Sub btnTest_Click()
  Dim c As ADODB.Connection
  Dim r As ADODB.Recordset
  
  AddInfo "Cr�ation connexion"
  Set c = New ADODB.Connection
  c.Open "Provider=MSDASQL;DSN=ercem;Driver={Informix}"
  AddInfo "Attribures:", c.Attributes
  AddInfo "ConnexionString:", c.ConnectionString
  AddInfo "ConnectionTimeout:", c.ConnectionTimeout
  AddInfo "CursorLocation:", c.CursorLocation & ": " & IIf(c.CursorLocation = adUseClient, "adUseClient", "adUseServer")
'  AddInfo "DefaultDatabase:", c.DefaultDatabase
  AddInfo "IsolationLevel:", c.IsolationLevel
  AddInfo "Mode:", c.Mode
  AddInfo "Properties.count:", c.Properties.Count
  AddInfo "Provider:", c.Provider
  AddInfo "State:", c.State
  AddInfo "Version:", c.Version
  
  Dim rs As ADODB.Recordset
  
'  AddInfo "Liste des tables"
'  Set rs = c.OpenSchema(adSchemaTables)
'  Do Until rs.EOF
'    AddInfo rs!TABLE_NAME, rs!TABLE_TYPE
'    rs.MoveNext
'  Loop
'  rs.Close
  
  AddInfo "Colonnes utilisateur"
  Dim t(3)
  t(2) = "utilisateur"

  Set rs = c.OpenSchema(adSchemaColumns, t)
  Do Until rs.EOF
    AddInfo NV(rs.Fields("COLUMN_NAME")), NV(rs.Fields("COLUMN_FLAGS")) & "-" & NV(rs.Fields("IS_NULLABLE")) & "-" & NV(rs.Fields("DATA_TYPE")) & "-" & NV(rs.Fields("CHARACTER_MAXIMUM_LENGTH"))
    rs.MoveNext
  Loop
  rs.Close
  
  GoTo suite
  Sch�ma c, adSchemaAsserts, "adSchemaAsserts"
  Sch�ma c, adSchemaCatalogs, "adSchemaCatalogs"
  Sch�ma c, adSchemaCharacterSets, "adSchemaCharacterSets"
  Sch�ma c, adSchemaCheckConstraints, "adSchemaCheckConstraints"
  Sch�ma c, adSchemaCollations, "adSchemaCollations"
  Sch�ma c, adSchemaColumnsDomainUsage, "adSchemaColumnsDomainUsage"
  Sch�ma c, adSchemaColumnPrivileges, "adSchemaColumnPrivileges"
'  Sch�ma c, adSchemaColumns, "adSchemaColumns"
  Sch�ma c, adSchemaConstraintColumnUsage, "adSchemaConstraintColumnUsage"
  Sch�ma c, adSchemaConstraintTableUsage, "adSchemaConstraintTableUsage"
  Sch�ma c, adSchemaForeignKeys, "adSchemaForeignKeys"
  Sch�ma c, adSchemaIndexes, "adSchemaIndexes"
  Sch�ma c, adSchemaKeyColumnUsage, "adSchemaKeyColumnUsage"
  Sch�ma c, adSchemaPrimaryKeys, "adSchemaPrimaryKeys"
  Sch�ma c, adSchemaProcedureColumns, "adSchemaProcedureColumns"
  Sch�ma c, adSchemaProcedureParameters, "adSchemaProcedureParameters"
  Sch�ma c, adSchemaProcedures, "adSchemaProcedures"
  Sch�ma c, adSchemaProviderSpecific, "adSchemaProviderSpecific"
  Sch�ma c, adSchemaProviderTypes, "adSchemaProviderTypes"
  Sch�ma c, adSchemaReferentialContraints, "adSchemaReferentialContraints"
  Sch�ma c, adSchemaSchemata, "adSchemaSchemata"
  Sch�ma c, adSchemaSQLLanguages, "adSchemaSQLLanguages"
  Sch�ma c, adSchemaStatistics, "adSchemaStatistics"
  Sch�ma c, adSchemaTableConstraints, "adSchemaTableConstraints"
  Sch�ma c, adSchemaTablePrivileges, "adSchemaTablePrivileges"
  Sch�ma c, adSchemaTables, "adSchemaTables"
  Sch�ma c, adSchemaTranslations, "adSchemaTranslations"
  Sch�ma c, adSchemaUsagePrivileges, "adSchemaUsagePrivileges"
  Sch�ma c, adSchemaViewColumnUsage, "adSchemaViewColumnUsage"
  Sch�ma c, adSchemaViewTableUsage, "adSchemaViewTableUsage"
  Sch�ma c, adSchemaViews, "adSchemaViews"
suite:

  AddInfo ""
  AddInfo "Cr�ation recordset"
  Set r = New ADODB.Recordset
  
  AddInfo "Select"
  r.Open "select count(*) from produit", c, adOpenForwardOnly, adLockReadOnly
  AddInfo "Nb produits:", r.Fields(0)
  
  AddInfo "Close"
  r.Close
  c.Close
End Sub
