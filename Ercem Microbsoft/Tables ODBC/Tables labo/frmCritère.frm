VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmCritère 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des critères"
   ClientHeight    =   6495
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   9210
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmCritère.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   433
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   614
   Tag             =   "Données"
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1395
      Index           =   3
      Left            =   1740
      TabIndex        =   52
      Top             =   2220
      Visible         =   0   'False
      Width           =   3735
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid fgGermes 
         Height          =   795
         Left            =   660
         TabIndex        =   53
         Top             =   120
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   1402
         _Version        =   393216
         FixedCols       =   0
         SelectionMode   =   1
         AllowUserResizing=   1
         BorderStyle     =   0
         RowSizingMode   =   1
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   915
      Index           =   2
      Left            =   300
      TabIndex        =   39
      Top             =   3360
      Visible         =   0   'False
      Width           =   855
      Begin VB.TextBox txtBouclageFocus 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   3
         Left            =   1680
         TabIndex        =   50
         Top             =   2940
         Width           =   255
      End
      Begin VB.TextBox txtBouclageFocus 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   2
         Left            =   1380
         TabIndex        =   41
         Top             =   0
         Width           =   255
      End
      Begin TablesLabo.BDCombo bdcConclusion 
         Height          =   330
         Index           =   1
         Left            =   1680
         TabIndex        =   42
         Tag             =   "Milieu stocké dans l'étuve"
         Top             =   0
         Width           =   5535
         _ExtentX        =   9763
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
         DataField       =   "cri_conc1"
      End
      Begin TablesLabo.BDCombo bdcConclusion 
         Height          =   330
         Index           =   3
         Left            =   1680
         TabIndex        =   44
         Tag             =   "Milieu stocké dans l'étuve"
         Top             =   720
         Width           =   5535
         _ExtentX        =   9763
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
         DataField       =   "cri_conc3"
      End
      Begin TablesLabo.BDCombo bdcConclusion 
         Height          =   330
         Index           =   2
         Left            =   1680
         TabIndex        =   43
         Tag             =   "Milieu stocké dans l'étuve"
         Top             =   360
         Width           =   5535
         _ExtentX        =   9763
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
         DataField       =   "cri_conc2"
      End
      Begin TablesLabo.BDCombo bdcConclusion 
         Height          =   330
         Index           =   8
         Left            =   1680
         TabIndex        =   49
         Tag             =   "Milieu stocké dans l'étuve"
         Top             =   2520
         Width           =   5535
         _ExtentX        =   9763
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
         DataField       =   "cri_conc8"
      End
      Begin TablesLabo.BDCombo bdcConclusion 
         Height          =   330
         Index           =   4
         Left            =   1680
         TabIndex        =   45
         Tag             =   "Milieu stocké dans l'étuve"
         Top             =   1080
         Width           =   5535
         _ExtentX        =   9763
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
         DataField       =   "cri_conc4"
      End
      Begin TablesLabo.BDCombo bdcConclusion 
         Height          =   330
         Index           =   5
         Left            =   1680
         TabIndex        =   46
         Tag             =   "Milieu stocké dans l'étuve"
         Top             =   1440
         Width           =   5535
         _ExtentX        =   9763
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
         DataField       =   "cri_conc5"
      End
      Begin TablesLabo.BDCombo bdcConclusion 
         Height          =   330
         Index           =   6
         Left            =   1680
         TabIndex        =   47
         Tag             =   "Milieu stocké dans l'étuve"
         Top             =   1800
         Width           =   5535
         _ExtentX        =   9763
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
         DataField       =   "cri_conc6"
      End
      Begin TablesLabo.BDCombo bdcConclusion 
         Height          =   330
         Index           =   7
         Left            =   1680
         TabIndex        =   48
         Tag             =   "Milieu stocké dans l'étuve"
         Top             =   2160
         Width           =   5535
         _ExtentX        =   9763
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
         DataField       =   "cri_conc7"
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Conclusions :"
         Height          =   210
         Index           =   4
         Left            =   0
         TabIndex        =   40
         Top             =   60
         Width           =   1260
      End
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   975
      Index           =   1
      Left            =   300
      TabIndex        =   10
      Top             =   2220
      Visible         =   0   'False
      Width           =   855
      Begin VB.TextBox txtBouclageFocus 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   1
         Left            =   1680
         TabIndex        =   38
         Top             =   3960
         Width           =   255
      End
      Begin VB.TextBox txtBouclageFocus 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   0
         Left            =   1140
         TabIndex        =   12
         Top             =   0
         Width           =   255
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_options"
         Height          =   315
         Index           =   3
         Left            =   1680
         MaxLength       =   10
         TabIndex        =   27
         Tag             =   "Options du critère: R: Revivif, N: Revivif si t°<-10, D ou T"
         Top             =   2880
         Width           =   1875
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_datevalid"
         Height          =   315
         Index           =   6
         Left            =   5520
         MaxLength       =   30
         TabIndex        =   29
         Tag             =   "Date de validité du critère"
         Top             =   2880
         Width           =   1515
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_cle1"
         Height          =   315
         Index           =   7
         Left            =   5040
         MaxLength       =   5
         TabIndex        =   15
         Tag             =   "Initiales du client pour lequel le critère est utilisé (ex : MCDO)"
         Top             =   0
         Width           =   1215
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_cle2"
         Height          =   315
         Index           =   9
         Left            =   4260
         MaxLength       =   2
         TabIndex        =   14
         Tag             =   "Famille de produit concernée"
         Top             =   0
         Width           =   735
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_desc2"
         Height          =   315
         Index           =   19
         Left            =   1680
         MaxLength       =   75
         TabIndex        =   19
         Tag             =   "Description du critère"
         Top             =   720
         Width           =   8000
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_desc1"
         Height          =   315
         Index           =   20
         Left            =   1680
         MaxLength       =   75
         TabIndex        =   18
         Tag             =   "Description du critère"
         Top             =   360
         Width           =   8000
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_desc4"
         Height          =   315
         Index           =   21
         Left            =   1680
         MaxLength       =   75
         TabIndex        =   21
         Tag             =   "Description du critère"
         Top             =   1440
         Width           =   8000
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_desc3"
         Height          =   315
         Index           =   22
         Left            =   1680
         MaxLength       =   75
         TabIndex        =   20
         Tag             =   "Description du critère"
         Top             =   1080
         Width           =   8000
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_desc6"
         Height          =   315
         Index           =   23
         Left            =   1680
         MaxLength       =   75
         TabIndex        =   23
         Tag             =   "Description du critère"
         Top             =   2160
         Width           =   8000
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_desc5"
         Height          =   315
         Index           =   24
         Left            =   1680
         MaxLength       =   75
         TabIndex        =   22
         Tag             =   "Description du critère"
         Top             =   1800
         Width           =   8000
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_comment"
         Height          =   315
         Index           =   25
         Left            =   1680
         MaxLength       =   75
         TabIndex        =   25
         Tag             =   "Commentaire libre"
         Top             =   2520
         Width           =   8000
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_heuremodif"
         Height          =   315
         Index           =   2
         Left            =   2820
         TabIndex        =   36
         Tag             =   "Heure de dernière modification"
         Top             =   3600
         Width           =   915
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_datemodif"
         Height          =   315
         Index           =   10
         Left            =   1680
         TabIndex        =   35
         Tag             =   "Date de dernière modification"
         Top             =   3600
         Width           =   1035
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_heurecreat"
         Height          =   315
         Index           =   12
         Left            =   2820
         TabIndex        =   32
         Tag             =   "Heure de création"
         Top             =   3240
         Width           =   915
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_datecreat"
         Height          =   315
         Index           =   13
         Left            =   1680
         TabIndex        =   31
         Tag             =   "Date de création"
         Top             =   3240
         Width           =   1035
      End
      Begin TablesLabo.BDCombo bdcTypeAnalyse 
         Height          =   330
         Left            =   6300
         TabIndex        =   16
         Tag             =   "Type d'analyse concernée par le critère"
         Top             =   0
         Width           =   1935
         _ExtentX        =   3413
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
         DataField       =   "cri_cle4"
      End
      Begin TablesLabo.BDCombo bdcClé3 
         Height          =   330
         Left            =   1680
         TabIndex        =   13
         Tag             =   "Type de critère"
         Top             =   0
         Width           =   2535
         _ExtentX        =   4471
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
         DataField       =   "cri_cle3"
      End
      Begin TablesLabo.BDCombo bdcOperCreat 
         Height          =   330
         Left            =   3840
         TabIndex        =   33
         Tag             =   "Personne ayant effectué la création"
         Top             =   3240
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
         DataField       =   "cri_opercreat"
      End
      Begin TablesLabo.BDCombo bdcOperModif 
         Height          =   330
         Left            =   3840
         TabIndex        =   37
         Tag             =   "Personne ayant effectué les dernières modifications"
         Top             =   3600
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
         DataField       =   "cri_opermodif"
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Options :"
         Height          =   210
         Index           =   3
         Left            =   0
         TabIndex        =   26
         Top             =   2940
         Width           =   870
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Clés :"
         Height          =   210
         Index           =   5
         Left            =   0
         TabIndex        =   11
         Top             =   60
         Width           =   540
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Date de validité :"
         Height          =   210
         Index           =   8
         Left            =   3840
         TabIndex        =   28
         Top             =   2940
         Width           =   1620
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Description :"
         Height          =   210
         Index           =   7
         Left            =   0
         TabIndex        =   17
         Top             =   360
         Width           =   1185
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Commentaire :"
         Height          =   210
         Index           =   19
         Left            =   0
         TabIndex        =   24
         Top             =   2580
         Width           =   1395
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifié le :"
         Height          =   210
         Index           =   2
         Left            =   0
         TabIndex        =   34
         Top             =   3660
         Width           =   1020
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Créé le :"
         Height          =   210
         Index           =   9
         Left            =   0
         TabIndex        =   30
         Top             =   3300
         Width           =   810
      End
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "cri_titre2"
      Height          =   315
      Index           =   5
      Left            =   900
      MaxLength       =   75
      TabIndex        =   8
      Tag             =   "Titre du critère (2ème ligne)"
      Top             =   1200
      Width           =   8250
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*cri_titre1"
      Height          =   315
      Index           =   4
      Left            =   900
      MaxLength       =   75
      TabIndex        =   7
      Tag             =   "Titre du critère (1ère ligne)"
      Top             =   840
      Width           =   8250
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   7080
      TabIndex        =   5
      Tag             =   "Date+heure de dernière modification de l'information"
      Top             =   480
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*cri_version"
      Height          =   315
      Index           =   1
      Left            =   3000
      TabIndex        =   3
      Tag             =   "Version du critère"
      Top             =   480
      Width           =   495
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*cri_critere"
      Height          =   315
      Index           =   0
      Left            =   900
      TabIndex        =   1
      Tag             =   "N° interne de l'enregistrement dans la base de données"
      Top             =   480
      Width           =   1035
   End
   Begin TablesLabo.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   51
      Top             =   0
      Width           =   9210
      _ExtentX        =   16245
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
   Begin MSComctlLib.TabStrip tsTab 
      Height          =   435
      Left            =   1800
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   1620
      Width           =   4455
      _ExtentX        =   7858
      _ExtentY        =   767
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   3
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Description"
            Key             =   "Description"
            Object.ToolTipText     =   "Description du critère et traçabilité"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Conclusions"
            Key             =   "Conclusions"
            Object.ToolTipText     =   "Conclusions associées aux classes"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Germes"
            Key             =   "Germes"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Titre :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   6
      Top             =   900
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   5760
      TabIndex        =   4
      Top             =   540
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Version :"
      Height          =   210
      Index           =   1
      Left            =   2100
      TabIndex        =   2
      Top             =   540
      Width           =   840
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Critère :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   780
   End
End
Attribute VB_Name = "frmCritère"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmCritère
' Feuille de gestion des critères
' 18/04/1999 PV, première version
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des déstructions et des créations

Option Explicit

Private iCurFrame As Integer              ' Cadre courant visible

Private cCri As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private sFinalWP As String                ' Where-part de la requête SQL courante
Private colChange As New Collection       ' Trace des modifications
Private coldétruit As New Collection      ' Trace de l'enregistrement qui va être détruit
Private colCréé As New Collection         ' Trace de la création de l'enregistrement

Private Const sTable = "critere"


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
  
  Dim cCriQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cCriQuery.OpenCurseur "select * from critere where " & sWP & " order by cri_critere,cri_version desc"
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
  If Not cCri Is Nothing Then cCri.CloseCurseur
  Set cCri = cCriQuery
  sFinalWP = sWP
  
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  BDSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cCri.EOF And cCri.BOF) Then
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
  Dim i As Integer
  
  bOkValeurs = False
  
  For i = 1 To 8
    If bdcConclusion(i) <> "" Then
      bdcConclusion(i).Synchronise
      If bdcConclusion(i).ListIndex < 0 Then
        MsgBox "Conclusion inconnue !", vbExclamation, App.Title
        bdcConclusion(i).SetFocus
        Exit Function
      End If
    End If
  Next
  
 
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  Dim cCriAdd As New BDCurseur
  cCriAdd.OpenCurseur "select * from critere where cri_critere='@'"
  cCriAdd.AddNew
  
  ' Traçabilité ancien style
  colChamps("cri_datecreat") = Today
  colChamps("cri_heurecreat") = 100 * Hour(Now) + Minute(Now)
  colChamps("cri_opercreat") = iNumOpérateur
  colChamps("cri_datemodif") = Today
  colChamps("cri_heuremodif") = 100 * Hour(Now) + Minute(Now)
  colChamps("cri_opermodif") = iNumOpérateur
  
  ActiveTraçabilité True    ' Pour que la base soit mise à jour

  If Not bPrépareEditAdd(cCriAdd, colColonnes, colChamps) Then
    cCriAdd.CloseCurseur
    ActiveTraçabilité False
    Exit Sub
  End If
  cCriAdd.CloseCurseur
  
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cCri Is Nothing Then cCri.CloseCurseur
  Set cCri = New BDCurseur
  sFinalWP = "cri_critere=" & sFormToSQL(colChamps("cri_critere"), BDTypeCHAR) & " and cri_version=" & sFormToSQL(colChamps("cri_version"), BDTypeINTEGER)
  cCri.OpenCurseur "select * from critere where " & sFinalWP
  cCri.MoveFirst

  
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
      JournalUnix sTable & " " & colChamps("cri_critere") & " " & colChamps("cri_version"), "créé", sMsgTrace
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
  Assert Not cCri Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cCri.Edit
  
  ' Traçabilité ancien style
  colChamps("cri_datemodif") = Today
  colChamps("cri_heuremodif") = 100 * Hour(Now) + Minute(Now)
  colChamps("cri_opermodif") = iNumOpérateur
  
  ActiveTraçabilité True     ' Pour mettre à jour la base

  If Not bPrépareEditAdd(cCri, colColonnes, colChamps) Then
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
      JournalUnix sTable & " " & colChamps("cri_critere") & " " & colChamps("cri_version"), "changé", sMsgTrace
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
  If Not cCri Is Nothing Then
    If Not (cCri.EOF And cCri.BOF) Then
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
  
  colChamps("cri_critere").SetFocus
  BDSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cCri Is Nothing
  
  If cCri.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "cri_critere", False
  ActiveChamp "cri_version", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  colChamps("cri_titre1").SetFocus
  AutoSelect colChamps("cri_titre1"), True
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
  ActiveChamp "cri_datecreat", bEnable
  ActiveChamp "cri_heurecreat", bEnable
  ActiveChamp "cri_opercreat", bEnable
  ActiveChamp "cri_datemodif", bEnable
  ActiveChamp "cri_heuremodif", bEnable
  ActiveChamp "cri_opermodif", bEnable
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
  ActiveTraçabilité False
  
  colChamps("cri_titre1").SetFocus
  BDSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cCri Is Nothing

  If cCri.bEffacé Then
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
    JournalUnix sTable & " " & colChamps("cri_critere") & " " & colChamps("cri_version"), "détruit", sMsgTrace
  End If
  
  On Error Resume Next
  cCri.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cCri.MoveNext
  If cCri.EOF Then
    cCri.MovePrevious
    If cCri.BOF Then
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
  Assert Not cCri Is Nothing

  BDSél.ButtonEnabled("First") = cCri.AbsolutePosition <> 1
  BDSél.ButtonEnabled("Previous") = cCri.AbsolutePosition <> 1
  BDSél.ButtonEnabled("Next") = Not cCri.EOF
  BDSél.ButtonEnabled("Last") = Not cCri.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cCri.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cCri.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cCri.MoveNext
  AjusteMouvements
  If cCri.EOF Then cCri.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cCri.MovePrevious
  AjusteMouvements
  If cCri.BOF Then cCri.MoveFirst
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


Private Sub AfficheGermes()
  Dim connex As ADODB.Connection
  Dim rs As ADODB.Recordset
  Dim sSource As String
  
  Set connex = New ADODB.Connection
  sSource = "Provider=MSDASQL;DSN=" & BDSource & ";Driver={Informix}"
  connex.Open sSource
  connex.CursorLocation = adUseClient   ' Le serveur n'implante que des curseurs forward-only
  Dim sSQL As String
  sSQL = "select crl_indice as Ind,crl_germe as germe,crl_unite as unité,crl_m as m,crl_grandm as M,crl_seuil as s,crl_v1 as v1,crl_v2 as v2,crl_v3 as v3,crl_v4 as v4,crl_v5 as v5,crl_v6 as v6,crl_v7 as v7,crl_usage as Usage,crl_impcpar as ICP from criterel where crl_critere='" & txtChamp(0) & "' and crl_version=" & txtChamp(1) & " order by crl_indice"
  Set rs = New ADODB.Recordset
  On Error Resume Next
  rs.Open sSQL, connex
  If Err <> 0 Then
    MsgBox "Erreur lors de l'ouverture de la requête." & vbCrLf & vbCrLf & "Erreur " & Err.Number & " (" & Err.Source & "): " & Err.Description & vbCrLf & vbCrLf & "connex.source: " & sSource & vbCrLf & "SQL: " & sSQL, vbExclamation, App.Title
    Exit Sub
  End If
  
  Set fgGermes.DataSource = rs
End Sub

' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
' Changement d'onglet avec PgPrec/PgSuiv
  If KeyCode = vbKeyPageUp Then
    If tsTab.SelectedItem.Index > 1 Then Page tsTab.SelectedItem.Index - 1
    KeyCode = 0
  ElseIf KeyCode = vbKeyPageDown Then
    If tsTab.SelectedItem.Index < tsTab.Tabs.Count Then Page tsTab.SelectedItem.Index + 1
    KeyCode = 0
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

' Champs en majuscules
Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "cri_critere" Then ToMaj txtChamp(Index)
'  If txtChamp(Index).DataField = "cri_xxx" Then ToMaj txtChamp(Index)
End Sub


' ===============================================================
' Gestion des onglets

' Change le frame affiché
Private Sub Page(ByVal sPage)
  ' On ne change que l'onglet, ce code appelle automatiquement tsTab_Click
  Set tsTab.SelectedItem = tsTab.Tabs(sPage)
End Sub

Private Sub tsTab_Click()
  ' Utilise le mécanisme visible/invisible comme il est conseillé dans l'aide
  ' et contrairement à la doc qui prône l'usage du ZOrder…
  ' Avantage: (entre autres, voir l'aide) évite les conflits d'accélérateurs entre pages
  If tsTab.SelectedItem.Index = iCurFrame Then Exit Sub     ' Inutile de changer le cadre.
  ' Sinon, masque l'ancien cadre et affiche le nouveau.
  fraFeuille(tsTab.SelectedItem.Index).Visible = True
  If iCurFrame >= 0 Then fraFeuille(iCurFrame).Visible = False
  iCurFrame = tsTab.SelectedItem.Index

  ' Accompagnement du focus
  Select Case tsTab.SelectedItem.Key
    Case "Description": bdcClé3.SetFocus
    Case "Conclusions": bdcConclusion(1).SetFocus
    Case "Germes": fgGermes.SetFocus
    Case Else: Stop
  End Select
End Sub


' Bouclage du focus sur les diverses pages
Private Sub txtBouclageFocus_GotFocus(Index As Integer)
  Select Case Index
    ' Description
    Case 0: bdcOperModif.SetFocus
    Case 1: bdcClé3.SetFocus
    
    ' Conclusions
    Case 2: bdcConclusion(8).SetFocus
    Case 3: bdcConclusion(1).SetFocus
    
    Case Else: Stop
  End Select
End Sub


'=================================================================================
' Fonctions de service (form)

Private Sub Form_Load()
MsgBox "Trace chargement frmCritère: 1"
  ' On rend invisibles les pièges à focus (le fond est visible sur la feuille pour le développement)
  Dim ct As TextBox
  For Each ct In txtBouclageFocus
    ct.BackColor = &H8000000F
    ct.Visible = False
  Next
  
MsgBox "Trace chargement frmCritère: 2"
  ' On met les frames en tête de pile d'affichage, sinon certains sont derrière le tsTab
  Dim F As Frame
  For Each F In fraFeuille
    F.ZOrder 0
  Next
  
MsgBox "Trace chargement frmCritère: 3"
  Show
  iCurFrame = -1   ' Pour forcer le passage à la page 0
  Page "Description"

  SetStatus "Chargement en cours, patientez…"
  If colColonnes.Count = 0 Then
    BDDécritTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  ' Chargement des combos
  Dim cCon As New BDCurseur, sLibellé As String
  Dim i As Integer
  cCon.OpenCurseur "select con_indice,con_libelle from conclusion where con_langue='F' order by con_indice"
  While Not cCon.EOF
    For i = 1 To 8
      bdcConclusion(i).AddItem cCon!con_indice, cCon!con_libelle
    Next
    cCon.MoveNext
  Wend
  cCon.CloseCurseur
  
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcOperCreat.AddItem u.uti_numuti, u.uti_nom
    bdcOperModif.AddItem u.uti_numuti, u.uti_nom
  Next
  
  bdcClé3.AddItem "R", "Réglementaire"
  bdcClé3.AddItem "A", "Administratif"
  bdcClé3.AddItem "C", "Client"
  bdcClé3.AddItem "E", "Ercem"
  
  bdcTypeAnalyse.AddItem "1", "AB Std"
  bdcTypeAnalyse.AddItem "2", "Listéria"
  bdcTypeAnalyse.AddItem "3", "FS"
  bdcTypeAnalyse.AddItem "4", "Atmosphère"
  bdcTypeAnalyse.AddItem "5", "Eaux"
  bdcTypeAnalyse.AddItem "6", "ABVT"
  bdcTypeAnalyse.AddItem "7", "Huile"
  bdcTypeAnalyse.AddItem "8", "Tests labo"
  bdcTypeAnalyse.AddItem "9", "Glaçons"


  ' Formulaire en mode initial
  Set cCri = Nothing
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
  If Not cCri Is Nothing Then cCri.CloseCurseur
  MDILabo.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


Private Sub Form_Resize()
  ' On retaille le tabstrip…
  tsTab.Move 4, 128, ScaleWidth - 8, ScaleHeight - 132
  
  ' Puis les frames contenant les contrôles
  Dim F As Frame
  For Each F In fraFeuille
    F.Move tsTab.ClientLeft + 2, tsTab.ClientTop + 6, tsTab.ClientWidth - 2, tsTab.ClientHeight - 4
  Next
  
  Dim xTwips As Integer, yTwips As Integer
  xTwips = fraFeuille(1).Width * Screen.TwipsPerPixelX
  yTwips = fraFeuille(1).Height * Screen.TwipsPerPixelY
  
  Dim i As Integer, w As Integer
  w = xTwips - bdcConclusion(1).Left - 20
  For i = 1 To 8
    bdcConclusion(i).Width = w
  Next
  For i = 19 To 25
    txtChamp(i).Width = w
  Next
  
  fgGermes.Move 0, 0, xTwips - 20, yTwips - 20
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cCri Is Nothing Then
    EffaceFormulaire
  ElseIf cCri.BOF And cCri.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cCri.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cCri.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    BDSél.NumRec = cCri.AbsolutePosition
  End If
  AfficheGermes
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cCri.bEffacé = True
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
  fgGermes.Clear
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

Private Sub bdSél_GotFocus()
  SetStatus
End Sub

Private Sub bdcConclusion_GotFocus(Index As Integer)
  SetStatus bdcConclusion(Index).Tag
End Sub

Private Sub bdcConclusion_LostFocus(Index As Integer)
  bdcConclusion(Index).Synchronise
End Sub

Private Sub bdcClé3_GotFocus()
  SetStatus bdcClé3.Tag
End Sub

Private Sub bdcClé3_LostFocus()
  bdcClé3.Synchronise
End Sub

Private Sub bdcTypeAnalyse_GotFocus()
  SetStatus bdcTypeAnalyse.Tag
End Sub

Private Sub bdcTypeAnalyse_LostFocus()
  bdcTypeAnalyse.Synchronise
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
  BDCopieSélection cCri, colChamps, BDSél
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
  'Dim sSQL As String, sSQLTête As String, sSQLCorps As String
  'sSQLTête = "select unique etu_numero,etu_reference,etu_marque,etu_capacite from etuve where " & sFinalWP
  'sSQLCorps = "select * from critere where " & sFinalWP & " and mil_indice=etu_milieu"
  'sSQL = "SHAPE {" & sSQLTête & "} AS Tête APPEND ({" & sSQLCorps & "} AS Corps RELATE 'etu_numero' TO 'etu_numero') AS Corps"

  Dim sSQL As String
  sSQL = "select * from critere where " & sFinalWP & " order by cri_critere,cri_version"
  BDEtat sSQL, drCritèreTableau, bImpression
End Sub

'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("cri_critere") & " " & colChamps("cri_version") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub

