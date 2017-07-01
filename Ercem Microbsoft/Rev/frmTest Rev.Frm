VERSION 4.00
Begin VB.Form Form1 
   Caption         =   "Test de la classe REV"
   ClientHeight    =   7665
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   10800
   Height          =   8070
   Left            =   1080
   LinkTopic       =   "Form1"
   ScaleHeight     =   7665
   ScaleWidth      =   10800
   Top             =   1170
   Width           =   10920
   Begin VB.CommandButton Command1 
      Caption         =   "Test \|"
      Height          =   375
      Left            =   3240
      TabIndex        =   6
      Top             =   960
      Width           =   1335
   End
   Begin VB.CommandButton btnTestTab 
      Caption         =   "Test pro.rev t"
      Height          =   330
      Left            =   4710
      TabIndex        =   4
      Top             =   1485
      Width           =   1275
   End
   Begin VB.ListBox lstPro 
      Height          =   4740
      Left            =   3255
      TabIndex        =   2
      Top             =   2715
      Width           =   7410
   End
   Begin VB.CommandButton btnTestPro 
      Caption         =   "Test pro.rev s"
      Height          =   330
      Left            =   3240
      TabIndex        =   1
      Top             =   1875
      Width           =   1275
   End
   Begin VB.CommandButton btnTestRev 
      Caption         =   "Test Rev"
      Height          =   315
      Left            =   3240
      TabIndex        =   0
      Top             =   1485
      Width           =   1275
   End
   Begin MSComctlLib.ProgressBar pbar 
      Height          =   330
      Left            =   3255
      TabIndex        =   5
      Top             =   2310
      Width           =   7380
      _ExtentX        =   13018
      _ExtentY        =   582
      Appearance      =   1
      MouseIcon       =   "frmTest Rev.frx":0000
   End
   Begin VB.Label lblNbPro 
      Caption         =   "0 Produit"
      Height          =   225
      Left            =   4680
      TabIndex        =   3
      Top             =   1935
      Width           =   5970
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub btnTestPro_Click()
  Dim l As String
  Dim r As New Rev
  Dim iNbPro As Integer
  
  Dim pro_numpro As Integer
  Dim pro_etat As String, pro_nom As String, pro_critere As String, pro_comment As String
  Dim pro_datecreat, pro_heurecreat, pro_datemodif, pro_heuremodif
  Dim pro_t1 As Integer, pro_t2 As Integer, pro_t3 As Integer, pro_t4 As Integer, pro_t5 As Integer
  Dim TimeStamp As Date, pro_tsvalid, pro_opervalid
  
  lstPro.Clear
  Open "pro.rev" For Input As #1
  iNbPro = 0
  Dim tDebut, tFin
  pbar.Min = 0
  pbar.Max = 8707
  pbar.Value = 0
  tDebut = Timer
  While Not EOF(1)
    iNbPro = iNbPro + 1
    Line Input #1, l
    r.Buffer = l
    r.GetField pro_numpro, pro_etat, pro_nom, pro_critere, pro_comment, pro_datecreat, pro_heurecreat, pro_datemodif, pro_heuremodif, pro_t1, pro_t2, pro_t3, pro_t4, pro_t5, TimeStamp, pro_tsvalid, pro_opervalid
    lstPro.AddItem Format(pro_numpro, "##### ") & pro_nom
    If iNbPro Mod 250 = 0 Then
      tFin = Timer
      lblNbpro = iNbPro & " produits lus en " & Format(tFin - tDebut, "#0.00") & " s"
      pbar.Value = iNbPro
      lstPro.ListIndex = lstPro.ListCount - 1
      DoEvents
    End If
  Wend
  tFin = Timer
  Close #1
  lblNbpro = iNbPro & " produits lus en " & Format(tFin - tDebut, "#0.00") & " s"
  pbar.Value = iNbPro
  lstPro.ListIndex = lstPro.ListCount - 1
End Sub

Private Sub btnTestRev_Click()
  Dim l As New Rev
  
  ' Ligne simple
  l.AddField 10, 1003.14, 3.14159265358979, "Hello"
  l.AddField Chr$(34) + "Guillemets" + Chr$(34)
  l.AddField "[Crochets]"
  l.AddField #2/26/65#, #2/26/65 8:40:00 AM#, True
  Print l.Buffer
  
  Dim i As Integer, i2 As Integer, f As Single, d As Double, s1 As String, s2 As String, s3 As String
  Dim d1 As Date, d2 As Date, b As Boolean
  Dim iStatus As Integer
  iStatus = l.iGetField(i, f, d, s1, s2, s3, d1, d2, b)
  
  If iStatus <> 9 Then Stop
  
  ' Contrôle
  If i <> 10 Then Stop
  If f <> 1003.14 Then Stop
  If d <> 3.14159265358979 Then Stop
  If s1 <> "Hello" Then Stop
  If s2 <> Chr$(34) + "Guillemets" + Chr$(34) Then Stop
  If s3 <> "[Crochets]" Then Stop
  If d1 <> #2/26/65# Then Stop
  If d2 <> #2/26/65 8:40:00 AM# Then Stop
  If Not b Then Stop
  
  ' Deux tableaux
  Dim j(1 To 7)
  j(1) = "Lundi"
  j(2) = "Mardi"
  j(3) = "Mercredi"
  j(4) = "Jeudi"
  j(5) = "Vendredi"
  j(6) = "Samedi"
  j(7) = "Dimanche"
  
  Dim r(1 To 3, 1 To 5)
  r(1, 1) = 31834
  r(1, 2) = "DARNE DE SAUMON CUITE FROIDE"
  r(1, 3) = #7/31/96#
  r(1, 4) = #7/31/96 3:00:42 PM#
  r(1, 5) = True
  r(2, 1) = 31835
  r(2, 2) = "VIANDE DE BOEUF CUITE EN SALADE ASSAISONNÉE"
  r(2, 3) = #8/1/96#
  r(2, 4) = #7/31/96 3:01:08 PM#
  r(2, 5) = False
  r(3, 1) = 31836
  r(3, 2) = "ABVT1 BROCHETTE DE POISSON (D)"
  r(3, 3) = #8/2/96#
  r(3, 4) = #7/31/96 5:00:00 PM#
  r(3, 5) = Null

  l.Clear
  l.AddField "Tableau des jours", j(), 12, r(), "Fin du tableau"
  Print l.Buffer
  For i = 1 To l.BufferTabCount()
    Print l.BufferTab(i)
  Next
  
  ' Contrôle
  Dim j2(), r2()
  Dim t1 As String, t2 As String, douze As Integer
  Dim l2 As New Rev
  
  l2.Clear
  l2.Buffer = l.Buffer
  For i = 1 To l.BufferTabCount()
    l2.AddBufferTab l.BufferTab(i)
  Next
  l2.GetField t1, j2(), douze, r2(), t2
  If t1 <> "Tableau des jours" Then Stop
  If douze <> 12 Then Stop
  If t2 <> "Fin du tableau" Then Stop
  
  For i = 1 To 7
    If j(i) <> j2(i) Then Stop
  Next
  For i = 1 To 3
    For i2 = 1 To 5
      If r(i, i2) <> r2(i, i2) Then Stop
  Next i2, i
  
  Print "Contrôles passés avec succès !"
End Sub

Private Sub btnTestTab_Click()
  Dim l As String
  Dim r As New Rev
  Dim iNbPro As Integer
  
  Dim pro_numpro As Integer
  Dim pro_etat As String, pro_nom As String, pro_critere As String, pro_comment As String
  Dim pro_datecreat, pro_heurecreat, pro_datemodif, pro_heuremodif
  Dim pro_t1 As Integer, pro_t2 As Integer, pro_t3 As Integer, pro_t4 As Integer, pro_t5 As Integer
  Dim TimeStamp As Date, pro_tsvalid, pro_opervalid
  
  lstPro.Clear
  Open "pro.rev" For Input As #1
  iNbPro = 0
  Dim tDebut, tFin
  tDebut = Timer
  r.Buffer = "{2;8707;19}|{8707}|"
  Set r.pbar = pbar
  While Not EOF(1)
    iNbPro = iNbPro + 1
    Line Input #1, l
    r.AddBufferTab l
    
    If iNbPro Mod 1000 = 0 Then
      tFin = Timer
      lblNbpro = iNbPro & " produits lus en " & Format(tFin - tDebut, "#0.00") & " s"
      lblNbpro.Refresh
    End If
  Wend
  lblNbpro = iNbPro & " produits lus en " & Format(tFin - tDebut, "#0.00") & " s"
  lblNbpro.Refresh
  
  Dim t(), i As Integer
  r.GetField t()
  For i = 1 To UBound(t, 1)
    lstPro.AddItem Format(t(i, 1), "##### ") & t(i, 2)
  Next
  tFin = Timer
  Close #1
  lblNbpro = iNbPro & " produits lus en " & Format(tFin - tDebut, "#0.00") & " s"
End Sub

Private Sub Command1_Click()
  Dim br As New Rev
  br.Buffer = Chr(34) & "fiche 676\|oa" & Chr(34) & "|"
  Dim s As String
  br.GetField s
  Print s
End Sub
