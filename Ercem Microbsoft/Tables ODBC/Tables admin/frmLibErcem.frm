VERSION 5.00
Begin VB.Form frmLibErcem 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des libellés (libercem)"
   ClientHeight    =   7230
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8550
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmLibErcem.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   482
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   570
   Tag             =   "Données"
   Begin VB.TextBox txtLibellé 
      Height          =   735
      Index           =   6
      Left            =   1500
      MultiLine       =   -1  'True
      TabIndex        =   30
      Tag             =   "Libellé en néerlandais (H)"
      Top             =   6420
      Width           =   6990
   End
   Begin VB.CommandButton btnModifierLibellé 
      Height          =   315
      Index           =   6
      Left            =   720
      Picture         =   "frmLibErcem.frx":0442
      Style           =   1  'Graphical
      TabIndex        =   29
      Top             =   6480
      Width           =   315
   End
   Begin VB.CommandButton btnSupprimerLibellé 
      Height          =   315
      Index           =   6
      Left            =   1080
      Picture         =   "frmLibErcem.frx":0544
      Style           =   1  'Graphical
      TabIndex        =   28
      Top             =   6480
      Visible         =   0   'False
      Width           =   330
   End
   Begin VB.ComboBox cboApplication 
      DataField       =   "*ler_application"
      Height          =   330
      ItemData        =   "frmLibErcem.frx":0646
      Left            =   1500
      List            =   "frmLibErcem.frx":065C
      TabIndex        =   5
      Tag             =   "Code de l'application concernée par le libellé"
      Top             =   840
      Width           =   2295
   End
   Begin VB.CommandButton btnSupprimerLibellé 
      Height          =   315
      Index           =   5
      Left            =   1080
      Picture         =   "frmLibErcem.frx":068D
      Style           =   1  'Graphical
      TabIndex        =   27
      Top             =   5760
      Visible         =   0   'False
      Width           =   330
   End
   Begin VB.CommandButton btnSupprimerLibellé 
      Height          =   315
      Index           =   4
      Left            =   1080
      Picture         =   "frmLibErcem.frx":078F
      Style           =   1  'Graphical
      TabIndex        =   26
      Top             =   5040
      Visible         =   0   'False
      Width           =   330
   End
   Begin VB.CommandButton btnSupprimerLibellé 
      Height          =   315
      Index           =   3
      Left            =   1080
      Picture         =   "frmLibErcem.frx":0891
      Style           =   1  'Graphical
      TabIndex        =   25
      Top             =   4320
      Visible         =   0   'False
      Width           =   330
   End
   Begin VB.CommandButton btnSupprimerLibellé 
      Height          =   315
      Index           =   2
      Left            =   1080
      Picture         =   "frmLibErcem.frx":0993
      Style           =   1  'Graphical
      TabIndex        =   24
      Top             =   3600
      Visible         =   0   'False
      Width           =   330
   End
   Begin VB.CommandButton btnSupprimerLibellé 
      Height          =   315
      Index           =   1
      Left            =   1080
      Picture         =   "frmLibErcem.frx":0A95
      Style           =   1  'Graphical
      TabIndex        =   23
      Top             =   2880
      Visible         =   0   'False
      Width           =   330
   End
   Begin VB.CommandButton btnModifierLibellé 
      Height          =   315
      Index           =   5
      Left            =   720
      Picture         =   "frmLibErcem.frx":0B97
      Style           =   1  'Graphical
      TabIndex        =   22
      Top             =   5760
      Width           =   315
   End
   Begin VB.CommandButton btnModifierLibellé 
      Height          =   315
      Index           =   4
      Left            =   720
      Picture         =   "frmLibErcem.frx":0C99
      Style           =   1  'Graphical
      TabIndex        =   21
      Top             =   5040
      Width           =   315
   End
   Begin VB.CommandButton btnModifierLibellé 
      Height          =   315
      Index           =   3
      Left            =   720
      Picture         =   "frmLibErcem.frx":0D9B
      Style           =   1  'Graphical
      TabIndex        =   20
      Top             =   4320
      Width           =   315
   End
   Begin VB.CommandButton btnModifierLibellé 
      Height          =   315
      Index           =   2
      Left            =   720
      Picture         =   "frmLibErcem.frx":0E9D
      Style           =   1  'Graphical
      TabIndex        =   19
      Top             =   3600
      Width           =   315
   End
   Begin VB.CommandButton btnModifierLibellé 
      Height          =   315
      Index           =   1
      Left            =   720
      Picture         =   "frmLibErcem.frx":0F9F
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   2880
      Width           =   315
   End
   Begin VB.CommandButton btnModifierLibellé 
      Height          =   315
      Index           =   0
      Left            =   720
      Picture         =   "frmLibErcem.frx":10A1
      Style           =   1  'Graphical
      TabIndex        =   17
      Top             =   2160
      Width           =   330
   End
   Begin VB.TextBox txtChamp 
      BackColor       =   &H8000000F&
      DataField       =   "*ler_langue"
      Height          =   315
      Index           =   1
      Left            =   4920
      Locked          =   -1  'True
      TabIndex        =   3
      TabStop         =   0   'False
      Tag             =   "Code du libellé"
      Text            =   "F"
      Top             =   480
      Width           =   255
   End
   Begin VB.TextBox txtLibellé 
      Height          =   735
      Index           =   5
      Left            =   1500
      MultiLine       =   -1  'True
      TabIndex        =   15
      Tag             =   "Libellé en néerlandais (H)"
      Top             =   5700
      Width           =   6990
   End
   Begin VB.TextBox txtLibellé 
      Height          =   735
      Index           =   4
      Left            =   1500
      MultiLine       =   -1  'True
      TabIndex        =   14
      Tag             =   "Libellé en espagnol (E)"
      Top             =   4980
      Width           =   6990
   End
   Begin VB.TextBox txtLibellé 
      Height          =   735
      Index           =   3
      Left            =   1500
      MultiLine       =   -1  'True
      TabIndex        =   13
      Tag             =   "Libellé en allemand (D)"
      Top             =   4260
      Width           =   6990
   End
   Begin VB.TextBox txtLibellé 
      Height          =   735
      Index           =   2
      Left            =   1500
      MultiLine       =   -1  'True
      TabIndex        =   12
      Tag             =   "Libellé en italien (I)"
      Top             =   3540
      Width           =   6990
   End
   Begin VB.TextBox txtLibellé 
      Height          =   735
      Index           =   1
      Left            =   1500
      MultiLine       =   -1  'True
      TabIndex        =   11
      Tag             =   "Libellé en anglais (A)"
      Top             =   2820
      Width           =   6990
   End
   Begin VB.TextBox txtLibellé 
      DataField       =   "*ler_libelle"
      Height          =   735
      Index           =   0
      Left            =   1500
      MultiLine       =   -1  'True
      TabIndex        =   10
      Tag             =   "Libellé en français (F)"
      Top             =   2100
      Width           =   6990
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ler_description"
      Height          =   315
      Index           =   6
      Left            =   1500
      MaxLength       =   60
      TabIndex        =   7
      Tag             =   "Description du libellé"
      Top             =   1200
      Width           =   6990
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   1500
      TabIndex        =   9
      Tag             =   "Date+heure de dernière modification de l'information"
      Top             =   1560
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ler_numler"
      Height          =   315
      Index           =   0
      Left            =   1500
      TabIndex        =   1
      Tag             =   "Code interne du libellé (MAJ/min différentes)"
      Top             =   480
      Width           =   2295
   End
   Begin TablesAdmin.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   16
      Top             =   0
      Width           =   8550
      _ExtentX        =   15081
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
   Begin VB.Image Image 
      Height          =   375
      Index           =   6
      Left            =   60
      Picture         =   "frmLibErcem.frx":11A3
      Stretch         =   -1  'True
      Top             =   6420
      Width           =   375
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Langue :"
      Height          =   210
      Index           =   1
      Left            =   4020
      TabIndex        =   2
      Top             =   540
      Width           =   840
   End
   Begin VB.Image Image 
      Height          =   375
      Index           =   2
      Left            =   60
      Picture         =   "frmLibErcem.frx":15E5
      Stretch         =   -1  'True
      Top             =   4260
      Width           =   375
   End
   Begin VB.Image Image 
      Height          =   375
      Index           =   4
      Left            =   60
      Picture         =   "frmLibErcem.frx":18EF
      Stretch         =   -1  'True
      Top             =   4980
      Width           =   375
   End
   Begin VB.Image Image 
      Height          =   375
      Index           =   5
      Left            =   60
      Picture         =   "frmLibErcem.frx":1BF9
      Stretch         =   -1  'True
      Top             =   5700
      Width           =   375
   End
   Begin VB.Image Image 
      Height          =   375
      Index           =   0
      Left            =   60
      Picture         =   "frmLibErcem.frx":203B
      Stretch         =   -1  'True
      Top             =   2820
      Width           =   375
   End
   Begin VB.Image Image 
      Height          =   375
      Index           =   3
      Left            =   60
      Picture         =   "frmLibErcem.frx":2345
      Stretch         =   -1  'True
      Top             =   3540
      Width           =   375
   End
   Begin VB.Image Image 
      Height          =   375
      Index           =   1
      Left            =   60
      Picture         =   "frmLibErcem.frx":264F
      Stretch         =   -1  'True
      Top             =   2100
      Width           =   375
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   4
      X2              =   564
      Y1              =   132
      Y2              =   132
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Description :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   6
      Top             =   1260
      Width           =   1185
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   8
      Top             =   1620
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Application :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   4
      Top             =   900
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Code libellé :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   1230
   End
End
Attribute VB_Name = "frmLibErcem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmLibErcem
' Feuille de gestion des libellés ercem
' 20/01/1999 PV
' 30/03/1999 PV Impression
' 27/08/1999 PV Gestion standard de la mémorisation
' 29/10/2001 PV Polonais


Option Explicit

Private cLEr As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private sFinalWP As String                ' Where-part de la requête SQL courante

Private cOld As New Collection            ' Valeurs précédentes

Private iCurrentIndex As Integer          ' Modification de libellé

Const sOrdreLangue As String = "FAIDEHL"

Private Const sTable = "libercem"


'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim sWP As String
  Dim t As Control
  sWP = "ler_langue='F'"
  colChamps.Add txtLibellé(0), "ZZ"     ' Ajout temporaire
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
  colChamps.Remove "ZZ"
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cLErQuery As New BDCurseur
  ActiveFormulaire False
  BDActiveChamp txtLibellé(0), False

  If bShiftPressed Then
    MsgBox "Where-part :" & vbCrLf & sWP, vbInformation, App.Title
  End If

  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cLErQuery.OpenCurseur "select * from libercem where " & sWP & " order by ler_numler"
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
  If Not cLEr Is Nothing Then cLEr.CloseCurseur
  Set cLEr = cLErQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cLEr.EOF And cLEr.BOF) Then
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
  
  Select Case colChamps("ler_application")
    Case "commun"
    Case "gdoc"
    Case "plannings"
    Case "scraw"
    Case "gdocw"
    Case "statge"
    Case "fact"
    
    Case Else: MsgBox "Attention, le nom de l'application n'est pas dans la liste préféfinie; vérifiez qu'il n'y a pas d'erreur.", vbInformation, App.Title
  End Select
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  TrimCrLf colChamps("ler_description")
  TrimCrLf colChamps("ler_libelle")
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cLErAdd As New BDCurseur
  cLErAdd.OpenCurseur "select * from LibErcem where ler_numler='@'"
  cLErAdd.AddNew
  colChamps.Add txtLibellé(0), "ZZ"     ' Ajout temporaire
  ActiveChamp "ler_langue", True        ' A insérer dans la base
  If Not bPrépareEditAdd(cLErAdd, colColonnes, colChamps) Then
    cLErAdd.CloseCurseur
    colChamps.Remove "ZZ"
    Exit Sub
  End If
  ActiveChamp "ler_langue", False
  colChamps.Remove "ZZ"
  cLErAdd.CloseCurseur
  
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cLEr Is Nothing Then cLEr.CloseCurseur
  Set cLEr = New BDCurseur
  sFinalWP = "ler_numler=" & sFormToSQL(colChamps("ler_numler"), BDTypeCHAR) & " and ler_application=" & sFormToSQL(colChamps("ler_application"), BDTypeCHAR)
  cLEr.OpenCurseur "select * from libercem where " & sFinalWP
  cLEr.MoveFirst
  
  ActiveFormulaire False
  BDActiveChamp txtLibellé(0), False

  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  bdSél.EmpêcheMouvements
  
  ' On mémorise les valeurs actuelles
  Mémorise
  
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub


Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cLEr Is Nothing
  
  ' Validation de création/modif de libellé international
  If colChamps("ler_langue") <> "F" Then
    ValidateEditLibellé
    Exit Sub
  End If

  TrimCrLf colChamps("ler_description")
  TrimCrLf colChamps("ler_libelle")
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  Dim sOldApplication As String
  sOldApplication = cLEr!ler_application
  
  cLEr.Edit
  If Not bPrépareEditAdd(cLEr, colColonnes, colChamps) Then Exit Sub
  
  ' On met à jour les libellés dans les autres langues, au cas où on ait changé l'application
  If colChamps("ler_application") <> sOldApplication Then
    Dim c As New BDCurseur
    Dim sSQL As String
    sSQL = "select * from libercem where ler_application=" & sFormToSQL(sOldApplication, BDTypeCHAR) & _
    " and ler_numler=" & sFormToSQL(colChamps("ler_numler"), BDTypeCHAR) & _
    " and ler_langue<>'F'"
    c.OpenCurseur sSQL
    Do While Not c.EOF
      c.Edit
      c!ler_application = colChamps("ler_application")
      c!timestamp = BDTime
      c.Update
      c.MoveNext
    Loop
    c.CloseCurseur
  End If
  
  ActiveFormulaire False
  BDActiveChamp txtLibellé(0), False
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  AjusteMouvements
  
  ' On mémorise les valeurs actuelles
  Mémorise

  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



Private Sub ValidateEditLibellé()
  Dim sSQL As String
  Dim c As New BDCurseur
  
  TrimCrLf txtLibellé(iCurrentIndex)
  If Trim(txtLibellé(iCurrentIndex)) = "" Then
    MsgBox "Le libellé ne peut pas être vide !", vbExclamation, App.Title
    Exit Sub
  End If
  
  ' On désactive tous les libellés internationaux
  Dim t As TextBox
  For Each t In txtLibellé
    BDActiveChamp t, False
  Next
  
  sSQL = "select * from libercem where ler_application=" & sFormToSQL(colChamps("ler_application"), BDTypeCHAR) & " and ler_numler=" & sFormToSQL(colChamps("ler_numler"), BDTypeCHAR) & " and ler_langue=" & sFormToSQL(colChamps("ler_langue"), BDTypeCHAR)
  c.OpenCurseur sSQL
  If c.EOF Then
    c.AddNew
    c!ler_numler = colChamps("ler_numler")
    c!ler_application = colChamps("ler_application")
    c!ler_langue = colChamps("ler_langue")
    c!ler_libelle = txtLibellé(iCurrentIndex)
  Else
    c.Edit
    c!ler_libelle = txtLibellé(iCurrentIndex)
  End If
  c!timestamp = BDTime
  c.Update
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meNavigate
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  bdSél.ActiveMouvements True
  AjusteMouvements
  
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub




Private Sub ActionValidate()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub





Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  ActiveFormulaire False
  ' On désactive tous les libellés internationaux
  Dim t As TextBox
  For Each t In txtLibellé
    BDActiveChamp t, False
  Next
  
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cLEr Is Nothing Then
    If Not (cLEr.EOF And cLEr.BOF) Then
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
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, False
  
  ActiveChamp "ler_langue", False
  colChamps("ler_langue") = "F"
  BDActiveChamp txtLibellé(0), True
  
  colChamps("ler_numler").SetFocus
  bdSél.TabStop = False
  
  ' On enlève le tabstop des boutons "Modifier libellé"
  Dim b As CommandButton
  For Each b In btnModifierLibellé
    b.TabStop = False
  Next
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cLEr Is Nothing
  
  If cLEr.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "ler_numler", False
  ActiveChamp "timestamp", False
  ActiveChamp "ler_langue", False
  colChamps("ler_langue") = "F"
  
  colChamps("ler_application").SetFocus
  AutoSelect colChamps("ler_application"), True
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
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  
  ActiveChamp "ler_langue", False
  colChamps("ler_langue") = "F"
  
  ActiveChamp "timestamp", False
  BDActiveChamp txtLibellé(0), True
  
  colChamps("ler_numler").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cLEr Is Nothing

  If cLEr.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  ' On efface les libellés internationaux
  Dim sSQL As String
  sSQL = "delete from libercem where ler_application=" & sFormToSQL(colChamps("ler_application"), BDTypeCHAR) & _
    " and ler_numler=" & sFormToSQL(colChamps("ler_numler"), BDTypeCHAR) & _
    " and ler_langue<>'F'"
  BDcn.Execute sSQL
  
  On Error Resume Next
  cLEr.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cLEr.MoveNext
  If cLEr.EOF Then
    cLEr.MovePrevious
    If cLEr.BOF Then
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
  Assert Not cLEr Is Nothing
  
  bdSél.ButtonEnabled("First") = cLEr.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cLEr.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cLEr.EOF
  bdSél.ButtonEnabled("Last") = Not cLEr.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cLEr.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cLEr.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cLEr.MoveNext
  AjusteMouvements
  If cLEr.EOF Then cLEr.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cLEr.MovePrevious
  AjusteMouvements
  If cLEr.BOF Then cLEr.MoveFirst
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


' ==============================================================================
' Gestion des libellés multi-langues

Private Sub txtLibellé_Click(Index As Integer)
  If txtLibellé(Index).Locked Then
    btnModifierLibellé_Click Index
  End If
End Sub

Private Sub btnModifierLibellé_Click(Index As Integer)
  If iMode = meChange Or iMode = meAdd Then ActionValidate
  
  If iMode = meNavigate Then
    bdSél.ButtonEnabled("Query") = False
    bdSél.ButtonEnabled("Add") = False
    bdSél.ActiveMouvements False
    bdSél.ActiveValidation True
    
    colChamps("ler_langue") = Mid(sOrdreLangue, Index + 1, 1)

    BDActiveChamp txtLibellé(Index), True
    txtLibellé(Index).SetFocus
    AutoSelect txtLibellé(Index), True
    
    iMode = meChange
    iCurrentIndex = Index
    SetMessage "Modifiez le libellé, puis validez [Entrée] ou abandonnez [Échap]"
  End If
End Sub

Private Sub btnSupprimerLibellé_Click(Index As Integer)
  If iMode = meNavigate Then
    Assert Not cLEr Is Nothing
  
    If cLEr.bEffacé Then Exit Sub
    
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    
    Dim sSQL As String
    sSQL = "delete from libercem where ler_application=" & sFormToSQL(colChamps("ler_application"), BDTypeCHAR) & _
      " and ler_numler=" & sFormToSQL(colChamps("ler_numler"), BDTypeCHAR) & _
      " and ler_langue=" & sFormToSQL(Mid(sOrdreLangue, Index + 1, 1), BDTypeCHAR)
    BDcn.Execute sSQL
    SynchroniseFormulaire
    
    bdSél.ActiveMouvements iMode = meNavigate
    bdSél.TabStop = True
    bdSél.SetFocus
  End If
End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  Dim c As Control
  
  ResetChienDeGarde
  If KeyCode = vbKeyF5 Then   ' Mémoire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set c = ActiveControl
          c = colMémoireLibErcem(ActiveControl.DataField)
          c.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each c In colChamps
        If Not c.Locked Then      ' On ne remplit pas les champs verrouillés
          c = colMémoireLibErcem(c.DataField)
        End If
      Next
    End If
  Else
    bdSél.KeyDown KeyCode
  End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  If Not bExisteTable(sTable) Then
    MsgBox "La table '" & sTable & "' n'est pas présente dans la base de données courante, affichage impossible.", vbCritical, App.Title
    Unload Me
    Exit Sub
  End If
  
  Show
  SetStatus "Chargement en cours, patientez…"
  If colColonnes.Count = 0 Then
    BDDécritTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  
  ' Pas de chargement des combos !
  
  
  
  ' Formulaire en mode initial
  Set cLEr = Nothing
  ActiveFormulaire False
  With bdSél
    .LectureSeule = bLectureSeule
    .ActiveMouvements False
    .ActiveValidation False
    .ButtonEnabled("Query") = True
    .ButtonEnabled("Add") = True
    .SetFocus
  End With
  
  ' On désactive tous les libellés internationaux
  Dim t As TextBox
  For Each t In txtLibellé
    BDActiveChamp t, False
  Next
  
  iMode = meEmpty
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
  If Not cLEr Is Nothing Then
    cLEr.CloseCurseur
    Set cLEr = Nothing
  End If
  
  MDIAdministration.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  Dim c As Control
  
  If cLEr Is Nothing Then
    EffaceFormulaire
  ElseIf cLEr.BOF And cLEr.EOF Then
    EffaceFormulaire
  Else
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cLEr.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cLEr.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    bdSél.NumRec = cLEr.AbsolutePosition
    
    ' On affiche les libellés
    For Each c In txtLibellé
      c.Text = ""
    Next
    ' Par défaut, les boutons supprimer sont invisibles
    For Each c In btnSupprimerLibellé
      c.Visible = False
    Next
  
    Dim cLib As New BDCurseur, iIndex As Integer
    cLib.OpenCurseur "select ler_langue,ler_libelle from libercem where ler_numler=" & sFormToSQL(colChamps("ler_numler"), BDTypeCHAR) & " and ler_application=" & sFormToSQL(colChamps("ler_application"), BDTypeCHAR)
    While Not cLib.EOF
      iIndex = InStr(1, sOrdreLangue, cLib!ler_langue) - 1
      If iIndex >= 0 And iIndex <= 5 Then
        txtLibellé(iIndex) = cLib!ler_libelle
        If iIndex > 0 Then btnSupprimerLibellé(iIndex).Visible = True
      End If
      cLib.MoveNext
    Wend
    cLib.CloseCurseur
    
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cLEr.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


Private Sub EffaceFormulaire()
  Dim c As Control
  
  For Each c In colChamps
    c.Text = ""
  Next
  bdSél.NumRec = ""
  
  ' On efface les libellés internationaux
  For Each c In txtLibellé
    c.Text = ""
  Next
  
  ' Les boutons supprimer sont invisibles
  For Each c In btnSupprimerLibellé
    c.Visible = False
  Next
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


'=================================================================================
' Ligne d'aide

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub txtLibellé_GotFocus(Index As Integer)
  AutoSelect txtLibellé(Index)
  SetStatus txtLibellé(Index).Tag
End Sub

Private Sub bdSél_GotFocus()
  SetStatus
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
  
  'On ne passe pas par BDCopieSélection cLEr, colChamps, bdSél
  
  If cLEr Is Nothing Then
    MsgBox "Effectuez une sélection avant de copier des données dans le presse-papiers.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim sData As String
  Dim t As Control, bFirst As Boolean
  Dim c As New BDCurseur
  
  Screen.MousePointer = vbHourglass
  
  ' On place les noms de colonnes dans le presse-papiers
  sData = "Code" & Chr(9) & "Application" & Chr(9) & "Description"
  Dim i As Integer
  For i = 1 To Len(sOrdreLangue)
    sData = sData & Chr(9) & "Libellé " & Mid(sOrdreLangue, i, 1)
  Next
  sData = sData & vbCrLf
  
  Dim sSQL As String
  sSQL = "select libercem.ler_numler, libercem.ler_application, libercem.ler_description, libercem.ler_libelle, " & _
" la.ler_libelle as liba," & _
" li.ler_libelle as libi," & _
" ld.ler_libelle as libd," & _
" le.ler_libelle as libe," & _
" lh.ler_libelle as libh" & _
" from libercem," & _
" outer libercem as la," & _
" outer libercem as li," & _
" outer libercem as ld," & _
" outer libercem as le," & _
" outer libercem as lh" & _
" where la.ler_numler=libercem.ler_numler and la.ler_application=libercem.ler_application and la.ler_langue='A' " & _
" and li.ler_numler=libercem.ler_numler and li.ler_application=libercem.ler_application and li.ler_langue='I' " & _
" and ld.ler_numler=libercem.ler_numler and ld.ler_application=libercem.ler_application and ld.ler_langue='D' " & _
" and le.ler_numler=libercem.ler_numler and le.ler_application=libercem.ler_application and le.ler_langue='E' " & _
" and lh.ler_numler=libercem.ler_numler and lh.ler_application=libercem.ler_application and lh.ler_langue='H' " & _
" and libercem.ler_langue='F' and libercem.ler_numler||libercem.ler_application in (select unique ler_numler||ler_application from libercem where " & sFinalWP & ") " & _
" order by ler_numler"
  
  Dim c1 As New BDCurseur
  c1.OpenCurseur sSQL
  If c1.EOF Then Stop
  
  c1.MoveFirst
  Do Until c1.EOF
    If c1.AbsolutePosition Mod 10 = 0 Then
      bdSél.NumRec = c1.AbsolutePosition
      bdSél.RefreshNumRec
      If c1.AbsolutePosition = 1000 Then
        MsgBox "Plus de 1000 enregistrements dans la sélection, seuls les 1000 premiers sont copiés.", vbInformation, App.Title
        Exit Do
      End If
    End If
    
    sData = sData & c1!ler_numler & Chr(9) & c1!ler_application & Chr(9) & c1!ler_description
    sData = sData & Chr(9) & c1!ler_libelle
    sData = sData & Chr(9) & c1!liba
    sData = sData & Chr(9) & c1!libi
    sData = sData & Chr(9) & c1!libd
    sData = sData & Chr(9) & c1!libe
    sData = sData & Chr(9) & c1!libh
    sData = sData & vbCrLf
    
    c1.MoveNext
  Loop
  c1.CloseCurseur
  
  cLEr.MoveFirst
  Clipboard.Clear
  Clipboard.SetText sData
  Screen.MousePointer = vbDefault

  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  Etat True
End Sub

Public Sub Aperçu()
  Etat False
End Sub

Private Sub Etat(ByVal bImpression As Boolean)
  Dim sSQL As String
  sSQL = "select * from libercem where " & sFinalWP & " order by ler_numler"
  BDEtat sSQL, drLibErcem, bImpression
End Sub


'=================================================================================
' Mémorisation

Public Sub Mémorise()
  EffaceCollection colMémoireLibErcem
  
  Dim t As Control
  For Each t In colChamps
    colMémoireLibErcem.Add (t), t.DataField
  Next
End Sub

