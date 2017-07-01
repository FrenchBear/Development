Attribute VB_Name = "AccDocument"
' AccDocument
' Fonctions d'accès aux documents, et fonctions de gestion des documents
' 01/02/1999 PV

Option Explicit

' Recherche des documents
' En retour, remplit la collection de documents
Public Sub RechercheDocuments(col As Collection, sReqDoc As String, sReqEtb As String, bOuter As Boolean)
  Static iSerial As Long
  
  EffaceCollection col
  Bloquer
    Dim br As New Rev
    br.AddField sReqDoc
    br.AddField sReqEtb
    br.AddField bOuter
    
    tcps.Envoie "RDOC " & br.Buffer
    Dim d As Document
    Dim sLigne As String
    Dim oper, ts, v     ' Variants
    Do
      sLigne = tcps.Reçoit
      If sLigne = "->" Then Exit Do
      br.Buffer = sLigne
      
      Set d = New Document
      br.GetField v: d.pla_systeme = v
      br.GetField v: d.pla_serial = v
      br.GetField v: d.pla_etb = v
      br.GetField v: d.pla_dateplan = v
      br.GetField v: d.pla_lettres = v
      br.GetField v: d.pla_iref = v
      br.GetField v: d.etb_prefixe = v
      br.GetField v: d.etb_nom = v
      br.GetField v
      If IsNull(v) Then     ' Si null (à cause du outer), on génère un pseudo-serial interne négatif
        iSerial = iSerial + 1
        d.doc_serial = -iSerial
      Else
        d.doc_serial = v
      End If
      br.GetField v: d.doc_classe = v
      br.GetField v: d.doc_refdoc = v
      br.GetField v: d.doc_plasysteme = v
      br.GetField v: d.doc_plaserial = v
      br.GetField v: d.doc_titre = v
      br.GetField v: d.doc_etat = v
      br.GetField oper, ts: d.doc_ts(0) = ts: d.doc_oper(0) = oper
      br.GetField oper, ts: d.doc_ts(1) = ts: d.doc_oper(1) = oper
      br.GetField oper, ts: d.doc_ts(2) = ts: d.doc_oper(2) = oper
      br.GetField oper, ts: d.doc_ts(3) = ts: d.doc_oper(3) = oper
      br.GetField oper, ts: d.doc_ts(4) = ts: d.doc_oper(4) = oper
      br.GetField oper, ts: d.doc_ts(5) = ts: d.doc_oper(5) = oper
      br.GetField oper, ts: d.doc_ts(6) = ts: d.doc_oper(6) = oper
      br.GetField oper, ts: d.doc_ts(7) = ts: d.doc_oper(7) = oper
      br.GetField oper, ts: d.doc_ts(8) = ts: d.doc_oper(8) = oper
      br.GetField v: d.doc_assval = v
      br.GetField v: d.doc_opervallabo = v
      br.GetField v: d.doc_tsvallabo = v
      br.GetField v: d.timestamp = v
      br.GetField v: d.doc_horsdelai = v
      br.GetField v: d.nbex = v
      
      col.Add d, "D" & d.doc_serial
      Set d = Nothing
    Loop
  Relâcher

End Sub


' Teste si un n° de socument est valide pour un ajout sur une référence
' d est un document quelconque de l'intervention
Public Function bTesteRef(d As Document, ByVal sClasse As String, ByRef sNoDocument As String) As Boolean
  Dim br As New Rev, sLigne As String
  
  Bloquer
    br.AddField d.pla_systeme
    br.AddField d.pla_serial
    br.AddField sClasse
    If sNoDocument = "" Then
      br.AddField Null
    Else
      br.AddField CInt(sNoDocument)
    End If
    tcps.Envoie "OKND " & br.Buffer
    
    Dim bRésultat As Boolean, iNum As Integer
    sLigne = tcps.Reçoit
    br.Buffer = sLigne
    br.GetField bRésultat, iNum
    
    AttendSynchro
  Relâcher
  
  If bRésultat Then sNoDocument = iNum
  bTesteRef = bRésultat
End Function



' Supprime un document de la base
' Les contrôles préliminaires ont été effectués
Public Sub SupprimeDocument(d As Document)
  Dim br As New Rev
  Bloquer
    br.AddField d.doc_serial

    tcps.Envoie "SUPD " & br.Buffer
    AttendSynchro
  Relâcher
  
  Dim sTrace As String
  sTrace = "Intervention " & d.pla_lettres & d.pla_iref & " " & d.pla_dateplan & "|Etb: " & d.pla_etb & ": " & d.etb_prefixe & " " & d.etb_nom & "|" & d.doc_classe & " " & d.doc_refdoc
  DémonJournalUnix "document", "suppression", sTrace
End Sub



' Ajout d'un document dans la base
Public Function bAjouteDocument(dModèle As Document, dNouvDoc As Document, sClasse As String, sNo As String) As Boolean

  MsgBox "bAjouteDocument: à implanter !"
  
  Set dNouvDoc = dModèle.Copie
  dNouvDoc.doc_serial = -Int(1000000 * Rnd) ' en attendant le démon
  dNouvDoc.doc_classe = sClasse
  dNouvDoc.doc_refdoc = sNo
  dNouvDoc.doc_etat = "0"
  
  Dim i As Integer
  For i = 0 To 8
    dNouvDoc.doc_oper(i) = Null
    dNouvDoc.doc_ts(i) = Null
  Next
  
  bAjouteDocument = True
End Function



Public Sub MajValidLabo(ByRef d As Document, iOpérateur As Integer, ts As Date)
  Dim br As New Rev
  Bloquer
    br.AddField d.doc_serial
    br.AddField d.doc_etat
    br.AddField iOpérateur
    br.AddField ts

    tcps.Envoie "MVL " & br.Buffer
    AttendSynchro
  Relâcher
  
  d.doc_opervallabo = iOpérateur
  d.doc_tsvallabo = ts
  If d.doc_etat = "4" Then
    d.doc_etat = "5"
    d.doc_ts(5) = Now
    d.doc_oper(5) = iOpérateur
  End If
End Sub


' Mise à jour de l'état d'un document, dans la table document
' et en mémoire
' Modifications selon iOperation :
' 0: maj état et timestamp du niveau
' 1: maj timestamp du niveau
' 2: maj etat

Public Sub MajEtat(d As Document, iNiveau As Integer, iOpération As Integer, Optional iAssVal)
  Assert iNiveau >= 0 And iNiveau <= 7
  Assert iOpération >= 0 And iOpération <= 2

  Dim br As New Rev
  Bloquer
    br.AddField d.doc_serial
    br.AddField iNiveau
    br.AddField iOpération
    If IsMissing(iAssVal) Then
      br.AddField ""
    Else
      br.AddField CInt(iAssVal)
    End If

    tcps.Envoie "MET " & br.Buffer
    AttendSynchro
  Relâcher
  
  If iOpération = 0 Or iOpération = 1 Then
    d.doc_ts(iNiveau) = Now
    d.doc_oper(iNiveau) = iNumOpérateur
    
    If iNiveau = 4 Then
      Assert Not IsMissing(iAssVal)
      d.doc_assval = CInt(iAssVal)
    End If
  End If

  If iOpération = 0 Or iOpération = 2 Then
    d.doc_etat = Chr(Asc("0") + iNiveau)
  End If
End Sub



Public Sub MajRefTitre(d As Document, sNRef As String, sNTitre As String)
  Dim br As New Rev
  Bloquer
    br.AddField d.doc_serial
    br.AddField sNRef
    br.AddField sNTitre

    tcps.Envoie "MRT " & br.Buffer
    AttendSynchro
  Relâcher
  
  d.doc_refdoc = sNRef
  d.doc_titre = sNTitre
End Sub

