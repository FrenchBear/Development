VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmCR 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des Centres de R�ception"
   ClientHeight    =   4455
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8865
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmCentreDeR�ception.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   297
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   591
   Tag             =   "Donn�es"
   Begin FEUetFME.BDS�lecteur bdS�l 
      Height          =   435
      Left            =   0
      TabIndex        =   26
      Top             =   0
      Width           =   8835
      _ExtentX        =   15584
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "cr_tscreation"
      Height          =   315
      Index           =   11
      Left            =   6660
      TabIndex        =   25
      Tag             =   "Date+heure de cr�ation"
      Top             =   4080
      Width           =   2175
      _ExtentX        =   3836
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "cr_interloc"
      Height          =   315
      Index           =   10
      Left            =   2040
      TabIndex        =   17
      Tag             =   "Interlocuteur (Silliker)"
      Top             =   3000
      Width           =   4260
      _ExtentX        =   7514
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   40
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "cr_corresp"
      Height          =   315
      Index           =   9
      Left            =   2040
      TabIndex        =   15
      Tag             =   "Correspondant (chez le client)"
      Top             =   2640
      Width           =   4260
      _ExtentX        =   7514
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   49
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "cr_fax"
      Height          =   315
      Index           =   7
      Left            =   4200
      TabIndex        =   13
      Tag             =   "Fax"
      Top             =   2280
      Width           =   2100
      _ExtentX        =   3704
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   16
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "cr_tel"
      Height          =   315
      Index           =   6
      Left            =   2040
      TabIndex        =   12
      Tag             =   "Tel"
      Top             =   2280
      Width           =   2100
      _ExtentX        =   3704
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   16
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "cr_bdist"
      Height          =   315
      Index           =   5
      Left            =   3000
      TabIndex        =   10
      Tag             =   "Bureau distributeur"
      Top             =   1920
      Width           =   4560
      _ExtentX        =   8043
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   37
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "cr_cpost"
      Height          =   315
      Index           =   4
      Left            =   2040
      TabIndex        =   9
      Tag             =   "Code postal"
      Top             =   1920
      Width           =   900
      _ExtentX        =   1588
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   5
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "cr_rue"
      Height          =   315
      Index           =   3
      Left            =   2040
      TabIndex        =   5
      Tag             =   "Deuxi�me ligne d'adresse"
      Top             =   1200
      Width           =   6780
      _ExtentX        =   11959
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   41
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*cr_nom"
      Height          =   315
      Index           =   1
      Left            =   2040
      TabIndex        =   3
      Tag             =   "Premi�re ligne d'adresse"
      Top             =   840
      Width           =   6780
      _ExtentX        =   11959
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   41
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "cr_loc"
      Height          =   315
      Index           =   2
      Left            =   2040
      TabIndex        =   7
      Tag             =   "Troisi�me ligne d'adresse"
      Top             =   1560
      Width           =   6780
      _ExtentX        =   11959
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   41
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   2040
      TabIndex        =   23
      Tag             =   "Date+heure de derni�re modification de l'information"
      Top             =   4080
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
      DataField       =   "cr_idmodif"
      Height          =   315
      Index           =   12
      Left            =   2040
      TabIndex        =   21
      Tag             =   "Origine de la modification"
      Top             =   3720
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
      DataField       =   "cr_comment"
      Height          =   315
      Index           =   8
      Left            =   2040
      TabIndex        =   19
      Tag             =   "Commentaire libre quelconque"
      Top             =   3360
      Width           =   6780
      _ExtentX        =   11959
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*cr_numcr"
      Height          =   315
      Index           =   0
      Left            =   2040
      TabIndex        =   1
      Tag             =   "N� automatique du centre de r�ception"
      Top             =   480
      Width           =   675
      _ExtentX        =   1191
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Cr�� le :"
      Height          =   210
      Index           =   8
      Left            =   5220
      TabIndex        =   24
      Top             =   4140
      Width           =   810
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Interlocuteur :"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   16
      Top             =   3060
      Width           =   1365
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Correspondant :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   14
      Top             =   2700
      Width           =   1560
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Tel / Fax :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   11
      Top             =   2340
      Width           =   930
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "CPost / BDist :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   8
      Top             =   1980
      Width           =   1365
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Rue :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   495
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nom :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   22
      Top             =   4140
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   20
      Top             =   3780
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Commentaire :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   18
      Top             =   3420
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Localit� :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   6
      Top             =   1620
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "N� CR :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   690
   End
End
Attribute VB_Name = "frmCR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmCentreDeR�ception
' Gestion des Centres de R�ception
'  6/07/1998 PV
' 15/08/1998 PV BDActiveChamp
' 20/08/2000 PV Etat d'impression
' 14/12/2001 FF Historique des op�rations
' 17/12/2001 FF Menu de commandes contextuel

Option Explicit

Private cCR As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition

Private colhistorique As New Collection    ' Historique des modifications
Private Const sTable = "CR"

Private sFinalWP As String                ' Where-part de la requ�te SQL courante

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
  
  Dim cCRQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cCRQuery.OpenCurseur "select * from centrereception where " & sWP & " order by cr_numcr"
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "�chec lors de la requ�te" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    ActiveFormulaire True
    SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture �ventuelle du curseur en cours
  If Not cCR Is Nothing Then cCR.CloseCurseur
  Set cCR = cCRQuery
  sFinalWP = sWP
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cCR.EOF And cCR.BOF) Then
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
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Dim sType As String
  
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cCRAdd As New BDCurseur
  cCRAdd.OpenCurseur "select * from centrereception where cr_numcr=0"
  cCRAdd.AddNew
  cCRAdd!cr_idmodif = sBDIdModif
  cCRAdd!cr_tscreation = BDTime             ' Now + tOffsetNow
  cCRAdd!TimeStamp = cCRAdd!cr_tscreation   ' Now + tOffsetNow
  If Not bPr�pareEditAdd(cCRAdd, colColonnes, colChamps) Then cCRAdd.CloseCurseur: Exit Sub
  cCRAdd.CloseCurseur
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  ' On lit le max, faute de pouvoir obtenir le serial r�el�
  Dim iS�rie As Long
  iS�rie = BDCurseurExpress("select max(cr_numcr) from centrereception")

  sFinalWP = "cr_numcr=" & iS�rie
  If Not cCR Is Nothing Then cCR.CloseCurseur
  Set cCR = New BDCurseur
  cCR.OpenCurseur "select * from centrereception where " & sFinalWP
  cCR.MoveFirst
  
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
  JournalUnix sTable & " " & colChamps("cr_numcr"), "cr��", sMsgTrace
  
  ActiveFormulaire False
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
  Dim sType As String
  Assert iMode = meChange
  Assert Not cCR Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cCR.Edit
  cCR!cr_idmodif = sBDIdModif
  cCR!TimeStamp = BDTime            ' Now + tOffsetNow
  If Not bPr�pareEditAdd(cCR, colColonnes, colChamps) Then Exit Sub

 ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a �t� chang�
  If iMode = meChange Then
    Dim c As Control
    Dim sMsgTrace As String
    For Each c In Controls
      If DataFieldEx(c) <> "" Then
        If colhistorique(c.DataField) <> ValeurContr�le(c) Then  ' Modifi� !
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & c.DataField & ":" & colhistorique(c.DataField) & "->" & ValeurContr�le(c)
        End If
      End If
    Next
    If sMsgTrace <> "" Then
       JournalUnix sTable & " " & colChamps("cr_numcr"), "chang�", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
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
  
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub




Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  ActiveFormulaire False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cCR Is Nothing Then
    If Not (cCR.EOF And cCR.BOF) Then
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
  ActiveFormulaire True
  
  colChamps("cr_numcr").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cCR Is Nothing
  
  If cCR.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  If cCR!cr_numcr < 10 Then
    MsgBox "Vous ne pouvez pas modifier un centre de r�ception sp�cial (n�<10).", vbExclamation, App.Title
    If Not bShiftPressed Then Exit Sub
  End If
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "cr_numcr", False
  ActiveChamp "cr_idmodif", False
  ActiveChamp "timestamp", False
  ActiveChamp "cr_tscreation", False
  
  colChamps("cr_nom").SetFocus
  AutoSelect colChamps("cr_nom"), True
  bdS�l.TabStop = False
  
  iMode = meChange
  
  ' On m�morise les valeurs avant le changement
  EffaceCollection colhistorique
  Dim c As Control
  For Each c In Controls
    If DataFieldEx(c) <> "" Then
      colhistorique.Add ValeurContr�le(c), c.DataField
    End If
  Next
  
  SetMessage "Modifiez les valeurs affich�es, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  ActiveChamp "cr_numcr", False
  ActiveChamp "cr_idmodif", False
  ActiveChamp "cr_tscreation", False
  ActiveChamp "timestamp", False

  colChamps("cr_nom").SetFocus
  bdS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cCR Is Nothing

  If cCR.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  If cCR!cr_numcr < 10 Then
    MsgBox "Vous ne pouvez pas supprimer un centre de r�ception sp�cial (n�<10).", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNb As Long
  iNb = BDCurseurExpress("select count(*) from fmedest where fmd_numcr=" & cCR!cr_numcr)
  If iNb > 0 Then
    MsgBox "Vous ne pouvez pas supprimer ce centre de r�ception, il est utilis� " & iNb & " fois en tant que destinataire de centre de r�ception.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est d�finitif." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  ' On garde la trace de la destruction
  Dim sMsgTrace As String
  JournalUnix sTable & " " & colChamps("cr_numcr"), "d�truit", sMsgTrace

  Screen.MousePointer = vbHourglass
  SetStatus "Effacement en cours�"
  cCR.Delete
  cCR.MoveNext
  Screen.MousePointer = vbDefault
  SetStatus
  
    ' On place un enregistrement dans synchrodelete
  Dim cSD As New BDCurseur
  cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
  cSD.AddNew
  cSD!sd_table = "centrereception"
  cSD!sd_timestamp = BDTime             ' Now + tOffsetNow
  cSD!sd_wherepart = "cr_numcr=" & sFormToSQL(colChamps("cr_numcr"), BDTypeINTEGER)
  cSD.Update
  cSD.CloseCurseur

  ' On resynchronise le formulaire
  If cCR.EOF Then
    cCR.MovePrevious
    If cCR.BOF Then
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
  Assert Not cCR Is Nothing

  bdS�l.ButtonEnabled("First") = cCR.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cCR.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cCR.EOF
  bdS�l.ButtonEnabled("Last") = Not cCR.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cCR.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cCR.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cCR.MoveNext
  AjusteMouvements
  If cCR.EOF Then cCR.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cCR.MovePrevious
  AjusteMouvements
  If cCR.BOF Then cCR.MoveFirst
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

Private Sub bdS�l_GotFocus()
  SetStatus
End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  bdS�l.KeyDown KeyCode
End Sub

Private Sub Form_Keypress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
End Sub



'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  Show
  
  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable "centrereception", colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If
  
  
  ' Chargement des combos
  ' �
  
  ' Formulaire en mode initial
  Set cCR = Nothing
  ActiveFormulaire False
  With bdS�l
    .LectureSeule = bLectureSeule
    .ActiveMouvements False
    .ActiveValidation False
    .ButtonEnabled("Query") = True
    .ButtonEnabled("Add") = True
    .SetFocus
  End With
  
  sFinalWP = ""
  iMode = meEmpty
  SetMessage
  SetStatus
End Sub


Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
' Menu de commandes contextuel pour chaque feuille
If Button = 2 Then    ' Bouton droit
    PopupMenu MDIFEUetFME.mnuCommandes
  End If
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
  If Not cCR Is Nothing Then cCR.CloseCurseur
  MDIFEUetFME.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cCR Is Nothing Then
    EffaceFormulaire
  ElseIf cCR.BOF And cCR.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cCR.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cCR.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdS�l.NumRec = cCR.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cCR.bEffac� = True
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
  bdS�l.NumRec = ""
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

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub


Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "cr_nom" Then
    Dim txtNom As Control
    Set txtNom = txtChamp(Index)
    ' On convertit le code en majuscules
    If txtNom <> UCase(txtNom) Then
      Dim sStart As Integer, sLength As Integer
      sStart = txtNom.SelStart
      sLength = txtNom.SelLength
      txtNom = UCase(txtNom)
      txtNom.SelStart = sStart
      txtNom.SelLength = sLength
    End If
  End If
End Sub


'=================================================================================
' Acc�s au Web

Public Sub Fen�treWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=centrereception"
End Sub


'=================================================================================
' Copie des donn�es dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours�"
  BDCopieS�lection cCR, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  Etat True
End Sub

Public Sub Aper�u()
  Etat False
End Sub


Private Sub Etat(ByVal bImpression As Boolean)
  Dim sSQL As String
  sSQL = "select * from centrereception where " & sFinalWP & " order by cr_numcr"
  On Error Resume Next
  BDEtat sSQL, drCR, bImpression
End Sub


'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & "'"
  frmHistorique.AfficheHistorique sWP
End Sub

