VERSION 5.00
Begin VB.Form frmAnomalie 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des anomalies labo"
   ClientHeight    =   6555
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8415
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAnomalies.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   437
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   561
   Tag             =   "Donn�es"
   Begin TablesLabo.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   30
      Top             =   0
      Width           =   8415
      _ExtentX        =   14843
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
      DataField       =   "ano_tstraite"
      Height          =   315
      Index           =   9
      Left            =   1680
      TabIndex        =   25
      Tag             =   "Timestamp de derni�re modification des donn�es"
      Top             =   4980
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ano_desctraite"
      Height          =   735
      Index           =   7
      Left            =   1680
      MultiLine       =   -1  'True
      TabIndex        =   27
      Tag             =   "Description d�taill�e du traitement de l'anomalie"
      Top             =   5340
      Width           =   4995
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ano_tssignale"
      Height          =   315
      Index           =   6
      Left            =   1680
      TabIndex        =   11
      Tag             =   "Date+heure o� l'anomalie a �t� signal�e"
      Top             =   2340
      Width           =   2475
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ano_reference"
      Height          =   315
      Index           =   8
      Left            =   1680
      MaxLength       =   11
      TabIndex        =   5
      Tag             =   "R�f�rence de l'�chantillon, sans point ni espace"
      Top             =   1200
      Width           =   1755
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ano_serielabo"
      Height          =   315
      Index           =   4
      Left            =   1680
      MaxLength       =   6
      TabIndex        =   3
      Tag             =   "Num�ro de la s�rie (ou de la FSE) � laquelle est rattach�e l'anomalie"
      Top             =   840
      Width           =   1755
   End
   Begin TablesLabo.BDCombo bdcPers 
      Height          =   330
      Left            =   1680
      TabIndex        =   9
      Tag             =   "Code personne ayant signal� l'anomalie"
      Top             =   1980
      Width           =   4995
      _ExtentX        =   8811
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
      DataField       =   "*ano_perssignale"
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ano_description"
      Height          =   735
      Index           =   5
      Left            =   1680
      MultiLine       =   -1  'True
      TabIndex        =   21
      Tag             =   "Description d�taill�e de l'anomalie"
      Top             =   3780
      Width           =   4995
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ano_datesignale"
      Height          =   315
      Index           =   3
      Left            =   4980
      TabIndex        =   13
      Tag             =   "Date de l'anomalie"
      Top             =   2340
      Width           =   1695
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ano_titre"
      Height          =   315
      Index           =   1
      Left            =   1680
      TabIndex        =   19
      Tag             =   "Br�ve description de l'anomalie"
      Top             =   3420
      Width           =   4995
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   2
      Left            =   1680
      TabIndex        =   29
      Tag             =   "Timestamp de derni�re modification des donn�es"
      Top             =   6180
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ano_serie"
      Height          =   315
      Index           =   0
      Left            =   1680
      TabIndex        =   1
      Tag             =   "N� interne de l'anomalie"
      Top             =   480
      Width           =   855
   End
   Begin TablesLabo.BDCombo bdcEtat 
      Height          =   330
      Left            =   1680
      TabIndex        =   15
      Tag             =   "Etat d'avancement du traitement"
      Top             =   2700
      Width           =   4995
      _ExtentX        =   8811
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
      DataField       =   "*ano_etat"
   End
   Begin TablesLabo.BDCombo bdcTypeAnomalie 
      Height          =   330
      Left            =   1680
      TabIndex        =   17
      Tag             =   "Type cod� de l'anomalie"
      Top             =   3060
      Width           =   4995
      _ExtentX        =   8811
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
      DataField       =   "ano_type"
   End
   Begin TablesLabo.BDCombo bdcPersTrait� 
      Height          =   330
      Left            =   1680
      TabIndex        =   23
      Tag             =   "Code personne ayant trait� l'anomalie"
      Top             =   4620
      Width           =   4995
      _ExtentX        =   8811
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
      DataField       =   "ano_perstraite"
   End
   Begin TablesLabo.BDCombo bdcSection 
      Height          =   330
      Left            =   1680
      TabIndex        =   7
      Tag             =   "Code section du labo � l'anomalie a �t� signal�e"
      Top             =   1620
      Width           =   4995
      _ExtentX        =   8811
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
      DataField       =   "*ano_section"
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Date :"
      Height          =   210
      Index           =   2
      Left            =   4260
      TabIndex        =   12
      Top             =   2400
      Width           =   585
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Trait� le :"
      Height          =   210
      Index           =   15
      Left            =   60
      TabIndex        =   24
      Top             =   5040
      Width           =   900
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Trait� par :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   22
      Top             =   4680
      Width           =   1050
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Description :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   26
      Top             =   5400
      Width           =   1185
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Type :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   16
      Top             =   3120
      Width           =   585
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Etat :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   14
      Top             =   2760
      Width           =   525
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Date+Heure :"
      Height          =   210
      Index           =   8
      Left            =   60
      TabIndex        =   10
      Top             =   2400
      Width           =   1290
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Ref �chantillon :"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   1515
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "&FSE / S�rie :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   1155
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Signal� par :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   8
      Top             =   2040
      Width           =   1200
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Description :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   20
      Top             =   3840
      Width           =   1185
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Section :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   6
      Top             =   1680
      Width           =   825
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Titre :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   18
      Top             =   3480
      Width           =   555
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   9
      Left            =   60
      TabIndex        =   28
      Top             =   6240
      Width           =   1155
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Serial :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   660
   End
End
Attribute VB_Name = "frmAnomalie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmAnomalie
' Feuille de gestion des anomalies labo
' 13/02/1998 PV
'  5/05/1998 PV Nouveaux champs
'  7/07/1998 PV Copie de donn�es dans le presse-papiers
' 15/08/1998 PV sAjusteMessageODBC, BDActiveChamp
' 22/12/1998 PV Ordre des champs dans colChamps
' 31/03/1999 PV Impressions
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des d�structions et des cr�ations

Option Explicit

Private cAno As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire
Private sFinalWP As String                ' Where-part de la requ�te SQL courante

Private colChange As New Collection       ' Trace des modifications
Private cold�truit As New Collection      ' Trace de l'enregistrement qui va �tre d�truit
Private colCr�� As New Collection         ' Trace de la cr�ation de l'enregistrement

Private Const sTable As String = "c_anomalie"


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
  
  Dim cAnoQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cAnoQuery.OpenCurseur "select * from c_anomalie where " & sWP & " order by ano_serie"
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
  If Not cAno Is Nothing Then cAno.CloseCurseur
  Set cAno = cAnoQuery
  sFinalWP = sWP
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cAno.EOF And cAno.BOF) Then
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
  
  bdcSection.Synchronise
  If InStr(bdcSection.FullText, bdcSection.S�parateur) = 0 Then
    MsgBox "Code section inconnu !", vbExclamation, App.Title
    bdcSection.SetFocus
    Exit Function
  End If

  bdcPers.Synchronise
  If InStr(bdcPers.FullText, bdcSection.S�parateur) = 0 Then
    MsgBox "Code personne inconnu !", vbExclamation, App.Title
    bdcPers.SetFocus
    Exit Function
  End If

  bdcEtat.Synchronise
  If InStr(bdcEtat.FullText, bdcSection.S�parateur) = 0 Then
    MsgBox "Code �tat inconnu !", vbExclamation, App.Title
    bdcEtat.SetFocus
    Exit Function
  End If
  
  bdcTypeAnomalie.Synchronise
  bdcPersTrait�.Synchronise
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  Dim cAnoAdd As New BDCurseur
  cAnoAdd.OpenCurseur "select * from c_anomalie where ano_serie=0"
  cAnoAdd.AddNew

  colChamps("ano_serie").Text = "0"     ' S�rial
  If Not bPr�pareEditAdd(cAnoAdd, colColonnes, colChamps) Then
    cAnoAdd.CloseCurseur
    Exit Sub
  End If
  cAnoAdd.CloseCurseur
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cAno Is Nothing Then cAno.CloseCurseur
  Set cAno = New BDCurseur
  
  ' triche: pour r�cup�rer un s�rial, on lit le max�
  Dim cMax As New BDCurseur, iMax As Long
  cMax.OpenCurseur "select max(ano_serie) from c_anomalie"
  If cMax.EOF Then iMax = 1 Else iMax = cMax(0)
  cMax.CloseCurseur
  sFinalWP = "ano_serie=" & iMax
  cAno.OpenCurseur "select * from c_anomalie where " & sFinalWP
  cAno.MoveFirst
  
  ' On m�morise toutes les valeurs saisie par l'utilisateur
  EffaceCollection colCr��
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colCr��.Add ValeurContr�le(C), C.DataField
    End If
  Next
  
  ' Si on est en train d'ajouter un enregistrement, on recence ds l'historique la valeur des diff�rents param�tres
  If iMode = meAdd Then
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        ' On enregistre uniquement si les champs ne sont pas vides
        If ValeurContr�le(C) <> "" Then
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colCr��(C.DataField)
        End If
      End If
    Next
    ' On enregistre dans le journal la trace de la cr�ation
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("ano_serie"), "cr��", sMsgTrace
    End If
  End If
  
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
  Assert iMode = meChange
  Assert Not cAno Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cAno.Edit
  If Not bPr�pareEditAdd(cAno, colColonnes, colChamps) Then Exit Sub
  
  ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a �t� chang�
  If iMode = meChange Then
    Dim C As Control
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        If colChange(C.DataField) <> ValeurContr�le(C) Then  ' Modifi� !
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colChange(C.DataField) & "->" & ValeurContr�le(C)
        End If
      End If
    Next
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("ano_serie"), "chang�", sMsgTrace
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
  If Not cAno Is Nothing Then
    If Not (cAno.EOF And cAno.BOF) Then
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
  
  colChamps("ano_serie").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cAno Is Nothing
  
  If cAno.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "ano_serie", False
  ActiveChamp "timestamp", False
  
  colChamps("ano_serielabo").SetFocus
  AutoSelect colChamps("ano_serielabo"), True
  bdS�l.TabStop = False
  
  iMode = meChange
  
  ' On m�morise les valeurs avant le changement
  EffaceCollection colChange
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colChange.Add ValeurContr�le(C), C.DataField
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
  ActiveChamp "timestamp", False
  ActiveChamp "ano_serie", False
  
  colChamps("ano_datesignale").Text = Today
  colChamps("ano_tssignale").Text = Format(Now, "dd/mm/yyyy hh:mm:ss")
  
  colChamps("ano_serielabo").SetFocus
  AutoSelect colChamps("ano_serielabo"), True
  bdS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cAno Is Nothing

  If cAno.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est d�finitif." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  ' M�morisation de la trace de l'enregistrement qui va �tre d�truit
  EffaceCollection cold�truit
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      cold�truit.Add ValeurContr�le(C), C.DataField
    End If
  Next
  
  ' Tri des donn�es � conserver et placement ds la variable Smsgtrace
  Dim sMsgTrace As String
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContr�le(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & cold�truit(C.DataField)
         End If
      End If
  Next
  
  ' On r�pertorie l'enregistrement dans le journal avant la destructiuon definitive
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("ano_serie"), "d�truit", sMsgTrace
  End If
  
  On Error Resume Next
  cAno.Delete
  If Err Then
    AfficheErreurODBC "�chec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cAno.MoveNext
  If cAno.EOF Then
    cAno.MovePrevious
    If cAno.BOF Then
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
  Assert Not cAno Is Nothing

  bdS�l.ButtonEnabled("First") = cAno.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cAno.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cAno.EOF
  bdS�l.ButtonEnabled("Last") = Not cAno.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cAno.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
  cAno.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cAno.MoveNext
  AjusteMouvements
  If cAno.EOF Then cAno.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cAno.MovePrevious
  AjusteMouvements
  If cAno.BOF Then cAno.MoveFirst
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


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  bdS�l.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
End Sub
' Menu de commandes contextuel
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then    ' Bouton droit
    PopupMenu MDILabo.mnuCommandes
  End If
End Sub

Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "cev_evenement" Then
    Dim txtEv�nement As TextBox
    Set txtEv�nement = txtChamp(Index)
    ' On convertit les �v�nement en majuscules
    If txtEv�nement <> UCase(txtEv�nement) Then
      Dim sStart As Integer, sLength As Integer
      sStart = txtEv�nement.SelStart
      sLength = txtEv�nement.SelLength
      txtEv�nement = UCase(txtEv�nement)
      txtEv�nement.SelStart = sStart
      txtEv�nement.SelLength = sLength
    End If
  End If
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
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcPers.AddItem u.uti_numuti, u.uti_nom
    bdcPersTrait�.AddItem u.uti_numuti, u.uti_nom
  Next
  
  Dim s As Section
  For Each s In colSection
    bdcSection.AddItem s.sec_code, s.sec_libelle
  Next
  
  Dim t As TypeAnomalie
  For Each t In colTypeAnomalie
    bdcTypeAnomalie.AddItem t.ta_section & t.ta_code, t.ta_libelle
  Next
  
  bdcEtat.AddItem 0, "A traiter"
  bdcEtat.AddItem 1, "Traitement en cours"
  bdcEtat.AddItem 2, "Trait�"

  
  ' Formulaire en mode initial
  Set cAno = Nothing
  ActiveFormulaire False
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
  If Not cAno Is Nothing Then cAno.CloseCurseur
  MDILabo.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cAno Is Nothing Then
    EffaceFormulaire
  ElseIf cAno.BOF And cAno.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cAno.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cAno.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    bdS�l.NumRec = cAno.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cAno.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


Private Sub EffaceFormulaire()
  Dim C As Control
  For Each C In colChamps
    C.Text = ""
  Next
  bdS�l.NumRec = ""
End Sub


Private Sub ActiveFormulaire(bEnabled As Boolean)
  Dim C As Control
  For Each C In colChamps
    BDActiveChamp C, bEnabled
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

Private Sub bdS�l_GotFocus()
  SetStatus
End Sub

Private Sub bdcSection_GotFocus()
  SetStatus bdcSection.Tag
End Sub

Private Sub bdcSection_LostFocus()
  bdcSection.Synchronise
End Sub


Private Sub bdcPers_GotFocus()
  SetStatus bdcPers.Tag
End Sub

Private Sub bdcPers_LostFocus()
  bdcPers.Synchronise
End Sub


Private Sub bdcEtat_GotFocus()
  SetStatus bdcEtat.Tag
End Sub

Private Sub bdcEtat_LostFocus()
  bdcEtat.Synchronise
End Sub


Private Sub bdcTypeAnomalie_GotFocus()
  SetStatus bdcTypeAnomalie.Tag
End Sub

Private Sub bdcTypeAnomalie_LostFocus()
  bdcTypeAnomalie.Synchronise
End Sub


Private Sub bdcPersTrait�_GotFocus()
  SetStatus bdcPersTrait�.Tag
End Sub

Private Sub bdcPersTrait�_LostFocus()
  bdcPersTrait�.Synchronise
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
  BDCopieS�lection cAno, colChamps, bdS�l
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
  sSQL = "select * from c_anomalie where " & sFinalWP & " order by ano_serie"
  
  Dim iChoix As Integer
  iChoix = frmChoixEtatAnomalie.iChoix
  Select Case iChoix
    Case 1: BDEtat sSQL, drAnomalieTableau, bImpression
    Case 2: BDEtat sSQL, drAnomalieD�tail, bImpression
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
  sWP = "jou_domaine='" & sTable & " " & colChamps("ano_serie") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub


