VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmAjoutFT 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Ajout d'une fiche tournée"
   ClientHeight    =   2370
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8775
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAjouteFT.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2370
   ScaleWidth      =   8775
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox chkInclureExErcem 
      Caption         =   "&Inclure les établissements Ex-Ercem"
      Height          =   210
      Left            =   4140
      TabIndex        =   4
      Top             =   240
      Value           =   1  'Checked
      Width           =   4395
   End
   Begin VB.CheckBox chkInclureExFimebio 
      Caption         =   "&Inclure les établissements Ex-Fimebio"
      Height          =   210
      Left            =   4140
      TabIndex        =   5
      Top             =   480
      Value           =   1  'Checked
      Width           =   4335
   End
   Begin VB.TextBox txtPersonne 
      Height          =   315
      Left            =   1560
      MaxLength       =   4
      TabIndex        =   7
      Tag             =   "Entrez le n° de personne. F4 pour une recherche."
      Top             =   780
      Width           =   960
   End
   Begin VB.TextBox txtNomPersonne 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2880
      Locked          =   -1  'True
      TabIndex        =   11
      TabStop         =   0   'False
      Top             =   780
      Width           =   5835
   End
   Begin VB.TextBox txtUnité 
      Height          =   315
      Left            =   1560
      MaxLength       =   4
      TabIndex        =   9
      Tag             =   "Entrez le n° d'unité. F4 pour une recherche."
      Top             =   1140
      Width           =   960
   End
   Begin VB.TextBox txtNomUnité 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2880
      Locked          =   -1  'True
      TabIndex        =   13
      TabStop         =   0   'False
      Top             =   1140
      Width           =   5835
   End
   Begin VB.CommandButton btnUtilisateur 
      Height          =   330
      Left            =   2520
      Picture         =   "frmAjouteFT.frx":014A
      Style           =   1  'Graphical
      TabIndex        =   10
      Tag             =   "Cliquer pour rechercher un code utilisateur."
      ToolTipText     =   "Cliquer pour rechercher un code utilisateur."
      Top             =   780
      Width           =   315
   End
   Begin VB.CommandButton btnUnité 
      Height          =   330
      Left            =   2520
      Picture         =   "frmAjouteFT.frx":0294
      Style           =   1  'Graphical
      TabIndex        =   12
      Tag             =   "Cliquer pour rechercher un code unité."
      ToolTipText     =   "Cliquer pour rechercher un code unité."
      Top             =   1140
      Width           =   315
   End
   Begin VB.ComboBox cboMois 
      Height          =   330
      Left            =   1560
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   420
      Width           =   1875
   End
   Begin VB.TextBox txtFT 
      Height          =   315
      Left            =   1560
      MaxLength       =   8
      TabIndex        =   1
      Top             =   60
      Width           =   975
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   3420
      TabIndex        =   15
      Top             =   1620
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   1980
      TabIndex        =   14
      Top             =   1620
      Width           =   1350
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   5340
      TabIndex        =   16
      Top             =   1620
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   17
      Top             =   2055
      Width           =   8775
      _ExtentX        =   15478
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
   Begin VB.Label lblPersonne 
      AutoSize        =   -1  'True
      Caption         =   "&Personne :"
      Height          =   210
      Left            =   60
      TabIndex        =   6
      Top             =   840
      Width           =   1035
   End
   Begin VB.Label lblUnité 
      AutoSize        =   -1  'True
      Caption         =   "&Unité :"
      Height          =   210
      Left            =   60
      TabIndex        =   8
      Top             =   1200
      Width           =   630
   End
   Begin VB.Label lblMois 
      AutoSize        =   -1  'True
      Caption         =   "&Mois :"
      Height          =   210
      Left            =   60
      TabIndex        =   2
      Top             =   480
      Width           =   555
   End
   Begin VB.Label lblFT 
      AutoSize        =   -1  'True
      Caption         =   "&Fiche tournée :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   1425
   End
End
Attribute VB_Name = "frmAjoutFT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmAjouteFT
' Ajout de fiches tournées complètes
' 17/08/1999 PV
' 17/12/1999 PV Internationalisation
' 10/03/2000 PV Gestion de 7 champs de détail
'  2/10/2000 PV Récup des infos supplémentaires de la table établissement (etb_avispassage , etb_decoupage, etb_facncp, etb_facndp, etb_fact, etb_labo)
' 21/11/2000 PV chkInclureExErcem
'  8/03/2001 PV -pla_facncp, -pla_facndp, -pla_fact, -pla_etatlabo mais proto inchangé


Option Explicit

Private po As Intervention

Public Sub AfficheFeuille(p As Intervention)
  Set po = p
  
  If po.pla_pers > 0 Then
    txtPersonne = po.pla_pers
    txtPersonne.SelStart = 0
    txtPersonne.SelLength = 99
    txtPersonne_LostFocus
  Else
    txtPersonne = ""
  End If

  txtNomUnité = ""
  If po.pla_unite > 0 Then
    txtUnité = po.pla_unite
    txtUnité.SelStart = 0
    txtUnité.SelLength = 99
    txtUnité_LostFocus
  Else
    txtUnité = ""
  End If

  Show vbModal
End Sub


Private Sub btnAide_Click()
  Aide "frmajft"
End Sub

Private Sub btnAnnuler_Click()
  Me.Hide
End Sub


Private Sub btnOK_Click()
  If bBlocageEnCours Then Beep: Exit Sub

  If Not bCheckPersonne(True) Then Exit Sub
  If Not bCheckUnité(True) Then Exit Sub

  Dim br As New Rev
  br.Clear
  br.AddField txtFT
  br.AddField cboMois.ListIndex + 1

  ' On lit d'abord toute la fiche dans une collection, car on ne peut pas recevoir et envoyer simultanément des
  ' infos au démon msd
  Dim colDT As New Collection
  Dim dt As Dettour

  Bloquer
    tcps.Envoie "LDT " & br.Buffer
    Dim sLigne As String
    Dim sNumEtb As String, sVariocolor As String, sComment As String
    Dim s1xx As String, s2xx As String, s3xx As String, s4xx As String, s5xx As String, s6xx As String, s7xx As String
    Dim iNb1 As Integer, iNb2 As Integer, iNb3 As Integer, iNb4 As Integer, iNb5 As Integer, iNb6 As Integer, iNb7 As Integer

    Do
      sLigne = tcps.Reçoit
      If Left(sLigne, 2) = "->" Then Exit Do

      br.Buffer = sLigne
      
      br.GetField sNumEtb, sVariocolor, sComment, s1xx, s2xx, s3xx, s4xx, s5xx, s6xx, s7xx
      Set dt = New Dettour
      With dt
        .dt_numetb = sNumEtb
        .dt_variocolor = sVariocolor
        .dt_comment = sComment
        
        iNb1 = 0
        If s1xx <> "" Then
          If Mid(s1xx, 2, 1) = "+" Then
            iNb1 = Val(Left(s1xx, 1)) + Val(Right(s1xx, 1))
          Else
            iNb1 = Val(s1xx)
          End If
        End If
        .dt_1xx = iNb1
        
        If IsNumeric(s2xx) Then
          iNb2 = Val(s2xx)
        ElseIf s2xx <> "" Then
          iNb2 = 1
        Else
          iNb2 = 0
        End If
        .dt_2xx = iNb2
        
        If IsNumeric(s3xx) Then
          iNb3 = Val(s3xx)
        ElseIf s3xx <> "" Then
          iNb3 = 1
        Else
          iNb3 = 0
        End If
        .dt_3xx = iNb3
        
        If IsNumeric(s4xx) Then
          iNb4 = Val(s4xx)
        ElseIf s4xx <> "" Then
          iNb4 = 1
        Else
          iNb4 = 0
        End If
        .dt_4xx = iNb4
        
        If IsNumeric(s5xx) Then
          iNb5 = Val(s5xx)
        ElseIf s5xx <> "" Then
          iNb5 = 1
        Else
          iNb5 = 0
        End If
        .dt_5xx = iNb5
        
        If IsNumeric(s6xx) Then
          iNb6 = Val(s6xx)
        ElseIf s6xx <> "" Then
          iNb6 = 1
        Else
          iNb6 = 0
        End If
        .dt_6xx = iNb6
        
        If IsNumeric(s7xx) Then
          iNb7 = Val(s7xx)
        ElseIf s7xx <> "" Then
          iNb7 = 1
        Else
          iNb7 = 0
        End If
        .dt_7xx = iNb7
      End With
      
      If iNb1 + iNb2 + iNb3 + iNb4 + iNb5 + iNb6 + iNb7 > 0 Then colDT.Add dt
      Set dt = Nothing
    Loop
  Relâcher

  If colDT.count = 0 Then
    MsgBox "Fiche tournée inexistante, ou aucun établissement à ajouter pour le mois sélectionné.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim bProblème As Integer
  bProblème = False
  
  Dim p As Intervention
  Dim e As Etablissement
  
  For Each dt In colDT
    Set e = LireEtablissement(dt.dt_numetb, True)
    
    If Not e Is Nothing Then    ' Sécurité si établissement inexistant ou pb autre
      Set p = New Intervention
      
      p.pla_systeme = po.pla_systeme
      p.pla_serie = po.pla_serie
      p.pla_iref = Null
      p.pla_lettres = po.pla_lettres
      p.pla_dateplan = po.pla_dateplan
      p.pla_pers = po.pla_pers
      p.pla_unite = po.pla_unite
      p.pla_etb = dt.dt_numetb
      p.pla_comment = dt.dt_comment
      p.pla_nbab = Val(dt.dt_1xx)
      p.pla_nbeh = Val(dt.dt_2xx)
      p.pla_nbbs = Val(dt.dt_3xx)
      p.pla_nbli = Val(dt.dt_4xx)
      p.pla_nbfs = Val(dt.dt_5xx)
      p.pla_nbhu = Val(dt.dt_6xx)
      p.pla_nbch = Val(dt.dt_7xx)
      p.etb_prefixe = e.etb_prefixe
      p.etb_nom = e.etb_nom
      p.etb_proprio = e.etb_proprio
      ' 10/04/1998
      p.pla_harrivee = Null
      p.pla_hdepart = Null
      p.pla_typeprest = Null
      p.pla_activite = Null
      p.pla_client = ""
      ' 18/03/1999
      p.pla_dateorigine = Null
      ' 25/09/2000 PV
      p.pla_datevalid = Null
      p.pla_opervalid = Null
      ' 2/10/2000 PV
      p.pla_avispassage = NV(e.etb_avispassage)
      p.pla_decoupage = NV(e.etb_decoupage)
      p.pla_labo = NV(e.etb_labo_ajusté)
      ' 31/10/2000 PV
      p.pla_refcom = NV(e.etb_refcom)
      p.pla_fpstandard = NV(e.etb_fpstandard)
      ' 27/11/2000 PV
      p.pla_etatfac = Null
      ' 17/1/1 PV
      p.pla_labab = Null
      p.pla_labbs = Null
      p.pla_labch = Null
      p.pla_labli = Null
      p.pla_labfs = Null
      p.pla_labhu = Null
      
      If Not frmAjoutIntervention.bContrôlesSpécifiquesFrance(e, po.pla_dateplan) Then
        bProblème = True
      Else
        If chkInclureExFimebio And bIsEtbFimebio(e.etb_numetb) Then p.pla_serie = EcritPlanning(p)
        If chkInclureExErcem And bIsEtbErcem(e.etb_numetb) Then p.pla_serie = EcritPlanning(p)
      End If
    End If

    Set p = Nothing
  Next
  
  If bProblème Then
    MsgBox "Attention - Des erreurs ont été rencontrées, tous les établissements de la fiche tournée n'ont pas été ajoutés.", vbExclamation, App.Title
  End If
  
  frmPlanning.dDateCourante = #1/1/1980#    ' sinon optimisation d'affichage
  frmPlanning.tvPlanning_Click
  
  Me.Hide
End Sub


Private Sub Form_Load()
  Internationalisation
 
  Dim i As Integer
  For i = 1 To 12
    cboMois.AddItem Format(DateSerial(2000, i, 1), "mm mmmm")
  Next
  cboMois.ListIndex = Month(frmPlanning.dDateCourante) - 1
End Sub



Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag

  On Error GoTo FinGotFocus
  ActiveControl.SelStart = 0
  ActiveControl.SelLength = 100
  
FinGotFocus:
End Sub

Private Sub Label1_Click()

End Sub

Private Sub txtFT_GotFocus(): GotFocus: End Sub
Private Sub cboMois_GotFocus(): GotFocus: End Sub
Private Sub txtPersonne_GotFocus(): GotFocus: End Sub
Private Sub txtUnité_GotFocus(): GotFocus: End Sub

Private Sub btnUtilisateur_GotFocus(): GotFocus: End Sub
Private Sub btnUnité_GotFocus(): GotFocus: End Sub

Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub


'======================================================================

Private Sub RecherchePersonne()
  Dim u As Utilisateur
  Set u = frmRechercheUtilisateur.Cherche()
  If Not u Is Nothing Then
    txtPersonne = u.uti_numuti
    txtNomPersonne = u.uti_nom
    If txtUnité = "" Then
      txtUnité = u.uti_unite
      bCheckUnité False
    End If
    txtPersonne.SelStart = 0
    txtPersonne.SelStart = 99
    txtPersonne.SetFocus
  End If
End Sub

Private Sub txtPersonne_Change()
  txtNomPersonne = ""
End Sub

Private Sub txtPersonne_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then RecherchePersonne
End Sub

Private Sub txtPersonne_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc("/") Then
    KeyAscii = 0
    RecherchePersonne
  End If
End Sub

Private Sub txtPersonne_LostFocus()
  If bCheckPersonne(False) Or txtPersonne = "" Then
    txtPersonne.ForeColor = &H80000008
  Else
    txtPersonne.ForeColor = &HFF&
  End If
End Sub

Private Function bCheckPersonne(bMessage As Boolean) As Boolean
  bCheckPersonne = False
  
  If txtPersonne = "" Then
    txtNomPersonne = ""
    If bMessage Then MsgBox2i "PL016": txtPersonne.SetFocus
                      'MsgBox2 "La personne doit être définie", "PL016": txtPersonne.SetFocus
    Exit Function
  End If
  If Not IsNumeric(txtPersonne) Then
    txtNomPersonne = ""
    If bMessage Then
      MsgBox2i "CO004", txtPersonne
      'MsgBox2 "Personne incorrecte", "PL017"
      txtPersonne.SetFocus
    End If
    Exit Function
  End If
  
  Dim u As Utilisateur
  Set u = UtiParNuméro(txtPersonne)
  If u Is Nothing Then
    txtNomPersonne = ""
    If bMessage Then MsgBox2i "CO005", txtPersonne
      txtPersonne.SetFocus
                      'MsgBox2 "Personne inexistante", "PL017": txtPersonne.SetFocus
    Exit Function
  End If
  
  txtNomPersonne = u.uti_nom
  bCheckPersonne = True
  
  If txtUnité = "" Then
    txtUnité = NV(u.uti_unite)
    bCheckUnité False
  End If
End Function



'======================================================================

Private Sub RechercheUnité()
  Dim u As Unite
  Set u = frmRechercheUnité.Cherche()
  If Not u Is Nothing Then
    txtUnité = u.uni_numunite
    txtNomUnité = u.uni_code & " " & u.uni_titre
    txtUnité.SelStart = 0
    txtUnité.SelLength = 99
    txtUnité.SetFocus
  End If
End Sub

Private Sub txtUnité_Change()
  txtNomUnité = ""
End Sub

Private Sub txtUnité_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then RechercheUnité
End Sub

Private Sub txtUnité_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc("/") Then
    KeyAscii = 0
    RechercheUnité
  End If
End Sub

Private Sub txtUnité_LostFocus()
  If bCheckUnité(False) Or txtUnité = "" Then
    txtUnité.ForeColor = &H80000008
  Else
    txtUnité.ForeColor = &HFF&
  End If
End Sub

Private Function bCheckUnité(bMessage As Boolean) As Boolean
  bCheckUnité = False
  
  If txtUnité = "" Then
    txtNomUnité = ""
    If bMessage Then MsgBox2i "PL018": txtUnité.SetFocus
                    'MsgBox2 "L'unité doit être définie", "PL018": txtUnité.SetFocus
    Exit Function
  End If
  If Not IsNumeric(txtUnité) Then
    txtNomUnité = ""
    If bMessage Then MsgBox2i "CO004", txtUnité
      txtUnité.SetFocus
                    'MsgBox2 "Unité incorrecte", "PL019"
    Exit Function
  End If
  
  Dim u As Unite
  Set u = UniParNuméro(txtUnité)
  If u Is Nothing Then
    txtNomUnité = ""
    If bMessage Then MsgBox2i "CO005", txtUnité
      txtUnité.SetFocus
                    'MsgBox2 "Unité inexistante", "PL019": txtUnité.SetFocus
    Exit Function
  End If
  
  txtNomUnité = u.uni_code & " " & u.uni_titre
  bCheckUnité = True
End Function


'======================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "ATCaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  SetLib lblFT, "Caption", "ATlblFT"
  SetLib txtFT, "Tag", "ATtxtFT.tag"
  
  SetLib lblMois, "Caption", "ATlblMois"
  SetLib cboMois, "Tag", "ATcboMois.tag"
  
  SetLib chkInclureExFimebio, "Caption", "ATlblEtbFim"
  SetLib chkInclureExFimebio, "Tag", "ATchkEtbFim.tag"
  SetLib chkInclureExErcem, "Caption", "ATlblEtbErc"
  SetLib chkInclureExErcem, "Tag", "ATchkEtbErc.tag"
  
  SetLib lblPersonne, "Caption", "ATlblPersonne"
  SetLib txtPersonne, "Tag", "ATtxtPersonne.tag"
  SetLib btnUtilisateur, "Tag", "ATbtnUtilisateur.tag"
  SetLib btnUtilisateur, "ToolTipText", "ATbtnUtilisateur.tag"
  
  SetLib lblUnité, "Caption", "ATlblUnité"
  SetLib txtUnité, "Tag", "ATtxtUnité.tag"
  SetLib btnUnité, "Tag", "ATbtnUnité.tag"
  SetLib btnUnité, "ToolTipText", "ATbtnUnité.tag"
End Sub

