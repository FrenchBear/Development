VERSION 5.00
Begin VB.Form frmParam�tre 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des param�tres"
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
   Icon            =   "frmParam�tre.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   417
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   505
   Tag             =   "Donn�es"
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
      Tag             =   "Unit� de base (%, g/l, ...)"
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
   Begin TablesLabo.BDS�lecteur bdS�l 
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
      Tag             =   "Heure de derni�re modification"
      Top             =   5160
      Width           =   735
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_datemodif"
      Height          =   315
      Index           =   8
      Left            =   1560
      TabIndex        =   45
      Tag             =   "Date de derni�re modification"
      Top             =   5160
      Width           =   1335
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_heurecreat"
      Height          =   315
      Index           =   7
      Left            =   2940
      TabIndex        =   42
      Tag             =   "Heure de cr�ation"
      Top             =   4800
      Width           =   735
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ger_datecreat"
      Height          =   315
      Index           =   6
      Left            =   1560
      TabIndex        =   41
      Tag             =   "Date de cr�ation"
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
      Tag             =   "Date+heure de derni�re modification de l'information"
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
      Tag             =   "Code interne du param�tre"
      Top             =   480
      Width           =   1035
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nb d�cimales :"
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
      Caption         =   "Trait� par :"
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
      Caption         =   "Unit� de base :"
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
      Caption         =   "Modifi� le :"
      Height          =   210
      Index           =   8
      Left            =   60
      TabIndex        =   44
      Top             =   5220
      Width           =   1020
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Cr�� le :"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   40
      Top             =   4860
      Width           =   810
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Abr�g� labo :"
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
      Caption         =   "Abr�g� :"
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
      Caption         =   "Libell� :"
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
Attribute VB_Name = "frmParam�tre"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmParam�tre
' Feuille de gestion des germes
' 16/02/1998 PV
'  7/07/1998 PV Copie de donn�es dans le presse-papiers
' 15/08/1998 PV sAjusteMessageODBC, BDActiveChamp
' 22/12/1998 PV Ordre des champs dans colChamps
' 31/03/1999 PV Impression
' 18/10/2000 NC Fusion avec la table param�tres -> nouveau nom param�tre
' 24/10/2000 NC Ajout du champ etat, modid des proc Supprime, D�truit, Delete
' 27/05/2001 PV Champ ger_abregelabo obligatoire uniquement pour les param�tres <=900 en val absolue (ne concerne pas les param�tres de chimie)
' 27/05/2001 PV M�morisation; Contr�les sur le type F/champ formule rempli
' 31/11/2001 FF Historique des modifications
' 03/11/2001 FF Historique des suppressions
' 04/12/2001 FF Historique des d�structions et des cr�ations
' 05/12/2001 FF Historique des r�cup�rations d'enregistrement

Option Explicit

Private cGer As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire
Private sFinalSQL As String               ' Requ�te SQL courante
Private colChange As New Collection       ' Trace des modifications
Private cold�truit As New Collection      ' Trace de l'enregistrement qui va �tre d�truit
Private colCr�� As New Collection         ' Trace de la cr�ation de l'enregistrement

Private Const sTable = "germe"


'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim bWPInt�greEtat As Boolean
  bWPInt�greEtat = False

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
      If t.DataField = "ger_etat" Then bWPInt�greEtat = True
    End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  If Not bWPInt�greEtat Then sWP = sWP & " and ger_etat is null"
  
  Dim cGerQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from germe where " & sWP & " order by ger_indice"
  cGerQuery.OpenCurseur sSQL
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
  If Not cGer Is Nothing Then cGer.CloseCurseur
  Set cGer = cGerQuery
  sFinalSQL = sSQL
  
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  BDS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cGer.EOF And cGer.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a �t� s�lectionn�"
  End If
  BDS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  BDS�l.SetFocus
End Sub


' V�rifie que les champs contiennent des valeurs l�gales
' Le contr�le des NULL et des types a d�j� �t� fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer
  
  bOkValeurs = False
  
  bdcLangue.Synchronise
  If InStr(bdcLangue.FullText, bdcLangue.S�parateur) = 0 Then
    MsgBox "Code langue inconnu !", vbExclamation, App.Title
    bdcLangue.SetFocus
    Exit Function
  End If
  
  If IsNumeric(colChamps("ger_indice").Text) Then
    If Abs(colChamps("ger_indice").Text) < 900 Then
      If colChamps("ger_abregelabo") = "" Then
        MsgBox "Code abr�g� labo obligatoire pour les param�tres <=900", vbExclamation, App.Title
        colChamps("ger_abregelabo").SetFocus
        Exit Function
      End If
    End If
  End If
  
  If colChamps("ger_type").Text = "F" And colChamps("ger_formule").Text = "" Then
    MsgBox "Si le param�tre est de type F (formule), le champ formule doit �tre rempli.", vbExclamation, App.Title
    colChamps("ger_formule").SetFocus
    Exit Function
  End If
  
  If colChamps("ger_formule").Text <> "" And colChamps("ger_type").Text <> "F" Then
    MsgBox "Si le champ formule est rempli, alors le type du param�tre doit �tre F (formule).", vbExclamation, App.Title
    colChamps("ger_type").SetFocus
    Exit Function
  End If
  
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  Dim cGerAdd As New BDCurseur
  cGerAdd.OpenCurseur "select * from germe where ger_indice=0"
  cGerAdd.AddNew
  
  ' Tra�abilit� ancien style
  colChamps("ger_datecreat") = Today
  colChamps("ger_heurecreat") = 100 * Hour(Now) + Minute(Now)
  colChamps("ger_opercreat") = iNumOp�rateur
  colChamps("ger_datemodif") = Today
  colChamps("ger_heuremodif") = 100 * Hour(Now) + Minute(Now)
  colChamps("ger_opermodif") = iNumOp�rateur
  
  ActiveTra�abilit� True    ' Pour que la base soit mise � jour
  
  If Not bPr�pareEditAdd(cGerAdd, colColonnes, colChamps) Then
    cGerAdd.CloseCurseur
    ActiveTra�abilit� False
    Exit Sub
  End If
  
  cGerAdd.CloseCurseur
  
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cGer Is Nothing Then cGer.CloseCurseur
  Set cGer = New BDCurseur
  sFinalSQL = "select * from germe where ger_indice=" & sFormToSQL(colChamps("ger_indice"), BDTypeINTEGER) & " and ger_langue=" & sFormToSQL(colChamps("ger_langue"), BDTypeCHAR)
  cGer.OpenCurseur sFinalSQL
  cGer.MoveFirst
    
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
      JournalUnix sTable & " " & colChamps("ger_indice") & " " & colChamps("ger_langue"), "cr��", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  
  BDS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp et idmodif
  iMode = meNavigate
  
  BDS�l.ActiveMouvements True
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  BDS�l.Emp�cheMouvements
  
  M�morise
  SetMessage
  SetStatus
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cGer Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cGer.Edit
  
  ' Tra�abilit� ancien style
  colChamps("ger_datemodif") = Today
  colChamps("ger_heuremodif") = 100 * Hour(Now) + Minute(Now)
  colChamps("ger_opermodif") = iNumOp�rateur
  
  ActiveTra�abilit� True     ' Pour mettre � jour la base
  
  If Not bPr�pareEditAdd(cGer, colColonnes, colChamps) Then
    ActiveTra�abilit� False
    Exit Sub
  End If
  
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
      JournalUnix sTable & " " & colChamps("ger_indice") & " " & colChamps("ger_langue"), "chang�", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  
  BDS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDS�l.ActiveMouvements True
  AjusteMouvements

  M�morise
  SetMessage
  SetStatus
  BDS�l.TabStop = True
  BDS�l.SetFocus
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
  BDS�l.ActiveValidation False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cGer Is Nothing Then
    If Not (cGer.EOF And cGer.BOF) Then
      iMode = meNavigate
    End If
  End If
  BDS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub



'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  BDS�l.ButtonEnabled("Query") = False
  BDS�l.ButtonEnabled("Add") = False
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, False
  
  colChamps("ger_indice").SetFocus
  BDS�l.TabStop = False
  bdcLangue = cSyst�meLang
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cGer Is Nothing
  
  If cGer.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  BDS�l.ButtonEnabled("Query") = False
  BDS�l.ButtonEnabled("Add") = False
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation True
  
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "ger_indice", False
  ActiveChamp "ger_idmodif", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False
  
  colChamps("ger_libelle").SetFocus
  AutoSelect colChamps("ger_libelle"), True
  BDS�l.TabStop = False
  
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


Private Sub ActiveTra�abilit�(bEnable As Boolean)
  ActiveChamp "ger_datecreat", bEnable
  ActiveChamp "ger_heurecreat", bEnable
  ActiveChamp "ger_opercreat", bEnable
  ActiveChamp "ger_datemodif", bEnable
  ActiveChamp "ger_heuremodif", bEnable
  ActiveChamp "ger_opermodif", bEnable
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  BDS�l.ButtonEnabled("Query") = False
  BDS�l.ButtonEnabled("Add") = False
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "ger_idmodif", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False
  
  colChamps("ger_indice").SetFocus
  BDS�l.TabStop = False
  
  ' Valeurs par d�faut
  bdcLangue = cSyst�meLang

  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionDetruit()
  Assert iMode = meNavigate
  Assert Not cGer Is Nothing

  If cGer.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est d�finitif." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cGer.Delete
  If Err Then
    AfficheErreurODBC "�chec de la suppression de l'enregistrement"
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
  
  BDS�l.ActiveMouvements iMode = meNavigate
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub

Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cGer Is Nothing
  
  If cGer.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  If bShiftPressed Then
    ActionD�truit             ' D�truit l'enregistrement
  Else
    ActionSupprime            ' Marque l'enregistrement supprim� (�tat S)
  End If
End Sub

Public Sub ActionSupprime()   ' Marque l'enregistrement supprim� (�tat S)
  If colChamps("ger_etat") <> "" Then
    MsgBox "D�j� supprim� (�tat S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, vous allez basculer l'enregistrement � l'�tat S (supprim�)." & vbCrLf & "Vous pourrez ult�rieurement restaurer l'enregistrement � l'�tat normal en choisissant le menu Commandes, R�cup�re un enregistrement supprim�." & vbCrLf & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  cGer.Edit
  cGer!ger_etat = "S"
  
  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "ger", False
  ActiveTra�abilit� True     ' Pour mettre � jour la base
  bPr�pareEditAdd cGer, colColonnes, colChamps
  ActiveTra�abilit� False
  
  ' On sp�cifie dans l'historique des modifications que le num�ro X est pass� � l'�tat de supprim�
  Dim sMsgTrace As String
  sMsgTrace = colChamps("ger_indice") & " " & colChamps("ger_langue") & " -> Etat S"
    If cGer!ger_etat = "S" Then
       If sMsgTrace <> "" Then
          JournalUnix sTable & " " & colChamps("ger_indice") & " " & colChamps("ger_langue"), "Supprim�", sMsgTrace
       End If
    End If
    
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub
Public Sub R�cup�re()   ' R�cup�re un enregistrement supprim� (�tat S)
  If colChamps("ger_etat") <> "S" Then
    MsgBox "Vous ne pouvez r�cup�rer qu'un enregistrement supprim� (�tat S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  cGer.Edit
  cGer!ger_etat = Null
  
  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "ger", False
  ActiveTra�abilit� True     ' Pour mettre � jour la base
  bPr�pareEditAdd cGer, colColonnes, colChamps
  ActiveTra�abilit� False
  
  ' Si on veut r�cup�rer, on le mentionne ds l'historique
  Dim sMsgTrace As String
  sMsgTrace = colChamps("ger_indice") & " " & colChamps("ger_langue") & " -> R�cup"
  If sMsgTrace <> "" Then
        JournalUnix sTable & " " & colChamps("ger_indice") & " " & colChamps("ger_langue"), "R�cup�r�", sMsgTrace
  End If
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub

Public Sub ActionD�truit()
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est d�finitif." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  If colChamps("ger_etat") <> "S" Then
    MsgBox "Vous ne pouvez pas d�truire un enregistrement sans l'avoir au pr�alable supprim� (�tat S)", vbExclamation, App.Title
    If Not bShiftPressed Then Exit Sub
  End If
   
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
    JournalUnix sTable & " " & colChamps("ger_indice") & " " & colChamps("ger_langue"), "d�truit", sMsgTrace
  End If
  
  On Error Resume Next
  cGer.Delete
  If Err Then
    AfficheErreurODBC "�chec de la suppression de l'enregistrement"
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
  
  BDS�l.ActiveMouvements iMode = meNavigate
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub



'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cGer Is Nothing

  BDS�l.ButtonEnabled("First") = cGer.AbsolutePosition <> 1
  BDS�l.ButtonEnabled("Previous") = cGer.AbsolutePosition <> 1
  BDS�l.ButtonEnabled("Next") = Not cGer.EOF
  BDS�l.ButtonEnabled("Last") = Not cGer.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cGer.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
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
  Dim C As Control
  
  If KeyCode = vbKeyF5 Then   ' M�moire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set C = ActiveControl
          C = colM�moireGerme(ActiveControl.DataField)
          C.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each C In colChamps
        If Not C.Locked Then      ' On ne remplit pas les champs verrouill�s
          C = colM�moireGerme(C.DataField)
        End If
      Next
    End If
  Else
    BDS�l.KeyDown KeyCode
  End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then BDS�l.KeyPress KeyAscii
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
  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable sTable, colColonnes
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
  BDS�l.LectureSeule = True
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  BDS�l.SetFocus
  
  SetMessage
  SetStatus
  sFinalSQL = ""
    
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
    BDS�l.NumRec = cGer.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cGer.bEffac� = True
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
  BDS�l.NumRec = ""
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

Private Sub bdS�l_GotFocus()
  SetStatus
End Sub

Private Sub bdcOperCreat_GotFocus()
  SetStatus bdcOperCreat.Tag
End Sub

Private Sub bdcOperModif_GotFocus()
  SetStatus bdcOperModif.Tag
End Sub


'=================================================================================
' Acc�s au Web

Public Sub Fen�treWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=" & sTable
End Sub


'=================================================================================
' Copie des donn�es dans le presse-papiers

Public Sub Copie()
  On Error GoTo 0
  EffaceFormulaire
  SetMessage "Copie en cours�"
  BDCopieS�lection cGer, colChamps, BDS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub



'=================================================================================
' Impression

Public Sub Imprime()
  BDEtat sFinalSQL, drGerme, True
End Sub

Public Sub Aper�u()
  BDEtat sFinalSQL, drGerme, False
End Sub


'=================================================================================
' M�morisation

Public Sub M�morise()
  EffaceCollection colM�moireGerme
  
  Dim t As Control
  For Each t In colChamps
    colM�moireGerme.Add (t), t.DataField
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



