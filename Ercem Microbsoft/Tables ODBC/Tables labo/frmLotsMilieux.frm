VERSION 5.00
Begin VB.Form frmLotMilieu 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Préparation des milieux"
   ClientHeight    =   5175
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
   Icon            =   "frmLotsMilieux.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   345
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   561
   Tag             =   "Données"
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_condition"
      Height          =   315
      Index           =   14
      Left            =   5580
      MaxLength       =   2
      TabIndex        =   23
      Tag             =   "Conditionnement (AP=Autopréparateur, BP=Boîte de Pétri, B=Bouteille, T=Tube)"
      Top             =   3720
      Width           =   495
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_dlu"
      Height          =   315
      Index           =   13
      Left            =   5580
      TabIndex        =   27
      Tag             =   "Date limite d'utilisation"
      Top             =   4080
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_numlotprepare"
      Height          =   315
      Index           =   12
      Left            =   1860
      TabIndex        =   21
      Tag             =   "N° de lot préparé (n° unique !)"
      Top             =   3720
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_autoprep"
      Height          =   315
      Index           =   11
      Left            =   1860
      TabIndex        =   17
      Tag             =   "Appareil de stérilisationP=Autopréparateur, AC=Autoclave, CA=Casserole)"
      Top             =   3000
      Width           =   1515
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_fournisseur"
      Height          =   315
      Index           =   10
      Left            =   1860
      TabIndex        =   9
      Tag             =   "Nom et référence du milieu chez le fournisseur"
      Top             =   1920
      Width           =   3555
   End
   Begin TablesLabo.BDCombo bdcMilieu 
      Height          =   330
      Left            =   1860
      TabIndex        =   7
      Tag             =   "Milieu stocké dans l'étuve"
      Top             =   1560
      Width           =   5655
      _ExtentX        =   9975
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
      DataField       =   "lot_milieu"
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_dateheure"
      Height          =   315
      Index           =   9
      Left            =   1860
      TabIndex        =   3
      Tag             =   "Date + heure de préparation du milieu"
      Top             =   840
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_testfertil"
      Height          =   315
      Index           =   8
      Left            =   5580
      TabIndex        =   31
      Tag             =   "Résultat du test de fertilité"
      Top             =   4440
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_ph"
      Height          =   315
      Index           =   5
      Left            =   1860
      TabIndex        =   25
      Tag             =   "pH du milieu"
      Top             =   4080
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_volumeeau"
      Height          =   315
      Index           =   7
      Left            =   5580
      TabIndex        =   15
      Tag             =   "Volume d'eau utilisé"
      Top             =   2640
      Width           =   1515
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_poidsbase"
      Height          =   315
      Index           =   6
      Left            =   1860
      TabIndex        =   13
      Tag             =   "Poids de base utilisé"
      Top             =   2640
      Width           =   1515
   End
   Begin TablesLabo.BDCombo bdcPers 
      Height          =   330
      Left            =   1860
      TabIndex        =   5
      Tag             =   "Code personne ayant préparé le milieu"
      Top             =   1200
      Width           =   5655
      _ExtentX        =   9975
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
      DataField       =   "lot_pers"
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_teststeril"
      Height          =   315
      Index           =   4
      Left            =   1860
      TabIndex        =   29
      Tag             =   "Résultat du test de stérilité"
      Top             =   4440
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_valsteril"
      Height          =   315
      Index           =   3
      Left            =   1860
      TabIndex        =   19
      Tag             =   "Informations sur la stérilisation"
      Top             =   3360
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_lotbase"
      Height          =   315
      Index           =   1
      Left            =   1860
      TabIndex        =   11
      Tag             =   "Lot de base déshydraté utilisé"
      Top             =   2280
      Width           =   3555
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   2
      Left            =   1860
      TabIndex        =   33
      Tag             =   "Timestamp de dernière modification des données"
      Top             =   4800
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_serie"
      Height          =   315
      Index           =   0
      Left            =   1860
      TabIndex        =   1
      Tag             =   "N° interne du lot de miieu (automatique)"
      Top             =   480
      Width           =   1035
   End
   Begin TablesLabo.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   34
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
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Conditionnement :"
      Height          =   210
      Index           =   15
      Left            =   3840
      TabIndex        =   22
      Top             =   3780
      Width           =   1755
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Date limite d'ut. :"
      Height          =   210
      Index           =   14
      Left            =   3840
      TabIndex        =   26
      Top             =   4140
      Width           =   1620
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "N° lot préparé :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   20
      Top             =   3780
      Width           =   1485
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Appareil :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   16
      Top             =   3060
      Width           =   900
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Fournisseur :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   8
      Top             =   1980
      Width           =   1245
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Milieu :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   6
      Top             =   1620
      Width           =   660
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Date + Heure :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   1410
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Test de fertilité :"
      Height          =   210
      Index           =   8
      Left            =   3840
      TabIndex        =   30
      Top             =   4500
      Width           =   1560
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Volume d'eau :"
      Height          =   210
      Index           =   7
      Left            =   3840
      TabIndex        =   14
      Top             =   2700
      Width           =   1410
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Poids de base :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   12
      Top             =   2700
      Width           =   1470
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Personne :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   1035
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "pH :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   24
      Top             =   4140
      Width           =   390
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Test de stérilité :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   28
      Top             =   4500
      Width           =   1605
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Stérilisation :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   18
      Top             =   3420
      Width           =   1245
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Lot de base :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   10
      Top             =   2340
      Width           =   1260
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   9
      Left            =   60
      TabIndex        =   32
      Top             =   4860
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
Attribute VB_Name = "frmLotMilieu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmLotsMilieux
' Feuille de gestion des lots de fabrication des milieux
' 16/02/1998 PV
'  7/07/1998 PV Copie de données dans le presse-papiers
' 15/08/1998 PV sAjusteMessageODBC, BDActiveChamp
' 22/12/1998 PV Ordre des champs dans colChamps
' 31/03/1999 PV Impressions
' 14/04/1999 PV Reprise plus complète, ajout du milieu (!)
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des déstructions et des créations

Option Explicit

Private cLot As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private sFinalWP As String                ' Where-part requête SQL courante
Private colChange As New Collection       ' Trace des modifications
Private coldétruit As New Collection      ' Trace de l'enregistrement qui va être détruit
Private colCréé As New Collection         ' Trace de la création de l'enregistrement

Private Const sTable = "c_lotmilieu"


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
  
  Dim cLotQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cLotQuery.OpenCurseur "select * from c_lotmilieu where " & sWP & " order by lot_serie"
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
  If Not cLot Is Nothing Then cLot.CloseCurseur
  Set cLot = cLotQuery
  sFinalWP = sWP
  
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  BDSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cLot.EOF And cLot.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a été sélectionné"
  End If
  BDSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  BDSél.SetFocus
End Sub


' Vérifie que les champs contiennent des valeurs légales
' Le contrôle des NULL et des types a déjà été fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer
  
  bOkValeurs = False
  
  bdcPers.Synchronise
  If InStr(bdcPers.FullText, bdcPers.Séparateur) = 0 Then
    MsgBox "Code personne inconnu !", vbExclamation, App.Title
    bdcPers.SetFocus
    Exit Function
  End If
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  Dim cLotAdd As New BDCurseur
  cLotAdd.OpenCurseur "select * from c_lotmilieu where lot_serie=0"
  cLotAdd.AddNew
  
  colChamps("lot_serie").Text = "0"
  If Not bPrépareEditAdd(cLotAdd, colColonnes, colChamps) Then
    cLotAdd.CloseCurseur
    Exit Sub
  End If
  cLotAdd.CloseCurseur
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cLot Is Nothing Then cLot.CloseCurseur
  Set cLot = New BDCurseur
  
  ' triche: pour récupérer un sérial, on lit le max…
  Dim cMax As New BDCurseur, iMax As Long
  cMax.OpenCurseur "select max(lot_serie) from c_lotmilieu"
  If cMax.EOF Then iMax = 1 Else iMax = cMax(0)
  cMax.CloseCurseur
  sFinalWP = "lot_serie=" & iMax
  cLot.OpenCurseur "select * from c_lotmilieu where " & sFinalWP
  cLot.MoveFirst
    
  ' On mémorise toutes les valeurs saisie par l'utilisateur
  EffaceCollection colCréé
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colCréé.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  ' Si on est en train d'ajouter un enregistrement, on recence ds l'historique la valeur des différents paramètres
  If iMode = meAdd Then
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        ' On enregistre uniquement si les champs ne sont pas vides
        If ValeurContrôle(C) <> "" Then
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colCréé(C.DataField)
        End If
      End If
    Next
    ' On enregistre dans le journal la trace de la création
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("lot_serie"), "créé", sMsgTrace
    End If
  End If
    
  ActiveFormulaire False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  
  BDSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  BDSél.EmpêcheMouvements
  
  SetMessage
  SetStatus
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cLot Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cLot.Edit
  If Not bPrépareEditAdd(cLot, colColonnes, colChamps) Then Exit Sub
  
  ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a été changé
  If iMode = meChange Then
    Dim C As Control
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        If colChange(C.DataField) <> ValeurContrôle(C) Then  ' Modifié !
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colChange(C.DataField) & "->" & ValeurContrôle(C)
        End If
      End If
    Next
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("lot_serie"), "changé", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  
  BDSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDSél.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub



Private Sub ActionValidate()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:   ValidateAdd
    Case meQuery: ValidateQuery
  End Select
End Sub





Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  ActiveFormulaire False
  BDSél.ActiveValidation False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cLot Is Nothing Then
    If Not (cLot.EOF And cLot.BOF) Then
      iMode = meNavigate
    End If
  End If
  BDSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub


'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  
  colChamps("lot_serie").SetFocus
  BDSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cLot Is Nothing
  
  If cLot.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "lot_serie", False
  ActiveChamp "timestamp", False
  
  colChamps("lot_dateheure").SetFocus
  AutoSelect colChamps("lot_dateheure"), True
  BDSél.TabStop = False
  
  iMode = meChange
  
  ' On mémorise les valeurs avant le changement
  EffaceCollection colChange
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colChange.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  ActiveChamp "timestamp", False
  ActiveChamp "lot_serie", False
  
  colChamps("lot_dateheure").Text = BDTime
  colChamps("lot_dateheure").SetFocus
  AutoSelect colChamps("lot_dateheure"), True
  BDSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cLot Is Nothing

  If cLot.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  ' Mémorisation de la trace de l'enregistrement qui va être détruit
  EffaceCollection coldétruit
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      coldétruit.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  ' Tri des données à conserver et placement ds la variable Smsgtrace
  Dim sMsgTrace As String
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContrôle(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & coldétruit(C.DataField)
         End If
      End If
  Next
  
  ' On répertorie l'enregistrement dans le journal avant la destructiuon definitive
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("lot_serie"), "détruit", sMsgTrace
  End If
  
  On Error Resume Next
  cLot.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cLot.MoveNext
  If cLot.EOF Then
    cLot.MovePrevious
    If cLot.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  BDSél.ActiveMouvements iMode = meNavigate
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cLot Is Nothing

  BDSél.ButtonEnabled("First") = cLot.AbsolutePosition <> 1
  BDSél.ButtonEnabled("Previous") = cLot.AbsolutePosition <> 1
  BDSél.ButtonEnabled("Next") = Not cLot.EOF
  BDSél.ButtonEnabled("Last") = Not cLot.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cLot.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cLot.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cLot.MoveNext
  AjusteMouvements
  If cLot.EOF Then cLot.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cLot.MovePrevious
  AjusteMouvements
  If cLot.BOF Then cLot.MoveFirst
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
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  BDSél.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then BDSél.KeyPress KeyAscii
End Sub
' Menu de commandes contextuel
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then    ' Bouton droit
    PopupMenu MDILabo.mnuCommandes
  End If
End Sub


Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "cev_evenement" Then
    Dim txtEvénement As TextBox
    Set txtEvénement = txtChamp(Index)
    ' On convertit les événements en majuscules
    If txtEvénement <> UCase(txtEvénement) Then
      Dim sStart As Integer, sLength As Integer
      sStart = txtEvénement.SelStart
      sLength = txtEvénement.SelLength
      txtEvénement = UCase(txtEvénement)
      txtEvénement.SelStart = sStart
      txtEvénement.SelLength = sLength
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

  
  ' Chargement des combos
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcPers.AddItem u.uti_numuti, u.uti_nom
  Next
  
  Dim cMil As New BDCurseur, sLibellé As String
  cMil.OpenCurseur "select mil_indice,mil_abrege,mil_libelle from milieu order by mil_indice"
  While Not cMil.EOF
    sLibellé = cMil!mil_libelle
    If cMil!mil_libelle <> cMil!mil_abrege Then sLibellé = sLibellé & " (" & cMil!mil_abrege & ")"
    bdcMilieu.AddItem cMil!mil_indice, sLibellé
    cMil.MoveNext
  Wend
  cMil.CloseCurseur

  
  
  ' Formulaire en mode initial
  Set cLot = Nothing
  ActiveFormulaire False
  BDSél.LectureSeule = bLectureSeule
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  BDSél.SetFocus
  
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
  If Not cLot Is Nothing Then cLot.CloseCurseur
  MDILabo.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cLot Is Nothing Then
    EffaceFormulaire
  ElseIf cLot.BOF And cLot.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cLot.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cLot.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    BDSél.NumRec = cLot.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cLot.bEffacé = True
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
  BDSél.NumRec = ""
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
' Clavier divers

Private Sub bdcPers_LostFocus()
  bdcPers.Synchronise
End Sub

Private Sub bdcMilieu_LostFocus()
  bdcMilieu.Synchronise
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

Private Sub bdcPers_GotFocus()
  SetStatus bdcPers.Tag
End Sub

Private Sub bdcMilieu_GotFocus()
  SetStatus bdcMilieu.Tag
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
  BDCopieSélection cLot, colChamps, BDSél
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
  sSQL = "select * from c_lotmilieu,milieu where mil_indice=lot_milieu and " & sFinalWP & " order by lot_serie"
  BDEtat sSQL, drLotMilieu, bImpression
End Sub


'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("lot_serie") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub



