VERSION 5.00
Object = "{00028C01-0000-0000-0000-000000000046}#1.0#0"; "DBGRID32.OCX"
Begin VB.Form frmTabUtilisateur2 
   Caption         =   "sce.utilisateur2"
   ClientHeight    =   4245
   ClientLeft      =   1110
   ClientTop       =   345
   ClientWidth     =   5520
   LinkTopic       =   "Form2"
   ScaleHeight     =   4245
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
      TabIndex        =   1
      Top             =   3600
      Width           =   5520
      Begin VB.CommandButton cmdFermer 
         Caption         =   "&Fermer"
         Height          =   300
         Left            =   4505
         TabIndex        =   6
         Top             =   0
         Width           =   975
      End
      Begin VB.CommandButton cmdMettreàjour 
         Caption         =   "&Mettre à jour"
         Height          =   300
         Left            =   3409
         TabIndex        =   5
         Top             =   0
         Width           =   975
      End
      Begin VB.CommandButton cmdRafraîchir 
         Caption         =   "&Rafraîchir"
         Height          =   300
         Left            =   2313
         TabIndex        =   4
         Top             =   0
         Width           =   975
      End
      Begin VB.CommandButton cmdSupprimer 
         Caption         =   "&Supprimer"
         Height          =   300
         Left            =   1217
         TabIndex        =   3
         Top             =   0
         Width           =   975
      End
      Begin VB.CommandButton cmdAjouter 
         Caption         =   "&Ajouter"
         Height          =   300
         Left            =   121
         TabIndex        =   2
         Top             =   0
         Width           =   975
      End
   End
   Begin VB.Data datPrimaryRS 
      Align           =   2  'Align Bottom
      Caption         =   " "
      Connect         =   "ODBC;DSN=ercem;UID=sce;PWD=;Hostname=serveur;ServerID=Informix;DBname=/u/ercem;DBuser=;DBauth=;DBoptions=;"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   345
      Left            =   0
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   $"frmTabUtilisateur2.frx":0000
      Top             =   3900
      Width           =   5520
   End
   Begin MSDBGrid.DBGrid grdDataGrid 
      Align           =   1  'Align Top
      Bindings        =   "frmTabUtilisateur2.frx":00FA
      Height          =   3495
      Left            =   0
      OleObjectBlob   =   "frmTabUtilisateur2.frx":0254
      TabIndex        =   0
      Top             =   0
      Width           =   5520
   End
End
Attribute VB_Name = "frmTabUtilisateur2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTabUtilisateur2
' Grille générée par l'assistant feuille de données
' Contrôle Data, Données version tableau
' 3/12/1997 PV

Option Explicit


Private Sub cmdAjouter_Click()
  datPrimaryRS.Recordset.MoveLast
  grdDataGrid.SetFocus
  SendKeys "{down}"
End Sub

Private Sub cmdSupprimer_Click()
  With datPrimaryRS.Recordset
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
  datPrimaryRS.UpdateRecord
  datPrimaryRS.Recordset.Bookmark = datPrimaryRS.Recordset.LastModified
End Sub

Private Sub cmdFermer_Click()
  Screen.MousePointer = vbDefault
  Unload Me
End Sub

Private Sub datPrimaryRS_Error(DataErr As Integer, Response As Integer)
  'C'est l'emplacement où mettre le code de gestion d'erreur
  'Si vous voulez ignorer les erreurs, mettez la ligne qui suit en commentaire
  'Si vous souhaitez les intercepter, ajoutez du code ici pour les gérer
  MsgBox "Data error event hit err:" & Error$(DataErr)
  Response = 0  'Débarassez-vous de l'erreur
End Sub

Private Sub datPrimaryRS_Reposition()
  Screen.MousePointer = vbDefault
  On Error Resume Next
  'Ceci affichera la position de l'enregistrement en cours pour les jeux d'enregistrements et les feuilles de réponse dynamiques
  datPrimaryRS.Caption = "Record: " & (datPrimaryRS.Recordset.AbsolutePosition + 1)
End Sub

Private Sub datPrimaryRS_Validate(Action As Integer, Save As Integer)
  'Insérez ici le code de validation
  'Cet événement est appelé lorsque les actions suivantes se produisent
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
      Screen.MousePointer = vbDefault
  End Select
  Screen.MousePointer = vbHourglass
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Screen.MousePointer = vbDefault
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  'Ceci redimensionnera la grille lorsque la feuille sera redimensionnée
  grdDataGrid.Height = Me.ScaleHeight - datPrimaryRS.Height - picButtons.Height - 30
End Sub

