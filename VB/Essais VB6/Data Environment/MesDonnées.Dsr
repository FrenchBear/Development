VERSION 5.00
Begin {C0E45035-5775-11D0-B388-00A0C9055D8E} MesDonnées 
   ClientHeight    =   4290
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7125
   _ExtentX        =   12568
   _ExtentY        =   7567
   FolderFlags     =   1
   TypeLibGuid     =   "{1A5A8819-679E-11D2-AB61-0060086AA0DA}"
   TypeInfoGuid    =   "{1A5A881A-679E-11D2-AB61-0060086AA0DA}"
   TypeInfoCookie  =   0
   Version         =   4
   NumConnections  =   1
   BeginProperty Connection1 
      ConnectionName  =   "Biblio"
      ConnDispId      =   1001
      SourceOfData    =   3
      ConnectionSource=   "Provider=Microsoft.Jet.OLEDB.3.51;Persist Security Info=False;Data Source=F:\Visual Studio 6\VB98\Biblio.mdb"
      Expanded        =   -1  'True
      QuoteChar       =   96
      SeparatorChar   =   46
   EndProperty
   NumRecordsets   =   2
   BeginProperty Recordset1 
      CommandName     =   "Editeurs"
      CommDispId      =   1002
      RsDispId        =   1006
      CommandText     =   "Publishers"
      ActiveConnectionName=   "Biblio"
      CommandType     =   2
      dbObjectType    =   1
      Expanded        =   -1  'True
      IsRSReturning   =   -1  'True
      NumFields       =   10
      BeginProperty Field1 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "PubID"
         Caption         =   "PubID"
      EndProperty
      BeginProperty Field2 
         Precision       =   0
         Size            =   50
         Scale           =   0
         Type            =   200
         Name            =   "Name"
         Caption         =   "Name"
      EndProperty
      BeginProperty Field3 
         Precision       =   0
         Size            =   255
         Scale           =   0
         Type            =   200
         Name            =   "Company Name"
         Caption         =   "Company Name"
      EndProperty
      BeginProperty Field4 
         Precision       =   0
         Size            =   50
         Scale           =   0
         Type            =   200
         Name            =   "Address"
         Caption         =   "Address"
      EndProperty
      BeginProperty Field5 
         Precision       =   0
         Size            =   20
         Scale           =   0
         Type            =   200
         Name            =   "City"
         Caption         =   "City"
      EndProperty
      BeginProperty Field6 
         Precision       =   0
         Size            =   10
         Scale           =   0
         Type            =   200
         Name            =   "State"
         Caption         =   "State"
      EndProperty
      BeginProperty Field7 
         Precision       =   0
         Size            =   15
         Scale           =   0
         Type            =   200
         Name            =   "Zip"
         Caption         =   "Zip"
      EndProperty
      BeginProperty Field8 
         Precision       =   0
         Size            =   15
         Scale           =   0
         Type            =   200
         Name            =   "Telephone"
         Caption         =   "Telephone"
      EndProperty
      BeginProperty Field9 
         Precision       =   0
         Size            =   15
         Scale           =   0
         Type            =   200
         Name            =   "Fax"
         Caption         =   "Fax"
      EndProperty
      BeginProperty Field10 
         Precision       =   0
         Size            =   1073741824
         Scale           =   0
         Type            =   201
         Name            =   "Comments"
         Caption         =   "Comments"
      EndProperty
      NumGroups       =   0
      ParamCount      =   0
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset2 
      CommandName     =   "Titres"
      CommDispId      =   -1
      RsDispId        =   -1
      CommandText     =   "Titles"
      ActiveConnectionName=   "Biblio"
      CommandType     =   2
      dbObjectType    =   1
      RelateToParent  =   -1  'True
      ParentCommandName=   "Editeurs"
      IsRSReturning   =   -1  'True
      NumFields       =   8
      BeginProperty Field1 
         Precision       =   0
         Size            =   255
         Scale           =   0
         Type            =   200
         Name            =   "Title"
         Caption         =   "Title"
      EndProperty
      BeginProperty Field2 
         Precision       =   5
         Size            =   2
         Scale           =   0
         Type            =   2
         Name            =   "Year Published"
         Caption         =   "Year Published"
      EndProperty
      BeginProperty Field3 
         Precision       =   0
         Size            =   20
         Scale           =   0
         Type            =   200
         Name            =   "ISBN"
         Caption         =   "ISBN"
      EndProperty
      BeginProperty Field4 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "PubID"
         Caption         =   "PubID"
      EndProperty
      BeginProperty Field5 
         Precision       =   0
         Size            =   50
         Scale           =   0
         Type            =   200
         Name            =   "Description"
         Caption         =   "Description"
      EndProperty
      BeginProperty Field6 
         Precision       =   0
         Size            =   50
         Scale           =   0
         Type            =   200
         Name            =   "Notes"
         Caption         =   "Notes"
      EndProperty
      BeginProperty Field7 
         Precision       =   0
         Size            =   50
         Scale           =   0
         Type            =   200
         Name            =   "Subject"
         Caption         =   "Subject"
      EndProperty
      BeginProperty Field8 
         Precision       =   0
         Size            =   1073741824
         Scale           =   0
         Type            =   201
         Name            =   "Comments"
         Caption         =   "Comments"
      EndProperty
      NumGroups       =   0
      ParamCount      =   0
      RelationCount   =   1
      BeginProperty Relation1 
         ParentField     =   "PubID"
         ChildField      =   "PubID"
         ParentType      =   0
         ChildType       =   0
      EndProperty
      AggregateCount  =   0
   EndProperty
End
Attribute VB_Name = "MesDonnées"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' MesDonnées
' Premier essai de DataEnvironment
' 19/10/98 PV

Option Explicit

Private Sub Biblio_BeginTransComplete(ByVal TransactionLevel As Long, ByVal pError As ADODB.Error, adStatus As ADODB.EventStatusEnum, ByVal pConnection As ADODB.Connection)
  Debug.Print "Biblio_BeginTransComplete"
End Sub

Private Sub Biblio_CommitTransComplete(ByVal pError As ADODB.Error, adStatus As ADODB.EventStatusEnum, ByVal pConnection As ADODB.Connection)
  Debug.Print "Biblio_CommitTransComplete"
End Sub

Private Sub Biblio_ConnectComplete(ByVal pError As ADODB.Error, adStatus As ADODB.EventStatusEnum, ByVal pConnection As ADODB.Connection)
  Debug.Print "Biblio_ConnectComplete"
End Sub

Private Sub Biblio_Disconnect(adStatus As ADODB.EventStatusEnum, ByVal pConnection As ADODB.Connection)
  Debug.Print "Biblio_Disconnect"
End Sub

Private Sub Biblio_ExecuteComplete(ByVal RecordsAffected As Long, ByVal pError As ADODB.Error, adStatus As ADODB.EventStatusEnum, ByVal pCommand As ADODB.Command, ByVal pRecordset As ADODB.Recordset, ByVal pConnection As ADODB.Connection)
  Debug.Print "Biblio_ExecuteComplete"
End Sub

Private Sub Biblio_InfoMessage(ByVal pError As ADODB.Error, adStatus As ADODB.EventStatusEnum, ByVal pConnection As ADODB.Connection)
  Debug.Print "Biblio_InfoMessage"
End Sub

Private Sub Biblio_RollbackTransComplete(ByVal pError As ADODB.Error, adStatus As ADODB.EventStatusEnum, ByVal pConnection As ADODB.Connection)
  Debug.Print "Biblio_RollbackTransComplete"
End Sub

Private Sub Biblio_WillConnect(ConnectionString As String, UserID As String, Password As String, Options As Long, adStatus As ADODB.EventStatusEnum, ByVal pConnection As ADODB.Connection)
  Debug.Print "Biblio_WillConnect"
End Sub

Private Sub Biblio_WillExecute(Source As String, CursorType As ADODB.CursorTypeEnum, LockType As ADODB.LockTypeEnum, Options As Long, adStatus As ADODB.EventStatusEnum, ByVal pCommand As ADODB.Command, ByVal pRecordset As ADODB.Recordset, ByVal pConnection As ADODB.Connection)
  Debug.Print "Biblio_WillExecute"
End Sub



Private Sub DataEnvironment_Initialize()
  Debug.Print "DataEnvironment_Initialize"
End Sub

Private Sub DataEnvironment_Terminate()
  Debug.Print "DataEnvironment_Terminate"
End Sub


Private Sub rsEditeurs_EndOfRecordset(fMoreData As Boolean, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
  Debug.Print "rsEditeurs_EndOfRecordset"
End Sub

Private Sub rsEditeurs_FetchComplete(ByVal pError As ADODB.Error, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
  Debug.Print "rsEditeurs_FetchComplete"
End Sub

Private Sub rsEditeurs_FetchProgress(ByVal Progress As Long, ByVal MaxProgress As Long, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
  Debug.Print "rsEditeurs_FetchProgress"
End Sub

Private Sub rsEditeurs_FieldChangeComplete(ByVal cFields As Long, ByVal Fields As Variant, ByVal pError As ADODB.Error, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
  Debug.Print "rsEditeurs_FieldChangeComplete"
End Sub

Private Sub rsEditeurs_MoveComplete(ByVal adReason As ADODB.EventReasonEnum, ByVal pError As ADODB.Error, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
  Debug.Print "rsEditeurs_MoveComplete"
End Sub

Private Sub rsEditeurs_RecordChangeComplete(ByVal adReason As ADODB.EventReasonEnum, ByVal cRecords As Long, ByVal pError As ADODB.Error, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
  Debug.Print "rsEditeurs_RecordChangeComplete"
End Sub

Private Sub rsEditeurs_RecordsetChangeComplete(ByVal adReason As ADODB.EventReasonEnum, ByVal pError As ADODB.Error, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
  Debug.Print "rsEditeurs_RecordsetChangeComplete"
End Sub

Private Sub rsEditeurs_WillChangeField(ByVal cFields As Long, ByVal Fields As Variant, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
  Debug.Print "rsEditeurs_WillChangeField"
End Sub

Private Sub rsEditeurs_WillChangeRecord(ByVal adReason As ADODB.EventReasonEnum, ByVal cRecords As Long, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
  Debug.Print "rsEditeurs_WillChangeRecord"
End Sub

Private Sub rsEditeurs_WillChangeRecordset(ByVal adReason As ADODB.EventReasonEnum, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
  Debug.Print "rsEditeurs_WillChangeRecordset"
End Sub

Private Sub rsEditeurs_WillMove(ByVal adReason As ADODB.EventReasonEnum, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
  Debug.Print "rsEditeurs_WillMove"
End Sub
