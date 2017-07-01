VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmTestADO2 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Test ADO plus poussés"
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
   Begin MSComctlLib.ListView lwRésultats 
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
         Text            =   "Clé"
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
' Tests ADO plus poussés
'  2/03/1998 PV
' 12/08/1998 PV ADO 2.0, colonnes d'une table précise

Option Explicit

Private Sub AddInfo(sClé As String, Optional sValeur As String)
  Dim x As ListItem
  Set x = lwRésultats.ListItems.Add
  x.Text = sClé
  x.SubItems(1) = sValeur
  Set lwRésultats.SelectedItem = x
  lwRésultats.Refresh
End Sub

Private Function NV(x) As String
  If IsNull(x) Then
    NV = ""
  Else
    NV = x
  End If
End Function

Private Sub Schéma(c As ADODB.Connection, k As ADODB.SchemaEnum, sSchemaEnum As String)
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
  
  AddInfo "Création connexion"
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
  Schéma c, adSchemaAsserts, "adSchemaAsserts"
  Schéma c, adSchemaCatalogs, "adSchemaCatalogs"
  Schéma c, adSchemaCharacterSets, "adSchemaCharacterSets"
  Schéma c, adSchemaCheckConstraints, "adSchemaCheckConstraints"
  Schéma c, adSchemaCollations, "adSchemaCollations"
  Schéma c, adSchemaColumnsDomainUsage, "adSchemaColumnsDomainUsage"
  Schéma c, adSchemaColumnPrivileges, "adSchemaColumnPrivileges"
'  Schéma c, adSchemaColumns, "adSchemaColumns"
  Schéma c, adSchemaConstraintColumnUsage, "adSchemaConstraintColumnUsage"
  Schéma c, adSchemaConstraintTableUsage, "adSchemaConstraintTableUsage"
  Schéma c, adSchemaForeignKeys, "adSchemaForeignKeys"
  Schéma c, adSchemaIndexes, "adSchemaIndexes"
  Schéma c, adSchemaKeyColumnUsage, "adSchemaKeyColumnUsage"
  Schéma c, adSchemaPrimaryKeys, "adSchemaPrimaryKeys"
  Schéma c, adSchemaProcedureColumns, "adSchemaProcedureColumns"
  Schéma c, adSchemaProcedureParameters, "adSchemaProcedureParameters"
  Schéma c, adSchemaProcedures, "adSchemaProcedures"
  Schéma c, adSchemaProviderSpecific, "adSchemaProviderSpecific"
  Schéma c, adSchemaProviderTypes, "adSchemaProviderTypes"
  Schéma c, adSchemaReferentialContraints, "adSchemaReferentialContraints"
  Schéma c, adSchemaSchemata, "adSchemaSchemata"
  Schéma c, adSchemaSQLLanguages, "adSchemaSQLLanguages"
  Schéma c, adSchemaStatistics, "adSchemaStatistics"
  Schéma c, adSchemaTableConstraints, "adSchemaTableConstraints"
  Schéma c, adSchemaTablePrivileges, "adSchemaTablePrivileges"
  Schéma c, adSchemaTables, "adSchemaTables"
  Schéma c, adSchemaTranslations, "adSchemaTranslations"
  Schéma c, adSchemaUsagePrivileges, "adSchemaUsagePrivileges"
  Schéma c, adSchemaViewColumnUsage, "adSchemaViewColumnUsage"
  Schéma c, adSchemaViewTableUsage, "adSchemaViewTableUsage"
  Schéma c, adSchemaViews, "adSchemaViews"
suite:

  AddInfo ""
  AddInfo "Création recordset"
  Set r = New ADODB.Recordset
  
  AddInfo "Select"
  r.Open "select count(*) from produit", c, adOpenForwardOnly, adLockReadOnly
  AddInfo "Nb produits:", r.Fields(0)
  
  AddInfo "Close"
  r.Close
  c.Close
End Sub
