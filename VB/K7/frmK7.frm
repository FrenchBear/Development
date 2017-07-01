VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmK7 
   AutoRedraw      =   -1  'True
   Caption         =   "K7 - Assembleur de morceaux"
   ClientHeight    =   8895
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10650
   Icon            =   "frmK7.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   8895
   ScaleWidth      =   10650
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnParcourir 
      Caption         =   "..."
      Height          =   315
      Left            =   5820
      TabIndex        =   2
      Top             =   300
      Width           =   375
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   9960
      Top             =   1260
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmK7.frx":0442
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmK7.frx":16D2
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmK7.frx":22A6
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmK7.frx":3536
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmK7.frx":47C6
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton btnCopierListePlages 
      Caption         =   "Copier liste plages"
      Enabled         =   0   'False
      Height          =   375
      Left            =   6360
      TabIndex        =   18
      Top             =   8460
      Width           =   1695
   End
   Begin VB.CommandButton btnCopierListeFichiers 
      Caption         =   "Copier liste fichiers"
      Enabled         =   0   'False
      Height          =   375
      Left            =   60
      TabIndex        =   6
      Top             =   8460
      Width           =   1695
   End
   Begin MSComctlLib.TreeView tvPlages 
      Height          =   4995
      Left            =   6360
      TabIndex        =   17
      Top             =   3420
      Width           =   4215
      _ExtentX        =   7435
      _ExtentY        =   8811
      _Version        =   393217
      Indentation     =   529
      LabelEdit       =   1
      Style           =   7
      ImageList       =   "ImageList1"
      Appearance      =   1
   End
   Begin VB.TextBox txtDuréeSilence 
      Height          =   315
      Left            =   8580
      TabIndex        =   14
      Text            =   "2"
      Top             =   1140
      Width           =   675
   End
   Begin VB.TextBox txtFichierSilence 
      Height          =   315
      Left            =   8580
      TabIndex        =   12
      Text            =   "G:\blanc2.mp3"
      Top             =   780
      Width           =   1935
   End
   Begin VB.TextBox txtTolérance 
      Height          =   315
      Left            =   8580
      TabIndex        =   10
      Text            =   "30"
      Top             =   420
      Width           =   675
   End
   Begin VB.TextBox txtMaxPlage 
      Height          =   315
      Left            =   8580
      TabIndex        =   8
      Text            =   "47:00"
      Top             =   60
      Width           =   675
   End
   Begin MSComctlLib.ListView lvFichiers 
      Height          =   7215
      Left            =   60
      TabIndex        =   5
      Top             =   1200
      Width           =   6135
      _ExtentX        =   10821
      _ExtentY        =   12726
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      SmallIcons      =   "ImageList1"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Fichier"
         Object.Width           =   8026
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Durée"
         Object.Width           =   1147
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Plage"
         Object.Width           =   1058
      EndProperty
   End
   Begin VB.CommandButton btnLire 
      Caption         =   "Lire k7.pls"
      Height          =   375
      Left            =   60
      TabIndex        =   3
      Top             =   720
      Width           =   1215
   End
   Begin VB.TextBox txtRépertoire 
      Height          =   315
      Left            =   60
      TabIndex        =   1
      Top             =   300
      Width           =   5715
   End
   Begin MSComctlLib.ListView lvTrace 
      Height          =   1395
      Left            =   6360
      TabIndex        =   16
      Top             =   1980
      Width           =   4215
      _ExtentX        =   7435
      _ExtentY        =   2461
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Object.Width           =   8819
      EndProperty
   End
   Begin VB.CommandButton btnAnalyse 
      Caption         =   "Assemblage"
      Enabled         =   0   'False
      Height          =   375
      Left            =   6360
      TabIndex        =   15
      Top             =   1560
      Width           =   1215
   End
   Begin VB.Label lblDuréeSilence 
      AutoSize        =   -1  'True
      Caption         =   "Durée du fichier silence : "
      Height          =   195
      Left            =   6360
      TabIndex        =   13
      Top             =   1200
      Width           =   1800
   End
   Begin VB.Label lblFichierSilence 
      AutoSize        =   -1  'True
      Caption         =   "Fichier de silence à insérer : "
      Height          =   195
      Left            =   6360
      TabIndex        =   11
      Top             =   840
      Width           =   2010
   End
   Begin VB.Label lblTolérance 
      AutoSize        =   -1  'True
      Caption         =   "Tolérance : "
      Height          =   195
      Left            =   6360
      TabIndex        =   9
      Top             =   480
      Width           =   855
   End
   Begin VB.Label lblDuréePlage 
      AutoSize        =   -1  'True
      Caption         =   "Durée maximum d'une plage : "
      Height          =   195
      Left            =   6360
      TabIndex        =   7
      Top             =   120
      Width           =   2130
   End
   Begin VB.Label lblAnalyse 
      Caption         =   "_"
      Height          =   495
      Left            =   1380
      TabIndex        =   4
      Top             =   720
      Width           =   4770
   End
   Begin VB.Label lblRépertoire 
      AutoSize        =   -1  'True
      Caption         =   "Dossier contenant le fichier k7.pls :"
      Height          =   195
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   2475
   End
End
Attribute VB_Name = "frmK7"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' K7
' Assembleur de morceaux pour une durée de plage maximum
' PV 21/07/01  Moteur d'analyse
' PV 13/08/01  Interface Windows


Option Explicit

' Liste des fichiers
Const MAXMORCEAU = 250
Dim tMorceau(1 To MAXMORCEAU) As New Morceau
Dim iNbMorceau As Integer
Dim iDuréeMaxMorceau As Long

' Paramètres du moteur
Dim iMaxPlage As Integer
Dim iDuréeSilence As Integer
Dim iTolérance As Integer

' Variables du moteur d'analyse
Dim bAPlacer(1 To MAXMORCEAU) As Boolean
Dim bSolution As Boolean
Dim sSolution As String
Dim iDurSolution As Long
Dim iNbRestantAPlacer As Integer



Sub AnalyseLigne(sLigne As String, iLPréfixe As Integer)
  Dim iIndice As Integer
  Dim p As Integer
  
  iIndice = Val(Mid(sLigne, iLPréfixe + 1))
  p = InStr(sLigne, "=")
  Select Case UCase(Left(sLigne, 1))
    Case "F": tMorceau(iIndice).sFile = Mid(sLigne, p + 1)
    Case "T": tMorceau(iIndice).sTitle = Mid(sLigne, p + 1)
    Case "L": tMorceau(iIndice).iLength = Val(Mid(sLigne, p + 1))
  End Select
  
  If iIndice > iNbMorceau Then iNbMorceau = iIndice
End Sub


'' Trie les morceaux par durée croissante
'Sub Tri()
'  Dim bPermut As Boolean
'  Dim iNbPasse As Integer
'  Dim i As Integer
'
'  iNbPasse = 0
'  Do
'    iNbPasse = iNbPasse + 1
'    bPermut = False
'    For i = 1 To iNbMorceau - iNbPasse
'      If tMorceau(i).iLength < tMorceau(i + 1).iLength Then
'        Dim m As Morceau
'        Set m = tMorceau(i)
'        Set tMorceau(i) = tMorceau(i + 1)
'        Set tMorceau(i + 1) = m
'        bPermut = True
'      End If
'    Next
'  Loop While bPermut
'End Sub


Sub Analyse()
  Dim iPlage As Integer
  iPlage = 0
 
  Dim i As Integer
  For i = 1 To iNbMorceau
    bAPlacer(i) = True
  Next
  
  iNbRestantAPlacer = iNbMorceau
  
  bSolution = False
  Do
    iPlage = iPlage + 1
       
    ' On vérifie qu'il faut analyser
    Dim dTot As Long
    Dim sSol As String
    
    dTot = 0
    sSol = ""
    For i = 1 To iNbMorceau
      If bAPlacer(i) Then
        dTot = dTot + tMorceau(i).iLength + iDuréeSilence
        sSol = sSol & "1"
      Else
        sSol = sSol & "0"
      End If
    Next
    
    If dTot < iMaxPlage Then
      Trace "--> Plage " & iPlage & " incomplète"
      GénèreSolution iPlage, sSol
      Exit Do
    End If
    
    ' Analyse
    Dim s As String
    Dim d As Integer
    s = String(iNbMorceau, "0")
    d = 0
    
    bSolution = False
    sSolution = "?"
    iDurSolution = -1
    Papillonne s, d, 1
    If bSolution Then
      GénèreSolution iPlage, sSolution
    Else
      Trace "Pas de solution... Augmenter la tolérance"
      Beep
      Exit Sub
    End If
    
  Loop While iNbRestantAPlacer > 0
  
  btnCopierListePlages.Enabled = True
End Sub


Sub GénèreSolution(iPlage As Integer, s As String)
  Dim i As Integer
  Dim sFic As String
  Dim sPlageKey As String
  Dim iDurée As Long
  Dim iNb As Integer
  Dim nodX As Node
  
  sPlageKey = "P" & iPlage
  
  Dim nodPlage As Node
  Set nodPlage = tvPlages.Nodes.Add("R", tvwChild, sPlageKey, "Plage " & iPlage, 3)
  'nodX.Expanded = True
  
  sFic = "K7-" & iPlage & ".m3u"
  Open sFic For Output As #1
  iDurée = 0
  iNb = 0
  For i = 1 To iNbMorceau
    If Mid(s, i, 1) = "1" Then
      Set nodX = tvPlages.Nodes.Add(sPlageKey, tvwChild, , tMorceau(i).sFile & " [" & sFormatDurée(tMorceau(i).iLength) & "]", 4)
      iDurée = iDurée + tMorceau(i).iLength + iDuréeSilence
      iNb = iNb + 1
      bAPlacer(i) = False
      Print #1, tMorceau(i).sFile
      Print #1, txtFichierSilence
      lvFichiers.ListItems(i).SubItems(2) = iPlage
    End If
  Next
  Close #1
  
  nodPlage.Text = nodPlage.Text & ": " & iNb & " morceaux [" & sFormatDurée(iDurée) & "]"
  iNbRestantAPlacer = iNbRestantAPlacer - iNb
End Sub


Sub Papillonne(ByVal s As String, ByVal iDur As Integer, ByVal iCourant As Integer)
  If iDur >= iMaxPlage - iTolérance Then
    bSolution = True
    sSolution = s
    iDurSolution = iDur
    Exit Sub
  End If
  
  While bAPlacer(iCourant) = False
    iCourant = iCourant + 1
    If iCourant > iNbMorceau Then Exit Sub
  Wend
  
  ' Si le morceau courant passe, on examine les combinaisons en l'incluant
  If iDur + tMorceau(iCourant).iLength + iDuréeSilence <= iMaxPlage Then
    Mid(s, iCourant, 1) = "1"
    Papillonne s, iDur + tMorceau(iCourant).iLength + iDuréeSilence, iCourant + 1
    If bSolution Then Exit Sub
  End If
  
  ' On examine de manière systématique les combinaisons sans l'élément
  Mid(s, iCourant, 1) = "0"
  Papillonne s, iDur, iCourant + 1
End Sub



Private Sub btnAnalyse_Click()
  tvPlages.Nodes.Clear
  lvTrace.ListItems.Clear
  
  Dim i As Integer
  For i = 1 To iNbMorceau
    lvFichiers.ListItems(i).SubItems(2) = ""
  Next
  
  iDuréeSilence = iDécodeDurée(txtDuréeSilence)
  If iDuréeSilence < 0 Or iDuréeSilence > 10 Then
    MsgBox "Durée de silence invalide (doit être comprise entre 0 et 10 secondes)", vbExclamation, App.Title
    txtDuréeSilence.SetFocus
    Exit Sub
  End If
  
  iMaxPlage = iDécodeDurée(txtMaxPlage)
  If iMaxPlage < 15 * 60 Or iMaxPlage > 90 * 60 Or iMaxPlage < iDuréeMaxMorceau + iDuréeSilence Then
    MsgBox "Durée de plage invalide (doit être comprise entre 15:00 et 90:00) et supérieure à la durée du morceau le plus long+durée silence", vbExclamation, App.Title
    txtMaxPlage.SetFocus
    Exit Sub
  End If
  
  iTolérance = iDécodeDurée(txtTolérance)
  If iTolérance < 5 Or iTolérance > 90 Then
    MsgBox "Durée de tolérance invalide (doit être comprise entre 5 et 90 secondes)", vbExclamation, App.Title
    txtTolérance.SetFocus
    Exit Sub
  End If
  
  
  Dim nodX As Node
  Set nodX = tvPlages.Nodes.Add(, , "R", "Répartition", 5)
  nodX.Expanded = True
  
  Analyse
End Sub


Private Sub Trace(sMessage As String)
  Dim x As ListItem
  Set x = lvTrace.ListItems.Add
  x.Text = sMessage
  Set lvTrace.SelectedItem = x
  x.EnsureVisible
End Sub


Private Sub btnLire_Click()
  lvFichiers.ListItems.Clear
  lblAnalyse.Caption = ""
  btnAnalyse.Enabled = False
  btnCopierListeFichiers.Enabled = False
  
  On Error GoTo pbDir
  ChDrive txtRépertoire.Text
  ChDir txtRépertoire.Text
  
  On Error GoTo pbFic
  Open "K7.pls" For Input As #1
  
  On Error GoTo pbLecture
  Dim sLigne As String
  While Not EOF(1)
    Line Input #1, sLigne
    If StrComp(Left(sLigne, 4), "File", vbTextCompare) = 0 Then AnalyseLigne sLigne, 4
    If StrComp(Left(sLigne, 5), "Title", vbTextCompare) = 0 Then AnalyseLigne sLigne, 5
    If StrComp(Left(sLigne, 6), "Length", vbTextCompare) = 0 Then AnalyseLigne sLigne, 6
  Wend
  Close #1
  On Error GoTo 0
  
  Dim iTotalLength As Long
  Dim bStop As Boolean
  bStop = False
  iDuréeMaxMorceau = 0
  Dim i As Integer
  For i = 1 To iNbMorceau
    Dim x As ListItem
    Set x = lvFichiers.ListItems.Add
    x.SmallIcon = 4
    x.Text = tMorceau(i).sFile
    x.SubItems(1) = sFormatDurée(tMorceau(i).iLength)
    x.SubItems(2) = ""
    
    If tMorceau(i).sFile = "" Or tMorceau(i).sTitle = "" Or tMorceau(i).iLength = 0 Then
      MsgBox "Manque des infos sur le morceau n°" & i
      x.Bold = True
      x.ForeColor = RGB(255, 0, 0)
      bStop = True
    End If
    iTotalLength = iTotalLength + tMorceau(i).iLength
    If tMorceau(i).iLength > iDuréeMaxMorceau Then iDuréeMaxMorceau = tMorceau(i).iLength
  Next
  
  If bStop Then Exit Sub
  
  lblAnalyse.Caption = "Nb morceaux: " & iNbMorceau & ",  Durée totale: " & sFormatDurée(iTotalLength) & ",  Durée maximum morceau: " & sFormatDurée(iDuréeMaxMorceau)
  btnAnalyse.Enabled = True
  btnCopierListeFichiers.Enabled = True
  Exit Sub

pbDir:
  MsgBox "Échec à l'accès au répertoire" & vbCrLf & "Erreur " & Err.Number & ": " & Err.Description
  Exit Sub
  
pbFic:
  MsgBox "Échec à l'accès au fichier k7.xls" & vbCrLf & "Erreur " & Err.Number & ": " & Err.Description
  Exit Sub
  
pbLecture:
  MsgBox "Échec lors de la lecture k7.xls" & vbCrLf & "Erreur " & Err.Number & ": " & Err.Description
  Exit Sub
End Sub


Function sFormatDurée(d As Long) As String
  If d >= 3600 Then
    sFormatDurée = Format(d \ 3600) & ":" & Format((d Mod 3600) \ 60, "00") & ":" & Format(d Mod 60, "00")
  Else
    sFormatDurée = Format(d \ 60) & ":" & Format(d Mod 60, "00")
  End If
End Function


Function iDécodeDurée(ByVal s As String) As Integer
  s = Trim(s)
  Dim p As Integer
  p = InStr(1, s, ":")
  If p = 0 Then
    iDécodeDurée = Val(s)
  Else
    iDécodeDurée = 60 * Val(s) + Val(Mid(s, p + 1))
  End If
End Function


Private Sub btnCopierListeFichiers_Click()
  Clipboard.Clear
  
  Dim s As String
  s = "Fichier" & vbTab & "Durée" & vbTab & "Plage" & vbCrLf
  Dim l As ListItem
  For Each l In lvFichiers.ListItems
    s = s & l.Text & vbTab & l.SubItems(1) & vbTab & l.SubItems(2) & vbCrLf
  Next
  Clipboard.SetText s
  
  MsgBox "La liste des fichiers a été copiée dans le presse-papiers.", vbInformation, App.Title
End Sub


Private Sub btnCopierListePlages_Click()
  Clipboard.Clear
  
  Dim s As String
  s = "Plage " & vbTab & "Fichier [Durée]"
  Dim n As Node
  Dim iPlage As Integer
  For Each n In tvPlages.Nodes
    If Left(n.Key, 1) = "P" Then
      iPlage = Mid(n.Key, 2)
      s = s & vbCrLf
    ElseIf Left(n.Key, 1) <> "R" Then
      s = s & iPlage & vbTab & n.Text & vbCrLf
    End If
  Next
  Clipboard.SetText s
  
  MsgBox "La liste des plages a été copiée dans le presse-papiers.", vbInformation, App.Title
End Sub


Private Sub btnParcourir_Click()
  Dim sRep As String
  Dim sRepNouv As String
  sRep = txtRépertoire.Text
  sRepNouv = sBrowseForFolder(Me.hwnd, sRep, "Sélectionnez le répertoire contenant le fichier k7.pls")
  If sRepNouv = "" Then Exit Sub
  sRep = sRepNouv
  SaveSetting App.EXEName, "Config", "Path", sRep
  
  txtRépertoire = sRep
End Sub


Private Sub Form_Load()
  Dim sRep As String
  sRep = GetSetting(App.EXEName, "Config", "Path", "C:\")
  txtRépertoire.Text = sRep
  txtRépertoire.SelStart = 999
End Sub
