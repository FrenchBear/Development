VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmCrit�re 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des crit�res"
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
   Icon            =   "frmCrit�re.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   433
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   614
   Tag             =   "Donn�es"
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
         Tag             =   "Milieu stock� dans l'�tuve"
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
         Tag             =   "Milieu stock� dans l'�tuve"
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
         Tag             =   "Milieu stock� dans l'�tuve"
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
         Tag             =   "Milieu stock� dans l'�tuve"
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
         Tag             =   "Milieu stock� dans l'�tuve"
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
         Tag             =   "Milieu stock� dans l'�tuve"
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
         Tag             =   "Milieu stock� dans l'�tuve"
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
         Tag             =   "Milieu stock� dans l'�tuve"
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
         Tag             =   "Options du crit�re: R: Revivif, N: Revivif si t�<-10, D ou T"
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
         Tag             =   "Date de validit� du crit�re"
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
         Tag             =   "Initiales du client pour lequel le crit�re est utilis� (ex : MCDO)"
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
         Tag             =   "Famille de produit concern�e"
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
         Tag             =   "Description du crit�re"
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
         Tag             =   "Description du crit�re"
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
         Tag             =   "Description du crit�re"
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
         Tag             =   "Description du crit�re"
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
         Tag             =   "Description du crit�re"
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
         Tag             =   "Description du crit�re"
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
         Tag             =   "Heure de derni�re modification"
         Top             =   3600
         Width           =   915
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_datemodif"
         Height          =   315
         Index           =   10
         Left            =   1680
         TabIndex        =   35
         Tag             =   "Date de derni�re modification"
         Top             =   3600
         Width           =   1035
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_heurecreat"
         Height          =   315
         Index           =   12
         Left            =   2820
         TabIndex        =   32
         Tag             =   "Heure de cr�ation"
         Top             =   3240
         Width           =   915
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "cri_datecreat"
         Height          =   315
         Index           =   13
         Left            =   1680
         TabIndex        =   31
         Tag             =   "Date de cr�ation"
         Top             =   3240
         Width           =   1035
      End
      Begin TablesLabo.BDCombo bdcTypeAnalyse 
         Height          =   330
         Left            =   6300
         TabIndex        =   16
         Tag             =   "Type d'analyse concern�e par le crit�re"
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
      Begin TablesLabo.BDCombo bdcCl�3 
         Height          =   330
         Left            =   1680
         TabIndex        =   13
         Tag             =   "Type de crit�re"
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
         Tag             =   "Personne ayant effectu� la cr�ation"
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
         Tag             =   "Personne ayant effectu� les derni�res modifications"
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
         Caption         =   "Cl�s :"
         Height          =   210
         Index           =   5
         Left            =   0
         TabIndex        =   11
         Top             =   60
         Width           =   540
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Date de validit� :"
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
         Caption         =   "Modifi� le :"
         Height          =   210
         Index           =   2
         Left            =   0
         TabIndex        =   34
         Top             =   3660
         Width           =   1020
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Cr�� le :"
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
      Tag             =   "Titre du crit�re (2�me ligne)"
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
      Tag             =   "Titre du crit�re (1�re ligne)"
      Top             =   840
      Width           =   8250
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   7080
      TabIndex        =   5
      Tag             =   "Date+heure de derni�re modification de l'information"
      Top             =   480
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*cri_version"
      Height          =   315
      Index           =   1
      Left            =   3000
      TabIndex        =   3
      Tag             =   "Version du crit�re"
      Top             =   480
      Width           =   495
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*cri_critere"
      Height          =   315
      Index           =   0
      Left            =   900
      TabIndex        =   1
      Tag             =   "N� interne de l'enregistrement dans la base de donn�es"
      Top             =   480
      Width           =   1035
   End
   Begin TablesLabo.BDS�lecteur bdS�l 
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
            Object.ToolTipText     =   "Description du crit�re et tra�abilit�"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Conclusions"
            Key             =   "Conclusions"
            Object.ToolTipText     =   "Conclusions associ�es aux classes"
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
      Caption         =   "Crit�re :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   780
   End
End
Attribute VB_Name = "frmCrit�re"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmCrit�re
' Feuille de gestion des crit�res
' 18/04/1999 PV, premi�re version
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des d�structions et des cr�ations

Option Explicit

Private iCurFrame As Integer              ' Cadre courant visible

Private cCri As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire
Private sFinalWP As String                ' Where-part de la requ�te SQL courante
Private colChange As New Collection       ' Trace des modifications
Private cold�truit As New Collection      ' Trace de l'enregistrement qui va �tre d�truit
Private colCr�� As New Collection         ' Trace de la cr�ation de l'enregistrement

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
  
  Dim cCriQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cCriQuery.OpenCurseur "select * from critere where " & sWP & " order by cri_critere,cri_version desc"
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
  If Not cCri Is Nothing Then cCri.CloseCurseur
  Set cCri = cCriQuery
  sFinalWP = sWP
  
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  BDS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cCri.EOF And cCri.BOF) Then
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
  
 
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  Dim cCriAdd As New BDCurseur
  cCriAdd.OpenCurseur "select * from critere where cri_critere='@'"
  cCriAdd.AddNew
  
  ' Tra�abilit� ancien style
  colChamps("cri_datecreat") = Today
  colChamps("cri_heurecreat") = 100 * Hour(Now) + Minute(Now)
  colChamps("cri_opercreat") = iNumOp�rateur
  colChamps("cri_datemodif") = Today
  colChamps("cri_heuremodif") = 100 * Hour(Now) + Minute(Now)
  colChamps("cri_opermodif") = iNumOp�rateur
  
  ActiveTra�abilit� True    ' Pour que la base soit mise � jour

  If Not bPr�pareEditAdd(cCriAdd, colColonnes, colChamps) Then
    cCriAdd.CloseCurseur
    ActiveTra�abilit� False
    Exit Sub
  End If
  cCriAdd.CloseCurseur
  
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cCri Is Nothing Then cCri.CloseCurseur
  Set cCri = New BDCurseur
  sFinalWP = "cri_critere=" & sFormToSQL(colChamps("cri_critere"), BDTypeCHAR) & " and cri_version=" & sFormToSQL(colChamps("cri_version"), BDTypeINTEGER)
  cCri.OpenCurseur "select * from critere where " & sFinalWP
  cCri.MoveFirst

  
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
      JournalUnix sTable & " " & colChamps("cri_critere") & " " & colChamps("cri_version"), "cr��", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  
  BDS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDS�l.ActiveMouvements True
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  BDS�l.Emp�cheMouvements
  
  SetMessage
  SetStatus
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cCri Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cCri.Edit
  
  ' Tra�abilit� ancien style
  colChamps("cri_datemodif") = Today
  colChamps("cri_heuremodif") = 100 * Hour(Now) + Minute(Now)
  colChamps("cri_opermodif") = iNumOp�rateur
  
  ActiveTra�abilit� True     ' Pour mettre � jour la base

  If Not bPr�pareEditAdd(cCri, colColonnes, colChamps) Then
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
      JournalUnix sTable & " " & colChamps("cri_critere") & " " & colChamps("cri_version"), "chang�", sMsgTrace
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
  If Not cCri Is Nothing Then
    If Not (cCri.EOF And cCri.BOF) Then
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
  
  colChamps("cri_critere").SetFocus
  BDS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cCri Is Nothing
  
  If cCri.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  BDS�l.ButtonEnabled("Query") = False
  BDS�l.ButtonEnabled("Add") = False
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "cri_critere", False
  ActiveChamp "cri_version", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False
  
  colChamps("cri_titre1").SetFocus
  AutoSelect colChamps("cri_titre1"), True
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
  ActiveChamp "cri_datecreat", bEnable
  ActiveChamp "cri_heurecreat", bEnable
  ActiveChamp "cri_opercreat", bEnable
  ActiveChamp "cri_datemodif", bEnable
  ActiveChamp "cri_heuremodif", bEnable
  ActiveChamp "cri_opermodif", bEnable
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  BDS�l.ButtonEnabled("Query") = False
  BDS�l.ButtonEnabled("Add") = False
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False
  
  colChamps("cri_titre1").SetFocus
  BDS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cCri Is Nothing

  If cCri.bEffac� Then
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
    JournalUnix sTable & " " & colChamps("cri_critere") & " " & colChamps("cri_version"), "d�truit", sMsgTrace
  End If
  
  On Error Resume Next
  cCri.Delete
  If Err Then
    AfficheErreurODBC "�chec de la suppression de l'enregistrement"
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
  
  BDS�l.ActiveMouvements iMode = meNavigate
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cCri Is Nothing

  BDS�l.ButtonEnabled("First") = cCri.AbsolutePosition <> 1
  BDS�l.ButtonEnabled("Previous") = cCri.AbsolutePosition <> 1
  BDS�l.ButtonEnabled("Next") = Not cCri.EOF
  BDS�l.ButtonEnabled("Last") = Not cCri.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cCri.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
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


Private Sub AfficheGermes()
  Dim connex As ADODB.Connection
  Dim rs As ADODB.Recordset
  Dim sSource As String
  
  Set connex = New ADODB.Connection
  sSource = "Provider=MSDASQL;DSN=" & BDSource & ";Driver={Informix}"
  connex.Open sSource
  connex.CursorLocation = adUseClient   ' Le serveur n'implante que des curseurs forward-only
  Dim sSQL As String
  sSQL = "select crl_indice as Ind,crl_germe as germe,crl_unite as unit�,crl_m as m,crl_grandm as M,crl_seuil as s,crl_v1 as v1,crl_v2 as v2,crl_v3 as v3,crl_v4 as v4,crl_v5 as v5,crl_v6 as v6,crl_v7 as v7,crl_usage as Usage,crl_impcpar as ICP from criterel where crl_critere='" & txtChamp(0) & "' and crl_version=" & txtChamp(1) & " order by crl_indice"
  Set rs = New ADODB.Recordset
  On Error Resume Next
  rs.Open sSQL, connex
  If Err <> 0 Then
    MsgBox "Erreur lors de l'ouverture de la requ�te." & vbCrLf & vbCrLf & "Erreur " & Err.Number & " (" & Err.Source & "): " & Err.Description & vbCrLf & vbCrLf & "connex.source: " & sSource & vbCrLf & "SQL: " & sSQL, vbExclamation, App.Title
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

' Champs en majuscules
Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "cri_critere" Then ToMaj txtChamp(Index)
'  If txtChamp(Index).DataField = "cri_xxx" Then ToMaj txtChamp(Index)
End Sub


' ===============================================================
' Gestion des onglets

' Change le frame affich�
Private Sub Page(ByVal sPage)
  ' On ne change que l'onglet, ce code appelle automatiquement tsTab_Click
  Set tsTab.SelectedItem = tsTab.Tabs(sPage)
End Sub

Private Sub tsTab_Click()
  ' Utilise le m�canisme visible/invisible comme il est conseill� dans l'aide
  ' et contrairement � la doc qui pr�ne l'usage du ZOrder�
  ' Avantage: (entre autres, voir l'aide) �vite les conflits d'acc�l�rateurs entre pages
  If tsTab.SelectedItem.Index = iCurFrame Then Exit Sub     ' Inutile de changer le cadre.
  ' Sinon, masque l'ancien cadre et affiche le nouveau.
  fraFeuille(tsTab.SelectedItem.Index).Visible = True
  If iCurFrame >= 0 Then fraFeuille(iCurFrame).Visible = False
  iCurFrame = tsTab.SelectedItem.Index

  ' Accompagnement du focus
  Select Case tsTab.SelectedItem.Key
    Case "Description": bdcCl�3.SetFocus
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
    Case 1: bdcCl�3.SetFocus
    
    ' Conclusions
    Case 2: bdcConclusion(8).SetFocus
    Case 3: bdcConclusion(1).SetFocus
    
    Case Else: Stop
  End Select
End Sub


'=================================================================================
' Fonctions de service (form)

Private Sub Form_Load()
MsgBox "Trace chargement frmCrit�re: 1"
  ' On rend invisibles les pi�ges � focus (le fond est visible sur la feuille pour le d�veloppement)
  Dim ct As TextBox
  For Each ct In txtBouclageFocus
    ct.BackColor = &H8000000F
    ct.Visible = False
  Next
  
MsgBox "Trace chargement frmCrit�re: 2"
  ' On met les frames en t�te de pile d'affichage, sinon certains sont derri�re le tsTab
  Dim F As Frame
  For Each F In fraFeuille
    F.ZOrder 0
  Next
  
MsgBox "Trace chargement frmCrit�re: 3"
  Show
  iCurFrame = -1   ' Pour forcer le passage � la page 0
  Page "Description"

  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  ' Chargement des combos
  Dim cCon As New BDCurseur, sLibell� As String
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
  
  bdcCl�3.AddItem "R", "R�glementaire"
  bdcCl�3.AddItem "A", "Administratif"
  bdcCl�3.AddItem "C", "Client"
  bdcCl�3.AddItem "E", "Ercem"
  
  bdcTypeAnalyse.AddItem "1", "AB Std"
  bdcTypeAnalyse.AddItem "2", "List�ria"
  bdcTypeAnalyse.AddItem "3", "FS"
  bdcTypeAnalyse.AddItem "4", "Atmosph�re"
  bdcTypeAnalyse.AddItem "5", "Eaux"
  bdcTypeAnalyse.AddItem "6", "ABVT"
  bdcTypeAnalyse.AddItem "7", "Huile"
  bdcTypeAnalyse.AddItem "8", "Tests labo"
  bdcTypeAnalyse.AddItem "9", "Gla�ons"


  ' Formulaire en mode initial
  Set cCri = Nothing
  ActiveFormulaire False
  BDS�l.LectureSeule = bLectureSeule
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  BDS�l.SetFocus
  
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
  If Not cCri Is Nothing Then cCri.CloseCurseur
  MDILabo.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


Private Sub Form_Resize()
  ' On retaille le tabstrip�
  tsTab.Move 4, 128, ScaleWidth - 8, ScaleHeight - 132
  
  ' Puis les frames contenant les contr�les
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
    BDS�l.NumRec = cCri.AbsolutePosition
  End If
  AfficheGermes
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cCri.bEffac� = True
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

Private Sub bdS�l_GotFocus()
  SetStatus
End Sub

Private Sub bdcConclusion_GotFocus(Index As Integer)
  SetStatus bdcConclusion(Index).Tag
End Sub

Private Sub bdcConclusion_LostFocus(Index As Integer)
  bdcConclusion(Index).Synchronise
End Sub

Private Sub bdcCl�3_GotFocus()
  SetStatus bdcCl�3.Tag
End Sub

Private Sub bdcCl�3_LostFocus()
  bdcCl�3.Synchronise
End Sub

Private Sub bdcTypeAnalyse_GotFocus()
  SetStatus bdcTypeAnalyse.Tag
End Sub

Private Sub bdcTypeAnalyse_LostFocus()
  bdcTypeAnalyse.Synchronise
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
  BDCopieS�lection cCri, colChamps, BDS�l
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
  'Dim sSQL As String, sSQLT�te As String, sSQLCorps As String
  'sSQLT�te = "select unique etu_numero,etu_reference,etu_marque,etu_capacite from etuve where " & sFinalWP
  'sSQLCorps = "select * from critere where " & sFinalWP & " and mil_indice=etu_milieu"
  'sSQL = "SHAPE {" & sSQLT�te & "} AS T�te APPEND ({" & sSQLCorps & "} AS Corps RELATE 'etu_numero' TO 'etu_numero') AS Corps"

  Dim sSQL As String
  sSQL = "select * from critere where " & sFinalWP & " order by cri_critere,cri_version"
  BDEtat sSQL, drCrit�reTableau, bImpression
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

