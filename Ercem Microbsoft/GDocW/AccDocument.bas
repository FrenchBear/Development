Attribute VB_Name = "AccDocument"
' AccDocument
' Fonctions d'acc�s aux documents, et fonctions de gestion des documents
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
      sLigne = tcps.Re�oit
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
      If IsNull(v) Then     ' Si null (� cause du outer), on g�n�re un pseudo-serial interne n�gatif
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
  Rel�cher

End Sub


' Teste si un n� de socument est valide pour un ajout sur une r�f�rence
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
    
    Dim bR�sultat As Boolean, iNum As Integer
    sLigne = tcps.Re�oit
    br.Buffer = sLigne
    br.GetField bR�sultat, iNum
    
    AttendSynchro
  Rel�cher
  
  If bR�sultat Then sNoDocument = iNum
  bTesteRef = bR�sultat
End Function



' Supprime un document de la base
' Les contr�les pr�liminaires ont �t� effectu�s
Public Sub SupprimeDocument(d As Document)
  Dim br As New Rev
  Bloquer
    br.AddField d.doc_serial

    tcps.Envoie "SUPD " & br.Buffer
    AttendSynchro
  Rel�cher
  
  Dim sTrace As String
  sTrace = "Intervention " & d.pla_lettres & d.pla_iref & " " & d.pla_dateplan & "|Etb: " & d.pla_etb & ": " & d.etb_prefixe & " " & d.etb_nom & "|" & d.doc_classe & " " & d.doc_refdoc
  D�monJournalUnix "document", "suppression", sTrace
End Sub



' Ajout d'un document dans la base
Public Function bAjouteDocument(dMod�le As Document, dNouvDoc As Document, sClasse As String, sNo As String) As Boolean

  MsgBox "bAjouteDocument: � implanter !"
  
  Set dNouvDoc = dMod�le.Copie
  dNouvDoc.doc_serial = -Int(1000000 * Rnd) ' en attendant le d�mon
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



Public Sub MajValidLabo(ByRef d As Document, iOp�rateur As Integer, ts As Date)
  Dim br As New Rev
  Bloquer
    br.AddField d.doc_serial
    br.AddField d.doc_etat
    br.AddField iOp�rateur
    br.AddField ts

    tcps.Envoie "MVL " & br.Buffer
    AttendSynchro
  Rel�cher
  
  d.doc_opervallabo = iOp�rateur
  d.doc_tsvallabo = ts
  If d.doc_etat = "4" Then
    d.doc_etat = "5"
    d.doc_ts(5) = Now
    d.doc_oper(5) = iOp�rateur
  End If
End Sub


' Mise � jour de l'�tat d'un document, dans la table document
' et en m�moire
' Modifications selon iOperation :
' 0: maj �tat et timestamp du niveau
' 1: maj timestamp du niveau
' 2: maj etat

Public Sub MajEtat(d As Document, iNiveau As Integer, iOp�ration As Integer, Optional iAssVal)
  Assert iNiveau >= 0 And iNiveau <= 7
  Assert iOp�ration >= 0 And iOp�ration <= 2

  Dim br As New Rev
  Bloquer
    br.AddField d.doc_serial
    br.AddField iNiveau
    br.AddField iOp�ration
    If IsMissing(iAssVal) Then
      br.AddField ""
    Else
      br.AddField CInt(iAssVal)
    End If

    tcps.Envoie "MET " & br.Buffer
    AttendSynchro
  Rel�cher
  
  If iOp�ration = 0 Or iOp�ration = 1 Then
    d.doc_ts(iNiveau) = Now
    d.doc_oper(iNiveau) = iNumOp�rateur
    
    If iNiveau = 4 Then
      Assert Not IsMissing(iAssVal)
      d.doc_assval = CInt(iAssVal)
    End If
  End If

  If iOp�ration = 0 Or iOp�ration = 2 Then
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
  Rel�cher
  
  d.doc_refdoc = sNRef
  d.doc_titre = sNTitre
End Sub

