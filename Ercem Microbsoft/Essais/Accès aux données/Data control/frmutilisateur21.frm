VERSION 5.00
Object = "{F6125AB1-8AB1-11CE-A77F-08002B2F4E98}#2.0#0"; "MSRDC20.OCX"
Begin VB.Form frmUtilisateur2RD 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Utilisateur2RD"
   ClientHeight    =   6210
   ClientLeft      =   1095
   ClientTop       =   330
   ClientWidth     =   5550
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6210
   ScaleWidth      =   5550
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox picButtons 
      Align           =   2  'Align Bottom
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   300
      Left            =   0
      ScaleHeight     =   300
      ScaleWidth      =   5550
      TabIndex        =   34
      Top             =   5580
      Width           =   5550
      Begin VB.CommandButton cmdFermer 
         Caption         =   "&Fermer"
         Height          =   300
         Left            =   4505
         TabIndex        =   39
         Top             =   0
         Width           =   975
      End
      Begin VB.CommandButton cmdMettreàjour 
         Caption         =   "&Mettre à jour"
         Height          =   300
         Left            =   3409
         TabIndex        =   38
         Top             =   0
         Width           =   975
      End
      Begin VB.CommandButton cmdRafraîchir 
         Caption         =   "&Rafraîchir"
         Height          =   300
         Left            =   2313
         TabIndex        =   37
         Top             =   0
         Width           =   975
      End
      Begin VB.CommandButton cmdSupprimer 
         Caption         =   "&Supprimer"
         Height          =   300
         Left            =   1217
         TabIndex        =   36
         Top             =   0
         Width           =   975
      End
      Begin VB.CommandButton cmdAjouter 
         Caption         =   "&Ajouter"
         Height          =   300
         Left            =   121
         TabIndex        =   35
         Top             =   0
         Width           =   975
      End
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_micro"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   16
      Left            =   2040
      MaxLength       =   8
      TabIndex        =   33
      Top             =   5180
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_passwd"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   15
      Left            =   2040
      MaxLength       =   15
      TabIndex        =   31
      Top             =   4860
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_sysbal"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   14
      Left            =   2040
      MaxLength       =   1
      TabIndex        =   29
      Top             =   4540
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_tel"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   13
      Left            =   2040
      MaxLength       =   50
      TabIndex        =   27
      Top             =   4220
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_nomercem"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   12
      Left            =   2040
      MaxLength       =   23
      TabIndex        =   25
      Top             =   3900
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_nivweb"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   11
      Left            =   2040
      TabIndex        =   23
      Top             =   3580
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_titre"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   10
      Left            =   2040
      MaxLength       =   60
      TabIndex        =   21
      Top             =   3260
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "timestamp"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   9
      Left            =   2040
      TabIndex        =   19
      Top             =   2940
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_niveau"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   8
      Left            =   2040
      TabIndex        =   17
      Top             =   2620
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_systemes"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   7
      Left            =   2040
      MaxLength       =   15
      TabIndex        =   15
      Top             =   2300
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_datenaiss"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   6
      Left            =   2040
      TabIndex        =   13
      Top             =   1980
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_uniteercem"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   5
      Left            =   2040
      TabIndex        =   11
      Top             =   1660
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_unite"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   4
      Left            =   2040
      TabIndex        =   9
      Top             =   1340
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_lettres"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   3
      Left            =   2040
      MaxLength       =   20
      TabIndex        =   7
      Top             =   1020
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_bal"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   2
      Left            =   2040
      MaxLength       =   10
      TabIndex        =   5
      Top             =   700
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_nom"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   1
      Left            =   2040
      MaxLength       =   30
      TabIndex        =   3
      Top             =   380
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "uti_numuti"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   0
      Left            =   2040
      TabIndex        =   1
      Top             =   60
      Width           =   1935
   End
   Begin MSRDC.MSRDC datPrimaryRS 
      Align           =   2  'Align Bottom
      Height          =   330
      Left            =   0
      Top             =   5880
      Width           =   5550
      _ExtentX        =   9790
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
      RecordSource    =   "select * from utilisateur2"
      UserName        =   ""
      Password        =   ""
      Connect         =   "ODBC;DSN=ercem;UID=sce;PWD=;Hostname=serveur;ServerID=Informix;DBname=/u/ercem;DBuser=;DBauth=;DBoptions=;"
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
   Begin VB.Label lblLabels 
      Caption         =   "uti_micro:"
      Height          =   255
      Index           =   16
      Left            =   120
      TabIndex        =   32
      Top             =   5180
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uti_passwd:"
      Height          =   255
      Index           =   15
      Left            =   120
      TabIndex        =   30
      Top             =   4860
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uti_sysbal:"
      Height          =   255
      Index           =   14
      Left            =   120
      TabIndex        =   28
      Top             =   4540
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uti_tel:"
      Height          =   255
      Index           =   13
      Left            =   120
      TabIndex        =   26
      Top             =   4220
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uti_nomercem:"
      Height          =   255
      Index           =   12
      Left            =   120
      TabIndex        =   24
      Top             =   3900
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uti_nivweb:"
      Height          =   255
      Index           =   11
      Left            =   120
      TabIndex        =   22
      Top             =   3580
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uti_titre:"
      Height          =   255
      Index           =   10
      Left            =   120
      TabIndex        =   20
      Top             =   3260
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "timestamp:"
      Height          =   255
      Index           =   9
      Left            =   120
      TabIndex        =   18
      Top             =   2940
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uti_niveau:"
      Height          =   255
      Index           =   8
      Left            =   120
      TabIndex        =   16
      Top             =   2620
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uti_systemes:"
      Height          =   255
      Index           =   7
      Left            =   120
      TabIndex        =   14
      Top             =   2300
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uti_datenaiss:"
      Height          =   255
      Index           =   6
      Left            =   120
      TabIndex        =   12
      Top             =   1980
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uti_uniteercem:"
      Height          =   255
      Index           =   5
      Left            =   120
      TabIndex        =   10
      Top             =   1660
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uti_unite:"
      Height          =   255
      Index           =   4
      Left            =   120
      TabIndex        =   8
      Top             =   1340
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uti_lettres:"
      Height          =   255
      Index           =   3
      Left            =   120
      TabIndex        =   6
      Top             =   1020
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uti_bal:"
      Height          =   255
      Index           =   2
      Left            =   120
      TabIndex        =   4
      Top             =   700
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uti_nom:"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Top             =   380
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "uti_numuti:"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   60
      Width           =   1815
   End
End
Attribute VB_Name = "frmUtilisateur2RD"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmUtilisateur2RD
' Grille générée par l'assistant feuille de données
' Contrôle RemoteData
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

Private Sub Form_Unload(Cancel As Integer)
  Screen.MousePointer = vbDefault
End Sub

