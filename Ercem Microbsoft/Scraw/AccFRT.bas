Attribute VB_Name = "AccFRT"
' AccFRT
' Module d'acc�s aux FRT
' 14/05/1998 PV
' 28/11/2000 PV Enum�ration des r�f�rences d'une FRT


Option Explicit


Public Function LitFRT(ByVal iNumFRT As Long) As frt
  Bloquer
    Dim br As New Rev
    br.AddField iNumFRT
    tcps.Envoie "LFRT " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) = "->" Then
      Rel�cher
      Set LitFRT = Nothing
      Exit Function
    End If
    
    Dim frt As New frt
    Dim v As Variant
    br.Buffer = sLigne
    
    br.GetField v: frt.indice = v
    br.GetField v: frt.opersais = v
    br.GetField v: frt.datesais = v
    br.GetField v: frt.operimpr = v
    br.GetField v: frt.tsimpr = v
    br.GetField v: frt.timestamp = v
    
    AttendSynchro
  Rel�cher
  
  Set LitFRT = frt
End Function


Public Function EnumRefFRT(iNumFRT As Long) As Collection
  Dim colRef As New Collection

  Bloquer
    Dim br As New Rev
    br.AddField iNumFRT
    tcps.Envoie "EFRT " & br.Buffer
    
    Dim sLigne As String
    Dim sRef As String
    Do
      sLigne = tcps.Re�oit
      If Left(sLigne, 2) = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sRef
      colRef.Add sRef
    Loop
  Rel�cher
  
  Set EnumRefFRT = colRef
End Function

