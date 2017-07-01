VERSION 5.00
Begin VB.Form frmAccueilNFT 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Accueil NFT"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnNouveau 
      Caption         =   "3B15"
      Height          =   495
      Left            =   2760
      TabIndex        =   0
      Top             =   360
      Width           =   1215
   End
End
Attribute VB_Name = "frmAccueilNFT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Accueil NFT
' 10/08/1999 PV

Option Explicit

Private Sub btnNouveau_Click()
  Const sFiche As String = "3B15"
  frmNFT.Show
  
  Dim cFT As New BDCurseur
  cFT.OpenCurseur "select * from ftour where ft_fiche='" & sFiche & "'"
  frmNFT.ft_fiche = cFT!ft_fiche
  frmNFT.ft_région = cFT!ft_region
  frmNFT.ft_tournée = cFT!ft_tournee
  frmNFT.ft_comment = cFT!ft_comment
  cFT.CloseCurseur
  
  Dim cDT As New BDCurseur
  cDT.OpenCurseur "select dettour.*,etb_prefixe,etb_nom from dettour,etablissement where dt_numetb=etb_numetb and dt_fiche='" & sFiche & "'"
  Do Until cDT.EOF
    frmNFT.AjouteDétail cDT!dt_numetb, NV(cDT!dt_variocolor), cDT!etb_prefixe, cDT!etb_nom
  
    cDT.MoveNext
  Loop
  cDT.CloseCurseur
  
End Sub
