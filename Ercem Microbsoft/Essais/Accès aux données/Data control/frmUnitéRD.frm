VERSION 5.00
Object = "{00028C01-0000-0000-0000-000000000046}#1.0#0"; "DBGRID32.OCX"
Object = "{F6125AB1-8AB1-11CE-A77F-08002B2F4E98}#2.0#0"; "MSRDC20.OCX"
Begin VB.Form frmUnitéRD 
   Caption         =   "sce.unite"
   ClientHeight    =   3315
   ClientLeft      =   1110
   ClientTop       =   345
   ClientWidth     =   5520
   LinkTopic       =   "Form1"
   ScaleHeight     =   3315
   ScaleWidth      =   5520
   Begin VB.PictureBox picButtons 
      Align           =   2  'Align Bottom
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   300
      Left            =   0
      ScaleHeight     =   300
      ScaleWidth      =   5520
      TabIndex        =   9
      Top             =   2685
      Width           =   5520
      Begin VB.CommandButton cmdFermer 
         Caption         =   "&Fermer"
         Height          =   300
         Left            =   4505
         TabIndex        =   14
         Top             =   0
         Width           =   975
      End
      Begin VB.CommandButton cmdMettreàjour 
         Caption         =   "&Mettre à jour"
         Height          =   300
         Left            =   3409
         TabIndex        =   13
         Top             =   0
         Width           =   975
      End
      Begin VB.CommandButton cmdRafraîchir 
         Caption         =   "&Rafraîchir"
         Height          =   300
         Left            =   2313
         TabIndex        =   12
         Top             =   0
         Width           =   975
      End
      Begin VB.CommandButton cmdSupprimer 
         Caption         =   "&Supprimer"
         Height          =   300
         Left            =   1217
         TabIndex        =   11
         Top             =   0
         Width           =   975
      End
      Begin VB.CommandButton cmdAjouter 
         Caption         =   "&Ajouter"
         Height          =   300
         Left            =   121
         TabIndex        =   10
         Top             =   0
         Width           =   975
      End
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uni_titre"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   3
      Left            =   2040
      MaxLength       =   60
      TabIndex        =   7
      Top             =   1020
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uni_type"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   2
      Left            =   2040
      MaxLength       =   1
      TabIndex        =   5
      Top             =   700
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uni_code"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   1
      Left            =   2040
      MaxLength       =   10
      TabIndex        =   3
      Top             =   380
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uni_numunite"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   0
      Left            =   2040
      TabIndex        =   1
      Top             =   60
      Width           =   1935
   End
   Begin MSDBGrid.DBGrid grdDataGrid 
      Bindings        =   "frmUnitéRD.frx":0000
      Height          =   1300
      Left            =   0
      OleObjectBlob   =   "frmUnitéRD.frx":0182
      TabIndex        =   8
      Top             =   1340
      Width           =   5540
   End
   Begin MSRDC.MSRDC datPrimaryRS 
      Align           =   2  'Align Bottom
      Height          =   330
      Left            =   0
      Top             =   2985
      Width           =   5520
      _ExtentX        =   9737
      _ExtentY        =   582
      _Version        =   327681
      Options         =   0
      CursorDriver    =   0
      BOFAction       =   0
      EOFAction       =   0
      RecordsetType   =   1
      LockType        =   3
      QueryType       =   0
      Prompt          =   3
      Appearance      =   1
      QueryTimeout    =   30
      RowsetSize      =   100
      LoginTimeout    =   15
      KeysetSize      =   0
      MaxRows         =   0
      ErrorThreshold  =   -1
      BatchSize       =   15
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Enabled         =   -1  'True
      ReadOnly        =   0   'False
      Appearance      =   -1  'True
      DataSourceName  =   ""
      RecordSource    =   "select * from unite"
      UserName        =   ""
      Password        =   ""
      Connect         =   ";DSN=ercem;UID=sce;PWD=;Hostname=serveur;ServerID=Informix;DBname=/u/ercem;DBuser=;DBauth=;DBoptions=;"
      LogMessages     =   ""
      Caption         =   " "
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSRDC.MSRDC datSecondaryRS 
      Height          =   480
      Left            =   2160
      Top             =   1410
      Visible         =   0   'False
      Width           =   1200
      _ExtentX        =   2117
      _ExtentY        =   847
      _Version        =   327681
      Options         =   0
      CursorDriver    =   0
      BOFAction       =   0
      EOFAction       =   0
      RecordsetType   =   1
      LockType        =   3
      QueryType       =   0
      Prompt          =   3
      Appearance      =   1
      QueryTimeout    =   30
      RowsetSize      =   100
      LoginTimeout    =   15
      KeysetSize      =   0
      MaxRows         =   0
      ErrorThreshold  =   -1
      BatchSize       =   15
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Enabled         =   -1  'True
      ReadOnly        =   0   'False
      Appearance      =   -1  'True
      DataSourceName  =   ""
      RecordSource    =   ""
      UserName        =   ""
      Password        =   ""
      Connect         =   ";DSN=ercem;UID=sce;PWD=;Hostname=serveur;ServerID=Informix;DBname=/u/ercem;DBuser=;DBauth=;DBoptions=;"
      LogMessages     =   ""
      Caption         =   ""
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblLabels 
      Caption         =   "uni_titre:"
      Height          =   255
      Index           =   3
      Left            =   120
      TabIndex        =   6
      Top             =   1020
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uni_type:"
      Height          =   255
      Index           =   2
      Left            =   120
      TabIndex        =   4
      Top             =   700
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uni_code:"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Top             =   380
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uni_numunite:"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   60
      Width           =   1815
   End
End
Attribute VB_Name = "frmUnitéRD"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmUnitéRD
' Grille générée par l'assistant feuille de données
' Contrôle RemoteData, Relation Maître-Esclave
' 3/12/1997 PV

Option Explicit


Private Sub cmdAjouter_Click()
  datPrimaryRS.Resultset.AddNew
  Screen.MousePointer = vbDefault
End Sub

Private Sub cmdSupprimer_Click()
  With datPrimaryRS.Resultset
    .Delete
    .MoveNext
    If .EOF Then .MoveLast
  End With
End Sub

Private Sub cmdRafraîchir_Click()
  'Ceci est nécessaire uniquement pour les applications multiutilisateur
  datPrimaryRS.Refresh
End Sub

Private Sub cmdMettreàjour_Click()
  datPrimaryRS.UpdateRow
  datPrimaryRS.Resultset.Bookmark = datPrimaryRS.Resultset.LastModified
End Sub

Private Sub cmdFermer_Click()
  Screen.MousePointer = vbDefault
  Unload Me
End Sub

Private Sub datPrimaryRS_Error(ByVal Number As Long, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
  'C'est l'emplacement où mettre le code de gestion d'erreur
  'Si vous voulez ignorer les erreurs, mettez la ligne qui suit en commentaire
  'Si vous souhaitez les intercepter, ajoutez du code ici pour les gérer
  MsgBox "Data error event hit err:" & Description
  CancelDisplay = True  'Débarassez-vous de l'erreur
End Sub

Private Sub datPrimaryRS_Reposition()
  Screen.MousePointer = vbDefault
  On Error Resume Next
  'Cela va synchroniser la grille avec le jeu d'enregistrements père
  datSecondaryRS.SQL = "select uti_numuti,uti_nom,uti_bal,uti_lettres,uti_unite from sce.utilisateur2 where uti_unite=" & datPrimaryRS.Resultset!uni_numunite
  datSecondaryRS.Refresh
End Sub

Private Sub datPrimaryRS_Validate(Action As Integer, Reserved As Integer)
  'Insérez ici le code de validation
  'Cet événement est appelé lorsque les actions suivantes se produisent
  Select Case Action
    Case rdActionMoveFirst
    Case rdActionMovePrevious
    Case rdActionMoveNext
    Case rdActionMoveLast
    Case rdActionAddNew
    Case rdActionUpdate
    Case rdActionDelete
    Case rdActionFind
    Case rdActionBookmark
    Case rdActionClose
      Screen.MousePointer = vbDefault
  End Select
  Screen.MousePointer = vbHourglass
End Sub

Private Sub Form_Load()
  'Crée le jeu d'enregistrements de la grille
  datPrimaryRS.Refresh
  datPrimaryRS.Resultset.MoveFirst
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Screen.MousePointer = vbDefault
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  'Ceci redimensionnera la grille lorsque la feuille sera redimensionnée
  grdDataGrid.Width = Me.ScaleWidth
  grdDataGrid.Height = Me.ScaleHeight - grdDataGrid.Top - datPrimaryRS.Height - picButtons.Height - 30
End Sub

