VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmAjoutBo�te 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Ajout/Modification d'une bo�te"
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
   Icon            =   "frmAjoutBo�te.frx":0000
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
      Begin VB.TextBox txtD�nombrement 
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
      Begin VB.TextBox txtIdBo�te 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1800
         Locked          =   -1  'True
         TabIndex        =   41
         TabStop         =   0   'False
         Top             =   600
         Width           =   315
      End
      Begin VB.TextBox txtEtatBo�te 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1800
         Locked          =   -1  'True
         TabIndex        =   39
         TabStop         =   0   'False
         Top             =   240
         Width           =   315
      End
      Begin VB.Label lblD�nombrement 
         AutoSize        =   -1  'True
         Caption         =   "D�nombrement :"
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
      Begin VB.Label lblIdBo�te 
         AutoSize        =   -1  'True
         Caption         =   "Id bo�te :"
         Height          =   210
         Left            =   120
         TabIndex        =   42
         Top             =   660
         Width           =   870
      End
      Begin VB.Label lblEtatBo�te 
         AutoSize        =   -1  'True
         Caption         =   "�tat bo�te :"
         Height          =   210
         Left            =   120
         TabIndex        =   40
         Top             =   300
         Width           =   1065
      End
   End
   Begin VB.ComboBox cboTypeMarquage 
      Height          =   330
      ItemData        =   "frmAjoutBo�te.frx":0442
      Left            =   2340
      List            =   "frmAjoutBo�te.frx":044F
      Style           =   2  'Dropdown List
      TabIndex        =   26
      Top             =   4200
      Width           =   5115
   End
   Begin VB.ComboBox cboTypeBo�te 
      Height          =   330
      ItemData        =   "frmAjoutBo�te.frx":04A9
      Left            =   2340
      List            =   "frmAjoutBo�te.frx":04BC
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
      Begin VB.TextBox txtLibell�M�thode 
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
         Tag             =   "Entrez la dilution: 0, -1, �, 1 pour l'�chantillon pur."
         Top             =   240
         Width           =   1335
      End
      Begin VB.TextBox txtM�thode 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1800
         Locked          =   -1  'True
         MaxLength       =   10
         TabIndex        =   4
         TabStop         =   0   'False
         Tag             =   "Entrez la dilution: 0, -1, �, 1 pour l'�chantillon pur."
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
      Begin VB.Label lblM�thode 
         AutoSize        =   -1  'True
         Caption         =   "M�thode :"
         Height          =   210
         Left            =   120
         TabIndex        =   3
         Top             =   660
         Width           =   960
      End
   End
   Begin VB.TextBox txtTypeBo�te 
      Height          =   315
      Left            =   1860
      MaxLength       =   10
      TabIndex        =   28
      Tag             =   "D�finissez la mani�re dont l'automate IDEC d�posera la g�lose dans la bo�te."
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
      Begin VB.TextBox txtMilTypeBo�te 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   4500
         Locked          =   -1  'True
         MaxLength       =   10
         TabIndex        =   12
         TabStop         =   0   'False
         Tag             =   "Entrez la dilution: 0, -1, �, 1 pour l'�chantillon pur."
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
         Tag             =   "Entrez la dilution: 0, -1, �, 1 pour l'�chantillon pur."
         Top             =   1020
         Width           =   1335
      End
      Begin VB.TextBox txtMilAbr�g� 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1800
         Locked          =   -1  'True
         MaxLength       =   10
         TabIndex        =   8
         TabStop         =   0   'False
         Tag             =   "Entrez la dilution: 0, -1, �, 1 pour l'�chantillon pur."
         Top             =   660
         Width           =   1335
      End
      Begin VB.ComboBox cboMilieu 
         Height          =   330
         Left            =   120
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Tag             =   "Choisissez le milieu de culture � utiliser, F4 ouvre la liste."
         Top             =   240
         Width           =   5715
      End
      Begin VB.Label lblTypeBo�te1 
         AutoSize        =   -1  'True
         Caption         =   "Type bo�te :"
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
      Begin VB.Label lblAbr�g� 
         AutoSize        =   -1  'True
         Caption         =   "Abr�g�"
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
      Tag             =   "Entrez le type de bo�te sur laquelle la machine SANTI d�pose l'�tiquette."
      Top             =   4200
      Width           =   435
   End
   Begin VB.TextBox txtL�gende 
      Height          =   315
      Left            =   1860
      MaxLength       =   10
      TabIndex        =   31
      Tag             =   "Entrez la l�gende � imprimer sur la bo�te."
      Top             =   4920
      Width           =   1335
   End
   Begin VB.TextBox txtNumBo�te 
      Height          =   315
      Left            =   1860
      MaxLength       =   10
      TabIndex        =   22
      Tag             =   "Permet de produire plusieurs bo�tes pour une m�me dilution."
      Top             =   3840
      Width           =   1335
   End
   Begin VB.TextBox txtFacteur 
      Height          =   315
      Left            =   1860
      MaxLength       =   10
      TabIndex        =   20
      Tag             =   "Entrez le facteur multiplicateur pour exprimer le r�sultat."
      Top             =   3480
      Width           =   1335
   End
   Begin VB.TextBox txtQuantit� 
      Height          =   315
      Left            =   1860
      MaxLength       =   10
      TabIndex        =   17
      Tag             =   "Entrez la quantit� � d�poser sur la bo�te en 1/10� de ml."
      Top             =   3120
      Width           =   1335
   End
   Begin VB.TextBox txtDilution 
      Height          =   315
      Left            =   1860
      MaxLength       =   10
      TabIndex        =   14
      Tag             =   "Entrez la dilution: 0, -1, �, 1 pour l'�chantillon pur."
      Top             =   2760
      Width           =   1335
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   6120
      TabIndex        =   33
      Tag             =   "Valide l'op�ration."
      Top             =   60
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   6120
      TabIndex        =   34
      Tag             =   "Annule l'op�ration."
      Top             =   420
      Width           =   1350
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   6120
      TabIndex        =   35
      Tag             =   "Affiche l'aide sur cette bo�te de dialogue."
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
      Caption         =   "(10*10^-dil)/qt� si r�sultats /g"
      Height          =   210
      Left            =   3300
      TabIndex        =   37
      Top             =   3540
      Width           =   2940
   End
   Begin VB.Label lblNumBo�te2 
      AutoSize        =   -1  'True
      Caption         =   "Pour distinguer les bo�tes de m�me dilution"
      Height          =   210
      Left            =   3300
      TabIndex        =   23
      Top             =   3900
      Width           =   4095
   End
   Begin VB.Label lblDilution2 
      AutoSize        =   -1  'True
      Caption         =   "-1 (sol. m�re), -2, -3, �, 0 (�chantillon pur)"
      Height          =   210
      Left            =   3300
      TabIndex        =   15
      Top             =   2820
      Width           =   4020
   End
   Begin VB.Label lblTypebo�te2 
      AutoSize        =   -1  'True
      Caption         =   "Type bo�te :"
      Height          =   210
      Left            =   180
      TabIndex        =   27
      Top             =   4620
      Width           =   1125
   End
   Begin VB.Label lblQuantit�2 
      AutoSize        =   -1  'True
      Caption         =   "1/10� ml"
      Height          =   210
      Left            =   3300
      TabIndex        =   18
      Top             =   3180
      Width           =   825
   End
   Begin VB.Label lblL�gende 
      AutoSize        =   -1  'True
      Caption         =   "L�gende :"
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
   Begin VB.Label lblNumBo�te1 
      AutoSize        =   -1  'True
      Caption         =   "N� de bo�te :"
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
   Begin VB.Label lblQuantit�1 
      AutoSize        =   -1  'True
      Caption         =   "Quantit� :"
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
Attribute VB_Name = "frmAjoutBo�te"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille d'ajout et de modification de bo�te"
' frmAjoutBo�te
' Feuille d'ajout et de modification de bo�te
' Module "propre" sans probl�mes de r�-entrance
'  7/09/97 PV
'  2/02/98 PV Contr�les de bornes pour facteur, dilution, quantit�
' 14/05/98 PV Sablier pendant le chargement
' 27/01/1999 NC Internationalisation
' 05/04/2000 FG Correction calculeFacteur suite modif dilutions au 03/04/00

Option Explicit

' R�sultat
Private b As Bo�te

' Germe modifi�, rang de la bo�te modifi�e
Private g0 As GermeRecherch�
Private i0 As Integer


' Point d'entr�e pour un ajout
Public Function Ajout(ByVal iMilieuD�faut As Integer, g As GermeRecherch�) As Bo�te
  Screen.MousePointer = vbHourglass
  Load Me
  
  txtGerme = g.iGerme & ": " & g.sAbr�g�Labo
  txtM�thode = g.sM�thode
  txtLibell�M�thode = sLibell�M�thode(g.iGerme, g.sM�thode)
  
  txtDilution = ""
  txtQuantit� = ""
  txtFacteur = ""
  txtNumBo�te = "0"
  txtTypeBo�te = ""
  txtTypeMarquage = ""
  txtL�gende = ""
  
  txtEtatBo�te = ""
  txtIdBo�te = ""
  txtTSLecture = ""
  txtOperLecture = ""
  txtD�nombrement = ""
  
  
  ' Milieu par d�faut
  Dim i As Integer
  For i = 0 To cboMilieu.ListCount - 1
    If Val(cboMilieu.List(i)) = iMilieuD�faut Then
      cboMilieu.ListIndex = i
      Exit For
    End If
  Next
      
  Caption = sGetIntlLib("CR324", "Ajout d'une bo�te")
  Set b = Nothing
  Screen.MousePointer = vbDefault
  Set g0 = g
  i0 = -1
  Me.Show 1
  Set g0 = Nothing
  Set Ajout = b
End Function


' Point d'entr�e pour une modification
Public Function Modifie(b0 As Bo�te, g As GermeRecherch�, ib As Integer) As Bo�te
  Load Me
  
  txtGerme = g.iGerme & ": " & g.sAbr�g�Labo
  txtM�thode = g.sM�thode
  txtLibell�M�thode = sLibell�M�thode(g.iGerme, g.sM�thode)
  
  txtDilution = b0.boi_dilution
  txtQuantit� = NV(b0.boi_quantite)
  txtFacteur = b0.boi_facteur
  txtNumBo�te = b0.boi_numboite
  txtTypeBo�te = b0.boi_typeboite
  txtTypeMarquage = b0.boi_typemarquage
  txtL�gende = b0.boi_legende
  
  txtEtatBo�te = b0.boi_etatboite
  txtIdBo�te = b0.boi_idboite
  txtTSLecture = NV(b0.boi_tslecture)
  txtOperLecture = NV(b0.boi_operlecture)
  txtD�nombrement = NV(b0.boi_denombrement)
  
  
  ' Milieu par d�faut
  Dim i As Integer
  For i = 0 To cboMilieu.ListCount - 1
    If Val(cboMilieu.List(i)) = b0.boi_milieu Then
      cboMilieu.ListIndex = i
      Exit For
    End If
  Next
      
  Caption = sGetIntlLib("CR325", "Modification d'une bo�te")
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
    'MsgBox "Le champ dilution doit �tre compris entre 1 et -9 !", vbExclamation, sNomApp
    Exit Sub
  End If

  
  If txtQuantit� <> "" Then
    If Not IsNumeric(txtQuantit�) Then
      MsgBox2i "CO003", txtQuantit�
      txtQuantit�.SetFocus
      Exit Sub
    End If
    If CLng(txtQuantit�) < 1 Or CLng(txtQuantit�) > 60 Then
      MsgBox2i "CR254"
      'MsgBox "Le champ quantit� doit �tre compris entre 1 (0,1 ml) et 60 (6 ml)", vbExclamation, sNomApp
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
    'MsgBox "Le champ facteur doit �tre sup�rieur ou �gal � 1 !", vbExclamation, sNomApp
    Exit Sub
  End If

  If Not IsNumeric(txtNumBo�te) Then
    MsgBox2i "CO003", txtNumBo�te
    txtNumBo�te.SetFocus
    Exit Sub
  End If
  If Not IsNumeric(txtTypeMarquage) Then
    MsgBox2i "CO003", txtTypeMarquage
    txtTypeMarquage.SetFocus
    Exit Sub
  End If
  If Not IsNumeric(txtTypeBo�te) Then
    MsgBox2i "CO003", txtTypeBo�te
    txtTypeBo�te.SetFocus
    Exit Sub
  End If
  
  
  Set b = New Bo�te
  b.boi_milieu = Val(cboMilieu.Text)
  b.boi_dilution = VN(txtDilution)
  b.boi_quantite = VN(txtQuantit�)
  b.boi_facteur = VN(txtFacteur)
  b.boi_numboite = txtNumBo�te
  b.boi_typemarquage = txtTypeMarquage
  b.boi_typeboite = txtTypeBo�te
  b.boi_legende = txtL�gende

  
  ' On v�rifie que la bo�te n'existe pas d�j�
  Dim bt As Bo�te, i As Integer
  For i = 1 To g0.cBo�tes.Count
    If i <> i0 Then
      Set bt = g0.cBo�tes(i)
      If bt.boi_milieu = b.boi_milieu And bt.boi_dilution = b.boi_dilution And bt.boi_numboite = b.boi_numboite Then
        MsgBox2i "CR255", b.boi_milieu, LireMilieu(b.boi_milieu).mil_abrege, b.boi_dilution, b.boi_numboite
        'MsgBox "La bo�te milieu " & b.boi_milieu & ": " & LireMilieu(b.boi_milieu).mil_abrege & ", dilution " & b.boi_dilution & ", n� " & b.boi_numboite & _
          " est d�j� pr�sente dans la liste des bo�tes.", vbExclamation, sNomApp
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
  txtMilAbr�g� = m.mil_abrege
  txtMilTypeMarquage = m.mil_typemarquage
  txtMilTypeBo�te = m.mil_typeboite
  
  txtTypeMarquage = m.mil_typemarquage
  txtTypeBo�te = m.mil_typeboite
End Sub

' ===================================================

Private Sub CalculeFacteur()
  ' txtQuantit� est dans un facteur de 10
  ' Changement m�canisme de calcul suite mise en place nouvelles dilutions au 03/04/00
  If IsNumeric(txtDilution) And IsNumeric(txtQuantit�) Then
    If txtDilution <= 1 And txtDilution >= -6 And txtQuantit� >= 1 And txtQuantit� < 100 Then
      lblFacteur2 = Int((10 * 10 ^ -txtDilution) / txtQuantit�) & " si r�sultats /g"
    Else
      lblFacteur2 = "Dilution ou quantit� incorrecte !"
    End If
  Else
    lblFacteur2 = "(10*10^-dil)/qt� si r�sultats /g"
  End If
End Sub

Private Sub Form_Activate()
  txtDilution.SetFocus
End Sub

Private Sub Label2_Click()

End Sub

Private Sub lblNdebo�te1_Click()

End Sub




Private Sub txtDilution_Change()
  CalculeFacteur
End Sub

Private Sub txtQuantit�_Change()
  CalculeFacteur
End Sub

' ===================================================
' Type de marquage
' Couple champ texte/combo, �vitant le bouclage

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
' Type de bo�te
' Couple champ texte/combo, �vitant le bouclage

Private Sub txtTypeBo�te_Change()
  Dim iIndex As Integer
  iIndex = -1
  
  If IsNumeric(txtTypeBo�te) Then
    Dim i As Integer
    For i = 0 To cboTypeBo�te.ListCount - 1
      If Val(cboTypeBo�te.List(i)) = txtTypeBo�te Then
        iIndex = i
        Exit For
      End If
    Next
  End If
  
  cboTypeBo�te.ListIndex = iIndex
End Sub

Private Sub cboTypeBo�te_Click()
  If cboTypeBo�te.ListIndex <> -1 Then
    If txtTypeBo�te = "" Then
      txtTypeBo�te = Val(cboTypeBo�te)
    ElseIf txtTypeBo�te <> Val(cboTypeBo�te) Then
      txtTypeBo�te = Val(cboTypeBo�te)
    End If
  End If
End Sub


' ===================================================
' Feuille

Private Sub Form_Load()
  Internationalisation
  
  ' Chargement de la liste des milieux si n�cessaire
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
Private Sub txtQuantit�_GotFocus(): GotFocus: End Sub
Private Sub txtFacteur_GotFocus(): GotFocus: End Sub
Private Sub txtNumBo�te_GotFocus(): GotFocus: End Sub
Private Sub txtTypeMarquage_GotFocus(): GotFocus: End Sub
Private Sub txtTypeBo�te_GotFocus(): GotFocus: End Sub
Private Sub txtL�gende_GotFocus(): GotFocus: End Sub
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
  SetLib lblM�thode, "Caption", "ABlblM�thode"
  SetLib txtM�thode, "Tag", "ABtxtM�thode.tag"
  SetLib fraMilieu, "Caption", "ABfraMilieu"
  SetLib cboMilieu, "Tag", "ABcboMilieu.tag"
  SetLib lblAbr�g�, "Caption", "ABlblAbr�g�"
  SetLib txtMilAbr�g�, "Tag", "ABtxtMilAbr�g�.tag"
  SetLib lblTypeMarquage1, "Caption", "ABlblTypeMarquage1"
  SetLib txtMilTypeMarquage, "Tag", "ABtxtMilTypeMarq.tag"
  SetLib lblTypeBo�te1, "Caption", "ABlblTypeBo�te1"
  SetLib txtMilTypeBo�te, "Tag", "ABtxtMilTypBo�te.tag"
  SetLib lblDilution1, "Caption", "ABlblDilution1"
  SetLib txtDilution, "Tag", "ABtxtDilution.tag"
  SetLib lblDilution2, "Caption", "ABlblDilution2"
  SetLib lblQuantit�1, "Caption", "ABlblQuantit�1"
  SetLib txtQuantit�, "Tag", "ABtxtQuantit�.tag"
  SetLib lblQuantit�2, "Caption", "ABlblQuantit�2"
  SetLib lblFacteur1, "Caption", "ABlblFacteur1"
  SetLib txtFacteur, "Tag", "ABtxtFacteur.tag"
  SetLib lblFacteur2, "Caption", "ABlblFacteur2"
  SetLib lblNumBo�te1, "Caption", "ABlblNumBo�te1"
  SetLib txtNumBo�te, "Tag", "ABtxtNumBo�te.tag"
  SetLib lblNumBo�te2, "Caption", "ABlblNumBo�te2"
  SetLib lblTypeMarquage2, "Caption", "ABlblTypeMarquage2"
  SetLib txtTypeMarquage, "Tag", "ABtxtTypeMarquage.tag"
  SetLib lblTypebo�te2, "Caption", "ABlblTypeBo�te2"
  SetLib txtTypeBo�te, "Tag", "ABtxtTypeBo�te.tag"
  SetLib lblL�gende, "Caption", "ABlblL�gende"
  SetLib txtL�gende, "Tag", "ABtxtL�gende.tag"
End Sub

