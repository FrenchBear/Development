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
   Tag             =   "Donn�es"
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   3315
      Index           =   1
      Left            =   780
      TabIndex        =   19
      Top             =   1500
      Visible         =   0   'False
      Width           =   9435
      Begin FEUetFME.BDS�lecteurTableau bdS�lTab 
         Height          =   2040
         Left            =   0
         TabIndex        =   6
         TabStop         =   0   'False
         Top             =   1860
         Width           =   390
         _ExtentX        =   688
         _ExtentY        =   3598
      End
      Begin TrueOleDBGrid60.TDBGrid tdgD�finitions 
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
         Tag             =   "N� de FME"
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
         Tag             =   "Date+heure de derni�re modification de l'information"
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
         Tag             =   "Date+heure de cr�ation"
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
         Caption         =   "Cr�� le :"
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
            Caption         =   "T�te"
            Key             =   "T�te"
            Object.ToolTipText     =   "Informations g�n�rales sur la grille"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Tra�abilit�"
            Key             =   "Tra�abilit�"
            Object.ToolTipText     =   "Tra�abilit� relative � la grille"
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
   Begin FEUetFME.BDS�lecteur bdS�l 
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
' Feuille de gestion des modalit�s d'envoi
' 27/03/2000 PV Version initiale reprise
' 20/08/2000 PV Version compl�te (nb fac + langue + options)
' 27/10/2000 PV Acc�s direct
' 13/02/2001 NC Pas de modifs possibles pour les FME<108
' 05/12/2001 FG Ajout filtrage saisie code langue
' 17/12/2001 FF Historique des op�rationsn et Menu de commandes contextuel


Option Explicit

Private cFME As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private colColonnesDest As New Collection ' Colonnes de la table de d�tail (pour r�cup�rer la description)
Private iMode As eMode�dition             ' Mode du formulaire
Private bOpG�n�rale As Boolean

Private sFinalWP As String                ' Where-part de la requ�te SQL courante
Private sQuery As String                  ' Query de la s�lection en cours

Private colhistorique As New Collection    ' Historique des modifications

Private Const sTable = "fme"

Private xaTab As XArrayDB                 ' Donn�es du tableau
Private bTabModifi� As Boolean            ' Optimisation de la gestion du tableau
Private bTabModifSimple As Boolean        ' Vrai tant qu'il n'y a ni ajout ni suppression d'items

Private iCurFrame As Integer              ' Cadre courant visible


Const sLibell�Inexistant = "** INEXISTANT"


Const MAXCOL = 18

Const colN�CR = 0
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
Const colTSCr�ation = 16
Const colTimestamp = 17
Const colIndex = 18


'=================================================================================
' Acc�s direct

Public Sub AfficheFME(ByVal n As Long)
  ' Si la feuille n'est pas disponible, on en ouvre une autre
  If iMode <> meEmpty And iMode <> meNavigate Then
    Dim F As New frmFME
    F.AfficheFME n
    Exit Sub
  End If
  
  Show  ' Sinon les BDCheck ne sont pas effac�es par l'appel qui suit
  EffaceFormulaire
  BDActiveFormulaire colChamps, True
  iMode = meQuery
  colChamps("fme_numfme") = n
  ValidateQuery
End Sub


'=================================================================================
' Gestion des onglets

' Change le frame affich�
Private Sub Page(ByVal sPage)
  ' On ne change que l'onglet, ce code appelle automatiquement tsTab_Click
  Set tsTab.SelectedItem = tsTab.Tabs(sPage)
End Sub

Private Sub tsTab_Click()
  ' Utilise le m�canisme visible/invisible comme il est conseill� dans l'aide
  ' et contrairement � la doc qui pr�ne l'usage du ZOrder�
  ' Avantage: (entre autres, voir l'aide) �vite les conflits d'acc�l�rateurs entre pages
  If tsTab.SelectedItem.Index = iCurFrame Then Exit Sub     ' Inutile de changer le cadre.
  ' Sinon, masque l'ancien cadre et affiche le nouveau.
  fraFeuille(tsTab.SelectedItem.Index).Visible = True
  If iCurFrame >= 0 Then fraFeuille(iCurFrame).Visible = False
  ' Affecte la nouvelle valeur � iCurFrame.
  iCurFrame = tsTab.SelectedItem.Index

  ' Accompagnement du focus
  ' �a serait pas mal de m�moriser page par page le contr�le qui a le focus au moment
  ' du changement de focus, de fa�on � restaurer le focus sur ce contr�le
  ' mais il faut traiter le fait que c'est le contr�le tabstop qui prend le focus
  ' quand on clique dessus (pas s�r il me semble, c'est au 2�me clic qu'il prend le focus !!!)
  DoEvents
  Select Case tsTab.SelectedItem.Key
    Case "T�te": txtChamp(3).SetFocus
    Case "Tra�abilit�": txtChamp(0).SetFocus
    Case Else: Stop
  End Select
End Sub

Private Sub Form_Resize()
  If ScaleHeight < 250 Or ScaleWidth < 550 Then Exit Sub
  
  ' On retaille le tabstrip�
  tsTab.Move 2, 31, ScaleWidth - 4, ScaleHeight - 35
  
  ' Puis les frames contenant les contr�les
  Dim F As Frame
  For Each F In fraFeuille
    F.Move tsTab.ClientLeft + 2, tsTab.ClientTop + 6, tsTab.ClientWidth - 2, tsTab.ClientHeight - 4
  Next
  
  tdgD�finitions.Width = tsTab.ClientWidth * 15 - 38 * 15
  tdgD�finitions.Height = tsTab.ClientHeight * 15 - tdgD�finitions.Top - 10 * 15
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
    bdS�l.KeyDown KeyCode
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
  Dim bWPInt�greEtat As Boolean

  For Each t In colChamps
    If Not t.Locked And t.Text <> "" Then
      Dim sFinal As String, sMsg As String
      If Not bQueryToWP(t.DataField, t.Text, colColonnes(t.DataField).iType, sFinal, sMsg) Then
        MsgBox "Erreur dans la requ�te !" & vbCrLf & sMsg, vbExclamation, App.Title
        t.SetFocus
        Exit Sub
      End If
      If sWP <> "" Then sWP = sWP & " and "
      sWP = sWP & "(" & sFinal & ")"
      End If
  Next

  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If

  Dim cFMEQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from fme where " & sWP & " order by fme_numfme"

  cFMEQuery.OpenCurseur sQuery
  iErr = Err
  If iErr Then sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "�chec lors de la requ�te" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    BDActiveFormulaire colChamps, True
    SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
    Exit Sub
  End If


  ' Tout est Ok
  ' Fermeture �ventuelle du curseur en cours
  If Not cFME Is Nothing Then cFME.CloseCurseur
  Set cFME = cFMEQuery
  sFinalWP = sWP

  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire

  If Not (cFME.EOF And cFME.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a �t� s�lectionn�"
  End If
  bdS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements

  bdS�l.SetFocus
End Sub


' V�rifie que les champs contiennent des valeurs l�gales
' Le contr�le des NULL et des types a d�j� �t� fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer

  bOkValeurs = False
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Dim iS�rie As Long
  
  Assert iMode = meAdd

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  Dim cFMEAdd As New BDCurseur
  cFMEAdd.OpenCurseur "select * from fme where fme_numfme=0"
  cFMEAdd.AddNew
  
  cFMEAdd!fme_tscreation = BDTime                       ' Now + tOffsetNow
  colChamps("fme_tscreation") = cFMEAdd!fme_tscreation  ' Now + tOffsetNow

  If Not bPr�pareEditAdd(cFMEAdd, colColonnes, colChamps) Then
    cFMEAdd.CloseCurseur
    Exit Sub
  End If
  cFMEAdd.CloseCurseur

  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  ' On lit le max, faute de pouvoir obtenir le serial r�el�
  iS�rie = BDCurseurExpress("select max(fme_numfme) from fme")
  
  If Not cFME Is Nothing Then cFME.CloseCurseur
  Set cFME = New BDCurseur

  sFinalWP = "fme_numfme=" & iS�rie
  sQuery = "select * from fme where " & sFinalWP & " order by fme_numfme"
  cFME.OpenCurseur sQuery
  cFME.MoveFirst
  
  ' Historique
  Dim sMsgTrace As String
  Dim c As Control
  For Each c In Controls
    If DataFieldEx(c) <> "" Then
      ' On enregistre uniquement si les champs ne sont pas vides
      If ValeurContr�le(c) <> "" Then
        If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
        sMsgTrace = sMsgTrace & c.DataField & ":" & ValeurContr�le(c)
      End If
    End If
  Next
  JournalUnix sTable & " " & colChamps("fme_numfme"), "cr��", sMsgTrace

  BDActiveFormulaire colChamps, False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True

  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate

  bdS�l.ActiveMouvements True
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  bdS�l.Emp�cheMouvements

  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub


Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cFME Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cFME.Edit
  If Not bPr�pareEditAdd(cFME, colColonnes, colChamps) Then Exit Sub

  ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a �t� chang�
  If iMode = meChange Then
    Dim c As Control
    Dim sMsgTrace As String
    For Each c In Controls
   '  If c <> tdgD�finitions Then
       If DataFieldEx(c) <> "" Then
         If colhistorique(c.DataField) <> ValeurContr�le(c) Then  ' Modifi� !
           If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
            sMsgTrace = sMsgTrace & c.DataField & ":" & colhistorique(c.DataField) & "->" & ValeurContr�le(c)
         End If
        End If
    '  End If
    Next
    If sMsgTrace <> "" Then
       JournalUnix sTable & " " & colChamps("fme_numfme"), "chang�", sMsgTrace
    End If
  End If
  
  BDActiveFormulaire colChamps, False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True

  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate

  bdS�l.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
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
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True

  ' R�affiche les donn�es. En mode change, pas besoin de r�afficher le tableau
  SynchroniseFormulaire Not (iMode = meChange)

  iMode = meEmpty
  If Not cFME Is Nothing Then
    If Not (cFME.EOF And cFME.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements

  SetMessage
  SetStatus

  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub


'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)

  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True

  bdS�lTab.ButtonEnabled = False    ' Pas d'action tableau pendant une interrogation

  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, False
  BDActiveFormulaire colChamps, True

  Page "T�te"
  
  colChamps("fme_numfme").SetFocus
  bdS�l.TabStop = False

  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cFME Is Nothing

  If cFME.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If

  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True

  bdS�lTab.ButtonEnabled = False    ' Pas d'action tableau pendant un changement de t�te

  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "fme_numfme", False
  ActiveChamp "timestamp", False

  Page "T�te"
  colChamps("fme_titre").SetFocus
  AutoSelect colChamps("fme_titre"), True
  bdS�l.TabStop = False

  iMode = meChange
  
  ' On m�morise les valeurs avant le changement
  EffaceCollection colhistorique
  Dim c As Control
  For Each c In Controls
    'If c <> tdgD�finitions Then
      If DataFieldEx(c) <> "" Then
      colhistorique.Add ValeurContr�le(c), c.DataField
      End If
    'End If
  Next

  SetMessage "Modifiez les valeurs affich�es, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)

  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True

  bdS�lTab.ButtonEnabled = False    ' Pas d'action tableau pendant un ajout

  EffaceFormulaire
  Page "T�te"
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "fme_numfme", False
  ActiveChamp "timestamp", False
  
  colChamps("fme_titre").SetFocus
  bdS�l.TabStop = False

  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cFME Is Nothing
  
  If cFME.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  SetStatus "Recherche d'�tablissement attach�s � cette FME, patientez..."
  Dim iNb As Integer
  iNb = BDCurseurExpress("select count(*) from etablissement where etb_fme=" & colChamps("fme_numfme"))
  SetStatus
  If iNb > 0 Then
    MsgBox "Suppression impossible, il reste " & iNb & " �tablissement(s) rattach�(s) � cette FME.", vbExclamation, App.Title
    Exit Sub
  End If

  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est d�finitive." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  ' On efface les enregistrements de d�tail rattach�s
  ' Synchrodelete est rempli par un trigger
  RunSQL "delete from fmedest where fmd_numfme=" & colChamps("fme_numfme")
  
  ' On garde la trace de la destruction
  Dim sMsgTrace As String
  JournalUnix sTable & " " & colChamps("fme_numfme"), "d�truit", sMsgTrace
  
  On Error Resume Next
  cFME.Delete
  If Err Then
    AfficheErreurODBC "�chec de la destruction de l'enregistrement"
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

  bdS�l.ActiveMouvements iMode = meNavigate
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cFME Is Nothing

  bdS�l.ButtonEnabled("First") = cFME.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cFME.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cFME.EOF
  bdS�l.ButtonEnabled("Last") = Not cFME.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate

  cFME.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
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
' Actions du s�lecteur

Private Sub bdS�l_ActionAdd():      ActionAdd:      End Sub
Private Sub bdS�l_ActionCancel():   ActionCancel:   End Sub
Private Sub bdS�l_ActionChange():   ActionChange:   End Sub
Private Sub bdS�l_ActionDelete():   ActionDelete:   End Sub
Private Sub bdS�l_ActionFirst():    ActionFirst:    End Sub
Private Sub bdS�l_ActionLast():     ActionLast:     End Sub
Private Sub bdS�l_ActionNext():     ActionNext:     End Sub
Private Sub bdS�l_ActionPrevious(): ActionPrevious: End Sub
Private Sub bdS�l_ActionQuery():    ActionQuery:    End Sub
Private Sub bdS�l_ActionValidate(): ActionValidate: End Sub


'=================================================================================
' Actions tableau

Public Sub ActionTabChange()
  Assert iMode = meNavigate
  Assert Not cFME Is Nothing

If colChamps("fme_numfme") > 107 Then
  BDActiveChamp tdgD�finitions, True
  tdgD�finitions.AllowAddNew = True
  tdgD�finitions.AllowUpdate = True
  bdS�l.ActiveMouvements False
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False

  bdS�lTab.ButtonEnabled("Change") = False
  bdS�lTab.ActiveValidation True
  bdS�lTab.ButtonEnabled("InsertRow") = True
  bdS�lTab.ButtonEnabled("DeleteRow") = True

  iMode = meChangeTab
  bTabModifi� = False
  bTabModifSimple = True   ' Par d�faut
  S�lectionneCellule 1, 0
  tdgD�finitions_RowColChange 0, 0  ' Affiche la ligne d'info
  tdgD�finitions.SetFocus
Else
  MsgBox "Vous ne pouvez pas modifier les FME g�n�riques !"
End If
End Sub


Private Sub ActionTabDeleteRow()
  Assert iMode = meChangeTab
  Assert Not cFME Is Nothing

  Dim fr As Integer, r As Integer
  If tdgD�finitions.FirstRow = "" Then Exit Sub
  fr = tdgD�finitions.FirstRow
  r = tdgD�finitions.Row
  If fr + r <= xaTab.UpperBound(1) Then
    xaTab.DeleteRows fr + r
    tdgD�finitions.ReBind
    tdgD�finitions.FirstRow = fr
    tdgD�finitions.Row = r
  End If
  bTabModifi� = True
  bTabModifSimple = False
  
  tdgD�finitions.SetFocus
End Sub


Private Sub ActionTabInsertRow()
  Assert iMode = meChangeTab
  Assert Not cFME Is Nothing

  Dim fr As Integer, r As Integer
  If tdgD�finitions.FirstRow = "" Then
    fr = 1
  Else
    fr = tdgD�finitions.FirstRow
  End If
  r = tdgD�finitions.Row
  xaTab.InsertRows fr + r
  tdgD�finitions.ReBind
  tdgD�finitions.FirstRow = fr
  tdgD�finitions.Row = r
  bTabModifi� = True
  bTabModifSimple = False       ' A voir, jouable de laisser l'�tat courant inchang�
  
  tdgD�finitions.SetFocus
End Sub



Private Function bContr�leColNum(iLig As Integer, iCol As Integer) As Boolean
  bContr�leColNum = False
  If xaTab(iLig, iCol) <> "" Then
    If Not IsNumeric(xaTab(iLig, iCol)) Then
      MsgBox "Le nombre d'exemplaires doit �tre vide ou compris entre 0 et 9.", vbExclamation, App.Title
      S�lectionneCellule iLig, iCol
      Exit Function
    End If
  End If
  bContr�leColNum = True
End Function


Private Sub ActionTabValidate()
  Assert iMode = meChangeTab
  Assert Not cFME Is Nothing
  
  ' On valide les modifs de la ligne courante
  If tdgD�finitions.DataChanged Then
    tdgD�finitions.Update
    DoEvents
  End If
  
  If bTabModifi� Then   ' Optimisation si pas de modif
    ' Contr�le g�n�ral des donn�es: destinataires inexistants
    Dim i As Integer, j As Integer
    Dim bLigneRemplie As Boolean
    For i = 1 To xaTab.UpperBound(1)
      bLigneRemplie = False
      For j = 0 To MAXCOL
        If xaTab(i, j) <> "" Then bLigneRemplie = True: Exit For
      Next
    
      If bLigneRemplie Then
        If xaTab(i, colN�CR) = "" Then
          MsgBox "Le destinataire est obligatoire, ou supprimez la ligne.", vbExclamation, App.Title
          S�lectionneCellule i, colN�CR
          Exit Sub
        End If
        
        ' Au moins une colonne de donn�es doit �tre remplie
        If xaTab(i, colAB) = "" And xaTab(i, colEH) = "" And xaTab(i, colBS) = "" And xaTab(i, colLI) = "" And xaTab(i, colFS) = "" And xaTab(i, colHU) = "" And xaTab(i, colCH) = "" And xaTab(i, colX) = "" And xaTab(i, colRecap) = "" And xaTab(i, colFac) = "" And xaTab(i, colOptions) = "" And xaTab(i, colComment) = "" And xaTab(i, colLangue) = "" Then
          MsgBox "Vous devez remplir un nombre d'exemplaires ou le commentaire avant de valider, ou supprimez ce destinataire.", vbExclamation, App.Title
          S�lectionneCellule i, 0
          Exit Sub
        End If
        
        If xaTab(i, colX) = "" Then
          MsgBox "Le nombre d'exemplaires du dossier est obligatoire.", vbExclamation, App.Title
          S�lectionneCellule i, colX
          Exit Sub
        End If
        
        ' D�tection des items invalides
        If InStr(1, xaTab(i, colNomDest), sLibell�Inexistant) > 0 Then
          MsgBox "Impossible d'enregistrer une grille avec un n�s de destinataire invalide.", vbExclamation, App.Title
          S�lectionneCellule i, 0
          Exit Sub
        End If
        
        ' Valeurs num�riques exclusivement
        If Not bContr�leColNum(i, colAB) Then Exit Sub
        If Not bContr�leColNum(i, colEH) Then Exit Sub
        If Not bContr�leColNum(i, colBS) Then Exit Sub
        If Not bContr�leColNum(i, colLI) Then Exit Sub
        If Not bContr�leColNum(i, colFS) Then Exit Sub
        If Not bContr�leColNum(i, colCH) Then Exit Sub
        If Not bContr�leColNum(i, colHU) Then Exit Sub
        If Not bContr�leColNum(i, colX) Then Exit Sub
        If Not bContr�leColNum(i, colRecap) Then Exit Sub
        If Not bContr�leColNum(i, colFac) Then Exit Sub
        
        If xaTab(i, colLangue) <> "" And (xaTab(i, colLangue) < "A" Or xaTab(i, colLangue) > "Z") Then
          MsgBox "Code langue incorrect - doit �tre de A � Z ou vide.", vbExclamation, App.Title
          S�lectionneCellule i, colLangue
          Exit Sub
        End If
        
      End If      ' if bLigneRemplie
    Next


    ' Tests Ok, on peut mettre � jour la base de donn�es
    SetStatus "Mise � jour de la base de donn�es�"
    Screen.MousePointer = vbHourglass
    
    Dim cr As New BDCurseur
    If bTabModifSimple Then
      ' Mise � jour simplifi�e
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
      ' Mise � jour lourde
      Dim Index As Integer
      Dim iSerie As Long
      
      RunSQL "delete from fmedest where fmd_numfme=" & sFormToSQL(colChamps("fme_numfme"), BDTypeINTEGER)
      ' On place un enregistrement dans synchrodelete
      ' Enlev� le 26/3/1 PV: a priori double emploi avec le trigger
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
          cr!fmd_numcr = xaTab(i, colN�CR)
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
          
          If xaTab(i, colIndex) < 0 Or xaTab(i, colIdModif) = "" Then     ' Modifi� / Ajout�
            cr!fmd_idmodif = sBDIdModif
          Else
            cr!fmd_idmodif = xaTab(i, colIdModif)   ' On conserve le pr�c�dent
          End If
          
          If xaTab(i, colTSCr�ation) = "" Then      ' Ajout�
            cr!fmd_tscreation = dt       ' Now + tOffsetNow
          Else
            cr!fmd_tscreation = xaTab(i, colTSCr�ation)
          End If
          
          cr!TimeStamp = dt             ' Now + tOffsetNow  Puisqu'on a tout effac� avant
  
          Dim iErr As Long, sErr As String
          On Error Resume Next
          cr.Update
          iErr = Err.Number
          If iErr Then sErr = sAjusteMessageODBC(Error)
          On Error GoTo 0
          If iErr Then
            cr.CancelUpdate
            If InStr(1, sErr, "duplicate") <> 0 Then sErr = sErr & vbCrLf & vbCrLf & "Le type " & VN(xaTab(i, 0)) & "." & VN(xaTab(i, 1)) & "." & VN(xaTab(i, 2)) & "." & VN(xaTab(i, 3)) & "." & VN(xaTab(i, 4)) & " est utilis� dans une autre cat�gorie du jeu, et la cr�ation de doublon est interdite."
            MsgBox "�chec lors de l'�criture des donn�es." & vbCrLf & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
          End If
          
          Index = Index + 1
        End If
      Next
      cr.CloseCurseur
      ' On purge les enregistrements ajout�s dans serialfmedoc pour la g�n�ration des n�s de s�rie
      If iSerie > 0 Then RunSQL "delete from serialfmedoc where serialfmedoc<" & iSerie
    End If
    
    Screen.MousePointer = vbDefault
    SetStatus
  End If    ' if bTabModifi�

  BDActiveChamp tdgD�finitions, False
  tdgD�finitions.AllowAddNew = False
  tdgD�finitions.AllowUpdate = False
  bdS�lTab.ButtonEnabled = False
  bdS�lTab.ButtonEnabled("Change") = True

  bdS�l.ActiveMouvements True
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.SetFocus

  If bTabModifi� Then SynchroniseFormulaire     ' R�ffiche la liste tri�e

  iMode = meNavigate
End Sub


Private Sub S�lectionneCellule(i As Integer, c As Integer)
  On Error Resume Next
  tdgD�finitions.Row = i - tdgD�finitions.FirstRow
  If Err Then
    tdgD�finitions.FirstRow = i
    tdgD�finitions.Row = 0
  End If
  On Error GoTo 0
  tdgD�finitions.col = c
  tdgD�finitions.SetFocus
End Sub

Private Sub ActionTabCancel()
  Assert iMode = meChangeTab
  Assert Not cFME Is Nothing

  BDActiveChamp tdgD�finitions, False
  tdgD�finitions.AllowAddNew = False
  tdgD�finitions.AllowUpdate = False
  bdS�lTab.ButtonEnabled = False
  bdS�lTab.ButtonEnabled("Change") = True

  bdS�l.ActiveMouvements True
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.SetFocus

  If bTabModifi� Or tdgD�finitions.DataChanged Then SynchroniseFormulaire   ' Restore le tableau pr�c�dent

  iMode = meNavigate
End Sub



Private Sub tdgD�finitions_AfterInsert()
  bTabModifi� = True
  bTabModifSimple = False
End Sub


' Affichage du texte de l'item d�s qu'on change de ligne en saisie dans le tableau
Private Sub tdgD�finitions_AfterUpdate()
  bTabModifi� = True
  If iMode = meChangeTab Then
    Dim fr As Integer, r As Integer
    If tdgD�finitions.FirstRow = "" Then
      fr = 1
    Else
      fr = tdgD�finitions.FirstRow
    End If
    If tdgD�finitions.Row = -1 Then
      r = xaTab.UpperBound(1)
    Else
      r = fr + tdgD�finitions.Row
    End If

    If xaTab(r, 0) = "" Then
      xaTab(r, 1) = ""
    Else
      xaTab(r, 1) = sGetNomCR(Val(xaTab(r, 0)))
    End If
    
    ' On marque la ligne pour les modifs rapides
    If xaTab(r, colIndex) > 0 Then xaTab(r, colIndex) = -xaTab(r, colIndex)
    
    ' ET on r�affiche
    tdgD�finitions.RefetchRow r
  End If
End Sub


Private Function sGetNomCR(ByVal iCR As Integer)
  Dim s As String
  s = BDCurseurExpress("select cr_nom from centrereception where cr_numcr=" & iCR)
  If s = "" Then
    sGetNomCR = sLibell�Inexistant
  Else
    sGetNomCR = s
  End If
End Function


'=================================================================================
' Actions du s�lecteur tableau

Private Sub bdS�lTab_ActionTabChange():     ActionTabChange:    End Sub
Private Sub bdS�lTab_ActionTabDeleteRow():  ActionTabDeleteRow: End Sub
Private Sub bdS�lTab_ActionTabInsertRow():  ActionTabInsertRow: End Sub
Private Sub bdS�lTab_ActionTabValidate():   ActionTabValidate:  End Sub
Private Sub bdS�lTab_ActionTabCancel():     ActionTabCancel:    End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_Keypress(KeyAscii As Integer)
  ResetChienDeGarde
  If KeyAscii = Asc("t") Or KeyAscii = Asc("T") Then
    If bdS�lTab.ButtonEnabled("Change") Then
      KeyAscii = 0
      ActionTabChange
    End If
  Else
    If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
  End If
End Sub

Private Sub tdgD�finitions_BeforeColUpdate(ByVal colIndex As Integer, OldValue As Variant, Cancel As Integer)
'  If tdgD�finitions.Text = "" Then Exit Sub
'  If Not IsNumeric(tdgD�finitions.Text) Then
'    MsgBox "Type incorrect (non num�rique).", vbExclamation, App.Title
'    Cancel = True
'    Exit Sub
'  End If
'  If tdgD�finitions.Text < 0 Or tdgD�finitions.Text > 100000 Then
'    MsgBox "Type incorrect (<0 ou >100000).", vbExclamation, App.Title
'    Cancel = True
'    Exit Sub
'  End If
End Sub

Private Sub tdgD�finitions_AfterColEdit(ByVal colIndex As Integer)
'  Dim fr As Integer, r As Integer
'  If tdgD�finitions.FirstRow = "" Then
'    fr = 1
'  Else
'    fr = tdgD�finitions.FirstRow
'  End If
'  r = fr + tdgD�finitions.Row
'
'  Debug.Print "r=" & r
'  If xaTab(r, 2) = "" Then
'    xaTab(r, 2) = 3
'    tdgD�finitions.RefetchRow r
'  End If
End Sub



Private Sub tdgD�finitions_KeyDown(KeyCode As Integer, Shift As Integer)
  bdS�lTab.KeyDown KeyCode, Shift
  If KeyCode = 13 Then KeyCode = 0
End Sub


Private Sub txtChamp_DblClick(Index As Integer)
  If iMode = meAdd And txtChamp(Index).DataField = "fme_numfme" Then
    ActiveChamp "fme_numfme", True
  End If
End Sub

' Filtrage des Entr�e intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  If Not bExisteTable(sTable) Then
    MsgBox "La table '" & sTable & "' n'est pas pr�sente dans la base de donn�es courante, affichage impossible.", vbCritical, App.Title
    Unload Me
    Exit Sub
  End If
  
  ' On met les frames en t�te de pile d'affichage, sinon certains sont derri�re le tsTab
  Dim F As Frame
  For Each F In fraFeuille
    F.ZOrder 0
  Next

  Show
  iCurFrame = -1   ' Pour forcer le passage � la page 0
  Page "T�te"
  
  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  ' Chargement des combos
  ' nop
  
  ' Pr�paration de la grille
  With tdgD�finitions
    .AllowRowSelect = False
    .AllowColSelect = False
    .AllowAddNew = False
    .AllowUpdate = False
    .AllowDelete = False
    .RecordSelectors = False
    .HighlightRowStyle.BackColor = RGB(180, 180, 255)
    .HighlightRowStyle.ForeColor = &H80000008
    .TabAction = 2    ' Grid navigation

    With .Columns(colN�CR)                ' Destinataire (n�)
      .Caption = "N�CR"
      .Width = 40 * 15
      .DataWidth = 4                      ' Limite actuelle: 9999 CR !
    End With
    
    With .Columns(colNomDest)             ' Nom du centre de r�ception
      .Caption = "Destinataire"
      .Width = 190 * 15
      .Locked = True
      .BackColor = RGB(220, 220, 220)
      .WrapText = True                    ' Impression sur plusieurs lignes
    End With
    
    With .Columns(colAB)                  ' Bact�rios standard
      .Caption = "AB"
      .Width = 25 * 15
      .DataWidth = 1
    End With
    
    With .Columns(colEH)                  ' EH+Obs
      .Caption = "EH/Obs"
      .Width = 25 * 15
      .DataWidth = 1
    End With
    
    With .Columns(colBS)                  ' Bact�rios sp�ciales
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
        
    With .Columns(colLangue)              ' Langue d'�dition
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
    
    With .Columns(colTSCr�ation)          ' Timestamp cr�ation
      .Caption = "TS Cr�ation"
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
    

'    ' Saisie restreinte � 1..4+(vide) pour le niveau
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
  BDActiveChamp tdgD�finitions, False
  Set cFME = Nothing
  bdS�l.LectureSeule = bLectureSeule
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True

  bdS�lTab.ButtonEnabled = False

  iMode = meEmpty

  bdS�l.SetFocus

  SetMessage
  SetStatus
  sFinalWP = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meChangeTab Or iMode = meQuery Then
    MsgBox "Terminez l'op�ration en cours avant de fermer la fen�tre !", vbCritical, App.Title
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

Private Sub SynchroniseFormulaire(Optional bR�afficheTableau As Boolean = True)
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

    bdS�l.NumRec = cFME.AbsolutePosition
    
    ' On efface les champs qui seront affich�s par le timer = le tableau
    If bR�afficheTableau Then
      ActiveTimer mtRapide              ' Mise � jour en arri�re plan
      bdS�lTab.ButtonEnabled = False    ' Aucune commande de tableau disponible
      EffaceTableau
    Else
      bdS�lTab.ButtonEnabled("change") = True
    End If
  End If
  Exit Sub

pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cFME.bEffac� = True
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
    xaTab(iRec, colN�CR) = cV!fmd_numcr
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
    xaTab(iRec, colTSCr�ation) = cV!fmd_tscreation
    xaTab(iRec, colTimestamp) = cV!TimeStamp
    xaTab(iRec, colIndex) = cV!fmd_index
    cV.MoveNext
    iRec = iRec + 1
  Loop
  cV.CloseCurseur
  tdgD�finitions.Array = xaTab
  tdgD�finitions.ReBind
  bdS�lTab.ButtonEnabled("change") = True
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
'  txtJeu = ""
  bdS�l.NumRec = ""
  EffaceTableau
End Sub

Private Sub EffaceTableau()
  xaTab.ReDim 1, 0, 0, MAXCOL
  tdgD�finitions.ReBind
End Sub


' Activation du timer de mise � jour des champs satellites
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

Private Sub bdS�l_GotFocus()
  SetStatus
End Sub

Private Sub tdgD�finitions_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
  If iMode = meChangeTab Or tdgD�finitions Is ActiveControl Then
    If colColonnesDest.Count = 0 Then BDD�critTable "fmedest", colColonnesDest

    Select Case tdgD�finitions.col
      Case colN�CR:       SetStatus colColonnesDest("fmd_numcr").sDescription
      Case colNomDest:    SetStatus "Nom du destinataire (centre de r�ception)"
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
      Case colTSCr�ation: SetStatus colColonnesDest("fmd_tscreation").sDescription
      Case colTimestamp:  SetStatus colColonnesDest("timestamp").sDescription
      Case colIndex:      SetStatus colColonnesDest("fmd_index").sDescription
      
      Case Else: SetStatus
    End Select
  End If
End Sub


'=================================================================================
' Acc�s au Web

Public Sub Fen�treWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=" & sTable
End Sub


'=================================================================================
' Copie des donn�es dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours�"
  BDCopieS�lection cFME, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub

Public Sub CopieTableau()
  gtCopieTableau tdgD�finitions, xaTab
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  DoEtat True
End Sub

Public Sub Aper�u()
  DoEtat False
End Sub

Private Sub DoEtat(ByVal bImpression As Boolean)
  On Error GoTo pb
  
  Dim iChoix As Integer
  iChoix = frmMessageChoix.ChoixEtat("&Liste FME s�lectionn�es", "&D�tail FME courante")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
  Exit Sub
  
pb:
  intlMessageErreurEtat
End Sub


Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Select Case iChoix
    Case 1:   ' Etat standard, liste des titres s�lectionn�s
      Dim sSQL As String
      sSQL = "select * from fme where " & sFinalWP & " order by fme_numfme"
      On Error Resume Next
      BDEtat sSQL, drFME, bImpression
  
    Case 2:   ' D�tail, impression de la grille courante
      ' Impression sur fond blanc
      BDActiveChamp tdgD�finitions, True
      
      With tdgD�finitions.PrintInfo
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
    
      BDActiveChamp tdgD�finitions, False
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


