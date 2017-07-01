VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "MSWLESS.OCX"
Begin VB.Form frmRefDoc 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Références documentaires"
   ClientHeight    =   5550
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   9135
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmRefDoc.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   370
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   609
   Tag             =   "Données"
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   7920
      Top             =   1560
   End
   Begin VB.TextBox txtDactylo 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   4020
      Locked          =   -1  'True
      MaxLength       =   65
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   1200
      Width           =   5055
   End
   Begin VB.TextBox txtAuteur 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   4020
      Locked          =   -1  'True
      MaxLength       =   65
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   840
      Width           =   5055
   End
   Begin VB.TextBox txtNomDir 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   4020
      Locked          =   -1  'True
      MaxLength       =   65
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   480
      Width           =   5055
   End
   Begin VB.TextBox txtChamp 
      CausesValidation=   0   'False
      DataField       =   "timestamp"
      Height          =   315
      Index           =   13
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   28
      Top             =   5160
      Width           =   2235
   End
   Begin RefDoc.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   29
      TabStop         =   0   'False
      Top             =   0
      Width           =   9135
      _extentx        =   16113
      _extenty        =   767
      font            =   "frmRefDoc.frx":014A
   End
   Begin VB.TextBox txtChamp 
      CausesValidation=   0   'False
      DataField       =   "rd_rangement"
      Height          =   315
      Index           =   12
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   26
      Top             =   4800
      Width           =   6075
   End
   Begin VB.TextBox txtChamp 
      CausesValidation=   0   'False
      DataField       =   "rd_nomfic"
      Height          =   315
      Index           =   11
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   24
      Top             =   4440
      Width           =   6075
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "rd_dest"
      Height          =   315
      Index           =   10
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   22
      Top             =   4080
      Width           =   6075
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_objet"
      Height          =   1035
      Index           =   9
      Left            =   3000
      MaxLength       =   180
      MultiLine       =   -1  'True
      TabIndex        =   20
      Top             =   3000
      Width           =   6075
   End
   Begin VB.TextBox txtRefGénérée 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   3000
      Locked          =   -1  'True
      MaxLength       =   65
      TabIndex        =   18
      TabStop         =   0   'False
      Top             =   2640
      Width           =   3555
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_date"
      Height          =   315
      Index           =   7
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   16
      Top             =   2280
      Width           =   1455
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "^*rd_ie"
      Height          =   315
      Index           =   6
      Left            =   4020
      MaxLength       =   65
      TabIndex        =   14
      Top             =   1920
      Width           =   975
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_serie"
      Height          =   315
      Index           =   5
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   13
      Top             =   1920
      Width           =   975
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_jouran"
      Height          =   315
      Index           =   4
      Left            =   4020
      MaxLength       =   65
      TabIndex        =   11
      Top             =   1560
      Width           =   975
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_annee"
      Height          =   315
      Index           =   3
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   10
      Top             =   1560
      Width           =   975
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_dactylo"
      Height          =   315
      Index           =   2
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   7
      Top             =   1200
      Width           =   975
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*^rd_auteur"
      Height          =   315
      Index           =   1
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   4
      Top             =   840
      Width           =   975
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*^rd_direction"
      Height          =   315
      Index           =   0
      Left            =   3000
      TabIndex        =   1
      Top             =   480
      Width           =   975
   End
   Begin MSWLess.WLText WLText1 
      Height          =   315
      Left            =   5340
      TabIndex        =   30
      Top             =   1560
      Width           =   915
      _ExtentX        =   1614
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp:"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   27
      Top             =   5220
      Width           =   1095
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Arborescence du fichier:"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   25
      Top             =   4860
      Width           =   2265
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Nom du fichier:"
      Height          =   210
      Index           =   17
      Left            =   60
      TabIndex        =   23
      Top             =   4500
      Width           =   1410
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Nom du destinataire (doc Ext):"
      Height          =   210
      Index           =   16
      Left            =   60
      TabIndex        =   21
      Top             =   4140
      Width           =   2895
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Objet / Résumé / Titre :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   19
      Top             =   3060
      Width           =   2220
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Référence générée :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   17
      Top             =   2700
      Width           =   1935
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Date en clair du document :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   15
      Top             =   2340
      Width           =   2610
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "N° de série / I ou E :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   12
      Top             =   1980
      Width           =   1950
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Année / Jour de l'année :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   9
      Top             =   1620
      Width           =   2370
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Saisi par :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   6
      Top             =   1260
      Width           =   945
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Auteur du document :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   3
      Top             =   900
      Width           =   2055
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Direction :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   960
   End
End
Attribute VB_Name = "frmRefDoc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmRefDoc
' Feuille de gestion des références documentaires
' 14/06/1999 NC
' 20/08/1999 PV Retouches, champs satellites, état


Option Explicit

Private cRefDoc As BDCurseur                  ' Curseur courant
Private colChamps As New Collection           ' Champs à l'écran
Private colColonnes As New Collection         ' Colonnes de la table
Private iMode As eModeÉdition                 ' Mode du formulaire
Private sFinalSQL As String                   ' Requête SQL courante

Private Const sTable = "refdoc"


Private colTitreUtilisateur As New Collection ' Titre de l'utilisateur, clé=U + n° utilisateur


'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim sWP As String
  Dim t As Control
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
  
  Dim cRefDocQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from refdoc where " & sWP & " order by rd_serie desc"
  cRefDocQuery.OpenCurseur sSQL
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    ActiveFormulaire True
    SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cRefDoc Is Nothing Then cRefDoc.CloseCurseur
  Set cRefDoc = cRefDocQuery
  sFinalSQL = sSQL
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cRefDoc.EOF And cRefDoc.BOF) Then
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
  
  If colChamps("rd_ie") <> "I" And colChamps("rd_ie") <> "E" Then
    MsgBox "Le champ Interne/Externe doit contenir I ou E.", vbInformation, App.Title
    colChamps("rd_ie").SetFocus
    AutoSelect colChamps("rd_ie"), True
    Exit Function
  End If
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  TrimCrLf colChamps("rd_objet")
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  Dim cRefDocAdd As New BDCurseur
  cRefDocAdd.OpenCurseur "select * from refdoc where rd_serie=0"
  cRefDocAdd.AddNew
  
  cRefDocAdd!rd_direction = colChamps("rd_direction")
  cRefDocAdd!rd_serie = colChamps("rd_serie")
  
  If Not bPrépareEditAdd(cRefDocAdd, colColonnes, colChamps) Then
    cRefDocAdd.CloseCurseur
    Exit Sub
  End If
  
  cRefDocAdd.CloseCurseur
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cRefDoc Is Nothing Then cRefDoc.CloseCurseur
  Set cRefDoc = New BDCurseur
  sFinalSQL = "select * from refdoc where rd_direction=" & sFormToSQL(colChamps("rd_direction"), BDTypeCHAR) & " and rd_serie=" & sFormToSQL(colChamps("rd_serie"), BDTypeINTEGER)
  cRefDoc.OpenCurseur sFinalSQL

  cRefDoc.MoveFirst
  
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  EmpêcheMouvements

  SetMessage
  SetStatus
  bdSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cRefDoc Is Nothing

  TrimCrLf colChamps("rd_objet")

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cRefDoc.Edit
  If Not bPrépareEditAdd(cRefDoc, colColonnes, colChamps) Then Exit Sub

  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  bdSél.SetFocus
End Sub



Private Sub ActionValidate()
  ActiveTimer mtStop
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:   ValidateAdd
    Case meQuery: ValidateQuery
  End Select
  
  
End Sub





Private Sub ActionCancel()
  ActiveTimer mtStop
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  ActiveFormulaire False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cRefDoc Is Nothing Then
    If Not (cRefDoc.EOF And cRefDoc.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
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
  
  EffaceFormulaire
  ActiveFormulaire True
  
  ' Nom de la Direction dans le champ Direction
  colChamps("rd_direction") = Mid(sNomOpérateur, 2, InStr(2, sNomOpérateur, "-") - 2)

  colChamps("rd_auteur").SetFocus
  AutoSelect colChamps("rd_auteur"), True
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cRefDoc Is Nothing
  
  If cRefDoc.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "rd_serie", False
  ActiveChamp "rd_direction", False
  ActiveChamp "timestamp", False
  
  colChamps("rd_auteur").SetFocus
  AutoSelect colChamps("rd_auteur"), True
    
      
  ' Détermination du jour de l'année
  Dim d As Date
  Dim j As Integer
  Dim Y As Integer
  
  d = colChamps("rd_date")
  j = Day(colChamps("rd_date"))
  
  If Month(d) > 1 Then j = j + 31
  If Month(d) > 2 Then j = j + 28
  If Month(d) > 3 Then j = j + 31
  If Month(d) > 4 Then j = j + 30
  If Month(d) > 5 Then j = j + 31
  If Month(d) > 6 Then j = j + 30
  If Month(d) > 7 Then j = j + 31
  If Month(d) > 8 Then j = j + 31
  If Month(d) > 9 Then j = j + 30
  If Month(d) > 10 Then j = j + 31
  If Month(d) > 11 Then j = j + 30
  
  Y = Year(colChamps("rd_date")) / 4
  
  If 4 * Y = Year(colChamps("rd_date")) Then
    If (Month(colChamps("rd_date")) > 2) Then j = j + 1
  End If
  
  colChamps("rd_jouran") = j
    
    
  iMode = meChange
  SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  ' On vérifie qu'on est connecté en tant que direction
  If Left(sNomOpérateur, 1) <> "-" Then
    MsgBox "Vous n'êtes pas connecté en tant que direction, ajout impossible", vbExclamation, App.Title
    Unload Me
    MDIRefDoc.cmdUtilisateur_Click
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  ActiveChamp "timestamp", False
  ActiveChamp "rd_serie", False
  
  colChamps("rd_auteur").SetFocus
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
  
  'Nom de la Direction dans le champ Direction
  colChamps("rd_direction") = Mid(sNomOpérateur, 2, InStr(2, sNomOpérateur, "-") - 2)
  txtNomDir = sTitreUtilisateur(iNumOpérateur)
  ActiveChamp "rd_direction", False
  
  ' On génère un n° de référence
  Dim cserie As New BDCurseur
  cserie.OpenCurseur "select max(rd_serie) from refdoc where rd_direction=" & sFormToSQL(colChamps("rd_direction"), BDTypeCHAR)
  If IsNull(cserie.Fields(0)) Then
    colChamps("rd_serie") = 1                     ' Première référence de l'unité !!
  Else
    colChamps("rd_serie") = cserie.Fields(0) + 1    ' Par défaut, dernière référence attribuée + 1
  End If
  cserie.CloseCurseur
 
  ' Détermination de la date du jour
  colChamps("rd_annee") = Right(Year(Today), 2)
  colChamps("rd_date") = Today
  
  ' Détermination du jour de l'année
  Dim d As Date
  Dim j As Integer
  Dim Y As Integer
  
  d = colChamps("rd_date")
  j = Day(colChamps("rd_date"))
  
  If Month(d) > 1 Then j = j + 31
  If Month(d) > 2 Then j = j + 28
  If Month(d) > 3 Then j = j + 31
  If Month(d) > 4 Then j = j + 30
  If Month(d) > 5 Then j = j + 31
  If Month(d) > 6 Then j = j + 30
  If Month(d) > 7 Then j = j + 31
  If Month(d) > 8 Then j = j + 31
  If Month(d) > 9 Then j = j + 30
  If Month(d) > 10 Then j = j + 31
  If Month(d) > 11 Then j = j + 30
  
  Y = Year(colChamps("rd_date")) / 4
  
  If 4 * Y = Year(colChamps("rd_date")) Then
    If (Month(colChamps("rd_date")) > 2) Then j = j + 1
  End If
  
  colChamps("rd_jouran") = j
    
End Sub


Private Function sTitreUtilisateur(iNumUti As Integer)
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sTitreUtilisateur = colTitreUtilisateur("U" & iNumUti)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis à défaut dans la base
  Dim s As String
  s = NV(BDCurseurExpress("select uti_titre from utilisateur where uti_numuti=" & iNumUti))
  colTitreUtilisateur.Add s, "U" & iNumUti   ' On conserve le résultat
  sTitreUtilisateur = s
End Function


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cRefDoc Is Nothing

  If cRefDoc.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cRefDoc.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cRefDoc.MoveNext
  If cRefDoc.EOF Then
    cRefDoc.MovePrevious
    If cRefDoc.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  bdSél.ActiveMouvements iMode = meNavigate
  bdSél.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cRefDoc Is Nothing

  bdSél.ButtonEnabled("First") = cRefDoc.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cRefDoc.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cRefDoc.EOF
  bdSél.ButtonEnabled("Last") = Not cRefDoc.EOF
End Sub

Private Sub EmpêcheMouvements()
  bdSél.ButtonEnabled("First") = False
  bdSél.ButtonEnabled("Previous") = False
  bdSél.ButtonEnabled("Next") = False
  bdSél.ButtonEnabled("Last") = False
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cRefDoc.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
  
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cRefDoc.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
  
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cRefDoc.MoveNext
  AjusteMouvements
  If cRefDoc.EOF Then cRefDoc.MoveLast
  SynchroniseFormulaire
  
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cRefDoc.MovePrevious
  AjusteMouvements
  If cRefDoc.BOF Then cRefDoc.MoveFirst
  SynchroniseFormulaire
  
End Sub


Private Sub btnInfoNiveaux_Click()
  FileShellExecute hWnd, "http://www.silliker/microbsoft/serveur/codes.htm"
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


Private Sub BDSel_ButtonClick(ByVal Button As MSComctlLib.Button)

End Sub

Private Sub Form_Click()
  Me.Refresh
End Sub

' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  bdSél.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
End Sub


' Champs en minuscules
Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "rd_dactylo" Then
    ToMin txtChamp(Index)
  End If
  
  Dim u As Utilisateur
  Dim sMatch As String
  Dim i As Integer
  
  If txtChamp(Index).DataField = "rd_auteur" Then
    txtAuteur = ""
    If txtChamp(Index) <> "" Then
      For i = 1 To Len(txtChamp(Index))
        sMatch = sMatch & " " & Mid(txtChamp(Index), i, 1) & "*"
      Next
      sMatch = sMatch & " "
      For Each u In colUtilisateur
        If " " & Subst(u.uti_nom, "-", " ") & " " Like sMatch Then
          If txtAuteur <> "" Then txtAuteur = txtAuteur & ", "
          txtAuteur = txtAuteur & u.uti_nom
        End If
      Next
    End If
  End If
  
  If txtChamp(Index).DataField = "rd_dactylo" Then
    txtDactylo = ""
    If txtChamp(Index) <> "" Then
      For i = 1 To Len(txtChamp(Index))
        sMatch = sMatch & " " & UCase(Mid(txtChamp(Index), i, 1)) & "*"
      Next
      sMatch = sMatch & " "
      For Each u In colUtilisateur
        If " " & Subst(u.uti_nom, "-", " ") & " " Like sMatch Then
          If txtDactylo <> "" Then txtDactylo = txtDactylo & ", "
          txtDactylo = txtDactylo & u.uti_nom
        End If
      Next
    End If
  End If

End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  Show
  SetStatus "Chargement en cours, patientez…"
  If colColonnes.Count = 0 Then
    BDDécritTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  
  ' Pas de chargement des combos !
  
  ' Formulaire en mode initial
  Set cRefDoc = Nothing
  ActiveFormulaire False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True

  iMode = meEmpty

  bdSél.SetFocus

  SetMessage
  SetStatus
  sFinalSQL = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'opération en cours avant de fermer la fenêtre !", vbCritical, App.Title
    If Not bShiftPressed Then
      Cancel = True
      Exit Sub
    End If
  End If

  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cRefDoc Is Nothing Then cRefDoc.CloseCurseur
  MDIRefDoc.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cRefDoc Is Nothing Then
    EffaceFormulaire
  ElseIf cRefDoc.BOF Or cRefDoc.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cRefDoc.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cRefDoc.Fields(c.DataField)
        txtRefGénérée.Text = colChamps("rd_direction") & "/" & colChamps("rd_auteur") & "/" & colChamps("rd_dactylo") & "/" & Format(colChamps("rd_annee"), "00") & "." & colChamps("rd_jouran") & "/" & colChamps("rd_serie") & " " & colChamps("rd_ie")
      End If
      c.Refresh
    Next
    On Error GoTo 0
    bdSél.NumRec = cRefDoc.AbsolutePosition
    ' Les champs txtAuteur et txtDactylo sont mis à jour via l'événement change
    txtNomDir = ""
    ActiveTimer mtRapide      ' Mise à jour en arrière plan
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cRefDoc.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
  
End Sub

' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop

  If colChamps("rd_direction") <> "" Then
    Dim sDir As String
    Dim u As Utilisateur
    sDir = "-" & colChamps("rd_direction") & "-"
    For Each u In colUtilisateur
      If sDir = u.uti_nom Then
        txtNomDir = sTitreUtilisateur(u.uti_numuti)
        Exit For
      End If
    Next
  End If
End Sub


Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  bdSél.NumRec = ""
  txtRefGénérée = ""
  txtNomDir = ""
End Sub


Private Sub ActiveFormulaire(bEnabled As Boolean)
  Dim c As Control
  For Each c In colChamps
    BDActiveChamp c, bEnabled
  Next
End Sub


Private Sub ActiveChamp(ByVal sChamp As String, bEnabled As Boolean)
  BDActiveChamp colChamps(sChamp), bEnabled
End Sub


' Activation du timer de mise à jour des champs satellites
Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop:    timSatellites.Enabled = False
    Case mtLent:    timSatellites.Interval = 1000: timSatellites.Enabled = True
    Case mtRapide:  timSatellites.Interval = 250: timSatellites.Enabled = True
  End Select
End Sub

Private Sub txtChamp_DblClick(Index As Integer)
  If iMode = meAdd And txtChamp(Index).DataField = "rd_serie" Then
    ActiveChamp "rd_serie", True
  End If
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

Private Sub txtChamp_LostFocus(Index As Integer)
  If txtChamp(Index).DataField = "rd_date" Then
    If IsDate(txtChamp(Index)) Then
      Dim d As Date
      d = CDate(txtChamp(Index))
      colChamps("rd_jouran") = d - DateSerial(Year(d), 1, 1) + 1
    End If
  End If
End Sub


'=================================================================================
' Copie des données dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours…"
  BDCopieSélection cRefDoc, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  BDEtat sFinalSQL, drRefDoc, True
End Sub

Public Sub Aperçu()
  BDEtat sFinalSQL, drRefDoc, False
End Sub
