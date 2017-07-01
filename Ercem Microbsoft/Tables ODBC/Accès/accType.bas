Attribute VB_Name = "accType"
' accType
' Module d'accès aux types et gestion d'un cache recordset
' 21/09/1999 PV
' 31/10/2001 PV Cas où le dossier Microbsoft n'est pas accessible en écriture (plantage à l'enregistrement du cache)


Option Explicit

Private rsType As ADODB.Recordset   ' Cache


Private Sub ChargeTypes()
  Dim sNomCacheDisque As String
  sNomCacheDisque = App.Path & "\Cache types.dat"
  
  Screen.MousePointer = vbHourglass
  
  Dim dMaxType As Date
  dMaxType = BDCurseurExpress("select max(timestamp) from libntype")

  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxType
  If Err Then bOkCacheDisque = False
  On Error GoTo 0

  Set rsType = New ADODB.Recordset
  If Not bOkCacheDisque Then
    SetStatus "Téléchargement des types depuis le serveur, patientez..."
    rsType.Fields.Append "key", adVarChar, 20
    rsType.Fields.Append "lnt_t1", adSmallInt
    rsType.Fields.Append "lnt_t2", adSmallInt
    rsType.Fields.Append "lnt_t3", adSmallInt
    rsType.Fields.Append "lnt_t4", adSmallInt
    rsType.Fields.Append "lnt_t5", adSmallInt
    rsType.Fields.Append "lnt_libelle", adVarChar, 120
    rsType.Open
    
    Dim cLNT As New BDCurseur
    cLNT.OpenCurseur "select lnt_t1,lnt_t2,lnt_t3,lnt_t4,lnt_t5,lnt_libelle from libntype"
    Do Until cLNT.EOF
      rsType.AddNew
      rsType!Key = cLNT!lnt_t1 & "." & cLNT!lnt_t2 & "." & cLNT!lnt_t3 & "." & cLNT!lnt_t4 & "." & cLNT!lnt_t5
      rsType!lnt_t1 = cLNT!lnt_t1
      rsType!lnt_t2 = cLNT!lnt_t2
      rsType!lnt_t3 = cLNT!lnt_t3
      rsType!lnt_t4 = cLNT!lnt_t4
      rsType!lnt_t5 = cLNT!lnt_t5
      rsType!lnt_libelle = cLNT!lnt_libelle
      
      cLNT.MoveNext
    Loop
    cLNT.CloseCurseur
    
    On Error Resume Next
    Kill sNomCacheDisque
    On Error GoTo 0
    
    On Error Resume Next    ' Au cas où le dossier Microb'Soft ne soit pas accessible en écriture
    rsType.Save sNomCacheDisque, adPersistXML
    rsType.Close
    SetFileDateTime sNomCacheDisque, dMaxType
    On Error GoTo 0
  End If
  SetStatus "Chargement des types en mémoire"
  On Error Resume Next
  rsType.Open sNomCacheDisque
  On Error GoTo 0
  SetStatus
  Screen.MousePointer = vbDefault
End Sub


Public Sub EffaceCacheTypes()
  If Not rsType Is Nothing Then
    rsType.Close
    Set rsType = Nothing
  End If
End Sub


' Retourne le libellé d'un type, ou une chaîne vide
Public Function sType(ByVal t1 As Long, ByVal t2 As Long, ByVal t3 As Long, ByVal t4 As Long, ByVal t5 As Long) As String
  If rsType Is Nothing Then ChargeTypes
  
  If t1 = 5 Then
    Dim s As String
    s = BDCurseurExpress("select pro_nom from produit where pro_numpro=" & t2)
    If s = "" Then s = "*** Produit inconnu !"
    sType = s
    Exit Function
  End If
 
  On Error Resume Next
  rsType.MoveFirst
  If Err.Number <> 0 Then Exit Function
  On Error GoTo 0
  
  If t1 = 4 Then
    rsType.Find "key='" & 4 & "." & t2 & "." & t3 & "." & t4 & "." & t5 & "'", 0, adSearchForward
    If rsType.EOF Then
      sType = ""
    Else
      sType = rsType!lnt_libelle
    End If
  Else
    If t2 = 0 And t3 = 0 And t4 = 0 And t5 = 0 Then
      Select Case t1
        Case 0: sType = "TOUS LES TYPES"
        Case 1: sType = "TOUS LES TYPES INDUSTRIE"
        Case 2: sType = "TOUS LES TYPES DISTRIBUTION / NON MANIPULÉ"
        Case 3: sType = "TOUS LES TYPES RESTAURATION / MANIPULÉ"
        Case 4: sType = "TOUS LES TYPES SPÉCIFIQUES"
      End Select
    Else
      rsType.Find "key='" & 0 & "." & t2 & "." & t3 & "." & t4 & "." & t5 & "'", 0, adSearchForward
      If rsType.EOF Then
        sType = ""
      Else
        sType = ""
        Select Case t1
          Case 1: sType = "Industrie / "
          Case 2: sType = "Distr-Non man / "
          Case 3: sType = "Rest-Manipulé / "
        End Select
        sType = sType & rsType!lnt_libelle
      End If
    End If
  End If
End Function
