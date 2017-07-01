Attribute VB_Name = "AccMétaméthode"
' AccMétaméthode.bas
' Gestion des métaméthodes
' Pas strockées dans la base pour l'instant
' 29/03/1999 PV

Option Explicit

Private cache As New Collection

' Statistiques
Public gmm_iNbMétaméthode As Integer


Public Function LireMétaméthode(cMM As String) As Métaméthode
  If gmm_iNbMétaméthode = 0 Then InitMétaméthode
  
  On Error Resume Next
  Set LireMétaméthode = cache(cMM)
  If Err = 0 Then Exit Function
  Set LireMétaméthode = Nothing
End Function


Public Function sLibelléMétaméthode(ByVal cMM As String) As String
  If gmm_iNbMétaméthode = 0 Then InitMétaméthode
  
  Dim c As Métaméthode
  On Error Resume Next
  Set c = cache(cMM)
  If Err = 0 Then
    On Error GoTo 0
    sLibelléMétaméthode = c.mm_description
    Exit Function
  End If
  sLibelléMétaméthode = sprintf(sGetIntlLib("CR330", "Métaméthode %1 inconnue"), cMM)
End Function

Private Sub InitMM1(cMM As String, ByVal sDescription As String)
  Dim mm As New Métaméthode
  
  mm.mm_métaméthode = cMM
  If sDescription = "" Then
    mm.mm_description = "Métaméthode " & cMM
  Else
    mm.mm_description = sDescription
  End If
  cache.Add mm, cMM
  gmm_iNbMétaméthode = gmm_iNbMétaméthode + 1
End Sub


Sub InitMétaméthode()
  Assert cache.Count = 0
  InitMM1 "A", "AFNOR"
  InitMM1 "B", "AFNOR Bis"
  InitMM1 "C", ""
  InitMM1 "D", ""
  InitMM1 "E", "Expertise"
  InitMM1 "F", ""
  InitMM1 "G", ""
  InitMM1 "H", ""
  InitMM1 "I", ""
  InitMM1 "J", ""
  InitMM1 "K", ""
  InitMM1 "L", ""
  InitMM1 "M", ""
  InitMM1 "N", ""
  InitMM1 "O", ""
  InitMM1 "P", ""
  InitMM1 "Q", ""
  InitMM1 "R", ""
  InitMM1 "S", "Simplifié"
  InitMM1 "T", ""
  InitMM1 "U", ""
  InitMM1 "V", "AFNOR+Vidas"
  InitMM1 "W", ""
  InitMM1 "X", ""
  InitMM1 "Y", ""
  InitMM1 "Z", ""
End Sub


'' Traces internes
'Sub ListeMétaméthode(lw As ListView)
'  Dim itmX As ListItem
'
'  lw.ListItems.Clear
'  lw.ColumnHeaders(1).Text = "MM"
'  lw.ColumnHeaders(2).Text = ""
'  lw.ColumnHeaders(3).Text = "Libellé"
'  lw.ColumnHeaders(4).Text = ""
'
'  Dim m As Métaméthode
'  For Each m In cache
'    Set itmX = lw.ListItems.Add()
'    itmX.Text = m.mm_métaméthode
'    itmX.SubItems(2) = m.mm_description
'  Next
'End Sub


