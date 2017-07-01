VERSION 5.00
Begin {C0E45035-5775-11D0-B388-00A0C9055D8E} DE 
   ClientHeight    =   6240
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7395
   _ExtentX        =   13044
   _ExtentY        =   11007
   FolderFlags     =   1
   TypeLibGuid     =   "{6D8F3D01-AE31-11D2-8D8E-0060086AA0DA}"
   TypeInfoGuid    =   "{6D8F3D02-AE31-11D2-8D8E-0060086AA0DA}"
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
   NumRecordsets   =   4
   BeginProperty Recordset1 
      CommandName     =   "AuteursTitres"
      CommDispId      =   1002
      RsDispId        =   1006
      CommandText     =   $"deBiblio.dsx":0000
      ActiveConnectionName=   "Biblio"
      CommandType     =   1
      Expanded        =   -1  'True
      IsRSReturning   =   -1  'True
      NumFields       =   2
      BeginProperty Field1 
         Precision       =   0
         Size            =   50
         Scale           =   0
         Type            =   200
         Name            =   "Author"
         Caption         =   "Author"
      EndProperty
      BeginProperty Field2 
         Precision       =   0
         Size            =   255
         Scale           =   0
         Type            =   200
         Name            =   "Title"
         Caption         =   "Title"
      EndProperty
      NumGroups       =   0
      ParamCount      =   0
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset2 
      CommandName     =   "NbLivresParAuteur_Classique"
      CommDispId      =   1007
      RsDispId        =   1014
      CommandText     =   $"deBiblio.dsx":009D
      ActiveConnectionName=   "Biblio"
      CommandType     =   1
      Expanded        =   -1  'True
      IsRSReturning   =   -1  'True
      NumFields       =   2
      BeginProperty Field1 
         Precision       =   0
         Size            =   50
         Scale           =   0
         Type            =   200
         Name            =   "Author"
         Caption         =   "Author"
      EndProperty
      BeginProperty Field2 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "Nb"
         Caption         =   "Nb"
      EndProperty
      NumGroups       =   0
      ParamCount      =   0
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset3 
      CommandName     =   "Authors"
      CommDispId      =   1020
      RsDispId        =   1021
      CommandText     =   "Authors"
      ActiveConnectionName=   "Biblio"
      CommandType     =   2
      dbObjectType    =   1
      Expanded        =   -1  'True
      IsRSReturning   =   -1  'True
      NumFields       =   3
      BeginProperty Field1 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "Au_ID"
         Caption         =   "Au_ID"
      EndProperty
      BeginProperty Field2 
         Precision       =   0
         Size            =   50
         Scale           =   0
         Type            =   200
         Name            =   "Author"
         Caption         =   "Author"
      EndProperty
      BeginProperty Field3 
         Precision       =   5
         Size            =   2
         Scale           =   0
         Type            =   2
         Name            =   "Year Born"
         Caption         =   "Year Born"
      EndProperty
      NumGroups       =   0
      ParamCount      =   0
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset4 
      CommandName     =   "Title_Author"
      CommDispId      =   -1
      RsDispId        =   -1
      CommandText     =   "Title Author"
      ActiveConnectionName=   "Biblio"
      CommandType     =   2
      dbObjectType    =   1
      GroupingName    =   "Title_Author_Regroupeme"
      RelateToParent  =   -1  'True
      ParentCommandName=   "Authors"
      Expanded        =   -1  'True
      IsRSReturning   =   -1  'True
      NumFields       =   2
      BeginProperty Field1 
         Precision       =   0
         Size            =   20
         Scale           =   0
         Type            =   200
         Name            =   "ISBN"
         Caption         =   "ISBN"
      EndProperty
      BeginProperty Field2 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "Au_ID"
         Caption         =   "Au_ID"
      EndProperty
      NumGroups       =   0
      ParamCount      =   0
      RelationCount   =   1
      BeginProperty Relation1 
         ParentField     =   "Au_ID"
         ChildField      =   "Au_ID"
         ParentType      =   0
         ChildType       =   0
      EndProperty
      AggregateCount  =   0
   EndProperty
End
Attribute VB_Name = "DE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

