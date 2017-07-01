VERSION 5.00
Begin VB.Form frmUtilisateur 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des utilisateurs"
   ClientHeight    =   6330
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8835
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmUtilisateurs.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   422
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   589
   Tag             =   "Donn�es"
   Begin VB.CommandButton btnCtrlAD 
      Caption         =   "Contr�le Active Directory"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   675
      Left            =   7740
      TabIndex        =   59
      Top             =   1260
      Width           =   1035
   End
   Begin VB.Frame fraPrivil�ge 
      Caption         =   "Niveaux de privil�ge"
      Height          =   1755
      Left            =   4320
      TabIndex        =   34
      Top             =   4440
      Visible         =   0   'False
      Width           =   4515
      Begin VB.CommandButton btnInfoNiveaux 
         Caption         =   "&Doc"
         Height          =   315
         Left            =   3300
         TabIndex        =   43
         TabStop         =   0   'False
         Top             =   180
         Width           =   555
      End
      Begin VB.CheckBox chkNiveau 
         Caption         =   "0: Op�rations sp�ciales ST"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   0
         Left            =   120
         TabIndex        =   35
         TabStop         =   0   'False
         Top             =   240
         Width           =   3100
      End
      Begin VB.CheckBox chkNiveau 
         Caption         =   "1: Validation SL"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   1
         Left            =   120
         TabIndex        =   36
         TabStop         =   0   'False
         Top             =   420
         Width           =   3100
      End
      Begin VB.CheckBox chkNiveau 
         Caption         =   "2: Validation interne labo"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   2
         Left            =   120
         TabIndex        =   37
         TabStop         =   0   'False
         Top             =   600
         Width           =   3100
      End
      Begin VB.CheckBox chkNiveau 
         Caption         =   "3: Validation d�finitive labo"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   3
         Left            =   120
         TabIndex        =   38
         TabStop         =   0   'False
         Top             =   780
         Width           =   3100
      End
      Begin VB.CheckBox chkNiveau 
         Caption         =   "4: Corrections sp�ciales SL"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   4
         Left            =   120
         TabIndex        =   39
         TabStop         =   0   'False
         Top             =   960
         Width           =   3100
      End
      Begin VB.CheckBox chkNiveau 
         Caption         =   "5: Administration tables labo"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   5
         Left            =   120
         TabIndex        =   40
         TabStop         =   0   'False
         Top             =   1140
         Width           =   3100
      End
      Begin VB.CheckBox chkNiveau 
         Caption         =   "6: Administration tables serveur"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   6
         Left            =   120
         TabIndex        =   41
         TabStop         =   0   'False
         Top             =   1320
         Width           =   3100
      End
      Begin VB.CheckBox chkNiveau 
         Caption         =   "7: ?"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   7
         Left            =   120
         TabIndex        =   42
         TabStop         =   0   'False
         Top             =   1500
         Width           =   3100
      End
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_codefim"
      Height          =   315
      Index           =   21
      Left            =   3540
      TabIndex        =   29
      Tag             =   "Code Fibebio (obsol�te)"
      Top             =   4440
      Width           =   735
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_letfim"
      Height          =   315
      Index           =   20
      Left            =   3540
      TabIndex        =   31
      Tag             =   "Lettres Fimebio (Obsob�te)  CI = Correspondant informatique"
      Top             =   4800
      Width           =   735
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_fax"
      Height          =   315
      Index           =   19
      Left            =   3900
      TabIndex        =   13
      Tag             =   "T�l�phone portable"
      Top             =   3000
      Width           =   2175
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_bdist"
      Height          =   315
      Index           =   18
      Left            =   2760
      TabIndex        =   11
      Tag             =   "T�l�phone (+fax) interne / externe"
      Top             =   2640
      Width           =   4875
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_cpost"
      Height          =   315
      Index           =   17
      Left            =   1680
      TabIndex        =   10
      Tag             =   "T�l�phone (+fax) interne / externe"
      Top             =   2640
      Width           =   1035
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_loc"
      Height          =   315
      Index           =   16
      Left            =   1680
      TabIndex        =   9
      Tag             =   "T�l�phone (+fax) interne / externe"
      Top             =   2280
      Width           =   5955
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_rue"
      Height          =   315
      Index           =   15
      Left            =   1680
      TabIndex        =   8
      Tag             =   "T�l�phone (+fax) interne / externe"
      Top             =   1920
      Width           =   5955
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_portable"
      Height          =   315
      Index           =   9
      Left            =   1680
      TabIndex        =   12
      Tag             =   "T�l�phone portable"
      Top             =   3000
      Width           =   2175
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_comment"
      Height          =   315
      Index           =   7
      Left            =   1680
      TabIndex        =   54
      Tag             =   "Commentaire libre sur l'utilisateur"
      Top             =   5880
      Width           =   7095
   End
   Begin VB.CommandButton btnListeSys 
      Caption         =   "�"
      Height          =   315
      Left            =   3540
      TabIndex        =   46
      TabStop         =   0   'False
      ToolTipText     =   "Liste les lettres des syst�mes utilisables"
      Top             =   5160
      Width           =   375
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_idmodif"
      Height          =   315
      Index           =   6
      Left            =   5040
      TabIndex        =   52
      Tag             =   "Origine de la modification"
      Top             =   5520
      Width           =   3735
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_passwd"
      Height          =   315
      IMEMode         =   3  'DISABLE
      Index           =   5
      Left            =   6060
      PasswordChar    =   "*"
      TabIndex        =   19
      Tag             =   "Mot de passe (Unix) pour la messagerie"
      Top             =   3360
      Width           =   1575
   End
   Begin VB.TextBox txtLettres 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   6300
      Locked          =   -1  'True
      TabIndex        =   50
      TabStop         =   0   'False
      Tag             =   "Lettres affect�es � l'utilisateur"
      Top             =   840
      Width           =   2415
   End
   Begin TablesAdmin.BDCombo bdcUnit� 
      Height          =   330
      Left            =   1680
      TabIndex        =   23
      Tag             =   "Unit� r�elle � laquelle est rattach�e l'utilisateur"
      Top             =   4080
      Width           =   7065
      _ExtentX        =   12462
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
      DataField       =   "uti_unite"
   End
   Begin TablesAdmin.BDCombo bdcSysBal 
      Height          =   330
      Left            =   2760
      TabIndex        =   17
      Tag             =   "Syst�me Unix g�rant la bo�te aux lettres de l'utilisateur. A vide si l'utilisateur a quitt� Silliker"
      Top             =   3360
      Width           =   2595
      _ExtentX        =   4577
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
      DataField       =   "uti_sysbal"
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   7680
      Top             =   480
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   1680
      TabIndex        =   48
      Tag             =   "Date+heure de derni�re modification de l'information"
      Top             =   5520
      Width           =   2235
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_nivweb"
      Height          =   315
      Index           =   13
      Left            =   1680
      TabIndex        =   27
      Tag             =   "Ordre de priorit� d'affichage sur le Web, de 0 (en t�te) � 3 (en fin)"
      Top             =   4800
      Width           =   495
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_niveau"
      Height          =   315
      Index           =   12
      Left            =   1680
      TabIndex        =   25
      Tag             =   "Niveau de privil�ge de l'utilisateur"
      Top             =   4440
      Width           =   495
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*^uti_systemes"
      Height          =   315
      Index           =   11
      Left            =   1680
      TabIndex        =   45
      Tag             =   "Lettres de syst�mes sur lesquels l'utilisateur peut se connecter, ou - (a quitt� Silliker) ou + (n'a pas d'acc�s informatique)"
      Top             =   5160
      Width           =   1815
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_datenaiss"
      Height          =   315
      Index           =   8
      Left            =   6420
      TabIndex        =   33
      Tag             =   "Date de naissance de l'utilisateur"
      Top             =   4440
      Width           =   1575
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_bal"
      Height          =   315
      Index           =   4
      Left            =   1680
      MaxLength       =   10
      TabIndex        =   16
      Tag             =   "Pr�fixe de bo�te aux lettres"
      Top             =   3360
      Width           =   1035
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_tel"
      Height          =   315
      Index           =   3
      Left            =   1680
      TabIndex        =   7
      Tag             =   "T�l�phone (+fax) interne / externe"
      Top             =   1560
      Width           =   5955
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uti_titre"
      Height          =   315
      Index           =   2
      Left            =   1680
      TabIndex        =   5
      Tag             =   "Fonction de la personne"
      Top             =   1200
      Width           =   5955
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*uti_nom"
      Height          =   315
      Index           =   1
      Left            =   1680
      TabIndex        =   3
      Tag             =   "Nom de l'utilisateur, sous la forme Pr�nom NOM"
      Top             =   840
      Width           =   3615
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*uti_numuti"
      Height          =   315
      Index           =   0
      Left            =   1680
      TabIndex        =   1
      Tag             =   "N� unique d'utilisateur, attribu� automatiquement par le syst�me"
      Top             =   480
      Width           =   1035
   End
   Begin TablesAdmin.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   55
      Top             =   0
      Width           =   8835
      _ExtentX        =   15584
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
   Begin TablesAdmin.BDCombo bdcSite 
      Height          =   330
      Left            =   1680
      TabIndex        =   21
      Tag             =   "Unit� r�elle � laquelle est rattach�e l'utilisateur"
      Top             =   3720
      Width           =   7065
      _ExtentX        =   12462
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
      DataField       =   "uti_site"
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Code Fim :"
      Height          =   210
      Index           =   22
      Left            =   2520
      TabIndex        =   28
      Top             =   4500
      Width           =   1005
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Let. Fim :"
      Height          =   210
      Index           =   21
      Left            =   2520
      TabIndex        =   30
      Top             =   4860
      Width           =   870
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "CPost / BD :"
      Height          =   210
      Index           =   20
      Left            =   60
      TabIndex        =   58
      Top             =   2700
      Width           =   1140
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Localit� :"
      Height          =   210
      Index           =   19
      Left            =   60
      TabIndex        =   57
      Top             =   2340
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Rue :"
      Height          =   210
      Index           =   18
      Left            =   60
      TabIndex        =   56
      Top             =   1980
      Width           =   495
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Site :"
      Height          =   210
      Index           =   17
      Left            =   60
      TabIndex        =   20
      Top             =   3780
      Width           =   495
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Portable / Fax:"
      Height          =   210
      Index           =   16
      Left            =   60
      TabIndex        =   14
      Top             =   3060
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Commentaire :"
      Height          =   210
      Index           =   15
      Left            =   60
      TabIndex        =   53
      Top             =   5940
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Modif :"
      Height          =   210
      Index           =   14
      Left            =   4260
      TabIndex        =   51
      Top             =   5580
      Width           =   630
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "MdP :"
      Height          =   210
      Index           =   8
      Left            =   5460
      TabIndex        =   18
      Top             =   3420
      Width           =   525
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Lettres :"
      Height          =   210
      Index           =   6
      Left            =   5400
      TabIndex        =   49
      Top             =   900
      Width           =   810
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   47
      Top             =   5580
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Niveau Web :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   26
      Top             =   4860
      Width           =   1275
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Niv de privil�ge :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   24
      Top             =   4500
      Width           =   1575
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Syst�mes :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   44
      Top             =   5220
      Width           =   1050
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Date naissance :"
      Height          =   210
      Index           =   7
      Left            =   4620
      TabIndex        =   32
      Top             =   4500
      Width           =   1590
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Unit� r�elle :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   22
      Top             =   4140
      Width           =   1215
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "BAL :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   15
      Top             =   3420
      Width           =   480
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "T�l�phone :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   6
      Top             =   1620
      Width           =   1125
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Titre :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nom :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "N� utilisateur :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   1380
   End
End
Attribute VB_Name = "frmUtilisateur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmUtilisateur
' Feuille de gestion de la table utilisateurs
'  4/12/1997 PV
' 19/01/1998 PV Suite
' 30/01/1998 PV Table lettres (fin de uti_lettres, uti_nomercem, uti_uniteercem)
'  4/02/1998 PV Nouveau --> Ajouter; utilisateur2 --> utilisateur
' 04/02/1998 PV Feuille MDI child
' 16/02/1998 PV Fin de la contrainte unique Informix uti_bal et test de l'unicit� en VB
'  7/07/1998 PV Copie des donn�es dans le presse-papiers
' 16/07/1998 PV Tra�abilit�
'  5/08/1998 PV Contr�les avec bOkUtilisateur. Affichage cach� des mots de passe
' 15/08/1998 PV DoActiveChamp
'  3/09/1998 PV Quand un utilisateur a quitt� la soci�t�, on v�rifie qu'il n'est plus r�f��renc� dans la table lettres
' 22/12/1998 PV Ordre des champs dans colChamps
' 30/03/1999 PV Impression
'  9/04/1999 PV Rechargement de la liste des utilisateurs en m�moire (colUtilisateurs) apr�s une cr�ation
'  5/05/1999 PV Champ commentaire; contr�les pas de MdP si pas de sysbal
' 23/08/1999 PV M�canisme F5 (m�moire) pour les utilisateurs
' 13/01/2000 PV Sites
' 02/02/2000 NC Ajout champs fax,rue,loc,cpost, bdist
' 27/03/2000 PV Possibilit� d'avoir un MdP sans sys de gestion de BAL; Gestion plus fine de l'affichage du cadre des bits de droits d'acc�s
' 22/08/2001 PV Possibilit� de relecture de la liste des unit�s si code inexistant
'  4/10/2001 PV Contr�les crois�s avec Active Directory
' 30/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des destructions et des cr�ations

Option Explicit

Private cUti As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition
Private sFinalSQL As String               ' Requ�te SQL courante

Private colChange As New Collection       ' Trace des modifications
Private colD�truit As New Collection      ' Trace des d�structions d'enregistrement
Private colCr�� As New Collection         ' Trace des cr�ations

Private Const sTable = "utilisateur"



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
  
  ExecuteRequete "select * from utilisateur where " & sWP & " order by uti_numuti"
End Sub


Private Sub ExecuteRequete(sSQL As String)
  ActiveFormulaire False
  SetMessage "Recherche en cours�"
  
  Dim iErr As Long, sErr As String
  On Error Resume Next
  Dim cUtiQuery As New BDCurseur
  cUtiQuery.OpenCurseur sSQL
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
  If Not cUti Is Nothing Then cUti.CloseCurseur
  Set cUti = cUtiQuery
  sFinalSQL = sSQL
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cUti.EOF And cUti.BOF) Then
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
  Dim i As Integer
  Dim iNbLettres As Integer, iNbSecret As Integer
  
  bOkValeurs = False
  
  ' Si on impose le n�, il doit �tre num�rique
  If colChamps("uti_numuti") <> "" And Not IsNumeric(colChamps("uti_numuti")) Then
    MsgBox "Le n� d'utilisateur doit �tre num�rique !"
    Exit Function
  End If
  
Retry:
  If bdcUnit�.Text <> "" And sNomUnit�(bdcUnit�.Text) = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Unit� '" & bdcUnit�.Text & "' inconnue." & vbCrLf & vbCrLf & "Voulez-vous relire la liste des unit�s ?", vbExclamation + vbYesNo + vbDefaultButton2, App.Title)
    If iRep = vbYes Then
      Dim sOld As String
      sOld = bdcUnit�.Text
      EffaceCacheUnit�s
      bdcUnit�.Clear
      Dim u As Unit�
      For Each u In colUnit�
        bdcUnit�.AddItem u.sNumUni, u.uni_titre
      Next
      bdcUnit�.Text = sOld
      GoTo Retry
    End If
    bdcUnit�.SetFocus
    Exit Function
  End If
  
  If Left(colChamps("uti_nom"), 1) = "�" Then
    MsgBox "Le pr�nom ne doit pas commencer par � dans la table utilisateur.", vbExclamation, App.Title
    Exit Function
  End If
  
  ' Syst�me g�rant les bo�tes aux lettres
  If bdcSysBal.Text <> "" Then
    If bdcSysBal.Text <> UCase(bdcSysBal.Text) Then bdcSysBal.Text = UCase(bdcSysBal.Text)
    If sNomSyst�me(bdcSysBal.Text) = "" Then
      MsgBox "Syst�me de gestion de bo�te aux lettres '" & bdcSysBal.Text & "' inconnu !", vbExclamation, App.Title
      bdcSysBal.SetFocus
      Exit Function
    End If
    
    If Not bdcSysBal.Text Like "[ABEHKOPRTWXY]" Then
      MsgBox "Attention, en r�gle g�n�rale, le syst�me Unix " & bdcSysBal.FullText & " ne g�re pas les bo�tes aux lettres des utilisateurs." & vbCrLf & vbCrLf & "Assurez-vous qu'il n'y a pas d'erreur.", vbInformation, App.Title
    End If
   
    If colChamps("uti_systemes") = "-" Then
      MsgBox "Le syst�me de gestion de bo�te aux lettres devrait �tre vide pour un utilisateur qui a quitt� Silliker.", vbExclamation, App.Title
      If Not bShiftPressed Then
        bdcSysBal.SetFocus
        AutoSelect bdcSysBal, True
        Exit Function
      End If
    End If
  Else
    If IsNumeric(colChamps("uti_numuti")) Then
      iNbSecret = BDCurseurExpress("select count(*) from lettre where let_secret=" & colChamps("uti_numuti"))
      If iNbSecret > 0 Then
        MsgBox "Il n'y a pas de syst�me de gestion de bo�te aux lettres, mais l'utilisateur est  est d�fini " & iNbSecret & " fois en tant que secr�taire dans la table lettre." & vbCrLf & vbCrLf & _
          "Effacez ou remplacez ces codes avant de supprimer la bo�te aux lettres.", vbExclamation, App.Title
        Exit Function
      End If
    End If
    
'    If colChamps("uti_passwd") <> "" Then
'      MsgBox "Il n'y a pas de syst�me de gestion de bo�te aux lettres, mais le mot de passe est d�fini." & vbCrLf & vbCrLf & _
'          "Effacez le mot de passe, ou d�finissez un syst�me de gestion de bo�te aux lettres.", vbExclamation, App.Title
'      If Not bShiftPressed Then
'        colChamps("uti_passwd").SetFocus
'        Exit Function
'      End If
'    End If
  End If
  
  
  ' On v�rifie que la liste des syst�mes est valide (lettres ou + ou - ou vide)
  If colChamps("uti_systemes") <> "" And colChamps("uti_systemes") <> "+" And colChamps("uti_systemes") <> "-" Then
    If colChamps("uti_systemes") <> UCase(colChamps("uti_systemes")) Then colChamps("uti_systemes") = UCase(colChamps("uti_systemes"))
    
    Dim cSys As String
    For i = 1 To Len(colChamps("uti_systemes"))
      cSys = Mid(colChamps("uti_systemes"), i, 1)
      If cSys <> "*" Then
        If sNomSyst�me(cSys) = "" Then
          MsgBox "Syst�me '" & cSys & "' inconnu !", vbExclamation, App.Title
          txtChamp(11).SetFocus
          Exit Function
        End If
      End If
      If InStr(Left(colChamps("uti_systemes"), i - 1), cSys) <> 0 Then
        MsgBox "Syst�me '" & cSys & "' sp�cifi� en double !", vbExclamation, App.Title
        Exit Function
      End If
    Next
  End If
  
  
  ' Pour les utilisateurs qui ne sont plus l�, on v�rifie que le n� n'est pas utilis� dans la table des lettres
  If colChamps("uti_systemes") = "-" Then
    If colChamps("uti_numuti") <> "" Then
      iNbLettres = BDCurseurExpress("select count(*) from lettre where let_pers=" & colChamps("uti_numuti"))
      iNbSecret = BDCurseurExpress("select count(*) from lettre where let_secret=" & colChamps("uti_numuti"))
      If iNbLettres > 0 Or iNbSecret > 0 Then
        MsgBox "Attention - L'utilisateur a quitt� Silliker, mais il reste " & iNbLettres & " lettre" & s(iNbLettres) & " rattach�e" & s(iNbLettres) & " � cet utilisateur, et il est d�fini " & iNbSecret & " fois en tant que secr�taire dans la table lettre." & vbCrLf & vbCrLf & _
          "Effacez ou remplacez ces codes avant de supprimer l'utilisateur.", vbExclamation, App.Title
        Exit Function
      End If
    End If
    
    If colChamps("uti_bal") <> "" Then
      MsgBox "Attention - L'utilisateur a quitt� Silliker, mais le code BAL est d�fini.", vbExclamation, App.Title
      If Not bShiftPressed Then
        colChamps("uti_bal").SetFocus
        AutoSelect colChamps("uti_bal"), True
        Exit Function
      End If
    End If
  Else
    If colChamps("uti_bal") = "" Then
      MsgBox "Le code de bo�te aux lettres est obligatoire pour les utilisateurs qui n'ont pas quitt� Silliker.", vbExclamation, App.Title
      colChamps("uti_bal").SetFocus
      Exit Function
    End If
  End If
  
  
  ' Pas de contr�le via maxlength, parce que ce champ a une taille 10 dans la table utilisateur
  ' et si le maxlength est diff�rent de cette taille, il y a un message d'erreur pour PV�
  If Len(colChamps("uti_bal")) > 8 Then
    MsgBox "8 caract�res maximum pour la BAL.", vbExclamation, App.Title
    colChamps("uti_bal").SetFocus
    Exit Function
  End If
  
  
''   On v�rifie que le micro est unique (avertissement seulement)
'  If colChamps("uti_micro") <> "" Then
'    If colChamps("uti_micro") <> LCase(colChamps("uti_micro")) Then colChamps("uti_micro") = LCase(colChamps("uti_micro"))
'
'    Dim cMicro As New BDCurseur
'    cMicro.OpenCurseur "select uti_numuti,uti_nom from utilisateur where uti_micro='" & colChamps("uti_micro") & "'"
'    While Not cMicro.EOF
'      If colChamps("uti_numuti") = "" Then
'        iOld = 0
'      Else
'        iOld = Int(colChamps("uti_numuti"))
'      End If
'      If cMicro!uti_numuti <> iOld Then
'        MsgBox "Attention, le micro " & colChamps("uti_micro") & " est d�j� attribu� � l'utilisateur " & cMicro!uti_numuti & " (" & cMicro!uti_nom & ")", vbInformation, App.Title
'      End If
'      cMicro.MoveNext
'    Wend
'    cMicro.CloseCurseur
'
'    If colChamps("uti_systemes") = "-" Then
'      MsgBox "Le champ micro devrait �tre vide pour un utilisateur qui a quitt� Silliker.", vbExclamation, App.Title
'      If Not bShiftPressed Then Exit Function
'    End If
'  End If
  
  ' On v�rifie la BAL
  If colChamps("uti_bal") <> "" Then
    ' On v�rifie qu'elle est unique
    Dim cBAL As New BDCurseur
    cBAL.OpenCurseur "select uti_numuti,uti_nom,uti_bal from utilisateur where uti_bal is not null"
    While Not cBAL.EOF
      If UCase(colChamps("uti_bal")) = UCase(cBAL!uti_bal) And cBAL!uti_numuti <> VZ(colChamps("uti_numuti")) Then
        MsgBox "Attention, la bo�te aux lettes " & colChamps("uti_bal") & " est d�j� attribu�e � l'utilisateur " & cBAL!uti_numuti & " (" & cBAL!uti_nom & ")", vbExclamation, App.Title
        txtChamp(4).SetFocus
        Exit Function
      End If
      cBAL.MoveNext
    Wend
    cBAL.CloseCurseur
    
    ' On v�rifie que la bal ne contient que des caract�res de base (lettres, chiffres ou point ou _)
    For i = 1 To Len(colChamps("uti_bal"))
      If Not Mid(colChamps("uti_bal"), i, 1) Like "[A-Za-z0-9._]" Then
        MsgBox "Attention, caract�re " & Mid(colChamps("uti_bal"), i, 1) & " interdit dans la bo�te aux lettes. Seuls les lettres, les chiffres, le blanc soulign� et le point sont accept�s.", vbExclamation, App.Title
        txtChamp(4).SetFocus
        Exit Function
      End If
    Next
  End If
  
  
  ' Contr�le du niveau
  If colChamps("uti_systemes") <> "-" Then
    If colChamps("uti_niveau") = "" Then
      MsgBox "Le niveau de privil�ge est obligatoire pour les personnes qui n'ont pas quitt� la soci�t�, 0 est le niveau g�n�ral.", vbExclamation, App.Title
      colChamps("uti_niveau").SetFocus
      Exit Function
    End If
  End If
      
  ' Contr�le du niveau Web
  Dim iNivWeb As Integer
  If colChamps("uti_nivweb") <> "" Then
    iNivWeb = Int(colChamps("uti_nivweb"))
    If iNivWeb < 0 Or iNivWeb > 3 Then
      MsgBox "Le niveau Web doit �tre compris entre 0 (en t�te de liste) et 3 (en fin de liste) !", vbExclamation, App.Title
      txtChamp(13).SetFocus
      Exit Function
    End If
  End If
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


' Convertit un texte vide en z�ro
Private Function VZ(s As String) As Integer
  If s = "" Then
    VZ = 0
  Else
    VZ = CInt(s)
  End If
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  Dim cUtiAdd As New BDCurseur
  cUtiAdd.OpenCurseur "select * from utilisateur where uti_numuti=0"
  cUtiAdd.AddNew
  
  ' On r�cup�re un n� d'utilisateur
  If Not IsNumeric(colChamps("uti_numuti")) Then
    Dim cNumUti As New BDCurseur
    cNumUti.OpenCurseur "select max(uti_numuti) from utilisateur"
    colChamps("uti_numuti") = cNumUti.Fields(0) + 1
    cNumUti.CloseCurseur
  End If
  cUtiAdd!uti_numuti = colChamps("uti_numuti")

  If Not bPr�pareEditAdd(cUtiAdd, colColonnes, colChamps) Then
    colChamps("uti_numuti") = ""
    cUtiAdd.CloseCurseur
    Exit Sub
  End If
  cUtiAdd.CloseCurseur
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cUti Is Nothing Then cUti.CloseCurseur
  Set cUti = New BDCurseur
  sFinalSQL = "select * from utilisateur where uti_numuti=" & sFormToSQL(colChamps("uti_numuti"), BDTypeINTEGER)
  cUti.OpenCurseur sFinalSQL
  cUti.MoveFirst
              
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
      JournalUnix sTable & " " & colChamps("uti_numuti"), "cr��", sMsgTrace
    End If
  End If
  
  ' On recharge la liste des utilisateurs en m�moire, pour pouvoir imm�diatement affecter des lettres par exemple
  'ChargeUtilisateurs
  
  ActiveFormulaire False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire         ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  bdS�l.Emp�cheMouvements       ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  
  M�morise
  InvalideColUtilisateur    ' On force la relecture de colUtilisateur
  
  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cUti Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cUti.Edit
  If Not bPr�pareEditAdd(cUti, colColonnes, colChamps) Then Exit Sub
  
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
      JournalUnix sTable & " " & colChamps("uti_numuti"), "chang�", sMsgTrace
    End If
  End If
  ActiveFormulaire False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire     ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  AjusteMouvements

  M�morise
  InvalideColUtilisateur    ' On force la relecture de colUtilisateur
  
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

  ActiveFormulaire False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cUti Is Nothing Then
    If Not (cUti.EOF And cUti.BOF) Then
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
  BDActiveMaxLength colChamps, colColonnes, False
  
  colChamps("uti_numuti").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cUti Is Nothing
  
  If cUti.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "uti_numuti", False
  ActiveChamp "uti_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("uti_nom").SetFocus
  AutoSelect colChamps("uti_nom"), True
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
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "uti_numuti", False
  ActiveChamp "uti_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("uti_nom").SetFocus
'  AutoSelect colChamps("uti_nom"), True
  bdS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cUti Is Nothing

  If cUti.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est d�finitif." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
       
  ' M�morisation de la trace de l'enregistrement qui va �tre d�truit
  EffaceCollection colD�truit
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colD�truit.Add ValeurContr�le(C), C.DataField
    End If
  Next
  
  ' Tri des donn�es � conserver et placement ds la variable Smsgtrace
  Dim sMsgTrace As String
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContr�le(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & colD�truit(C.DataField)
         End If
      End If
  Next
  
  ' On r�pertorie l'enregistrement dans le journal avant la destructiuon definitive
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("uti_numuti"), "d�truit", sMsgTrace
  End If
  
  On Error Resume Next
  cUti.Delete
  If Err Then
    AfficheErreurODBC "�chec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cUti.MoveNext
  If cUti.EOF Then
    cUti.MovePrevious
    If cUti.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  InvalideColUtilisateur    ' On force la relecture de colUtilisateur
  
  bdS�l.ActiveMouvements iMode = meNavigate
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cUti Is Nothing

  bdS�l.ButtonEnabled("First") = cUti.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cUti.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cUti.EOF
  bdS�l.ButtonEnabled("Last") = Not cUti.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cUti.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
  cUti.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cUti.MoveNext
  AjusteMouvements
  If cUti.EOF Then cUti.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cUti.MovePrevious
  AjusteMouvements
  If cUti.BOF Then cUti.MoveFirst
  SynchroniseFormulaire
End Sub


Private Sub btnInfoNiveaux_Click()
  FileShellExecute hWnd, "http://www.silliker/microbsoft/serveur/codes.htm"
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


Private Sub btnListeSys_Click()
  Dim sMsg As String
  Dim s As Syst�me
  For Each s In colSyst�me
    sMsg = sMsg & vbCrLf & s.sys_systeme & ": " & s.sys_nom & " (" & s.sys_description & ")"
  Next
  MsgBox Mid(sMsg, 3), vbInformation, App.Title
End Sub



' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  Dim C As Control
  
  ResetChienDeGarde
  If KeyCode = vbKeyF5 Then   ' M�moire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set C = ActiveControl
          C = colM�moireUtilisateur(ActiveControl.DataField)
          C.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each C In colChamps
        If Not C.Locked Then      ' On ne remplit pas les champs verrouill�s
          C = colM�moireUtilisateur(C.DataField)
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
    PopupMenu MDIAdministration.mnuCommandes
  End If
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  If Not bExisteTable(sTable) Then
    MsgBox "La table '" & sTable & "' n'est pas pr�sente dans la base de donn�es courante, affichage impossible.", vbCritical, App.Title
    Unload Me
    Exit Sub
  End If
  
  Show
  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  
  ' Chargement des combos
  Dim u As Unit�
  For Each u In colUnit�
    bdcUnit�.AddItem u.sNumUni, u.uni_titre
  Next
  
  Dim s As Syst�me
  For Each s In colSyst�me
    bdcSysBal.AddItem s.sys_systeme, s.sys_nom
  Next
  
  Dim si As Site
  For Each si In colSite
    bdcSite.AddItem si.sit_numsite, si.sit_libelle
  Next
  
  
  ' Formulaire en mode initial
  Set cUti = Nothing
  ActiveFormulaire False
  With bdS�l
    .LectureSeule = bLectureSeule
    .ActiveMouvements False
    .ActiveValidation False
    .ButtonEnabled("Query") = True
    .ButtonEnabled("Add") = True
    .SetFocus
  End With
  
  BDActiveChamp txtLettres, False
  
  iMode = meEmpty
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
  If Not cUti Is Nothing Then
    cUti.CloseCurseur
    Set cUti = Nothing
  End If
  MDIAdministration.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cUti Is Nothing Then
    EffaceFormulaire
  ElseIf cUti.BOF And cUti.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cUti.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cUti.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    D�codeNiveau
    bdS�l.NumRec = cUti.AbsolutePosition
       
    ' Mise � jour en arri�re plan
    txtLettres = "?"
    ActiveTimer mtRapide
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cUti.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
'  If bdcUnit�.Text <> "" And InStr(bdcUnit�.Text, bdcUnit�.S�parateur) = 0 Then
'    bdcUnit�.AddItem bdcUnit�.Text, sNomUnit�(bdcUnit�.Text)
'  End If
'
'  If bdcSysBal.Text <> "" And InStr(bdcSysBal.Text, bdcSysBal.S�parateur) = 0 Then
'    bdcSysBal.AddItem bdcSysBal.Text, sNomSyst�me(bdcSysBal.Text)
'  End If
  
  If txtLettres = "?" Then
    Dim cLettres As New BDCurseur
    Dim sLettres As String
    cLettres.OpenCurseur "select let_lettres,let_systeme from lettre where let_pers=" & colChamps("uti_numuti")
    While Not cLettres.EOF
      If sLettres <> "" Then sLettres = sLettres & ";"
      sLettres = sLettres & cLettres!let_lettres & "/" & cLettres!let_systeme
      cLettres.MoveNext
    Wend
    cLettres.CloseCurseur
    txtLettres = sLettres
  End If
End Sub



Private Sub EffaceFormulaire()
  Dim C As Control
  For Each C In colChamps
    C.Text = ""
  Next
  bdS�l.NumRec = ""
  txtLettres = ""
  Dim i As Integer
  For i = 0 To 7
    chkNiveau(i) = vbUnchecked
  Next
End Sub


Private Sub ActiveFormulaire(bEnabled As Boolean)
  Dim C As Control
  For Each C In colChamps
    BDActiveChamp C, bEnabled
  Next
  Dim i As Integer
  For i = 0 To 7
    chkNiveau(i).Enabled = bEnabled
  Next
End Sub



Private Sub ActiveChamp(ByVal sChamp As String, bEnabled As Boolean)
  BDActiveChamp colChamps(sChamp), bEnabled
End Sub


'=================================================================================

' Activation du timer de mise � jour des champs satellites
Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop: timSatellites.Enabled = False
    Case mtLent: timSatellites.Interval = 1000: timSatellites.Enabled = True
    Case mtRapide: timSatellites.Interval = 250: timSatellites.Enabled = True
  End Select
End Sub


Private Sub txtChamp_DblClick(Index As Integer)
  If txtChamp(Index).DataField = "uti_numuti" Then
    ActiveChamp "uti_numuti", True
  End If
End Sub

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
  fraPrivil�ge.Visible = txtChamp(Index).DataField = "uti_niveau"
End Sub

'Private Sub txtChamp_LostFocus(Index As Integer)
'  If txtChamp(Index).DataField = "uti_niveau" Then fraPrivil�ge.Visible = False
'End Sub

Private Sub bdcSysBal_GotFocus()
  SetStatus bdcSysBal.Tag
End Sub

Private Sub bdcSysBal_LostFocus()
  bdcSysBal.Synchronise
End Sub


Private Sub bdcUnit�_GotFocus()
  SetStatus bdcUnit�.Tag
  fraPrivil�ge.Visible = False
End Sub

Private Sub bdcUnit�_LostFocus()
  bdcUnit�.Synchronise
End Sub


Private Sub bdcSite_GotFocus()
  SetStatus bdcSite.Tag
  fraPrivil�ge.Visible = False
End Sub

Private Sub bdcSite_LostFocus()
  bdcSite.Synchronise
End Sub


Private Sub bdS�l_GotFocus()
  SetStatus
End Sub


Private Sub D�codeNiveau()
  Dim i As Integer
  Dim iVal As Integer
  iVal = 0
  If IsNumeric(colChamps("uti_niveau")) Then
    iVal = Val(colChamps("uti_niveau"))
  End If
  
  For i = 0 To 7
    chkNiveau(i) = IIf(iVal And 2 ^ i, vbChecked, vbUnchecked)
  Next
End Sub

Private Sub chkNiveau_Click(Index As Integer)
  If chkNiveau(Index) Is ActiveControl Then
    Dim iVal As Integer
    Dim i As Integer
    For i = 0 To 7
      If chkNiveau(i) = vbChecked Then iVal = iVal + 2 ^ i
    Next
    colChamps("uti_niveau") = iVal
  End If
End Sub

Private Sub txtChamp_Change(Index As Integer)
  If colChamps("uti_niveau") Is ActiveControl Then D�codeNiveau
End Sub

Private Sub txtChamp_MouseDown(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
  If colChamps("uti_passwd") Is ActiveControl And Shift = vbShiftMask And Button = vbLeftButton Then txtChamp(Index).PasswordChar = ""
End Sub

Private Sub txtChamp_MouseUp(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
  If colChamps("uti_passwd") Is ActiveControl And Shift = vbShiftMask And Button = vbLeftButton Then txtChamp(Index).PasswordChar = "*"
End Sub

'=================================================================================
' Acc�s au Web

Public Sub Fen�treWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=" & sTable
End Sub


'=================================================================================
' Copie des donn�es dans le presse-papiers
' On ne copie pas le mot de passe !!!

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours�"
  
  ' On retire provisoirement uti_passwd de la collection des champs pour ne pas le copier !
  Dim t As TextBox
  Set t = colChamps("uti_passwd")
  colChamps.Remove "uti_passwd"
  
  BDCopieS�lection cUti, colChamps, bdS�l
  
  colChamps.Add t, "uti_passwd"
  
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  BDEtat sFinalSQL, drUtilisateur, True
End Sub

Public Sub Aper�u()
  BDEtat sFinalSQL, drUtilisateur, False
End Sub


'=================================================================================
' M�morisation

Public Sub M�morise()
  EffaceCollection colM�moireUtilisateur
  
  Dim t As Control
  For Each t In colChamps
    colM�moireUtilisateur.Add (t), t.DataField
  Next
End Sub


'=================================================================================
' Active Directory
' Attention, ne peut fonctionner que sur un syst�me sur lequel ADSI est install�
' Par d�faut le cas de Win2K, WinXP
' Attention - M�thode d'�numration pas bonne: les utilisateurs INF ne font pas
' partie de CN=Users mais OU=INF: il faut utiliser une recherche ADO...
 
Private Sub Trace(sMsg As String)
  frmTraceAD.lstTrace.AddItem sMsg
  frmTraceAD.lstTrace.ListIndex = frmTraceAD.lstTrace.ListCount - 1
  frmTraceAD.lstTrace.Refresh
End Sub

Private Sub btnCtrlAD_Click()
  frmTraceAD.Show
  frmTraceAD.lstTrace.Clear
  
  Dim ADUsers
  Set ADUsers = GetObject("LDAP://CN=Users,DC=silliker,DC=fr")
  Dim ADUser
  Dim ADName As String
  
  Trace "Analyse en cours..."
  For Each ADUser In ADUsers
    ADName = ADUser.Name
    If Right(ADName, 1) <> "$" Then
      ADName = Mid(ADName, 4)
      Dim u As Utilisateur
      Dim bTrouv� As Boolean
      bTrouv� = False
      For Each u In colUtilisateur
        If StrComp(u.uti_nom, ADName, vbTextCompare) = 0 Then
          bTrouv� = True
          Exit For
        End If
      Next
      If Not bTrouv� Then
        Trace ADName & ": pr�sent dans AD, non pr�sent dans la table utilisateur"
      Else
        If ADUser.AccountDisabled And u.uti_systemes <> "-" And u.uti_systemes <> "+" Then
          Trace ADName & ": d�sactiv� dans AD, et affect� au syst�me " & u.uti_systemes & " dans la table utilisateur"
        End If
        If (Not ADUser.AccountDisabled) And u.uti_systemes = "-" Then
          Trace ADName & ": non d�sactiv� dans AD, et affect� au syst�me - dans la table utilisateur"
        End If
      End If
    End If
  Next
  
  Trace "Termin�"
End Sub


'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("uti_numuti") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub
