Attribute VB_Name = "modGlobal"
' modGlobal
' Saisie des FSE labo
' 14/04/1998 PV
' 16/07/1998 PV Identification du syst�me Unix
' 11/08/1998 PV Fin de App.ExeName (--> App.ExeName)
' 20/08/1998 PV Ev�nement evFinRM
' 27/08/1998 PV Fonction s, timer d'inactivit�
' 12/04/1999 PV Fin de Enum eEv�nement (gestion des �v�nements par leur nom); type de liste dans RemplitComboMilieux
' 20/05/1999 PV Milieux RAP.T, RAP.F et RAPSEL
'  7/07/1999 PV sSourceODBCD�faut


Option Explicit

'Public Const sSourceODBCD�fautD�faut = "labo"
Public Const sSourceODBCD�fautD�faut = ""

Public tLastAction As Single        ' Timer du dernier enregistrement pour le chien de garde

' ListView
Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Any) As Long
Private Const LVM_FIRST As Long = &H1000
Private Const LVM_SETEXTENDEDLISTVIEWSTYLE As Long = LVM_FIRST + 54
Private Const LVM_GETEXTENDEDLISTVIEWSTYLE As Long = LVM_FIRST + 55

Private Const LVS_EX_FULLROWSELECT As Long = &H20

Public Sub SetStatus(Optional ByVal sMessage As String = "")
  MDISaisieLabo.sbStatus.Panels("Message") = sMessage
End Sub

Public Sub SetMessage(Optional ByVal sMessage As String = "")
  MDISaisieLabo.ActiveForm.bdS�l.Message = sMessage
  MDISaisieLabo.ActiveForm.bdS�l.RefreshMessage
End Sub

Public Function sD�codeCBFP(ByVal sCB As String)
' D�codage d'un code barre de fiche de pr�l�vement
' Retourne une r�f�rence du type GK12345601, ou rien si erreur
' PC 21/11/2001 : fonction dor�navant remplac�e par bDecodeCB_FP du module modCodeBarre.bas
'                 laiss� dans le module modGlobal.bas pour compatibilit�

  Const cSite As String = "GAPMOTBCDEFHIJKLNQRSUVWXYZ"
  Dim iSite As Integer, iPrel As Integer, iCS As Integer, iIng As Integer
  Dim iPrest As Long, iEtb As Long
  
  sD�codeCBFP = ""
  If Len(sCB) <> 18 Or Not IsNumeric(sCB) Then
    MsgBox "Code barre d'�chantillon incorrect !", vbExclamation, App.Title
    Exit Function
  End If
  
  iSite = Val(Left(sCB, 3))
  iPrest = Val(Mid(sCB, 4, 6))
  iPrel = Val(Mid(sCB, 10, 2))
  iEtb = Val(Mid(sCB, 12, 5))
  iCS = Val(Mid(sCB, 17, 2))
  
  ' V�rification de la somme de contr�le
  ' Formule stupide, le premier chiffre n'est pas pris en compte (on multiplie par z�ro�)
  Dim i As Integer, iCS2 As Integer
  For i = 0 To 15
    iCS2 = iCS2 + (Asc(Mid(sCB, i + 1, 1)) - 48) * i
  Next
  iCS2 = iCS2 Mod 100
  If iCS <> iCS2 Then
    MsgBox "Erreur de check-sum !" & vbCrLf & "Lu: " & iCS & "  Calcul�: " & iCS2, vbExclamation, App.Title
  Else
    iIng = iSite Mod 26
    iSite = iSite \ 26
    sD�codeCBFP = Mid(cSite, iSite + 1, 1) & Chr(65 + iIng) & iPrest & Right(Str(100 + iPrel), 2)
  End If
End Function

' Pluriels�
Public Function s(n) As String
  If n > 1 Then
    s = "s"
  Else
    s = ""
  End If
End Function

Public Sub RAZTimerInactif()
  tLastAction = Timer
End Sub

' =================================================================================
' S�lection de ligne compl�te dans les ListView
' Bricolage en attendant le VB6

Public Sub ListViewFullRowSelect(lv As ListView)
   Dim nStyle As Long
   
   nStyle = SendMessage(lv.hWnd, LVM_GETEXTENDEDLISTVIEWSTYLE, 0&, ByVal 0&)
   nStyle = nStyle Or LVS_EX_FULLROWSELECT
   SendMessage lv.hWnd, LVM_SETEXTENDEDLISTVIEWSTYLE, 0&, ByVal nStyle
End Sub

' =================================================================================
' Remplit une combo avec la liste des milieux valides
' iTypeListe:
' 0: Tous les milieux
' 1: PCA(1), VRBL(2), TSN(4), PM(44)
' 2: RAP.T(41), SLN(47), RAP.F(56), RAPSEL(57)

Public Sub RemplitComboMilieux(bdc As BDCombo, iTypeListe As Integer)
  bdc.Clear
  Dim m As Milieu
  For Each m In colMilieu
    Select Case iTypeListe
      Case 0:
        bdc.AddItem m.mil_abrege, m.mil_libelle
        
      Case 1:
        If m.mil_indice = 1 Or m.mil_indice = 2 Or m.mil_indice = 4 Or m.mil_indice = 44 Then
          bdc.AddItem m.mil_abrege, m.mil_libelle
        End If
        
      Case 2:
        If m.mil_indice = 41 Or m.mil_indice = 47 Or m.mil_indice = 56 Or m.mil_indice = 57 Then
          bdc.AddItem m.mil_abrege, m.mil_libelle
        End If
    End Select
  Next
End Sub

' =================================================================================
' Etuves disponibles en fonction du milieu, de la supers�rie, de �

Public Sub EtuvesDispo(frm As Form, lv As ListView, btn As CommandButton, ByVal iMilieu As Integer, ByVal iSS As Integer)
  Dim sJour As String
  sJour = Format(Weekday(Now) - vbSunday)

  lv.ListItems.Clear
  Dim cEtu As New BDCurseur
  Dim sSQL As String
  sSQL = "select etu_numero,etu_germe,etu_dureeinc,etu_remarques from etuve where etu_jour matches '*" & sJour & "*' and etu_milieu=" & iMilieu & " and " & iSS & ">=etu_ssmin and " & iSS & "<=etu_ssmax"
  cEtu.OpenCurseur sSQL
  While Not cEtu.EOF
    Dim itmX As ListItem
    Set itmX = lv.ListItems.Add
    itmX.Text = cEtu!etu_numero
    itmX.SubItems(1) = cEtu!etu_germe
    itmX.SubItems(2) = cEtu!etu_dureeinc
    itmX.SubItems(3) = NV(cEtu!etu_remarques)
    cEtu.MoveNext
  Wend
  cEtu.CloseCurseur
  AjusteListView frm, lv
  btn.Visible = False
  lv.Visible = True
  lv.SetFocus
End Sub

' =================================================================================
' Contr�le qu'un n� d'�tuve enregistr� avec l'�v�nement H4 est correct
' et contient optionnellement la dur�e d'incubation
 
Public Function bContr�leEtuve(sTexte As String) As Boolean
  bContr�leEtuve = False
  
  If sTexte = "" Then
    MsgBox "Le n� d'�tuve est obligatoire.", vbExclamation, App.Title
    Exit Function
  End If
  
  Dim sDur�eInc As String
  Dim p As Integer
  p = InStr(sTexte, "/")
  If p > 0 Then
    sDur�eInc = Mid(sTexte, p + 1)
    sTexte = Left(sTexte, p - 1)
  End If
  
  ' On ne contr�le pas en d�tail pour l'instant le n� d'�tuve
  ' On v�rifie simplement qu'il est num�rique entre 0 et 50
  Dim bMauvaisNo As Boolean
  bMauvaisNo = True
  If IsNumeric(sTexte) Then
    Dim v As Variant
    v = CDbl(sTexte)
    If v = Int(v) And v >= 0 And v <= 50 Then bMauvaisNo = False
  End If
  If bMauvaisNo Then
    MsgBox "N� d'�tuve invalide: doit �tre num�rique, entre 0 et 50", vbExclamation, App.Title
    Exit Function
  End If
  
  If sDur�eInc <> "" Then
    bMauvaisNo = True
    If IsNumeric(sDur�eInc) Then
      v = CDbl(sDur�eInc)
      If v = Int(v) And v >= 1 And v <= 144 Then bMauvaisNo = False
    End If
    If bMauvaisNo Then
      MsgBox "Dur�e d'incubation invalide: doit �tre num�rique, entre 1 et 144 heures", vbExclamation, App.Title
      Exit Function
    End If
  End If

  bContr�leEtuve = True
End Function
