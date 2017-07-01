Attribute VB_Name = "accMéthodCache"
' accMéthode
' Module d'accès aux Méthodes
' 4/1/00 PV
' 19/10/2001 PC
' accMéthodeCache
' - Ajout de la gestion d'un cache
' - fonctions renommées avec ajout du suffixe "Cache"

Option Explicit

Private m_colMéthode As New Collection

Public Function colMéthodeCache() As Collection
  If m_colMéthode.Count = 0 Then ChargeMéthodeCache
  Set colMéthodeCache = m_colMéthode
End Function

Public Sub MéthodeARechargerCache()
  EffaceCollection m_colMéthode
End Sub

Public Function sNomMéthodeCache(iParamètre As Integer, sMéthode As String) As String
  On Error Resume Next
  sNomMéthodeCache = colMéthodeCache("M" & iParamètre & "," & sMéthode).met_libelle
  'If Err = 0 And sNomMéthodeCache <> "" Then Exit Function
  If Err <> 0 Then sNomMéthodeCache = ""
  On Error GoTo 0
  
'  Select Case sMéthode
'    Case "*":   sNomMéthodeCache = "Toutes méthodes"
'    Case "a":   sNomMéthodeCache = "Méthode AFNOR"
'    Case "s":   sNomMéthodeCache = "Méthode SILLIKER"
'    Case Else:  sNomMéthodeCache = "Méthode " & sMéthode
'  End Select
End Function

Private Sub ChargeMéthodeCache()
' PC 18/10/2001
' Chargement de la table des méthodes avec gestion d'un cache

  Dim curMéthode As New BDCurseur
  Dim p As New Méthode2
  
  Dim iMbRep As Integer, sMbMsg As String ' réponse et message de boite de message
  ' variables d'accès fichier texte de cache
  Dim iMetGerme As Integer, sMetMethode As String, sMetLibelle As String
  Dim sNomCacheDisque As String
  Dim bOkCacheDisque As Boolean
  
  SetStatus "Chargement des méthodes en mémoire"
  EffaceCollection m_colMéthode
  
  sNomCacheDisque = App.Path & "\Cache Methodes.csv"
'  sMbMsg = "Échec lors de l'ouverture du cache disque en lecture :" & vbCrLf & "'" & _
'    sNomCacheDisque & "'" & vbCrLf & vbCrLf
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
'    smbMsg = "Échec lors de la lecture dans le cache disque :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf
    Do While Not EOF(1)
      ' lecture cache disque
      Input #1, iMetGerme, sMetMethode, sMetLibelle
      ' On ajoute la méthode dans la collection
      p.met_germe = iMetGerme: p.met_methode = sMetMethode: p.met_libelle = NV(sMetLibelle)
      m_colMéthode.Add p.Copie, "M" & iMetGerme & "," & sMetMethode
    Loop
    
  Else
'    smbMsg = "Échec lors de la suppression du cache disque :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf
'    Kill sNomCacheDisque  'cache disque invalide, on l'efface
'
'    smbMsg = "Échec lors de l'ouverture du cache disque en écriture :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf
    Open sNomCacheDisque For Output Access Write Lock Read Write As #1
    curMéthode.OpenCurseur "select met_germe,met_methode,met_libelle from methode order by met_germ,met_methode,met_libelle"
'    smbMsg = "Échec lors de l'écriture dans le cache disque :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf

    While Not curMéthode.EOF
      ' collection
      p.met_libelle = NV(curMéthode!met_libelle)
      p.met_germe = curMéthode!met_germe: p.met_methode = curMéthode!met_methode
      m_colMéthode.Add p.Copie, "M" & p.met_germe & "," & p.met_methode
      ' cache disque
      iMetGerme = p.met_germe: sMetMethode = p.met_methode: sMetLibelle = p.met_libelle
      Write #1, iMetGerme, sMetMethode, sMetLibelle ' écriture disque
      curMéthode.MoveNext
    Wend
    curMéthode.CloseCurseur
  End If
  Close #1
  SetStatus
  
  Exit Sub

GestErr:
  Select Case Err.Number
  Case 53 ' fichier introuvable sur Kill
    Resume Next
  Case Else
    sMbMsg = sMbMsg & "Err : " & Err.Number & "- " & Err.Description & _
      vbCrLf & "Prévenez le service Informatique !"
    iMbRep = MsgBox(sMbMsg, vbRetryCancel + vbDefaultButton1 + vbExclamation, App.Title)
    If iMbRep = vbRetry Then
      Resume
    Else
      End ' sortie brutale
    End If
  End Select
End Sub

