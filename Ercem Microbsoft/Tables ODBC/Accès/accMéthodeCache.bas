Attribute VB_Name = "accM�thodCache"
' accM�thode
' Module d'acc�s aux M�thodes
' 4/1/00 PV
' 19/10/2001 PC
' accM�thodeCache
' - Ajout de la gestion d'un cache
' - fonctions renomm�es avec ajout du suffixe "Cache"

Option Explicit

Private m_colM�thode As New Collection

Public Function colM�thodeCache() As Collection
  If m_colM�thode.Count = 0 Then ChargeM�thodeCache
  Set colM�thodeCache = m_colM�thode
End Function

Public Sub M�thodeARechargerCache()
  EffaceCollection m_colM�thode
End Sub

Public Function sNomM�thodeCache(iParam�tre As Integer, sM�thode As String) As String
  On Error Resume Next
  sNomM�thodeCache = colM�thodeCache("M" & iParam�tre & "," & sM�thode).met_libelle
  'If Err = 0 And sNomM�thodeCache <> "" Then Exit Function
  If Err <> 0 Then sNomM�thodeCache = ""
  On Error GoTo 0
  
'  Select Case sM�thode
'    Case "*":   sNomM�thodeCache = "Toutes m�thodes"
'    Case "a":   sNomM�thodeCache = "M�thode AFNOR"
'    Case "s":   sNomM�thodeCache = "M�thode SILLIKER"
'    Case Else:  sNomM�thodeCache = "M�thode " & sM�thode
'  End Select
End Function

Private Sub ChargeM�thodeCache()
' PC 18/10/2001
' Chargement de la table des m�thodes avec gestion d'un cache

  Dim curM�thode As New BDCurseur
  Dim p As New M�thode2
  
  Dim iMbRep As Integer, sMbMsg As String ' r�ponse et message de boite de message
  ' variables d'acc�s fichier texte de cache
  Dim iMetGerme As Integer, sMetMethode As String, sMetLibelle As String
  Dim sNomCacheDisque As String
  Dim bOkCacheDisque As Boolean
  
  SetStatus "Chargement des m�thodes en m�moire"
  EffaceCollection m_colM�thode
  
  sNomCacheDisque = App.Path & "\Cache Methodes.csv"
'  sMbMsg = "�chec lors de l'ouverture du cache disque en lecture :" & vbCrLf & "'" & _
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
'    smbMsg = "�chec lors de la lecture dans le cache disque :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf
    Do While Not EOF(1)
      ' lecture cache disque
      Input #1, iMetGerme, sMetMethode, sMetLibelle
      ' On ajoute la m�thode dans la collection
      p.met_germe = iMetGerme: p.met_methode = sMetMethode: p.met_libelle = NV(sMetLibelle)
      m_colM�thode.Add p.Copie, "M" & iMetGerme & "," & sMetMethode
    Loop
    
  Else
'    smbMsg = "�chec lors de la suppression du cache disque :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf
'    Kill sNomCacheDisque  'cache disque invalide, on l'efface
'
'    smbMsg = "�chec lors de l'ouverture du cache disque en �criture :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf
    Open sNomCacheDisque For Output Access Write Lock Read Write As #1
    curM�thode.OpenCurseur "select met_germe,met_methode,met_libelle from methode order by met_germ,met_methode,met_libelle"
'    smbMsg = "�chec lors de l'�criture dans le cache disque :" & vbCrLf & "'" & _
'      sNomCacheDisque & "'" & vbCrLf & vbCrLf

    While Not curM�thode.EOF
      ' collection
      p.met_libelle = NV(curM�thode!met_libelle)
      p.met_germe = curM�thode!met_germe: p.met_methode = curM�thode!met_methode
      m_colM�thode.Add p.Copie, "M" & p.met_germe & "," & p.met_methode
      ' cache disque
      iMetGerme = p.met_germe: sMetMethode = p.met_methode: sMetLibelle = p.met_libelle
      Write #1, iMetGerme, sMetMethode, sMetLibelle ' �criture disque
      curM�thode.MoveNext
    Wend
    curM�thode.CloseCurseur
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
      vbCrLf & "Pr�venez le service Informatique !"
    iMbRep = MsgBox(sMbMsg, vbRetryCancel + vbDefaultButton1 + vbExclamation, App.Title)
    If iMbRep = vbRetry Then
      Resume
    Else
      End ' sortie brutale
    End If
  End Select
End Sub

