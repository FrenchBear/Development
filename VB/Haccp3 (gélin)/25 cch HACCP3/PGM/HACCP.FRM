VERSION 2.00
Begin Form frmHACCP 
   Caption         =   "ERCEM System / HACCP"
   ClientHeight    =   5730
   ClientLeft      =   480
   ClientTop       =   1875
   ClientWidth     =   7200
   ClipControls    =   0   'False
   FontBold        =   -1  'True
   FontItalic      =   0   'False
   FontName        =   "MS Sans Serif"
   FontSize        =   9.75
   FontStrikethru  =   0   'False
   FontUnderline   =   0   'False
   Height          =   6420
   Icon            =   HACCP.FRX:0000
   Left            =   420
   LinkTopic       =   "Feuille1"
   ScaleHeight     =   5730
   ScaleWidth      =   7200
   Top             =   1245
   Width           =   7320
   Begin CommonDialog dlg 
      Left            =   0
      Top             =   0
   End
   Begin CommandButton cmdExt 
      Caption         =   "è"
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "Wingdings"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   300
      Index           =   0
      Left            =   1080
      TabIndex        =   13
      Top             =   5280
      Visible         =   0   'False
      Width           =   300
   End
   Begin TextBox dde 
      BackColor       =   &H00FFFF80&
      Height          =   375
      Left            =   4560
      LinkTimeout     =   150
      MultiLine       =   -1  'True
      TabIndex        =   10
      Top             =   4920
      Visible         =   0   'False
      Width           =   1215
   End
   Begin TextBox txtTitre 
      Alignment       =   2  'Center
      BorderStyle     =   0  'None
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   12
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   675
      Left            =   3720
      MultiLine       =   -1  'True
      TabIndex        =   9
      Top             =   60
      Width           =   1215
   End
   Begin CommandButton cmdOte 
      Caption         =   "-"
      Height          =   300
      Index           =   0
      Left            =   600
      TabIndex        =   8
      Top             =   5280
      Width           =   300
   End
   Begin TextBox txtBas 
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "Arial"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      ForeColor       =   &H00FFFFFF&
      Height          =   1815
      Index           =   0
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   7
      Top             =   2880
      Width           =   1455
   End
   Begin CommandButton cmdAjoute 
      Caption         =   "+"
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   300
      Index           =   0
      Left            =   120
      TabIndex        =   6
      Top             =   5280
      Width           =   300
   End
   Begin ListBox lstHaut 
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "Arial"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   450
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   960
      Width           =   1455
   End
   Begin Label lblHaut 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFF00&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Eléments de preuve"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "Arial Narrow"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   540
      Index           =   6
      Left            =   1680
      TabIndex        =   12
      Top             =   3840
      Width           =   1695
   End
   Begin Label lblHaut 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFF00&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Eléments de sur- veillance"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "Arial Narrow"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   540
      Index           =   5
      Left            =   1680
      TabIndex        =   11
      Top             =   3240
      Width           =   1695
   End
   Begin Label lblHaut 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFF00&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mesures préventives"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "Arial Narrow"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   540
      Index           =   4
      Left            =   1680
      TabIndex        =   5
      Top             =   2640
      Width           =   1695
   End
   Begin Label lblHaut 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFF00&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Points de maîtrise"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "Arial Narrow"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   540
      Index           =   3
      Left            =   1680
      TabIndex        =   4
      Top             =   2040
      Width           =   1695
   End
   Begin Label lblHaut 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFF00&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Dangers"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "Arial Narrow"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   540
      Index           =   2
      Left            =   1680
      TabIndex        =   3
      Top             =   1440
      Width           =   1695
   End
   Begin Label lblHaut 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFF00&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Produits"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "Arial Narrow"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   540
      Index           =   1
      Left            =   1680
      TabIndex        =   2
      Top             =   840
      Width           =   1695
   End
   Begin Label lblHaut 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFF00&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Etapes"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "Arial Narrow"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   540
      Index           =   0
      Left            =   1680
      TabIndex        =   1
      Top             =   240
      Width           =   1695
   End
   Begin Menu mnuFichier 
      Caption         =   "&Fichier"
      Begin Menu cmdNouveau 
         Caption         =   "&Nouveau..."
         Shortcut        =   ^N
      End
      Begin Menu cmdOuvrir 
         Caption         =   "&Ouvrir..."
         Shortcut        =   ^O
      End
      Begin Menu cmdSupprimer 
         Caption         =   "&Supprimer..."
      End
      Begin Menu cmdTiret0 
         Caption         =   "-"
      End
      Begin Menu cmdOptions 
         Caption         =   "O&ptions..."
      End
      Begin Menu cmdTiret1 
         Caption         =   "-"
      End
      Begin Menu cmdDocExterne 
         Caption         =   "Document à &imprimer"
         Shortcut        =   ^P
      End
      Begin Menu cmdTiret1b 
         Caption         =   "-"
      End
      Begin Menu cmdExporter 
         Caption         =   "&Exporter..."
      End
      Begin Menu cmdImporter 
         Caption         =   "I&mporter..."
      End
      Begin Menu cmdTiret2 
         Caption         =   "-"
      End
      Begin Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin Menu mnuEdition 
      Caption         =   "&Edition"
      Begin Menu cmdAjouteMenu 
         Caption         =   "&Ajoute..."
      End
      Begin Menu cmdAjouteAvantMenu 
         Caption         =   "Ajoute a&vant..."
      End
      Begin Menu cmdEdite 
         Caption         =   "&Edite..."
      End
      Begin Menu cmdOteMenu 
         Caption         =   "&Supprime..."
      End
      Begin Menu Tiret3b 
         Caption         =   "-"
      End
      Begin Menu cmdExtensionMenu 
         Caption         =   "E&xtension..."
      End
   End
   Begin Menu mnuDocumentation 
      Caption         =   "&Documentation"
   End
   Begin Menu mnuAide 
      Caption         =   "&?"
      Begin Menu cmdAide 
         Caption         =   "Sommaire de l'aide"
         Index           =   1
      End
      Begin Menu cmdAide 
         Caption         =   "Présentation générale"
         Index           =   2
         Shortcut        =   {F1}
      End
      Begin Menu cmdTiret4 
         Caption         =   "-"
      End
      Begin Menu cmdAbout 
         Caption         =   "&A propos de..."
      End
   End
End
Option Explicit

Dim DocWord As object     ' Génération du document via Ole Automation

Dim bTitreModifié As Integer

Const MAXELEMENTS = 25

Dim tabElément(NIV, MAXELEMENTS, 3)
' 0: titre
' 1: texte
' 2: niveau
' 3: extension

Dim curElément(7) As Integer
Dim nbElément(7) As Integer

Dim sTable As String

Const DB_SYSTEMOBJECT = &H80000002

Dim sRepDéfaut As String  ' Répertoire par défaut
Dim iFmtExt As Integer    ' Format externe
' 0: Word 2
' 1: Word 6
' 2: Fichier texte brut
' 3: Fichier texte + styles

Dim GShift As Integer     ' Etat su shift lors de l'ajout

Dim bConfirme As Integer  ' Confirmation de l'exécution des extensions

Sub AfficheBasElément (e)
  Dim n, t
  n = tabElément(e, curElément(e), 2)
  If IsNull(n) Then n = 0
  ColorBox txtBas(e), n
  t = tabElément(e, curElément(e), 1)
  If IsNull(t) Then t = ""
  txtBas(e) = t
  If tabElément(e, curElément(e), 3) <> "" Then
    cmdExt(e).Visible = True
  Else
    cmdExt(e).Visible = False
  End If
End Sub

Sub AfficheElément (e As Integer)
  LitElément (e)
  AfficheHautElément (e)
End Sub

Sub AfficheHautElément (e As Integer)
  Dim i As Integer

  lstHaut(e).Clear
  For i = 1 To nbElément(e)
    lstHaut(e).AddItem Format(i) & " " & tabElément(e, i, 0)
  Next
  'DoEvents
  If nbElément(e) > 0 Then
    lstHaut(e).ListIndex = curElément(e) - 1
  Else
    lstHaut_click (e)
  End If
  lstHaut(e).Refresh
  lstHaut_change (e)
End Sub

Sub BDInsère (e As Integer, R As Integer, Tit As String, txt As String, ext As String, NIV As Integer)
  Dim t As Table, sql As String
  Dim i As Integer

  sql = "update " & sTable & " set i" & Format(e) & "=i" & Format(e) & "+1 where "
  For i = 0 To e - 1
    If i > 0 Then sql = sql & "and "
    sql = sql & "i" & Format(i) & "=" & Format(curElément(i)) & " "
  Next
  If i > 0 Then sql = sql & "and "
  sql = sql & "i" & Format(i) & ">=" & Format(R)

  db.Execute sql
  Set t = db.OpenTable(sTable)
  t.AddNew
  For i = 0 To e - 1
    t("i" & Format(i)) = curElément(i)
  Next
  t("i" & Format(e)) = R
  For i = e + 1 To 6
    t("i" & Format(i)) = 0
  Next
  t("titre") = Tit
  t("texte") = txt
  t("extension") = ext
  t("niveau") = NIV
  t.Update
  t.Close
End Sub

Sub BDSupprime (e As Integer, R As Integer)
  Dim sql As String
  Dim i As Integer

  sql = "delete from " & sTable & " where "
  For i = 0 To e
    If i > 0 Then sql = sql & "and "
    sql = sql & "i" & Format(i) & "=" & Format(curElément(i)) & " "
  Next
  db.Execute sql

  sql = "update " & sTable & " set i" & Format(e) & "=i" & Format(e) & "-1 where "
  For i = 0 To e - 1
    If i > 0 Then sql = sql & "and "
    sql = sql & "i" & Format(i) & "=" & Format(curElément(i)) & " "
  Next
  If i > 0 Then sql = sql & "and "
  sql = sql & "i" & Format(i) & ">" & Format(R)
  db.Execute sql

End Sub

Sub BDUpdate (e As Integer, R As Integer, Tit, txt, NIV, ext)
  Dim sql As String
  Dim i As Integer
  Dim s As dynaset

  sql = "select * from " & sTable & " where "
  For i = 0 To e
    If i > 0 Then sql = sql & "and "
    sql = sql & "i" & Format(i) & "=" & Format(curElément(i)) & " "
  Next
  For i = e + 1 To 6
    sql = sql & "and i" & Format(i) & "=0 "
  Next

  Set s = db.CreateDynaset(sql)
  s.Edit
  s("titre") = Tit
  s("texte") = Left(txt, 255)
  s("niveau") = NIV
  s("extension") = ext
  s.Update
  s.Close

End Sub

Sub cmdAbout_Click ()
  frmAbout.Show 1
End Sub

Sub cmdAide_Click (Index As Integer)
  ShowHelp Index
End Sub

Sub cmdAjoute_click (e As Integer)

  If e > 0 Then
    If nbElément(e - 1) = 0 Then
      MsgBox "Commencez par créer un élément de rang supérieur !"
      Exit Sub
    End If
  End If

  If nbElément(e) = MAXELEMENTS Then
    MsgBox "Nombre maximum d'éléments atteint !"
    Exit Sub
  End If

  If GShift = 1 And curElément(e) = 0 Then GShift = 0

  Dim Tit As String, txt As String, ext As String, NIV As Integer
  Dim bOk As Integer
  bOk = SaisieElément(e, Tit, txt, NIV, ext, 0, GShift)
  If Not bOk Then Exit Sub

  If GShift = 1 Then
    BDInsère e, curElément(e), Tit, txt, ext, NIV
  Else
    BDInsère e, curElément(e) + 1, Tit, txt, ext, NIV
    curElément(e) = curElément(e) + 1
  End If
  AfficheElément e
  
End Sub

Sub cmdAjoute_MouseDown (Index As Integer, Button As Integer, shift As Integer, x As Single, Y As Single)
  GShift = shift
End Sub

Sub cmdAjouteAvantMenu_Click ()
  Dim e As Integer
  GShift = 1
  e = iElementCourant()
  If e >= 0 Then cmdAjoute_click (e)
End Sub

Sub cmdAjouteMenu_Click ()
  Dim e As Integer
  GShift = 0
  e = iElementCourant()
  If e >= 0 Then cmdAjoute_click (e)
End Sub

Sub cmdDocExterne_Click ()
  GénereDocExterne
End Sub

Sub cmdEdite_Click ()
  Dim e As Integer
  e = iElementCourant()
  If e >= 0 Then EditeElément e, curElément(e), 0
End Sub

Sub cmdExporter_Click ()

  dlg.DefaultExt = "HAC"
  dlg.DialogTitle = "Exporter un projet " & sSujet
  dlg.Filename = sTable & ".HAC"
  dlg.Filter = "Projet " & sSujet & " (*.HAC)|*.HAC"
  dlg.FilterIndex = 1
  dlg.Flags = OFN_HIDEREADONLY Or OFN_OVERWRITEPROMPT Or OFN_SHOWHELP
  dlg.CancelError = True

  dlg.HelpFile = "HACCPPGM.HLP"
  dlg.HelpCommand = HELP_CONTEXT
  dlg.HelpContext = 31
  
  On Error Resume Next
  dlg.Action = 2

  If Err = 0 Then DoExporter dlg.Filename
End Sub

Sub cmdExt_click (e As Integer)
  Dim i As Integer, cmd

  If nbElément(e) = 0 Then Exit Sub
  cmd = tabElément(e, curElément(e), 3)
  If Not IsNull(cmd) Then
    If iBonRépertoire() < 0 Then Exit Sub
    i = InStr(cmd, "$")
    If i <> 0 Then cmd = Left(cmd, i - 1) & sRepDéfaut & Mid(cmd, i + 1)
    If bConfirme Then
      i = MsgBox("Commande à exécuter :" & Chr(10) & Chr(10) & cmd, 64 + 1)
    Else
      i = 1
    End If
    If i = 1 Then
      On Error Resume Next
      i = Shell(cmd, 1)
      If Err <> 0 Then MsgBox "Attention !" & Chr(10) & "Echec au lancement de la commande" & Chr(10) & cmd, 48
      On Error GoTo 0
    End If
  End If
End Sub

Sub cmdExtensionMenu_Click ()
  Dim e As Integer
  e = iElementCourant()
  If e >= 0 Then cmdExt_click (e)
End Sub

Sub cmdImporter_Click ()
  dlg.DefaultExt = "HAC"
  dlg.DialogTitle = "Importer un projet " & sSujet
  dlg.Filename = ""
  dlg.Filter = "Projet " & sSujet & " (*.HAC)|*.HAC"
  dlg.FilterIndex = 1
  dlg.Flags = OFN_FILEMUSTEXIST Or OFN_HIDEREADONLY Or OFN_SHOWHELP
  dlg.CancelError = True
  
  dlg.HelpFile = "HACCPPGM.HLP"
  dlg.HelpCommand = HELP_CONTEXT
  dlg.HelpContext = 32

  On Error Resume Next
  dlg.Action = 1

  If Err Then Exit Sub
  On Error GoTo 0
    
  If dlg.Filename <> "" Then
    Dim sTit As String, sTable As String
    Dim p As Integer

    ' On propose un nom de table par défaut en éliminant le chemin et
    ' le suffixe
    sTable = dlg.Filename
    Do
      p = InStr(sTable, "\")
      If p = 0 Then Exit Do
      sTable = Mid(sTable, p + 1)
    Loop
    p = InStr(sTable, ".")
    If p <> 0 Then sTable = Left(sTable, p - 1)

    sTit = sNomDeNouveauProjet(sTable)
    If sTit = "" Then Exit Sub
    DoImporter dlg.Filename, sTit
  End If
End Sub

Sub cmdNouveau_Click ()
  Dim Tit As String

  Tit = sNomDeNouveauProjet("")
  If Tit = "" Then Exit Sub
  CréeProjet Tit
  OuvreProjet Tit
  SauveOptions
End Sub

' Pour l'enregistrement 0,0,0,0,0,0
' titre     Titre du projet (txtTitre)
' extension Répertoire par défaut (sRepDéfaut)
' niveau    Format du document externe (iFmtExt)
Sub cmdOptions_Click ()
  frmOptions.lstFormat.ListIndex = iFmtExt
  frmOptions.txtRépertoire = sRepDéfaut
  frmOptions.chkConfirme = bConfirme
  frmOptions.Show 1
  If frmOptions.lstFormat.ListIndex < 0 Then Exit Sub
  
  sRepDéfaut = frmOptions.txtRépertoire
  iFmtExt = frmOptions.lstFormat.ListIndex
  SauveOptions
  If bConfirme <> frmOptions.chkConfirme Then
    Dim x As Integer
    bConfirme = frmOptions.chkConfirme
    x = WritePrivateProfileString("HACCP", "bConfirme", Format(bConfirme), sNomIni)
  End If

End Sub

Sub cmdOte_click (e As Integer)
  If curElément(e) > 0 Then
    Dim i As Integer
    If MsgBox("Voulez-vous réellement effacer cet élément ?", 1 + 48 + 256) = 1 Then
      BDSupprime e, curElément(e)
      AfficheElément e
    End If
  End If
End Sub

Sub cmdOteMenu_Click ()
  Dim e As Integer
  GShift = 0
  e = iElementCourant()
  If e >= 0 Then cmdOte_click (e)
End Sub

Sub cmdOuvrir_Click ()
  Dim i As Integer, s As String

  frmOuvrir.lstProjets.Clear
  For i = 0 To db.TableDefs.Count - 1
    If (db.TableDefs(i).Attributes And DB_SYSTEMOBJECT) = 0 Then
      If db.TableDefs(i).Name <> "Suggestions" Then frmOuvrir.lstProjets.AddItem db.TableDefs(i).Name
    End If
  Next
  frmOuvrir.mode = "0"    ' ouvrir
  frmOuvrir.Show 1
  If frmOuvrir.lblProjet <> "" Then
    s = frmOuvrir.lblProjet
    OuvreProjet s
  End If
End Sub

Sub CmdQuitter_Click ()
  Unload frmHACCP
  Unload frmAbout
End Sub

Sub CMDSupprimer_Click ()
  Dim i As Integer

  frmOuvrir.lstProjets.Clear
  For i = 0 To db.TableDefs.Count - 1
    If (db.TableDefs(i).Attributes And DB_SYSTEMOBJECT) = 0 Then
      If db.TableDefs(i).Name <> "Défaut" And db.TableDefs(i).Name <> "Suggestions" Then frmOuvrir.lstProjets.AddItem db.TableDefs(i).Name
    End If
  Next
  frmOuvrir.mode = "1"
  frmOuvrir.Show 1
  If frmOuvrir.lblProjet <> "" Then
    If MsgBox("Voulez-vous réellement supprimer le projet " & Chr(34) & frmOuvrir.lblProjet & Chr(34) & " ?", 1 + 48 + 256) = 1 Then
      ' Dans ce cas...
      If sTable = frmOuvrir.lblProjet Then OuvreProjet "Défaut"
      db.TableDefs.Delete frmOuvrir.lblProjet
    End If
  End If
End Sub

Sub CréeProjet (s As String)
  frmHACCP.Caption = "Création en cours..."

  Dim td As New tabledef
  Dim ix As New Index

  Dim i0 As New field
  Dim i1 As New field
  Dim i2 As New field
  Dim i3 As New field
  Dim i4 As New field
  Dim i5 As New field
  Dim i6 As New field
  Dim no As New field
  Dim titre As New field
  Dim Texte As New field
  Dim Niveau As New field
  Dim Extension As New field

  td.Name = s

  i0.Name = "i0": i0.Type = 2: td.Fields.Append i0
  i1.Name = "i1": i1.Type = 2: td.Fields.Append i1
  i2.Name = "i2": i2.Type = 2: td.Fields.Append i2
  i3.Name = "i3": i3.Type = 2: td.Fields.Append i3
  i4.Name = "i4": i4.Type = 2: td.Fields.Append i4
  i5.Name = "i5": i5.Type = 2: td.Fields.Append i5
  i6.Name = "i6": i6.Type = 2: td.Fields.Append i6
  no.Name = "No": no.Type = 4: no.Attributes = 16: td.Fields.Append no
  titre.Name = "Titre": titre.Type = 10: titre.Size = 100: td.Fields.Append titre
  Texte.Name = "Texte": Texte.Type = 10: Texte.Size = 255: td.Fields.Append Texte
  Niveau.Name = "Niveau": Niveau.Type = 2:  td.Fields.Append Niveau
  Extension.Name = "Extension": Extension.Type = 10: Extension.Size = 255: td.Fields.Append Extension

  ix.Name = "CléPrimaire"
  ix.Fields = "No"
  ix.Primary = True
  td.Indexes.Append ix

  db.TableDefs.Append td

End Sub

Sub DoExporter (ByVal sNomfic As String)
  Dim s As dynaset
  Dim t, i As Integer
  Dim n As String, NIV As Integer, sql As String

  Open sNomfic For Output As #1
  Print #1, "HACCP 2.5"

  frmEnCours.Show
  frmEnCours.Caption = "Exportation en cours..."

  Set s = db.CreateDynaset("select i0,i1,i2,i3,i4,i5,i6,Titre,Texte,Niveau,Extension from " & sTable & " order by i0,i1,i2,i3")
  While Not s.EOF
    NIV = 0
    n = Format(s("i0")) & "."
    If s("i1") > 0 Then n = n & Format(s("i1")) & ".": NIV = NIV + 1
    If s("i2") > 0 Then n = n & Format(s("i2")) & ".": NIV = NIV + 1
    If s("i3") > 0 Then n = n & Format(s("i3")) & ".": NIV = NIV + 1

    If s("i1") = 0 Then
      frmEnCours.lbl(0) = s("i0") & " " & s("Titre")
      frmEnCours.Refresh
    ElseIf s("i2") = 0 Then
      frmEnCours.lbl(1) = s("i1") & " " & s("Titre")
      frmEnCours.Refresh
    ElseIf s("i3") = 0 Then
      frmEnCours.lbl(2) = s("i2") & " " & s("Titre")
      frmEnCours.Refresh
    End If

    Write #1, s("i0"), s("i1"), s("i2"), s("i3"), s("i4"), s("i5"), s("i6"), s("Niveau")
    Print #1, rcdol(s("Titre"))
    Print #1, rcdol(s("Texte"))
    If IsNull(s("Extension")) Then Print #1, "" Else Print #1, s("Extension")

    s.MoveNext
  Wend
  Unload frmEnCours

  Close #1

End Sub

Sub DoImporter (ByVal sNomfic As String, sTable As String)
  Dim txt As String
  Dim s As dynaset
  
  Open sNomfic For Input As #1
  Line Input #1, txt
  ' Pour l'instant, on ignore le numéro de version
  If Left(txt, 5) <> "HACCP" Then
    Close #1
    MsgBox "Format du fichier " & Chr(34) & sNomfic & Chr(34) & " inconnu !", 48
    Exit Sub
  End If
  CréeProjet sTable

  Dim i0 As Integer, i1 As Integer, i2 As Integer, i3 As Integer
  Dim i4 As Integer, i5 As Integer, i6 As Integer, Niveau As Integer
  Dim titre As String, Texte As String, Extension As String

  screen.MousePointer = 11

  Set s = db.CreateDynaset("select i0,i1,i2,i3,i4,i5,i6,Titre,Texte,Niveau,Extension from " & sTable)
  While Not EOF(1)
    Input #1, i0, i1, i2, i3, i4, i5, i6, Niveau
    Line Input #1, titre
    Line Input #1, Texte
    Line Input #1, Extension

    'MsgBox "Titre: " & titre & Chr(10) & "Texte: " & Texte & Chr(10) & "Extension: " & Extension
    
    s.AddNew
    s("i0") = i0
    s("i1") = i1
    s("i2") = i2
    s("i3") = i3
    s("i4") = i4
    s("i5") = i5
    s("i6") = i6
    s("titre") = dolrc(titre)
    s("Texte") = dolrc(Texte)
    s("niveau") = Niveau
    If Extension = "" Then s("Extension") = Null Else s("Extension") = Extension
    s.Update
  Wend
  Close #1
  s.Close

  screen.MousePointer = 1

  OuvreProjet sTable

End Sub

' dolrc
' Transforme un $$ en CR
Function dolrc (ByVal s)
  Dim p As Integer

  If IsNull(s) Then dolrc = Null: Exit Function
  If s = "" Then dolrc = Null: Exit Function
  Do
    p = InStr(s, "$$")
    If p = 0 Then Exit Do
    Mid(s, p, 2) = Chr(13) & Chr(10)
  Loop
  dolrc = s
End Function

Sub EditeElément (e As Integer, R As Integer, iChampDéfaut As Integer)
  If SaisieElément(e, tabElément(e, curElément(e), 0), tabElément(e, curElément(e), 1), tabElément(e, curElément(e), 2), tabElément(e, curElément(e), 3), iChampDéfaut, 0) Then
    BDUpdate e, curElément(e), tabElément(e, curElément(e), 0), tabElément(e, curElément(e), 1), tabElément(e, curElément(e), 2), tabElément(e, curElément(e), 3)
    AfficheHautElément e
  End If
End Sub

Sub Form_Load ()
  Dim i As Integer
  Dim s As String, t As String, def As String

  ' Lecture de haccp.ini
  sNomProg = IniChaine("NomProg", "ERCEM System / HACCP 2.5")
  sSujet = IniChaine("Sujet", "HACCP")
  sHelp1 = IniChaine("Help1", "Système informatique interactif d'aide au diagnostic HACCP")
  sNomDoc = IniChaine("Doc", "HACCP.HLP")

  For i = 0 To 6
    Select Case i
      Case 0: def = "Etapes"
      Case 1: def = "Produits"
      Case 2: def = "Dangers"
      Case 3: def = "Points de maîtrise"
      Case 4: def = "Mesures préventives"
      Case 5: def = "Eléments de surveillance"
      Case 6: def = "Eléments de preuve"
    End Select
    tLbl(i) = IniChaine("Libellé" & Format(i), def)
  Next

  bConfirme = GetPrivateProfileInt("HACCP", "bConfirme", 1, sNomIni)

  's = IniChaine("License", "")
  'If s <> "" Then
  '  t = ""
  '  For i = 1 To Len(s)
  '    t = t & Chr(Asc(Mid(s, i, 1)) Xor 1)
  '  Next
  'Else
  '  t = ""
  'End If
  'frmAbout.lblLicence = t


recommence:
  ChDrive Left(app.Path, 2)
  ChDir app.Path

  On Error Resume Next
  Set db = OpenDatabase("HACCP.MDB")
  If Err = 3024 Then  ' Couldn't find 'HACCP.MDB'
    Err = 0
    Name "HACCP0.MDB" As "HACCP.MDB"
    Set db = OpenDatabase("HACCP.MDB")
  End If

  If Err Then
    i = MsgBox("Echec à l'ouverture de la base de données HACCP.MDB" & Chr(10) & Chr(10) & Err & ": " & Error$, 16 + 5)
    If i = 2 Then End
    GoTo recommence
  End If

  Kill "HACCP0.MDB"
  
  On Error GoTo 0
  frmHACCP.WindowState = 2

  For i = 1 To 6
    Load lstHaut(i)
    Load txtBas(i)
    Load cmdAjoute(i)
    Load cmdOte(i)
    Load cmdExt(i)
  Next

  ' Positionnement des libellés
  For i = 0 To 6
    lblHaut(i) = tLbl(i)
  Next

  Show
  OuvreProjet "Défaut"
  DoEvents

  If UCase(Left(Command, 2)) <> "-Q" And UCase(Left(Command, 2)) <> "/Q" Then
    frmAbout.Show 1
  End If
End Sub

Sub Form_Paint ()
  Dim i As Integer
  Dim h, h0

  h0 = 600
  h = frmHACCP.ScaleHeight - h0

  For i = 0 To 5
    Line (140 * i + 70, lstHaut(i).Top + lstHaut(i).Height)-Step(0, h / 7 / 2)
    Line -Step(70, 0)
  Next

End Sub

Sub Form_Resize ()
  If WindowState = 1 Then Exit Sub

  frmHACCP.Hide

  Dim i As Integer
  Dim w, h, h0

  h0 = 600
  w = frmHACCP.ScaleWidth
  h = frmHACCP.ScaleHeight - h0

  txtTitre.Move 0, 0, w, h0

  For i = 0 To 6
    lstHaut(i).Move w / 6 + 50, h0 + h / 7 * i, w * .4 - 100, h / 7
    lblHaut(i).Move 140 * i, h0 + h / 7 * i, w / 6 - 140 * i, lstHaut(i).Height
    txtBas(i).Move w * .57, h0 + h / 7 * i, w * .32, lstHaut(i).Height
    cmdAjoute(i).Move w * .9, h0 + h / 7 * i
    cmdOte(i).Move w * .9, h0 + h / 7 * (i + .3)
    cmdExt(i).Move w * .95, h0 + h / 7 * i
  Next

  For i = 0 To 6
    lstHaut(i).Visible = True
    lblHaut(i).Visible = True
    txtBas(i).Visible = True
    cmdAjoute(i).Visible = True
    cmdOte(i).Visible = True
  Next

  frmHACCP.Show

End Sub

Sub Form_Unload (Cancel As Integer)
  Dim R
  R = WinHelp(frmHACCP.hWnd, "", HELP_QUIT, 0)
  Unload frmSaisie
  Unload frmOuvrir
  Unload frmOptions
  Unload frmNomProj
End Sub

Sub GénereDocExterne ()
  Dim s As dynaset, s2 As dynaset
  Dim t, i As Integer
  Dim n As String, NIV As Integer, sql As String

  Select Case iFmtExt
    Case 0, 1:
      If Not StartWord() Then Exit Sub
      If iBonRépertoire() < 0 Then Exit Sub
    Case 2, 3:
      Dim sNomfic As String
      sNomfic = InputBox("Nom du fichier à générer ?")
      If sNomfic = "" Then Exit Sub
      If iBonRépertoire() < 0 Then Exit Sub
      Open sNomfic For Output As #1
    Case 4:
      Set DocWord = CreateObject("Word.Basic")
      DocWord.FenAppMasquer
      DocWord.FichierNouveau "HACCP"
  End Select

  bStop = False
  frmEnCours.Show
  frmEnCours.Caption = "Génération du document externe en cours..."
    
  toExterne "Projet", txtTitre
  toExterne "normal", Chr(13) & sNomProg & Chr(13)
  toExterne "normal", "Projet généré le " & Mid(Date, 4, 2) & "/" & Left(Date, 2) & "/" & Right(Date, 4) & " " & Time & Chr(13)

'  On Error Resume Next
  
  Set s = db.CreateDynaset("select i0,i1,i2,i3,Titre,texte from " & sTable & " where i0>0 and i4=0 and i5=0 and i6=0 order by i0,i1,i2,i3")
  Do While Not s.EOF
    If bStop Or Err Then Exit Do
    NIV = 0
    n = Format(s("i0")) & "."
    If s("i1") > 0 Then n = n & Format(s("i1")) & ".": NIV = NIV + 1
    If s("i2") > 0 Then n = n & Format(s("i2")) & ".": NIV = NIV + 1
    If s("i3") > 0 Then n = n & Format(s("i3")) & ".": NIV = NIV + 1

    If s("i1") = 0 Then
      frmEnCours.lbl(0) = s("i0") & " " & s("Titre")
      frmEnCours.Refresh
    ElseIf s("i2") = 0 Then
      frmEnCours.lbl(1) = s("i1") & " " & s("Titre")
      frmEnCours.Refresh
    ElseIf s("i3") = 0 Then
      frmEnCours.lbl(2) = s("i2") & " " & s("Titre")
      frmEnCours.Refresh
    End If

    toExterne NIV + 1, n & " " & s("Titre")
    t = s("Texte"): If Not IsNull(t) And t <> "" Then toExterne "Détail", t

    If s("i3") <> 0 Then
      frmEnCours.lbl(3) = s("i3") & " " & s("Titre")
      sql = "select i4,Titre,texte from " & sTable & " where i0=" & s("i0") & " and i1=" & s("i1") & " and i2=" & s("i2") & " and i3=" & s("i3") & " and i4>0 and i5=0 and i6=0 order by i4"
      Set s2 = db.CreateDynaset(sql)
      i = 0
      While Not s2.EOF
	If bStop Or Err Then Exit Do
	If i = 0 Then toExterne 5, "Mesures préventives"
	i = i + 1
	toExterne "Normal", s2("i4") & ". " & s2("Titre")
	t = s2("Texte"): If Not IsNull(t) And t <> "" Then toExterne "Détail", t
	s2.MoveNext
      Wend

      sql = "select i4,i5,Titre,Texte from " & sTable & " where i0=" & s("i0") & " and i1=" & s("i1") & " and i2=" & s("i2") & " and i3=" & s("i3") & " and i4>0 and i5>0 and i6=0 order by i4,i5"
      Set s2 = db.CreateDynaset(sql)
      i = 0
      While Not s2.EOF
	If bStop Or Err Then Exit Do
	If i = 0 Then toExterne 5, "Eléments de surveillance"
	i = i + 1
	toExterne "Normal", s2("i4") & "." & s2("i5") & ". " & s2("Titre")
	t = s2("Texte"): If Not IsNull(t) And t <> "" Then toExterne "Détail", t
	s2.MoveNext
      Wend
      
      sql = "select i4,i5,i6,Titre,texte from " & sTable & " where i0=" & s("i0") & " and i1=" & s("i1") & " and i2=" & s("i2") & " and i3=" & s("i3") & " and i4>0 and i5>0 and i6>0 order by i4,i5,i6"
      Set s2 = db.CreateDynaset(sql)
      i = 0
      While Not s2.EOF
	If bStop Or Err Then Exit Do
	If i = 0 Then toExterne 5, "Eléments de preuve"
	i = i + 1
	toExterne "Normal", s2("i4") & "." & s2("i5") & "." & s2("i6") & ". " & s2("Titre")
	t = s2("Texte"): If Not IsNull(t) And t <> "" Then toExterne "Détail", t
	s2.MoveNext
      Wend
    End If

    s.MoveNext
  Loop

  On Error GoTo 0

  Select Case iFmtExt
    Case 2, 3:
      Close #1
    Case 4
      DocWord.FenAppAfficher
      'DocWord.ExécuteMacro "FormateStyles" 'Pas possible de lancer une macro Word via OleAutomation...
      'Set DocWord = Nothing    ' Ferme Word !!!
      MsgBox "La génération du document Word est terminée." & Chr(13) & "Pour formater le document, utiliser la commande 'Formate styles HACCP' du menu 'Format' de Word.", 64, sNomProg
  End Select

  Unload frmEnCours
End Sub

' Se place dans le répertoire du projet
Function iBonRépertoire ()
  On Error GoTo problème
  If Mid(sRepDéfaut, 2, 1) = ":" Then
    ChDrive (Left(sRepDéfaut, 2))
  End If
  ChDir sRepDéfaut

  iBonRépertoire = 0
finBonRépertoire:
  Exit Function
problème:
  If Err = 76 Then  ' path not found
    On Error GoTo problème
    MkDir sRepDéfaut
    Resume
  End If

  MsgBox "Echec lors de l'accès au répertoire " & sRepDéfaut & Chr(10) & "Err=" & Str(Err) & ": " & Error & Chr(10) & Chr(10) & "Vérifier à l'aide de la commande Fichier,Options que le répertoire du projet est correctement défini !", 16
  iBonRépertoire = -1
  Resume finBonRépertoire
End Function

Function iElementCourant () As Integer
  Dim e As Integer
  For e = 0 To 6
    If ActiveControl Is lstHaut(e) Then Exit For
    If ActiveControl Is txtBas(e) Then Exit For
    If ActiveControl Is cmdAjoute(e) Then Exit For
    If ActiveControl Is cmdOte(e) Then Exit For
    If ActiveControl Is cmdExt(e) Then Exit For
  Next
  iElementCourant = e
End Function

' Détermine si un nom de projet existe déjà
' N'exclut pas les objets système de la comparaison (filtrage de sécurité)
Function iExisteProjet (sNom As String) As Integer
  Dim i As Integer

  For i = 0 To db.TableDefs.Count - 1
    If db.TableDefs(i).Name = sNom Then iExisteProjet = True: Exit Function
  Next
  iExisteProjet = False
End Function

Sub lblHaut_DblClick (Index As Integer)
  Dim lbl As String, x As Integer

  lbl = lblHaut(Index).Caption
  lbl = InputBox("Entrez le nouveau libellé :", sNomProg, lbl)
  If lbl <> "" Then
    lblHaut(Index) = lbl
    x = WritePrivateProfileString("HACCP", "Libellé" & Format(Index), lbl, sNomIni)
   End If
End Sub

Sub LitElément (e As Integer)
  Dim i As Integer
  Dim s As snapshot
  Dim sql As String
  Dim bALire As Integer

  bALire = True
  If e > 0 Then
    If nbElément(e - 1) = 0 Then
      bALire = False
    End If
  End If

  nbElément(e) = 0
  'curElément(e) = 0

  If bALire Then
    sql = "select * from " & sTable & " where "
    For i = 0 To e - 1
      If i > 0 Then sql = sql & "and "
      sql = sql & "i" & Format(i) & "=" & curElément(i) & " "
    Next

    If i > 0 Then sql = sql & "and "
    sql = sql & "i" & Format(e) & ">0 "

    For i = e + 1 To 6
      sql = sql & "and "
      sql = sql & "i" & Format(i) & "=0 "
    Next
    sql = sql & "order by i" & Format(e)
  
    Set s = db.CreateSnapshot(sql)
    While Not s.EOF
      nbElément(e) = nbElément(e) + 1
      tabElément(e, nbElément(e), 0) = s("titre")
      tabElément(e, nbElément(e), 1) = s("texte")
      tabElément(e, nbElément(e), 2) = s("niveau")
      tabElément(e, nbElément(e), 3) = s("extension")
      'Debug.Print "-> "; s(0); s(1); s(2); s(3); s(4); s(5); s(6); s("titre")
      s.MoveNext
    Wend
    s.Close
    If nbElément(e) > 0 And curElément(e) <= 0 Then curElément(e) = 1
    If curElément(e) > nbElément(e) Then curElément(e) = nbElément(e)
  End If
End Sub

Sub lstHaut_change (e As Integer)
  curElément(e) = lstHaut(e).ListIndex + 1
  AfficheBasElément e
  If e < 6 Then AfficheElément e + 1
End Sub

Sub lstHaut_click (e As Integer)
  If curElément(e) <> lstHaut(e).ListIndex + 1 Then
    lstHaut_change (e)
  End If
End Sub

Sub lstHaut_dblclick (e As Integer)
  EditeElément e, curElément(e), 0
End Sub

Sub mnuDocumentation_Click ()
  ShowDoc 1
End Sub

Sub OuvreProjet (s As String)
  Dim sql As String
  Dim ds As dynaset
  Dim i As Integer
  Dim bTrouvé As Integer

  bTrouvé = False
  For i = 0 To db.TableDefs.Count - 1
    If db.TableDefs(i) = s Then
      bTrouvé = True
      Exit For
    End If
  Next

  If Not bTrouvé Then
    MsgBox "Impossible de trouver le projet " & s, 48, sNomProg
    Exit Sub
  End If

  ' On efface les données courantes
  For i = 0 To 6
    nbElément(i) = 0
    curElément(i) = 0
  Next
  For i = 0 To 6
    lstHaut(i).Clear
    txtBas(i) = ""
    cmdExt(i).Visible = False
  Next

  ' Pour l'enregistrement 0,0,0,0,0,0
  ' titre     Titre du projet (txtTitre)
  ' extension Répertoire par défaut (sRepertoire)
  ' niveau    Format du document externe (iFmtExt)
  sTable = s
  sql = "select titre,extension,niveau from " & sTable & " where i0=0 and i1=0 and i2=0 and i3=0 and i4=0 and i5=0 and i6=0"
  Set ds = db.CreateDynaset(sql)
  Dim t, e, n
  If ds.EOF Then
    txtTitre = "(sans titre)"
    sRepDéfaut = "\haccp\" & UCase(Left(sTable, 8))
    ' Pas de valeur par défaut par le format (= la valeur du projet précédent)
  Else
    t = ds("titre"): If IsNull(t) Then t = ""
    txtTitre = t

    e = ds("extension"): If IsNull(e) Then e = "\haccp\" & UCase(Left(sTable, 8))
    sRepDéfaut = e

    n = ds("niveau"): If Not IsNull(n) Then iFmtExt = n
  End If
  ds.Close

  bTitreModifié = False

  frmHACCP.Caption = sNomProg & " - " & sTable
  AfficheElément 0
  
End Sub

' rcdol
' Transforme un CR-LF en $$
Function rcdol (ByVal s)
  Dim p As Integer

  If IsNull(s) Then rcdol = "": Exit Function
  Do
    p = InStr(s, Chr(13))
    If p = 0 Then Exit Do
    Mid(s, p, 2) = "$$"
  Loop
  rcdol = s
End Function

Function SaisieElément (e As Integer, Tit, txt, NIV, ext, iDef As Integer, iInsere As Integer) As Integer

  Dim txtLbl As String
  If IsNull(Tit) Then frmSaisie.txtTitre = "" Else frmSaisie.txtTitre = Tit
  If IsNull(txt) Then frmSaisie.txtTexte = "" Else frmSaisie.txtTexte = txt
  'If IsNull(NIV) Then frmSaisie.optNiveau = 0 Else frmSaisie.optNiveau = NIV
  'If IsNull(ext) Then frmSaisie.txtExtension = "" Else frmSaisie.txtExtension = ext
  txtLbl = tLbl(e)
'  Select Case e
'    Case 0: txtLbl = "Etape"
'    Case 1: txtLbl = "Produit"
'    Case 2: txtLbl = "Danger"
'    Case 3: txtLbl = "Point de maîtrise"
'    Case 4: txtLbl = "Mesure préventive"
'    Case 5: txtLbl = "Elément de surveillance"
'    Case 6: txtLbl = "Elément de preuve"
'  End Select
  If Tit = "" Then
    If iInsere Then
      frmSaisie.Caption = "Ajout avant - " & txtLbl
    Else
      frmSaisie.Caption = "Ajout - " & txtLbl
    End If
  Else
    frmSaisie.Caption = "Mise à jour - " & txtLbl
  End If
  frmSaisie.lblDef = iDef
  frmSaisie.lblE = e

  frmSaisie.Show 1
  If frmSaisie.txtTitre = "" Then
    SaisieElément = False
    Exit Function
  End If
  Tit = frmSaisie.txtTitre
  txt = frmSaisie.txtTexte
  'NIV = frmSaisie.optNiveau
  'ext = frmSaisie.txtExtension
  SaisieElément = True
End Function

Sub SauveOptions ()
  Dim sql As String, ds As dynaset
  sql = "select i0,i1,i2,i3,i4,i5,i6,extension,niveau from " & sTable & " where i0=0 and i1=0 and i2=0 and i3=0 and i4=0 and i5=0 and i6=0"
  Set ds = db.CreateDynaset(sql)
  If ds.EOF Then ds.AddNew  Else ds.Edit
  ds("i0") = 0
  ds("i1") = 0
  ds("i2") = 0
  ds("i3") = 0
  ds("i4") = 0
  ds("i5") = 0
  ds("i6") = 0
  ds("extension") = sRepDéfaut
  ds("niveau") = iFmtExt
  ds.Update
  ds.Close
End Sub

Sub ShowDoc (ByVal i As Integer)
  Dim R
  Dim nomfic As String, CurrentDir As String

  If InStr(sNomDoc, "\") = 0 Then
    CurrentDir = app.Path
    If Right$(CurrentDir, 1) <> "\" Then CurrentDir = CurrentDir + "\"
    nomfic = CurrentDir & sNomDoc
  Else
    nomfic = sNomDoc
  End If

  R = WinHelp(frmHACCP.hWnd, nomfic, HELP_CONTEXT, CLng(i))
End Sub

Function sNomDeNouveauProjet (ByVal sDefaut As String) As String
  Dim i As Integer
  Dim c As String

saisie:
  frmNomProj.txtNom = sDefaut
  frmNomProj.Show 1
  sDefaut = frmNomProj.txtNom
  If sDefaut = "" Then GoTo fin
  If iExisteProjet(sDefaut) Then
    MsgBox "Impossible, le projet " & Chr(34) & sDefaut & Chr(34) & " existe déjà !", 16
    GoTo saisie
  End If
  For i = 1 To Len(sDefaut)
    c = Mid(sDefaut, i, 1)
    If InStr("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.-_", UCase(c)) = 0 Then
      If c = " " Then c = "espace"
      MsgBox "Caractère " & c & " interdit pour un nom de projet !", 16
      GoTo saisie
    End If
  Next
fin:
  sNomDeNouveauProjet = sDefaut
End Function

Function StartWord () As Integer
  Dim DéjàChargé As Integer
  Dim tmp As Integer
  Dim recommence As Integer

  DéjàChargé = 0
  recommence = False

  dde.LinkMode = 0
  dde.LinkTopic = "WinWord|System"
  On Error Resume Next
  dde.LinkTimeout = 30
  dde.LinkMode = 2
  If Err = 0 Then DéjàChargé = True

restart:
  If Err = 282 Then
    If recommence Then
      MsgBox "Échec au chargement de Word" + Chr$(13) + "Lancez manuellement Word avant de recommencer."
      StartWord = 0
      Exit Function
    Else
      tmp = Shell("WinWord", 4)
      DoEvents
      Err = 0
      dde.LinkMode = 0
      recommence = 1
      On Error Resume Next
      dde.LinkMode = 2
      GoTo restart
    End If
  ElseIf Err Then
    MsgBox "Erreur inconnue" + Chr$(13) + Format$(Err) + ": " + Error$(Err)
    StartWord = 0
    Exit Function
  End If
  
  Select Case iFmtExt
    Case 0: 'Word 2
      dde.LinkExecute "[FichierNouveauDocument .NouveauModèle = 0, .Modèle = " & Chr(34) & "HACCP" & Chr(34) & "]"
    Case 1: 'Word 6
      dde.LinkExecute "[FichierNouveau .NouvModèle = 0, .Modèle = " & Chr(34) & "HACCP" & Chr(34) & "]"
  End Select
  DoEvents

  Dim g As String * 1
  g = Chr(34)
  
  'dde.LinkMode = 0
  'dde.LinkItem = "Topics"
  'dde.LinkMode = 2
  'dde.LinkRequest
  '
  'Dim p As Integer, lp As Integer
  'lp = 0
  'Do
  '  p = InStr(lp + 1, dde.Text, Chr(9))
  '  If p = 0 Then Exit Do
  '  lp = p
  'Loop
  '
  'dde.LinkMode = 0
  'dde.LinkTopic = "WinWord|" & Mid(dde.Text, lp + 1)
  'dde.LinkMode = 2
  '
  'If Err Then
  '  MsgBox "Impossible d'établir la communication avec le document Word !", 48
  '  dde.LinkMode = 0
  '  StartWord = 0
  '  On Error GoTo 0
  '  Exit Function
  'End If
  
  StartWord = True
  On Error GoTo 0

End Function

Sub toExterne (n, ByVal s As String)

  If iFmtExt = 4 Then  ' Word 6 par Ole Automation
    'Stop
    'DocWord.FenAppAfficher
    If IsNumeric(n) Then
      'DocWord.FormatStyle "titre " & n, 0
      DocWord.Insertion "<t" & n & ">"
    Else
      'DocWord.FormatStyle n, 0
    End If

    DocWord.Insertion s
    DocWord.InsertionPara
    Exit Sub
  End If

  Dim p As Integer, t As String
  Do
    p = InStr(s, Chr(34))
    If p = 0 Then Exit Do
    Mid(s, p, 1) = "'"
  Loop
  
  Do While Len(s) > 0
    t = Left(s, 200)
    s = Mid(s, 201)
    Select Case iFmtExt
      Case 0, 1:
	DoEvents
	If IsNumeric(n) Then
	  dde.LinkExecute "[FormatStyle .Nom = " & Chr(34) & "titre " & n & Chr(34) & ", .Appliquer]"
	Else
	  dde.LinkExecute "[FormatStyle .Nom = " & Chr(34) & n & Chr(34) & ", .Appliquer]"
	End If
	DoEvents
      Case 3: 'Texte + styles
	If IsNumeric(n) Then
	  Print #1, "<"; Mid(Str(n), 2); ">";
	Else
	  Print #1, "<"; n; ">";
	End If
    End Select

    Select Case iFmtExt
      Case 0: 'Word 2
	dde.LinkExecute "[Insérer " & Chr(34) & t & Chr(34) & "]"
	DoEvents
      Case 1: 'Word 6
	dde.LinkExecute "[Insertion " & Chr(34) & t & Chr(34) & "]"
	DoEvents
      Case 2, 3:
	Print #1, t
    End Select

  Loop
  Select Case iFmtExt
    Case 0: 'Word 2
      dde.LinkExecute "[InsérerPara]"
      DoEvents
    Case 1: 'Word 6
      dde.LinkExecute "[InsertionPara]"
      DoEvents
  End Select
End Sub

Sub txtBas_KeyPress (e As Integer, keyAscii As Integer)
  keyAscii = 0
  EditeElément e, curElément(e), 1
End Sub

Sub txtTitre_change ()
  bTitreModifié = True
End Sub

Sub txtTitre_KeyPress (keyAscii As Integer)
  If keyAscii = 13 Then
    If InStr(txtTitre, Chr(13)) <> 0 Then
      Beep
      keyAscii = 0
    End If
  End If
End Sub

Sub txtTitre_LostFocus ()
  
  Dim txt As String, ds  As dynaset, sql As String
  Dim i As Integer

  If bTitreModifié Then
    sql = "select * from " & sTable & " where i0=0 and i1=0 and i2=0 and i3=0 and i4=0 and i5=0 and i6=0"
    Set ds = db.CreateDynaset(sql)
    If ds.EOF Then ds.AddNew  Else ds.Edit
    For i = 0 To 6
      ds(i) = 0
    Next
    ds("titre") = txtTitre
    ds.Update
    ds.Close
    bTitreModifié = False
  End If

End Sub

