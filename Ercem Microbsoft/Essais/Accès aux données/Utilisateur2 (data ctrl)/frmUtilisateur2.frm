VERSION 5.00
Begin VB.Form frmUtilisateur2 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "sce.utilisateur2"
   ClientHeight    =   6180
   ClientLeft      =   1095
   ClientTop       =   330
   ClientWidth     =   5550
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6180
   ScaleWidth      =   5550
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtNomUnitéErcem 
      BackColor       =   &H8000000F&
      Height          =   285
      Left            =   2820
      Locked          =   -1  'True
      TabIndex        =   41
      Top             =   1660
      Width           =   2595
   End
   Begin VB.TextBox txtNomUnité 
      BackColor       =   &H8000000F&
      Height          =   285
      Left            =   2820
      Locked          =   -1  'True
      TabIndex        =   40
      Top             =   1340
      Width           =   2595
   End
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
      Top             =   5535
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
      RecordSource    =   "select * from [utilisateur2]"
      Top             =   5835
      Width           =   5550
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_micro"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   16
      Left            =   2040
      Locked          =   -1  'True
      MaxLength       =   8
      TabIndex        =   33
      Top             =   5180
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_passwd"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   15
      Left            =   2040
      Locked          =   -1  'True
      MaxLength       =   15
      TabIndex        =   31
      Top             =   4860
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_sysbal"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   14
      Left            =   2040
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   29
      Top             =   4540
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_tel"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   13
      Left            =   2040
      Locked          =   -1  'True
      MaxLength       =   50
      TabIndex        =   27
      Top             =   4220
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_nomercem"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   12
      Left            =   2040
      Locked          =   -1  'True
      MaxLength       =   23
      TabIndex        =   25
      Top             =   3900
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_nivweb"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   11
      Left            =   2040
      Locked          =   -1  'True
      TabIndex        =   23
      Top             =   3580
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_titre"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   10
      Left            =   2040
      Locked          =   -1  'True
      MaxLength       =   60
      TabIndex        =   21
      Top             =   3260
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "timestamp"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   9
      Left            =   2040
      Locked          =   -1  'True
      TabIndex        =   19
      Top             =   2940
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_niveau"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   8
      Left            =   2040
      Locked          =   -1  'True
      TabIndex        =   17
      Top             =   2620
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_systemes"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   7
      Left            =   2040
      Locked          =   -1  'True
      MaxLength       =   15
      TabIndex        =   15
      Top             =   2300
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_datenaiss"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   6
      Left            =   2040
      Locked          =   -1  'True
      TabIndex        =   13
      Top             =   1980
      Width           =   1935
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_uniteercem"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   5
      Left            =   2040
      Locked          =   -1  'True
      TabIndex        =   11
      Top             =   1660
      Width           =   675
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_unite"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   4
      Left            =   2040
      Locked          =   -1  'True
      TabIndex        =   9
      Top             =   1340
      Width           =   675
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_lettres"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   3
      Left            =   2040
      Locked          =   -1  'True
      MaxLength       =   20
      TabIndex        =   7
      Top             =   1020
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_bal"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   2
      Left            =   2040
      Locked          =   -1  'True
      MaxLength       =   10
      TabIndex        =   5
      Top             =   700
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_nom"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   1
      Left            =   2040
      Locked          =   -1  'True
      MaxLength       =   30
      TabIndex        =   3
      Top             =   380
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      BackColor       =   &H8000000F&
      DataField       =   "uti_numuti"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   0
      Left            =   2040
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   60
      Width           =   1935
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
Attribute VB_Name = "frmUtilisateur2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub ANSI(t As TextBox)
  Dim s As String
  s = t
  Dim p As Integer
  Dim bModif As Boolean
  bModif = False
  Do
    p = InStr(s, Chr(130))
    If p = 0 Then Exit Do
    Mid(s, p, 1) = "é"
    bModif = True
  Loop
  If bModif Then t = s
End Sub


Private Sub cmdAjouter_Click()
  datPrimaryRS.Recordset.AddNew
  Dim t As TextBox
  For Each t In txtFields
    If t.Index > 0 Then
      t.Locked = False
      t.BackColor = &H80000005
    End If
  Next
  txtFields(0) = 1 + iGetMaxUti
  txtFields(1).SetFocus
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
  
  txtNomUnité = sUnité(txtFields(4))
  txtNomUnitéErcem = sUnité(txtFields(5))
  
  ANSI txtFields(10)
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

