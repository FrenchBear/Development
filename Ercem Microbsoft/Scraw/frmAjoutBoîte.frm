VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmAjoutBoîte 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Ajout/Modification d'une boîte"
   ClientHeight    =   7050
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7545
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAjoutBoîte.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7050
   ScaleWidth      =   7545
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraInfosInternes 
      Caption         =   "Infos internes (pour le service informatique)"
      Height          =   1395
      Left            =   60
      TabIndex        =   38
      Top             =   5280
      Width           =   7395
      Begin VB.TextBox txtDénombrement 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   3960
         Locked          =   -1  'True
         TabIndex        =   47
         TabStop         =   0   'False
         Top             =   960
         Width           =   2775
      End
      Begin VB.TextBox txtOperLecture 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   3960
         Locked          =   -1  'True
         TabIndex        =   45
         TabStop         =   0   'False
         Top             =   600
         Width           =   615
      End
      Begin VB.TextBox txtTSLecture 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   3960
         Locked          =   -1  'True
         TabIndex        =   43
         TabStop         =   0   'False
         Top             =   240
         Width           =   2775
      End
      Begin VB.TextBox txtIdBoîte 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1800
         Locked          =   -1  'True
         TabIndex        =   41
         TabStop         =   0   'False
         Top             =   600
         Width           =   315
      End
      Begin VB.TextBox txtEtatBoîte 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1800
         Locked          =   -1  'True
         TabIndex        =   39
         TabStop         =   0   'False
         Top             =   240
         Width           =   315
      End
      Begin VB.Label lblDénombrement 
         AutoSize        =   -1  'True
         Caption         =   "Dénombrement :"
         Height          =   210
         Left            =   2280
         TabIndex        =   48
         Top             =   1020
         Width           =   1590
      End
      Begin VB.Label lblOperLecture 
         AutoSize        =   -1  'True
         Caption         =   "Oper lecture :"
         Height          =   210
         Left            =   2280
         TabIndex        =   46
         Top             =   660
         Width           =   1305
      End
      Begin VB.Label lblTSLecture 
         AutoSize        =   -1  'True
         Caption         =   "TS Lecture :"
         Height          =   210
         Left            =   2280
         TabIndex        =   44
         Top             =   300
         Width           =   1125
      End
      Begin VB.Label lblIdBoîte 
         AutoSize        =   -1  'True
         Caption         =   "Id boîte :"
         Height          =   210
         Left            =   120
         TabIndex        =   42
         Top             =   660
         Width           =   870
      End
      Begin VB.Label lblEtatBoîte 
         AutoSize        =   -1  'True
         Caption         =   "État boîte :"
         Height          =   210
         Left            =   120
         TabIndex        =   40
         Top             =   300
         Width           =   1065
      End
   End
   Begin VB.ComboBox cboTypeMarquage 
      Height          =   330
      ItemData        =   "frmAjoutBoîte.frx":0442
      Left            =   2340
      List            =   "frmAjoutBoîte.frx":044F
      Style           =   2  'Dropdown List
      TabIndex        =   26
      Top             =   4200
      Width           =   5115
   End
   Begin VB.ComboBox cboTypeBoîte 
      Height          =   330
      ItemData        =   "frmAjoutBoîte.frx":04A9
      Left            =   2340
      List            =   "frmAjoutBoîte.frx":04BC
      Style           =   2  'Dropdown List
      TabIndex        =   29
      Top             =   4560
      Width           =   5115
   End
   Begin VB.Frame fraGerme 
      Caption         =   "Germe"
      Height          =   1035
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   5955
      Begin VB.TextBox txtLibelléMéthode 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   2160
         Locked          =   -1  'True
         TabIndex        =   36
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   600
         Width           =   3675
      End
      Begin VB.TextBox txtGerme 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1800
         Locked          =   -1  'True
         MaxLength       =   10
         TabIndex        =   2
         TabStop         =   0   'False
         Tag             =   "Entrez la dilution: 0, -1, …, 1 pour l'échantillon pur."
         Top             =   240
         Width           =   1335
      End
      Begin VB.TextBox txtMéthode 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1800
         Locked          =   -1  'True
         MaxLength       =   10
         TabIndex        =   4
         TabStop         =   0   'False
         Tag             =   "Entrez la dilution: 0, -1, …, 1 pour l'échantillon pur."
         Top             =   600
         Width           =   315
      End
      Begin VB.Label lblGerme 
         AutoSize        =   -1  'True
         Caption         =   "Germe :"
         Height          =   210
         Left            =   120
         TabIndex        =   1
         Top             =   300
         Width           =   750
      End
      Begin VB.Label lblMéthode 
         AutoSize        =   -1  'True
         Caption         =   "Méthode :"
         Height          =   210
         Left            =   120
         TabIndex        =   3
         Top             =   660
         Width           =   960
      End
   End
   Begin VB.TextBox txtTypeBoîte 
      Height          =   315
      Left            =   1860
      MaxLength       =   10
      TabIndex        =   28
      Tag             =   "Définissez la manière dont l'automate IDEC déposera la gélose dans la boîte."
      Top             =   4560
      Width           =   435
   End
   Begin VB.Frame fraMilieu 
      Caption         =   "Milieu"
      Height          =   1455
      Left            =   60
      TabIndex        =   5
      Top             =   1200
      Width           =   5955
      Begin VB.TextBox txtMilTypeBoîte 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   4500
         Locked          =   -1  'True
         MaxLength       =   10
         TabIndex        =   12
         TabStop         =   0   'False
         Tag             =   "Entrez la dilution: 0, -1, …, 1 pour l'échantillon pur."
         Top             =   660
         Width           =   1335
      End
      Begin VB.TextBox txtMilTypeMarquage 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1800
         Locked          =   -1  'True
         MaxLength       =   10
         TabIndex        =   10
         TabStop         =   0   'False
         Tag             =   "Entrez la dilution: 0, -1, …, 1 pour l'échantillon pur."
         Top             =   1020
         Width           =   1335
      End
      Begin VB.TextBox txtMilAbrégé 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1800
         Locked          =   -1  'True
         MaxLength       =   10
         TabIndex        =   8
         TabStop         =   0   'False
         Tag             =   "Entrez la dilution: 0, -1, …, 1 pour l'échantillon pur."
         Top             =   660
         Width           =   1335
      End
      Begin VB.ComboBox cboMilieu 
         Height          =   330
         Left            =   120
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Tag             =   "Choisissez le milieu de culture à utiliser, F4 ouvre la liste."
         Top             =   240
         Width           =   5715
      End
      Begin VB.Label lblTypeBoîte1 
         AutoSize        =   -1  'True
         Caption         =   "Type boîte :"
         Height          =   210
         Left            =   3240
         TabIndex        =   11
         Top             =   720
         Width           =   1125
      End
      Begin VB.Label lblTypeMarquage1 
         AutoSize        =   -1  'True
         Caption         =   "Type marquage"
         Height          =   210
         Left            =   120
         TabIndex        =   9
         Top             =   1080
         Width           =   1470
      End
      Begin VB.Label lblAbrégé 
         AutoSize        =   -1  'True
         Caption         =   "Abrégé"
         Height          =   210
         Left            =   120
         TabIndex        =   7
         Top             =   720
         Width           =   675
      End
   End
   Begin VB.TextBox txtTypeMarquage 
      Height          =   315
      Left            =   1860
      MaxLength       =   10
      TabIndex        =   25
      Tag             =   "Entrez le type de boîte sur laquelle la machine SANTI dépose l'étiquette."
      Top             =   4200
      Width           =   435
   End
   Begin VB.TextBox txtLégende 
      Height          =   315
      Left            =   1860
      MaxLength       =   10
      TabIndex        =   31
      Tag             =   "Entrez la légende à imprimer sur la boîte."
      Top             =   4920
      Width           =   1335
   End
   Begin VB.TextBox txtNumBoîte 
      Height          =   315
      Left            =   1860
      MaxLength       =   10
      TabIndex        =   22
      Tag             =   "Permet de produire plusieurs boîtes pour une même dilution."
      Top             =   3840
      Width           =   1335
   End
   Begin VB.TextBox txtFacteur 
      Height          =   315
      Left            =   1860
      MaxLength       =   10
      TabIndex        =   20
      Tag             =   "Entrez le facteur multiplicateur pour exprimer le résultat."
      Top             =   3480
      Width           =   1335
   End
   Begin VB.TextBox txtQuantité 
      Height          =   315
      Left            =   1860
      MaxLength       =   10
      TabIndex        =   17
      Tag             =   "Entrez la quantité à déposer sur la boîte en 1/10è de ml."
      Top             =   3120
      Width           =   1335
   End
   Begin VB.TextBox txtDilution 
      Height          =   315
      Left            =   1860
      MaxLength       =   10
      TabIndex        =   14
      Tag             =   "Entrez la dilution: 0, -1, …, 1 pour l'échantillon pur."
      Top             =   2760
      Width           =   1335
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   6120
      TabIndex        =   33
      Tag             =   "Valide l'opération."
      Top             =   60
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   6120
      TabIndex        =   34
      Tag             =   "Annule l'opération."
      Top             =   420
      Width           =   1350
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   6120
      TabIndex        =   35
      Tag             =   "Affiche l'aide sur cette boîte de dialogue."
      Top             =   840
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   32
      Top             =   6735
      Width           =   7545
      _ExtentX        =   13309
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
   Begin VB.Label lblFacteur2 
      AutoSize        =   -1  'True
      Caption         =   "(10*10^-dil)/qté si résultats /g"
      Height          =   210
      Left            =   3300
      TabIndex        =   37
      Top             =   3540
      Width           =   2940
   End
   Begin VB.Label lblNumBoîte2 
      AutoSize        =   -1  'True
      Caption         =   "Pour distinguer les boîtes de même dilution"
      Height          =   210
      Left            =   3300
      TabIndex        =   23
      Top             =   3900
      Width           =   4095
   End
   Begin VB.Label lblDilution2 
      AutoSize        =   -1  'True
      Caption         =   "-1 (sol. mère), -2, -3, …, 0 (échantillon pur)"
      Height          =   210
      Left            =   3300
      TabIndex        =   15
      Top             =   2820
      Width           =   4020
   End
   Begin VB.Label lblTypeboîte2 
      AutoSize        =   -1  'True
      Caption         =   "Type boîte :"
      Height          =   210
      Left            =   180
      TabIndex        =   27
      Top             =   4620
      Width           =   1125
   End
   Begin VB.Label lblQuantité2 
      AutoSize        =   -1  'True
      Caption         =   "1/10è ml"
      Height          =   210
      Left            =   3300
      TabIndex        =   18
      Top             =   3180
      Width           =   825
   End
   Begin VB.Label lblLégende 
      AutoSize        =   -1  'True
      Caption         =   "Légende :"
      Height          =   210
      Left            =   180
      TabIndex        =   30
      Top             =   4980
      Width           =   960
   End
   Begin VB.Label lblTypeMarquage2 
      AutoSize        =   -1  'True
      Caption         =   "Type marquage :"
      Height          =   210
      Left            =   180
      TabIndex        =   24
      Top             =   4260
      Width           =   1605
   End
   Begin VB.Label lblNumBoîte1 
      AutoSize        =   -1  'True
      Caption         =   "N° de boîte :"
      Height          =   210
      Left            =   180
      TabIndex        =   21
      Top             =   3900
      Width           =   1215
   End
   Begin VB.Label lblFacteur1 
      AutoSize        =   -1  'True
      Caption         =   "Facteur :"
      Height          =   210
      Left            =   180
      TabIndex        =   19
      Top             =   3540
      Width           =   840
   End
   Begin VB.Label lblQuantité1 
      AutoSize        =   -1  'True
      Caption         =   "Quantité :"
      Height          =   210
      Left            =   180
      TabIndex        =   16
      Top             =   3180
      Width           =   960
   End
   Begin VB.Label lblDilution1 
      AutoSize        =   -1  'True
      Caption         =   "Dilution :"
      Height          =   210
      Left            =   180
      TabIndex        =   13
      Top             =   2820
      Width           =   840
   End
End
Attribute VB_Name = "frmAjoutBoîte"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille d'ajout et de modification de boîte"
' frmAjoutBoîte
' Feuille d'ajout et de modification de boîte
' Module "propre" sans problèmes de ré-entrance
'  7/09/97 PV
'  2/02/98 PV Contrôles de bornes pour facteur, dilution, quantité
' 14/05/98 PV Sablier pendant le chargement
' 27/01/1999 NC Internationalisation
' 05/04/2000 FG Correction calculeFacteur suite modif dilutions au 03/04/00

Option Explicit

' Résultat
Private b As Boîte

' Germe modifié, rang de la boîte modifiée
Private g0 As GermeRecherché
Private i0 As Integer


' Point d'entrée pour un ajout
Public Function Ajout(ByVal iMilieuDéfaut As Integer, g As GermeRecherché) As Boîte
  Screen.MousePointer = vbHourglass
  Load Me
  
  txtGerme = g.iGerme & ": " & g.sAbrégéLabo
  txtMéthode = g.sMéthode
  txtLibelléMéthode = sLibelléMéthode(g.iGerme, g.sMéthode)
  
  txtDilution = ""
  txtQuantité = ""
  txtFacteur = ""
  txtNumBoîte = "0"
  txtTypeBoîte = ""
  txtTypeMarquage = ""
  txtLégende = ""
  
  txtEtatBoîte = ""
  txtIdBoîte = ""
  txtTSLecture = ""
  txtOperLecture = ""
  txtDénombrement = ""
  
  
  ' Milieu par défaut
  Dim i As Integer
  For i = 0 To cboMilieu.ListCount - 1
    If Val(cboMilieu.List(i)) = iMilieuDéfaut Then
      cboMilieu.ListIndex = i
      Exit For
    End If
  Next
      
  Caption = sGetIntlLib("CR324", "Ajout d'une boîte")
  Set b = Nothing
  Screen.MousePointer = vbDefault
  Set g0 = g
  i0 = -1
  Me.Show 1
  Set g0 = Nothing
  Set Ajout = b
End Function


' Point d'entrée pour une modification
Public Function Modifie(b0 As Boîte, g As GermeRecherché, ib As Integer) As Boîte
  Load Me
  
  txtGerme = g.iGerme & ": " & g.sAbrégéLabo
  txtMéthode = g.sMéthode
  txtLibelléMéthode = sLibelléMéthode(g.iGerme, g.sMéthode)
  
  txtDilution = b0.boi_dilution
  txtQuantité = NV(b0.boi_quantite)
  txtFacteur = b0.boi_facteur
  txtNumBoîte = b0.boi_numboite
  txtTypeBoîte = b0.boi_typeboite
  txtTypeMarquage = b0.boi_typemarquage
  txtLégende = b0.boi_legende
  
  txtEtatBoîte = b0.boi_etatboite
  txtIdBoîte = b0.boi_idboite
  txtTSLecture = NV(b0.boi_tslecture)
  txtOperLecture = NV(b0.boi_operlecture)
  txtDénombrement = NV(b0.boi_denombrement)
  
  
  ' Milieu par défaut
  Dim i As Integer
  For i = 0 To cboMilieu.ListCount - 1
    If Val(cboMilieu.List(i)) = b0.boi_milieu Then
      cboMilieu.ListIndex = i
      Exit For
    End If
  Next
      
  Caption = sGetIntlLib("CR325", "Modification d'une boîte")
  Set b = Nothing
  Set g0 = g
  i0 = ib
  Me.Show 1
  Set g0 = Nothing
  Set Modifie = b
End Function


' ===================================================
' Boutons

Private Sub btnAide_Click()
  Aide "frmajbte"
End Sub


Private Sub btnAnnuler_Click()
  Hide
End Sub

Private Sub btnOK_Click()
  If cboMilieu.ListIndex < 0 Then
    MsgBox2i "CR250"
    'MsgBox "Choisissez un milieu !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  If Not IsNumeric(txtDilution) Then
    MsgBox2i "CO003", txtDilution
    txtDilution.SetFocus
    Exit Sub
  End If
  If CInt(txtDilution) < -9 Or CInt(txtDilution) > 1 Then
    MsgBox2i "CR252"
    'MsgBox "Le champ dilution doit être compris entre 1 et -9 !", vbExclamation, sNomApp
    Exit Sub
  End If

  
  If txtQuantité <> "" Then
    If Not IsNumeric(txtQuantité) Then
      MsgBox2i "CO003", txtQuantité
      txtQuantité.SetFocus
      Exit Sub
    End If
    If CLng(txtQuantité) < 1 Or CLng(txtQuantité) > 60 Then
      MsgBox2i "CR254"
      'MsgBox "Le champ quantité doit être compris entre 1 (0,1 ml) et 60 (6 ml)", vbExclamation, sNomApp
      Exit Sub
    End If
  End If
  
  If Not IsNumeric(txtFacteur) Then
    MsgBox2i "CO003", txtFacteur
    txtFacteur.SetFocus
    Exit Sub
  End If
  If CLng(txtFacteur) < 1 Then
    MsgBox2i "CR256"
    'MsgBox "Le champ facteur doit être supérieur ou égal à 1 !", vbExclamation, sNomApp
    Exit Sub
  End If

  If Not IsNumeric(txtNumBoîte) Then
    MsgBox2i "CO003", txtNumBoîte
    txtNumBoîte.SetFocus
    Exit Sub
  End If
  If Not IsNumeric(txtTypeMarquage) Then
    MsgBox2i "CO003", txtTypeMarquage
    txtTypeMarquage.SetFocus
    Exit Sub
  End If
  If Not IsNumeric(txtTypeBoîte) Then
    MsgBox2i "CO003", txtTypeBoîte
    txtTypeBoîte.SetFocus
    Exit Sub
  End If
  
  
  Set b = New Boîte
  b.boi_milieu = Val(cboMilieu.Text)
  b.boi_dilution = VN(txtDilution)
  b.boi_quantite = VN(txtQuantité)
  b.boi_facteur = VN(txtFacteur)
  b.boi_numboite = txtNumBoîte
  b.boi_typemarquage = txtTypeMarquage
  b.boi_typeboite = txtTypeBoîte
  b.boi_legende = txtLégende

  
  ' On vérifie que la boîte n'existe pas déjà
  Dim bt As Boîte, i As Integer
  For i = 1 To g0.cBoîtes.Count
    If i <> i0 Then
      Set bt = g0.cBoîtes(i)
      If bt.boi_milieu = b.boi_milieu And bt.boi_dilution = b.boi_dilution And bt.boi_numboite = b.boi_numboite Then
        MsgBox2i "CR255", b.boi_milieu, LireMilieu(b.boi_milieu).mil_abrege, b.boi_dilution, b.boi_numboite
        'MsgBox "La boîte milieu " & b.boi_milieu & ": " & LireMilieu(b.boi_milieu).mil_abrege & ", dilution " & b.boi_dilution & ", n° " & b.boi_numboite & _
          " est déjà présente dans la liste des boîtes.", vbExclamation, sNomApp
        Exit Sub
      End If
    End If
  Next

  Hide
End Sub


Private Sub cboMilieu_Click()
  If cboMilieu.ListIndex = -1 Then Exit Sub
  
  Dim m As Milieu
  Set m = LireMilieu(Val(cboMilieu))
  txtMilAbrégé = m.mil_abrege
  txtMilTypeMarquage = m.mil_typemarquage
  txtMilTypeBoîte = m.mil_typeboite
  
  txtTypeMarquage = m.mil_typemarquage
  txtTypeBoîte = m.mil_typeboite
End Sub

' ===================================================

Private Sub CalculeFacteur()
  ' txtQuantité est dans un facteur de 10
  ' Changement mécanisme de calcul suite mise en place nouvelles dilutions au 03/04/00
  If IsNumeric(txtDilution) And IsNumeric(txtQuantité) Then
    If txtDilution <= 1 And txtDilution >= -6 And txtQuantité >= 1 And txtQuantité < 100 Then
      lblFacteur2 = Int((10 * 10 ^ -txtDilution) / txtQuantité) & " si résultats /g"
    Else
      lblFacteur2 = "Dilution ou quantité incorrecte !"
    End If
  Else
    lblFacteur2 = "(10*10^-dil)/qté si résultats /g"
  End If
End Sub

Private Sub Form_Activate()
  txtDilution.SetFocus
End Sub

Private Sub Label2_Click()

End Sub

Private Sub lblNdeboîte1_Click()

End Sub




Private Sub txtDilution_Change()
  CalculeFacteur
End Sub

Private Sub txtQuantité_Change()
  CalculeFacteur
End Sub

' ===================================================
' Type de marquage
' Couple champ texte/combo, évitant le bouclage

Private Sub txtTypeMarquage_Change()
  Dim iIndex As Integer
  iIndex = -1
  
  If IsNumeric(txtTypeMarquage) Then
    Dim i As Integer
    For i = 0 To cboTypeMarquage.ListCount - 1
      If Val(cboTypeMarquage.List(i)) = txtTypeMarquage Then
        iIndex = i
        Exit For
      End If
    Next
  End If
  
  cboTypeMarquage.ListIndex = iIndex
End Sub

Private Sub cboTypeMarquage_Click()
  If cboTypeMarquage.ListIndex <> -1 Then
    If txtTypeMarquage = "" Then
      txtTypeMarquage = Val(cboTypeMarquage)
    ElseIf txtTypeMarquage <> Val(cboTypeMarquage) Then
      txtTypeMarquage = Val(cboTypeMarquage)
    End If
  End If
End Sub


' ===================================================
' Type de boîte
' Couple champ texte/combo, évitant le bouclage

Private Sub txtTypeBoîte_Change()
  Dim iIndex As Integer
  iIndex = -1
  
  If IsNumeric(txtTypeBoîte) Then
    Dim i As Integer
    For i = 0 To cboTypeBoîte.ListCount - 1
      If Val(cboTypeBoîte.List(i)) = txtTypeBoîte Then
        iIndex = i
        Exit For
      End If
    Next
  End If
  
  cboTypeBoîte.ListIndex = iIndex
End Sub

Private Sub cboTypeBoîte_Click()
  If cboTypeBoîte.ListIndex <> -1 Then
    If txtTypeBoîte = "" Then
      txtTypeBoîte = Val(cboTypeBoîte)
    ElseIf txtTypeBoîte <> Val(cboTypeBoîte) Then
      txtTypeBoîte = Val(cboTypeBoîte)
    End If
  End If
End Sub


' ===================================================
' Feuille

Private Sub Form_Load()
  Internationalisation
  
  ' Chargement de la liste des milieux si nécessaire
  If cboMilieu.ListCount = 0 Then
    Dim m As Milieu
    For Each m In CollectionMilieux
      cboMilieu.AddItem Right(Str(m.mil_indice), 2) & ": " & m.mil_libelle & " (" & m.mil_abrege & ")"
    Next
  End If
End Sub


' ===================================================
' Focus

Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  If TypeOf ActiveControl Is TextBox Then
    ActiveControl.SelStart = 0
    ActiveControl.SelLength = 99
  End If
End Sub

Private Sub cboMilieu_GotFocus(): GotFocus: End Sub

Private Sub txtDilution_GotFocus(): GotFocus: End Sub
Private Sub txtQuantité_GotFocus(): GotFocus: End Sub
Private Sub txtFacteur_GotFocus(): GotFocus: End Sub
Private Sub txtNumBoîte_GotFocus(): GotFocus: End Sub
Private Sub txtTypeMarquage_GotFocus(): GotFocus: End Sub
Private Sub txtTypeBoîte_GotFocus(): GotFocus: End Sub
Private Sub txtLégende_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub



' ============================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "ABCaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  SetLib fraGerme, "Caption", "ABfraGerme"
  SetLib lblGerme, "Caption", "ABlblGerme"
  SetLib txtGerme, "Tag", "ABtxtGerme.tag"
  SetLib lblMéthode, "Caption", "ABlblMéthode"
  SetLib txtMéthode, "Tag", "ABtxtMéthode.tag"
  SetLib fraMilieu, "Caption", "ABfraMilieu"
  SetLib cboMilieu, "Tag", "ABcboMilieu.tag"
  SetLib lblAbrégé, "Caption", "ABlblAbrégé"
  SetLib txtMilAbrégé, "Tag", "ABtxtMilAbrégé.tag"
  SetLib lblTypeMarquage1, "Caption", "ABlblTypeMarquage1"
  SetLib txtMilTypeMarquage, "Tag", "ABtxtMilTypeMarq.tag"
  SetLib lblTypeBoîte1, "Caption", "ABlblTypeBoîte1"
  SetLib txtMilTypeBoîte, "Tag", "ABtxtMilTypBoîte.tag"
  SetLib lblDilution1, "Caption", "ABlblDilution1"
  SetLib txtDilution, "Tag", "ABtxtDilution.tag"
  SetLib lblDilution2, "Caption", "ABlblDilution2"
  SetLib lblQuantité1, "Caption", "ABlblQuantité1"
  SetLib txtQuantité, "Tag", "ABtxtQuantité.tag"
  SetLib lblQuantité2, "Caption", "ABlblQuantité2"
  SetLib lblFacteur1, "Caption", "ABlblFacteur1"
  SetLib txtFacteur, "Tag", "ABtxtFacteur.tag"
  SetLib lblFacteur2, "Caption", "ABlblFacteur2"
  SetLib lblNumBoîte1, "Caption", "ABlblNumBoîte1"
  SetLib txtNumBoîte, "Tag", "ABtxtNumBoîte.tag"
  SetLib lblNumBoîte2, "Caption", "ABlblNumBoîte2"
  SetLib lblTypeMarquage2, "Caption", "ABlblTypeMarquage2"
  SetLib txtTypeMarquage, "Tag", "ABtxtTypeMarquage.tag"
  SetLib lblTypeboîte2, "Caption", "ABlblTypeBoîte2"
  SetLib txtTypeBoîte, "Tag", "ABtxtTypeBoîte.tag"
  SetLib lblLégende, "Caption", "ABlblLégende"
  SetLib txtLégende, "Tag", "ABtxtLégende.tag"
End Sub

