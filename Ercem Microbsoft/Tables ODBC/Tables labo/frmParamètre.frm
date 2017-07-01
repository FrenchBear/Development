VERSION 5.00
Begin VB.Form frmParamètre 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des paramètres"
   ClientHeight    =   6255
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   7575
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmParamètre.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   417
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   505
   Tag             =   "Données"
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_nbdecimales"
      Height          =   315
      Index           =   25
      Left            =   4980
      TabIndex        =   33
      Top             =   3720
      Width           =   435
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_rubfac"
      Height          =   315
      Index           =   24
      Left            =   4980
      TabIndex        =   37
      Top             =   4080
      Width           =   855
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "^ger_etat"
      Height          =   315
      Index           =   23
      Left            =   7080
      TabIndex        =   5
      Tag             =   "Code auchan (voir charte Auchan)"
      Top             =   480
      Width           =   435
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_labo"
      Height          =   315
      Index           =   22
      Left            =   1560
      TabIndex        =   19
      Top             =   2280
      Width           =   1395
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_upc"
      Height          =   315
      Index           =   21
      Left            =   1560
      TabIndex        =   36
      Top             =   4080
      Width           =   855
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_format"
      Height          =   315
      Index           =   20
      Left            =   1560
      TabIndex        =   32
      Top             =   3720
      Width           =   1395
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_traitepar"
      Height          =   315
      Index           =   19
      Left            =   4980
      TabIndex        =   20
      Top             =   2280
      Width           =   1395
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_formule"
      Height          =   315
      Index           =   18
      Left            =   1560
      TabIndex        =   30
      Top             =   3360
      Width           =   5955
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_rattachement"
      Height          =   315
      Index           =   17
      Left            =   4980
      TabIndex        =   28
      Top             =   3000
      Width           =   435
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_classe"
      Height          =   315
      Index           =   16
      Left            =   1560
      TabIndex        =   26
      Top             =   3000
      Width           =   855
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "^ger_type"
      Height          =   315
      Index           =   15
      Left            =   4980
      TabIndex        =   24
      Top             =   2640
      Width           =   435
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_nature"
      Height          =   315
      Index           =   13
      Left            =   1560
      TabIndex        =   22
      Top             =   2640
      Width           =   855
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_unitebase"
      Height          =   315
      Index           =   12
      Left            =   1560
      TabIndex        =   15
      Tag             =   "Unité de base (%, g/l, ...)"
      Top             =   1920
      Width           =   1395
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_equivalent"
      Height          =   315
      Index           =   11
      Left            =   1560
      TabIndex        =   9
      Top             =   1200
      Width           =   5955
   End
   Begin TablesLabo.BDCombo bdcOperModif 
      Height          =   330
      Left            =   3720
      TabIndex        =   47
      Top             =   5160
      Width           =   3795
      _ExtentX        =   6694
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
      DataField       =   "ger_opermodif"
   End
   Begin TablesLabo.BDCombo bdcOperCreat 
      Height          =   330
      Left            =   3720
      TabIndex        =   43
      Top             =   4800
      Width           =   3795
      _ExtentX        =   6694
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
      DataField       =   "ger_opercreat"
   End
   Begin TablesLabo.BDCombo bdcLangue 
      Height          =   330
      Left            =   3840
      TabIndex        =   3
      Top             =   480
      Width           =   2175
      _ExtentX        =   3836
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
      DataField       =   "^*ger_langue"
   End
   Begin TablesLabo.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   52
      Top             =   0
      Width           =   7575
      _ExtentX        =   13361
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
      DataField       =   "ger_idmodif"
      Height          =   315
      Index           =   10
      Left            =   1560
      TabIndex        =   49
      Tag             =   "Origine de la modification"
      Top             =   5520
      Width           =   3750
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_heuremodif"
      Height          =   315
      Index           =   9
      Left            =   2940
      TabIndex        =   46
      Tag             =   "Heure de dernière modification"
      Top             =   5160
      Width           =   735
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_datemodif"
      Height          =   315
      Index           =   8
      Left            =   1560
      TabIndex        =   45
      Tag             =   "Date de dernière modification"
      Top             =   5160
      Width           =   1335
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_heurecreat"
      Height          =   315
      Index           =   7
      Left            =   2940
      TabIndex        =   42
      Tag             =   "Heure de création"
      Top             =   4800
      Width           =   735
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_datecreat"
      Height          =   315
      Index           =   6
      Left            =   1560
      TabIndex        =   41
      Tag             =   "Date de création"
      Top             =   4800
      Width           =   1335
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_auchan"
      Height          =   315
      Index           =   5
      Left            =   4980
      TabIndex        =   17
      Top             =   1920
      Width           =   435
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_abregelabo"
      Height          =   315
      Index           =   4
      Left            =   4980
      TabIndex        =   13
      Top             =   1560
      Width           =   1395
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_abrege"
      Height          =   315
      Index           =   3
      Left            =   1560
      TabIndex        =   11
      Top             =   1560
      Width           =   1395
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   1560
      TabIndex        =   51
      Tag             =   "Date+heure de dernière modification de l'information"
      Top             =   5880
      Width           =   2175
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_comment"
      Height          =   315
      Index           =   2
      Left            =   1560
      TabIndex        =   39
      Top             =   4440
      Width           =   5955
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ger_libelle"
      Height          =   315
      Index           =   1
      Left            =   1560
      TabIndex        =   7
      Top             =   840
      Width           =   5955
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ger_indice"
      Height          =   315
      Index           =   0
      Left            =   1560
      TabIndex        =   1
      Tag             =   "Code interne du paramètre"
      Top             =   480
      Width           =   1035
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nb décimales :"
      Height          =   210
      Index           =   24
      Left            =   3480
      TabIndex        =   54
      Top             =   3780
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Rub de fact :"
      Height          =   210
      Index           =   23
      Left            =   3480
      TabIndex        =   53
      Top             =   4140
      Width           =   1200
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Etat :"
      Height          =   210
      Index           =   22
      Left            =   6360
      TabIndex        =   4
      Top             =   540
      Width           =   525
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Labo :"
      Height          =   210
      Index           =   21
      Left            =   60
      TabIndex        =   18
      Top             =   2340
      Width           =   600
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "UPC :"
      Height          =   210
      Index           =   20
      Left            =   60
      TabIndex        =   35
      Top             =   4140
      Width           =   525
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Format :"
      Height          =   210
      Index           =   19
      Left            =   60
      TabIndex        =   31
      Top             =   3780
      Width           =   795
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Traité par :"
      Height          =   210
      Index           =   18
      Left            =   3480
      TabIndex        =   34
      Top             =   2340
      Width           =   1050
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Formule :"
      Height          =   210
      Index           =   17
      Left            =   60
      TabIndex        =   29
      Top             =   3420
      Width           =   885
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Rattachement :"
      Height          =   210
      Index           =   16
      Left            =   3480
      TabIndex        =   27
      Top             =   3060
      Width           =   1455
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Classe :"
      Height          =   210
      Index           =   15
      Left            =   60
      TabIndex        =   25
      Top             =   3060
      Width           =   765
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Type :"
      Height          =   210
      Index           =   12
      Left            =   3480
      TabIndex        =   23
      Top             =   2700
      Width           =   585
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nature :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   21
      Top             =   2700
      Width           =   780
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Unité de base :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   14
      Top             =   1980
      Width           =   1455
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Equivalent :"
      Height          =   210
      Index           =   9
      Left            =   60
      TabIndex        =   8
      Top             =   1260
      Width           =   1125
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   48
      Top             =   5580
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Modifié le :"
      Height          =   210
      Index           =   8
      Left            =   60
      TabIndex        =   44
      Top             =   5220
      Width           =   1020
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Créé le :"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   40
      Top             =   4860
      Width           =   810
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Abrégé labo :"
      Height          =   210
      Index           =   6
      Left            =   3480
      TabIndex        =   12
      Top             =   1620
      Width           =   1275
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Auchan :"
      Height          =   210
      Index           =   5
      Left            =   3480
      TabIndex        =   16
      Top             =   1980
      Width           =   825
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Langue :"
      Height          =   210
      Index           =   4
      Left            =   2880
      TabIndex        =   2
      Top             =   540
      Width           =   840
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Abrégé :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   10
      Top             =   1620
      Width           =   810
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   50
      Top             =   5940
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Commentaire :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   38
      Top             =   4500
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Libellé :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   6
      Top             =   900
      Width           =   735
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Indice :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   705
   End
End
Attribute VB_Name = "frmParamètre"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmParamètre
' Feuille de gestion des germes
' 16/02/1998 PV
'  7/07/1998 PV Copie de données dans le presse-papiers
' 15/08/1998 PV sAjusteMessageODBC, BDActiveChamp
' 22/12/1998 PV Ordre des champs dans colChamps
' 31/03/1999 PV Impression
' 18/10/2000 NC Fusion avec la table paramètres -> nouveau nom paramètre
' 24/10/2000 NC Ajout du champ etat, modid des proc Supprime, Détruit, Delete
' 27/05/2001 PV Champ ger_abregelabo obligatoire uniquement pour les paramètres <=900 en val absolue (ne concerne pas les paramètres de chimie)
' 27/05/2001 PV Mémorisation; Contrôles sur le type F/champ formule rempli
' 31/11/2001 FF Historique des modifications
' 03/11/2001 FF Historique des suppressions
' 04/12/2001 FF Historique des déstructions et des créations
' 05/12/2001 FF Historique des récupérations d'enregistrement

Option Explicit

Private cGer As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private sFinalSQL As String               ' Requête SQL courante
Private colChange As New Collection       ' Trace des modifications
Private coldétruit As New Collection      ' Trace de l'enregistrement qui va être détruit
Private colCréé As New Collection         ' Trace de la création de l'enregistrement

Private Const sTable = "germe"


'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim bWPIntègreEtat As Boolean
  bWPIntègreEtat = False

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
      If t.DataField = "ger_etat" Then bWPIntègreEtat = True
    End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  If Not bWPIntègreEtat Then sWP = sWP & " and ger_etat is null"
  
  Dim cGerQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from germe where " & sWP & " order by ger_indice"
  cGerQuery.OpenCurseur sSQL
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
  If Not cGer Is Nothing Then cGer.CloseCurseur
  Set cGer = cGerQuery
  sFinalSQL = sSQL
  
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  BDSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cGer.EOF And cGer.BOF) Then
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
  
  bdcLangue.Synchronise
  If InStr(bdcLangue.FullText, bdcLangue.Séparateur) = 0 Then
    MsgBox "Code langue inconnu !", vbExclamation, App.Title
    bdcLangue.SetFocus
    Exit Function
  End If
  
  If IsNumeric(colChamps("ger_indice").Text) Then
    If Abs(colChamps("ger_indice").Text) < 900 Then
      If colChamps("ger_abregelabo") = "" Then
        MsgBox "Code abrégé labo obligatoire pour les paramètres <=900", vbExclamation, App.Title
        colChamps("ger_abregelabo").SetFocus
        Exit Function
      End If
    End If
  End If
  
  If colChamps("ger_type").Text = "F" And colChamps("ger_formule").Text = "" Then
    MsgBox "Si le paramètre est de type F (formule), le champ formule doit être rempli.", vbExclamation, App.Title
    colChamps("ger_formule").SetFocus
    Exit Function
  End If
  
  If colChamps("ger_formule").Text <> "" And colChamps("ger_type").Text <> "F" Then
    MsgBox "Si le champ formule est rempli, alors le type du paramètre doit être F (formule).", vbExclamation, App.Title
    colChamps("ger_type").SetFocus
    Exit Function
  End If
  
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  Dim cGerAdd As New BDCurseur
  cGerAdd.OpenCurseur "select * from germe where ger_indice=0"
  cGerAdd.AddNew
  
  ' Traçabilité ancien style
  colChamps("ger_datecreat") = Today
  colChamps("ger_heurecreat") = 100 * Hour(Now) + Minute(Now)
  colChamps("ger_opercreat") = iNumOpérateur
  colChamps("ger_datemodif") = Today
  colChamps("ger_heuremodif") = 100 * Hour(Now) + Minute(Now)
  colChamps("ger_opermodif") = iNumOpérateur
  
  ActiveTraçabilité True    ' Pour que la base soit mise à jour
  
  If Not bPrépareEditAdd(cGerAdd, colColonnes, colChamps) Then
    cGerAdd.CloseCurseur
    ActiveTraçabilité False
    Exit Sub
  End If
  
  cGerAdd.CloseCurseur
  
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cGer Is Nothing Then cGer.CloseCurseur
  Set cGer = New BDCurseur
  sFinalSQL = "select * from germe where ger_indice=" & sFormToSQL(colChamps("ger_indice"), BDTypeINTEGER) & " and ger_langue=" & sFormToSQL(colChamps("ger_langue"), BDTypeCHAR)
  cGer.OpenCurseur sFinalSQL
  cGer.MoveFirst
    
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
      JournalUnix sTable & " " & colChamps("ger_indice") & " " & colChamps("ger_langue"), "créé", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  
  BDSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp et idmodif
  iMode = meNavigate
  
  BDSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  BDSél.EmpêcheMouvements
  
  Mémorise
  SetMessage
  SetStatus
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cGer Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cGer.Edit
  
  ' Traçabilité ancien style
  colChamps("ger_datemodif") = Today
  colChamps("ger_heuremodif") = 100 * Hour(Now) + Minute(Now)
  colChamps("ger_opermodif") = iNumOpérateur
  
  ActiveTraçabilité True     ' Pour mettre à jour la base
  
  If Not bPrépareEditAdd(cGer, colColonnes, colChamps) Then
    ActiveTraçabilité False
    Exit Sub
  End If
  
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
      JournalUnix sTable & " " & colChamps("ger_indice") & " " & colChamps("ger_langue"), "changé", sMsgTrace
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

  Mémorise
  SetMessage
  SetStatus
  BDSél.TabStop = True
  BDSél.SetFocus
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
  BDSél.ActiveValidation False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cGer Is Nothing Then
    If Not (cGer.EOF And cGer.BOF) Then
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
  BDActiveMaxLength colChamps, colColonnes, False
  
  colChamps("ger_indice").SetFocus
  BDSél.TabStop = False
  bdcLangue = cSystèmeLang
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cGer Is Nothing
  
  If cGer.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "ger_indice", False
  ActiveChamp "ger_idmodif", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  colChamps("ger_libelle").SetFocus
  AutoSelect colChamps("ger_libelle"), True
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


Private Sub ActiveTraçabilité(bEnable As Boolean)
  ActiveChamp "ger_datecreat", bEnable
  ActiveChamp "ger_heurecreat", bEnable
  ActiveChamp "ger_opercreat", bEnable
  ActiveChamp "ger_datemodif", bEnable
  ActiveChamp "ger_heuremodif", bEnable
  ActiveChamp "ger_opermodif", bEnable
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "ger_idmodif", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  colChamps("ger_indice").SetFocus
  BDSél.TabStop = False
  
  ' Valeurs par défaut
  bdcLangue = cSystèmeLang

  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDetruit()
  Assert iMode = meNavigate
  Assert Not cGer Is Nothing

  If cGer.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cGer.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cGer.MoveNext
  If cGer.EOF Then
    cGer.MovePrevious
    If cGer.BOF Then
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

Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cGer Is Nothing
  
  If cGer.bEffacé Then
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
  If colChamps("ger_etat") <> "" Then
    MsgBox "Déjà supprimé (état S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, vous allez basculer l'enregistrement à l'état S (supprimé)." & vbCrLf & "Vous pourrez ultérieurement restaurer l'enregistrement à l'état normal en choisissant le menu Commandes, Récupère un enregistrement supprimé." & vbCrLf & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  cGer.Edit
  cGer!ger_etat = "S"
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "ger", False
  ActiveTraçabilité True     ' Pour mettre à jour la base
  bPrépareEditAdd cGer, colColonnes, colChamps
  ActiveTraçabilité False
  
  ' On spécifie dans l'historique des modifications que le numéro X est passé à l'état de supprimé
  Dim sMsgTrace As String
  sMsgTrace = colChamps("ger_indice") & " " & colChamps("ger_langue") & " -> Etat S"
    If cGer!ger_etat = "S" Then
       If sMsgTrace <> "" Then
          JournalUnix sTable & " " & colChamps("ger_indice") & " " & colChamps("ger_langue"), "Supprimé", sMsgTrace
       End If
    End If
    
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub
Public Sub Récupère()   ' Récupère un enregistrement supprimé (état S)
  If colChamps("ger_etat") <> "S" Then
    MsgBox "Vous ne pouvez récupérer qu'un enregistrement supprimé (état S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  cGer.Edit
  cGer!ger_etat = Null
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "ger", False
  ActiveTraçabilité True     ' Pour mettre à jour la base
  bPrépareEditAdd cGer, colColonnes, colChamps
  ActiveTraçabilité False
  
  ' Si on veut récupérer, on le mentionne ds l'historique
  Dim sMsgTrace As String
  sMsgTrace = colChamps("ger_indice") & " " & colChamps("ger_langue") & " -> Récup"
  If sMsgTrace <> "" Then
        JournalUnix sTable & " " & colChamps("ger_indice") & " " & colChamps("ger_langue"), "Récupéré", sMsgTrace
  End If
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub

Public Sub ActionDétruit()
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  If colChamps("ger_etat") <> "S" Then
    MsgBox "Vous ne pouvez pas détruire un enregistrement sans l'avoir au préalable supprimé (état S)", vbExclamation, App.Title
    If Not bShiftPressed Then Exit Sub
  End If
   
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
    JournalUnix sTable & " " & colChamps("ger_indice") & " " & colChamps("ger_langue"), "détruit", sMsgTrace
  End If
  
  On Error Resume Next
  cGer.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  ' On place un enregistrement dans synchrodelete
  Dim cSD As New BDCurseur
  cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
  cSD.AddNew
  cSD!sd_table = sTable
  cSD!sd_timestamp = BDTime
  cSD!sd_wherepart = "ger_indice=" & sFormToSQL(colChamps("ger_indice"), BDTypeCHAR)
  cSD.Update
  cSD.CloseCurseur
  
  cGer.MoveNext
  If cGer.EOF Then
    cGer.MovePrevious
    If cGer.BOF Then
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
  Assert Not cGer Is Nothing

  BDSél.ButtonEnabled("First") = cGer.AbsolutePosition <> 1
  BDSél.ButtonEnabled("Previous") = cGer.AbsolutePosition <> 1
  BDSél.ButtonEnabled("Next") = Not cGer.EOF
  BDSél.ButtonEnabled("Last") = Not cGer.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cGer.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cGer.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cGer.MoveNext
  AjusteMouvements
  If cGer.EOF Then cGer.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cGer.MovePrevious
  AjusteMouvements
  If cGer.BOF Then cGer.MoveFirst
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
  Dim C As Control
  
  If KeyCode = vbKeyF5 Then   ' Mémoire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set C = ActiveControl
          C = colMémoireGerme(ActiveControl.DataField)
          C.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each C In colChamps
        If Not C.Locked Then      ' On ne remplit pas les champs verrouillés
          C = colMémoireGerme(C.DataField)
        End If
      Next
    End If
  Else
    BDSél.KeyDown KeyCode
  End If
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

Private Sub bdcLangue_Change()
  ToMaj bdcLangue
End Sub

Private Sub bdcLangue_LostFocus()
  bdcLangue.Synchronise
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
  Dim l As Langue
  For Each l In colLangue
    bdcLangue.AddItem l.lan_code, l.lan_langue
  Next
  
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcOperCreat.AddItem u.uti_numuti, u.uti_nom
    bdcOperModif.AddItem u.uti_numuti, u.uti_nom
  Next
  
  
  ' Formulaire en mode initial
  Set cGer = Nothing
  ActiveFormulaire False
  BDSél.LectureSeule = True
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  BDSél.SetFocus
  
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
  If Not cGer Is Nothing Then cGer.CloseCurseur
  MDILabo.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cGer Is Nothing Then
    EffaceFormulaire
  ElseIf cGer.BOF And cGer.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cGer.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cGer.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    BDSél.NumRec = cGer.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cGer.bEffacé = True
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
' Ligne d'aide

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub bdcLangue_GotFocus()
  SetStatus bdcLangue.Tag
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


'=================================================================================
' Accès au Web

Public Sub FenêtreWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=" & sTable
End Sub


'=================================================================================
' Copie des données dans le presse-papiers

Public Sub Copie()
  On Error GoTo 0
  EffaceFormulaire
  SetMessage "Copie en cours…"
  BDCopieSélection cGer, colChamps, BDSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub



'=================================================================================
' Impression

Public Sub Imprime()
  BDEtat sFinalSQL, drGerme, True
End Sub

Public Sub Aperçu()
  BDEtat sFinalSQL, drGerme, False
End Sub


'=================================================================================
' Mémorisation

Public Sub Mémorise()
  EffaceCollection colMémoireGerme
  
  Dim t As Control
  For Each t In colChamps
    colMémoireGerme.Add (t), t.DataField
  Next
End Sub



'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("ger_indice") & " " & colChamps("ger_langue") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub



