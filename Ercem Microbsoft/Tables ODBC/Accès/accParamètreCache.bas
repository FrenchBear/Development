Attribute VB_Name = "accParam�treCache"
' accParam�tre
' Module d'acc�s aux param�tres
' 4/1/00 PV
' 19/10/2001 PC
' - Gestion cache disque
' - Fonctions renomm�s avec suffixe "Cache"

Option Explicit

Private m_colParam�tre As New Collection

Public Function colParam�treCache() As Collection
  If m_colParam�tre.Count = 0 Then ChargeParam�treCache
  Set colParam�treCache = m_colParam�tre
End Function

Public Sub Param�treARechargerCache()
  EffaceCollection m_colParam�tre
End Sub

Public Function sNomParam�treCache(sNum As Variant) As String
  If IsNull(sNum) Then
    sNomParam�treCache = ""
  Else
    On Error Resume Next
    sNomParam�treCache = colParam�treCache("P" & Trim(sNum)).ger_libelle
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomParam�treCache = ""
  End If
End Function

Public Function sAbreg�Param�treCache(sNum As Variant) As String
  If IsNull(sNum) Then
    sAbreg�Param�treCache = ""
  Else
    On Error Resume Next
    sAbreg�Param�treCache = colParam�treCache("P" & Trim(sNum)).ger_abrege
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sAbreg�Param�treCache = ""
  End If
End Function

Private Sub ChargeParam�treCache()
' PC 18/10/2001
' Chargement de la table des germes avec gestion d'un cache

  Dim curParam�tre As New BDCurseur
  Dim p As New Param�tre
  
  Dim imbRep As Integer, smbMsg As String, i As Integer
  Dim iGerIndice As Integer, sGerLibelle As String, sGerLibAbreg As String
  Dim sNomCacheDisque As String
  Dim bOkCacheDisque As Boolean
  
  SetStatus "Chargement des param�tres en m�moire"
  EffaceCollection m_colParam�tre
 
  sNomCacheDisque = App.Path & "\Cache param�tres.csv"
  On Error Resume Next
  Open sNomCacheDisque For Input Access Read Lock Read Write As #1
'  bOkCacheDisque = FileDateTime(sNomCacheDisque) < 0
  If Err = 0 Then
    bOkCacheDisque = True
  Else
    bOkCacheDisque = False
  End If
  On Error GoTo 0
'  On Error GoTo GestErr

  If bOkCacheDisque Then
'    smbMsg = "�chec lors de l'ouverture du cache disque en lecture :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf
    
'    smbMsg = "�chec lors de la lecture dans le cache disque :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf
'    i = 0
    Do While Not EOF(1)
'      i = i + 1: Debug.Print "Ligne : "; i
      Input #1, iGerIndice, sGerLibelle, sGerLibAbreg ' lecture disque
      p.ger_indice = iGerIndice: p.ger_libelle = sGerLibelle: p.ger_abrege = sGerLibAbreg
      ' On ajoute le germe dans la collection
      m_colParam�tre.Add p.Copie, "P" & p.ger_indice
    Loop
    
  Else
    
'    smbMsg = "�chec lors de la suppression du cache disque :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf
'    Kill sNomCacheDisque  'cache disque invalide, on l'efface
    
'    smbMsg = "�chec lors de l'ouverture du cache disque en �criture :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf
    Open sNomCacheDisque For Output Access Write Lock Read Write As #1
    curParam�tre.OpenCurseur "select ger_indice,ger_libelle,ger_abrege from germe where ger_langue='F' order by ger_indice"
    
 '   smbMsg = "�chec lors de l'�criture dans le cache disque :" & vbCrLf & "'" & _
 '     sNomCacheDisque & "'" & vbCrLf & vbCrLf
    While Not curParam�tre.EOF
      p.ger_indice = curParam�tre!ger_indice
      p.ger_libelle = curParam�tre!ger_libelle
      p.ger_abrege = NV(curParam�tre!ger_abrege)
      m_colParam�tre.Add p.Copie, "P" & p.ger_indice
      
      Write #1, p.ger_indice, p.ger_libelle, p.ger_abrege ' �criture disque
      
      curParam�tre.MoveNext
    Wend
    curParam�tre.CloseCurseur
  End If
  Close #1
  SetStatus
  
  Exit Sub

GestErr:
  Select Case Err.Number
  Case 53 ' fichier introuvable sur Kill
    Resume Next
  Case Else
    smbMsg = smbMsg & "Err : " & Err.Number & "- " & Err.Description & _
      vbCrLf & "Pr�venez le service Informatique !"
    imbRep = MsgBox(smbMsg, vbRetryCancel + vbDefaultButton1 + vbExclamation, App.Title)
    If imbRep = vbRetry Then
      Err.Clear
      Resume
    Else
      End ' sortie brutale
    End If
  End Select
End Sub


