VERSION 2.00
Begin Form frmFichePrélèvement 
   Caption         =   "Assistant Informatique Ercem  -  Fiche de prélèvement"
   ClientHeight    =   6630
   ClientLeft      =   1215
   ClientTop       =   1680
   ClientWidth     =   9540
   ClipControls    =   0   'False
   Height          =   7260
   KeyPreview      =   -1  'True
   Left            =   1185
   LinkTopic       =   "Feuille1"
   ScaleHeight     =   6630
   ScaleMode       =   0  'Utilisateur
   ScaleWidth      =   9766.824
   Tag             =   "N"
   Top             =   1080
   Width           =   9600
   Begin TextBox txtRemarquesTerrain 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   735
      Left            =   1920
      MultiLine       =   -1  'True
      TabIndex        =   47
      Top             =   4680
      Width           =   7215
   End
   Begin VScrollBar ascNumPr 
      Height          =   6640
      Left            =   9299
      Max             =   10
      Min             =   1
      TabIndex        =   52
      Top             =   0
      Value           =   1
      Width           =   255
   End
   Begin CheckBox bModif 
      Caption         =   "A en&registrer"
      Height          =   255
      Left            =   120
      TabIndex        =   53
      TabStop         =   0   'False
      Top             =   6240
      Width           =   1635
   End
   Begin TextBox txtCodeBarre 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   6240
      TabIndex        =   43
      Top             =   4200
      Width           =   1515
   End
   Begin TextBox txtTypeCRA 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   8820
      TabIndex        =   45
      Top             =   4200
      Width           =   315
   End
   Begin TextBox txtDLC 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   6240
      TabIndex        =   41
      Top             =   3780
      Width           =   1215
   End
   Begin TextBox txtDateLivraison 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   6240
      TabIndex        =   39
      Top             =   3360
      Width           =   1215
   End
   Begin TextBox txtConditionnement 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   6240
      TabIndex        =   33
      Top             =   2520
      Width           =   375
   End
   Begin TextBox txtTempAmbiance 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   6240
      TabIndex        =   31
      Top             =   2100
      Width           =   1215
   End
   Begin TextBox txtTempProduit 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   6240
      TabIndex        =   29
      Top             =   1680
      Width           =   1215
   End
   Begin TextBox txtIdentificationLot 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   1920
      TabIndex        =   27
      Top             =   4200
      Width           =   2655
   End
   Begin TextBox txtDateConditionnement 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   1920
      TabIndex        =   25
      Top             =   3780
      Width           =   1215
   End
   Begin TextBox txtDateFabrication 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   1920
      TabIndex        =   23
      Top             =   3360
      Width           =   1215
   End
   Begin TextBox txtNumDis 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   6240
      TabIndex        =   36
      Top             =   2940
      Width           =   675
   End
   Begin TextBox txtNumFab 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   1920
      TabIndex        =   20
      Top             =   2940
      Width           =   675
   End
   Begin TextBox txtCondPrél 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   1920
      TabIndex        =   17
      Top             =   2520
      Width           =   375
   End
   Begin TextBox txtDatePrép 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   1920
      TabIndex        =   15
      Top             =   2100
      Width           =   1215
   End
   Begin TextBox txtHeurePrél 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   3240
      TabIndex        =   13
      Top             =   1680
      Width           =   1215
   End
   Begin TextBox txtDatePrél 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   1920
      TabIndex        =   12
      Top             =   1680
      Width           =   1215
   End
   Begin TextBox txtNumPro 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   2700
      TabIndex        =   7
      Top             =   840
      Width           =   975
   End
   Begin TextBox txtObs 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   2700
      TabIndex        =   10
      Top             =   1260
      Width           =   6435
   End
   Begin TextBox txtCatégorie 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   8340
      TabIndex        =   51
      Top             =   420
      Width           =   795
   End
   Begin TextBox txtCritère 
      BackColor       =   &H00FFFF00&
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   6840
      TabIndex        =   49
      Top             =   420
      Width           =   795
   End
   Begin Label Etiquette23 
      AutoSize        =   -1  'True
      Caption         =   "Remar&ques terrain"
      Height          =   195
      Left            =   120
      TabIndex        =   46
      Top             =   4680
      Width           =   1560
   End
   Begin Label Etiquette22 
      AutoSize        =   -1  'True
      Caption         =   "Code &Barre"
      Height          =   195
      Left            =   4680
      TabIndex        =   42
      Top             =   4260
      Width           =   960
   End
   Begin Label Etiquette21 
      AutoSize        =   -1  'True
      Caption         =   "T&ype CRA"
      Height          =   195
      Left            =   7860
      TabIndex        =   44
      Top             =   4260
      Width           =   870
   End
   Begin Label Etiquette20 
      AutoSize        =   -1  'True
      Caption         =   "D&LC ou DLUO"
      Height          =   195
      Left            =   4680
      TabIndex        =   40
      Top             =   3840
      Width           =   1215
   End
   Begin Label Etiquette19 
      AutoSize        =   -1  'True
      Caption         =   "Date de li&vraison"
      Height          =   195
      Left            =   4680
      TabIndex        =   38
      Top             =   3420
      Width           =   1455
   End
   Begin Label Etiquette18 
      AutoSize        =   -1  'True
      Caption         =   "Cond&itionnement"
      Height          =   195
      Left            =   4680
      TabIndex        =   32
      Top             =   2580
      Width           =   1425
   End
   Begin Label Etiquette17 
      AutoSize        =   -1  'True
      Caption         =   "Temp. a&mbiance"
      Height          =   195
      Left            =   4680
      TabIndex        =   30
      Top             =   2160
      Width           =   1410
   End
   Begin Label Etiquette16 
      AutoSize        =   -1  'True
      Caption         =   "Tem&p. produit"
      Height          =   195
      Left            =   4680
      TabIndex        =   28
      Top             =   1740
      Width           =   1185
   End
   Begin Line Ligne16 
      BorderWidth     =   3
      X1              =   0
      X2              =   9523.165
      Y1              =   4590
      Y2              =   4590
   End
   Begin Label Etiquette15 
      AutoSize        =   -1  'True
      Caption         =   "Identification de lo&t"
      Height          =   195
      Left            =   120
      TabIndex        =   26
      Top             =   4260
      Width           =   1665
   End
   Begin Line Ligne15 
      X1              =   0
      X2              =   9523.165
      Y1              =   4140
      Y2              =   4140
   End
   Begin Label Etiquette14 
      AutoSize        =   -1  'True
      Caption         =   "Date de co&ntit."
      Height          =   195
      Left            =   120
      TabIndex        =   24
      Top             =   3840
      Width           =   1290
   End
   Begin Line Ligne14 
      X1              =   0
      X2              =   9523.165
      Y1              =   3720
      Y2              =   3720
   End
   Begin Label Etiquette13 
      AutoSize        =   -1  'True
      Caption         =   "Date de fa&brication"
      Height          =   195
      Left            =   120
      TabIndex        =   22
      Top             =   3420
      Width           =   1650
   End
   Begin Label Etiquette12 
      AutoSize        =   -1  'True
      Caption         =   "Distrib&uteur"
      Height          =   195
      Left            =   4680
      TabIndex        =   35
      Top             =   3000
      Width           =   990
   End
   Begin Line Ligne12 
      X1              =   0
      X2              =   9523.165
      Y1              =   3300
      Y2              =   3300
   End
   Begin Label Etiquette11 
      AutoSize        =   -1  'True
      Caption         =   "&Fabricant"
      Height          =   195
      Left            =   120
      TabIndex        =   19
      Top             =   3000
      Width           =   810
   End
   Begin Line Ligne13 
      X1              =   0
      X2              =   9523.165
      Y1              =   2880
      Y2              =   2880
   End
   Begin Label Etiquette10 
      AutoSize        =   -1  'True
      Caption         =   "&Conditions de prél."
      Height          =   195
      Left            =   120
      TabIndex        =   16
      Top             =   2580
      Width           =   1605
   End
   Begin Line Ligne11 
      X1              =   0
      X2              =   9523.165
      Y1              =   2460
      Y2              =   2460
   End
   Begin Label Etiquette9 
      AutoSize        =   -1  'True
      Caption         =   "Date de pr&éparation"
      Height          =   195
      Left            =   120
      TabIndex        =   14
      Top             =   2160
      Width           =   1710
   End
   Begin Line Ligne10 
      X1              =   0
      X2              =   9523.165
      Y1              =   2040
      Y2              =   2040
   End
   Begin Line Ligne9 
      BorderWidth     =   3
      X1              =   4729.846
      X2              =   4729.846
      Y1              =   1620
      Y2              =   4560
   End
   Begin Label Etiquette8 
      AutoSize        =   -1  'True
      Caption         =   "Date, &heure de prél."
      Height          =   195
      Left            =   120
      TabIndex        =   11
      Top             =   1740
      Width           =   1725
   End
   Begin Line Ligne8 
      X1              =   2686.388
      X2              =   2686.388
      Y1              =   1620
      Y2              =   780
   End
   Begin Line Ligne7 
      X1              =   1159.938
      X2              =   9523.165
      Y1              =   1200
      Y2              =   1200
   End
   Begin Label Etiquette7 
      Caption         =   "Précisi&ons complémentaires"
      Height          =   375
      Left            =   1200
      TabIndex        =   9
      Top             =   1200
      Width           =   1455
   End
   Begin Line Ligne6 
      X1              =   1159.938
      X2              =   1159.938
      Y1              =   780
      Y2              =   1620
   End
   Begin Label Etiquette5 
      AutoSize        =   -1  'True
      Caption         =   "Échantillon"
      Height          =   195
      Left            =   120
      TabIndex        =   5
      Top             =   1080
      Width           =   960
   End
   Begin Line Ligne5 
      BorderWidth     =   3
      X1              =   0
      X2              =   9523.165
      Y1              =   1620
      Y2              =   1620
   End
   Begin Label Etiquette4 
      AutoSize        =   -1  'True
      Caption         =   "Caté&g."
      Height          =   195
      Left            =   7740
      TabIndex        =   50
      Top             =   480
      Width           =   570
   End
   Begin Line Ligne4 
      X1              =   7862.601
      X2              =   7862.601
      Y1              =   360
      Y2              =   780
   End
   Begin Label Etiquette3 
      AutoSize        =   -1  'True
      Caption         =   "Crit&ère"
      Height          =   195
      Left            =   6240
      TabIndex        =   48
      Top             =   480
      Width           =   570
   End
   Begin Line Ligne3 
      X1              =   6226.606
      X2              =   9523.165
      Y1              =   360
      Y2              =   360
   End
   Begin Label lblDateAssistant 
      BackColor       =   &H0080FFFF&
      Caption         =   "Date + Assistant"
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   195
      Left            =   780
      TabIndex        =   2
      Top             =   480
      Width           =   5175
   End
   Begin Label lblRef 
      BackColor       =   &H0080FFFF&
      Caption         =   "Réf"
      Height          =   195
      Left            =   6840
      TabIndex        =   4
      Top             =   60
      Width           =   2295
   End
   Begin Label lblEtablissement 
      BackColor       =   &H0080FFFF&
      Caption         =   "Établissement"
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   195
      Left            =   780
      TabIndex        =   1
      Top             =   120
      Width           =   5175
   End
   Begin Label Etiquette2 
      AutoSize        =   -1  'True
      Caption         =   "Réf"
      Height          =   195
      Left            =   6240
      TabIndex        =   3
      Top             =   60
      Width           =   315
   End
   Begin Line Ligne2 
      BorderWidth     =   3
      X1              =   6226.606
      X2              =   6226.606
      Y1              =   780
      Y2              =   -60
   End
   Begin Line Ligne1 
      BorderWidth     =   3
      X1              =   0
      X2              =   9523.165
      Y1              =   780
      Y2              =   780
   End
   Begin Label Etiquette1 
      AutoSize        =   -1  'True
      Caption         =   "Etb"
      Height          =   195
      Left            =   90
      TabIndex        =   0
      Top             =   120
      Width           =   300
   End
   Begin Label Etiquette6 
      Caption         =   "A&ppellation fichier"
      Height          =   375
      Left            =   1200
      TabIndex        =   6
      Top             =   780
      Width           =   1095
   End
   Begin Label lblCondPrél 
      BackColor       =   &H0080FFFF&
      Caption         =   "Conditions de prélèvement"
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   435
      Left            =   2340
      TabIndex        =   18
      Top             =   2460
      Width           =   2235
      WordWrap        =   -1  'True
   End
   Begin Label lblNomFab 
      BackColor       =   &H0080FFFF&
      Caption         =   "Nom du fabricant"
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   435
      Left            =   2640
      TabIndex        =   21
      Top             =   2880
      Width           =   1935
      WordWrap        =   -1  'True
   End
   Begin Label lblNomDis 
      BackColor       =   &H0080FFFF&
      Caption         =   "Nom du distributeur"
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   435
      Left            =   6960
      TabIndex        =   37
      Top             =   2880
      Width           =   2175
      WordWrap        =   -1  'True
   End
   Begin Label lblConditionnement 
      BackColor       =   &H0080FFFF&
      Caption         =   "Conditionnement"
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   435
      Left            =   6660
      TabIndex        =   34
      Top             =   2460
      Width           =   2475
      WordWrap        =   -1  'True
   End
   Begin Label lblNomPro 
      BackColor       =   &H0080FFFF&
      Caption         =   "Nom produit"
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   195
      Left            =   3720
      TabIndex        =   8
      Top             =   900
      Width           =   5415
   End
   Begin Menu mnuAffiche 
      Caption         =   "&Affiche"
      Begin Menu cmdPlanning 
         Caption         =   "&Planning"
      End
      Begin Menu cmdTiret1 
         Caption         =   "-"
      End
      Begin Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin Menu mnuEdition 
      Caption         =   "&Edition"
      Begin Menu cmdAnnule 
         Caption         =   "Annuler la saisie du champ"
         Shortcut        =   %{BKSP}
      End
      Begin Menu cmdAnnuleTout 
         Caption         =   "Annuler &tous les changements"
         Shortcut        =   ^Y
      End
      Begin Menu cmdTiret2 
         Caption         =   "-"
      End
      Begin Menu cmdEfface 
         Caption         =   "&Efface"
      End
   End
End
Option Explicit
Dim iNumPr As Integer ' No d'analyse en cours ou précédente

Sub ascNumPr_Change ()
  Let lblRef = gRef & "." & Format(ascNumPr, "00")
End Sub

Sub cmdAnnule_click ()
  On Error Resume Next
  activecontrol = activecontrol.Tag
  activecontrol.SelStart = 0
  activecontrol.SelLength = 999
End Sub

Sub cmdAnnuleTout_Click ()
  LitFiche
End Sub

Sub cmdEfface_Click ()
  Dim NomFic As String
  Dim iNumPr As Integer, iRep As Integer

  iRep = MsgBox("Ok pour détruire la fiche " & lblRef & " ?", 48 + 1)
  If iRep = 2 Then Exit Sub

  iNumPr = Val(Right(lblRef, 2))
  Let NomFic = gRef & "." & Format(iNumPr, "00")
  On Error Resume Next
  Kill NomFic
  bModif = 0
  LitFiche
End Sub

Sub cmdPlanning_Click ()
  frmPlanning.Show
  frmFichePrélèvement.Hide
End Sub

Sub cmdQuitter_Click ()
  Quitter
End Sub

Sub Form_Activate ()
  windowstate = 2
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
  Select Case KeyCode
    Case 34
      If ascNumPr < 20 Then ascNumPr = ascNumPr + 1
      KeyCode = 0
    Case 33
      If ascNumPr > 1 Then ascNumPr = ascNumPr - 1
      KeyCode = 0
    Case 27
      cmdAnnule_click
      KeyCode = 0
  End Select
End Sub

Sub Form_Load ()
  windowstate = 2
End Sub

Sub lblRef_Change ()
  LitFiche
  txtNumPro.SetFocus
End Sub

Sub LitFiche ()
  Dim NomFic As String
  Dim s As String
  Dim iRep As Integer

  If bModif Then SauveFiche

  iNumPr = Val(Right(lblRef, 2))
  Let NomFic = gRef & "." & Format(iNumPr, "00")
  On Error Resume Next
  Open NomFic For Input As #1
  If Err Then
    txtCritère = ""
    txtCatégorie = ""
    txtNumPro = ""
    lblNomPro = ""
    txtObs = ""
    txtDatePrél = ""
    txtHeurePrél = ""
    txtDatePrép = ""
    txtCondPrél = ""
    lblCondPrél = ""
    txtNumFab = ""
    lblNomFab = ""
    txtDateFabrication = ""
    txtDateConditionnement = ""
    txtIdentificationLot = ""
    txtTempProduit = ""
    txtTempAmbiance = ""
    txtConditionnement = ""
    lblConditionnement = ""
    txtNumDis = ""
    lblNomDis = ""
    txtDateLivraison = ""
    txtDLC = ""
    txtCodeBarre = ""
    txtTypeCRA = ""
    txtRemarquesTerrain = ""
  Else
    Input #1, gDate
    Input #1, gNomAssistant
    Input #1, gNumEtb
    Input #1, gNometb
    lblEtablissement = gNumEtb & " " & gNometb
    lblDateAssistant = gDate & " " & gNomAssistant
    Input #1, s: txtCritère = s
    Input #1, s: txtCatégorie = s
    Input #1, s: txtNumPro = s
    Input #1, s: lblNomPro = s
    Input #1, s: txtObs = s
    Input #1, s: txtDatePrél = s
    Input #1, s: txtHeurePrél = s
    Input #1, s: txtDatePrép = s
    Input #1, s: txtCondPrél = s
    Input #1, s: lblCondPrél = s
    Input #1, s: txtNumFab = s
    Input #1, s: lblNomFab = s
    Input #1, s: txtDateFabrication = s
    Input #1, s: txtDateConditionnement = s
    Input #1, s: txtIdentificationLot = s
    Input #1, s: txtTempProduit = s
    Input #1, s: txtTempAmbiance = s
    Input #1, s: txtConditionnement = s
    Input #1, s: lblConditionnement = s
    Input #1, s: txtNumDis = s
    Input #1, s: lblNomDis = s
    Input #1, s: txtDateLivraison = s
    Input #1, s: txtDLC = s
    Input #1, s: txtCodeBarre = s
    Input #1, s: txtTypeCRA = s
    Input #1, s: txtRemarquesTerrain = s

    Close #1
  End If
  txtNumPro.SetFocus
  bModif = 0
End Sub

Sub SauveFiche ()
  Dim NomFic As String

  Let NomFic = gRef & "." & Format(iNumPr, "00")
  'MsgBox "Sauvegarde sous " & NomFic
  Open NomFic For Output As #1
  Write #1, gDate
  Write #1, gNomAssistant
  Write #1, gNumEtb
  Write #1, gNometb
  Write #1, txtCritère
  Write #1, txtCatégorie
  Write #1, txtNumPro
  Write #1, lblNomPro
  Write #1, txtObs
  Write #1, txtDatePrél
  Write #1, txtHeurePrél
  Write #1, txtDatePrép
  Write #1, txtCondPrél
  Write #1, lblCondPrél
  Write #1, txtNumFab
  Write #1, lblNomFab
  Write #1, txtDateFabrication
  Write #1, txtDateConditionnement
  Write #1, txtIdentificationLot
  Write #1, txtTempProduit
  Write #1, txtTempAmbiance
  Write #1, txtConditionnement
  Write #1, lblConditionnement
  Write #1, txtNumDis
  Write #1, lblNomDis
  Write #1, txtDateLivraison
  Write #1, txtDLC
  Write #1, txtCodeBarre
  Write #1, txtTypeCRA
  Write #1, txtRemarquesTerrain

  Close #1
  bModif = 0
End Sub

Sub txtCatégorie_Change ()
  bModif = 1
End Sub

Sub txtCatégorie_GotFocus ()
  InitSel txtCatégorie
End Sub

Sub txtCatégorie_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 115 Then
    setCatégorie (Val(txtCatégorie))
    frmCatégories.Show
  End If
End Sub

Sub txtCodeBarre_Change ()
  bModif = 1
End Sub

Sub txtCodeBarre_GotFocus ()
  InitSel txtCodeBarre
End Sub

Sub txtConditionnement_Change ()
  bModif = 1
End Sub

Sub txtConditionnement_GotFocus ()
  InitSel txtConditionnement
End Sub

Sub txtConditionnement_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 115 Then
    lblConditionnement = getConditionnement(Val(txtConditionnement))
    frmConditionnements.Show
  End If
  If KeyCode < 48 Or KeyCode > 57 Then KeyCode = 0
End Sub

Sub txtConditionnement_LostFocus ()
  If txtConditionnement <> txtConditionnement.Tag Then
    'Stop
    lblConditionnement = getConditionnement(Val(txtConditionnement))
    'Stop
  End If
End Sub

Sub txtCondPrél_Change ()
  bModif = 1
End Sub

Sub txtCondPrél_GotFocus ()
  InitSel txtCondPrél
End Sub

Sub txtCondPrél_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 115 Then
    lblCondPrél = getConditionsPrélèvement(Val(txtCondPrél))
    frmConditionsPrélèvement.Show
  End If
  If KeyCode < 48 Or KeyCode > 57 Then KeyCode = 0
End Sub

Sub txtCondPrél_LostFocus ()
  If txtCondPrél <> txtCondPrél.Tag Then lblCondPrél = getConditionsPrélèvement(Val(txtCondPrél))
End Sub

Sub txtCritère_Change ()
  bModif = 1
End Sub

Sub txtCritère_GotFocus ()
  InitSel txtCritère
End Sub

Sub txtCritère_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 115 Then
    frmCritères.Show
    frmCritères.lstCritères = txtCritère
  End If
End Sub

Sub txtDateConditionnement_Change ()
  bModif = 1
End Sub

Sub txtDateConditionnement_GotFocus ()
  InitSel txtDateConditionnement
End Sub

Sub txtDateConditionnement_KeyPress (KeyAscii As Integer)
  CtrlKDate KeyAscii
End Sub

Sub txtDateConditionnement_LostFocus ()
  ValideDate txtDateConditionnement
End Sub

Sub txtDateFabrication_Change ()
  bModif = 1
End Sub

Sub txtDateFabrication_GotFocus ()
  InitSel txtDateFabrication
End Sub

Sub txtDateFabrication_KeyPress (KeyAscii As Integer)
  CtrlKDate KeyAscii
End Sub

Sub txtDateFabrication_LostFocus ()
  ValideDate txtDateFabrication
End Sub

Sub txtDateLivraison_Change ()
  bModif = 1
End Sub

Sub txtDateLivraison_GotFocus ()
  InitSel txtDateLivraison
End Sub

Sub txtDateLivraison_KeyPress (KeyAscii As Integer)
  CtrlKDate KeyAscii
End Sub

Sub txtDateLivraison_LostFocus ()
  ValideDate txtDateLivraison
End Sub

Sub txtDatePrél_Change ()
  bModif = 1
End Sub

Sub txtDatePrél_GotFocus ()
  If txtDatePrél = "" Then txtDatePrél = Date
  InitSel txtDatePrél
End Sub

Sub txtDatePrél_KeyPress (KeyAscii As Integer)
  CtrlKDate KeyAscii
End Sub

Sub txtDatePrél_LostFocus ()
  ValideDate txtDatePrél
End Sub

Sub txtDatePrép_Change ()
  bModif = 1
End Sub

Sub txtDatePrép_GotFocus ()
  InitSel txtDatePrép
End Sub

Sub txtDatePrép_KeyPress (KeyAscii As Integer)
  CtrlKDate KeyAscii
End Sub

Sub txtDatePrép_LostFocus ()
  ValideDate txtDatePrép
End Sub

Sub txtDLC_Change ()
  bModif = 1
End Sub

Sub txtDLC_GotFocus ()
  InitSel txtDLC
End Sub

Sub txtDLC_LostFocus ()
  ValideDate txtDLC
End Sub

Sub txtHeurePrél_Change ()
  bModif = 1
End Sub

Sub txtHeurePrél_GotFocus ()
  If txtHeurePrél = "" Then txtHeurePrél = Left(Time, 5)
  InitSel txtHeurePrél
End Sub

Sub txtHeurePrél_KeyPress (KeyAscii As Integer)
  If InStr("0123456789:", Chr(KeyAscii)) = 0 Then KeyAscii = 0
End Sub

Sub txtHeurePrél_LostFocus ()
  ValideHeure txtHeurePrél
End Sub

Sub txtIdentificationLot_Change ()
  bModif = 1
End Sub

Sub txtIdentificationLot_GotFocus ()
  InitSel txtIdentificationLot
End Sub

Sub txtNumDis_Change ()
  bModif = 1
End Sub

Sub txtNumDis_GotFocus ()
  InitSel txtNumDis
End Sub

Sub txtNumDis_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 115 Then
    frmDistributeurs.Show
  End If
  If KeyCode < 48 Or KeyCode > 57 Then KeyCode = 0
End Sub

Sub txtNumFab_Change ()
  bModif = 1
End Sub

Sub txtNumFab_GotFocus ()
  InitSel txtNumFab
End Sub

Sub txtNumFab_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 115 Then
    frmFabricants.Show
  End If
  If KeyCode < 48 Or KeyCode > 57 Then KeyCode = 0
End Sub

Sub txtNumPro_Change ()
  bModif = 1
End Sub

Sub txtNumPro_GotFocus ()
  InitSel txtNumPro
End Sub

Sub txtNumPro_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 115 Then
    frmProduits.Show
  End If
  If KeyCode < 48 Or KeyCode > 57 Then KeyCode = 0
End Sub

Sub txtObs_Change ()
  bModif = 1
End Sub

Sub txtObs_GotFocus ()
  InitSel txtObs
End Sub

Sub txtRemarquesTerrain_Change ()
  bModif = 1
End Sub

Sub txtRemarquesTerrain_GotFocus ()
  InitSel txtRemarquesTerrain
End Sub

Sub txtTempAmbiance_Change ()
  bModif = 1
End Sub

Sub txtTempAmbiance_GotFocus ()
  InitSel txtTempAmbiance
End Sub

Sub txtTempProduit_Change ()
  bModif = 1
End Sub

Sub txtTempProduit_GotFocus ()
  InitSel txtTempProduit
End Sub

Sub txtTypeCRA_Change ()
  bModif = 1
End Sub

Sub txtTypeCRA_GotFocus ()
  InitSel txtTypeCRA
End Sub

