Attribute VB_Name = "modGlobalTableau"
' modGlobalTableau
' Fonctions globale de manipulation d'un TrueDBGrid
' 13/12/1999 PV
' 10/03/2000 PV   Ajout de la colonne 0; ChercheColonnes
' 19/10/2000 PV   Pr�pareImport

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


' Pr�pare l'import des donn�es
' Analyse le presse-papiers, et si tout est Ok, pr�remplit la feuille frmImport
Public Sub Pr�pareImport(fCallBack As Form, stitreFrmImport As String, tsCl� As Variant, tsD�f As Variant, frmImport As Form)

  Dim i As Integer, j As Integer
  Dim l As Variant      ' Tableau des lignes
  Dim c As Variant      ' Tableau des colonnes
  Dim tiInd As Variant  ' Tableau des indice des colonnes du presse-papiers
  
  If UBound(tsCl�) <> UBound(tsD�f) Then Stop
  
  ' On v�rifie que le presse-papiers contient bien la grille voulue
  If Not Clipboard.GetFormat(vbCFText) Then GoTo FinPb1

  l = Split(Clipboard.GetText, vbCrLf)
  If UBound(l) = 0 Then GoTo FinPb1
  
  ' Analyse des �tiquettes de la 1�re ligne
  c = Split(l(LBound(l)), vbTab)
  tiInd = ChercheColonnes(c, tsCl�)
  
  If IsEmpty(tiInd) Then GoTo FinPb1

  frmImport.Show
  frmImport.Caption = stitreFrmImport
  frmImport.lvImport.ListItems.Clear
  frmImport.lvImport.ColumnHeaders.Clear
  frmImport.lvImport.View = lvwReport
  frmImport.lvImport.ColumnHeaders.Add , "�tat import", "�tat import"
  For i = LBound(tsCl�) To UBound(tsCl�)
    frmImport.lvImport.ColumnHeaders.Add , tsCl�(i), tsCl�(i)
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
          s = tsD�f(j)
        End If
        x.Text = "?"
        x.SubItems(h(tsCl�(j)).Index - 1) = s
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
    iRep = MsgBox("Vous n'avez pas copi� un tableau de donn�es dans le presse-papiers avant d'importer des donn�es, ou le format des donn�es copi�es est incorrect." & vbCrLf & "Voulez-vous copier les en-t�tes de colonne � utiliser, ainsi que les valeurs par d�faut ?", vbQuestion + vbYesNo, App.Title)
  End If
  If iRep = vbYes Then
    Dim s0, sRes As String
    For Each s0 In tsCl�
      If sRes <> "" Then sRes = sRes & Chr(9)
      sRes = sRes & s0
    Next
    sRes = sRes & vbCrLf
    For Each s0 In tsD�f
      If sRes <> "" Then sRes = sRes & Chr(9)
      sRes = sRes & s0
    Next
    
    Clipboard.Clear
    Clipboard.SetText sRes
    MsgBox "Les en-t�tes de colonne et les valeurs par d�faut ont �t� copi�es dans le presse-papiers, vous pouvez les coller dans Excel. Les colonnes obligatoires sont pr�c�d�es d'une *", vbInformation, App.Title
  End If
End Sub



' tsLigne1 est un tableau de cha�nes (1�re ligne d'import)
' tsCl�s est un tableau d'�tiquettes cherch�es, commenant par * si l'�tiquette est obligatoire
' Retourne un tableau d'indices de m�me dimension que tsCl�s indiquant l'indice des cl�s dans tsLigne1
' L'indice des cl�s inexistantes dans tsLigne1 vaut -1
' Retourne empty s'il manque une colonne obligatoire
Public Function ChercheColonnes(tsLigne1 As Variant, ByVal tsCl�s As Variant) As Variant
  Dim tind() As Integer
  Dim bColonneObligatoire As Boolean
  Dim bProbl�me As Boolean
  Dim i As Integer, j As Integer
  Dim sColonne As String
  
  ReDim tind(LBound(tsCl�s) To UBound(tsCl�s)) As Integer
  bProbl�me = False
  For i = LBound(tsCl�s) To UBound(tsCl�s)
    tind(i) = -1    ' Pas trouv�
    If Left(tsCl�s(i), 1) = "*" Then
      bColonneObligatoire = True
      tsCl�s(i) = Mid(tsCl�s(i), 2)
    Else
      bColonneObligatoire = False
    End If
    For j = LBound(tsLigne1) To UBound(tsLigne1)
      sColonne = tsLigne1(j)
      ' On accepte que les colonnes en entr�e soient pr�c�d�es d'une *
      If Left(sColonne, 1) = "*" Then sColonne = Mid(sColonne, 2)
      
      If StrComp(tsCl�s(i), sColonne, vbTextCompare) = 0 Then
        tind(i) = j
        Exit For
      End If
    Next
    If tind(i) = -1 And bColonneObligatoire Then
      If Not bShiftPressed Then MsgBox "Colonne " & tsCl�s(i) & " obligatoire non trouv�e dans les donn�es du presse-papiers.", vbExclamation, App.Title
      bProbl�me = True
    End If
  Next
  If bProbl�me Then
    ChercheColonnes = Empty
  Else
    ChercheColonnes = tind
  End If
End Function

