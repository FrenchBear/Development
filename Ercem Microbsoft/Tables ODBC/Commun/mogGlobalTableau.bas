Attribute VB_Name = "modGlobalTableau"
' modGlobalTableau
' Fonctions globale de manipulation d'un TrueDBGrid
' 13/12/1999 PV
' 10/03/2000 PV   Ajout de la colonne 0; ChercheColonnes
' 19/10/2000 PV   PrépareImport

Option Explicit


' Copie en mode tableau
Public Sub gtCopieTableau(t As TDBGrid, a As XArrayDB)
  Dim i As Integer, j As Integer
  Dim sClip As String
  
  For j = 0 To a.UpperBound(2)
    sClip = sClip & t.Columns(j).Caption & IIf(j < a.UpperBound(2), vbTab, vbCrLf)
  Next
  For i = 1 To a.UpperBound(1)
    For j = 0 To a.UpperBound(2)
      sClip = sClip & a(i, j) & IIf(j < a.UpperBound(2), vbTab, vbCrLf)
    Next
  Next
  Clipboard.Clear
  Clipboard.SetText sClip
End Sub


' Prépare l'import des données
' Analyse le presse-papiers, et si tout est Ok, préremplit la feuille frmImport
Public Sub PrépareImport(fCallBack As Form, stitreFrmImport As String, tsClé As Variant, tsDéf As Variant, frmImport As Form)

  Dim i As Integer, j As Integer
  Dim l As Variant      ' Tableau des lignes
  Dim c As Variant      ' Tableau des colonnes
  Dim tiInd As Variant  ' Tableau des indice des colonnes du presse-papiers
  
  If UBound(tsClé) <> UBound(tsDéf) Then Stop
  
  ' On vérifie que le presse-papiers contient bien la grille voulue
  If Not Clipboard.GetFormat(vbCFText) Then GoTo FinPb1

  l = Split(Clipboard.GetText, vbCrLf)
  If UBound(l) = 0 Then GoTo FinPb1
  
  ' Analyse des étiquettes de la 1ère ligne
  c = Split(l(LBound(l)), vbTab)
  tiInd = ChercheColonnes(c, tsClé)
  
  If IsEmpty(tiInd) Then GoTo FinPb1

  frmImport.Show
  frmImport.Caption = stitreFrmImport
  frmImport.lvImport.ListItems.Clear
  frmImport.lvImport.ColumnHeaders.Clear
  frmImport.lvImport.View = lvwReport
  frmImport.lvImport.ColumnHeaders.Add , "État import", "État import"
  For i = LBound(tsClé) To UBound(tsClé)
    frmImport.lvImport.ColumnHeaders.Add , tsClé(i), tsClé(i)
  Next
  
  Dim h As ColumnHeaders
  Dim x As ListItem
  Dim s As String
  
  For i = LBound(l) + 1 To UBound(l)
    If l(i) <> "" Then
      c = Split(l(i), vbTab)
      Set x = frmImport.lvImport.ListItems.Add
      Set h = frmImport.lvImport.ColumnHeaders
      For j = UBound(tiInd) To LBound(tiInd) Step -1
        If tiInd(j) >= 0 Then
          s = Trim(c(tiInd(j)))
        Else
          s = tsDéf(j)
        End If
        x.Text = "?"
        x.SubItems(h(tsClé(j)).Index - 1) = s
      Next
    End If
  Next
  
  AjusteListView frmImport, frmImport.lvImport
  Set frmImport.fCallBack = fCallBack
  
  frmImport.btnAnnuler.Enabled = True
  frmImport.btnImporter.Enabled = True
  Exit Sub
  
FinPb1:
  Dim iRep As VbMsgBoxResult
  If bShiftPressed Then
    iRep = vbYes
  Else
    iRep = MsgBox("Vous n'avez pas copié un tableau de données dans le presse-papiers avant d'importer des données, ou le format des données copiées est incorrect." & vbCrLf & "Voulez-vous copier les en-têtes de colonne à utiliser, ainsi que les valeurs par défaut ?", vbQuestion + vbYesNo, App.Title)
  End If
  If iRep = vbYes Then
    Dim s0, sRes As String
    For Each s0 In tsClé
      If sRes <> "" Then sRes = sRes & Chr(9)
      sRes = sRes & s0
    Next
    sRes = sRes & vbCrLf
    For Each s0 In tsDéf
      If sRes <> "" Then sRes = sRes & Chr(9)
      sRes = sRes & s0
    Next
    
    Clipboard.Clear
    Clipboard.SetText sRes
    MsgBox "Les en-têtes de colonne et les valeurs par défaut ont été copiées dans le presse-papiers, vous pouvez les coller dans Excel. Les colonnes obligatoires sont précédées d'une *", vbInformation, App.Title
  End If
End Sub



' tsLigne1 est un tableau de chaînes (1ère ligne d'import)
' tsClés est un tableau d'étiquettes cherchées, commenant par * si l'étiquette est obligatoire
' Retourne un tableau d'indices de même dimension que tsClés indiquant l'indice des clés dans tsLigne1
' L'indice des clés inexistantes dans tsLigne1 vaut -1
' Retourne empty s'il manque une colonne obligatoire
Public Function ChercheColonnes(tsLigne1 As Variant, ByVal tsClés As Variant) As Variant
  Dim tind() As Integer
  Dim bColonneObligatoire As Boolean
  Dim bProblème As Boolean
  Dim i As Integer, j As Integer
  Dim sColonne As String
  
  ReDim tind(LBound(tsClés) To UBound(tsClés)) As Integer
  bProblème = False
  For i = LBound(tsClés) To UBound(tsClés)
    tind(i) = -1    ' Pas trouvé
    If Left(tsClés(i), 1) = "*" Then
      bColonneObligatoire = True
      tsClés(i) = Mid(tsClés(i), 2)
    Else
      bColonneObligatoire = False
    End If
    For j = LBound(tsLigne1) To UBound(tsLigne1)
      sColonne = tsLigne1(j)
      ' On accepte que les colonnes en entrée soient précédées d'une *
      If Left(sColonne, 1) = "*" Then sColonne = Mid(sColonne, 2)
      
      If StrComp(tsClés(i), sColonne, vbTextCompare) = 0 Then
        tind(i) = j
        Exit For
      End If
    Next
    If tind(i) = -1 And bColonneObligatoire Then
      If Not bShiftPressed Then MsgBox "Colonne " & tsClés(i) & " obligatoire non trouvée dans les données du presse-papiers.", vbExclamation, App.Title
      bProblème = True
    End If
  Next
  If bProblème Then
    ChercheColonnes = Empty
  Else
    ChercheColonnes = tind
  End If
End Function

