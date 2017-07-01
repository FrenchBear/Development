VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmClasseEH 
   Caption         =   "EH"
   ClientHeight    =   6735
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   8385
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   ScaleHeight     =   449
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   559
   Begin VB.PictureBox picSplitter 
      BackColor       =   &H00808080&
      BorderStyle     =   0  'None
      FillColor       =   &H00808080&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   72
      Left            =   60
      ScaleHeight     =   32.658
      ScaleMode       =   0  'User
      ScaleWidth      =   25584
      TabIndex        =   30
      Top             =   4560
      Visible         =   0   'False
      Width           =   2460
   End
   Begin GDOCW.ChampHeure txtHeure 
      Height          =   315
      Left            =   7500
      TabIndex        =   6
      Top             =   420
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   556
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
   Begin VB.TextBox txtObservations 
      Height          =   1380
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   27
      Top             =   5040
      Width           =   8415
   End
   Begin VB.TextBox txtNumScénario 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1560
      Locked          =   -1  'True
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   1500
      Width           =   1200
   End
   Begin VB.TextBox txtNomScénario 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2820
      Locked          =   -1  'True
      TabIndex        =   16
      TabStop         =   0   'False
      Top             =   1500
      Width           =   5535
   End
   Begin VB.TextBox txtNumGrille 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1560
      Locked          =   -1  'True
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   1140
      Width           =   1200
   End
   Begin VB.TextBox txtNomGrille 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2820
      Locked          =   -1  'True
      TabIndex        =   13
      TabStop         =   0   'False
      Top             =   1140
      Width           =   5535
   End
   Begin VB.TextBox txtNumEtb 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1560
      Locked          =   -1  'True
      MaxLength       =   5
      TabIndex        =   8
      TabStop         =   0   'False
      Tag             =   "Entrez le n° d'établissement. F4 pour une recherche."
      Top             =   780
      Width           =   1200
   End
   Begin VB.TextBox txtPréfixe 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2820
      Locked          =   -1  'True
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   780
      Width           =   1005
   End
   Begin VB.TextBox txtNomEtb 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   3900
      Locked          =   -1  'True
      TabIndex        =   10
      TabStop         =   0   'False
      Top             =   780
      Width           =   4455
   End
   Begin VB.TextBox txtDateTour 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1560
      Locked          =   -1  'True
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   420
      Width           =   1200
   End
   Begin VB.TextBox txtNomAssistant 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2820
      Locked          =   -1  'True
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   420
      Width           =   3195
   End
   Begin VB.TextBox txtRéférence 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1560
      Locked          =   -1  'True
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   60
      Width           =   1200
   End
   Begin VB.PictureBox picGrille 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1755
      Left            =   0
      ScaleHeight     =   1695
      ScaleWidth      =   7755
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   2160
      Width           =   7815
      Begin VB.PictureBox picGrilleMobile 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         ClipControls    =   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   1095
         Left            =   240
         ScaleHeight     =   1095
         ScaleWidth      =   6495
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   60
         Width           =   6495
         Begin VB.TextBox txtFormat 
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   0
            Left            =   5640
            MaxLength       =   5
            TabIndex        =   25
            Top             =   0
            Visible         =   0   'False
            Width           =   435
         End
         Begin VB.TextBox txtOptions 
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   0
            Left            =   5160
            MaxLength       =   5
            TabIndex        =   24
            Top             =   0
            Visible         =   0   'False
            Width           =   435
         End
         Begin VB.TextBox txtDécote 
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   0
            Left            =   4680
            MaxLength       =   5
            TabIndex        =   23
            Top             =   0
            Visible         =   0   'False
            Width           =   435
         End
         Begin VB.TextBox txtValeur 
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   0
            Left            =   4260
            MaxLength       =   8
            TabIndex        =   22
            Top             =   0
            Visible         =   0   'False
            Width           =   375
         End
         Begin VB.Label lblObs 
            BackStyle       =   0  'Transparent
            BeginProperty Font 
               Name            =   "Wingdings"
               Size            =   9.75
               Charset         =   2
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Index           =   0
            Left            =   6120
            TabIndex        =   29
            Top             =   0
            Visible         =   0   'False
            Width           =   225
         End
         Begin VB.Shape shpSélection 
            BorderStyle     =   0  'Transparent
            FillColor       =   &H00FF8080&
            FillStyle       =   0  'Solid
            Height          =   315
            Left            =   480
            Top             =   540
            Width           =   1635
         End
         Begin VB.Label lblDécoteScénario 
            BackColor       =   &H00C0FFFF&
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   0
            Left            =   3780
            TabIndex        =   21
            Top             =   0
            Visible         =   0   'False
            Width           =   375
         End
         Begin VB.Label lblLibellé 
            BackColor       =   &H0080C0FF&
            BackStyle       =   0  'Transparent
            Caption         =   "Libellé"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Index           =   0
            Left            =   540
            TabIndex        =   20
            Top             =   0
            Visible         =   0   'False
            Width           =   3165
         End
         Begin VB.Label lblNumLoc 
            BackStyle       =   0  'Transparent
            Caption         =   "NumLoc"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Index           =   0
            Left            =   60
            TabIndex        =   19
            Top             =   0
            Visible         =   0   'False
            Width           =   465
         End
      End
      Begin VB.VScrollBar VSscroll 
         Height          =   1035
         LargeChange     =   1500
         Left            =   7200
         Max             =   1000
         SmallChange     =   150
         TabIndex        =   26
         TabStop         =   0   'False
         Top             =   0
         Width           =   255
      End
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   28
      Top             =   6420
      Width           =   8385
      _ExtentX        =   14790
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
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
   Begin VB.Label lblLégendeCol 
      Alignment       =   2  'Center
      Caption         =   "For mat"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   4
      Left            =   6300
      TabIndex        =   35
      Top             =   1860
      Width           =   600
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblLégendeCol 
      Alignment       =   2  'Center
      Caption         =   "Op tions"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   3
      Left            =   5760
      TabIndex        =   34
      Top             =   1860
      Width           =   600
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblLégendeCol 
      Alignment       =   2  'Center
      Caption         =   "Décote réelle"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   5160
      TabIndex        =   33
      Top             =   1860
      Width           =   600
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblLégendeCol 
      Alignment       =   2  'Center
      Caption         =   "Éval"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   1
      Left            =   4680
      TabIndex        =   32
      Top             =   1860
      Width           =   600
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblLégendeCol 
      Alignment       =   2  'Center
      Caption         =   "Décote scénar"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   4080
      TabIndex        =   31
      Top             =   1860
      Width           =   600
      WordWrap        =   -1  'True
   End
   Begin VB.Image imgSplitter 
      Height          =   150
      Left            =   60
      MousePointer    =   7  'Size N S
      Top             =   4200
      Width           =   2475
   End
   Begin VB.Label lblScénario 
      AutoSize        =   -1  'True
      Caption         =   "Scénario :"
      Height          =   210
      Left            =   60
      TabIndex        =   14
      Top             =   1560
      Width           =   945
   End
   Begin VB.Label lblGrille 
      AutoSize        =   -1  'True
      Caption         =   "Grille :"
      Height          =   210
      Left            =   60
      TabIndex        =   11
      Top             =   1200
      Width           =   600
   End
   Begin VB.Label lblEtablissement 
      AutoSize        =   -1  'True
      Caption         =   "Etablissement :"
      Height          =   210
      Left            =   60
      TabIndex        =   7
      Top             =   840
      Width           =   1470
   End
   Begin VB.Label lblHeure 
      AutoSize        =   -1  'True
      Caption         =   "&Heure :"
      Height          =   210
      Left            =   6660
      TabIndex        =   5
      Top             =   480
      Width           =   705
   End
   Begin VB.Label lblTournéeDu 
      AutoSize        =   -1  'True
      Caption         =   "Tournée du :"
      Height          =   210
      Left            =   60
      TabIndex        =   2
      Top             =   480
      Width           =   1215
   End
   Begin VB.Label lblRéférence 
      AutoSize        =   -1  'True
      Caption         =   "Référence :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   1080
   End
   Begin VB.Menu mnuAudit 
      Caption         =   "&Audit"
      Begin VB.Menu cmdEnregistrer 
         Caption         =   "Enregistrer"
         Shortcut        =   {F2}
      End
      Begin VB.Menu cmdAbandonner 
         Caption         =   "Abandonner"
      End
      Begin VB.Menu sep0 
         Caption         =   "-"
      End
      Begin VB.Menu cmdToutBon 
         Caption         =   "&Tout remplir avec des 1"
         Shortcut        =   +{F9}
      End
      Begin VB.Menu cmdCalculer 
         Caption         =   "&Calculer"
         Shortcut        =   {F9}
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdOptionsVisite 
         Caption         =   "&Options visite…"
         Shortcut        =   {F4}
      End
      Begin VB.Menu cmdOptionsItems 
         Caption         =   "Options items"
         Shortcut        =   +{F4}
      End
   End
   Begin VB.Menu mnuObservations 
      Caption         =   "&Observations"
      Begin VB.Menu cmdObservations 
         Caption         =   "&Observations"
         Shortcut        =   {F3}
      End
      Begin VB.Menu cmdInsertionChamp 
         Caption         =   "&Insertion champ"
         Shortcut        =   {F5}
      End
   End
End
Attribute VB_Name = "frmClasseEH"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmClasseEH
' Feuille d'affichage/saisie des EH
' 05/02/1999 PV


Option Explicit


Private d As Document               ' Document du gestionnaire de documents
Private e As EHDefGrille            ' Structure de la grille active
Private v As EHVisite               ' Données de la visite

Private iIndiceCourant As Integer
Private iColonneCourante As Integer ' 1:txtValeur, 2:txtDécote, 3:txtOptions, 4:txtFormat

Private bOptionsEtFormat As Boolean

' Splitter
Private Const sglSplitLimit = 50    ' Hauteur minimum d'un panneau
Private mbMoving As Boolean         ' Déplacement du splitter en cours
Private iHauteurObs As Integer      ' Hauteur du panneau des observations


' Point d'entrée
Public Sub Visualisation(d0 As Document, e0 As EHDefGrille, v0 As EHVisite)

  HourGlass "show"

  Set d = d0
  Set e = e0
  Set v = v0
  
  AfficheGrille
  AfficheValeurs
  
  Caption = "Visualisation EH"
  
  AutoSelect txtHeure, True
  EffaceSélectionItem
  
  HourGlass "hide"
  Show vbModal
End Sub


' Génère l'affichage de la grille e
Private Sub AfficheGrille()

  txtRéférence = d.pla_lettres & d.pla_iref
  txtDateTour = d.pla_dateplan
  txtNomAssistant = sNomAssistant(d.pla_lettres)
  txtNumEtb = d.pla_etb
  txtPréfixe = d.etb_prefixe
  txtNomEtb = d.etb_nom
  txtNumGrille = e.iNumGrille
  txtNomGrille = e.sTitre1
  txtNomScénario = e.sTitreScénario
  txtNumScénario = e.iNumScénario
  
  txtHeure.HeureSaisie = v.sHeure
  
  Dim i As EHDefItem
  Dim iTop As Integer, iLeft As Integer
  Dim bFB As Boolean, iFS As Integer
  Dim iTabIndex As Integer
  
  iTabIndex = txtValeur(0).TabIndex
  iTop = 10
  For Each i In e.colItems
    Select Case i.iNiveau
      Case 1
        iTop = iTop + 10 * 15
        iLeft = 0
        iFS = 11
        bFB = True
        
      Case 2
        iTop = iTop + 5 * 15
        iLeft = 4 * 15
        iFS = 9
        bFB = True
        
      Case 3
        iLeft = 8 * 15
        iFS = 8
        bFB = False
        
      Case 4
        iLeft = 12 * 15
        iFS = 8
        bFB = False
    End Select
    
    Load lblNumLoc(i.ziIndice)
    With lblNumLoc(i.ziIndice)
      .Move iLeft, iTop
      .Caption = i.sNumloc
      .Visible = True
      .FontBold = bFB
      .FontSize = iFS
      .AutoSize = True
    End With
    
    Load lblLibellé(i.ziIndice)
    With lblLibellé(i.ziIndice)
      If i.iNiveau <= 2 Then
        .Move lblNumLoc(i.ziIndice).Left + lblNumLoc(i.ziIndice).Width + 4 * 15, iTop
      Else
        .Move 44 * 15, iTop
      End If
      .Width = 270 * 15 - .Left
      .Height = lblNumLoc(i.ziIndice).Height
      .Caption = i.sLibellé
      .FontBold = bFB
      .FontSize = iFS
      .Visible = True
    End With
    
    Load lblDécoteScénario(i.ziIndice)
    With lblDécoteScénario(i.ziIndice)
      .Top = iTop
      .Width = 555
      If i.iDécote Then
        .Caption = i.iDécote
      Else
        .Caption = ""
      End If
      .Height = lblNumLoc(i.ziIndice).Height
      .Visible = True
    End With
    
    Load txtValeur(i.ziIndice)
    With txtValeur(i.ziIndice)
      .Top = iTop
      .Width = 555
      .Height = lblNumLoc(i.ziIndice).Height
      .Visible = True
      .Tag = i.iSérie     ' Lien avec les collections
      .TabIndex = iTabIndex
      iTabIndex = iTabIndex + 1
    End With
    
    Load txtDécote(i.ziIndice)
    With txtDécote(i.ziIndice)
      .Top = iTop
      .Width = 555
      .Height = lblNumLoc(i.ziIndice).Height
      .Visible = True
      .TabIndex = iTabIndex
      iTabIndex = iTabIndex + 1
    End With
    
    Load txtOptions(i.ziIndice)
    With txtOptions(i.ziIndice)
      .Top = iTop
      .Width = 555
      .Height = lblNumLoc(i.ziIndice).Height
      .TabIndex = iTabIndex
      iTabIndex = iTabIndex + 1
    End With
    
    Load txtFormat(i.ziIndice)
    With txtFormat(i.ziIndice)
      .Top = iTop
      .Width = 555
      .Height = lblNumLoc(i.ziIndice).Height
      .TabIndex = iTabIndex
      iTabIndex = iTabIndex + 1
    End With
    
    Load lblObs(i.ziIndice)
    With lblObs(i.ziIndice)
      .Top = iTop
      .Height = lblNumLoc(i.ziIndice).Height
      .Visible = True
    End With
    
    iTop = iTop + lblNumLoc(i.ziIndice).Height + 2 * 15
  Next
  
  shpSélection.Left = 0
  shpSélection.ZOrder 1
  picGrilleMobile.Height = iTop
  VSscroll.Max = iTop
End Sub


Private Sub AfficheValeurs()
  txtHeure.HeureSaisie = v.sHeure
  
  Dim iIndice As Integer
  Dim i As EHDefItem
  Dim ev As EHEval
  
  For Each i In e.colItems
    iIndice = i.ziIndice
    Set ev = v.colEval("E" & i.iSérie)
    
    txtValeur(iIndice) = ev.sValeur
    txtDécote(iIndice) = ev.sDécote
    txtOptions(iIndice) = ev.sOptions
    txtFormat(iIndice) = ev.iFormat
    If ev.sObs <> "" Then
      lblObs(iIndice) = "è"
    Else
      lblObs(iIndice) = ""
    End If
    
    CouleurLigne iIndice
  Next
End Sub


Private Sub CouleurLigne(iIndice As Integer)
  Dim iFormat As Integer
  iFormat = Val(txtFormat(iIndice))
  If iFormat = 0 Or iFormat = 6 Or iFormat = 7 Then
    txtValeur(iIndice).BackColor = &HF2F2F2
  Else
    txtValeur(iIndice).BackColor = &HFFFFFF
  End If
  
  Dim sOpt As String
  sOpt = txtOptions(iIndice)
  
  If InStr(sOpt, "D") > 0 Then
    txtDécote(iIndice).BackColor = &HFFFFFF
    txtDécote(iIndice).Locked = False
  Else
    txtDécote(iIndice).BackColor = &HF2F2F2
    txtDécote(iIndice).Locked = True
  End If
  
  With lblLibellé(iIndice)
    If e.colItems("I" & txtValeur(iIndice).Tag).iNiveau <= 2 Or InStr(sOpt, "G") > 0 Then
      .FontBold = True
    Else
      .FontBold = False
    End If
    
    If InStr(sOpt, "S") > 0 Then
      .FontUnderline = True
    Else
      .FontUnderline = False
    End If
    
    If InStr(sOpt, "I") > 0 Then
      .FontItalic = True
    Else
      .FontItalic = False
    End If
    
    If InStr(sOpt, "M") > 0 Then      ' Masqué
      .BackStyle = 1                  ' Opaque
      .BackColor = &HFFFFFF           ' blanc
    ElseIf InStr(sOpt, "O") > 0 Then  ' Ombré
      .BackStyle = 1                  ' Opaque
      .BackColor = &HB0B0B0           ' Gris
    Else
      .BackStyle = 0                  ' Transparent
    End If
  
  End With

End Sub



Private Sub cmdObservations_Click()
  If iIndiceCourant > 0 Then
    If ActiveControl Is txtObservations Then
      Dim bC As Boolean
      txtObservations_Validate bC
      txtValeur(iIndiceCourant).SetFocus
    Else
      txtObservations.SetFocus
    End If
  End If
End Sub


' ===========================================================================
' Options

Private Sub cmdOptionsVisite_Click()
  frmClasseEHOptions.DoEHOptions e, v
End Sub

Private Sub cmdOptionsItems_Click()
  bOptionsEtFormat = Not bOptionsEtFormat
  Form_Resize
  If iIndiceCourant > 0 Then
    If iColonneCourante > 2 And Not bOptionsEtFormat Then iColonneCourante = 1
    Select Case iColonneCourante
      Case 1: txtValeur(iIndiceCourant).SetFocus
      Case 2: txtDécote(iIndiceCourant).SetFocus
      Case 3: txtOptions(iIndiceCourant).SetFocus
      Case 4: txtFormat(iIndiceCourant).SetFocus
    End Select
  End If
End Sub


' Remplit tout ce qui est remplissable avec des 1
Private Sub cmdToutBon_Click()
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, cette commande remplacera toutes les valeurs saisies par des 1. Voulez-vous vontinuer ?", vbQuestion + vbYesNo)
  If iRep = vbNo Then Exit Sub
  
  Dim i As Integer
  For i = 1 To v.colEval.count
    If txtFormat(i) <> "0" And txtFormat(i) <> "6" And txtFormat(i) <> "7" Then
      txtValeur(i) = 1
    End If
  Next
  
  cmdCalculer_Click
End Sub


' ===========================================================================
' Calcul de la feuille

Private Sub cmdCalculer_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub

MsgBox "A implanter"
  ' Tout transmettre au système Unix (ref grille/scénario et valeurs saisies)
  'Dim br As New Rev
  'Bloquer
  '  br.AddField
  '
  ''$$
  
End Sub


' ===========================================================================
' Administration de la feuille

Private Sub Form_Resize()
  If ScaleWidth < 300 Or ScaleHeight < 400 Then Exit Sub
  
  txtNomEtb.Width = ScaleWidth - 262
  txtNomGrille.Width = ScaleWidth - 190
  txtNomScénario.Width = ScaleWidth - 190
  
  picGrilleMobile.Visible = False
  
  If iHauteurObs = 0 Then iHauteurObs = 92
  If ScaleHeight - 155 - iHauteurObs < sglSplitLimit Then
    iHauteurObs = ScaleHeight - 155 - sglSplitLimit
  End If
  
  picGrille.Move 1, 150, ScaleWidth - 2, ScaleHeight - 175 - iHauteurObs
  txtObservations.Move 1, ScaleHeight - iHauteurObs - 22, ScaleWidth - 2, iHauteurObs
  imgSplitter.Move 0, ScaleHeight - iHauteurObs - 27, ScaleWidth, 6
  picGrilleMobile.Width = picGrille.ScaleWidth - VSscroll.Width - 8 * 15
  VSscroll.Move picGrille.ScaleWidth - VSscroll.Width, 0, VSscroll.Width, picGrille.ScaleHeight
  VSscroll_Scroll
  
  Dim cT As Integer, cL As Integer
  Dim i As Integer
  
  If bOptionsEtFormat Then
    cT = picGrilleMobile.ScaleWidth - 120 * 17 - 2 * 600
    cL = ScaleWidth - 163 - 2 * 40
  Else
    cT = picGrilleMobile.ScaleWidth - 120 * 17
    cL = ScaleWidth - 163
  End If
  shpSélection.Width = cT
  
  
  For i = 0 To 4
    lblLégendeCol(i).Move cL + i * 40, 122
  Next
  lblLégendeCol(3).Visible = bOptionsEtFormat
  lblLégendeCol(4).Visible = bOptionsEtFormat
  
  
  For i = 1 To e.colItems.count
    lblLibellé(i).Width = cT - lblLibellé(i).Left - 3 * 15
    lblDécoteScénario(i).Left = cT
    txtValeur(i).Left = cT + 600
    txtDécote(i).Left = cT + 2 * 600
    If bOptionsEtFormat Then
      txtOptions(i).Left = cT + 3 * 600
      txtFormat(i).Left = cT + 4 * 600
      lblObs(i).Left = cT + 5 * 600
    Else
      lblObs(i).Left = cT + 3 * 600
    End If
    txtOptions(i).Visible = bOptionsEtFormat
    txtFormat(i).Visible = bOptionsEtFormat
  Next

  picGrilleMobile.Visible = True
End Sub

Private Sub Form_Paint()
  Line (0, 0)-Step(ScaleWidth, 0), vbButtonShadow
  Line (0, 1)-Step(ScaleWidth, 0), vb3DHighlight
End Sub

Private Sub Form_Load()
  iHauteurObs = 92
  bOptionsEtFormat = False
  
  sbStatus.ZOrder 0       ' sbStatus au 1er plan dans les retaillages "short"
End Sub


Private Sub Form_Unload(Cancel As Integer)
  Set v = Nothing
  Set e = Nothing
  Set d = Nothing
End Sub

' ===========================================================================
' Clics sur les libellés pour se déplacer

Private Sub lblNumLoc_Click(Index As Integer)
  txtValeur(Index).SetFocus
End Sub

Private Sub lblLibellé_Click(Index As Integer)
  txtValeur(Index).SetFocus
End Sub

Private Sub lblDécoteScénario_Click(Index As Integer)
  txtValeur(Index).SetFocus
End Sub

' ===========================================================================

Private Sub EffaceSélectionItem()
  shpSélection.Top = -1000
  iIndiceCourant = -1
  txtObservations = ""
  txtObservations.Locked = True
  txtObservations.BackColor = &H8000000F
End Sub

Private Sub txtHeure_GotFocus()
  AutoSelect txtHeure
  
  ' On efface la sélection d'item
  EffaceSélectionItem
  
  sbStatus.SimpleText = "Entrez l'heure de début de l'audit"
End Sub


Private Sub VSscroll_change()
  VSscroll_Scroll
  
' Smooth scroll
' A protéger des effets de réentrance dus au DoEvents…
' au minimum, ne pas déclencher un autre smoothscroll
'  If -picGrilleMobile.Top > VSscroll.Value Then
'    While -picGrilleMobile.Top > VSscroll.Value
'      picGrilleMobile.Top = picGrilleMobile.Top + 15 * 2
'      DoEvents
'    Wend
'  Else
'    While -picGrilleMobile.Top < VSscroll.Value
'      picGrilleMobile.Top = picGrilleMobile.Top - 15 * 2
'      DoEvents
'    Wend
'  End If
End Sub

Private Sub VSscroll_GotFocus()
  EffaceSélectionItem
End Sub

' Déplacement immédiat sur un scroll pour aller le + vite possible
Private Sub VSscroll_Scroll()
  picGrilleMobile.Move 4 * 15, -VSscroll.Value, picGrille.ScaleWidth - VSscroll.Width - 8 * 15
End Sub

Private Sub SélectionEtScroll(Index As Integer)
  shpSélection.Top = txtValeur(Index).Top
  shpSélection.Height = txtValeur(Index).Height
  
  iIndiceCourant = Index
  
  Dim iNouveauTop As Integer
  If txtValeur(Index).Top < -picGrilleMobile.Top Then
    iNouveauTop = txtValeur(Index).Top - picGrille.ScaleHeight / 2
    If iNouveauTop < 0 Then iNouveauTop = 0
    VSscroll.Value = iNouveauTop
  ElseIf txtValeur(Index).Top + picGrilleMobile.Top > picGrille.ScaleHeight - 20 * 15 Then
    iNouveauTop = txtValeur(Index).Top - picGrille.ScaleHeight / 2
    If iNouveauTop < 0 Then iNouveauTop = 0
    VSscroll.Value = iNouveauTop
  End If

  txtObservations = v.colEval("E" & txtValeur(Index).Tag).sObs
End Sub


Private Sub txtValeur_GotFocus(Index As Integer)
  iColonneCourante = 1
  SélectionEtScroll Index
  AutoSelect txtValeur(Index), True
  
  Dim sMsg As String
  Select Case txtFormat(Index)
    Case "0": sMsg = "Format 0: Pas de saisie autorisée !"
              txtValeur(Index).Locked = True
    Case "6": sMsg = "Format 6: Transcodage McDo spécial à l'édition, pas de saisie"
              txtValeur(Index).Locked = True
    Case "7": sMsg = "Format 7: Item de type histogramme, pas de saisie"
              txtValeur(Index).Locked = True
    Case Else:
      txtValeur(Index).Locked = False
      If v.iFormat = 6 Then
        sMsg = "1:Réalisé (o/Blanc) 2:Fixé (X/hachuré) 3:Non réalisé, Fixé à nouveau (XXX/Noir)"
      Else
        sMsg = "Format " & txtFormat(Index) & ": 0:Non évalué  1:o  "
        If txtFormat(Index) <> 3 Then sMsg = sMsg & "2:X  "
        sMsg = sMsg & "3:XXX  "
        If txtFormat(Index) = 5 Or InStr(v.sOptions, "S") > 0 Then
          sMsg = sMsg & "4:*  5:***  "
        End If
        sMsg = sMsg & "6:S/O"
      End If
  End Select
  sbStatus.SimpleText = sMsg
  
  ActiveObs
End Sub


Private Sub txtValeur_Validate(Index As Integer, Cancel As Boolean)
  If txtValeur(Index).Locked Then Exit Sub
  If txtValeur(Index) = "" Then Exit Sub    ' Toujours bon
  
  Select Case txtFormat(Index)
    Case 0, 6, 7:  ' Pas de saisie autorisée
      ' Pas de contrôle
    
    Case 1, 4, 5: '0 à 6 autorisé
      If Not IsNumeric(txtValeur(Index)) Then
        txtValeur(Index) = ""
      Else
        If txtValeur(Index) < 0 Or txtValeur(Index) > 6 Or txtValeur(Index) <> Int(txtValeur(Index)) Then txtValeur(Index) = ""
      End If
    
    Case 2: ' Saisie libre
      ' Maxlength à 8 fait le contrôle
      
    Case 3: ' comme le 1, mais sans la valeur 2 (remplacée par 3)
      If Not IsNumeric(txtValeur(Index)) Then
        txtValeur(Index) = ""
      Else
        If txtValeur(Index) = 2 Then
          txtValeur(Index) = "3"
        Else
          If txtValeur(Index) < 0 Or txtValeur(Index) > 6 Or txtValeur(Index) <> Int(txtValeur(Index)) Then txtValeur(Index) = ""
        End If
      End If
    
    Case Else
      Stop
      
  End Select
End Sub




Private Sub txtDécote_GotFocus(Index As Integer)
  iColonneCourante = 2
  SélectionEtScroll Index
  AutoSelect txtDécote(Index), True
  sbStatus.SimpleText = "Décote"
  ActiveObs
End Sub


Private Sub txtOptions_GotFocus(Index As Integer)
  iColonneCourante = 3
  SélectionEtScroll Index
  AutoSelect txtOptions(Index), True
  sbStatus.SimpleText = "Options"
  ActiveObs
End Sub


Private Sub txtOptions_Change(Index As Integer)
  Dim sOpt As String
  
  ' Conversion des options en majuscules
  sOpt = txtOptions(Index)
  If bToMaj(txtOptions(Index)) Then Exit Sub    ' Le passage en majuscules reprovoque un événement txtOptions_Change
  
  ' Elimination des options en double
  Dim i As Integer, j As Integer
  Dim bDoublon As Boolean
  i = 1
  bDoublon = False
  Do While i <= Len(sOpt)
    j = i + 1
    Do While j <= Len(sOpt)
      If Mid(sOpt, j, 1) = Mid(sOpt, i, 1) Then
        sOpt = Left(sOpt, j - 1) & Mid(sOpt, j + 1)
        bDoublon = True
      Else
        j = j + 1
      End If
    Loop
    i = i + 1
  Loop
  If bDoublon Then
    Dim iSS As Integer
    iSS = txtOptions(Index).SelStart
    txtOptions(Index) = sOpt             ' Reprovoque un événement txtOptions_Change
    txtOptions(Index).SelStart = iSS
    Exit Sub
  End If
  
  CouleurLigne Index
End Sub


Private Sub txtFormat_GotFocus(Index As Integer)
  iColonneCourante = 4
  SélectionEtScroll Index
  AutoSelect txtFormat(Index), True
  sbStatus.SimpleText = "Format"
  ActiveObs
End Sub

Private Sub lblObs_Click(Index As Integer)
  iColonneCourante = 1
  SélectionEtScroll Index
  ActiveObs
  txtObservations.SetFocus
  txtObservations.SelStart = 32000
End Sub


Private Sub ActiveObs()
  txtObservations.Locked = False
  txtObservations.BackColor = &H80000005
End Sub



Private Sub DéplacementClavier(Index As Integer, KeyCode As Integer, iColonne)
  Dim iNextIndex
  Select Case KeyCode
    Case vbKeyDown:     iNextIndex = Index + 1
    Case vbKeyReturn:   iNextIndex = Index + 1
    Case vbKeyUp:       iNextIndex = Index - 1
    Case vbKeyPageDown: iNextIndex = Index + 10
    Case vbKeyPageUp:   iNextIndex = Index - 10
  End Select
  If Not IsEmpty(iNextIndex) Then
    If iNextIndex < 1 Then iNextIndex = 1
    If iNextIndex >= lblLibellé.count Then iNextIndex = lblLibellé.count - 1
    Select Case iColonne
      Case 1: txtValeur(iNextIndex).SetFocus
      Case 2: txtDécote(iNextIndex).SetFocus
      Case 3: txtOptions(iNextIndex).SetFocus
      Case 4: txtFormat(iNextIndex).SetFocus
    End Select
  End If
End Sub


' Déplacement avec les flèches, PgUp, PgDn
Private Sub txtValeur_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  DéplacementClavier Index, KeyCode, 1
End Sub

Private Sub txtValeur_KeyPress(Index As Integer, KeyAscii As Integer)
  If KeyAscii = 13 Then KeyAscii = 0
End Sub


Private Sub txtDécote_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  DéplacementClavier Index, KeyCode, 2
End Sub

Private Sub txtDécote_KeyPress(Index As Integer, KeyAscii As Integer)
  If KeyAscii = 13 Then KeyAscii = 0
End Sub


Private Sub txtOptions_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  DéplacementClavier Index, KeyCode, 3
End Sub

Private Sub txtOptions_KeyPress(Index As Integer, KeyAscii As Integer)
  If KeyAscii = 13 Then KeyAscii = 0
End Sub


Private Sub txtFormat_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  DéplacementClavier Index, KeyCode, 4
End Sub

Private Sub txtFormat_KeyPress(Index As Integer, KeyAscii As Integer)
  If KeyAscii = 13 Then KeyAscii = 0
End Sub



' ===========================================================================
' Observations

Private Sub cmdInsertionChamp_Click()
  If txtObservations Is ActiveControl Then
    txtObservations.SelText = "{}"
    txtObservations.SelStart = txtObservations.SelStart - 1
  End If
End Sub


Private Sub txtObservations_Validate(Cancel As Boolean)
  ' On peut donner le focus à un champ locked avec la souris…
  If txtObservations.Locked Then Exit Sub
  
  Dim sObs As String
  sObs = RTrimCrLf(txtObservations)
  
  Assert iIndiceCourant > 0
  v.colEval("E" & txtValeur(iIndiceCourant).Tag).sObs = sObs
  If sObs <> "" Then
    lblObs(iIndiceCourant) = "è"
  Else
    lblObs(iIndiceCourant) = ""
  End If
End Sub

Private Sub txtObservations_GotFocus()
  sbStatus.SimpleText = "Commentaires associés à l'item sélectionné"
  txtObservations.SelStart = 32000
End Sub



' ===============================================================================
' Gestion du splitter

Private Sub imgSplitter_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  With imgSplitter
    picSplitter.Move .Left, .Top, ScaleWidth, 4
  End With
  picSplitter.Visible = True
  'picSplitter.ZOrder 0
  mbMoving = True
End Sub


Private Sub imgSplitter_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Dim sglPos As Single

  If mbMoving Then
      sglPos = Y / Screen.TwipsPerPixelY + imgSplitter.Top
      If sglPos < sglSplitLimit + picGrille.Top Then
          picSplitter.Top = picGrille.Top + sglSplitLimit
      ElseIf sglPos > Me.ScaleHeight - sglSplitLimit Then
          picSplitter.Top = Me.ScaleHeight - sglSplitLimit
      Else
          picSplitter.Top = sglPos
      End If
  End If
End Sub


Private Sub imgSplitter_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  picSplitter.Visible = False
  mbMoving = False
  
  iHauteurObs = ScaleHeight - picSplitter.Top - 26
  Form_Resize
End Sub

' ===============================================================================

