VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmAnomalie 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Enregistrement d'une anomalie"
   ClientHeight    =   6525
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8190
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAnomalies.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6525
   ScaleWidth      =   8190
   Begin VB.Frame fraAnomalie 
      Caption         =   "Anomalie"
      Height          =   2475
      Left            =   60
      TabIndex        =   25
      Top             =   780
      Width           =   8055
      Begin VB.TextBox txtDateSignalé 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   5760
         Locked          =   -1  'True
         TabIndex        =   20
         TabStop         =   0   'False
         Top             =   600
         Width           =   2175
      End
      Begin VB.TextBox txtDescription 
         DataField       =   "ano_description"
         Height          =   735
         Left            =   1680
         MaxLength       =   150
         MultiLine       =   -1  'True
         TabIndex        =   2
         Tag             =   "Description détaillée de l'anomalie"
         Top             =   1680
         Width           =   6255
      End
      Begin VB.TextBox txtTitre 
         DataField       =   "*ano_titre"
         Height          =   315
         Left            =   1680
         MaxLength       =   40
         TabIndex        =   1
         Tag             =   "Brève description de l'anomalie"
         Top             =   1320
         Width           =   6255
      End
      Begin SaisieLabo.BDCombo bdcTypeAnomalie 
         Height          =   330
         Left            =   1680
         TabIndex        =   0
         Top             =   960
         Width           =   6255
         _ExtentX        =   11033
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
      End
      Begin SaisieLabo.BDCombo bdcPersSignalé 
         Height          =   330
         Left            =   1680
         TabIndex        =   19
         Top             =   600
         Width           =   3375
         _ExtentX        =   5953
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
      End
      Begin SaisieLabo.BDCombo bdcSection 
         Height          =   330
         Left            =   1680
         TabIndex        =   17
         Top             =   240
         Width           =   3375
         _ExtentX        =   5953
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
      End
      Begin SaisieLabo.BDCombo bdcEtat 
         Height          =   330
         Left            =   5760
         TabIndex        =   18
         Top             =   240
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
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "État :"
         Height          =   210
         Index           =   9
         Left            =   5160
         TabIndex        =   27
         Top             =   300
         Width           =   525
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "&Section :"
         Height          =   210
         Index           =   6
         Left            =   120
         TabIndex        =   26
         Top             =   300
         Width           =   825
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Le :"
         Height          =   210
         Index           =   15
         Left            =   5160
         TabIndex        =   29
         Top             =   660
         Width           =   360
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Signalée par :"
         Height          =   210
         Index           =   14
         Left            =   120
         TabIndex        =   28
         Top             =   660
         Width           =   1320
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "T&ype :"
         Height          =   210
         Index           =   13
         Left            =   120
         TabIndex        =   30
         Top             =   1020
         Width           =   585
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Description :"
         Height          =   210
         Index           =   2
         Left            =   120
         TabIndex        =   32
         Top             =   1740
         Width           =   1185
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "T&itre :"
         Height          =   210
         Index           =   7
         Left            =   120
         TabIndex        =   31
         Top             =   1380
         Width           =   555
      End
   End
   Begin VB.Frame fraTraitement 
      Caption         =   "Traitement"
      Height          =   1455
      Left            =   60
      TabIndex        =   33
      Top             =   3300
      Width           =   8055
      Begin VB.CommandButton btnTraiter 
         Caption         =   "&Traiter"
         Height          =   315
         Left            =   120
         TabIndex        =   5
         Top             =   1020
         Width           =   1455
      End
      Begin VB.TextBox txtDescriptionTraité 
         BackColor       =   &H8000000F&
         DataField       =   "ano_description"
         Height          =   735
         Left            =   1680
         Locked          =   -1  'True
         MaxLength       =   150
         MultiLine       =   -1  'True
         TabIndex        =   6
         TabStop         =   0   'False
         Tag             =   "Description détaillée de l'anomalie"
         Top             =   600
         Width           =   6255
      End
      Begin VB.TextBox txtDateTraité 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   5820
         Locked          =   -1  'True
         TabIndex        =   4
         TabStop         =   0   'False
         Top             =   240
         Width           =   2115
      End
      Begin SaisieLabo.BDCombo bdcPersTraité 
         Height          =   330
         Left            =   1680
         TabIndex        =   3
         TabStop         =   0   'False
         Tag             =   "Code personne ayant signalé l'événement"
         Top             =   240
         Width           =   3435
         _ExtentX        =   6059
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
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Description :"
         Height          =   210
         Index           =   12
         Left            =   120
         TabIndex        =   36
         Top             =   660
         Width           =   1185
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Le :"
         Height          =   210
         Index           =   11
         Left            =   5220
         TabIndex        =   35
         Top             =   300
         Width           =   360
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Traité par :"
         Height          =   210
         Index           =   10
         Left            =   120
         TabIndex        =   34
         Top             =   300
         Width           =   1050
      End
   End
   Begin VB.TextBox txtCB 
      Height          =   315
      Left            =   1380
      TabIndex        =   14
      Top             =   420
      Width           =   2295
   End
   Begin VB.TextBox txtRefEch 
      Height          =   315
      Left            =   5040
      MaxLength       =   11
      TabIndex        =   15
      Top             =   420
      Width           =   1395
   End
   Begin VB.TextBox txtSérieLabo 
      Height          =   315
      Left            =   5040
      MaxLength       =   7
      TabIndex        =   12
      Top             =   60
      Width           =   1395
   End
   Begin VB.CommandButton btnValider 
      Caption         =   "Valider (F2)"
      Height          =   315
      Left            =   6660
      TabIndex        =   13
      Top             =   60
      Width           =   1455
   End
   Begin VB.CommandButton btnInitialiser 
      Caption         =   "Initialiser (F3)"
      Height          =   315
      Left            =   6660
      TabIndex        =   16
      Top             =   420
      Width           =   1455
   End
   Begin VB.TextBox txtNumAnomalie 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1380
      Locked          =   -1  'True
      TabIndex        =   11
      TabStop         =   0   'False
      Top             =   60
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Derniers enre&gistrements"
      Height          =   1695
      Left            =   60
      TabIndex        =   37
      Top             =   4800
      Width           =   8055
      Begin VB.CommandButton btnRafraîchir 
         Caption         =   "&Rafraîchir"
         Height          =   315
         Left            =   4140
         TabIndex        =   10
         ToolTipText     =   "Relit la liste des derniers enregistrements: affiche les saisies des autres postes"
         Top             =   1320
         Width           =   1455
      End
      Begin VB.CommandButton btnSupprimer 
         Caption         =   "&Supprimer"
         Height          =   315
         Left            =   1740
         TabIndex        =   9
         Top             =   1320
         Width           =   1455
      End
      Begin VB.CommandButton btnModifier 
         Caption         =   "&Modifier"
         Height          =   315
         Left            =   120
         TabIndex        =   8
         Top             =   1320
         Width           =   1455
      End
      Begin MSComctlLib.ListView lvAnomalies 
         Height          =   1005
         Left            =   120
         TabIndex        =   7
         Top             =   240
         Width           =   7815
         _ExtentX        =   13785
         _ExtentY        =   1773
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         Appearance      =   1
         NumItems        =   6
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "N°"
            Object.Width           =   1182
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Heure"
            Object.Width           =   1940
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Section"
            Object.Width           =   1058
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Ét"
            Object.Width           =   529
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "Pers"
            Object.Width           =   582
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Text            =   "Titre"
            Object.Width           =   5292
         EndProperty
      End
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "&Code barre :"
      Height          =   210
      Index           =   8
      Left            =   60
      TabIndex        =   22
      Top             =   480
      Width           =   1200
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Éc&hantillon :"
      Height          =   210
      Index           =   0
      Left            =   3780
      TabIndex        =   24
      Top             =   480
      Width           =   1155
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Série / &FSE :"
      Height          =   210
      Index           =   3
      Left            =   3780
      TabIndex        =   23
      Top             =   120
      Width           =   1155
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Serial :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   21
      Top             =   120
      Width           =   660
   End
End
Attribute VB_Name = "frmAnomalie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmAnomalie
' Enregistrement d'une anomalie labo
' 29/04/1998 PV
'  7/12/1998 PV Remplacement des \r\n dans la base par des ¶[chr(182)]
' 25/08/1999 PV Test de l'existence de la table c_anomalie à l'ouverture de la feuille
' 21/11/2001 PC :
'               - codes barre controlés par nlle fonction bDécodeCB_FP
'               - Positionnement à l'ouverture et après scan code barre sur champ type
'               - valeurs par défaut des champs bdcSection et bdcPersSignalé plus à vide

Option Explicit

Private Const sTable = "c_anomalie"

Private Sub InitialiseChamps()
' Initialisation des valeurs des champs
' PC 20/11/2001 : correction valeur par défaut de
' * bdcPersSignalé passé de "" à iNumOpérateur
' * bdcSection passé de "" à "SL"
' * bdcEtat passé de "" à "0"

  txtNumAnomalie = "": txtCB = "": txtSérieLabo = "": txtRefEch = ""
  
  bdcSection = "SL": bdcPersSignalé = iNumOpérateur: txtDateSignalé = ""
  bdcTypeAnomalie = "": txtTitre = "": txtDescription = "": bdcEtat = "0"
  
  bdcPersTraité = "": txtDateTraité = "": txtDescriptionTraité = ""
  
  EnableChampsTraitements False
  
' PC 21/11/2001 : par défaut, on se postionne sur le champ type
' txtCB.SetFocus
  Me.bdcTypeAnomalie.SetFocus

End Sub

Private Sub bdcPersSignalé_GotFocus()
  bdcPers_GotFocus
End Sub

' Types automatiques en fonction de la section
Private Sub bdcSection_Change()
  AjusteType
End Sub

Private Sub bdcSection_Click()
  AjusteType
End Sub

Private Sub AjusteType()
  bdcTypeAnomalie.Clear
  
  Dim t As TypeAnomalie, sLastSection As String
  For Each t In colTypeAnomalie
    If StrComp(t.ta_section, bdcSection, vbTextCompare) = 0 Then
      If t.ta_section <> sLastSection Then
        bdcTypeAnomalie.AddItem t.ta_section & "0", "(Autre)"
        sLastSection = t.ta_section
      End If
      bdcTypeAnomalie.AddItem t.ta_section & t.ta_code, t.ta_libelle
    End If
  Next
End Sub

Private Sub EnableChampsTraitements(bEnabled As Boolean)
' Autorise ou non le bloc de champs relatifs au traitement
  
  BDActiveChamp bdcPersTraité, bEnabled
  BDActiveChamp txtDateTraité, bEnabled
  BDActiveChamp txtDescriptionTraité, bEnabled
End Sub

Function bOkRéférence(ByVal txtRéférence As String, ByRef sRefSansPoint As String) As Boolean
' Vérifie si une référence est valide
  
'   Première partie: vérifications simples
'   FG 28/11/2001 : pourquoi autoriser une réf vide ???
'  If txtRéférence = "" Then
'    bOkRéférence = True
'    Exit Function
'  End If
  
  If Len(txtRéférence) < 7 Or Len(txtRéférence) > 11 Then
    MsgBox "Référence échantillon invalide ! (doit faire de 9 à 11 caractères)", vbExclamation, App.Title
    bOkRéférence = False
    Exit Function
  End If
  
  ' Normalisation externe de la référence, avec point
  If txtRéférence <> UCase(txtRéférence) Then txtRéférence = UCase(txtRéférence)
  
  If Left(txtRéférence, 1) < "A" Or Left(txtRéférence, 1) > "Z" Or Mid(txtRéférence, 2, 1) < "A" Or Mid(txtRéférence, 2, 1) > "Z" Then
    MsgBox "La référence doit commencer par 2 lettres !", vbExclamation, App.Title
    bOkRéférence = False
    Exit Function
  End If
  
  ' On vérifie que les deux lettres sont bien affectées. ZZ est autorisé pour les essais
  If Left(txtRéférence, 2) <> "ZZ" Then
    Dim iNb As Integer
    iNb = BDCurseurExpress("select count(*) from lettre where let_lettres='" & Left(txtRéférence, 2) & "'")
    If iNb <> 1 Then
      MsgBox "Les deux lettres de la référence ne sont pas affectées à un assistant !", vbExclamation, App.Title
      bOkRéférence = False
      Exit Function
    End If
  End If
      
  ' On vérifie s'il y a un point qu'il est bien placé
  Dim p As Integer
  p = InStr(txtRéférence, ".")
  If p = 0 Then
    sRefSansPoint = txtRéférence
    txtRéférence = Left(txtRéférence, Len(txtRéférence) - 2) & "." & Right(txtRéférence, 2)
  Else
    If p <> Len(txtRéférence) - 2 Then
      MsgBox "Le numéro d'échantillon après le point doit être compris entre 01 et 99 !", _
        vbExclamation, App.Title
      bOkRéférence = False
      Exit Function
    End If
    sRefSansPoint = Left(txtRéférence, p - 1) & Mid(txtRéférence, p + 1)
  End If

  Dim dRef As Double
  dRef = Val(Mid(txtRéférence, 3))
  If dRef < 10000 Then
    MsgBox "La référence d'intervention est un nombre supérieur à 10000." & vbCrLf & _
      "Le numéro d'échantillon est compris entre 01 et 99", vbExclamation, App.Title
    bOkRéférence = False
    Exit Function
  End If

  bOkRéférence = True
End Function

Private Sub ValiderEnregistrement()
  ' Vérification du n° de FSE
  If txtSérieLabo <> "" Then
    If Not IsNumeric(txtSérieLabo) Then
      MsgBox "Le n° de FSE/Série est invalide.", vbExclamation, App.Title
      txtSérieLabo.SetFocus
      Exit Sub
    End If
  End If
  
  ' Vérification de la référence
  Dim sRefSansPoint As String
  If Not bOkRéférence(txtRefEch, sRefSansPoint) Then
    txtRefEch.SetFocus
    Exit Sub
  End If
  
  ' Anomalie ----------------------
  bdcSection.Synchronise
  If bdcSection = "" Then
    MsgBox "La section est obligatoire.", vbExclamation, App.Title
    bdcSection.SetFocus
    Exit Sub
  End If
  
  ' Si le n° de personne n'est pas précisé, on le prend de la FSE
  If bdcPersSignalé = "" And txtSérieLabo <> "" Then
    Dim iPers As Integer
    iPers = iPersonneDeFSE
    If iPers < 0 Then
      MsgBox "Le n° de personne n'est pas précisé, et le n° de FSE/Série est incorrect, inexistant ou trop ancien.", vbExclamation, App.Title
      txtSérieLabo.SetFocus
      Exit Sub
    End If
    bdcPersSignalé = iPers
  End If
  If bdcPersSignalé = "" Then
    MsgBox "Le n° de personne est obligatoire.", vbExclamation, App.Title
    bdcPersSignalé.SetFocus
    Exit Sub
  End If

  If Not IsNumeric(bdcPersSignalé) Then
    MsgBox "Le n° de personne est incorrect.", vbExclamation, App.Title
    bdcPersSignalé.SetFocus
    Exit Sub
  End If
  bdcPersSignalé.Synchronise
  If bdcPersSignalé.ListIndex < 0 Then
    MsgBox "Le n° de personne doit faire partie de la liste.", vbExclamation, App.Title
    bdcPersSignalé.SetFocus
    Exit Sub
  End If
  
  If Len(bdcTypeAnomalie) > 5 Then
    MsgBox "5 caractères maximum pour le type d'anomalie, ou sélectionnez-le dans la liste.", vbExclamation, App.Title
    bdcTypeAnomalie.SetFocus
    Exit Sub
  End If
  bdcTypeAnomalie.Synchronise
  
  If txtTitre = "" Then
    MsgBox "Le titre est obligatoire.", vbExclamation, App.Title
    txtTitre.SetFocus
    Exit Sub
  End If
  
  If bdcEtat = "" Then
    bdcEtat = 0
  Else
    bdcEtat.Synchronise
  End If
  If bdcEtat.ListIndex < 0 Then
    MsgBox "L'état doit faire partie de la liste.", vbExclamation, App.Title
    bdcEtat.SetFocus
    Exit Sub
  End If
  
  If txtDateSignalé = "" Then
    txtDateSignalé = BDTime
    txtDateSignalé.Refresh
  End If
  
  If txtDateTraité <> "" Then
    If Not IsDate(txtDateTraité) Then
      MsgBox "Date+heure incorrecte dans le champ 'traité le'", vbExclamation, App.Title
      txtDateTraité.SetFocus
      Exit Sub
    End If
  
    ' On autorise un traitement jusqu'à 12 heures avant la signalisation !!!
    If CDate(txtDateTraité) < CDate(txtDateSignalé) - 0.5 Then
      MsgBox "Problème traité avant d'avoir été signalé ???", vbExclamation, App.Title
      txtDateTraité.SetFocus
      Exit Sub
    End If
  End If
  
  ' Tout est Ok !
  Screen.MousePointer = vbHourglass
  SetStatus "Enregistrement de l'anomalie…"
  
  ' Création de l'enregistrement
  Dim cAno As New BDCurseur
  If txtNumAnomalie = "" Then
    cAno.OpenCurseur "select * from c_anomalie where ano_serie=0"
    cAno.AddNew
  Else
    cAno.OpenCurseur "select * from c_anomalie where ano_serie=" & txtNumAnomalie
    cAno.Edit
  End If
  
  cAno!ano_serielabo = VN(txtSérieLabo)
  cAno!ano_reference = VN(txtRefEch)
  
  cAno!ano_section = bdcSection
  cAno!ano_etat = bdcEtat
  cAno!ano_perssignale = bdcPersSignalé
  cAno!ano_datesignale = txtDateSignalé
  cAno!ano_tssignale = txtDateSignalé
  cAno!ano_type = bdcTypeAnomalie
  cAno!ano_titre = txtTitre
  cAno!ano_description = Subst(txtDescription, vbCrLf, Chr(182))

  cAno!ano_perstraite = VN(bdcPersTraité)
  cAno!ano_tstraite = VN(txtDateTraité)
  cAno!ano_desctraite = VN(Subst(txtDescriptionTraité, vbCrLf, Chr(182)))
  
  cAno!timestamp = BDTime
  cAno.Update
  cAno.CloseCurseur
  
  SetStatus "Lecture du n° d'anomalie…"
  Dim iMax As Long
  If txtNumAnomalie = "" Then
    ' astuce : pour récupérer un sérial, on lit le max…
    iMax = BDCurseurExpress("select max(ano_serie) from c_anomalie")
  Else
    iMax = CLng(txtNumAnomalie)
    ' On efface l' événement de l'historique
    Dim i As Integer
    For i = 1 To lvAnomalies.ListItems.Count
      If lvAnomalies.ListItems(i) = iMax Then
        lvAnomalies.ListItems.Remove i
        Exit For
      End If
    Next
  End If
  
  ' Ajout de l'événement en tête de l'historique
  AjouteUneAnomalie iMax, Now, bdcSection, bdcEtat, bdcPersSignalé, txtTitre
  AjusteListView Me, lvAnomalies

  ' On efface les champs
  InitialiseChamps
  
  ' Réinitialisation du chien de garde d'inactivité
  RAZTimerInactif
  
  Screen.MousePointer = vbDefault
  SetStatus
' PC 21/11/2001 : positionnement par défaut sur le type
  Me.bdcTypeAnomalie.SetFocus

End Sub

Private Sub ModifierEnregistrement()
  If Not bContrôleSélection Then Exit Sub
  
  InitialiseChamps
  
  Dim cAno As New BDCurseur
  cAno.OpenCurseur "select * from c_anomalie where ano_serie=" & lvAnomalies.SelectedItem.Text
  If cAno.EOF Then
    cAno.CloseCurseur
    MsgBox "Evénement non trouvé dans la base, prévenez la DI.", vbExclamation, App.Title
    Exit Sub
  End If
  
  txtNumAnomalie = cAno!ano_serie
  
  txtSérieLabo = NV(cAno!ano_serielabo)
  txtRefEch = NV(cAno!ano_reference)
  
  bdcSection = cAno!ano_section
  bdcPersSignalé = cAno!ano_perssignale
  txtDateSignalé = cAno!ano_tssignale
  bdcTypeAnomalie = cAno!ano_type
  txtTitre = cAno!ano_titre
  txtDescription = Subst(NV(cAno!ano_description), Chr(182), vbCrLf)
  bdcEtat = cAno!ano_etat
  
  bdcPersTraité = NV(cAno!ano_perstraite)
  txtDateTraité = NV(cAno!ano_tstraite)
  txtDescriptionTraité = Subst(NV(cAno!ano_desctraite), Chr(182), vbCrLf)
End Sub

Private Sub SupprimerEnregistrement()
  If Not bContrôleSélection Then Exit Sub
  
  RunSQL "delete from c_anomalie where ano_serie=" & lvAnomalies.SelectedItem.Text
  lvAnomalies.ListItems.Remove lvAnomalies.SelectedItem.Index
  Set lvAnomalies.SelectedItem = Nothing ' Pas sur que ce soit nécessaire
End Sub

Private Sub RéférenceFP()
' Décode un code barre de fiche de prélèvement ou de FRT
' PC 21/11/2001 : évolution avec fonction bDecodeCB_FP
  
  Dim sRefEch As String ' référence de l'échantillon
  
'  sRefEch = sDécodeCBFP(txtCB)
'  If sRefEch <> "" Then sRefEch = Left(sRefEch, Len(sRefEch) - 2) & "." & Right(sRefEch, 2)

  If Not bDecodeCB_FP(txtCB, sRefEch) Then
    MsgBox "Code barre " & txtCB & " incorrect", _
      vbCritical + vbOKOnly, App.Title
  End If
  Me.txtRefEch = sRefEch

End Sub

Private Sub AjouteUneAnomalie(ByVal Série As Long, ByVal ts As Date, ByVal sSection As String, ByVal iEtat As Integer, ByVal iPersSignalé As Integer, ByVal sTitre As String)
' Historique des anomalies
  
  Dim itmX As ListItem
  Set itmX = lvAnomalies.ListItems.Add
  itmX.Text = Série
  itmX.SubItems(1) = Format(ts, "dd/mm hh:mm")
  itmX.SubItems(2) = sSection
  itmX.SubItems(3) = iEtat
  itmX.SubItems(4) = iPersSignalé
  itmX.SubItems(5) = sTitre

End Sub

Private Sub RafraîchitListeAnomalies()
  SetStatus "Lecture des dernières anomalies, patientez…"
  
  lvAnomalies.ListItems.Clear
  Dim cAno As New BDCurseur
  cAno.OpenCurseur "select * from c_anomalie where ano_datesignale=today order by ano_serie desc"
  Do
    If cAno.EOF Then Exit Do
    AjouteUneAnomalie cAno!ano_serie, cAno!ano_tssignale, cAno!ano_section, cAno!ano_etat, cAno!ano_perssignale, cAno!ano_titre
    cAno.MoveNext
  Loop
  cAno.CloseCurseur
  
  AjusteListView Me, lvAnomalies
  SetStatus
End Sub

Private Sub SynchroTitreAnomalie()
  Dim sTitre As String, p As Integer
  sTitre = bdcTypeAnomalie.FullText
  p = InStr(sTitre, bdcTypeAnomalie.Séparateur)
  If p > 0 Then txtTitre = Trim(Mid(sTitre, p + Len(bdcTypeAnomalie.Séparateur)))
End Sub

Private Sub bdcTypeAnomalie_Change()
  SynchroTitreAnomalie
End Sub

Private Sub bdcTypeAnomalie_Click()
  SynchroTitreAnomalie
End Sub

'=================================================================================
' Fonctions de la feuille

Private Sub Form_Load()
  
  If Not bExisteTable(sTable) Then
    MsgBox "La table '" & sTable & "' n'est pas présente dans la base de données courante, affichage impossible.", vbCritical, App.Title
    Unload Me
    Exit Sub
  End If
  
  Show
  SetStatus "Chargement en cours, patientez…"
  
  ' Chargement des combos
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcPersSignalé.AddItem u.uti_numuti, u.uti_nom
    bdcPersTraité.AddItem u.uti_numuti, u.uti_nom
  Next
  
  Dim s As Section
  For Each s In colSection
    bdcSection.AddItem s.sec_code, s.sec_libelle
  Next
  
  bdcEtat.AddItem 0, "A traiter"
  bdcEtat.AddItem 1, "Traitement en cours"
  bdcEtat.AddItem 2, "Traité"
  
  InitialiseChamps
  RafraîchitListeAnomalies
' PC 20/11/2001 : postitionnement par défaut sur le type d'anomalie
  bdcTypeAnomalie.SetFocus

End Sub

Private Sub Form_Unload(Cancel As Integer)
  SetStatus
  MDISaisieLabo.AjusteMenus -1
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF2 Then
    KeyCode = 0
    btnValider_Click
  ElseIf KeyCode = vbKeyF3 Then
    KeyCode = 0
    btnInitialiser_Click
  End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
' Décodage général des codes barres
  
  Dim sRefEch As String ' référence de l'échantillon

  ' Caractère % d'intro envoyé par le lecteur
  If KeyAscii = &H25 Then   ' &h25 = caractère pourcent %
    txtCB = ""
    txtCB.SetFocus
    KeyAscii = 0
    Exit Sub
  End If
  
  If KeyAscii = 13 And ActiveControl Is txtCB Then
    Select Case UCase(Left(txtCB, 1))
      Case "K"    ' Simulation clavier
        Dim sCmd As String
        sCmd = Subst(Mid(txtCB, 2), "$", "%")   ' %=préfixe Alt dans sendkeys, mais utilisé en préfixe CB…
        On Error Resume Next
        SendKeys sCmd
        On Error GoTo 0
        txtCB = ""
      
      Case "F":   ' FSE
        txtSérieLabo = CLng(Mid(txtCB, 3))
        PersonneDeFSE
        txtCB = ""
        
      Case "U":   ' Utilisateur
        bdcPersSignalé = Mid(txtCB, 2)
        txtCB = ""
      
      Case Else:  ' Ancienne méthode, détection à la longueur
        If Len(txtCB) = 10 And IsNumeric(txtCB) Then
          txtSérieLabo = txtCB
          PersonneDeFSE
          txtCB = ""
          ' PC 21/11/2001 : évolution avec fonction bDecodeCB_FP
'       ElseIf Len(txtCB) = 18 And IsNumeric(txtCB) Then
'          RéférenceFP
'          txtCB = ""
'          txtCB.SetFocus
        ElseIf bDecodeCB_FP(Me.txtCB, sRefEch) Then
          Me.txtCB = ""
          Me.txtRefEch = sRefEch
          Me.bdcTypeAnomalie.SetFocus
        Else
          If Me.txtCB <> "" Then
            MsgBox "Code barre [" & Me.txtCB & "] incorrect !", _
              vbCritical + vbDefaultButton1 + vbOKOnly, App.Title
          End If
          Me.txtCB = "": Me.txtRefEch = ""
        End If
    End Select
    KeyAscii = 0
  End If
End Sub

'===========================================================================
' Evénements des contrôles

Private Sub btnValider_Click()
  ValiderEnregistrement
End Sub

Private Sub btnInitialiser_Click()
  InitialiseChamps
End Sub

Private Sub btnTraiter_Click()
  EnableChampsTraitements True
  If txtDateTraité = "" Then txtDateTraité = BDTime
  bdcPersTraité.SetFocus
End Sub

Private Sub btnModifier_Click()
  ModifierEnregistrement
End Sub

Private Sub lvAnomalies_DblClick()
  ModifierEnregistrement
End Sub

Private Sub btnSupprimer_Click()
  SupprimerEnregistrement
End Sub

Private Sub btnRafraîchir_Click()
  RafraîchitListeAnomalies
End Sub

'===========================================================================
' Aide contextuelle

Private Sub bdcSection_LostFocus()
  bdcSection.Synchronise
End Sub

Private Sub bdcTypeAnomalie_LostFocus()
  bdcTypeAnomalie.Synchronise
End Sub

Private Sub bdcEtat_LostFocus()
  bdcEtat.Synchronise
End Sub

Private Sub bdcPersSignalé_LostFocus()
  bdcPersSignalé.Synchronise
End Sub

Private Sub bdcPersTraité_LostFocus()
  bdcPersTraité.Synchronise
End Sub

' Recherche un code personne à partir d'un n° de FSE
Private Function iPersonneDeFSE() As Integer
  iPersonneDeFSE = -1
  If Len(txtSérieLabo) < 5 Then Exit Function
  If Not IsNumeric(txtSérieLabo) Then Exit Function
  
  Dim iFSE As Long
  iFSE = CLng(txtSérieLabo)
  Dim cSer As New BDCurseur
  cSer.OpenCurseur "select ser_numtech from c_serielabo where ser_numserie=" & iFSE
  If Not cSer.EOF Then
    iPersonneDeFSE = cSer!ser_numtech
  End If
  cSer.CloseCurseur
End Function

Private Sub PersonneDeFSE()
  Dim iPers As Integer
  iPers = iPersonneDeFSE
  If iPers > 0 Then bdcPersSignalé = iPers
End Sub

Private Function bContrôleSélection() As Boolean
  Dim bOk As Boolean
  
  If lvAnomalies.SelectedItem Is Nothing Then
    bOk = False
  Else
    bOk = lvAnomalies.SelectedItem.Selected
  End If
  
  If Not bOk Then MsgBox "Sélectionnez une ligne dans les derniers événements avant de cliquer sur ce bouton.", vbExclamation, App.Title
  bContrôleSélection = bOk
End Function

Private Sub txtCB_GotFocus()
  SetStatus "Scanner un code barre, ou taper le code barre puis [Entrée]"
End Sub

Private Sub txtNumAnomalie_GotFocus()
  SetStatus "N° interne de l'anomalie"
End Sub

Private Sub txtSérieLabo_GotFocus()
  SetStatus "Entrer le numéro de série (n° de FSE)"
  AutoSelect txtSérieLabo
End Sub

Private Sub txtRefEch_GotFocus()
  SetStatus "Entrer la référence échantillon"
  AutoSelect txtRefEch
End Sub

Private Sub bdcSection_GotFocus()
  SetStatus "Section où a été relevée l'anomalie (DE, PSM, …), ou sélectionner dans la liste (F4)"
End Sub

Private Sub bdcPers_GotFocus()
  SetStatus "Entrer le numéro de personne, ou sélectionner dans la liste (F4)"
End Sub

Private Sub txtDateSignalé_GotFocus()
  SetStatus "Date et heure où l'anomalie a été signalée"
  AutoSelect txtDateSignalé
End Sub

Private Sub bdcTypeAnomalie_GotFocus()
  SetStatus "Type codé d'anomalie, ou sélectionner dans la liste (F4)"
End Sub

Private Sub txtTitre_GotFocus()
  SetStatus "Description courte de l'anomalie"
  AutoSelect txtTitre
End Sub

Private Sub txtDescription_GotFocus()
  SetStatus "Description détaillée de l'anomalie"
  AutoSelect txtDescription
End Sub

Private Sub bdcETat_GotFocus()
  SetStatus "Suite à donner à l'anomalie"
End Sub

Private Sub bdcPersTraité_GotFocus()
  SetStatus "Entrer le numéro de personne, ou sélectionner dans la liste (F4)"
End Sub

Private Sub txtDateTraité_GotFocus()
  SetStatus "Date et heure où l'anomalie a été traitée"
  AutoSelect txtDateTraité
End Sub

Private Sub txtDescriptionTraité_GotFocus()
  SetStatus "Description détaillée du traitement"
  AutoSelect txtDescriptionTraité
End Sub

Private Sub lvAnomalies_GotFocus()
  SetStatus "Historique des dernieres anomalies saisies sur ce poste"
End Sub

Private Sub btnModifier_GotFocus()
  SetStatus "Rappeler les données de l'anomalie sélectionnée"
End Sub

Private Sub btnSupprimer_GotFocus()
  SetStatus "Supprimer de la base les données de l'anomalie sélectionnée"
End Sub


Private Sub btnValider_GotFocus()
  SetStatus "Enregistrer les données de l'anomalie"
End Sub

Private Sub btnInitialiser_GotFocus()
  SetStatus "Effacer les informations saisies à l'écran"
End Sub

