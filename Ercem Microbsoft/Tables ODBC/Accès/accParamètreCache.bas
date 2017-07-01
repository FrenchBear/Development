Attribute VB_Name = "accParamètreCache"
' accParamètre
' Module d'accès aux paramètres
' 4/1/00 PV
' 19/10/2001 PC
' - Gestion cache disque
' - Fonctions renommés avec suffixe "Cache"

Option Explicit

Private m_colParamètre As New Collection

Public Function colParamètreCache() As Collection
  If m_colParamètre.Count = 0 Then ChargeParamètreCache
  Set colParamètreCache = m_colParamètre
End Function

Public Sub ParamètreARechargerCache()
  EffaceCollection m_colParamètre
End Sub

Public Function sNomParamètreCache(sNum As Variant) As String
  If IsNull(sNum) Then
    sNomParamètreCache = ""
  Else
    On Error Resume Next
    sNomParamètreCache = colParamètreCache("P" & Trim(sNum)).ger_libelle
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomParamètreCache = ""
  End If
End Function

Public Function sAbregéParamètreCache(sNum As Variant) As String
  If IsNull(sNum) Then
    sAbregéParamètreCache = ""
  Else
    On Error Resume Next
    sAbregéParamètreCache = colParamètreCache("P" & Trim(sNum)).ger_abrege
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sAbregéParamètreCache = ""
  End If
End Function

Private Sub ChargeParamètreCache()
' PC 18/10/2001
' Chargement de la table des germes avec gestion d'un cache

  Dim curParamètre As New BDCurseur
  Dim p As New Paramètre
  
  Dim imbRep As Integer, smbMsg As String, i As Integer
  Dim iGerIndice As Integer, sGerLibelle As String, sGerLibAbreg As String
  Dim sNomCacheDisque As String
  Dim bOkCacheDisque As Boolean
  
  SetStatus "Chargement des paramètres en mémoire"
  EffaceCollection m_colParamètre
 
  sNomCacheDisque = App.Path & "\Cache paramètres.csv"
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
'    smbMsg = "Échec lors de l'ouverture du cache disque en lecture :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf
    
'    smbMsg = "Échec lors de la lecture dans le cache disque :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf
'    i = 0
    Do While Not EOF(1)
'      i = i + 1: Debug.Print "Ligne : "; i
      Input #1, iGerIndice, sGerLibelle, sGerLibAbreg ' lecture disque
      p.ger_indice = iGerIndice: p.ger_libelle = sGerLibelle: p.ger_abrege = sGerLibAbreg
      ' On ajoute le germe dans la collection
      m_colParamètre.Add p.Copie, "P" & p.ger_indice
    Loop
    
  Else
    
'    smbMsg = "Échec lors de la suppression du cache disque :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf
'    Kill sNomCacheDisque  'cache disque invalide, on l'efface
    
'    smbMsg = "Échec lors de l'ouverture du cache disque en écriture :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf
    Open sNomCacheDisque For Output Access Write Lock Read Write As #1
    curParamètre.OpenCurseur "select ger_indice,ger_libelle,ger_abrege from germe where ger_langue='F' order by ger_indice"
    
 '   smbMsg = "Échec lors de l'écriture dans le cache disque :" & vbCrLf & "'" & _
 '     sNomCacheDisque & "'" & vbCrLf & vbCrLf
    While Not curParamètre.EOF
      p.ger_indice = curParamètre!ger_indice
      p.ger_libelle = curParamètre!ger_libelle
      p.ger_abrege = NV(curParamètre!ger_abrege)
      m_colParamètre.Add p.Copie, "P" & p.ger_indice
      
      Write #1, p.ger_indice, p.ger_libelle, p.ger_abrege ' écriture disque
      
      curParamètre.MoveNext
    Wend
    curParamètre.CloseCurseur
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
      vbCrLf & "Prévenez le service Informatique !"
    imbRep = MsgBox(smbMsg, vbRetryCancel + vbDefaultButton1 + vbExclamation, App.Title)
    If imbRep = vbRetry Then
      Err.Clear
      Resume
    Else
      End ' sortie brutale
    End If
  End Select
End Sub


