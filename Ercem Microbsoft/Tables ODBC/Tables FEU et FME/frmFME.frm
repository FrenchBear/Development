VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmFME 
   Caption         =   "FEU et FME"
   ClientHeight    =   6225
   ClientLeft      =   165
   ClientTop       =   165
   ClientWidth     =   9720
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmFME.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   415
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   648
   Tag             =   "Données"
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   3315
      Index           =   1
      Left            =   780
      TabIndex        =   19
      Top             =   1500
      Visible         =   0   'False
      Width           =   9435
      Begin FEUetFME.BDSélecteurTableau bdSélTab 
         Height          =   2040
         Left            =   0
         TabIndex        =   6
         TabStop         =   0   'False
         Top             =   1860
         Width           =   390
         _ExtentX        =   688
         _ExtentY        =   3598
      End
      Begin TrueOleDBGrid60.TDBGrid tdgDéfinitions 
         Height          =   2715
         Left            =   480
         OleObjectBlob   =   "frmFME.frx":014A
         TabIndex        =   7
         TabStop         =   0   'False
         Top             =   1860
         Width           =   8235
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "*fme_numfme"
         Height          =   315
         Index           =   3
         Left            =   1500
         TabIndex        =   1
         Tag             =   "N° de FME"
         Top             =   0
         Width           =   915
         _ExtentX        =   1614
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "fme_comment"
         Height          =   1035
         Index           =   8
         Left            =   1500
         TabIndex        =   5
         Tag             =   "Commentaire libre quelconque"
         Top             =   720
         Width           =   6720
         _ExtentX        =   11853
         _ExtentY        =   1826
         _Version        =   393216
         MultiLine       =   -1  'True
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "*fme_titre"
         Height          =   315
         Index           =   2
         Left            =   1500
         TabIndex        =   3
         Tag             =   "Titre de la FME"
         Top             =   360
         Width           =   6720
         _ExtentX        =   11853
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   65
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "FME :"
         Height          =   210
         Index           =   0
         Left            =   0
         TabIndex        =   0
         Top             =   60
         Width           =   510
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Titre :"
         Height          =   210
         Index           =   3
         Left            =   0
         TabIndex        =   2
         Top             =   420
         Width           =   555
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Commentaire :"
         Height          =   210
         Index           =   10
         Left            =   0
         TabIndex        =   4
         Top             =   780
         Width           =   1395
      End
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   2775
      Index           =   2
      Left            =   240
      TabIndex        =   18
      Top             =   4740
      Visible         =   0   'False
      Width           =   6855
      Begin MSWLess.WLText txtChamp 
         DataField       =   "fme_origine"
         Height          =   315
         Index           =   1
         Left            =   1500
         TabIndex        =   9
         Tag             =   "Origine de la modification"
         Top             =   0
         Width           =   2895
         _ExtentX        =   5106
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   30
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "fme_idmodif"
         Height          =   315
         Index           =   0
         Left            =   1500
         TabIndex        =   11
         Tag             =   "Origine de la modification"
         Top             =   360
         Width           =   3750
         _ExtentX        =   6615
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   14
         Left            =   1500
         TabIndex        =   15
         Tag             =   "Date+heure de dernière modification de l'information"
         Top             =   1080
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "fme_tscreation"
         Height          =   315
         Index           =   11
         Left            =   1500
         TabIndex        =   13
         Tag             =   "Date+heure de création"
         Top             =   720
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Origine :"
         Height          =   210
         Index           =   1
         Left            =   0
         TabIndex        =   8
         Top             =   60
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Origine modif :"
         Height          =   210
         Index           =   11
         Left            =   0
         TabIndex        =   10
         Top             =   420
         Width           =   1380
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   0
         TabIndex        =   14
         Top             =   1140
         Width           =   1155
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Créé le :"
         Height          =   210
         Index           =   8
         Left            =   0
         TabIndex        =   12
         Top             =   780
         Width           =   810
      End
   End
   Begin MSComctlLib.TabStrip tsTab 
      Height          =   435
      Left            =   1260
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   480
      Width           =   4455
      _ExtentX        =   7858
      _ExtentY        =   767
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   2
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Tête"
            Key             =   "Tête"
            Object.ToolTipText     =   "Informations générales sur la grille"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Traçabilité"
            Key             =   "Traçabilité"
            Object.ToolTipText     =   "Traçabilité relative à la grille"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   720
      Top             =   480
   End
   Begin FEUetFME.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   16
      Top             =   0
      Width           =   9720
      _ExtentX        =   17145
      _ExtentY        =   767
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "frmFME"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmFME
' Feuille de gestion des modalités d'envoi
' 27/03/2000 PV Version initiale reprise
' 20/08/2000 PV Version complète (nb fac + langue + options)
' 27/10/2000 PV Accès direct
' 13/02/2001 NC Pas de modifs possibles pour les FME<108
' 05/12/2001 FG Ajout filtrage saisie code langue
' 17/12/2001 FF Historique des opérationsn et Menu de commandes contextuel


Option Explicit

Private cFME As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private colColonnesDest As New Collection ' Colonnes de la table de détail (pour récupérer la description)
Private iMode As eModeÉdition             ' Mode du formulaire
Private bOpGénérale As Boolean

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private colhistorique As New Collection    ' Historique des modifications

Private Const sTable = "fme"

Private xaTab As XArrayDB                 ' Données du tableau
Private bTabModifié As Boolean            ' Optimisation de la gestion du tableau
Private bTabModifSimple As Boolean        ' Vrai tant qu'il n'y a ni ajout ni suppression d'items

Private iCurFrame As Integer              ' Cadre courant visible


Const sLibelléInexistant = "** INEXISTANT"


Const MAXCOL = 18

Const colN°CR = 0
Const colNomDest = 1
Const colAB = 2
Const colEH = 3
Const colBS = 4
Const colLI = 5
Const colFS = 6
Const colHU = 7
Const colCH = 8
Const colX = 9
Const colRecap = 10
Const colFac = 11
Const colLangue = 12
Const colOptions = 13
Const colComment = 14
Const colIdModif = 15
Const colTSCréation = 16
Const colTimestamp = 17
Const colIndex = 18


'=================================================================================
' Accès direct

Public Sub AfficheFME(ByVal n As Long)
  ' Si la feuille n'est pas disponible, on en ouvre une autre
  If iMode <> meEmpty And iMode <> meNavigate Then
    Dim F As New frmFME
    F.AfficheFME n
    Exit Sub
  End If
  
  Show  ' Sinon les BDCheck ne sont pas effacées par l'appel qui suit
  EffaceFormulaire
  BDActiveFormulaire colChamps, True
  iMode = meQuery
  colChamps("fme_numfme") = n
  ValidateQuery
End Sub


'=================================================================================
' Gestion des onglets

' Change le frame affiché
Private Sub Page(ByVal sPage)
  ' On ne change que l'onglet, ce code appelle automatiquement tsTab_Click
  Set tsTab.SelectedItem = tsTab.Tabs(sPage)
End Sub

Private Sub tsTab_Click()
  ' Utilise le mécanisme visible/invisible comme il est conseillé dans l'aide
  ' et contrairement à la doc qui prône l'usage du ZOrder…
  ' Avantage: (entre autres, voir l'aide) évite les conflits d'accélérateurs entre pages
  If tsTab.SelectedItem.Index = iCurFrame Then Exit Sub     ' Inutile de changer le cadre.
  ' Sinon, masque l'ancien cadre et affiche le nouveau.
  fraFeuille(tsTab.SelectedItem.Index).Visible = True
  If iCurFrame >= 0 Then fraFeuille(iCurFrame).Visible = False
  ' Affecte la nouvelle valeur à iCurFrame.
  iCurFrame = tsTab.SelectedItem.Index

  ' Accompagnement du focus
  ' Ça serait pas mal de mémoriser page par page le contrôle qui a le focus au moment
  ' du changement de focus, de façon à restaurer le focus sur ce contrôle
  ' mais il faut traiter le fait que c'est le contrôle tabstop qui prend le focus
  ' quand on clique dessus (pas sûr il me semble, c'est au 2ème clic qu'il prend le focus !!!)
  DoEvents
  Select Case tsTab.SelectedItem.Key
    Case "Tête": txtChamp(3).SetFocus
    Case "Traçabilité": txtChamp(0).SetFocus
    Case Else: Stop
  End Select
End Sub

Private Sub Form_Resize()
  If ScaleHeight < 250 Or ScaleWidth < 550 Then Exit Sub
  
  ' On retaille le tabstrip…
  tsTab.Move 2, 31, ScaleWidth - 4, ScaleHeight - 35
  
  ' Puis les frames contenant les contrôles
  Dim F As Frame
  For Each F In fraFeuille
    F.Move tsTab.ClientLeft + 2, tsTab.ClientTop + 6, tsTab.ClientWidth - 2, tsTab.ClientHeight - 4
  Next
  
  tdgDéfinitions.Width = tsTab.ClientWidth * 15 - 38 * 15
  tdgDéfinitions.Height = tsTab.ClientHeight * 15 - tdgDéfinitions.Top - 10 * 15
End Sub

' Changement d'onglet avec PgPrec/PgSuiv
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  ResetChienDeGarde
  If KeyCode = vbKeyPageUp Then
    If tsTab.SelectedItem.Index > 1 Then Page tsTab.SelectedItem.Index - 1
    KeyCode = 0
  ElseIf KeyCode = vbKeyPageDown Then
    If tsTab.SelectedItem.Index < tsTab.Tabs.Count Then Page tsTab.SelectedItem.Index + 1
    KeyCode = 0
  Else
    bdSél.KeyDown KeyCode
  End If
End Sub

' Menu de commandes contextuel pour chaque feuille

Private Sub fraFeuille_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 2 Then    ' Bouton droit
    PopupMenu MDIFEUetFME.mnuCommandes
  End If
End Sub

'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery

  Dim sWP As String
  Dim t As Control
  Dim bWPIntègreEtat As Boolean

  For Each t In colChamps
    If Not t.Locked And t.Text <> "" Then
      Dim sFinal As String, sMsg As String
      If Not bQueryToWP(t.DataField, t.Text, colColonnes(t.DataField).iType, sFinal, sMsg) Then
        MsgBox "Erreur dans la requête !" & vbCrLf & sMsg, vbExclamation, App.Title
        t.SetFocus
        Exit Sub
      End If
      If sWP <> "" Then sWP = sWP & " and "
      sWP = sWP & "(" & sFinal & ")"
      End If
  Next

  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If

  Dim cFMEQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from fme where " & sWP & " order by fme_numfme"

  cFMEQuery.OpenCurseur sQuery
  iErr = Err
  If iErr Then sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    BDActiveFormulaire colChamps, True
    SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
    Exit Sub
  End If


  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cFME Is Nothing Then cFME.CloseCurseur
  Set cFME = cFMEQuery
  sFinalWP = sWP

  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire

  If Not (cFME.EOF And cFME.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a été sélectionné"
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements

  bdSél.SetFocus
End Sub


' Vérifie que les champs contiennent des valeurs légales
' Le contrôle des NULL et des types a déjà été fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer

  bOkValeurs = False
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Dim iSérie As Long
  
  Assert iMode = meAdd

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  Dim cFMEAdd As New BDCurseur
  cFMEAdd.OpenCurseur "select * from fme where fme_numfme=0"
  cFMEAdd.AddNew
  
  cFMEAdd!fme_tscreation = BDTime                       ' Now + tOffsetNow
  colChamps("fme_tscreation") = cFMEAdd!fme_tscreation  ' Now + tOffsetNow

  If Not bPrépareEditAdd(cFMEAdd, colColonnes, colChamps) Then
    cFMEAdd.CloseCurseur
    Exit Sub
  End If
  cFMEAdd.CloseCurseur

  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  ' On lit le max, faute de pouvoir obtenir le serial réel…
  iSérie = BDCurseurExpress("select max(fme_numfme) from fme")
  
  If Not cFME Is Nothing Then cFME.CloseCurseur
  Set cFME = New BDCurseur

  sFinalWP = "fme_numfme=" & iSérie
  sQuery = "select * from fme where " & sFinalWP & " order by fme_numfme"
  cFME.OpenCurseur sQuery
  cFME.MoveFirst
  
  ' Historique
  Dim sMsgTrace As String
  Dim c As Control
  For Each c In Controls
    If DataFieldEx(c) <> "" Then
      ' On enregistre uniquement si les champs ne sont pas vides
      If ValeurContrôle(c) <> "" Then
        If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
        sMsgTrace = sMsgTrace & c.DataField & ":" & ValeurContrôle(c)
      End If
    End If
  Next
  JournalUnix sTable & " " & colChamps("fme_numfme"), "créé", sMsgTrace

  BDActiveFormulaire colChamps, False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True

  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate

  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  bdSél.EmpêcheMouvements

  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub


Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cFME Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cFME.Edit
  If Not bPrépareEditAdd(cFME, colColonnes, colChamps) Then Exit Sub

  ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a été changé
  If iMode = meChange Then
    Dim c As Control
    Dim sMsgTrace As String
    For Each c In Controls
   '  If c <> tdgDéfinitions Then
       If DataFieldEx(c) <> "" Then
         If colhistorique(c.DataField) <> ValeurContrôle(c) Then  ' Modifié !
           If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
            sMsgTrace = sMsgTrace & c.DataField & ":" & colhistorique(c.DataField) & "->" & ValeurContrôle(c)
         End If
        End If
    '  End If
    Next
    If sMsgTrace <> "" Then
       JournalUnix sTable & " " & colChamps("fme_numfme"), "changé", sMsgTrace
    End If
  End If
  
  BDActiveFormulaire colChamps, False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True

  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate

  bdSél.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



Private Sub ActionValidate()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  ActiveTimer mtStop

  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub




Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  ActiveTimer mtStop

  BDActiveFormulaire colChamps, False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True

  ' Réaffiche les données. En mode change, pas besoin de réafficher le tableau
  SynchroniseFormulaire Not (iMode = meChange)

  iMode = meEmpty
  If Not cFME Is Nothing Then
    If Not (cFME.EOF And cFME.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements

  SetMessage
  SetStatus

  bdSél.TabStop = True
  bdSél.SetFocus
End Sub


'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)

  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True

  bdSélTab.ButtonEnabled = False    ' Pas d'action tableau pendant une interrogation

  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, False
  BDActiveFormulaire colChamps, True

  Page "Tête"
  
  colChamps("fme_numfme").SetFocus
  bdSél.TabStop = False

  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cFME Is Nothing

  If cFME.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If

  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True

  bdSélTab.ButtonEnabled = False    ' Pas d'action tableau pendant un changement de tête

  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "fme_numfme", False
  ActiveChamp "timestamp", False

  Page "Tête"
  colChamps("fme_titre").SetFocus
  AutoSelect colChamps("fme_titre"), True
  bdSél.TabStop = False

  iMode = meChange
  
  ' On mémorise les valeurs avant le changement
  EffaceCollection colhistorique
  Dim c As Control
  For Each c In Controls
    'If c <> tdgDéfinitions Then
      If DataFieldEx(c) <> "" Then
      colhistorique.Add ValeurContrôle(c), c.DataField
      End If
    'End If
  Next

  SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)

  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True

  bdSélTab.ButtonEnabled = False    ' Pas d'action tableau pendant un ajout

  EffaceFormulaire
  Page "Tête"
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "fme_numfme", False
  ActiveChamp "timestamp", False
  
  colChamps("fme_titre").SetFocus
  bdSél.TabStop = False

  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cFME Is Nothing
  
  If cFME.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  SetStatus "Recherche d'établissement attachés à cette FME, patientez..."
  Dim iNb As Integer
  iNb = BDCurseurExpress("select count(*) from etablissement where etb_fme=" & colChamps("fme_numfme"))
  SetStatus
  If iNb > 0 Then
    MsgBox "Suppression impossible, il reste " & iNb & " établissement(s) rattaché(s) à cette FME.", vbExclamation, App.Title
    Exit Sub
  End If

  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  ' On efface les enregistrements de détail rattachés
  ' Synchrodelete est rempli par un trigger
  RunSQL "delete from fmedest where fmd_numfme=" & colChamps("fme_numfme")
  
  ' On garde la trace de la destruction
  Dim sMsgTrace As String
  JournalUnix sTable & " " & colChamps("fme_numfme"), "détruit", sMsgTrace
  
  On Error Resume Next
  cFME.Delete
  If Err Then
    AfficheErreurODBC "Échec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0

  cFME.MoveNext
  If cFME.EOF Then
    cFME.MovePrevious
    If cFME.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If

  bdSél.ActiveMouvements iMode = meNavigate
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cFME Is Nothing

  bdSél.ButtonEnabled("First") = cFME.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cFME.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cFME.EOF
  bdSél.ButtonEnabled("Last") = Not cFME.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate

  cFME.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cFME.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate

  cFME.MoveNext
  AjusteMouvements
  If cFME.EOF Then cFME.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate

  cFME.MovePrevious
  AjusteMouvements
  If cFME.BOF Then cFME.MoveFirst
  SynchroniseFormulaire
End Sub


'=================================================================================
' Actions du sélecteur

Private Sub bdSél_ActionAdd():      ActionAdd:      End Sub
Private Sub bdSél_ActionCancel():   ActionCancel:   End Sub
Private Sub bdSél_ActionChange():   ActionChange:   End Sub
Private Sub bdSél_ActionDelete():   ActionDelete:   End Sub
Private Sub bdSél_ActionFirst():    ActionFirst:    End Sub
Private Sub bdSél_ActionLast():     ActionLast:     End Sub
Private Sub bdSél_ActionNext():     ActionNext:     End Sub
Private Sub bdSél_ActionPrevious(): ActionPrevious: End Sub
Private Sub bdSél_ActionQuery():    ActionQuery:    End Sub
Private Sub bdSél_ActionValidate(): ActionValidate: End Sub


'=================================================================================
' Actions tableau

Public Sub ActionTabChange()
  Assert iMode = meNavigate
  Assert Not cFME Is Nothing

If colChamps("fme_numfme") > 107 Then
  BDActiveChamp tdgDéfinitions, True
  tdgDéfinitions.AllowAddNew = True
  tdgDéfinitions.AllowUpdate = True
  bdSél.ActiveMouvements False
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False

  bdSélTab.ButtonEnabled("Change") = False
  bdSélTab.ActiveValidation True
  bdSélTab.ButtonEnabled("InsertRow") = True
  bdSélTab.ButtonEnabled("DeleteRow") = True

  iMode = meChangeTab
  bTabModifié = False
  bTabModifSimple = True   ' Par défaut
  SélectionneCellule 1, 0
  tdgDéfinitions_RowColChange 0, 0  ' Affiche la ligne d'info
  tdgDéfinitions.SetFocus
Else
  MsgBox "Vous ne pouvez pas modifier les FME génériques !"
End If
End Sub


Private Sub ActionTabDeleteRow()
  Assert iMode = meChangeTab
  Assert Not cFME Is Nothing

  Dim fr As Integer, r As Integer
  If tdgDéfinitions.FirstRow = "" Then Exit Sub
  fr = tdgDéfinitions.FirstRow
  r = tdgDéfinitions.Row
  If fr + r <= xaTab.UpperBound(1) Then
    xaTab.DeleteRows fr + r
    tdgDéfinitions.ReBind
    tdgDéfinitions.FirstRow = fr
    tdgDéfinitions.Row = r
  End If
  bTabModifié = True
  bTabModifSimple = False
  
  tdgDéfinitions.SetFocus
End Sub


Private Sub ActionTabInsertRow()
  Assert iMode = meChangeTab
  Assert Not cFME Is Nothing

  Dim fr As Integer, r As Integer
  If tdgDéfinitions.FirstRow = "" Then
    fr = 1
  Else
    fr = tdgDéfinitions.FirstRow
  End If
  r = tdgDéfinitions.Row
  xaTab.InsertRows fr + r
  tdgDéfinitions.ReBind
  tdgDéfinitions.FirstRow = fr
  tdgDéfinitions.Row = r
  bTabModifié = True
  bTabModifSimple = False       ' A voir, jouable de laisser l'état courant inchangé
  
  tdgDéfinitions.SetFocus
End Sub



Private Function bContrôleColNum(iLig As Integer, iCol As Integer) As Boolean
  bContrôleColNum = False
  If xaTab(iLig, iCol) <> "" Then
    If Not IsNumeric(xaTab(iLig, iCol)) Then
      MsgBox "Le nombre d'exemplaires doit être vide ou compris entre 0 et 9.", vbExclamation, App.Title
      SélectionneCellule iLig, iCol
      Exit Function
    End If
  End If
  bContrôleColNum = True
End Function


Private Sub ActionTabValidate()
  Assert iMode = meChangeTab
  Assert Not cFME Is Nothing
  
  ' On valide les modifs de la ligne courante
  If tdgDéfinitions.DataChanged Then
    tdgDéfinitions.Update
    DoEvents
  End If
  
  If bTabModifié Then   ' Optimisation si pas de modif
    ' Contrôle général des données: destinataires inexistants
    Dim i As Integer, j As Integer
    Dim bLigneRemplie As Boolean
    For i = 1 To xaTab.UpperBound(1)
      bLigneRemplie = False
      For j = 0 To MAXCOL
        If xaTab(i, j) <> "" Then bLigneRemplie = True: Exit For
      Next
    
      If bLigneRemplie Then
        If xaTab(i, colN°CR) = "" Then
          MsgBox "Le destinataire est obligatoire, ou supprimez la ligne.", vbExclamation, App.Title
          SélectionneCellule i, colN°CR
          Exit Sub
        End If
        
        ' Au moins une colonne de données doit être remplie
        If xaTab(i, colAB) = "" And xaTab(i, colEH) = "" And xaTab(i, colBS) = "" And xaTab(i, colLI) = "" And xaTab(i, colFS) = "" And xaTab(i, colHU) = "" And xaTab(i, colCH) = "" And xaTab(i, colX) = "" And xaTab(i, colRecap) = "" And xaTab(i, colFac) = "" And xaTab(i, colOptions) = "" And xaTab(i, colComment) = "" And xaTab(i, colLangue) = "" Then
          MsgBox "Vous devez remplir un nombre d'exemplaires ou le commentaire avant de valider, ou supprimez ce destinataire.", vbExclamation, App.Title
          SélectionneCellule i, 0
          Exit Sub
        End If
        
        If xaTab(i, colX) = "" Then
          MsgBox "Le nombre d'exemplaires du dossier est obligatoire.", vbExclamation, App.Title
          SélectionneCellule i, colX
          Exit Sub
        End If
        
        ' Détection des items invalides
        If InStr(1, xaTab(i, colNomDest), sLibelléInexistant) > 0 Then
          MsgBox "Impossible d'enregistrer une grille avec un n°s de destinataire invalide.", vbExclamation, App.Title
          SélectionneCellule i, 0
          Exit Sub
        End If
        
        ' Valeurs numériques exclusivement
        If Not bContrôleColNum(i, colAB) Then Exit Sub
        If Not bContrôleColNum(i, colEH) Then Exit Sub
        If Not bContrôleColNum(i, colBS) Then Exit Sub
        If Not bContrôleColNum(i, colLI) Then Exit Sub
        If Not bContrôleColNum(i, colFS) Then Exit Sub
        If Not bContrôleColNum(i, colCH) Then Exit Sub
        If Not bContrôleColNum(i, colHU) Then Exit Sub
        If Not bContrôleColNum(i, colX) Then Exit Sub
        If Not bContrôleColNum(i, colRecap) Then Exit Sub
        If Not bContrôleColNum(i, colFac) Then Exit Sub
        
        If xaTab(i, colLangue) <> "" And (xaTab(i, colLangue) < "A" Or xaTab(i, colLangue) > "Z") Then
          MsgBox "Code langue incorrect - doit être de A à Z ou vide.", vbExclamation, App.Title
          SélectionneCellule i, colLangue
          Exit Sub
        End If
        
      End If      ' if bLigneRemplie
    Next


    ' Tests Ok, on peut mettre à jour la base de données
    SetStatus "Mise à jour de la base de données…"
    Screen.MousePointer = vbHourglass
    
    Dim cr As New BDCurseur
    If bTabModifSimple Then
      ' Mise à jour simplifiée
      For i = 1 To xaTab.UpperBound(1)
        If xaTab(i, colIndex) < 0 Then
          cr.OpenCurseur "select * from fmedest where fmd_numfme=" & sFormToSQL(colChamps("fme_numfme"), BDTypeINTEGER) & " and fmd_index=" & -xaTab(i, colIndex)
          cr.Edit
          
          cr!fmd_nbab = VN(xaTab(i, colAB))
          cr!fmd_nbeh = VN(xaTab(i, colEH))
          cr!fmd_nbbs = VN(xaTab(i, colBS))
          cr!fmd_nbli = VN(xaTab(i, colLI))
          cr!fmd_nbfs = VN(xaTab(i, colFS))
          cr!fmd_nbhu = VN(xaTab(i, colHU))
          cr!fmd_nbch = VN(xaTab(i, colCH))
          cr!fmd_nbxn = VN(xaTab(i, colX))
          cr!fmd_recap = VN(xaTab(i, colRecap))
          cr!fmd_nbfac = VN(xaTab(i, colFac))
          cr!fmd_langue = VN(xaTab(i, colLangue))
          cr!fmd_options = VN(xaTab(i, colOptions))
          cr!fmd_comment = VN(xaTab(i, colComment))
          cr!fmd_idmodif = sBDIdModif
          cr!TimeStamp = BDTime           ' Now + tOffsetNow
        
          cr.Update
          cr.CloseCurseur
        End If
      Next
    Else
      ' Mise à jour lourde
      Dim Index As Integer
      Dim iSerie As Long
      
      RunSQL "delete from fmedest where fmd_numfme=" & sFormToSQL(colChamps("fme_numfme"), BDTypeINTEGER)
      ' On place un enregistrement dans synchrodelete
      ' Enlevé le 26/3/1 PV: a priori double emploi avec le trigger
'      Dim cSD As New BDCurseur
'      cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
'      cSD.AddNew
'      cSD!sd_table = "fmedest"
'      cSD!sd_timestamp = Now + tOffsetNow - TimeSerial(0, 0, 1)
'      cSD!sd_wherepart = "fmd_numfme=" & sFormToSQL(colChamps("fme_numfme"), BDTypeINTEGER)
'      cSD.Update
'      cSD.CloseCurseur
      
      cr.OpenCurseur "select * from fmedest where fmd_numfme=0"
      Index = 1
      iSerie = 0
      Dim dt As Date
      dt = BDTime
      For i = 1 To xaTab.UpperBound(1)
        If xaTab(i, 0) <> "" Then
          cr.AddNew
          cr!fmd_numfme = colChamps("fme_numfme")
          cr!fmd_index = Index
          cr!fmd_numcr = xaTab(i, colN°CR)
          cr!fmd_nbab = VN(xaTab(i, colAB))
          cr!fmd_nbeh = VN(xaTab(i, colEH))
          cr!fmd_nbbs = VN(xaTab(i, colBS))
          cr!fmd_nbli = VN(xaTab(i, colLI))
          cr!fmd_nbfs = VN(xaTab(i, colFS))
          cr!fmd_nbhu = VN(xaTab(i, colHU))
          cr!fmd_nbch = VN(xaTab(i, colCH))
          cr!fmd_nbxn = VN(xaTab(i, colX))
          cr!fmd_recap = VN(xaTab(i, colRecap))
          cr!fmd_nbfac = VN(xaTab(i, colFac))
          cr!fmd_langue = VN(xaTab(i, colLangue))
          cr!fmd_options = VN(xaTab(i, colOptions))
          cr!fmd_comment = VN(xaTab(i, colComment))
          
          If xaTab(i, colIndex) < 0 Or xaTab(i, colIdModif) = "" Then     ' Modifié / Ajouté
            cr!fmd_idmodif = sBDIdModif
          Else
            cr!fmd_idmodif = xaTab(i, colIdModif)   ' On conserve le précédent
          End If
          
          If xaTab(i, colTSCréation) = "" Then      ' Ajouté
            cr!fmd_tscreation = dt       ' Now + tOffsetNow
          Else
            cr!fmd_tscreation = xaTab(i, colTSCréation)
          End If
          
          cr!TimeStamp = dt             ' Now + tOffsetNow  Puisqu'on a tout effacé avant
  
          Dim iErr As Long, sErr As String
          On Error Resume Next
          cr.Update
          iErr = Err.Number
          If iErr Then sErr = sAjusteMessageODBC(Error)
          On Error GoTo 0
          If iErr Then
            cr.CancelUpdate
            If InStr(1, sErr, "duplicate") <> 0 Then sErr = sErr & vbCrLf & vbCrLf & "Le type " & VN(xaTab(i, 0)) & "." & VN(xaTab(i, 1)) & "." & VN(xaTab(i, 2)) & "." & VN(xaTab(i, 3)) & "." & VN(xaTab(i, 4)) & " est utilisé dans une autre catégorie du jeu, et la création de doublon est interdite."
            MsgBox "Échec lors de l'écriture des données." & vbCrLf & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
          End If
          
          Index = Index + 1
        End If
      Next
      cr.CloseCurseur
      ' On purge les enregistrements ajoutés dans serialfmedoc pour la génération des n°s de série
      If iSerie > 0 Then RunSQL "delete from serialfmedoc where serialfmedoc<" & iSerie
    End If
    
    Screen.MousePointer = vbDefault
    SetStatus
  End If    ' if bTabModifié

  BDActiveChamp tdgDéfinitions, False
  tdgDéfinitions.AllowAddNew = False
  tdgDéfinitions.AllowUpdate = False
  bdSélTab.ButtonEnabled = False
  bdSélTab.ButtonEnabled("Change") = True

  bdSél.ActiveMouvements True
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.SetFocus

  If bTabModifié Then SynchroniseFormulaire     ' Réffiche la liste triée

  iMode = meNavigate
End Sub


Private Sub SélectionneCellule(i As Integer, c As Integer)
  On Error Resume Next
  tdgDéfinitions.Row = i - tdgDéfinitions.FirstRow
  If Err Then
    tdgDéfinitions.FirstRow = i
    tdgDéfinitions.Row = 0
  End If
  On Error GoTo 0
  tdgDéfinitions.col = c
  tdgDéfinitions.SetFocus
End Sub

Private Sub ActionTabCancel()
  Assert iMode = meChangeTab
  Assert Not cFME Is Nothing

  BDActiveChamp tdgDéfinitions, False
  tdgDéfinitions.AllowAddNew = False
  tdgDéfinitions.AllowUpdate = False
  bdSélTab.ButtonEnabled = False
  bdSélTab.ButtonEnabled("Change") = True

  bdSél.ActiveMouvements True
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.SetFocus

  If bTabModifié Or tdgDéfinitions.DataChanged Then SynchroniseFormulaire   ' Restore le tableau précédent

  iMode = meNavigate
End Sub



Private Sub tdgDéfinitions_AfterInsert()
  bTabModifié = True
  bTabModifSimple = False
End Sub


' Affichage du texte de l'item dès qu'on change de ligne en saisie dans le tableau
Private Sub tdgDéfinitions_AfterUpdate()
  bTabModifié = True
  If iMode = meChangeTab Then
    Dim fr As Integer, r As Integer
    If tdgDéfinitions.FirstRow = "" Then
      fr = 1
    Else
      fr = tdgDéfinitions.FirstRow
    End If
    If tdgDéfinitions.Row = -1 Then
      r = xaTab.UpperBound(1)
    Else
      r = fr + tdgDéfinitions.Row
    End If

    If xaTab(r, 0) = "" Then
      xaTab(r, 1) = ""
    Else
      xaTab(r, 1) = sGetNomCR(Val(xaTab(r, 0)))
    End If
    
    ' On marque la ligne pour les modifs rapides
    If xaTab(r, colIndex) > 0 Then xaTab(r, colIndex) = -xaTab(r, colIndex)
    
    ' ET on réaffiche
    tdgDéfinitions.RefetchRow r
  End If
End Sub


Private Function sGetNomCR(ByVal iCR As Integer)
  Dim s As String
  s = BDCurseurExpress("select cr_nom from centrereception where cr_numcr=" & iCR)
  If s = "" Then
    sGetNomCR = sLibelléInexistant
  Else
    sGetNomCR = s
  End If
End Function


'=================================================================================
' Actions du sélecteur tableau

Private Sub bdSélTab_ActionTabChange():     ActionTabChange:    End Sub
Private Sub bdSélTab_ActionTabDeleteRow():  ActionTabDeleteRow: End Sub
Private Sub bdSélTab_ActionTabInsertRow():  ActionTabInsertRow: End Sub
Private Sub bdSélTab_ActionTabValidate():   ActionTabValidate:  End Sub
Private Sub bdSélTab_ActionTabCancel():     ActionTabCancel:    End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_Keypress(KeyAscii As Integer)
  ResetChienDeGarde
  If KeyAscii = Asc("t") Or KeyAscii = Asc("T") Then
    If bdSélTab.ButtonEnabled("Change") Then
      KeyAscii = 0
      ActionTabChange
    End If
  Else
    If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
  End If
End Sub

Private Sub tdgDéfinitions_BeforeColUpdate(ByVal colIndex As Integer, OldValue As Variant, Cancel As Integer)
'  If tdgDéfinitions.Text = "" Then Exit Sub
'  If Not IsNumeric(tdgDéfinitions.Text) Then
'    MsgBox "Type incorrect (non numérique).", vbExclamation, App.Title
'    Cancel = True
'    Exit Sub
'  End If
'  If tdgDéfinitions.Text < 0 Or tdgDéfinitions.Text > 100000 Then
'    MsgBox "Type incorrect (<0 ou >100000).", vbExclamation, App.Title
'    Cancel = True
'    Exit Sub
'  End If
End Sub

Private Sub tdgDéfinitions_AfterColEdit(ByVal colIndex As Integer)
'  Dim fr As Integer, r As Integer
'  If tdgDéfinitions.FirstRow = "" Then
'    fr = 1
'  Else
'    fr = tdgDéfinitions.FirstRow
'  End If
'  r = fr + tdgDéfinitions.Row
'
'  Debug.Print "r=" & r
'  If xaTab(r, 2) = "" Then
'    xaTab(r, 2) = 3
'    tdgDéfinitions.RefetchRow r
'  End If
End Sub



Private Sub tdgDéfinitions_KeyDown(KeyCode As Integer, Shift As Integer)
  bdSélTab.KeyDown KeyCode, Shift
  If KeyCode = 13 Then KeyCode = 0
End Sub


Private Sub txtChamp_DblClick(Index As Integer)
  If iMode = meAdd And txtChamp(Index).DataField = "fme_numfme" Then
    ActiveChamp "fme_numfme", True
  End If
End Sub

' Filtrage des Entrée intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  If Not bExisteTable(sTable) Then
    MsgBox "La table '" & sTable & "' n'est pas présente dans la base de données courante, affichage impossible.", vbCritical, App.Title
    Unload Me
    Exit Sub
  End If
  
  ' On met les frames en tête de pile d'affichage, sinon certains sont derrière le tsTab
  Dim F As Frame
  For Each F In fraFeuille
    F.ZOrder 0
  Next

  Show
  iCurFrame = -1   ' Pour forcer le passage à la page 0
  Page "Tête"
  
  SetStatus "Chargement en cours, patientez…"
  If colColonnes.Count = 0 Then
    BDDécritTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  ' Chargement des combos
  ' nop
  
  ' Préparation de la grille
  With tdgDéfinitions
    .AllowRowSelect = False
    .AllowColSelect = False
    .AllowAddNew = False
    .AllowUpdate = False
    .AllowDelete = False
    .RecordSelectors = False
    .HighlightRowStyle.BackColor = RGB(180, 180, 255)
    .HighlightRowStyle.ForeColor = &H80000008
    .TabAction = 2    ' Grid navigation

    With .Columns(colN°CR)                ' Destinataire (n°)
      .Caption = "N°CR"
      .Width = 40 * 15
      .DataWidth = 4                      ' Limite actuelle: 9999 CR !
    End With
    
    With .Columns(colNomDest)             ' Nom du centre de réception
      .Caption = "Destinataire"
      .Width = 190 * 15
      .Locked = True
      .BackColor = RGB(220, 220, 220)
      .WrapText = True                    ' Impression sur plusieurs lignes
    End With
    
    With .Columns(colAB)                  ' Bactérios standard
      .Caption = "AB"
      .Width = 25 * 15
      .DataWidth = 1
    End With
    
    With .Columns(colEH)                  ' EH+Obs
      .Caption = "EH/Obs"
      .Width = 25 * 15
      .DataWidth = 1
    End With
    
    With .Columns(colBS)                  ' Bactérios spéciales
      .Caption = "BS"
      .Width = 25 * 15
      .DataWidth = 1
    End With
    
    With .Columns(colLI)                  ' Listeria
      .Caption = "Li"
      .Width = 25 * 15
      .DataWidth = 1
    End With
        
    With .Columns(colFS)                  ' Frottis de surface
      .Caption = "FS"
      .Width = 25 * 15
      .DataWidth = 1
    End With

    With .Columns(colHU)                  ' Huiles
      .Caption = "Hu"
      .Width = 25 * 15
      .DataWidth = 1
    End With
        
    With .Columns(colCH)                  ' Chimies
      .Caption = "Ch"
      .Width = 25 * 15
      .DataWidth = 1
    End With
        
    With .Columns(colX)                   ' xN
      .Caption = "x N"
      .Width = 25 * 15
      .DataWidth = 1
    End With
        
    With .Columns(colRecap)               ' Recap
      .Caption = "Re"
      .Width = 25 * 15
      .DataWidth = 1
    End With
    
    With .Columns(colFac)                 ' Factures
      .Caption = "Fa"
      .Width = 25 * 15
      .DataWidth = 1
    End With
        
    With .Columns(colLangue)              ' Langue d'édition
      .Caption = "Langue"
      .Width = 15 * 15
      .DataWidth = 1
    End With
        
    With .Columns(colOptions)             ' Options (char*5)
      .Caption = "Options"
      .Width = 55 * 15
      .DataWidth = 5
    End With
        
    With .Columns(colComment)             ' Commentaire
      .Caption = "Comment"
      .Width = 130 * 15
      .DataWidth = 65
    End With
    
    With .Columns(colIdModif)             ' idmodif
      .Caption = "IdModif"
      .Width = 150 * 15
      .Visible = False
    End With
    
    With .Columns(colTSCréation)          ' Timestamp création
      .Caption = "TS Création"
      .Width = 135 * 15
      .Visible = False
    End With
    
    With .Columns(colTimestamp)           ' Timestamp
      .Caption = "Timestamp"
      .Width = 135 * 15
      .Visible = False
    End With
    
    With .Columns(colIndex)                     ' Index interne
      .Caption = "Index"
      .Width = 75 * 15
      .Visible = False
    End With
    

'    ' Saisie restreinte à 1..4+(vide) pour le niveau
'    Dim v As New ValueItem
'    With .Columns(2).ValueItems
'      v.Value = "": .Add v
'      v.Value = 1: .Add v
'      v.Value = 2: .Add v
'      v.Value = 3: .Add v
'      v.Value = 4: .Add v
'      .Validate = True
'    End With

    Set xaTab = New XArrayDB
    .Array = xaTab
    EffaceTableau
  End With


  ' Formulaire en mode initial
  BDActiveFormulaire colChamps, False
  BDActiveChamp tdgDéfinitions, False
  Set cFME = Nothing
  bdSél.LectureSeule = bLectureSeule
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True

  bdSélTab.ButtonEnabled = False

  iMode = meEmpty

  bdSél.SetFocus

  SetMessage
  SetStatus
  sFinalWP = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meChangeTab Or iMode = meQuery Then
    MsgBox "Terminez l'opération en cours avant de fermer la fenêtre !", vbCritical, App.Title
    If Not bShiftPressed Then
      Cancel = True
      Exit Sub
    End If
  End If

  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cFME Is Nothing Then cFME.CloseCurseur
  MDIFEUetFME.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire(Optional bRéafficheTableau As Boolean = True)
  ActiveTimer mtStop
  If cFME Is Nothing Then
    EffaceFormulaire
  ElseIf cFME.BOF And cFME.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cFME.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cFME.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0

    bdSél.NumRec = cFME.AbsolutePosition
    
    ' On efface les champs qui seront affichés par le timer = le tableau
    If bRéafficheTableau Then
      ActiveTimer mtRapide              ' Mise à jour en arrière plan
      bdSélTab.ButtonEnabled = False    ' Aucune commande de tableau disponible
      EffaceTableau
    Else
      bdSélTab.ButtonEnabled("change") = True
    End If
  End If
  Exit Sub

pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cFME.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop

  Dim cV As New BDCurseur
  cV.OpenCurseur "select *,cr_nom" & _
                 "  from fmedest,outer centrereception" & _
                 "  where fmd_numfme=" & colChamps("fme_numfme") & _
                 "  and cr_numcr=fmd_numcr" & _
                 "  order by fmd_numcr"

  Dim iRec As Integer
  iRec = 1
  Do Until cV.EOF
    xaTab.InsertRows iRec
    xaTab(iRec, colN°CR) = cV!fmd_numcr
    xaTab(iRec, colNomDest) = cV!cr_nom
    xaTab(iRec, colAB) = cV!fmd_nbab
    xaTab(iRec, colEH) = cV!fmd_nbeh
    xaTab(iRec, colBS) = cV!fmd_nbbs
    xaTab(iRec, colLI) = cV!fmd_nbli
    xaTab(iRec, colFS) = cV!fmd_nbfs
    xaTab(iRec, colHU) = cV!fmd_nbhu
    xaTab(iRec, colCH) = cV!fmd_nbch
    xaTab(iRec, colX) = cV!fmd_nbxn
    xaTab(iRec, colRecap) = cV!fmd_recap
    xaTab(iRec, colFac) = cV!fmd_nbfac
    xaTab(iRec, colLangue) = cV!fmd_langue
    xaTab(iRec, colOptions) = cV!fmd_options
    xaTab(iRec, colComment) = cV!fmd_comment
    xaTab(iRec, colIdModif) = cV!fmd_idmodif
    xaTab(iRec, colTSCréation) = cV!fmd_tscreation
    xaTab(iRec, colTimestamp) = cV!TimeStamp
    xaTab(iRec, colIndex) = cV!fmd_index
    cV.MoveNext
    iRec = iRec + 1
  Loop
  cV.CloseCurseur
  tdgDéfinitions.Array = xaTab
  tdgDéfinitions.ReBind
  bdSélTab.ButtonEnabled("change") = True
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
'  txtJeu = ""
  bdSél.NumRec = ""
  EffaceTableau
End Sub

Private Sub EffaceTableau()
  xaTab.ReDim 1, 0, 0, MAXCOL
  tdgDéfinitions.ReBind
End Sub


' Activation du timer de mise à jour des champs satellites
Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop:    timSatellites.Enabled = False
    Case mtLent:    timSatellites.Interval = 1000:  timSatellites.Enabled = True
    Case mtRapide:  timSatellites.Interval = 250:   timSatellites.Enabled = True
  End Select
End Sub


Private Sub ActiveChamp(ByVal sChamp As String, bEnabled As Boolean)
  BDActiveChamp colChamps(sChamp), bEnabled
End Sub


'=================================================================================
' Ligne d'aide

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub bdSél_GotFocus()
  SetStatus
End Sub

Private Sub tdgDéfinitions_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
  If iMode = meChangeTab Or tdgDéfinitions Is ActiveControl Then
    If colColonnesDest.Count = 0 Then BDDécritTable "fmedest", colColonnesDest

    Select Case tdgDéfinitions.col
      Case colN°CR:       SetStatus colColonnesDest("fmd_numcr").sDescription
      Case colNomDest:    SetStatus "Nom du destinataire (centre de réception)"
      Case colAB:         SetStatus colColonnesDest("fmd_nbab").sDescription
      Case colEH:         SetStatus colColonnesDest("fmd_nbeh").sDescription
      Case colBS:         SetStatus colColonnesDest("fmd_nbbs").sDescription
      Case colLI:         SetStatus colColonnesDest("fmd_nbli").sDescription
      Case colFS:         SetStatus colColonnesDest("fmd_nbfs").sDescription
      Case colHU:         SetStatus colColonnesDest("fmd_nbhu").sDescription
      Case colCH:         SetStatus colColonnesDest("fmd_nbch").sDescription
      Case colX:          SetStatus colColonnesDest("fmd_nbxn").sDescription
      Case colRecap:      SetStatus colColonnesDest("fmd_recap").sDescription
      Case colFac:        SetStatus colColonnesDest("fmd_nbfac").sDescription
      Case colLangue:     SetStatus colColonnesDest("fmd_langue").sDescription
      Case colOptions:    SetStatus colColonnesDest("fmd_options").sDescription
      Case colComment:    SetStatus colColonnesDest("fmd_comment").sDescription
      Case colIdModif:    SetStatus colColonnesDest("fmd_idmodif").sDescription
      Case colTSCréation: SetStatus colColonnesDest("fmd_tscreation").sDescription
      Case colTimestamp:  SetStatus colColonnesDest("timestamp").sDescription
      Case colIndex:      SetStatus colColonnesDest("fmd_index").sDescription
      
      Case Else: SetStatus
    End Select
  End If
End Sub


'=================================================================================
' Accès au Web

Public Sub FenêtreWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=" & sTable
End Sub


'=================================================================================
' Copie des données dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours…"
  BDCopieSélection cFME, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub

Public Sub CopieTableau()
  gtCopieTableau tdgDéfinitions, xaTab
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  DoEtat True
End Sub

Public Sub Aperçu()
  DoEtat False
End Sub

Private Sub DoEtat(ByVal bImpression As Boolean)
  On Error GoTo pb
  
  Dim iChoix As Integer
  iChoix = frmMessageChoix.ChoixEtat("&Liste FME sélectionnées", "&Détail FME courante")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
  Exit Sub
  
pb:
  intlMessageErreurEtat
End Sub


Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Select Case iChoix
    Case 1:   ' Etat standard, liste des titres sélectionnés
      Dim sSQL As String
      sSQL = "select * from fme where " & sFinalWP & " order by fme_numfme"
      On Error Resume Next
      BDEtat sSQL, drFME, bImpression
  
    Case 2:   ' Détail, impression de la grille courante
      ' Impression sur fond blanc
      BDActiveChamp tdgDéfinitions, True
      
      With tdgDéfinitions.PrintInfo
        .PageHeader = "FME " & colChamps("fme_numfme") & ": " & colChamps("fme_titre")
        .PageFooter = Date & " " & Time & "\tPage \p"
        .RepeatColumnHeaders = True
        .PreviewCaption = "FME " & colChamps("fme_numfme")
        .VariableRowHeight = True
        .SettingsMarginTop = 500
        .SettingsMarginBottom = 500
        .SettingsMarginLeft = 500
        .SettingsMarginRight = 500
        If bImpression Then
          .PrintData
        Else
          .PrintPreview
        End If
      End With
    
      BDActiveChamp tdgDéfinitions, False
  End Select
End Sub

'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & "'"
  frmHistorique.AfficheHistorique sWP
End Sub


