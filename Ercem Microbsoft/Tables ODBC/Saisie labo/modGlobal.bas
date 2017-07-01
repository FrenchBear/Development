Attribute VB_Name = "modGlobal"
' modGlobal
' Saisie des FSE labo
' 14/04/1998 PV
' 16/07/1998 PV Identification du système Unix
' 11/08/1998 PV Fin de App.ExeName (--> App.ExeName)
' 20/08/1998 PV Evénement evFinRM
' 27/08/1998 PV Fonction s, timer d'inactivité
' 12/04/1999 PV Fin de Enum eEvénement (gestion des événements par leur nom); type de liste dans RemplitComboMilieux
' 20/05/1999 PV Milieux RAP.T, RAP.F et RAPSEL
'  7/07/1999 PV sSourceODBCDéfaut


Option Explicit

'Public Const sSourceODBCDéfautDéfaut = "labo"
Public Const sSourceODBCDéfautDéfaut = ""

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
  MDISaisieLabo.ActiveForm.bdSél.Message = sMessage
  MDISaisieLabo.ActiveForm.bdSél.RefreshMessage
End Sub

Public Function sDécodeCBFP(ByVal sCB As String)
' Décodage d'un code barre de fiche de prélèvement
' Retourne une référence du type GK12345601, ou rien si erreur
' PC 21/11/2001 : fonction dorénavant remplacée par bDecodeCB_FP du module modCodeBarre.bas
'                 laissé dans le module modGlobal.bas pour compatibilité

  Const cSite As String = "GAPMOTBCDEFHIJKLNQRSUVWXYZ"
  Dim iSite As Integer, iPrel As Integer, iCS As Integer, iIng As Integer
  Dim iPrest As Long, iEtb As Long
  
  sDécodeCBFP = ""
  If Len(sCB) <> 18 Or Not IsNumeric(sCB) Then
    MsgBox "Code barre d'échantillon incorrect !", vbExclamation, App.Title
    Exit Function
  End If
  
  iSite = Val(Left(sCB, 3))
  iPrest = Val(Mid(sCB, 4, 6))
  iPrel = Val(Mid(sCB, 10, 2))
  iEtb = Val(Mid(sCB, 12, 5))
  iCS = Val(Mid(sCB, 17, 2))
  
  ' Vérification de la somme de contrôle
  ' Formule stupide, le premier chiffre n'est pas pris en compte (on multiplie par zéro…)
  Dim i As Integer, iCS2 As Integer
  For i = 0 To 15
    iCS2 = iCS2 + (Asc(Mid(sCB, i + 1, 1)) - 48) * i
  Next
  iCS2 = iCS2 Mod 100
  If iCS <> iCS2 Then
    MsgBox "Erreur de check-sum !" & vbCrLf & "Lu: " & iCS & "  Calculé: " & iCS2, vbExclamation, App.Title
  Else
    iIng = iSite Mod 26
    iSite = iSite \ 26
    sDécodeCBFP = Mid(cSite, iSite + 1, 1) & Chr(65 + iIng) & iPrest & Right(Str(100 + iPrel), 2)
  End If
End Function

' Pluriels…
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
' Sélection de ligne complète dans les ListView
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
' Etuves disponibles en fonction du milieu, de la supersérie, de …

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
' Contrôle qu'un n° d'étuve enregistré avec l'événement H4 est correct
' et contient optionnellement la durée d'incubation
 
Public Function bContrôleEtuve(sTexte As String) As Boolean
  bContrôleEtuve = False
  
  If sTexte = "" Then
    MsgBox "Le n° d'étuve est obligatoire.", vbExclamation, App.Title
    Exit Function
  End If
  
  Dim sDuréeInc As String
  Dim p As Integer
  p = InStr(sTexte, "/")
  If p > 0 Then
    sDuréeInc = Mid(sTexte, p + 1)
    sTexte = Left(sTexte, p - 1)
  End If
  
  ' On ne contrôle pas en détail pour l'instant le n° d'étuve
  ' On vérifie simplement qu'il est numérique entre 0 et 50
  Dim bMauvaisNo As Boolean
  bMauvaisNo = True
  If IsNumeric(sTexte) Then
    Dim v As Variant
    v = CDbl(sTexte)
    If v = Int(v) And v >= 0 And v <= 50 Then bMauvaisNo = False
  End If
  If bMauvaisNo Then
    MsgBox "N° d'étuve invalide: doit être numérique, entre 0 et 50", vbExclamation, App.Title
    Exit Function
  End If
  
  If sDuréeInc <> "" Then
    bMauvaisNo = True
    If IsNumeric(sDuréeInc) Then
      v = CDbl(sDuréeInc)
      If v = Int(v) And v >= 1 And v <= 144 Then bMauvaisNo = False
    End If
    If bMauvaisNo Then
      MsgBox "Durée d'incubation invalide: doit être numérique, entre 1 et 144 heures", vbExclamation, App.Title
      Exit Function
    End If
  End If

  bContrôleEtuve = True
End Function
