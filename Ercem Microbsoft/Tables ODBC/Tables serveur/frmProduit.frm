VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmProduit 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des produits"
   ClientHeight    =   5700
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
   Icon            =   "frmProduit.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   380
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   609
   Tag             =   "Donn�es"
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   960
      Top             =   540
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^*pro_critere"
      Height          =   315
      Index           =   4
      Left            =   1740
      TabIndex        =   5
      Top             =   1200
      Width           =   795
   End
   Begin VB.Frame frlTra�abilit� 
      Caption         =   "Tra�abilit�"
      Height          =   1755
      Left            =   60
      TabIndex        =   25
      Top             =   3900
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
         DataField       =   "pro_opercreat"
      End
      Begin TablesServeur.BDCombo bdcOperModif 
         Height          =   330
         Left            =   3780
         TabIndex        =   17
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
         DataField       =   "pro_opermodif"
      End
      Begin TablesServeur.BDCombo bdcOperValid 
         Height          =   330
         Left            =   3780
         TabIndex        =   20
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
         DataField       =   "pro_opervalid"
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   22
         Left            =   1680
         TabIndex        =   22
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
         DataField       =   "pro_tsvalid"
         Height          =   315
         Index           =   21
         Left            =   1680
         TabIndex        =   19
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
         DataField       =   "pro_datecreat"
         Height          =   315
         Index           =   17
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
         DataField       =   "pro_heurecreat"
         Height          =   315
         Index           =   18
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
         DataField       =   "pro_datemodif"
         Height          =   315
         Index           =   19
         Left            =   1680
         TabIndex        =   15
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
         DataField       =   "pro_heuremodif"
         Height          =   315
         Index           =   20
         Left            =   2760
         TabIndex        =   16
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
         TabIndex        =   29
         Top             =   1380
         Width           =   1155
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Valid� le :"
         Height          =   210
         Index           =   19
         Left            =   120
         TabIndex        =   28
         Top             =   1020
         Width           =   930
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Cr�� le :"
         Height          =   210
         Index           =   17
         Left            =   120
         TabIndex        =   26
         Top             =   300
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifi� le :"
         Height          =   210
         Index           =   16
         Left            =   120
         TabIndex        =   27
         Top             =   660
         Width           =   1020
      End
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^*pro_nom"
      Height          =   315
      Index           =   3
      Left            =   1740
      MaxLength       =   60
      TabIndex        =   4
      Top             =   840
      Width           =   7275
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^pro_etat"
      Height          =   315
      Index           =   1
      Left            =   3540
      TabIndex        =   2
      Top             =   480
      Width           =   315
   End
   Begin TablesServeur.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   30
      Top             =   0
      Width           =   9135
      _ExtentX        =   16113
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
   Begin MSWLess.WLText txtType 
      Height          =   315
      Index           =   5
      Left            =   2580
      TabIndex        =   18
      TabStop         =   0   'False
      Top             =   3060
      Width           =   6435
      _ExtentX        =   11351
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483637
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtType 
      Height          =   315
      Index           =   4
      Left            =   2580
      TabIndex        =   21
      TabStop         =   0   'False
      Top             =   2700
      Width           =   6435
      _ExtentX        =   11351
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483637
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtType 
      Height          =   315
      Index           =   3
      Left            =   2580
      TabIndex        =   46
      TabStop         =   0   'False
      Top             =   2340
      Width           =   6435
      _ExtentX        =   11351
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483637
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtType 
      Height          =   315
      Index           =   2
      Left            =   2580
      TabIndex        =   45
      TabStop         =   0   'False
      Top             =   1980
      Width           =   6435
      _ExtentX        =   11351
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483637
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtType 
      Height          =   315
      Index           =   1
      Left            =   2580
      TabIndex        =   44
      TabStop         =   0   'False
      Top             =   1620
      Width           =   6435
      _ExtentX        =   11351
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483637
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "pro_comment"
      Height          =   315
      Index           =   16
      Left            =   1740
      TabIndex        =   11
      Top             =   3480
      Width           =   7275
      _ExtentX        =   12832
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*pro_t5"
      Height          =   315
      Index           =   14
      Left            =   1740
      TabIndex        =   10
      Top             =   3060
      Width           =   795
      _ExtentX        =   1402
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*pro_t4"
      Height          =   315
      Index           =   12
      Left            =   1740
      TabIndex        =   9
      Top             =   2700
      Width           =   795
      _ExtentX        =   1402
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*pro_t3"
      Height          =   315
      Index           =   10
      Left            =   1740
      TabIndex        =   8
      Top             =   2340
      Width           =   795
      _ExtentX        =   1402
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*pro_t2"
      Height          =   315
      Index           =   8
      Left            =   1740
      TabIndex        =   7
      Top             =   1980
      Width           =   795
      _ExtentX        =   1402
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*pro_t1"
      Height          =   315
      Index           =   6
      Left            =   1740
      TabIndex        =   6
      Top             =   1620
      Width           =   795
      _ExtentX        =   1402
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "pro_nouvnum"
      Height          =   315
      Index           =   2
      Left            =   5580
      TabIndex        =   3
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
   Begin MSWLess.WLText txtCrit�re 
      Height          =   315
      Left            =   2580
      TabIndex        =   31
      TabStop         =   0   'False
      Top             =   1200
      Width           =   6435
      _ExtentX        =   11351
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483637
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*pro_numpro"
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
      Caption         =   "Remarques :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   43
      Top             =   3540
      Width           =   1200
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "T5 �tat :"
      Height          =   210
      Index           =   18
      Left            =   60
      TabIndex        =   42
      Top             =   3120
      Width           =   810
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "T4 :"
      Height          =   210
      Index           =   15
      Left            =   60
      TabIndex        =   41
      Top             =   2760
      Width           =   360
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "T3 :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   40
      Top             =   2400
      Width           =   360
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "T2 :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   39
      Top             =   2040
      Width           =   360
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "T1 Sect :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   38
      Top             =   1680
      Width           =   825
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nouveau n� :"
      Height          =   210
      Index           =   9
      Left            =   0
      TabIndex        =   37
      Top             =   60
      Width           =   1260
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nouveau n� :"
      Height          =   210
      Index           =   10
      Left            =   4200
      TabIndex        =   36
      Top             =   540
      Width           =   1260
   End
   Begin VB.Label lblChamp 
      Caption         =   "Crit�re :"
      Height          =   255
      Index           =   8
      Left            =   0
      TabIndex        =   35
      Top             =   0
      Width           =   855
   End
   Begin VB.Label lblChamp 
      Caption         =   "Crit�re :"
      Height          =   195
      Index           =   7
      Left            =   60
      TabIndex        =   34
      Top             =   1260
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nom :"
      Height          =   210
      Index           =   5
      Left            =   0
      TabIndex        =   33
      Top             =   0
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nom :"
      Height          =   210
      Index           =   4
      Left            =   0
      TabIndex        =   32
      Top             =   0
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nom :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   24
      Top             =   900
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "�tat :"
      Height          =   210
      Index           =   1
      Left            =   2880
      TabIndex        =   23
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
Attribute VB_Name = "frmProduit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmProduit
' Feuille de gestion des produits
' 01/06/1999 NC
' 17/08/1999 PV Gestion d'un cache crit�res et types pour acc�l�rer l'affichage � 64K
' 23/08/1999 PV Normalisation du nom
' 21/09/1999 PV Impression artisanale assistants et produits par type
'  8/02/2000 PV Avertissement avant le passage � l'�tat S
' 26/05/2000 PV M�canisme de m�morisation (F5)
'  6/07/2001 PV Impression de la classe de crit�re
' 31/11/2001 FF Historique des modifications
' 03/12/2001 FF Historique des suppressions et des destructions
' 04/12/2001 FF Historique des cr�ations
' 05/12/2001 FF Historique des r�cup�rations d'enregistrement
'  8/12/2001 PV M�thodes globales


Option Explicit

Private cPro As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire

Private sFinalWP As String                ' Where-part de la requ�te SQL courante
Private sQuery As String                  ' Query de la s�lection en cours

Private colHistorique As New Collection   ' Trace des modifications pour l'historique

Private rPro As ADODB.Recordset           ' Liste de produits charg�e pour impression

Private Const sTable = "produit"


'=================================================================================
' M�thodes globales impl�ment�es par ce module, pour l'affichage du menu Commandes

Public Property Get sM�thodesGlobales() As String
  sM�thodesGlobales = "Historique,R�cup�re,AjouteWeb"
End Property


'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim sWP As String
  Dim t As Control
  Dim bWPInt�greEtat As Boolean
  
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
      If t.DataField = "pro_etat" Then bWPInt�greEtat = True
    End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = AvertissementLectureFichierComplet
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cProQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  If Not bWPInt�greEtat Then sWP = sWP & " and pro_etat is null"
  sQuery = "select * from produit where " & sWP

  On Error Resume Next
  cProQuery.OpenCurseur sQuery
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
  If Not cPro Is Nothing Then cPro.CloseCurseur
  Set cPro = cProQuery
  sFinalWP = sWP
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cPro.EOF And cPro.BOF) Then
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
  
  If colChamps("pro_nom") <> sNormaliseNom(colChamps("pro_nom")) Then
    colChamps("pro_nom") = sNormaliseNom(colChamps("pro_nom"))
    MsgBox "ATTENTION - Le nom a �t� modifi� pour correspondre aux r�gles g�n�rales de cr�ations de nom (pas d'espaces en double, nom en majuscules, le � est la seule majuscule accentu�e accept�e).", vbInformation, App.Title
  End If
  
  ' On regarde si le nom n'existe pas d�j�
  Dim iSer As Long
  iSer = BDCurseurExpress("select pro_numpro from produit where pro_nom=" & sFormToSQL(colChamps("pro_nom"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("pro_numpro") Then
    MsgBox "ATTENTION - Ce produit existe d�j� sous le n� " & iSer & vbCrLf & "Ajout interrompu.", vbExclamation, App.Title
    Exit Function
  End If
  
  ' T1=0 ou 4
  If colChamps("pro_t1") <> 0 And colChamps("pro_t1") <> 4 Then
    MsgBox "AVERTISSEMENT - T1 devrait valoir 0 ou 4, la valeur saisie ne sera pas g�r�e correctement par les programmes.", vbExclamation, App.Title
  End If
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  ' G�n�ration du n� de s�rie
  Dim cProAdd As New BDCurseur
  cProAdd.OpenCurseur "select * from produit where pro_numpro=0"
  cProAdd.AddNew
  
  Dim cnumpro As New BDCurseur
  cnumpro.OpenCurseur "select max (pro_numpro) from produit"
  colChamps("pro_numpro") = cnumpro.Fields(0) + 1
  cProAdd!pro_numpro = cnumpro.Fields(0) + 1
  cnumpro.CloseCurseur
  
  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "pro", True
  
  ' Seuls les champs actifs sont mis � jour
  ActiveTra�abilit� True
  ActiveChamp "pro_numpro", True
  
  If Not bPr�pareEditAdd(cProAdd, colColonnes, colChamps) Then
    cProAdd.CloseCurseur
    ActiveTra�abilit� False
    ActiveChamp "pro_numpro", False
    Exit Sub
  End If
  cProAdd.CloseCurseur
  
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cPro Is Nothing Then cPro.CloseCurseur
  Set cPro = New BDCurseur
  
  sFinalWP = "pro_numpro=" & colChamps("pro_numpro")
  sQuery = "select * from produit where " & sFinalWP
  cPro.OpenCurseur sQuery
  cPro.MoveFirst
  
  
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
  JournalUnix sTable & " " & colChamps("pro_numpro"), "cr��", sMsgTrace
  
  
  BDActiveFormulaire colChamps, False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  bdS�l.Emp�cheMouvements
  
  M�morise
  
  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cPro Is Nothing
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cPro.Edit
      
  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "pro", False
  ActiveTra�abilit� True     ' Pour mettre � jour la base
    
  If Not bPr�pareEditAdd(cPro, colColonnes, colChamps) Then
    ActiveTra�abilit� False
    Exit Sub
  End If
  
  ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a �t� chang�
  If iMode = meChange Then
    Dim c As Control
    Dim sMsgTrace As String
    For Each c In Controls
      If DataFieldEx(c) <> "" Then
        If colHistorique(c.DataField) <> ValeurContr�le(c) Then  ' Modifi� !
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & c.DataField & ":" & colHistorique(c.DataField) & "->" & ValeurContr�le(c)
        End If
      End If
    Next
    If sMsgTrace <> "" Then
       JournalUnix sTable & " " & colChamps("pro_numpro"), "chang�", sMsgTrace
    End If
  End If
  
  BDActiveFormulaire colChamps, False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  AjusteMouvements
  M�morise

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

  BDActiveFormulaire colChamps, False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cPro Is Nothing Then
    If Not (cPro.EOF And cPro.BOF) Then
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
  
  colChamps("pro_numpro").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cPro Is Nothing
  
  If cPro.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If

  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True

  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "pro_numpro", False
  ActiveChamp "pro_etat", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False


  colChamps("pro_nom").SetFocus
  AutoSelect colChamps("pro_nom"), True
  bdS�l.TabStop = False

  iMode = meChange
  
  ' On m�morise les valeurs avant le changement
  EffaceCollection colHistorique
  Dim c As Control
  For Each c In Controls
    If DataFieldEx(c) <> "" Then
      colHistorique.Add ValeurContr�le(c), c.DataField
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
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "pro_numpro", False
  'ActiveChamp "pro_etat", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False
  
  colChamps("pro_nom").SetFocus
  bdS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub AjouteWeb()

  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'op�ration en cours avant de faire un ajout Web !", vbExclamation, App.Title
    Exit Sub
  End If

  Dim vReq As Variant
  vReq = InputBox("N� de la requ�te Web d'ajout ?")
  If vReq = "" Or Not IsNumeric(vReq) Then Exit Sub

  Dim cWeb As New BDCurseur
  cWeb.OpenCurseur "select crp_serie, crp_etat, crp_origine, crp_operation, crp_libelle, crp_numpro, crp_libelle," & _
  "crp_critere, crp_t1, crp_t2, crp_t3, crp_t4, crp_t5, crp_comment" & _
  " from crepro where crp_serie=" & vReq
  If cWeb.EOF Then
    MsgBox "Requ�te inconnue, ajout interrompu.", vbExclamation, App.Title
    Exit Sub
  End If

  If cWeb!crp_operation <> "C" Then
    MsgBox "Il ne s'agit pas d'une requ�te de cr�ation, ajout interrompu.", vbExclamation, App.Title
    Exit Sub
  End If

  ActionAdd
  colChamps("pro_comment") = "Web " & cWeb!crp_serie & ": " & NV(cWeb!crp_origine)
  colChamps("pro_nom") = sNormaliseNom(NV(cWeb!crp_libelle))
  colChamps("pro_critere") = NV(cWeb!crp_critere)
  colChamps("pro_t1") = NV(cWeb!crp_t1)
  colChamps("pro_t2") = NV(cWeb!crp_t2)
  colChamps("pro_t3") = NV(cWeb!crp_t3)
  colChamps("pro_t4") = NV(cWeb!crp_t4)
  colChamps("pro_t5") = NV(cWeb!crp_t5)

End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cPro Is Nothing
  
  If cPro.bEffac� Then
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
  If colChamps("pro_etat") <> "" Then
    MsgBox "D�j� supprim� (�tat S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, vous allez basculer l'enregistrement � l'�tat S (supprim�)." & vbCrLf & "Vous pourrez ult�rieurement restaurer l'enregistrement � l'�tat normal en choisissant le menu Commandes, R�cup�re un enregistrement supprim�." & vbCrLf & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  cPro.Edit
  cPro!pro_etat = "S"
  
  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "pro", False
  ActiveTra�abilit� True     ' Pour mettre � jour la base
  bPr�pareEditAdd cPro, colColonnes, colChamps
  ActiveTra�abilit� False
  
  ' On sp�cifie dans l'historique des modifications que le num�ro X est pass� � l'�tat de supprim�
  Dim sMsgTrace As String
  sMsgTrace = colChamps("pro_numpro") & " -> Etat S"
    If cPro!pro_etat = "S" Then
       If sMsgTrace <> "" Then
          JournalUnix sTable & " " & colChamps("pro_numpro"), "supprim�", sMsgTrace
       End If
    End If
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub


Public Sub R�cup�re()   ' R�cup�re un enregistrement supprim� (�tat S)
  If colChamps("pro_etat") <> "S" And colChamps("pro_etat") <> "Z" Then
    MsgBox "Vous ne pouvez r�cup�rer qu'un enregistrement supprim� (�tat S ou Z)", vbExclamation, App.Title
    Exit Sub
  End If
  
  cPro.Edit
  cPro!pro_etat = Null
  
  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "pro", False
  ActiveTra�abilit� True     ' Pour mettre � jour la base
  bPr�pareEditAdd cPro, colColonnes, colChamps
  ActiveTra�abilit� False
  
  ' Si on veut r�cup�rer, on le mentionne ds l'historique
  Dim sMsgTrace As String
  sMsgTrace = colChamps("pro_numpro") & " -> R�cup"
  If sMsgTrace <> "" Then
        JournalUnix sTable & " " & colChamps("pro_numpro"), "r�cup�r�", sMsgTrace
  End If
   
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub

  
Public Sub ActionD�truit()    ' D�truit l'enregistrement
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est d�finitive." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  If colChamps("pro_etat") <> "S" Then
    MsgBox "Vous ne pouvez pas d�truire un enregistrement sans l'avoir au pr�alable supprim� (�tat S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  ' Historique
  Dim sMsgTrace As String
  Dim c As Control
  For Each c In Controls
    If DataFieldEx(c) <> "" Then
      If ValeurContr�le(c) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & c.DataField & ":" & ValeurContr�le(c)
         End If
      End If
  Next
  
  On Error Resume Next
  cPro.Delete
  If Err Then
    AfficheErreurODBC "�chec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  ' On garde la trace de la destruction
  JournalUnix sTable & " " & colChamps("pro_numpro"), "d�truit", sMsgTrace
  
  ' La gestion de synchrodelete est assur�e par trigger
  
  cPro.MoveNext
  If cPro.EOF Then
    cPro.MovePrevious
    If cPro.BOF Then
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
  ActiveChamp "pro_datecreat", bEnable
  ActiveChamp "pro_heurecreat", bEnable
  ActiveChamp "pro_opercreat", bEnable
  ActiveChamp "pro_datemodif", bEnable
  ActiveChamp "pro_heuremodif", bEnable
  ActiveChamp "pro_opermodif", bEnable
  ActiveChamp "pro_tsvalid", bEnable
  ActiveChamp "pro_opervalid", bEnable
End Sub

'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cPro Is Nothing

  bdS�l.ButtonEnabled("First") = cPro.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cPro.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cPro.EOF
  bdS�l.ButtonEnabled("Last") = Not cPro.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cPro.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
  cPro.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cPro.MoveNext
  AjusteMouvements
  If cPro.EOF Then cPro.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cPro.MovePrevious
  AjusteMouvements
  If cPro.BOF Then cPro.MoveFirst
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
  Dim c As Control
  
  ResetChienDeGarde
  If KeyCode = vbKeyF5 Then   ' M�moire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set c = ActiveControl
          c = colM�moireProduit(ActiveControl.DataField)
          c.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each c In colChamps
        If Not c.Locked Then      ' On ne remplit pas les champs verrouill�s
          c = colM�moireProduit(c.DataField)
        End If
      Next
    End If
  Else
    bdS�l.KeyDown KeyCode
  End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
End Sub
' Menu de commandes contextuel
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then    ' Bouton droit
    PopupMenu MDIServeur.mnuCommandes
  End If
End Sub

' Filtrage des Entr�e intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
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
    bdcOperCreat.AddItem u.uti_numuti, u.uti_nom
    bdcOperModif.AddItem u.uti_numuti, u.uti_nom
    bdcOperValid.AddItem u.uti_numuti, u.uti_nom
  Next

  
  ' Formulaire en mode initial
  Set cPro = Nothing
  BDActiveFormulaire colChamps, False
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
  If Not cPro Is Nothing Then cPro.CloseCurseur
  MDIServeur.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cPro Is Nothing Then
    EffaceFormulaire
  ElseIf cPro.BOF And cPro.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cPro.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cPro.Fields(c.DataField)
      End If
      'If c.DataField = "pro_numpro" Or c.DataField = "pro_nom" Or c.DataField = "pro_critere" Then c.Refresh
      c.Refresh
    Next
    On Error GoTo 0
    
    bdS�l.NumRec = cPro.AbsolutePosition
    bdS�l.RefreshNumRec
    
    ' On efface les champs qui seront affich�s par le timer
    txtCrit�re = ""
    txtCrit�re.Refresh
    Dim i As Integer
    For i = 1 To 5
      txtType(i) = ""
      txtType(i).Refresh
    Next
    
    ActiveTimer mtRapide      ' Mise � jour en arri�re plan

  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cPro.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop

  ' Affichage des champs satellites
  If colChamps("pro_critere") <> "" Then
    txtCrit�re = sGetCrit�re(colChamps("pro_critere"))
    txtCrit�re.Refresh
  End If
  
  If colChamps("pro_t1") <> "" Then
    txtType(1) = sType(colChamps("pro_t1"), 0, 0, 0, 0)
    txtType(1).Refresh
    txtType(2) = sType(colChamps("pro_t1"), colChamps("pro_t2"), 0, 0, 0)
    txtType(2).Refresh
    txtType(3) = sType(colChamps("pro_t1"), colChamps("pro_t2"), colChamps("pro_t3"), 0, 0)
    txtType(3).Refresh
    txtType(4) = sType(colChamps("pro_t1"), colChamps("pro_t2"), colChamps("pro_t3"), colChamps("pro_t4"), 0)
    txtType(4).Refresh
    txtType(5) = sType(colChamps("pro_t1"), colChamps("pro_t2"), colChamps("pro_t3"), colChamps("pro_t4"), colChamps("pro_t5"))
  End If
End Sub


Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  txtCrit�re = ""
  txtType(1) = ""
  txtType(2) = ""
  txtType(3) = ""
  txtType(4) = ""
  txtType(5) = ""
  bdS�l.NumRec = ""
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

Private Sub txtChampVB_GotFocus(Index As Integer)
  AutoSelect txtChampVB(Index)
  SetStatus txtChampVB(Index).Tag
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

Private Sub bdcOperValid_GotFocus()
  SetStatus bdcOperValid.Tag
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
  BDCopieS�lection cPro, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub




'=================================================================================
' Impression

Public Sub Imprime()
  DoEtat True
End Sub

Public Sub Aper�u()
  DoEtat False
End Sub

Private Sub DoEtat(ByVal bImpression As Boolean)
  On Error GoTo pb
  
  Dim iChoix As Integer
  iChoix = 1
  iChoix = frmMessageChoix.ChoixEtat("Liste alphab�tique", "Produits par type", "Assistant")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
  Exit Sub
  
pb:
  intlMessageErreurEtat
End Sub


Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Select Case iChoix
    Case 1:
      Dim sSQL As String
      sSQL = "select * from produit where " & sFinalWP & " order by pro_nom"
      On Error Resume Next
      BDEtat sSQL, drProSimple, bImpression
    
    Case 2:
      ChargeProduits
      DoFormatageProduitsParType rPro, bImpression, Me, 2
      rPro.Close
      Set rPro = Nothing
      SynchroniseFormulaire
      
    Case 3:
      If InStr(1, sFinalWP, "pro_t1", vbTextCompare) = 0 Then
        MsgBox "Vous devez s�lectionner s�par�ment les produits g�n�riques (T1=0) ou les produits sp�cifiques (T1=4) pour pouvoir utiliser l'�dition 'assistants'.", vbExclamation, App.Title
        Exit Sub
      End If
      
      Dim bSection4 As Boolean
      bSection4 = (cPro!pro_t1 = 4)
      
      ChargeProduits
      DoFormatageProduits rPro, bImpression, bSection4, Me, 3
      rPro.Close
      Set rPro = Nothing
      SynchroniseFormulaire
  End Select
End Sub


' Callback de l'aper�u avant impression
Public Sub PrintReport(ByVal iChoix As Integer)
  Etat iChoix, True
End Sub



' Remplit le recordset rPro avec les produits s�lectionn�s
' pour les �tats "artisanaux"

Private Sub ChargeProduits()
  Screen.MousePointer = vbHourglass
  SetStatus "Lecture des enregistrements, patientez..."
  
  ' On r�cup�re les donn�es
  Set rPro = New ADODB.Recordset
  
  rPro.Fields.Append "pro_numpro", adInteger
  rPro.Fields.Append "pro_nom", adVarChar, 60      ' adVariant
  rPro.Fields.Append "pro_critere", adVariant
  rPro.Fields.Append "pro_t1", adSmallInt
  rPro.Fields.Append "pro_t2", adSmallInt
  rPro.Fields.Append "pro_t3", adSmallInt
  rPro.Fields.Append "pro_t4", adSmallInt
  rPro.Fields.Append "pro_t5", adSmallInt
  rPro.Fields.Append "cri_classedoc", adVariant
  rPro.Open
  
  EffaceFormulaire
  Refresh
  cPro.MoveFirst

  Dim cPro2 As New BDCurseur
  cPro2.OpenCurseur "select pro_numpro,pro_nom,pro_critere,pro_t1,pro_t2,pro_t3,pro_t4,pro_t5,cri_classedoc from produit,critere c1 where " & sFinalWP & " and cri_critere=pro_critere and cri_version=(select max(cri_version) from critere c2 where c2.cri_critere=c1.cri_critere)"
  cPro2.MoveFirst
  
  Do Until cPro2.EOF
    If cPro2.AbsolutePosition Mod 10 = 0 Then
      bdS�l.NumRec = cPro2.AbsolutePosition
      bdS�l.RefreshNumRec
    End If
    
    rPro.AddNew
    rPro!pro_numpro = cPro2!pro_numpro
    rPro!pro_nom = cPro2!pro_nom
    rPro!pro_critere = cPro2!pro_critere
    rPro!pro_t1 = cPro2!pro_t1
    rPro!pro_t2 = cPro2!pro_t2
    rPro!pro_t3 = cPro2!pro_t3
    rPro!pro_t4 = cPro2!pro_t4
    rPro!pro_t5 = cPro2!pro_t5
    rPro!cri_classedoc = cPro2!cri_classedoc
    
    cPro2.MoveNext
  Loop
  cPro2.CloseCurseur
  SetStatus
  Screen.MousePointer = vbDefault
End Sub

'=================================================================================
' M�morisation

Public Sub M�morise()
  EffaceCollection colM�moireProduit
  
  Dim t As Control
  For Each t In colChamps
    colM�moireProduit.Add (t), t.DataField
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
  sWP = "jou_domaine='" & sTable & " " & colChamps("pro_numpro") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub


