VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmSecteur 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des secteurs"
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
   Icon            =   "frmSecteur.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   442
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   608
   Tag             =   "Données"
   Begin TablesServeur.BDCheck bckBLGroupé 
      Height          =   285
      Left            =   1740
      TabIndex        =   26
      Top             =   3720
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   503
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DataField       =   "!sec_blgrp"
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   7080
      Top             =   1020
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^sec_optedition"
      Height          =   315
      Index           =   18
      Left            =   3780
      MaxLength       =   5
      TabIndex        =   28
      Top             =   3720
      Width           =   795
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^sec_optlabo"
      Height          =   315
      Index           =   17
      Left            =   6060
      MaxLength       =   5
      TabIndex        =   30
      Top             =   3720
      Width           =   795
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^sec_bdist"
      Height          =   315
      Index           =   12
      Left            =   2520
      MaxLength       =   37
      TabIndex        =   14
      Top             =   1920
      Width           =   4275
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^*sec_nom"
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
      DataField       =   "sec_pays"
   End
   Begin VB.TextBox txtChampVB 
      DataField       =   "^sec_etat"
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
      TabIndex        =   49
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
   Begin TablesServeur.BDCombo bdcDirReg 
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
      DataField       =   "*sec_numdrg"
   End
   Begin VB.Frame frlTraçabilité 
      Caption         =   "Traçabilité"
      Height          =   1695
      Left            =   60
      TabIndex        =   35
      Top             =   4920
      Width           =   9015
      Begin TablesServeur.BDCombo bdcOperCreat 
         Height          =   330
         Left            =   3780
         TabIndex        =   39
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
         DataField       =   "sec_opercreat"
      End
      Begin TablesServeur.BDCombo bdcOperModif 
         Height          =   330
         Left            =   3780
         TabIndex        =   43
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
         DataField       =   "sec_opermodif"
      End
      Begin TablesServeur.BDCombo bdcOperValid 
         Height          =   330
         Left            =   3780
         TabIndex        =   46
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
         DataField       =   "sec_opervalid"
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   14
         Left            =   1680
         TabIndex        =   48
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
         DataField       =   "sec_tsvalid"
         Height          =   315
         Index           =   25
         Left            =   1680
         TabIndex        =   45
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
         DataField       =   "sec_datecreat"
         Height          =   315
         Index           =   23
         Left            =   1680
         TabIndex        =   37
         Top             =   240
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "sec_heurecreat"
         Height          =   315
         Index           =   22
         Left            =   2940
         TabIndex        =   38
         Top             =   240
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
         DataField       =   "sec_datemodif"
         Height          =   315
         Index           =   21
         Left            =   1680
         TabIndex        =   41
         Top             =   600
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "sec_heuremodif"
         Height          =   315
         Index           =   20
         Left            =   2940
         TabIndex        =   42
         Top             =   600
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
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   120
         TabIndex        =   47
         Top             =   1380
         Width           =   1155
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Validé le :"
         Height          =   210
         Index           =   19
         Left            =   120
         TabIndex        =   44
         Top             =   1020
         Width           =   930
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Créé le :"
         Height          =   210
         Index           =   17
         Left            =   120
         TabIndex        =   36
         Top             =   300
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifié le :"
         Height          =   210
         Index           =   16
         Left            =   120
         TabIndex        =   40
         Top             =   660
         Width           =   1020
      End
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "sec_interloc"
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
      DataField       =   "sec_cpost"
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
      DataField       =   "sec_fax"
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
      DataField       =   "sec_corresp"
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
      DataField       =   "sec_tel"
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
      DataField       =   "sec_loc"
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
      DataField       =   "sec_rue"
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
      DataField       =   "sec_fdr"
      Height          =   555
      Index           =   10
      Left            =   1740
      TabIndex        =   34
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
      DataField       =   "sec_origine"
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
      DataField       =   "sec_comment"
      Height          =   315
      Index           =   2
      Left            =   1740
      TabIndex        =   32
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
      DataField       =   "*sec_numsec"
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
      Caption         =   "Direction reg. :"
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
      Index           =   11
      Left            =   60
      MousePointer    =   10  'Up Arrow
      TabIndex        =   50
      ToolTipText     =   "Affiche la direction régionale"
      Top             =   2700
      Width           =   1485
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
      Caption         =   "Options édition:"
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
      Left            =   2160
      MousePointer    =   10  'Up Arrow
      TabIndex        =   27
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
      Left            =   4680
      MousePointer    =   10  'Up Arrow
      TabIndex        =   29
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
      Caption         =   "BL groupé :"
      Height          =   210
      Index           =   9
      Left            =   60
      TabIndex        =   25
      Top             =   3780
      Width           =   1095
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Localité :"
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
      TabIndex        =   33
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
      TabIndex        =   31
      Top             =   4140
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
Attribute VB_Name = "frmSecteur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmSecteur
' Feuille de gestion des secteurs
' 10/05/1999 PV
'  7/07/1999 PV Mécanisme de mémorisation (F5)
'  6/08/1999 PV synchrodelete
' 23/08/1999 PV Normalisation du nom
' 23/11/1999 PV Accès direct, liens internes, www.silliker
'  8/02/2000 PV Avertissement avant le passage à l'état S
'  5/09/2000 PV Sélection hiérarchique; AfficheSecteur via where-part
' 13/02/2001 PV Traçabilité des opérations générales
' 18/05/2001 PV bOpérationGénérale
' 21/05/2001 PV Modification de requête avancée; état supprimé correctement géré en query
' 29/22/2001 PV Trace des changements
' 31/11/2001 FF Historique des modifications
' 03/12/2001 FF Historique des suppressions
' 03/12/2001 FF Historique des suppressions et des destructions
' 04/12/2001 FF Historique des créations
' 05/12/2001 FF Historique des récupérations d'enregistrement
' 06/12/2001 PV sMéthodesGlobales (menu commande contextuel)


Option Explicit

Private cSec As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private bOpGénérale As Boolean            ' Vrai si changement sur la sélection

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private colHistorique As New Collection   ' Trace des modifications pour l'historique

Private Const sTable = "secteur"


'=================================================================================
' Méthodes globales implémentées par ce module, pour l'affichage du menu Commandes

Public Property Get sMéthodesGlobales() As String
  sMéthodesGlobales = "Historique,Récupère,AjouteWeb,SélectionAttachementsNmoins1,SélectionAttachementsEtablissements,DernierNo"
End Property


'=================================================================================
' Accès direct

Public Sub AfficheSecteur(ByVal sWP As String)
  ' Si la feuille n'est pas disponible, on en ouvre une autre
  If iMode <> meEmpty And iMode <> meNavigate Then
    Dim F As New frmSecteur
    F.AfficheSecteur sWP
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
  Dim bWPIntègreEtat As Boolean
  bWPIntègreEtat = False
  
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
      If t.DataField = "sec_etat" Then bWPIntègreEtat = True
  End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = AvertissementLectureFichierComplet
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  If Not bWPIntègreEtat Then sWP = sWP & " and sec_etat is null"
  
  If bShiftPressed Then
    sWP = InputBox("Modification avancée de la requête", "Sélection", sWP)
    If sWP = "" Then Exit Sub
  End If
  
  Dim cSecQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from secteur where " & sWP
  
  cSecQuery.OpenCurseur sQuery
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
  If Not cSec Is Nothing Then cSec.CloseCurseur
  Set cSec = cSecQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cSec.EOF And cSec.BOF) Then
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
  
  If bdcPays.ListIndex < 0 Then
    bdcPays.Synchronise
    If bdcPays.ListIndex < 0 Then
      MsgBox "Pays inconnu !", vbExclamation, App.Title
      bdcPays.SetFocus
      Exit Function
    End If
  End If
  
  If bdcDirReg.ListIndex < 0 Then
    SynchroDrg
    If bdcDirReg.ListIndex < 0 Then
      MsgBox "Direction régionale inconnue !", vbExclamation, App.Title
      bdcDirReg.SetFocus
      Exit Function
    End If
  End If
  
  ' On regarde si le nom n'existe pas déjà
  Dim iSer As Long
  iSer = BDCurseurExpress("select sec_numsec from secteur where sec_nom=" & sFormToSQL(colChamps("sec_nom"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("sec_numsec") Then
    MsgBox "ATTENTION - Ce secteur existe déjà sous le n° " & iSer, vbExclamation, App.Title
    Exit Function
  End If
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


' Vérifie que les champs contiennent des valeurs légales pour une OpGen
' La valeur vide est toujours légale
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
  
  If bdcDirReg <> "" Then
    SynchroDrg
    If bdcDirReg.ListIndex < 0 Then
      MsgBox "Direction régionale inconnue !", vbExclamation, App.Title
      bdcDirReg.SetFocus
      Exit Function
    End If
  End If
  
  ' Tous les tests ont été passés avec succès !
  bOkValeursOpGen = True
End Function



Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  TrimCrLf colChamps("sec_fdr")
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  ' Génération du n° de série (mécanisme inhabituel)
  If colChamps("sec_numsec") = "" Then colChamps("sec_numsec") = iGetSerial("sec")
  
  Dim cSecAdd As New BDCurseur
  cSecAdd.OpenCurseur "select * from secteur where sec_numsec=0"
  cSecAdd.AddNew
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "sec", True
  
  ' Seuls les champs actifs sont mis à jour
  ActiveTraçabilité True
  ActiveChamp "sec_numsec", True
  
  If Not bPrépareEditAdd(cSecAdd, colColonnes, colChamps) Then
    cSecAdd.CloseCurseur
    ActiveTraçabilité False
    ActiveChamp "sec_numsec", False
    Exit Sub
  End If
  cSecAdd.CloseCurseur
  
    
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cSec Is Nothing Then cSec.CloseCurseur
  Set cSec = New BDCurseur
  
  sFinalWP = "sec_numsec=" & colChamps("sec_numsec")
  sQuery = "select * from secteur where " & sFinalWP
  cSec.OpenCurseur sQuery
  cSec.MoveFirst
  
  ' Historique
  Dim sMsgTrace As String
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      ' On enregistre uniquement si les champs ne sont pas vides
      If ValeurContrôle(C) <> "" Then
        If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
        sMsgTrace = sMsgTrace & C.DataField & ":" & ValeurContrôle(C)
      End If
    End If
  Next
  ' On enregistre dans le journal la trace de la création
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("sec_numsec"), "créé", sMsgTrace
  End If
  
  BDActiveFormulaire colChamps, False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  bdSél.EmpêcheMouvements
  
  Mémorise
  
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub

Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cSec Is Nothing
  
  If colChamps("sec_nom") <> sNormaliseNom(colChamps("sec_nom")) Then
    colChamps("sec_nom") = sNormaliseNom(colChamps("sec_nom"))
    MsgBox "Attention, le nom a été modifié pour correspondre aux règles générales de créations de nom (pas d'espaces en double, nom en majuscules, le É est la seule majuscule accentuée acceptée).", vbInformation, App.Title
  End If

  TrimCrLf colChamps("sec_fdr")
  
  If bOpGénérale Then
    Dim sSQL As String
    
    If Not bOkValeursOpGen Then Exit Sub
    
    sSQL = "update secteur set "
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
      MsgBox "Opération générale sans modification !" & vbCrLf & "Vous devez modifier au moins un champ pour lancer une opération générale, sinon annulez l'opération générale en cours.", vbExclamation, App.Title
      Exit Sub
    End If
    
    sSQL = sSQL & ",timestamp=current,sec_datemodif=current,sec_heuremodif=" & Hour(Now) * 100 + Minute(Now) & ",sec_opermodif=" & iNumOpérateur & " where " & sFinalWP
    If Not bOpérationGénérale(sTable, sSQL, sFinalWP) Then Exit Sub
    
    ' On ré-exécute la requête, sinon la bufférisation locale empêche l'affichage des champs modifiés
    SetMessage "Lecture des données modifiées, patientez…"
    Screen.MousePointer = vbHourglass
    If Not cSec Is Nothing Then cSec.CloseCurseur
    cSec.OpenCurseur sQuery
    Screen.MousePointer = vbDefault
  
  Else  ' Modification classique

    If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
    If Not bOkValeurs Then Exit Sub
    cSec.Edit
      
    ' Traçabilité ancien style
    InitTraçabilité colChamps, "sec", False
    ActiveTraçabilité True     ' Pour mettre à jour la base
  
    If Not bPrépareEditAdd(cSec, colColonnes, colChamps) Then
      ActiveTraçabilité False
      Exit Sub
    End If
    
    ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a été changé
    Dim C As Control
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        If colHistorique(C.DataField) <> ValeurContrôle(C) Then  ' Modifié !
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
             sMsgTrace = sMsgTrace & C.DataField & ":" & colHistorique(C.DataField) & "->" & ValeurContrôle(C)
        End If
      End If
     Next
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("sec_numsec"), "changé", sMsgTrace
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
  
  Mémorise

  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
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
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cSec Is Nothing Then
    If Not (cSec.EOF And cSec.BOF) Then
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
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, False
  
  colChamps("sec_numsec").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cSec Is Nothing
  
  ' Opération générale = Shift+Changement
  bOpGénérale = bShiftPressed
  
  If cSec.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  BDActiveFormulaire colChamps, True
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "sec_numsec", False
  ActiveChamp "sec_etat", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  If bOpGénérale Then ActiveChamp "sec_nom", False
  
  colChamps("sec_origine").SetFocus
  AutoSelect colChamps("sec_origine"), True
  bdSél.TabStop = False
  
  iMode = meChange
  
  ' On mémorise les valeurs avant le changement
  EffaceCollection colHistorique
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colHistorique.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  If bOpGénérale Then
    SetMessage "OPÉRATION GÉNÉRALE - Définissez les champs modifiés, puis validez [Entrée] ou abandonnez [Échap]"
    EffaceFormulaire
  Else
    SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
  End If
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  BDActiveFormulaire colChamps, True
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "sec_numsec", False
  ActiveChamp "sec_etat", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  ' Valeurs par défaut
  bdcPays = iSystèmePays
  
  colChamps("sec_origine").SetFocus
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
  cWeb.OpenCurseur "select crs_serie, crs_etat, crs_origine, crs_operation, crs_numsec," & _
    "crs_numdrg, crs_nom, crs_rue, crs_loc, crs_cpost, crs_bdist," & _
    "crs_tel, crs_fax, crs_pays, crs_corresp, crs_interloc, crs_blgrp," & _
    "crs_optedition, crs_optlabo, crs_comment, crs_fdr, crs_tscreation," & _
    "crs_tsvalidation , crs_tsexecution, crs_tssuppression " & _
    "from cresec where crs_serie=" & vReq
  If cWeb.EOF Then
    MsgBox "Requête inconnue, ajout interrompu.", vbExclamation, App.Title
    Exit Sub
  End If

  If cWeb!crs_etat <> "V" Then
    MsgBox "La requête n'est pas à l'état V, ajout interompu.", vbExclamation, App.Title
    Exit Sub
  End If

  If cWeb!crs_operation <> "C" Then
    MsgBox "Il ne s'agit pas d'une requête de création, ajout interompu.", vbExclamation, App.Title
    Exit Sub
  End If

  ActionAdd
  colChamps("sec_nom") = sNormaliseNom(cWeb!crs_nom)
  colChamps("sec_numdrg") = cWeb!crs_numdrg
  colChamps("sec_rue") = cWeb!crs_rue
  colChamps("sec_loc") = cWeb!crs_loc
  colChamps("sec_cpost") = cWeb!crs_cpost
  colChamps("sec_bdist") = cWeb!crs_bdist
  colChamps("sec_tel") = cWeb!crs_tel
  colChamps("sec_fax") = cWeb!crs_fax
  colChamps("sec_pays") = cWeb!crs_pays
  colChamps("sec_corresp") = cWeb!crs_corresp
  colChamps("sec_interloc") = cWeb!crs_interloc
  colChamps("sec_blgrp") = cWeb!crs_blgrp
  colChamps("sec_optedition") = cWeb!crs_optedition
  colChamps("sec_optlabo") = cWeb!crs_optlabo
  colChamps("sec_fdr") = cWeb!crs_fdr
  colChamps("sec_comment") = "Web " & cWeb!crs_serie & ":" & cWeb!crs_origine & " " & cWeb!crs_comment
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cSec Is Nothing
  
  If cSec.bEffacé Then
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
  If colChamps("sec_etat") <> "" Then
    MsgBox "Déjà supprimé (état S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNb As Long
  iNb = BDCurseurExpress("select count(*) from etablissement where etb_etat is null and etb_numsec=" & colChamps("sec_numsec"))
  If iNb > 0 Then
    MsgBox "Impossible de basculer le secteur à l'état S, il reste " & iNb & " établissement(s) rattaché(s) pas l'état S.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, vous allez basculer l'enregistrement à l'état S (supprimé)." & vbCrLf & "Vous pourrez ultérieurement restaurer l'enregistrement à l'état normal en choisissant le menu Commandes, Récupère un enregistrement supprimé." & vbCrLf & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  cSec.Edit
  cSec!sec_etat = "S"
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "sec", False
  ActiveTraçabilité True     ' Pour mettre à jour la base
  bPrépareEditAdd cSec, colColonnes, colChamps
  ActiveTraçabilité False
  
  ' On spécifie dans l'historique des modifications que le numéro X est passé à l'état de supprimé
  Dim sMsgTrace As String
  sMsgTrace = colChamps("sec_numsec") & " -> Etat S"
    If cSec!sec_etat = "S" Then
       If sMsgTrace <> "" Then
          JournalUnix sTable & " " & colChamps("sec_numsec"), "supprimé", sMsgTrace
       End If
    End If
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub


Public Sub Récupère()   ' Récupère un enregistrement supprimé (état S)
  If colChamps("sec_etat") <> "S" Then
    MsgBox "Vous ne pouvez récupérer qu'un enregistrement supprimé (état S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  cSec.Edit
  cSec!sec_etat = Null
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "sec", False
  ActiveTraçabilité True     ' Pour mettre à jour la base
  bPrépareEditAdd cSec, colColonnes, colChamps
  ActiveTraçabilité False
  
  ' Si on veut récupérer, on le mentionne ds l'historique
  Dim sMsgTrace As String
  sMsgTrace = colChamps("sec_numsec") & " -> Récup"
  If sMsgTrace <> "" Then
        JournalUnix sTable & " " & colChamps("sec_numsec"), "récupéré", sMsgTrace
  End If
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub
  
Public Sub ActionDétruit()    ' Détruit l'enregistrement
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  If colChamps("sec_etat") <> "S" Then
    MsgBox "Vous ne pouvez pas détruire un enregistrement sans l'avoir au préalable supprimé (état S).", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNb As Long
  iNb = BDCurseurExpress("select count(*) from etablissement where etb_numsec=" & colChamps("sec_numsec"))
  If iNb > 0 Then
    MsgBox "Impossible de basculer le secteur à l'état S, il reste " & iNb & " établissement(s) rattaché(s).", vbExclamation, App.Title
    Exit Sub
  End If
  
  ' Historique
  Dim sMsgTrace As String
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContrôle(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & ValeurContrôle(C)
         End If
      End If
  Next
  
  On Error Resume Next
  cSec.Delete
  If Err Then
    AfficheErreurODBC "Échec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  ' On garde la trace de la destruction
  JournalUnix sTable & " " & colChamps("sec_numsec"), "détruit", sMsgTrace
  
  ' synchrodelete est mis à jour par un trigger
  
  cSec.MoveNext
  If cSec.EOF Then
    cSec.MovePrevious
    If cSec.BOF Then
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
  ActiveChamp "sec_datecreat", bEnable
  ActiveChamp "sec_heurecreat", bEnable
  ActiveChamp "sec_opercreat", bEnable
  ActiveChamp "sec_datemodif", bEnable
  ActiveChamp "sec_heuremodif", bEnable
  ActiveChamp "sec_opermodif", bEnable
  ActiveChamp "sec_tsvalid", bEnable
  ActiveChamp "sec_opervalid", bEnable
End Sub

'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cSec Is Nothing

  bdSél.ButtonEnabled("First") = cSec.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cSec.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cSec.EOF
  bdSél.ButtonEnabled("Last") = Not cSec.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cSec.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cSec.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cSec.MoveNext
  AjusteMouvements
  If cSec.EOF Then cSec.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cSec.MovePrevious
  AjusteMouvements
  If cSec.BOF Then cSec.MoveFirst
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


Public Sub DernierNo()
  On Error GoTo Problème
  Dim s As Long
  s = BDCurseurExpress("select max(serialsec) from serialsec")
  If iMode = meEmpty Then AfficheSecteur "sec_numsec=" & Chr(34) & s & Chr(34)
  MsgBox "Dernier n° de secteur créé: " & s, vbInformation, App.Title
  Exit Sub
  
Problème:
  MsgBox "Désolé, cette fonction n'est pas pas disponible sur ce système.", vbExclamation, App.Title
End Sub

' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  Dim C As Control
  
  ResetChienDeGarde
  If KeyCode = vbKeyF5 Then   ' Mémoire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set C = ActiveControl
          C = colMémoireSecteur(ActiveControl.DataField)
          C.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each C In colChamps
        If Not C.Locked Then      ' On ne remplit pas les champs verrouillés
          C = colMémoireSecteur(C.DataField)
        End If
      Next
    End If
  Else
    bdSél.KeyDown KeyCode
  End If
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

Private Sub lblChamp_Click(Index As Integer)
  If bdcDirReg <> "" Then frmDirReg.AfficheDirReg "drg_numdrg=" & Chr(34) & bdcDirReg & Chr(34)
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
  Set cSec = Nothing
  BDActiveFormulaire colChamps, False
  bdSél.LectureSeule = bLectureSeule
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  EffaceFormulaire

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
  If Not cSec Is Nothing Then cSec.CloseCurseur
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
' Active le formulaire, affiche en orange les champs indexés

Private Sub ActiveFormulaire(bActivé As Boolean)
  BDActiveFormulaire colChamps, bActivé
  If bActivé Then
    colChamps("sec_numsec").BackColor = BCChampIndexé
    colChamps("sec_nom").BackColor = BCChampIndexé
    colChamps("sec_numdrg").BackColor = BCChampIndexé
    colChamps("timestamp").BackColor = BCChampIndexé
  End If
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cSec Is Nothing Then
    EffaceFormulaire
  ElseIf cSec.BOF And cSec.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cSec.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cSec.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cSec.AbsolutePosition
    ActiveTimer mtRapide      ' Mise à jour en arrière plan
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cSec.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  If bdcDirReg.ListIndex < 0 Then
    SynchroDrg
  End If
End Sub



Private Sub EffaceFormulaire()
  Dim C As Control
  For Each C In colChamps
    C.Text = ""
  Next
  bdSél.NumRec = ""
End Sub


' Activation du timer de mise à jour des champs satellites
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


' Pour ajouter un établissement avec n° imposé
Private Sub txtChamp_DblClick(Index As Integer)
  If txtChamp(Index).DataField = "sec_numsec" And iMode = meAdd Then
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

Private Sub bckBLGroupé_GotFocus()
  AutoSelect bckBLGroupé
  SetStatus bckBLGroupé.Tag
End Sub

Private Sub bdSél_GotFocus()
  SetStatus
End Sub

Private Sub bdcPays_GotFocus()
  SetStatus bdcPays.Tag
End Sub

Private Sub bdcPays_LostFocus()
  bdcPays.Synchronise
End Sub

Private Sub bdcDirReg_GotFocus()
  SetStatus bdcDirReg.Tag
End Sub

Private Sub bdcDirReg_LostFocus()
  If bdcDirReg <> "" Then
    bdcDirReg.Synchronise
    If bdcDirReg.ListIndex < 0 Then SynchroDrg
  End If
End Sub

Private Sub SynchroDrg()
  Dim iNum As Long, sNom As String
  iNum = Int(Val(bdcDirReg))
  sNom = BDCurseurExpress("select drg_nom from dirreg where drg_numdrg=" & iNum)
  If sNom <> "" Then bdcDirReg.AddItem iNum, sNom
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
  BDCopieSélection cSec, colChamps, bdSél
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
  iChoix = frmMessageChoix.ChoixEtat("&Simple", "&Détaillé", "S&tructure")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
  Exit Sub
  
pb:
  intlMessageErreurEtat
End Sub

Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String, sSQLTête As String, sSQLCorps As String
  sSQLTête = "select unique sec_numdrg,drg_nom from secteur,dirreg where " & sFinalWP & " and sec_numdrg=drg_numdrg"
  sSQLCorps = "select * from secteur where " & sFinalWP
  sSQL = "SHAPE {" & sSQLTête & "} AS Tête APPEND ({" & sSQLCorps & "} AS Corps RELATE 'sec_numdrg' TO 'sec_numdrg') AS Corps"

  Select Case iChoix
    Case 1: On Error Resume Next: BDEtat sSQL, drSecteurSimple, bImpression
    Case 2: On Error Resume Next: BDEtat sSQL, drSecteurDétaillé, bImpression
    Case 3: FormateStructure sFinalWP, bImpression, Me, iChoix
  End Select
End Sub

' Callback de l'aperçu avant impression
Public Sub PrintReport(ByVal iChoix As Integer)
  Etat iChoix, True
End Sub


'=================================================================================
' Mémorisation

Public Sub Mémorise()
  EffaceCollection colMémoireSecteur
  
  Dim t As Control
  For Each t In colChamps
    colMémoireSecteur.Add (t), t.DataField
  Next
End Sub



'========================================================
' Sélection hiérarchique

Public Sub cmdSélectionAttachements(bEtb As Boolean)
  If iMode <> meNavigate Then
    MsgBox "La sélection hiérarchique N-1 ne fonctionne qu'après une sélection d'enregistrements.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "etb_numsec in ("
  
  EffaceFormulaire
  Refresh
  cSec.MoveFirst
  Do Until cSec.EOF
    If cSec.AbsolutePosition Mod 10 = 0 Then
      bdSél.NumRec = cSec.AbsolutePosition
      bdSél.RefreshNumRec
    End If
    sWP = sWP & Chr(34) & cSec!sec_numsec & Chr(34) & ","
    cSec.MoveNext
  Loop
  cSec.MoveFirst
  SynchroniseFormulaire
  
  Mid(sWP, Len(sWP), 1) = ")"   ' On remplace la , finale par une )
  frmEtablissement.AfficheEtablissement sWP
End Sub



'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("sec_numsec") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub


