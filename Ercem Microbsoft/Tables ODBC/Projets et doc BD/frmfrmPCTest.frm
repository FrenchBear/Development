VERSION 5.00
Begin VB.Form frmfrmPCTest 
   Caption         =   "sce.incident"
   ClientHeight    =   5910
   ClientLeft      =   1110
   ClientTop       =   345
   ClientWidth     =   5490
   LinkTopic       =   "Form1"
   ScaleHeight     =   5910
   ScaleWidth      =   5490
   Begin VB.CommandButton cmdClose 
      Caption         =   "&Fermer"
      Height          =   300
      Left            =   4440
      TabIndex        =   36
      Top             =   5180
      Width           =   975
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "&Valider"
      Height          =   300
      Left            =   3360
      TabIndex        =   35
      Top             =   5180
      Width           =   975
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "A&ctualiser"
      Height          =   300
      Left            =   2280
      TabIndex        =   34
      Top             =   5180
      Width           =   975
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "&Supprimer"
      Height          =   300
      Left            =   1200
      TabIndex        =   33
      Top             =   5180
      Width           =   975
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "&Ajouter"
      Height          =   300
      Left            =   120
      TabIndex        =   32
      Top             =   5180
      Width           =   975
   End
   Begin VB.Data Data1 
      Align           =   2  'Align Bottom
      Connect         =   "ODBC;DSN=lyon;UID=sce;PWD=;Hostname=lyon;ServerID=Informix;DBname=ercem;DBuser=;DBauth=;DBoptions=;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   1  'UseODBC
      Exclusive       =   0   'False
      Height          =   405
      Left            =   0
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "sce.incident"
      Top             =   5505
      Width           =   5490
   End
   Begin VB.TextBox txtFields 
      DataField       =   "timestamp"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   15
      Left            =   2040
      TabIndex        =   31
      Top             =   4840
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "inc_idmodif"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   14
      Left            =   2040
      MaxLength       =   40
      TabIndex        =   29
      Top             =   4520
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "inc_nature"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   13
      Left            =   2040
      TabIndex        =   27
      Top             =   4200
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "inc_resolution"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   12
      Left            =   2040
      MaxLength       =   250
      TabIndex        =   25
      Top             =   3880
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "inc_traitepar"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   11
      Left            =   2040
      TabIndex        =   23
      Top             =   3560
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "inc_modetatle"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   10
      Left            =   2040
      TabIndex        =   21
      Top             =   3240
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "inc_etat"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   9
      Left            =   2040
      TabIndex        =   19
      Top             =   2920
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "inc_echeance"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   8
      Left            =   2040
      TabIndex        =   17
      Top             =   2600
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "inc_niveau"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   7
      Left            =   2040
      TabIndex        =   15
      Top             =   2280
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "inc_materiel"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   6
      Left            =   2040
      MaxLength       =   16
      TabIndex        =   13
      Top             =   1960
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "inc_signalepar"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   5
      Left            =   2040
      TabIndex        =   11
      Top             =   1640
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "inc_soumisle"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   4
      Left            =   2040
      TabIndex        =   9
      Top             =   1320
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "inc_soumispar"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   3
      Left            =   2040
      TabIndex        =   7
      Top             =   1000
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      DataField       =   "inc_description"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   2
      Left            =   2040
      MaxLength       =   250
      TabIndex        =   5
      Top             =   680
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "inc_titre"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   1
      Left            =   2040
      MaxLength       =   60
      TabIndex        =   3
      Top             =   360
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "inc_serie"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   0
      Left            =   2040
      TabIndex        =   1
      Top             =   40
      Width           =   1935
   End
   Begin VB.Label lblLabels 
      Caption         =   "timestamp:"
      Height          =   255
      Index           =   15
      Left            =   120
      TabIndex        =   30
      Top             =   4860
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "inc_idmodif:"
      Height          =   255
      Index           =   14
      Left            =   120
      TabIndex        =   28
      Top             =   4540
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "inc_nature:"
      Height          =   255
      Index           =   13
      Left            =   120
      TabIndex        =   26
      Top             =   4220
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "inc_resolution:"
      Height          =   255
      Index           =   12
      Left            =   120
      TabIndex        =   24
      Top             =   3900
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "inc_traitepar:"
      Height          =   255
      Index           =   11
      Left            =   120
      TabIndex        =   22
      Top             =   3580
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "inc_modetatle:"
      Height          =   255
      Index           =   10
      Left            =   120
      TabIndex        =   20
      Top             =   3260
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "inc_etat:"
      Height          =   255
      Index           =   9
      Left            =   120
      TabIndex        =   18
      Top             =   2940
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "inc_echeance:"
      Height          =   255
      Index           =   8
      Left            =   120
      TabIndex        =   16
      Top             =   2620
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "inc_niveau:"
      Height          =   255
      Index           =   7
      Left            =   120
      TabIndex        =   14
      Top             =   2300
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "inc_materiel:"
      Height          =   255
      Index           =   6
      Left            =   120
      TabIndex        =   12
      Top             =   1980
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "inc_signalepar:"
      Height          =   255
      Index           =   5
      Left            =   120
      TabIndex        =   10
      Top             =   1660
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "inc_soumisle:"
      Height          =   255
      Index           =   4
      Left            =   120
      TabIndex        =   8
      Top             =   1340
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "inc_soumispar:"
      Height          =   255
      Index           =   3
      Left            =   120
      TabIndex        =   6
      Top             =   1020
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "inc_description:"
      Height          =   255
      Index           =   2
      Left            =   120
      TabIndex        =   4
      Top             =   700
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "inc_titre:"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Top             =   380
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "inc_serie:"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   60
      Width           =   1815
   End
End
Attribute VB_Name = "frmfrmPCTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdAdd_Click()
  Data1.Recordset.AddNew
End Sub

Private Sub cmdDelete_Click()
  ' Ceci produira une erreur si vous effacez le dernier.
  ' Enregistre l'enregistrement unique dans l'objet Recordset.
  Data1.Recordset.Delete
  Data1.Recordset.MoveNext
End Sub

Private Sub cmdRefresh_Click()
  ' Ceci n'est indispensable que pour les applications multi-utilisateur.
  Data1.Refresh
End Sub

Private Sub cmdUpdate_Click()
  Data1.UpdateRecord
  Data1.Recordset.Bookmark = Data1.Recordset.LastModified
End Sub

Private Sub cmdClose_Click()
  Unload Me
End Sub

Private Sub Data1_Error(DataErr As Integer, Response As Integer)
  ' C'est l'emplacement où mettre le code de gestion d'erreur
  ' Pour ignorer les erreurs, mettez en commentaire la ligne suivante
  ' Si vous souhaitez les intercepter, ajoutez du code ici pour les gérer.
  MsgBox "Le gestionnaire d'erreurs des données a rencontré l'erreur:" & Error$(DataErr)
  Response = 0  ' Se débarasse de l'erreur.
End Sub

Private Sub Data1_Reposition()
  Screen.MousePointer = vbDefault
  On Error Resume Next
  ' Ceci affichera la position de l'enregistrement en cours
  ' pour les jeux d'enregistrements et les feuilles de réponse dynamiques
  Data1.Caption = "Enregistrement: " & (Data1.Recordset.AbsolutePosition + 1)
  ' Pour l'objet de la table, vous devez définir la propriété de l'index lorsque
  ' le jeu d'enregistrement est créé et utilise la ligne suivante.
  ' Data1.Caption = "Record: " & (Data1.Recordset.RecordCount * (Data1.Recordset.PercentPosition * 0.01)) + 1
End Sub

Private Sub Data1_Validate(Action As Integer, Save As Integer)
  ' Insérez ici le code de validation.
  ' Cet événement est appelé lorsque les actions suivantes se produisent.
  Select Case Action
    Case vbDataActionMoveFirst
    Case vbDataActionMovePrevious
    Case vbDataActionMoveNext
    Case vbDataActionMoveLast
    Case vbDataActionAddNew
    Case vbDataActionUpdate
    Case vbDataActionDelete
    Case vbDataActionFind
    Case vbDataActionBookmark
    Case vbDataActionClose
  End Select
  Screen.MousePointer = vbHourglass
End Sub

