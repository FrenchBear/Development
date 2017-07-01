Attribute VB_Name = "accItem"
' accItem
' Module d'accès aux items et gestion d'un cache recordset
' 17/11/1999 NC

Option Explicit

Private rsItem As ADODB.Recordset   ' Cache


Private Sub ChargeItems()
  Dim sNomCacheDisque As String
  sNomCacheDisque = App.Path & "\Cache items.dat"
  
  Screen.MousePointer = vbHourglass
  
  Dim dMaxItem As Date
  dMaxItem = BDCurseurExpress("select max(timestamp) from items")

  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxItem
  If Err Then bOkCacheDisque = False
  On Error GoTo 0

  Set rsItem = New ADODB.Recordset
  If Not bOkCacheDisque Then
    SetStatus "Téléchargement des items depuis le serveur, patientez..."
    rsItem.Fields.Append "key", adVarChar, 20
    rsItem.Fields.Append "lnt_t1", adSmallInt
    rsItem.Fields.Append "lnt_t2", adSmallInt
    rsItem.Fields.Append "lnt_t3", adSmallInt
    rsItem.Fields.Append "lnt_t4", adSmallInt
    rsItem.Fields.Append "lnt_t5", adSmallInt
    rsItem.Fields.Append "lnt_libelle", adVarChar, 120
    rsItem.Open
    
    Dim cLNT As New BDCurseur
    cLNT.OpenCurseur "select lnt_t1,lnt_t2,lnt_t3,lnt_t4,lnt_t5,lnt_libelle from libntype"
    Do Until cLNT.EOF
      rsItem.AddNew
      rsItem!Key = cLNT!lnt_t1 & "." & cLNT!lnt_t2 & "." & cLNT!lnt_t3 & "." & cLNT!lnt_t4 & "." & cLNT!lnt_t5
      rsItem!lnt_t1 = cLNT!lnt_t1
      rsItem!lnt_t2 = cLNT!lnt_t2
      rsItem!lnt_t3 = cLNT!lnt_t3
      rsItem!lnt_t4 = cLNT!lnt_t4
      rsItem!lnt_t5 = cLNT!lnt_t5
      rsItem!lnt_libelle = cLNT!lnt_libelle
      
      cLNT.MoveNext
    Loop
    cLNT.CloseCurseur
    
    On Error Resume Next
    Kill sNomCacheDisque
    On Error GoTo 0
    rsItem.Save sNomCacheDisque, adPersistXML
    rsItem.Close
    SetFileDateTime sNomCacheDisque, dMaxType
  End If
  SetStatus "Chargement des types en mémoire"
  rsItem.Open sNomCacheDisque
  SetStatus
  Screen.MousePointer = vbDefault
End Sub


Public Sub EffaceCacheTypes()
  If Not rsItem Is Nothing Then
    rsItem.Close
    Set rsItem = Nothing
  End If
End Sub


' Retourne le libellé d'un type, ou une chaîne vide
Public Function sType(ByVal t1 As Integer, ByVal t2 As Integer, ByVal t3 As Integer, ByVal t4 As Integer, ByVal t5 As Integer) As String
  If rsItem Is Nothing Then ChargeItems
  
  rsItem.MoveFirst
  rsItem.Find "key='" & t1 & "." & t2 & "." & t3 & "." & t4 & "." & t5 & "'", 0, adSearchForward
  If rsItem.EOF Then
    sType = ""
  Else
    sType = rsItem!lnt_libelle
  End If
End Function

