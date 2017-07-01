VERSION 5.00
Begin VB.Form frmLS 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des libellés standard"
   ClientHeight    =   5550
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   9015
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmLS.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   370
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   601
   Tag             =   "Données"
   Begin VB.TextBox txtRubrique 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2580
      Locked          =   -1  'True
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   1560
      Width           =   6375
   End
   Begin VB.TextBox txtSousRubrique 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2580
      Locked          =   -1  'True
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   1920
      Width           =   6375
   End
   Begin VB.TextBox txtThème 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2580
      Locked          =   -1  'True
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   840
      Width           =   4155
   End
   Begin VB.TextBox txtSecteur 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2580
      Locked          =   -1  'True
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   1200
      Width           =   6375
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ls_numtexte"
      Height          =   315
      Index           =   3
      Left            =   7980
      TabIndex        =   37
      TabStop         =   0   'False
      Top             =   840
      Width           =   975
   End
   Begin VB.TextBox txtLS 
      Height          =   1455
      Left            =   1740
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   17
      Top             =   2280
      Width           =   7215
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ls_comment"
      Height          =   315
      Index           =   9
      Left            =   1740
      MaxLength       =   60
      TabIndex        =   19
      Top             =   3780
      Width           =   7215
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ls_sousrub"
      Height          =   315
      Index           =   1
      Left            =   1740
      TabIndex        =   14
      Top             =   1920
      Width           =   795
   End
   Begin GrillesEvaluation.BDSélecteur bdSél 
      Height          =   435
      Left            =   0
      TabIndex        =   33
      Top             =   0
      Width           =   9075
      _ExtentX        =   16007
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
   Begin VB.TextBox txtChamp 
      DataField       =   "*ls_serie"
      Height          =   315
      Index           =   2
      Left            =   7980
      TabIndex        =   35
      TabStop         =   0   'False
      Top             =   480
      Width           =   975
   End
   Begin GrillesEvaluation.BDCombo bdcLangue 
      Height          =   330
      Left            =   4380
      TabIndex        =   3
      Top             =   480
      Width           =   2355
      _ExtentX        =   4154
      _ExtentY        =   582
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DataField       =   "^*ls_langue"
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ls_rubrique"
      Height          =   315
      Index           =   8
      Left            =   1740
      TabIndex        =   11
      Top             =   1560
      Width           =   795
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   960
      Top             =   540
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ls_secteur"
      Height          =   315
      Index           =   6
      Left            =   1740
      TabIndex        =   8
      Top             =   1200
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*^ls_theme"
      Height          =   315
      Index           =   4
      Left            =   1740
      TabIndex        =   5
      Top             =   840
      Width           =   315
   End
   Begin VB.Frame frlTraçabilité 
      Caption         =   "Traçabilité"
      Height          =   1395
      Left            =   60
      TabIndex        =   32
      Top             =   4080
      Width           =   8895
      Begin VB.TextBox txtChamp 
         DataField       =   "ls_idmodif"
         Height          =   315
         Index           =   5
         Left            =   5040
         TabIndex        =   31
         Top             =   960
         Width           =   3790
      End
      Begin GrillesEvaluation.BDCombo bdcoperModif 
         Height          =   330
         Left            =   3780
         TabIndex        =   27
         Top             =   600
         Width           =   5055
         _ExtentX        =   8916
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "ls_opermodif"
      End
      Begin GrillesEvaluation.BDCombo bdcOperCreat 
         Height          =   330
         Left            =   3780
         TabIndex        =   23
         Top             =   240
         Width           =   5055
         _ExtentX        =   8916
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "ls_opercreat"
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   22
         Left            =   1680
         TabIndex        =   29
         Top             =   960
         Width           =   2055
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "ls_datecreat"
         Height          =   315
         Index           =   17
         Left            =   1680
         TabIndex        =   21
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "ls_heurecreat"
         Height          =   315
         Index           =   18
         Left            =   2940
         TabIndex        =   22
         Top             =   240
         Width           =   795
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "ls_datemodif"
         Height          =   315
         Index           =   19
         Left            =   1680
         TabIndex        =   25
         Top             =   600
         Width           =   1215
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "ls_heuremodif"
         Height          =   315
         Index           =   20
         Left            =   2940
         TabIndex        =   26
         Top             =   600
         Width           =   795
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Orig. modif :"
         Height          =   210
         Index           =   14
         Left            =   3840
         TabIndex        =   30
         Top             =   1020
         Width           =   1155
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   120
         TabIndex        =   28
         Top             =   1020
         Width           =   1155
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Créé le :"
         Height          =   210
         Index           =   17
         Left            =   120
         TabIndex        =   20
         Top             =   300
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifié le :"
         Height          =   210
         Index           =   16
         Left            =   120
         TabIndex        =   24
         Top             =   660
         Width           =   1020
      End
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ls_numls"
      Height          =   315
      Index           =   0
      Left            =   1740
      TabIndex        =   1
      Top             =   480
      Width           =   1635
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "N° texte :"
      Height          =   210
      Index           =   4
      Left            =   6960
      TabIndex        =   36
      Top             =   900
      Width           =   930
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Ss rub / Item :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   13
      Top             =   1980
      Width           =   1365
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Remarques :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   18
      Top             =   3840
      Width           =   1200
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Serial :"
      Height          =   210
      Index           =   3
      Left            =   6960
      TabIndex        =   34
      Top             =   540
      Width           =   660
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Rubrique / Grille :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   10
      Top             =   1620
      Width           =   1635
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Secteur / Client :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   7
      Top             =   1260
      Width           =   1590
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Langue :"
      Height          =   210
      Index           =   10
      Left            =   3480
      TabIndex        =   2
      Top             =   540
      Width           =   840
   End
   Begin VB.Label lblChamp 
      Caption         =   "Thème"
      Height          =   195
      Index           =   7
      Left            =   60
      TabIndex        =   4
      Top             =   900
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "&Libellé :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   16
      Top             =   2340
      Width           =   735
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "N&° LS :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   660
   End
End
Attribute VB_Name = "frmLS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmLS
' Feuille de gestion des libellés standard
' 26/11/1999 PV
' 15/01/2000 PV Impression sous-traitée à Word 97/2000


Option Explicit

Private cLibSt As BDCurseur               ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private Const sTable = "libstand"



'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim sWP As String
  Dim t As Control
  Dim bRequêteVide As Boolean
  
  bRequêteVide = True
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
      If t.DataField <> "ls_langue" Then bRequêteVide = False
    End If
  Next
  
  If bRequêteVide Then
    Dim iRep As VbMsgBoxResult
    iRep = AvertissementLectureFichierComplet
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cLibStQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from libstand where " & sWP & " order by ls_theme,ls_secteur,ls_rubrique,ls_sousrub,ls_numls,ls_langue"

  cLibStQuery.OpenCurseur sQuery
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    BDActiveFormulaire colChamps, True
    SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
    Exit Sub
  End If
  
  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cLibSt Is Nothing Then cLibSt.CloseCurseur
  Set cLibSt = cLibStQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cLibSt.EOF And cLibSt.BOF) Then
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
  bOkValeurs = False
  
  If Trim(txtLS) = "" Then
    MsgBox "Vous ne pouvez pas créer de libellé standard vide !", vbExclamation, App.Title
    Exit Function
  End If
  
  If colChamps("ls_theme") < "A" Or colChamps("ls_theme") > "Z" Then
    MsgBox "Le thème est obligatoire; c'est une lettre entre A et Z." & vbCrLf & vbCrLf & "Si les titres de section ne sont pas définis, utilisez:" & vbCrLf & "W pour les items génériques communs  toutes les grilles." & vbCrLf & "S pour les items spécifiques à une grille. Dans ce cas, le n°de secteur corespond à une code client libre; le n°de rubrique correspond au n°de grille, et le n°de sous-rubrique au n°d'item.", vbInformation, App.Title
    colChamps("ls_theme").SetFocus
    AutoSelect colChamps("ls_theme"), True
    Exit Function
  End If

  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub EnregistreTexteLS()
  Dim ls As String
  ls = BDFiltreTexte(Subst(txtLS, vbCrLf, "¶"))
  
  If colChamps("ls_numtexte") <> 0 Then
    RunSQL "delete from lstexte where lst_numtexte=" & colChamps("ls_numtexte")
  Else
    colChamps("ls_numtexte") = 1 + NZ(BDCurseurExpress("select max(lst_numtexte) from lstexte"))
  End If
  ' Synchrodelete est mis à jour via un trigger
  
  
  Dim iIndice As Integer
  Dim ct As New BDCurseur
  ct.OpenCurseur "select * from lstexte where lst_numtexte=0"
  iIndice = 0
  While ls <> ""
    ct.AddNew
    ct!lst_numtexte = colChamps("ls_numtexte")
    ct!lst_indice = iIndice
    ct!lst_texte = Left(ls, 60)
    ct!timestamp = BDTime
    ct.Update
    iIndice = iIndice + 1
    ls = Mid(ls, 61)
  Wend
  ct.CloseCurseur
End Sub


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub   ' Refuse les LS vides

  Dim cLibStAdd As New BDCurseur
  cLibStAdd.OpenCurseur "select * from libstand where ls_serie=0"
  cLibStAdd.AddNew

' Traçabilité ancien style
  InitTraçabilité colChamps, "ls", True

' Seuls les champs actifs sont mis à jour
  ActiveTraçabilité True
  ActiveChamp "ls_serie", True
  ActiveChamp "ls_numtexte", True
  
  ' On enregistre le texte, ce qui remplit le champ ls_numtexte
  EnregistreTexteLS
  
  If Not bPrépareEditAdd(cLibStAdd, colColonnes, colChamps) Then
    cLibStAdd.CloseCurseur
    ActiveTraçabilité False
    ActiveChamp "ls_serie", False
    ActiveChamp "ls_numtexte", False
    Exit Sub
  End If
  cLibStAdd.CloseCurseur
  
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cLibSt Is Nothing Then cLibSt.CloseCurseur
  Set cLibSt = New BDCurseur
  
  Dim iSérie As Long
  iSérie = BDCurseurExpress("select max(ls_serie) from libstand")
  
  sFinalWP = "ls_serie=" & iSérie
  sQuery = "select * from libstand where " & sFinalWP
  cLibSt.OpenCurseur sQuery
  cLibSt.MoveFirst
  
  BDActiveFormulaire colChamps, False
  BDActiveChamp txtLS, False
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
  Assert Not cLibSt Is Nothing
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub   ' Refuse les LS vides
  
  cLibSt.Edit
      
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "ls", False
  
' Seuls les champs actifs sont mis à jour
  ActiveTraçabilité True
  ' Pas besoin d'activer ls_serie ou ls_numtexte, ils ne doivent pas changer
  ' lors d'une modification
    
  If Not bPrépareEditAdd(cLibSt, colColonnes, colChamps) Then
    ActiveTraçabilité False
    Exit Sub
  End If
  
  ' On enregistre le texte
  EnregistreTexteLS
  
  BDActiveFormulaire colChamps, False
  BDActiveChamp txtLS, False
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
  ActiveTimer mtStop
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
 
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub





Private Sub ActionCancel()
  ActiveTimer mtStop
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  
  ' Si jamais on annule un ajout, il faut effacer les textes qui
  ' on peut-être été déjà écrits dans la table lstexte
  If iMode = meAdd And colChamps("ls_numtexte") <> 0 Then
    RunSQL "delete from lstexte where lst_numtexte=" & colChamps("ls_numtexte")
  End If

  BDActiveFormulaire colChamps, False
  BDActiveChamp txtLS, False

  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cLibSt Is Nothing Then
    If Not (cLibSt.EOF And cLibSt.BOF) Then
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
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, False
  BDActiveFormulaire colChamps, True
  
  ' Valeur par défaut
  bdcLangue = cLangage
  
  colChamps("ls_numls").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cLibSt Is Nothing
  
  If cLibSt.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If

  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True

  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  BDActiveChamp txtLS, True
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  ActiveChamp "ls_idmodif", False
  ActiveChamp "ls_serie", False
  ActiveChamp "ls_numtexte", False

  colChamps("ls_numls").SetFocus
  AutoSelect colChamps("ls_numls"), True
  
  bdSél.TabStop = False
  iMode = meChange

  SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"

End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  BDActiveChamp txtLS, True

  ActiveChamp "timestamp", False
  ActiveChamp "ls_idmodif", False
  ActiveChamp "ls_serie", False
  ActiveChamp "ls_numtexte", False
  ActiveTraçabilité False
    
  ' Valeur par défaut
  bdcLangue = cLangage
  colChamps("ls_serie") = 0     ' Pour générer le serial
  colChamps("ls_numtexte") = 0     ' Pour générer le serial
  
  colChamps("ls_numls").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub



Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cLibSt Is Nothing
  
  If cLibSt.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  ' On efface les textes
  RunSQL "delete from lstexte where lst_numtexte=" & colChamps("ls_numtexte")
  
  On Error Resume Next
  cLibSt.Delete
  If Err Then
    AfficheErreurODBC "Échec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cLibSt.MoveNext
  If cLibSt.EOF Then
    cLibSt.MovePrevious
    If cLibSt.BOF Then
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

Private Sub ActiveTraçabilité(bEnable As Boolean)
  ActiveChamp "ls_datecreat", bEnable
  ActiveChamp "ls_heurecreat", bEnable
  ActiveChamp "ls_opercreat", bEnable
  ActiveChamp "ls_datemodif", bEnable
  ActiveChamp "ls_heuremodif", bEnable
  ActiveChamp "ls_opermodif", bEnable
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cLibSt Is Nothing

  bdSél.ButtonEnabled("First") = cLibSt.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cLibSt.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cLibSt.EOF
  bdSél.ButtonEnabled("Last") = Not cLibSt.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cLibSt.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cLibSt.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cLibSt.MoveNext
  AjusteMouvements
  If cLibSt.EOF Then cLibSt.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cLibSt.MovePrevious
  AjusteMouvements
  If cLibSt.BOF Then cLibSt.MoveFirst
  SynchroniseFormulaire
End Sub


Private Sub bdcLangue_Change()
  ToMaj bdcLangue
End Sub

Private Sub bdcLangue_LostFocus()
  bdcLangue.Synchronise
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


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode <> 13 Or Not (ActiveControl Is txtLS) Then bdSél.KeyDown KeyCode
  'If KeyCode = 13 Then KeyCode = 0
End Sub

Private Sub Form_Keypress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
  'If KeyAscii = 13 Then KeyAscii = 0
End Sub

' Filtrage des Entrée intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
End Sub

Private Sub txtChamp_KeyPress(Index As Integer, KeyAscii As Integer)
  If KeyAscii = 13 Then KeyAscii = 0
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

  
  ' Chargement des combos
  
  ' Utilisateurs
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcOperCreat.AddItem u.uti_numuti, u.uti_nom
    bdcoperModif.AddItem u.uti_numuti, u.uti_nom
  Next
  
  ' Langues
  Dim l As Langue
  For Each l In colLangue
    bdcLangue.AddItem l.lan_code, l.lan_langue
  Next
  
  
  ' Formulaire en mode initial
  Set cLibSt = Nothing
  BDActiveFormulaire colChamps, False
  BDActiveChamp txtLS, False
  bdSél.LectureSeule = bLectureSeule
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  bdSél.SetFocus
  
  SetMessage
  SetStatus
  sFinalWP = ""
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
  If Not cLibSt Is Nothing Then cLibSt.CloseCurseur
  MDIGrilles.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub

' Aide des options
Private Sub lblOptions_Click(Index As Integer)
  If Index = 1 Then
    FileShellExecute hWnd, "http://www.silliker/microbsoft/secretariat/frmoptcr.htm"
  Else
    FileShellExecute hWnd, "http://www.silliker/microbsoft/serveur/optlabo.htm"
  End If
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cLibSt Is Nothing Then
    EffaceFormulaire
  ElseIf cLibSt.BOF And cLibSt.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cLibSt.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cLibSt.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cLibSt.AbsolutePosition
    txtLS = ""
    
    txtThème = ""
    txtSecteur = ""
    txtRubrique = ""
    txtSousRubrique = ""
    
    ActiveTimer mtRapide      ' Mise à jour en arrière plan
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cLibSt.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  ' Affichage du libellé standard
  If colChamps("ls_numtexte") <> "" Then txtLS = sGetTexteLS(colChamps("ls_numtexte"))
  
  ' Affichage du classement
  If colChamps("ls_theme") <> "" Then
    txtThème = sGetThème(colChamps("ls_theme"))
    If colChamps("ls_secteur") <> "" Then
      txtSecteur = sGetSecteur(colChamps("ls_theme"), colChamps("ls_secteur"))
      If colChamps("ls_rubrique") <> "" Then
        If colChamps("ls_numls") > 999999 Then
          txtRubrique = sGetTitreGrille(colChamps("ls_rubrique"), cLangage)
          If colChamps("ls_sousrub") <> "" Then txtSousRubrique = sGetItemGrilleNumloc(colChamps("ls_rubrique"), colChamps("ls_sousrub"), cLangage)
        Else
          txtRubrique = sGetRubrique(colChamps("ls_theme"), colChamps("ls_secteur"), colChamps("ls_rubrique"))
          If colChamps("ls_sousrub") <> "" Then txtSousRubrique = sGetSousRub(colChamps("ls_theme"), colChamps("ls_secteur"), colChamps("ls_rubrique"), colChamps("ls_sousrub"))
        End If
      End If
    End If
  End If

End Sub


' Fonction de bas niveau, récupère le texte et assure la conversion des "¶"
' Mais ne résout pas le texte des LS imbriqués
Private Function sGetTexteLS(ByVal lNumTexte As Long)
  Dim ls As String
  Dim c As New BDCurseur
  c.OpenCurseur "select lst_indice,lst_texte from lstexte where lst_numtexte=" & lNumTexte & " order by lst_indice"
  Do Until c.EOF
    ' On se protège contre les NULLs
    ' En principe ne devrait pas être possible, mais le cas a été rencontré...
    If Not IsNull(c!lst_texte) Then
      ls = ls & c!lst_texte & Space(60 - Len(c!lst_texte))
    Else
      ' En fait ça arrive... "" sur le serveur et NULL sur les autres systèmes à cause de la synchro
      'MsgBox "ERREUR INTERNE" & vbCrLf & vbCrLf & "Problème de cohérence interne des libellés standard, ls_texte est NULL !" & vbCrLf & "NumTexte=" & lNumTexte & vbCrLf & vbCrLf & "Prévenez le service informatique." & vbCrLf & "Attention, le document généré est peut-être incomplet ou incorrect." & vbCrLf & "Ne l'utilisez pas avant l'avis du service informatique.", vbCritical, App.Title
    End If
    c.MoveNext
  Loop
  c.CloseCurseur
  sGetTexteLS = RTrim(Subst(ls, "¶", vbCrLf))
End Function


Private Function sGetNumTexte(ByVal lNumLS As Long, cLangue As String) As Long
  sGetNumTexte = BDCurseurExpress("select ls_numtexte from libstand where ls_numls=" & lNumLS & " and ls_langue='" & cLangue & "'")
End Function


' Fonction de haut niveau, récupère le texte définitif
' Résout récursiment les libellés imbriqués
Public Function sGetLS(ByVal lNumLS As Long, cLangue As String)
  Dim ls As String, sls As String
  Dim nls As Long
  Dim p As Integer, p0 As Integer, iPos As Integer
  
  Const bDétailSousNum As Boolean = False
  
  ls = sGetTexteLS(sGetNumTexte(lNumLS, cLangue))
  iPos = 1
  Do
    p = InStr(iPos, ls, "{")
    If p = 0 Then Exit Do
    p0 = p + 1
    Do
      p = p + 1
    Loop While Mid(ls, p, 1) Like "#"
    If Mid(ls, p, 1) = "}" Then
      nls = Val(Mid(ls, p0))
      sls = sGetTexteLS(sGetNumTexte(nls, cLangue))
      If bDétailSousNum Then
        ls = Left(ls, p - 1) & ": " & sls & Mid(ls, p)
      Else
        ls = Left(ls, p0 - 2) & sls & Mid(ls, p + 1)
        p = p0 - 2
      End If
    End If
    iPos = p + 1
  Loop
  sGetLS = ls
End Function


Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  txtLS = ""
  bdSél.NumRec = ""

  txtThème = ""
  txtSecteur = ""
  txtRubrique = ""
  txtSousRubrique = ""
End Sub


' Activation du timer de mise à jour des champs satellites
Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop: timSatellites.Enabled = False
    Case mtLent: timSatellites.Interval = 1000: timSatellites.Enabled = True
    Case mtRapide: timSatellites.Interval = 250: timSatellites.Enabled = True
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

Private Sub bdcLangue_GotFocus()
  SetStatus bdcLangue.Tag
End Sub

Private Sub bdcOperCreat_GotFocus()
  SetStatus bdcOperCreat.Tag
End Sub

Private Sub bdcOperModif_GotFocus()
  SetStatus bdcoperModif.Tag
End Sub

Private Sub txtLS_GotFocus()
  SetStatus "Texte du LS"
End Sub

' Assistance à la saisie des n°s de LS spécifiques
Private Sub txtChamp_LostFocus(Index As Integer)
  If txtChamp(Index).DataField = "ls_numls" Then
    Dim sNumLS As String
    sNumLS = txtChamp(Index)
    If IsNumeric(sNumLS) Then
      If sNumLS > 999999 And colChamps("ls_theme") = "" Then
        colChamps("ls_theme") = "S"
        colChamps("ls_rubrique") = Left(sNumLS, Len(sNumLS) - 6)
        colChamps("ls_sousrub") = Val(Left(Right(sNumLS, 6), 4))
      End If
    End If
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
  BDCopieSélection cLibSt, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression
' Sous-traitée à Word

Public Sub Imprime()
  Etat True
End Sub

Public Sub Aperçu()
  Etat False
End Sub

Private Sub Etat(ByVal bImpression As Boolean)
  Dim wd As Object, sel As Object
  Dim iLine As Integer
  Dim bEspacé As Boolean
  Dim sLastTheme, sLastSecteur, sLastRubrique, sLastSousRub
  
  If iMode <> meNavigate Then
    MsgBox "Sélectionnez les enregistrements que vous souhaitez imprimer avant de lancer l'impression.", vbExclamation, App.Title
    Exit Sub
  End If
  
  ' Lancement de Word
  On Error Resume Next
  Set wd = CreateObject("Word.Application")
  If Err = -2147417846 Then    ' Problème Norton AntiVirus 2000 OfficeAV.DLL add-in
    MsgBox "Erreur système -2147417846 au lancement de Word." & vbCrLf & vbCrLf & "Cette erreur peut-être due à la présence du composant Norton AntiVirus 2000 pour Office 2000." & vbCrLf & "Pour désactiver ce composant, choisissez la commande 'Unregister Norton AntiVirus OfficeAV.DLL add-in' du menu Commandes. Si vous avez besoin d'aide ou si cela ne fonctionne pas, contactez le service informatique.", vbCritical, App.Title
    Exit Sub
  End If
  On Error GoTo 0
  wd.Visible = True
  wd.Documents.Add
  Set sel = wd.Selection
  
  Screen.MousePointer = vbHourglass
  SetStatus "Génération du document en cours…"
  
  With sel
    ' Début du document
    .Font.Bold = True
    .Font.Italic = True
    .TypeText "Microb'Soft - Libellés standard Silliker"
    .Font.Bold = False
    .Font.Italic = False
    .TypeParagraph
    .TypeText "Édité le " & Format(Now, "ddd d/mm/yyyy hh:mm") & " par " & sNomOpérateur
    .TypeParagraph
    .TypeText "Requête: " & sFinalWP
    .TypeParagraph
    
    ' Pied de page
    If wd.ActiveWindow.View.SplitSpecial <> 0 Then wd.ActiveWindow.Panes(2).Close   '0=wdPaneNone
    If wd.ActiveWindow.ActivePane.View.Type = 1 Or wd.ActiveWindow.ActivePane.View.Type = 2 Then wd.ActiveWindow.ActivePane.View.Type = 3   ' 1=wdNormalView, 2=wdOutlineView, 3=wdPrintView
    wd.ActiveWindow.ActivePane.View.SeekView = 10     ' wdSeekCurrentPageFooter
    .TypeText Text:=vbTab & vbTab & "Page "
    .Fields.Add Range:=.Range, Type:=33               ' wdFieldPage
    With .Borders(-1)                                 ' wdBorderTop
      .LineStyle = wd.Options.DefaultBorderLineStyle
      .LineWidth = wd.Options.DefaultBorderLineWidth
    End With
    wd.ActiveWindow.ActivePane.View.SeekView = 0      ' wdSeekMainDocument
    wd.ActiveWindow.View.Type = 1                     ' wdNormalView
  
    ' Parcours des données
    EffaceFormulaire
    cLibSt.MoveFirst
    Do Until cLibSt.EOF
      bdSél.NumRec = cLibSt.AbsolutePosition
      bdSél.RefreshNumRec
      
      ' Genération de la structure hiérarchique
      bEspacé = False
      If NV(cLibSt!ls_theme) <> sLastTheme Then
        .MoveDown Unit:=5, Count:=1                   ' 5=wdLine
        .TypeParagraph
        bEspacé = True
        .Font.Bold = True
        .TypeText cLibSt!ls_theme & "  " & NV(sGetThème(cLibSt!ls_theme))
        .Font.Bold = False
        .TypeParagraph
      End If
      If NV(cLibSt!ls_theme) <> sLastTheme Or NV(cLibSt!ls_secteur) <> sLastSecteur Then
        If Not bEspacé Then
          .MoveDown Unit:=5, Count:=1      ' 5=wdLine
          .TypeParagraph
          bEspacé = True
        End If
        .Font.Bold = True
        .TypeText cLibSt!ls_theme & "." & cLibSt!ls_secteur & "  " & NV(sGetSecteur(cLibSt!ls_theme, cLibSt!ls_secteur))
        .Font.Bold = False
        .TypeParagraph
      End If
      If NV(cLibSt!ls_theme) <> sLastTheme Or NV(cLibSt!ls_secteur) <> sLastSecteur Or NV(cLibSt!ls_rubrique) <> sLastRubrique Then
        If Not bEspacé Then
          .MoveDown Unit:=5, Count:=1      ' 5=wdLine
          .TypeParagraph
          bEspacé = True
        End If
        .Font.Bold = True
        .TypeText cLibSt!ls_theme & "." & cLibSt!ls_secteur & "." & cLibSt!ls_rubrique & "  "
        If cLibSt!ls_numls > 999999 Then
          .TypeText NV(sGetTitreGrille(cLibSt!ls_rubrique, cLangage))
        Else
          .TypeText NV(sGetRubrique(cLibSt!ls_theme, cLibSt!ls_secteur, cLibSt!ls_rubrique))
        End If
        .Font.Bold = False
        .TypeParagraph
      End If
      If NV(cLibSt!ls_theme) <> sLastTheme Or NV(cLibSt!ls_secteur) <> sLastSecteur Or NV(cLibSt!ls_rubrique) <> sLastRubrique Or NV(cLibSt!ls_sousrub) <> sLastSousRub Then
        If Not bEspacé Then
          .MoveDown Unit:=5, Count:=1      ' 5=wdLine
          .TypeParagraph
          bEspacé = True
        End If
        .Font.Bold = True
        .TypeText cLibSt!ls_theme & "." & cLibSt!ls_secteur & "." & cLibSt!ls_rubrique & "." & cLibSt!ls_sousrub & "  "
        If cLibSt!ls_numls > 999999 Then
          .Font.Underline = True
          .TypeText NV(sGetItemGrilleNumloc(cLibSt!ls_rubrique, NZ(cLibSt!ls_sousrub), cLangage))
          .Font.Underline = False
        Else
          .TypeText NV(sGetSousRub(cLibSt!ls_theme, cLibSt!ls_secteur, cLibSt!ls_rubrique, NZ(cLibSt!ls_sousrub)))
        End If
        .Font.Bold = False
        .TypeParagraph
        
        iLine = 0
        sLastTheme = NV(cLibSt!ls_theme)
        sLastSecteur = NV(cLibSt!ls_secteur)
        sLastRubrique = NV(cLibSt!ls_rubrique)
        sLastSousRub = NV(cLibSt!ls_sousrub)
        
        wd.ScreenUpdating = True
        wd.ScreenRefresh
        wd.ScreenUpdating = False
      End If
        
      ' On fabrique le tableau
      If iLine = 0 Then
        ' Si c'est la première ligne, il faut insérer le tableau, enlever l'affichage de
        ' la bordure et dimensionner les colonnes
        wd.ActiveDocument.Tables.Add Range:=.Range, NumRows:=1, NumColumns:=2
        .cells.SetWidth ColumnWidth:=wd.CentimetersToPoints(3.7), RulerStyle:=0
        .Move Unit:=1, Count:=1
        .cells.SetWidth ColumnWidth:=wd.CentimetersToPoints(12.7), RulerStyle:=0
        
        .SelectRow
        With .cells
          .Borders(-1).LineStyle = 0           ' wdBorderTop
          .Borders(-2).LineStyle = 0           ' wdBorderLeft
          .Borders(-3).LineStyle = 0           ' wdBorderBottom
          .Borders(-4).LineStyle = 0           ' wdBorderRight
          ' .Borders(-5), séparation horizontale interne, n'est pas accessible s'il n'y a qu'une ligne
          .Borders(-6).LineStyle = 0           ' wdBorderVertical
          .Borders.Shadow = False
        End With
      
        .MoveLeft Unit:=1, Count:=1            ' 1=wdCharacter
      ElseIf iLine = 1 Then
        ' Pour la deuxième ligne, il faut enlever la bordure haute, due au fait que quand on
        ' insère un tableau d'une seule ligne on ne peut pas enlever la bordure de séparation
        ' horizontale interne du tableau; elle n'est accessible qu'à partir de la deuxième ligne
        
      '  $$ NC
        .MoveRight Unit:=12                    ' 12=wdCell
        .SelectRow
        .cells.Borders(-1).LineStyle = 0       ' wdBorderTop
        .MoveLeft Unit:=1, Count:=1            ' 1=wdCharacter
      Else
        ' Et à partir de la troisième ligne, il n'y a qu'à insérer une tabulation, tout est Ok
        .MoveRight Unit:=12                    ' 12=wdCell
      End If
      
      ' Insertion du texte dans le tableau
      ' N° item
      .Font.Bold = True
      Dim s As String
      If cLibSt!ls_numls > 999999 Then
        s = Str(cLibSt!ls_numls)
        .TypeText Text:=Left(s, Len(s) - 6) & "." & Left(Right(s, 6), 4) & "." & Right(s, 2)
      Else
        .TypeText Text:=Str(cLibSt!ls_numls)
      End If
      If cLibSt!ls_langue <> "F" Then
        .TypeParagraph
        .TypeText Text:=" (" & cLibSt!ls_langue & ")"
      End If
      .Font.Bold = False
      
      ' Texte de l'item
      .MoveRight Unit:=12                      ' 12=wdCell
      s = sGetLS(cLibSt!ls_numls, cLibSt!ls_langue)
      If Right(s, 2) <> vbCrLf Then s = s & vbCrLf
      .TypeText Text:=s
      
      iLine = iLine + 1
      cLibSt.MoveNext
    Loop
    .MoveDown Unit:=5, Count:=1                ' 5=wdLine
  End With
  wd.ScreenUpdating = True
  
  If bImpression Then
    wd.ActiveDocument.PrintOut
    ' On ne quitte pas Word, l'impression étant réalisée en tâche de fond
  End If
  
  cLibSt.MoveFirst
  SynchroniseFormulaire
  
  Screen.MousePointer = vbDefault
  SetStatus
  
  Beep        ' Terminé !
End Sub


'=================================================================================
' Copie des LS

Public Sub CopierLS()
  If iMode <> meNavigate Then
    MsgBox "Interrogez un groupe de libellés privés (thème S) à recopier avant de choisir cette commande.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNouvGrille As Integer
  iNouvGrille = Val(InputBox("N° de grille destination ?", App.Title))
  If iNouvGrille = 0 Then Exit Sub
  If iNouvGrille < 500 Or iNouvGrille > 1800 Then
    MsgBox "No de grille invalide.", vbExclamation, App.Title
    Exit Sub
  End If
  
  EffaceFormulaire
  cLibSt.MoveFirst
  DoEvents
  
  Dim cNLS As New BDCurseur
  cNLS.OpenCurseur "select * from libstand where ls_numtexte=0"
  
  Dim dBDTime As Date
  dBDTime = BDTime

  Do Until cLibSt.EOF
    bdSél.NumRec = cLibSt.AbsolutePosition
    bdSél.RefreshNumRec
    
    ' La recopie ne s'applique qu'aux LS privés
    If cLibSt!ls_theme = "S" Then
      Dim iNouvNumLS As Long
      Dim iOldGrille As Integer
      iOldGrille = cLibSt!ls_numls \ 1000000
      iNouvNumLS = cLibSt!ls_numls + (iNouvGrille - iOldGrille) * 1000000
      
      ' On teste si le LS n'existe pas déjà
      If 0 = BDCurseurExpress("select rowid from libstand where ls_numls=" & iNouvNumLS) Then
      
        ' On recopie le texte
        txtLS = sGetTexteLS(cLibSt!ls_numtexte)
        colChamps("ls_numtexte") = 0
        EnregistreTexteLS
        
        cNLS.AddNew
        cNLS!ls_serie = 0
        cNLS!ls_theme = cLibSt!ls_theme
        cNLS!ls_secteur = cLibSt!ls_secteur
        cNLS!ls_rubrique = iNouvGrille
        cNLS!ls_sousrub = cLibSt!ls_sousrub
        cNLS!ls_numls = iNouvNumLS
        cNLS!ls_langue = cLibSt!ls_langue
        cNLS!ls_numtexte = colChamps("ls_numtexte")
        cNLS!ls_comment = cLibSt!ls_comment
        
        InitTraçabilité colChamps, "ls", True
        cNLS!ls_datecreat = colChamps("ls_datecreat")
        cNLS!ls_heurecreat = colChamps("ls_heurecreat")
        cNLS!ls_opercreat = colChamps("ls_opercreat")
        cNLS!ls_datemodif = colChamps("ls_datemodif")
        cNLS!ls_heuremodif = colChamps("ls_heuremodif")
        cNLS!ls_opermodif = colChamps("ls_opermodif")
        cNLS!timestamp = dBDTime
        cNLS!ls_idmodif = sBDIdModif

        cNLS.Update
      End If
    End If
    cLibSt.MoveNext
  Loop
  
  cLibSt.MoveFirst
  SynchroniseFormulaire
End Sub

