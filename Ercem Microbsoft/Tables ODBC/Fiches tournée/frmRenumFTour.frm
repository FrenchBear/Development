VERSION 5.00
Begin VB.Form frmRenumFTour 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Renumérotation d'une fiche tournée"
   ClientHeight    =   855
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   855
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   3420
      TabIndex        =   5
      Tag             =   "Cliquez sur ce bouton pour fermet cette fenêtre sans changer le mot de passe."
      Top             =   465
      Width           =   1200
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   3420
      TabIndex        =   4
      Tag             =   "Cliquez sur ce bouton pour valider le changement de mot de passe."
      Top             =   60
      Width           =   1200
   End
   Begin VB.TextBox txtNouveauNuméro 
      Height          =   315
      Left            =   1920
      MaxLength       =   8
      TabIndex        =   3
      Top             =   420
      Width           =   1275
   End
   Begin VB.TextBox txtNumActuel 
      Height          =   315
      Left            =   1920
      MaxLength       =   8
      TabIndex        =   1
      Top             =   60
      Width           =   1275
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Nouveau numéro :"
      Height          =   210
      Left            =   60
      TabIndex        =   2
      Top             =   480
      Width           =   1755
   End
   Begin VB.Label lblNuméroActuel 
      AutoSize        =   -1  'True
      Caption         =   "Numéro &actuel :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   1500
   End
End
Attribute VB_Name = "frmRenumFTour"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmRenumFTour
' Dialogue de renumérotation de fiches tournée
' 22/02/2000 PV
' 28/12/2001 PV Maxlength à 8


Option Explicit

Private g_sFiche As String


Public Sub DoRenum(sFiche As String)
  g_sFiche = sFiche
  Show vbModal
End Sub

Private Sub Form_Activate()
  If ActiveControl Is txtNumActuel And txtNumActuel <> "" Then
    txtNouveauNuméro.SetFocus
  End If
End Sub

Private Sub Form_Load()
  If g_sFiche <> "" Then
    txtNumActuel = g_sFiche
    AutoSelect txtNumActuel, True
  End If
End Sub


Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnOK_Click()
  If txtNumActuel = "" Then
    MsgBox "Entrez le numéro actuel avant de cliquer sur Ok.", vbExclamation, App.Title
    txtNumActuel.SetFocus
    Exit Sub
  End If
  
  If txtNouveauNuméro = "" Then
    MsgBox "Entrez le nouveau numéro avant de cliquer sur Ok.", vbExclamation, App.Title
    txtNouveauNuméro.SetFocus
    Exit Sub
  End If
  
  Dim iNb As Integer
  iNb = BDCurseurExpress("select count(*) from ftour where ft_fiche=" & sFormToSQL(txtNumActuel, BDTypeCHAR))
  If iNb <> 1 Then
    MsgBox "No de fiche actuel inexistant.", vbExclamation, App.Title
    txtNumActuel.SetFocus
    AutoSelect txtNumActuel, True
    Exit Sub
  End If
  
  iNb = BDCurseurExpress("select count(*) from ftour where ft_fiche=" & sFormToSQL(txtNouveauNuméro, BDTypeCHAR))
  If iNb <> 0 Then
    MsgBox "Nouveau no de fiche déjà utilisé.", vbExclamation, App.Title
    txtNouveauNuméro.SetFocus
    AutoSelect txtNouveauNuméro, True
    Exit Sub
  End If
  
  ' On renumérote...
  Dim cst As New BDCurseur
  cst.OpenCurseur "select * from ftour where ft_fiche=" & sFormToSQL(txtNumActuel, BDTypeCHAR)
  Dim cd As New BDCurseur
  cd.OpenCurseur "select * from ftour where ft_fiche='@'"
  cd.AddNew
  cd!ft_fiche = txtNouveauNuméro
  cd!ft_region = cst!ft_region
  cd!ft_tournee = cst!ft_tournee
  cd!ft_comment = cst!ft_comment
  cd!ft_idmodif = sBDIdModif
  cd!TimeStamp = BDTime
  cd.Update
  cd.CloseCurseur
  
  Dim dBDTime As Date
  dBDTime = BDTime
  
  Dim cs As New BDCurseur
  cs.OpenCurseur "select * from dettour where dt_fiche=" & sFormToSQL(txtNumActuel, BDTypeCHAR)
  cd.OpenCurseur "select * from dettour where dt_fiche='@'"
  Do Until cs.EOF
    cd.AddNew

    cd!dt_fiche = txtNouveauNuméro
    cd!dt_numetb = cs!dt_numetb
    cd!dt_index = cs!dt_index
    cd!dt_variocolor = cs!dt_variocolor
    cd!dt_101 = cs!dt_101
    cd!dt_102 = cs!dt_102
    cd!dt_103 = cs!dt_103
    cd!dt_104 = cs!dt_104
    cd!dt_105 = cs!dt_105
    cd!dt_106 = cs!dt_106
    cd!dt_107 = cs!dt_107
    cd!dt_108 = cs!dt_108
    cd!dt_109 = cs!dt_109
    cd!dt_110 = cs!dt_110
    cd!dt_111 = cs!dt_111
    cd!dt_112 = cs!dt_112
    
    cd!dt_201 = cs!dt_201
    cd!dt_202 = cs!dt_202
    cd!dt_203 = cs!dt_203
    cd!dt_204 = cs!dt_204
    cd!dt_205 = cs!dt_205
    cd!dt_206 = cs!dt_206
    cd!dt_207 = cs!dt_207
    cd!dt_208 = cs!dt_208
    cd!dt_209 = cs!dt_209
    cd!dt_210 = cs!dt_210
    cd!dt_211 = cs!dt_211
    cd!dt_212 = cs!dt_212
    
    cd!dt_301 = cs!dt_301
    cd!dt_302 = cs!dt_302
    cd!dt_303 = cs!dt_303
    cd!dt_304 = cs!dt_304
    cd!dt_305 = cs!dt_305
    cd!dt_306 = cs!dt_306
    cd!dt_307 = cs!dt_307
    cd!dt_308 = cs!dt_308
    cd!dt_309 = cs!dt_309
    cd!dt_310 = cs!dt_310
    cd!dt_311 = cs!dt_311
    cd!dt_312 = cs!dt_312
    
    cd!dt_401 = cs!dt_401
    cd!dt_402 = cs!dt_402
    cd!dt_403 = cs!dt_403
    cd!dt_404 = cs!dt_404
    cd!dt_405 = cs!dt_405
    cd!dt_406 = cs!dt_406
    cd!dt_407 = cs!dt_407
    cd!dt_408 = cs!dt_408
    cd!dt_409 = cs!dt_409
    cd!dt_410 = cs!dt_410
    cd!dt_411 = cs!dt_411
    cd!dt_412 = cs!dt_412
    
    cd!dt_501 = cs!dt_501
    cd!dt_502 = cs!dt_502
    cd!dt_503 = cs!dt_503
    cd!dt_504 = cs!dt_504
    cd!dt_505 = cs!dt_505
    cd!dt_506 = cs!dt_506
    cd!dt_507 = cs!dt_507
    cd!dt_508 = cs!dt_508
    cd!dt_509 = cs!dt_509
    cd!dt_510 = cs!dt_510
    cd!dt_511 = cs!dt_511
    cd!dt_512 = cs!dt_512
    
    cd!dt_601 = cs!dt_601
    cd!dt_602 = cs!dt_602
    cd!dt_603 = cs!dt_603
    cd!dt_604 = cs!dt_604
    cd!dt_605 = cs!dt_605
    cd!dt_606 = cs!dt_606
    cd!dt_607 = cs!dt_607
    cd!dt_608 = cs!dt_608
    cd!dt_609 = cs!dt_609
    cd!dt_610 = cs!dt_610
    cd!dt_611 = cs!dt_611
    cd!dt_612 = cs!dt_612
    
    cd!dt_701 = cs!dt_701
    cd!dt_702 = cs!dt_702
    cd!dt_703 = cs!dt_703
    cd!dt_704 = cs!dt_704
    cd!dt_705 = cs!dt_705
    cd!dt_706 = cs!dt_706
    cd!dt_707 = cs!dt_707
    cd!dt_708 = cs!dt_708
    cd!dt_709 = cs!dt_709
    cd!dt_710 = cs!dt_710
    cd!dt_711 = cs!dt_711
    cd!dt_712 = cs!dt_712
    
    cd!dt_comment = cs!dt_comment
    cd!dt_idmodif = sBDIdModif
    cd!TimeStamp = dBDTime
    cd.Update

    cs.Delete
    cs.MoveNext
  Loop
  cd.CloseCurseur
  cs.CloseCurseur

  cst.Delete
  cst.CloseCurseur


  ' On affiche la nouvelle fiche
  Dim sNN As String
  sNN = txtNouveauNuméro
  Unload Me
  ' On ne peut pas afficher une feuille non modale tant qu'une feuille modale
  ' reste affichée
  frmFTour.AfficheFTour sNN
End Sub


