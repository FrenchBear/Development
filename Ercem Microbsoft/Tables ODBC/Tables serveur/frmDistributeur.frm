VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmDistributeur 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des distributeurs"
   ClientHeight    =   3450
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   9120
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmDistributeur.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   230
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   608
   Tag             =   "Données"
   Begin VB.Frame frlTraçabilité 
      Caption         =   "Traçabilité"
      Height          =   1755
      Left            =   60
      TabIndex        =   10
      Top             =   1620
      Width           =   9015
      Begin TablesServeur.BDCombo bdcOperCreat 
         Height          =   330
         Left            =   3780
         TabIndex        =   14
         Top             =   240
         Width           =   5115
         _ExtentX        =   9022
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
         DataField       =   "dis_opercreat"
      End
      Begin TablesServeur.BDCombo bdcOperModif 
         Height          =   330
         Left            =   3780
         TabIndex        =   18
         Top             =   600
         Width           =   5115
         _ExtentX        =   9022
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
         DataField       =   "dis_opermodif"
      End
      Begin TablesServeur.BDCombo bdcOperValid 
         Height          =   330
         Left            =   3780
         TabIndex        =   21
         Top             =   960
         Width           =   5115
         _ExtentX        =   9022
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
         DataField       =   "dis_opervalid"
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   10
         Left            =   1680
         TabIndex        =   23
         Top             =   1320
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
         DataField       =   "dis_tsvalid"
         Height          =   315
         Index           =   9
         Left            =   1680
         TabIndex        =   20
         Top             =   960
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
         DataField       =   "dis_datecreat"
         Height          =   315
         Index           =   5
         Left            =   1680
         TabIndex        =   12
         Top             =   240
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "dis_heurecreat"
         Height          =   315
         Index           =   6
         Left            =   2760
         TabIndex        =   13
         Top             =   240
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "dis_datemodif"
         Height          =   315
         Index           =   7
         Left            =   1680
         TabIndex        =   16
         Top             =   600
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "dis_heuremodif"
         Height          =   315
         Index           =   8
         Left            =   2760
         TabIndex        =   17
         Top             =   600
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   120
         TabIndex        =   22
         Top             =   1380
         Width           =   1155
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Validé le :"
         Height          =   210
         Index           =   19
         Left            =   120
         TabIndex        =   19
         Top             =   1020
         Width           =   930
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Créé le :"
         Height          =   210
         Index           =   17
         Left            =   120
         TabIndex        =   11
         Top             =   300
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifié le :"
         Height          =   210
         Index           =   16
         Left            =   120
         TabIndex        =   15
         Top             =   660
         Width           =   1020
      End
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^*dis_nom"
      Height          =   315
      Index           =   3
      Left            =   1740
      MaxLength       =   41
      TabIndex        =   7
      Top             =   840
      Width           =   5055
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^dis_etat"
      Height          =   315
      Index           =   1
      Left            =   3360
      TabIndex        =   3
      Top             =   480
      Width           =   315
   End
   Begin TablesServeur.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   24
      Top             =   0
      Width           =   9120
      _ExtentX        =   16087
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
      DataField       =   "dis_origine"
      Height          =   315
      Index           =   2
      Left            =   4860
      TabIndex        =   5
      Top             =   480
      Width           =   4215
      _ExtentX        =   7435
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   30
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dis_comment"
      Height          =   315
      Index           =   4
      Left            =   1740
      TabIndex        =   9
      Top             =   1200
      Width           =   7335
      _ExtentX        =   12938
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*dis_numdis"
      Height          =   315
      Index           =   0
      Left            =   1740
      TabIndex        =   1
      Top             =   480
      Width           =   795
      _ExtentX        =   1402
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nom :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   6
      Top             =   900
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine :"
      Height          =   210
      Index           =   3
      Left            =   3960
      TabIndex        =   4
      Top             =   540
      Width           =   810
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Remarques :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   8
      Top             =   1260
      Width           =   1200
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "État :"
      Height          =   210
      Index           =   1
      Left            =   2700
      TabIndex        =   2
      Top             =   540
      Width           =   525
   End
   Begin VB.Label lblChamp 
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
Attribute VB_Name = "frmDistributeur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmDistributeur
' Feuille de gestion des distributeurs
' 01/06/1999 NC
'  6/08/1999 PV synchrodelete
' 23/08/1999 PV Normalisation du nom
'  4/11/1999 PV Etat assistant
'  8/02/2000 PV Avertissement avant le passage à l'état S
' 31/11/2001 FF Historique des modifications
' 03/12/2001 FF Historique des suppressions et des destructions
' 04/12/2001 FF Historique des créations
' 05/12/2001 FF Historique des récupérations d'enregistrement
'  8/12/2001 PV Méthodes globales


Option Explicit

Private cDis As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private colHistorique As New Collection   ' Trace des modifications pour l'historique

Private rDis As ADODB.Recordset           ' Liste de distributeurs chargée pour impression

Private Const sTable = "distrib"


'=================================================================================
' Méthodes globales implémentées par ce module, pour l'affichage du menu Commandes

Public Property Get sMéthodesGlobales() As String
  sMéthodesGlobales = "Historique,Récupère,AjouteWeb"
End Property

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
      If t.DataField = "dis_etat" Then bWPIntègreEtat = True
    End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = AvertissementLectureFichierComplet
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cDisQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from distrib where " & sWP
  If Not bWPIntègreEtat Then sQuery = sQuery & " and dis_etat is null"

  cDisQuery.OpenCurseur sQuery
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
  If Not cDis Is Nothing Then cDis.CloseCurseur
  Set cDis = cDisQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cDis.EOF And cDis.BOF) Then
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
  
  ' On regarde si le nom n'existe pas déjà
  Dim iSer As Long
  iSer = BDCurseurExpress("select dis_numdis from distrib where dis_nom=" & sFormToSQL(colChamps("dis_nom"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("dis_numdis") Then
    MsgBox "ATTENTION - Ce Distributeur existe déjà sous le n° " & iSer, vbExclamation, App.Title
    Exit Function
  End If
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  ' Génération du n° de série
  
  Dim cDistributeurAdd As New BDCurseur
  cDistributeurAdd.OpenCurseur "select * from distrib where dis_numdis=0"
  cDistributeurAdd.AddNew
  
  Dim cNumDis As New BDCurseur
  cNumDis.OpenCurseur "select max (dis_numdis) from distrib"
  colChamps("dis_numdis") = cNumDis.Fields(0) + 1
  cDistributeurAdd!dis_numdis = cNumDis.Fields(0) + 1
  cNumDis.CloseCurseur
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "dis", True
  
  ' Seuls les champs actifs sont mis à jour
  ActiveTraçabilité True
  ActiveChamp "dis_numdis", True
  
  If Not bPrépareEditAdd(cDistributeurAdd, colColonnes, colChamps) Then
    cDistributeurAdd.CloseCurseur
    ActiveTraçabilité False
    ActiveChamp "dis_numdis", False
    Exit Sub
  End If
  cDistributeurAdd.CloseCurseur
  
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cDis Is Nothing Then cDis.CloseCurseur
  Set cDis = New BDCurseur
  
  sFinalWP = "dis_numdis=" & colChamps("dis_numdis")
  sQuery = "select * from distrib where " & sFinalWP
  cDis.OpenCurseur sQuery
  cDis.MoveFirst
  
  
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
  JournalUnix sTable & " " & colChamps("dis_numdis"), "créé", sMsgTrace
  
  
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
  Assert Not cDis Is Nothing
  
  If colChamps("dis_nom") <> sNormaliseNom(colChamps("dis_nom")) Then
    colChamps("dis_nom") = sNormaliseNom(colChamps("dis_nom"))
    MsgBox "Attention, le nom a été modifié pour correspondre aux règles générales de créations de nom (pas d'espaces en double, nom en majuscules, le É est la seule majuscule accentuée acceptée).", vbInformation, App.Title
  End If

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cDis.Edit
      
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "dis", False
  ActiveTraçabilité True     ' Pour mettre à jour la base
    
  If Not bPrépareEditAdd(cDis, colColonnes, colChamps) Then
    ActiveTraçabilité False
    Exit Sub
  End If
  
  ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a été changé
  If iMode = meChange Then
    Dim c As Control
    Dim sMsgTrace As String
    For Each c In Controls
      If DataFieldEx(c) <> "" Then
        If colHistorique(c.DataField) <> ValeurContrôle(c) Then  ' Modifié !
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & c.DataField & ":" & colHistorique(c.DataField) & "->" & ValeurContrôle(c)
        End If
      End If
    Next
    If sMsgTrace <> "" Then
       JournalUnix sTable & " " & colChamps("dis_numdis"), "changé", sMsgTrace
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
 
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub





Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  BDActiveFormulaire colChamps, False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cDis Is Nothing Then
    If Not (cDis.EOF And cDis.BOF) Then
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
  
  colChamps("dis_numdis").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cDis Is Nothing
  
  If cDis.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If

  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True

  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "dis_numdis", False
  ActiveChamp "dis_etat", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False


  colChamps("dis_origine").SetFocus
  AutoSelect colChamps("dis_origine"), True
  bdSél.TabStop = False

  iMode = meChange
  
  ' On mémorise les valeurs avant le changement
  EffaceCollection colHistorique
  Dim c As Control
  For Each c In Controls
    If DataFieldEx(c) <> "" Then
      colHistorique.Add ValeurContrôle(c), c.DataField
    End If
  Next
 
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
  ActiveChamp "dis_numdis", False
  ActiveChamp "dis_etat", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  colChamps("dis_origine").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub AjouteWeb()
  
  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'opération en cours avant de faire un ajout Web !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim vReq As Variant
  vReq = InputBox("N° de la requête Web d'ajout ?")
  If vReq = "" Or Not IsNumeric(vReq) Then Exit Sub
  
  Dim cWeb As New BDCurseur
  cWeb.OpenCurseur "select crd_serie, crd_etat, crd_origine, crd_operation, crd_libelle, crd_numdis, crd_comment" & _
  " from credis where crd_serie=" & vReq
  If cWeb.EOF Then
    MsgBox "Requête inconnue, ajout interrompu.", vbExclamation, App.Title
    Exit Sub
  End If

  If cWeb!crd_operation <> "C" Then
    MsgBox "Il ne s'agit pas d'une requête de création, ajout interrompu.", vbExclamation, App.Title
    Exit Sub
  End If

  ActionAdd
  colChamps("dis_origine") = "Web " & cWeb!crd_serie & ": " & NV(cWeb!crd_origine)
  colChamps("dis_nom") = sNormaliseNom(NV(cWeb!crd_libelle))
  colChamps("dis_comment") = NV(cWeb!crd_comment)
  
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cDis Is Nothing
  
  If cDis.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  If bShiftPressed Then
    ActionDétruit             ' Détruit l'enregistrement
  Else
    ActionSupprime            ' Marque l'enregistrement supprimé (état S)
  End If
End Sub


Public Sub ActionSupprime()   ' Marque l'enregistrement supprimé (état S)
  If colChamps("dis_etat") <> "" Then
    MsgBox "Déjà supprimé (état S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, vous allez basculer l'enregistrement à l'état S (supprimé)." & vbCrLf & "Vous pourrez ultérieurement restaurer l'enregistrement à l'état normal en choisissant le menu Commandes, Récupère un enregistrement supprimé." & vbCrLf & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  cDis.Edit
  cDis!dis_etat = "S"
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "dis", False
  ActiveTraçabilité True     ' Pour mettre à jour la base
  bPrépareEditAdd cDis, colColonnes, colChamps
  ActiveTraçabilité False
  
  ' On spécifie dans l'historique des modifications que le numéro X est passé à l'état de supprimé
  Dim sMsgTrace As String
  sMsgTrace = colChamps("dis_numdis") & " -> Etat S"
    If cDis!dis_etat = "S" Then
       If sMsgTrace <> "" Then
          JournalUnix sTable & " " & colChamps("dis_numdis"), "supprimé", sMsgTrace
       End If
    End If
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub


Public Sub Récupère()   ' Récupère un enregistrement supprimé (état S)
  If colChamps("dis_etat") <> "S" Then
    MsgBox "Vous ne pouvez récupérer qu'un enregistrement supprimé (état S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  cDis.Edit
  cDis!dis_etat = Null
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "dis", False
  ActiveTraçabilité True     ' Pour mettre à jour la base
  bPrépareEditAdd cDis, colColonnes, colChamps
  ActiveTraçabilité False
  
  ' Si on veut récupérer, on le mentionne ds l'historique
  Dim sMsgTrace As String
  sMsgTrace = colChamps("dis_numdis") & " -> Récup"
  If sMsgTrace <> "" Then
        JournalUnix sTable & " " & colChamps("dis_numdis"), "récupéré", sMsgTrace
  End If
  
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub

  
Public Sub ActionDétruit()    ' Détruit l'enregistrement
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  If colChamps("dis_etat") <> "S" Then
    MsgBox "Vous ne pouvez pas détruire un enregistrement sans l'avoir au préalable supprimé (état S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  ' Historique
  Dim sMsgTrace As String
  Dim c As Control
  For Each c In Controls
    If DataFieldEx(c) <> "" Then
      If ValeurContrôle(c) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & c.DataField & ":" & ValeurContrôle(c)
         End If
      End If
  Next
  
  On Error Resume Next
  cDis.Delete
  If Err Then
    AfficheErreurODBC "Échec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0

  ' On garde la trace de la destruction
  JournalUnix sTable & " " & colChamps("dis_numdis"), "détruit", sMsgTrace
  
  ' On place un enregistrement dans synchrodelete
  Dim cSD As New BDCurseur
  cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
  cSD.AddNew
  cSD!sd_table = sTable
  cSD!sd_timestamp = BDTime    ' Now + tOffsetNow
  cSD!sd_wherepart = "dis_numdis=" & sFormToSQL(colChamps("dis_numdis"), BDTypeINTEGER)
  cSD.Update
  cSD.CloseCurseur

  
  cDis.MoveNext
  If cDis.EOF Then
    cDis.MovePrevious
    If cDis.BOF Then
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
  ActiveChamp "dis_datecreat", bEnable
  ActiveChamp "dis_heurecreat", bEnable
  ActiveChamp "dis_opercreat", bEnable
  ActiveChamp "dis_datemodif", bEnable
  ActiveChamp "dis_heuremodif", bEnable
  ActiveChamp "dis_opermodif", bEnable
  ActiveChamp "dis_tsvalid", bEnable
  ActiveChamp "dis_opervalid", bEnable
End Sub

'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cDis Is Nothing

  bdSél.ButtonEnabled("First") = cDis.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cDis.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cDis.EOF
  bdSél.ButtonEnabled("Last") = Not cDis.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cDis.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cDis.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cDis.MoveNext
  AjusteMouvements
  If cDis.EOF Then cDis.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cDis.MovePrevious
  AjusteMouvements
  If cDis.BOF Then cDis.MoveFirst
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
  ResetChienDeGarde
  bdSél.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
End Sub
' Menu de commandes contextuel
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then    ' Bouton droit
    PopupMenu MDIServeur.mnuCommandes
  End If
End Sub

' Filtrage des Entrée intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
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
0
  
  ' Chargement des combos
  
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcOperCreat.AddItem u.uti_numuti, u.uti_nom
    bdcOperModif.AddItem u.uti_numuti, u.uti_nom
    bdcOperValid.AddItem u.uti_numuti, u.uti_nom
  Next

  
  ' Formulaire en mode initial
  Set cDis = Nothing
  BDActiveFormulaire colChamps, False
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
  If Not cDis Is Nothing Then cDis.CloseCurseur
  MDIServeur.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub

' Aide des options
Private Sub lblOptions_Click(Index As Integer)
  If Index = 1 Then
    FileShellExecute hWnd, "http://www.silliker/microbsoft/serveur/optedcra.htm"
  Else
    FileShellExecute hWnd, "http://www.silliker/microbsoft/serveur/optlabo.htm"
  End If
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
'  ActiveTimer mtStop
  If cDis Is Nothing Then
    EffaceFormulaire
  ElseIf cDis.BOF And cDis.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cDis.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cDis.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cDis.AbsolutePosition
'    ActiveTimer mtRapide      ' Mise à jour en arrière plan
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cDis.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


'
'' Champs satellites sur timer
'Private Sub timSatellites_Timer()
'  ActiveTimer mtStop
'
'  'NC
'  '  If bdcGroupe.ListIndex < 0 Then
'  '   SynchroGroupe
'  '  End If
'End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  bdSél.NumRec = ""
End Sub

'
'' Activation du timer de mise à jour des champs satellites
'Private Sub ActiveTimer(mtMode As eModeTimer)
'  Select Case mtMode
'    Case mtStop:    timSatellites.Enabled = False
'    Case mtLent:    timSatellites.Interval = 1000:  timSatellites.Enabled = True
'    Case mtRapide:  timSatellites.Interval = 250:   timSatellites.Enabled = True
'  End Select
'End Sub


Private Sub ActiveChamp(ByVal sChamp As String, bEnabled As Boolean)
  BDActiveChamp colChamps(sChamp), bEnabled
End Sub


'=================================================================================
' Ligne d'aide

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub txtChampVB_GotFocus(Index As Integer)
  AutoSelect txtChampVB(Index)
  SetStatus txtChampVB(Index).Tag
End Sub

Private Sub bdSél_GotFocus()
  SetStatus
End Sub

Private Sub bdcOperCreat_GotFocus()
  SetStatus bdcOperCreat.Tag
End Sub

Private Sub bdcOperModif_GotFocus()
  SetStatus bdcOperModif.Tag
End Sub

Private Sub bdcOperValid_GotFocus()
  SetStatus bdcOperValid.Tag
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
  BDCopieSélection cDis, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
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
  iChoix = 1
  iChoix = frmMessageChoix.ChoixEtat("Liste par n°", "Assistant")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
  Exit Sub
  
pb:
  intlMessageErreurEtat
End Sub


Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Select Case iChoix
    Case 1:
'      Dim sSQL As String, sSQLTête As String, sSQLCorps As String
'      sSQLTête = "select unique dis_numdis,dis_nom from distrib where " & sFinalWP
'      sSQLCorps = "select * from distrib where " & sFinalWP
'      sSQL = "SHAPE {" & sSQLTête & "} AS Tête APPEND ({" & sSQLCorps & "} AS Corps RELATE 'dis_numdis' TO 'dis_numdis') AS Corps"
      Dim sSQL As String
      sSQL = "select * from distrib where " & sFinalWP & " order by dis_numdis"
      On Error Resume Next
      BDEtat sSQL, drDisSimple, bImpression
      
    Case 2:
      ChargeDistributeurs
      DoFormatageFabDis rDis, True, bImpression, Me, 2
      rDis.Close
      Set rDis = Nothing
      SynchroniseFormulaire

  End Select
End Sub

' Callback de l'aperçu avant impression
Public Sub PrintReport(ByVal iChoix As Integer)
  Etat iChoix, True
End Sub


' Remplit le recordset rDis avec les distributeurs sélectionnés
Private Sub ChargeDistributeurs()
  Screen.MousePointer = vbHourglass
  SetStatus "Lecture des enregistrements, patientez..."
  
  ' On récupère les données
  Set rDis = New ADODB.Recordset
  
  rDis.Fields.Append "num", adInteger
  rDis.Fields.Append "nom", adVarChar, 60      ' adVariant
  rDis.Open
  
  EffaceFormulaire
  Refresh
  cDis.MoveFirst

  Dim cDis2 As New BDCurseur
  cDis2.OpenCurseur "select dis_numdis,dis_nom from distrib where " & sFinalWP
  cDis2.MoveFirst
  
  Do Until cDis2.EOF
    If cDis2.AbsolutePosition Mod 10 = 0 Then
      bdSél.NumRec = cDis2.AbsolutePosition
      bdSél.RefreshNumRec
    End If
    
    rDis.AddNew
    rDis!num = cDis2!dis_numdis
    rDis!nom = cDis2!dis_nom
    
    cDis2.MoveNext
  Loop
  cDis2.CloseCurseur
  SetStatus
  Screen.MousePointer = vbDefault
End Sub




'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("dis_numdis") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub
