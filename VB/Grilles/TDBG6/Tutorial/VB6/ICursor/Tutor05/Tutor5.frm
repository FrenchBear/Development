VERSION 5.00
Object = "{00028CDA-0000-0000-0000-000000000046}#6.0#0"; "TDBG6.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1:  True DBGrid Pro 6.0 for VB 6 - Tutorial 5"
   ClientHeight    =   3435
   ClientLeft      =   1275
   ClientTop       =   1560
   ClientWidth     =   5430
   LinkTopic       =   "Form1"
   ScaleHeight     =   3435
   ScaleWidth      =   5430
   Begin TrueDBGrid60.TDBGrid TDBGrid1 
      Bindings        =   "Tutor5.frx":0000
      Height          =   2175
      Left            =   120
      OleObjectBlob   =   "Tutor5.frx":0014
      TabIndex        =   0
      Top             =   600
      Width           =   5175
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Clear"
      Height          =   495
      Left            =   1440
      TabIndex        =   2
      Top             =   2880
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Select"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   2880
      Width           =   1215
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   "C:\TDBG6\TUTORIAL\TDBGDEMO.MDB"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   420
      Left            =   120
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "SELECT * FROM composer, opus, composer INNER JOIN opus ON composer.last = opus.last"
      Top             =   120
      Width           =   5220
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
' This routine loops through the Recordset to find and
' highlight all records with Country = "Germany"
    
' We shall use a clone so that we do not move the actual
' record position of the Data control
    Dim dclone As Recordset
    Set dclone = Data1.Recordset.Clone()

' In case there is a large Recordset to search through
    Screen.MousePointer = vbHourglass
    
' For each matching record, add the bookmark to the
' SelBookmarks collection of the grid.  The grid will
' highlight the corresponding rows.  Note that the bookmarks
' of a clone are compatible with the original set.
' This is ONLY true of clones.
    Dim SelBks As TrueDBGrid60.SelBookmarks
    Set SelBks = TDBGrid1.SelBookmarks

    Dim Criteria$
    Criteria$ = "Country = 'Germany'"
    dclone.FindFirst Criteria$
    While Not dclone.NoMatch
        SelBks.Add dclone.Bookmark
        dclone.FindNext Criteria$
    Wend
    
' Restore regular mouse pointer
    Screen.MousePointer = vbDefault
End Sub

Private Sub Command2_Click()
' Clear all selected rows by removing the selected records
' from the SelBookmarks collection.

    Dim SelBks As TrueDBGrid60.SelBookmarks
    Set SelBks = TDBGrid1.SelBookmarks

    While SelBks.Count <> 0
        SelBks.Remove 0
    Wend
End Sub
