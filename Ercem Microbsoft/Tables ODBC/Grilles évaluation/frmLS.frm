VERSION 5.00
Begin VB.Form frmLS 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des libell�s standard"
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
   Tag             =   "Donn�es"
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
   Begin VB.TextBox txtTh�me 
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
   Begin GrillesEvaluation.BDS�lecteur bdS�l 
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
   Begin VB.Frame frlTra�abilit� 
      Caption         =   "Tra�abilit�"
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
         Caption         =   "Cr�� le :"
         Height          =   210
         Index           =   17
         Left            =   120
         TabIndex        =   20
         Top             =   300
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifi� le :"
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
      Caption         =   "N� texte :"
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
      Caption         =   "Th�me"
      Height          =   195
      Index           =   7
      Left            =   60
      TabIndex        =   4
      Top             =   900
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "&Libell� :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   16
      Top             =   2340
      Width           =   735
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "N&� LS :"
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
' Feuille de gestion des libell�s standard
' 26/11/1999 PV
' 15/01/2000 PV Impression sous-trait�e � Word 97/2000


Option Explicit

Private cLibSt As BDCurseur               ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire

Private sFinalWP As String                ' Where-part de la requ�te SQL courante
Private sQuery As String                  ' Query de la s�lection en cours

Private Const sTable = "libstand"



'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim sWP As String
  Dim t As Control
  Dim bRequ�teVide As Boolean
  
  bRequ�teVide = True
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
      If t.DataField <> "ls_langue" Then bRequ�teVide = False
    End If
  Next
  
  If bRequ�teVide Then
    Dim iRep As VbMsgBoxResult
    iRep = AvertissementLectureFichierComplet
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cLibStQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from libstand where " & sWP & " order by ls_theme,ls_secteur,ls_rubrique,ls_sousrub,ls_numls,ls_langue"

  cLibStQuery.OpenCurseur sQuery
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "�chec lors de la requ�te" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    BDActiveFormulaire colChamps, True
    SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
    Exit Sub
  End If
  
  ' Tout est Ok
  ' Fermeture �ventuelle du curseur en cours
  If Not cLibSt Is Nothing Then cLibSt.CloseCurseur
  Set cLibSt = cLibStQuery
  sFinalWP = sWP
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cLibSt.EOF And cLibSt.BOF) Then
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
  bOkValeurs = False
  
  If Trim(txtLS) = "" Then
    MsgBox "Vous ne pouvez pas cr�er de libell� standard vide !", vbExclamation, App.Title
    Exit Function
  End If
  
  If colChamps("ls_theme") < "A" Or colChamps("ls_theme") > "Z" Then
    MsgBox "Le th�me est obligatoire; c'est une lettre entre A et Z." & vbCrLf & vbCrLf & "Si les titres de section ne sont pas d�finis, utilisez:" & vbCrLf & "W pour les items g�n�riques communs  toutes les grilles." & vbCrLf & "S pour les items sp�cifiques � une grille. Dans ce cas, le n�de secteur corespond � une code client libre; le n�de rubrique correspond au n�de grille, et le n�de sous-rubrique au n�d'item.", vbInformation, App.Title
    colChamps("ls_theme").SetFocus
    AutoSelect colChamps("ls_theme"), True
    Exit Function
  End If

  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub EnregistreTexteLS()
  Dim ls As String
  ls = BDFiltreTexte(Subst(txtLS, vbCrLf, "�"))
  
  If colChamps("ls_numtexte") <> 0 Then
    RunSQL "delete from lstexte where lst_numtexte=" & colChamps("ls_numtexte")
  Else
    colChamps("ls_numtexte") = 1 + NZ(BDCurseurExpress("select max(lst_numtexte) from lstexte"))
  End If
  ' Synchrodelete est mis � jour via un trigger
  
  
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

' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "ls", True

' Seuls les champs actifs sont mis � jour
  ActiveTra�abilit� True
  ActiveChamp "ls_serie", True
  ActiveChamp "ls_numtexte", True
  
  ' On enregistre le texte, ce qui remplit le champ ls_numtexte
  EnregistreTexteLS
  
  If Not bPr�pareEditAdd(cLibStAdd, colColonnes, colChamps) Then
    cLibStAdd.CloseCurseur
    ActiveTra�abilit� False
    ActiveChamp "ls_serie", False
    ActiveChamp "ls_numtexte", False
    Exit Sub
  End If
  cLibStAdd.CloseCurseur
  
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cLibSt Is Nothing Then cLibSt.CloseCurseur
  Set cLibSt = New BDCurseur
  
  Dim iS�rie As Long
  iS�rie = BDCurseurExpress("select max(ls_serie) from libstand")
  
  sFinalWP = "ls_serie=" & iS�rie
  sQuery = "select * from libstand where " & sFinalWP
  cLibSt.OpenCurseur sQuery
  cLibSt.MoveFirst
  
  BDActiveFormulaire colChamps, False
  BDActiveChamp txtLS, False
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
  Assert Not cLibSt Is Nothing
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub   ' Refuse les LS vides
  
  cLibSt.Edit
      
  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "ls", False
  
' Seuls les champs actifs sont mis � jour
  ActiveTra�abilit� True
  ' Pas besoin d'activer ls_serie ou ls_numtexte, ils ne doivent pas changer
  ' lors d'une modification
    
  If Not bPr�pareEditAdd(cLibSt, colColonnes, colChamps) Then
    ActiveTra�abilit� False
    Exit Sub
  End If
  
  ' On enregistre le texte
  EnregistreTexteLS
  
  BDActiveFormulaire colChamps, False
  BDActiveChamp txtLS, False
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
  ' on peut-�tre �t� d�j� �crits dans la table lstexte
  If iMode = meAdd And colChamps("ls_numtexte") <> 0 Then
    RunSQL "delete from lstexte where lst_numtexte=" & colChamps("ls_numtexte")
  End If

  BDActiveFormulaire colChamps, False
  BDActiveChamp txtLS, False

  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cLibSt Is Nothing Then
    If Not (cLibSt.EOF And cLibSt.BOF) Then
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
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, False
  BDActiveFormulaire colChamps, True
  
  ' Valeur par d�faut
  bdcLangue = cLangage
  
  colChamps("ls_numls").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cLibSt Is Nothing
  
  If cLibSt.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If

  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True

  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  BDActiveChamp txtLS, True
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False
  ActiveChamp "ls_idmodif", False
  ActiveChamp "ls_serie", False
  ActiveChamp "ls_numtexte", False

  colChamps("ls_numls").SetFocus
  AutoSelect colChamps("ls_numls"), True
  
  bdS�l.TabStop = False
  iMode = meChange

  SetMessage "Modifiez les valeurs affich�es, puis validez [Entr�e] ou abandonnez [�chap]"

End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  BDActiveChamp txtLS, True

  ActiveChamp "timestamp", False
  ActiveChamp "ls_idmodif", False
  ActiveChamp "ls_serie", False
  ActiveChamp "ls_numtexte", False
  ActiveTra�abilit� False
    
  ' Valeur par d�faut
  bdcLangue = cLangage
  colChamps("ls_serie") = 0     ' Pour g�n�rer le serial
  colChamps("ls_numtexte") = 0     ' Pour g�n�rer le serial
  
  colChamps("ls_numls").SetFocus
  bdS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub



Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cLibSt Is Nothing
  
  If cLibSt.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est d�finitive." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  ' On efface les textes
  RunSQL "delete from lstexte where lst_numtexte=" & colChamps("ls_numtexte")
  
  On Error Resume Next
  cLibSt.Delete
  If Err Then
    AfficheErreurODBC "�chec de la destruction de l'enregistrement"
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
  
  bdS�l.ActiveMouvements iMode = meNavigate
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub


'=================================================================================

Private Sub ActiveTra�abilit�(bEnable As Boolean)
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

  bdS�l.ButtonEnabled("First") = cLibSt.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cLibSt.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cLibSt.EOF
  bdS�l.ButtonEnabled("Last") = Not cLibSt.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cLibSt.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
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


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode <> 13 Or Not (ActiveControl Is txtLS) Then bdS�l.KeyDown KeyCode
  'If KeyCode = 13 Then KeyCode = 0
End Sub

Private Sub Form_Keypress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
  'If KeyAscii = 13 Then KeyAscii = 0
End Sub

' Filtrage des Entr�e intempestifs
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
  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable sTable, colColonnes
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
  bdS�l.LectureSeule = bLectureSeule
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  bdS�l.SetFocus
  
  SetMessage
  SetStatus
  sFinalWP = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'op�ration en cours avant de fermer la fen�tre !", vbCritical, App.Title
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
    
    bdS�l.NumRec = cLibSt.AbsolutePosition
    txtLS = ""
    
    txtTh�me = ""
    txtSecteur = ""
    txtRubrique = ""
    txtSousRubrique = ""
    
    ActiveTimer mtRapide      ' Mise � jour en arri�re plan
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cLibSt.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  ' Affichage du libell� standard
  If colChamps("ls_numtexte") <> "" Then txtLS = sGetTexteLS(colChamps("ls_numtexte"))
  
  ' Affichage du classement
  If colChamps("ls_theme") <> "" Then
    txtTh�me = sGetTh�me(colChamps("ls_theme"))
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


' Fonction de bas niveau, r�cup�re le texte et assure la conversion des "�"
' Mais ne r�sout pas le texte des LS imbriqu�s
Private Function sGetTexteLS(ByVal lNumTexte As Long)
  Dim ls As String
  Dim c As New BDCurseur
  c.OpenCurseur "select lst_indice,lst_texte from lstexte where lst_numtexte=" & lNumTexte & " order by lst_indice"
  Do Until c.EOF
    ' On se prot�ge contre les NULLs
    ' En principe ne devrait pas �tre possible, mais le cas a �t� rencontr�...
    If Not IsNull(c!lst_texte) Then
      ls = ls & c!lst_texte & Space(60 - Len(c!lst_texte))
    Else
      ' En fait �a arrive... "" sur le serveur et NULL sur les autres syst�mes � cause de la synchro
      'MsgBox "ERREUR INTERNE" & vbCrLf & vbCrLf & "Probl�me de coh�rence interne des libell�s standard, ls_texte est NULL !" & vbCrLf & "NumTexte=" & lNumTexte & vbCrLf & vbCrLf & "Pr�venez le service informatique." & vbCrLf & "Attention, le document g�n�r� est peut-�tre incomplet ou incorrect." & vbCrLf & "Ne l'utilisez pas avant l'avis du service informatique.", vbCritical, App.Title
    End If
    c.MoveNext
  Loop
  c.CloseCurseur
  sGetTexteLS = RTrim(Subst(ls, "�", vbCrLf))
End Function


Private Function sGetNumTexte(ByVal lNumLS As Long, cLangue As String) As Long
  sGetNumTexte = BDCurseurExpress("select ls_numtexte from libstand where ls_numls=" & lNumLS & " and ls_langue='" & cLangue & "'")
End Function


' Fonction de haut niveau, r�cup�re le texte d�finitif
' R�sout r�cursiment les libell�s imbriqu�s
Public Function sGetLS(ByVal lNumLS As Long, cLangue As String)
  Dim ls As String, sls As String
  Dim nls As Long
  Dim p As Integer, p0 As Integer, iPos As Integer
  
  Const bD�tailSousNum As Boolean = False
  
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
      If bD�tailSousNum Then
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
  bdS�l.NumRec = ""

  txtTh�me = ""
  txtSecteur = ""
  txtRubrique = ""
  txtSousRubrique = ""
End Sub


' Activation du timer de mise � jour des champs satellites
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

Private Sub bdS�l_GotFocus()
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

' Assistance � la saisie des n�s de LS sp�cifiques
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
' Acc�s au Web

Public Sub Fen�treWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=" & sTable
End Sub


'=================================================================================
' Copie des donn�es dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours�"
  BDCopieS�lection cLibSt, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression
' Sous-trait�e � Word

Public Sub Imprime()
  Etat True
End Sub

Public Sub Aper�u()
  Etat False
End Sub

Private Sub Etat(ByVal bImpression As Boolean)
  Dim wd As Object, sel As Object
  Dim iLine As Integer
  Dim bEspac� As Boolean
  Dim sLastTheme, sLastSecteur, sLastRubrique, sLastSousRub
  
  If iMode <> meNavigate Then
    MsgBox "S�lectionnez les enregistrements que vous souhaitez imprimer avant de lancer l'impression.", vbExclamation, App.Title
    Exit Sub
  End If
  
  ' Lancement de Word
  On Error Resume Next
  Set wd = CreateObject("Word.Application")
  If Err = -2147417846 Then    ' Probl�me Norton AntiVirus 2000 OfficeAV.DLL add-in
    MsgBox "Erreur syst�me -2147417846 au lancement de Word." & vbCrLf & vbCrLf & "Cette erreur peut-�tre due � la pr�sence du composant Norton AntiVirus 2000 pour Office 2000." & vbCrLf & "Pour d�sactiver ce composant, choisissez la commande 'Unregister Norton AntiVirus OfficeAV.DLL add-in' du menu Commandes. Si vous avez besoin d'aide ou si cela ne fonctionne pas, contactez le service informatique.", vbCritical, App.Title
    Exit Sub
  End If
  On Error GoTo 0
  wd.Visible = True
  wd.Documents.Add
  Set sel = wd.Selection
  
  Screen.MousePointer = vbHourglass
  SetStatus "G�n�ration du document en cours�"
  
  With sel
    ' D�but du document
    .Font.Bold = True
    .Font.Italic = True
    .TypeText "Microb'Soft - Libell�s standard Silliker"
    .Font.Bold = False
    .Font.Italic = False
    .TypeParagraph
    .TypeText "�dit� le " & Format(Now, "ddd d/mm/yyyy hh:mm") & " par " & sNomOp�rateur
    .TypeParagraph
    .TypeText "Requ�te: " & sFinalWP
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
  
    ' Parcours des donn�es
    EffaceFormulaire
    cLibSt.MoveFirst
    Do Until cLibSt.EOF
      bdS�l.NumRec = cLibSt.AbsolutePosition
      bdS�l.RefreshNumRec
      
      ' Gen�ration de la structure hi�rarchique
      bEspac� = False
      If NV(cLibSt!ls_theme) <> sLastTheme Then
        .MoveDown Unit:=5, Count:=1                   ' 5=wdLine
        .TypeParagraph
        bEspac� = True
        .Font.Bold = True
        .TypeText cLibSt!ls_theme & "  " & NV(sGetTh�me(cLibSt!ls_theme))
        .Font.Bold = False
        .TypeParagraph
      End If
      If NV(cLibSt!ls_theme) <> sLastTheme Or NV(cLibSt!ls_secteur) <> sLastSecteur Then
        If Not bEspac� Then
          .MoveDown Unit:=5, Count:=1      ' 5=wdLine
          .TypeParagraph
          bEspac� = True
        End If
        .Font.Bold = True
        .TypeText cLibSt!ls_theme & "." & cLibSt!ls_secteur & "  " & NV(sGetSecteur(cLibSt!ls_theme, cLibSt!ls_secteur))
        .Font.Bold = False
        .TypeParagraph
      End If
      If NV(cLibSt!ls_theme) <> sLastTheme Or NV(cLibSt!ls_secteur) <> sLastSecteur Or NV(cLibSt!ls_rubrique) <> sLastRubrique Then
        If Not bEspac� Then
          .MoveDown Unit:=5, Count:=1      ' 5=wdLine
          .TypeParagraph
          bEspac� = True
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
        If Not bEspac� Then
          .MoveDown Unit:=5, Count:=1      ' 5=wdLine
          .TypeParagraph
          bEspac� = True
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
        ' Si c'est la premi�re ligne, il faut ins�rer le tableau, enlever l'affichage de
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
          ' .Borders(-5), s�paration horizontale interne, n'est pas accessible s'il n'y a qu'une ligne
          .Borders(-6).LineStyle = 0           ' wdBorderVertical
          .Borders.Shadow = False
        End With
      
        .MoveLeft Unit:=1, Count:=1            ' 1=wdCharacter
      ElseIf iLine = 1 Then
        ' Pour la deuxi�me ligne, il faut enlever la bordure haute, due au fait que quand on
        ' ins�re un tableau d'une seule ligne on ne peut pas enlever la bordure de s�paration
        ' horizontale interne du tableau; elle n'est accessible qu'� partir de la deuxi�me ligne
        
      '  $$ NC
        .MoveRight Unit:=12                    ' 12=wdCell
        .SelectRow
        .cells.Borders(-1).LineStyle = 0       ' wdBorderTop
        .MoveLeft Unit:=1, Count:=1            ' 1=wdCharacter
      Else
        ' Et � partir de la troisi�me ligne, il n'y a qu'� ins�rer une tabulation, tout est Ok
        .MoveRight Unit:=12                    ' 12=wdCell
      End If
      
      ' Insertion du texte dans le tableau
      ' N� item
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
    ' On ne quitte pas Word, l'impression �tant r�alis�e en t�che de fond
  End If
  
  cLibSt.MoveFirst
  SynchroniseFormulaire
  
  Screen.MousePointer = vbDefault
  SetStatus
  
  Beep        ' Termin� !
End Sub


'=================================================================================
' Copie des LS

Public Sub CopierLS()
  If iMode <> meNavigate Then
    MsgBox "Interrogez un groupe de libell�s priv�s (th�me S) � recopier avant de choisir cette commande.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNouvGrille As Integer
  iNouvGrille = Val(InputBox("N� de grille destination ?", App.Title))
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
    bdS�l.NumRec = cLibSt.AbsolutePosition
    bdS�l.RefreshNumRec
    
    ' La recopie ne s'applique qu'aux LS priv�s
    If cLibSt!ls_theme = "S" Then
      Dim iNouvNumLS As Long
      Dim iOldGrille As Integer
      iOldGrille = cLibSt!ls_numls \ 1000000
      iNouvNumLS = cLibSt!ls_numls + (iNouvGrille - iOldGrille) * 1000000
      
      ' On teste si le LS n'existe pas d�j�
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
        
        InitTra�abilit� colChamps, "ls", True
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

