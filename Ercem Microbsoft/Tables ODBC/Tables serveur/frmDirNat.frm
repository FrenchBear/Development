VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmDirNat 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des directions nationales"
   ClientHeight    =   6630
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
   Icon            =   "frmDirNat.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   442
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   608
   Tag             =   "Donn�es"
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   7080
      Top             =   1020
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^dna_optedition"
      Height          =   315
      Index           =   18
      Left            =   1740
      MaxLength       =   5
      TabIndex        =   26
      Top             =   3720
      Width           =   795
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^dna_optlabo"
      Height          =   315
      Index           =   17
      Left            =   4140
      MaxLength       =   5
      TabIndex        =   28
      Top             =   3720
      Width           =   795
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^dna_bdist"
      Height          =   315
      Index           =   12
      Left            =   2520
      MaxLength       =   37
      TabIndex        =   14
      Top             =   1920
      Width           =   4275
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^*dna_nom"
      Height          =   315
      Index           =   4
      Left            =   1740
      MaxLength       =   41
      TabIndex        =   7
      Top             =   840
      Width           =   5055
   End
   Begin TablesServeur.BDCombo bdcPays 
      Height          =   330
      Left            =   6540
      TabIndex        =   19
      Top             =   2280
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
      DataField       =   "dna_pays"
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^dna_etat"
      Height          =   315
      Index           =   1
      Left            =   3360
      TabIndex        =   3
      Top             =   480
      Width           =   315
   End
   Begin TablesServeur.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   47
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
   Begin TablesServeur.BDCombo bdcGroupe 
      Height          =   330
      Left            =   1740
      TabIndex        =   20
      Top             =   2640
      Width           =   6015
      _ExtentX        =   10610
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
      DataField       =   "*dna_numgrp"
   End
   Begin VB.Frame frlTra�abilit� 
      Caption         =   "Tra�abilit�"
      Height          =   1695
      Left            =   60
      TabIndex        =   33
      Top             =   4920
      Width           =   9015
      Begin TablesServeur.BDCombo bdcOperCreat 
         Height          =   330
         Left            =   3780
         TabIndex        =   37
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
         DataField       =   "dna_opercreat"
      End
      Begin TablesServeur.BDCombo bdcOperModif 
         Height          =   330
         Left            =   3780
         TabIndex        =   41
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
         DataField       =   "dna_opermodif"
      End
      Begin TablesServeur.BDCombo bdcOperValid 
         Height          =   330
         Left            =   3780
         TabIndex        =   44
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
         DataField       =   "dna_opervalid"
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   14
         Left            =   1680
         TabIndex        =   46
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
         DataField       =   "dna_tsvalid"
         Height          =   315
         Index           =   25
         Left            =   1680
         TabIndex        =   43
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
         DataField       =   "dna_datecreat"
         Height          =   315
         Index           =   23
         Left            =   1680
         TabIndex        =   35
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
         DataField       =   "dna_heurecreat"
         Height          =   315
         Index           =   22
         Left            =   2760
         TabIndex        =   36
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
         DataField       =   "dna_datemodif"
         Height          =   315
         Index           =   21
         Left            =   1680
         TabIndex        =   39
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
         DataField       =   "dna_heuremodif"
         Height          =   315
         Index           =   20
         Left            =   2760
         TabIndex        =   40
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
         TabIndex        =   45
         Top             =   1380
         Width           =   1155
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Valid� le :"
         Height          =   210
         Index           =   19
         Left            =   120
         TabIndex        =   42
         Top             =   1020
         Width           =   930
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Cr�� le :"
         Height          =   210
         Index           =   17
         Left            =   120
         TabIndex        =   34
         Top             =   300
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifi� le :"
         Height          =   210
         Index           =   16
         Left            =   120
         TabIndex        =   38
         Top             =   660
         Width           =   1020
      End
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dna_interloc"
      Height          =   315
      Index           =   19
      Left            =   1740
      TabIndex        =   24
      Top             =   3360
      Width           =   5115
      _ExtentX        =   9022
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   40
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dna_cpost"
      Height          =   315
      Index           =   16
      Left            =   1740
      TabIndex        =   13
      Top             =   1920
      Width           =   735
      _ExtentX        =   1296
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   5
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dna_fax"
      Height          =   315
      Index           =   13
      Left            =   3840
      TabIndex        =   17
      Top             =   2280
      Width           =   1995
      _ExtentX        =   3519
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   16
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dna_corresp"
      Height          =   315
      Index           =   9
      Left            =   1740
      TabIndex        =   22
      Top             =   3000
      Width           =   6015
      _ExtentX        =   10610
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   49
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dna_tel"
      Height          =   315
      Index           =   7
      Left            =   1740
      TabIndex        =   16
      Top             =   2280
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   16
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dna_loc"
      Height          =   315
      Index           =   6
      Left            =   1740
      TabIndex        =   11
      Top             =   1560
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   41
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dna_rue"
      Height          =   315
      Index           =   5
      Left            =   1740
      TabIndex        =   9
      Top             =   1200
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   41
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dna_fdr"
      Height          =   555
      Index           =   10
      Left            =   1740
      TabIndex        =   32
      Top             =   4440
      Width           =   7350
      _ExtentX        =   12965
      _ExtentY        =   979
      _Version        =   393216
      ScrollBars      =   2
      MultiLine       =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dna_origine"
      Height          =   315
      Index           =   3
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
      DataField       =   "dna_comment"
      Height          =   315
      Index           =   2
      Left            =   1740
      TabIndex        =   30
      Top             =   4080
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
      DataField       =   "*dna_numdna"
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
      Caption         =   "Groupe :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   210
      Index           =   69
      Left            =   60
      MousePointer    =   10  'Up Arrow
      TabIndex        =   48
      ToolTipText     =   "Affiche le groupe"
      Top             =   2700
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Pays :"
      Height          =   210
      Index           =   15
      Left            =   5880
      TabIndex        =   18
      Top             =   2340
      Width           =   585
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Interlocuteur :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   23
      Top             =   3420
      Width           =   1365
   End
   Begin VB.Label lblOptions 
      AutoSize        =   -1  'True
      Caption         =   "Options �dition:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   210
      Index           =   1
      Left            =   60
      MousePointer    =   10  'Up Arrow
      TabIndex        =   25
      Top             =   3780
      Width           =   1575
   End
   Begin VB.Label lblOptions 
      AutoSize        =   -1  'True
      Caption         =   "Options labo:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   210
      Index           =   2
      Left            =   2700
      MousePointer    =   10  'Up Arrow
      TabIndex        =   27
      Top             =   3780
      Width           =   1320
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Correspondant :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   21
      Top             =   3060
      Width           =   1560
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Localit� :"
      Height          =   210
      Index           =   8
      Left            =   60
      TabIndex        =   10
      Top             =   1620
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Rue :"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   8
      Top             =   1260
      Width           =   495
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
      Caption         =   "Feuille de route :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   31
      Top             =   4500
      Width           =   1605
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Tel / Fax :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   15
      Top             =   2340
      Width           =   930
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "CPost / BD :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   12
      Top             =   1980
      Width           =   1140
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
      TabIndex        =   29
      Top             =   4140
      Width           =   1200
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "�tat :"
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
Attribute VB_Name = "frmDirNat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmDirNat
' Feuille de gestion des directions nationales
' 10/05/1999 PV
'  6/08/1999 PV synchrodelete
' 23/11/1999 PV Acc�s direct, liens internes, www.silliker
'  8/02/2000 PV Avertissement avant le passage � l'�tat S
'  5/09/2000 PV S�lection hi�rarchique; AfficheDirNat via where-part
' 13/02/2001 PV Tra�abilit� des op�rations g�n�rales
'  9/04/2001 PV M�canisme de m�morisation (F5)
' 18/05/2001 PV bOp�rationG�n�rale
' 21/05/2001 PV Modification de requ�te avanc�e; �tat supprim� correctement g�r� en query
' 31/11/2001 FF Historique des modifications
' 03/12/2001 FF Historique des suppressions et des destructions
' 04/12/2001 FF Historique des cr�ations
' 05/12/2001 FF Historique des r�cup�rations d'enregistrement
'  8/12/2001 PV M�thodes globales


Option Explicit

Private cDna As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire
Private bOpG�n�rale As Boolean            ' Vrai si changement sur la s�lection

Private sFinalWP As String                ' Where-part de la requ�te SQL courante
Private sQuery As String                  ' Query de la s�lection en cours

Private colHistorique As New Collection   ' Trace des modifications pour l'historique

Private Const sTable = "dirnat"


'=================================================================================
' M�thodes globales impl�ment�es par ce module, pour l'affichage du menu Commandes

Public Property Get sM�thodesGlobales() As String
  sM�thodesGlobales = "Historique,R�cup�re,AjouteWeb,,S�lectionAttachementsNmoins1,S�lectionAttachementsEtablissements"
End Property


'=================================================================================
' Acc�s direct

Public Sub AfficheDirNat(ByVal sWP As String)
  ' Si la feuille n'est pas disponible, on en ouvre une autre
  If iMode <> meEmpty And iMode <> meNavigate Then
    Dim F As New frmDirNat
    F.AfficheDirNat sWP
    Exit Sub
  End If
  
  EffaceFormulaire
  BDActiveFormulaire colChamps, True
  iMode = meQuery
  ValidateQuery sWP
End Sub



'=================================================================================
' Actions de validation

Private Sub ValidateQuery(Optional ByVal sWP As String)
  Assert iMode = meQuery
  
  Dim t As Control
  Dim bWPInt�greEtat As Boolean
  bWPInt�greEtat = False
  
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
      If t.DataField = "dna_etat" Then bWPInt�greEtat = True
    End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = AvertissementLectureFichierComplet
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  If Not bWPInt�greEtat Then sWP = sWP & " and dna_etat is null"
  
  If bShiftPressed Then
    sWP = InputBox("Modification avanc�e de la requ�te", "S�lection", sWP)
    If sWP = "" Then Exit Sub
  End If
  
  
  Dim cDnaQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from dirnat where " & sWP

  cDnaQuery.OpenCurseur sQuery
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
  If Not cDna Is Nothing Then cDna.CloseCurseur
  Set cDna = cDnaQuery
  sFinalWP = sWP
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cDna.EOF And cDna.BOF) Then
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
  
  ' On contr�le que le pays est valide
  If bdcPays.ListIndex < 0 Then
    bdcPays.Synchronise
    If bdcPays.ListIndex < 0 Then
      MsgBox "Pays inconnu !", vbExclamation, App.Title
      bdcPays.SetFocus
      Exit Function
    End If
  End If
  
  ' On contr�le le niveau hi�rarchique sup�rieur
  If bdcGroupe.ListIndex < 0 Then
    SynchroGroupe
    If bdcGroupe.ListIndex < 0 Then
      MsgBox "Groupe inconnu!", vbExclamation, App.Title
      bdcGroupe.SetFocus
      Exit Function
    End If
  End If
  
  ' On regarde si le nom n'existe pas d�j�
  Dim iSer As Long
  iSer = BDCurseurExpress("select dna_numdna from dirnat where dna_nom=" & sFormToSQL(colChamps("dna_nom"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("dna_numdna") Then
    MsgBox "ATTENTION - Cette direction nationale existe d�j� sous le n� " & iSer, vbExclamation, App.Title
    Exit Function
  End If
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


' V�rifie que les champs contiennent des valeurs l�gales pour une OpGen
' La valeur vide est toujours l�gale
Private Function bOkValeursOpGen() As Boolean
  Dim iOld As Integer
  
  bOkValeursOpGen = False
  
  If bdcPays <> "" Then
    bdcPays.Synchronise
    If bdcPays.ListIndex < 0 Then
      MsgBox "Pays inconnu !", vbExclamation, App.Title
      bdcPays.SetFocus
      Exit Function
    End If
  End If
  
  If bdcGroupe <> "" Then
    SynchroGroupe
    If bdcGroupe.ListIndex < 0 Then
      MsgBox "Groupe inconnu !", vbExclamation, App.Title
      bdcGroupe.SetFocus
      Exit Function
    End If
  End If
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeursOpGen = True
End Function



Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  TrimCrLf colChamps("dna_fdr")
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  ' G�n�ration du n� de s�rie (m�canisme inhabituel)
  If colChamps("dna_numdna") = "" Then colChamps("dna_numdna") = iGetSerial("dna")
  
  Dim cDnaAdd As New BDCurseur
  cDnaAdd.OpenCurseur "select * from dirnat where dna_numdna=0"
  cDnaAdd.AddNew
  
  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "dna", True
  
  ' Seuls les champs actifs sont mis � jour
  ActiveTra�abilit� True
  ActiveChamp "dna_numdna", True
  
  If Not bPr�pareEditAdd(cDnaAdd, colColonnes, colChamps) Then
    cDnaAdd.CloseCurseur
    ActiveTra�abilit� False
    ActiveChamp "dna_numdna", False
    Exit Sub
  End If
  cDnaAdd.CloseCurseur
  
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cDna Is Nothing Then cDna.CloseCurseur
  Set cDna = New BDCurseur
  
  sFinalWP = "dna_numdna=" & colChamps("dna_numdna")
  sQuery = "select * from dirnat where " & sFinalWP
  cDna.OpenCurseur sQuery
  cDna.MoveFirst
  
  
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
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("dna_numdna"), "cr��", sMsgTrace
  End If
      
      
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
  Assert Not cDna Is Nothing

  TrimCrLf colChamps("dna_fdr")
  
  If bOpG�n�rale Then
    Dim sSQL As String
    
    If Not bOkValeursOpGen Then Exit Sub
    
    sSQL = "update dirnat set "
    Dim t As Control, iNbChamp As Integer
    Dim sVal As String, sValSQL As String, sValInterne As String, sMsg As String
    For Each t In colChamps
      If t.Text = "=" Then
        sSQL = sSQL & t.DataField & "=NULL"
        iNbChamp = iNbChamp + 1
      ElseIf t.Text <> "" Then
        bOkValType t.Text, colColonnes(t.DataField).iType, sValSQL, sValInterne, sMsg
        If iNbChamp > 0 Then sSQL = sSQL & ","
        sSQL = sSQL & t.DataField & "=" & sValSQL
        iNbChamp = iNbChamp + 1
      End If
    Next
    If iNbChamp = 0 Then
      MsgBox "Op�ration g�n�rale sans modification !" & vbCrLf & "Vous devez modifier au moins un champ pour lancer une op�ration g�n�rale, sinon annulez l'op�ration g�n�rale en cours.", vbExclamation, App.Title
      Exit Sub
    End If
    
    sSQL = sSQL & ",timestamp=current,dna_datemodif=current,dna_heuremodif=" & Hour(Now) * 100 + Minute(Now) & ",dna_opermodif=" & iNumOp�rateur & " where " & sFinalWP
    If Not bOp�rationG�n�rale(sTable, sSQL, sFinalWP) Then Exit Sub
    
    ' On r�-ex�cute la requ�te, sinon la buff�risation locale emp�che l'affichage des champs modifi�s
    SetMessage "Lecture des donn�es modifi�es, patientez�"
    Screen.MousePointer = vbHourglass
    If Not cDna Is Nothing Then cDna.CloseCurseur
    cDna.OpenCurseur sQuery
    Screen.MousePointer = vbDefault
  
  Else  ' Modification classique

    If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
    If Not bOkValeurs Then Exit Sub
    cDna.Edit
      
    ' Tra�abilit� ancien style
    InitTra�abilit� colChamps, "dna", False
    ActiveTra�abilit� True     ' Pour mettre � jour la base
    
    If Not bPr�pareEditAdd(cDna, colColonnes, colChamps) Then
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
        JournalUnix sTable & " " & colChamps("dna_numdna"), "chang�", sMsgTrace
      End If
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
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  ActiveTimer mtStop
  
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub





Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  ActiveTimer mtStop

  BDActiveFormulaire colChamps, False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cDna Is Nothing Then
    If Not (cDna.EOF And cDna.BOF) Then
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
  
  colChamps("dna_numdna").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cDna Is Nothing
  
  ' Op�ration g�n�rale = Shift+Changement
  bOpG�n�rale = bShiftPressed
  
  If cDna.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "dna_numdna", False
  ActiveChamp "dna_etat", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False
  
  If bOpG�n�rale Then
    ActiveChamp "dna_nom", False
  End If
  
  colChamps("dna_origine").SetFocus
  AutoSelect colChamps("dna_origine"), True
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
   
  If bOpG�n�rale Then
    SetMessage "OP�RATION G�N�RALE - D�finissez les champs modifi�s, puis validez [Entr�e] ou abandonnez [�chap]"
    EffaceFormulaire
  Else
    SetMessage "Modifiez les valeurs affich�es, puis validez [Entr�e] ou abandonnez [�chap]"
  End If
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
  ActiveChamp "dna_numdna", False
  ActiveChamp "dna_etat", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False
  
  ' Valeurs par d�faut
  bdcPays = iSyst�mePays
  
  colChamps("dna_origine").SetFocus
  bdS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub

Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cDna Is Nothing
  
  If cDna.bEffac� Then
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
  If colChamps("dna_etat") <> "" Then
    MsgBox "D�j� supprim� (�tat S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNb As Long
  iNb = BDCurseurExpress("select count(*) from dirreg where drg_etat is null and drg_numdna=" & colChamps("dna_numdna"))
  If iNb > 0 Then
    MsgBox "Impossible de basculer la direction nationale � l'�tat S, il reste " & iNb & " direction(s) r�gionale(s) rattach�e(s) pas l'�tat S.", vbExclamation, App.Title
    Exit Sub
  End If

  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, vous allez basculer l'enregistrement � l'�tat S (supprim�)." & vbCrLf & "Vous pourrez ult�rieurement restaurer l'enregistrement � l'�tat normal en choisissant le menu Commandes, R�cup�re un enregistrement supprim�." & vbCrLf & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  cDna.Edit
  cDna!dna_etat = "S"
  
  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "dna", False
  ActiveTra�abilit� True     ' Pour mettre � jour la base
  bPr�pareEditAdd cDna, colColonnes, colChamps
  ActiveTra�abilit� False
  
  ' On sp�cifie dans l'historique des modifications que le num�ro X est pass� � l'�tat de supprim�
  Dim sMsgTrace As String
  sMsgTrace = colChamps("dna_numdna") & " -> Etat S"
    If cDna!dna_etat = "S" Then
       If sMsgTrace <> "" Then
          JournalUnix sTable & " " & colChamps("dna_numdna"), "supprim�", sMsgTrace
       End If
    End If
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub


Public Sub R�cup�re()   ' R�cup�re un enregistrement supprim� (�tat S)
  If colChamps("dna_etat") <> "S" Then
    MsgBox "Vous ne pouvez r�cup�rer qu'un enregistrement supprim� (�tat S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  cDna.Edit
  cDna!dna_etat = Null
  
  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "dna", False
  ActiveTra�abilit� True     ' Pour mettre � jour la base
  bPr�pareEditAdd cDna, colColonnes, colChamps
  ActiveTra�abilit� False
  
  ' Si on veut r�cup�rer, on le mentionne ds l'historique
  Dim sMsgTrace As String
  sMsgTrace = colChamps("dna_numdna") & " -> R�cup"
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("dna_numdna"), "r�cup�r�", sMsgTrace
  End If
  
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub

  
Public Sub ActionD�truit()    ' D�truit l'enregistrement
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est d�finitive." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  If colChamps("dna_etat") <> "S" Then
    MsgBox "Vous ne pouvez pas d�truire un enregistrement sans l'avoir au pr�alable supprim� (�tat S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNb As Long
  iNb = BDCurseurExpress("select count(*) from dirreg where drg_numdna=" & colChamps("dna_numdna"))
  If iNb > 0 Then
    MsgBox "Impossible de basculer la direction nationale � l'�tat S, il reste " & iNb & " direction(s) r�gionale(s) rattach�e(s).", vbExclamation, App.Title
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
  cDna.Delete
  If Err Then
    AfficheErreurODBC "�chec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  ' On garde la trace de la destruction
  JournalUnix sTable & " " & colChamps("dna_numdna"), "d�truit", sMsgTrace
  
  ' synchrodelete est mis � jour par un trigger
  
  cDna.MoveNext
  If cDna.EOF Then
    cDna.MovePrevious
    If cDna.BOF Then
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
  ActiveChamp "dna_datecreat", bEnable
  ActiveChamp "dna_heurecreat", bEnable
  ActiveChamp "dna_opercreat", bEnable
  ActiveChamp "dna_datemodif", bEnable
  ActiveChamp "dna_heuremodif", bEnable
  ActiveChamp "dna_opermodif", bEnable
  ActiveChamp "dna_tsvalid", bEnable
  ActiveChamp "dna_opervalid", bEnable
End Sub

'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cDna Is Nothing

  bdS�l.ButtonEnabled("First") = cDna.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cDna.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cDna.EOF
  bdS�l.ButtonEnabled("Last") = Not cDna.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cDna.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
  cDna.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cDna.MoveNext
  AjusteMouvements
  If cDna.EOF Then cDna.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cDna.MovePrevious
  AjusteMouvements
  If cDna.BOF Then cDna.MoveFirst
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
          c = colM�moireDirNat(ActiveControl.DataField)
          c.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each c In colChamps
        If Not c.Locked Then      ' On ne remplit pas les champs verrouill�s
          c = colM�moireDirNat(c.DataField)
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

Private Sub lblChamp_Click(Index As Integer)
  If bdcGroupe <> "" Then frmGroupe.AfficheGroupe bdcGroupe
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
  Dim p As Pays
  For Each p In colPays
    bdcPays.AddItem p.pay_pays, p.pay_libelle
  Next
  
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcOperCreat.AddItem u.uti_numuti, u.uti_nom
    bdcOperModif.AddItem u.uti_numuti, u.uti_nom
    bdcOperValid.AddItem u.uti_numuti, u.uti_nom
  Next

  
  ' Formulaire en mode initial
  Set cDna = Nothing
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
    Cancel = True
    Exit Sub
  End If

  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cDna Is Nothing Then cDna.CloseCurseur
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
  ActiveTimer mtStop
  If cDna Is Nothing Then
    EffaceFormulaire
  ElseIf cDna.BOF And cDna.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cDna.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cDna.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdS�l.NumRec = cDna.AbsolutePosition
    ActiveTimer mtRapide      ' Mise � jour en arri�re plan
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cDna.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  If bdcGroupe.ListIndex < 0 Then
    SynchroGroupe
  End If
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  bdS�l.NumRec = ""
End Sub


' Activation du timer de mise � jour des champs satellites
Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop:    timSatellites.Enabled = False
    Case mtLent:    timSatellites.Interval = 1000:  timSatellites.Enabled = True
    Case mtRapide:  timSatellites.Interval = 250:   timSatellites.Enabled = True
  End Select
End Sub


Private Sub ActiveChamp(ByVal sChamp As String, bEnabled As Boolean)
  BDActiveChamp colChamps(sChamp), bEnabled
End Sub


' Pour ajouter un �tablissement avec n� impos�
Private Sub txtChamp_DblClick(Index As Integer)
  If txtChamp(Index).DataField = "dna_numdna" And iMode = meAdd Then
    BDActiveChamp txtChamp(Index), True
  End If
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

Private Sub bdcPays_GotFocus()
  SetStatus bdcPays.Tag
End Sub

Private Sub bdcPays_LostFocus()
  bdcPays.Synchronise
End Sub

Private Sub bdcGroupe_GotFocus()
  SetStatus bdcGroupe.Tag
End Sub

Private Sub bdcGroupe_LostFocus()
  If bdcGroupe <> "" Then
    bdcGroupe.Synchronise
    If bdcGroupe.ListIndex < 0 Then SynchroGroupe
  End If
End Sub

Private Sub SynchroGroupe()
  Dim iNum As Long, sNom As String
  iNum = Int(Val(bdcGroupe))
  sNom = BDCurseurExpress("select grp_nom from groupe where grp_numgrp=" & iNum)
  If sNom <> "" Then bdcGroupe.AddItem iNum, sNom
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
  BDCopieS�lection cDna, colChamps, bdS�l
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
  iChoix = frmMessageChoix.ChoixEtat("&Simple", "&D�taill�", "S&tructure")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
  Exit Sub
  
pb:
  intlMessageErreurEtat
End Sub

Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String, sSQLT�te As String, sSQLCorps As String
  sSQLT�te = "select unique dna_numgrp,grp_nom from dirnat,groupe where " & sFinalWP & " and dna_numgrp=grp_numgrp"
  sSQLCorps = "select * from dirnat where " & sFinalWP
  sSQL = "SHAPE {" & sSQLT�te & "} AS T�te APPEND ({" & sSQLCorps & "} AS Corps RELATE 'dna_numgrp' TO 'dna_numgrp') AS Corps"

  Select Case iChoix
    Case 1: On Error Resume Next: BDEtat sSQL, drDirNatSimple, bImpression
    Case 2: On Error Resume Next: BDEtat sSQL, drDirNatD�taill�, bImpression
    Case 3: FormateStructure sFinalWP, bImpression, Me, iChoix
  End Select
End Sub

' Callback de l'aper�u avant impression
Public Sub PrintReport(ByVal iChoix As Integer)
  Etat iChoix, True
End Sub



'========================================================
' S�lection hi�rarchique

Public Sub cmdS�lectionAttachements(bEtb As Boolean)
  If iMode <> meNavigate Then
    MsgBox "La s�lection hi�rarchique N-1 ne fonctionne qu'apr�s une s�lection d'enregistrements.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "drg_numdna in ("
  
  EffaceFormulaire
  Refresh
  cDna.MoveFirst
  Do Until cDna.EOF
    If cDna.AbsolutePosition Mod 10 = 0 Then
      bdS�l.NumRec = cDna.AbsolutePosition
      bdS�l.RefreshNumRec
    End If
    sWP = sWP & Chr(34) & cDna!dna_numdna & Chr(34) & ","
    cDna.MoveNext
  Loop
  cDna.MoveFirst
  SynchroniseFormulaire
  
  Mid(sWP, Len(sWP), 1) = ")"   ' On remplace la , finale par une )
  If bEtb Then
    sWP = "etb_etat is null and etb_numsec in (select sec_numsec from secteur where sec_etat is null and sec_numdrg in (select drg_numdrg from dirreg where drg_etat is null and " & sWP & "))"
    frmEtablissement.AfficheEtablissement sWP
  Else
    frmDirReg.AfficheDirReg sWP
  End If
End Sub


'=================================================================================
' M�morisation

Public Sub M�morise()
  EffaceCollection colM�moireDirReg
  
  Dim t As Control
  For Each t In colChamps
    colM�moireDirReg.Add (t), t.DataField
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
  sWP = "jou_domaine='" & sTable & " " & colChamps("dna_numdna") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub
