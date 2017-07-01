Attribute VB_Name = "AccM�tam�thode"
' AccM�tam�thode.bas
' Gestion des m�tam�thodes
' Pas strock�es dans la base pour l'instant
' 29/03/1999 PV

Option Explicit

Private cache As New Collection

' Statistiques
Public gmm_iNbM�tam�thode As Integer


Public Function LireM�tam�thode(cMM As String) As M�tam�thode
  If gmm_iNbM�tam�thode = 0 Then InitM�tam�thode
  
  On Error Resume Next
  Set LireM�tam�thode = cache(cMM)
  If Err = 0 Then Exit Function
  Set LireM�tam�thode = Nothing
End Function


Public Function sLibell�M�tam�thode(ByVal cMM As String) As String
  If gmm_iNbM�tam�thode = 0 Then InitM�tam�thode
  
  Dim c As M�tam�thode
  On Error Resume Next
  Set c = cache(cMM)
  If Err = 0 Then
    On Error GoTo 0
    sLibell�M�tam�thode = c.mm_description
    Exit Function
  End If
  sLibell�M�tam�thode = sprintf(sGetIntlLib("CR330", "M�tam�thode %1 inconnue"), cMM)
End Function

Private Sub InitMM1(cMM As String, ByVal sDescription As String)
  Dim mm As New M�tam�thode
  
  mm.mm_m�tam�thode = cMM
  If sDescription = "" Then
    mm.mm_description = "M�tam�thode " & cMM
  Else
    mm.mm_description = sDescription
  End If
  cache.Add mm, cMM
  gmm_iNbM�tam�thode = gmm_iNbM�tam�thode + 1
End Sub


Sub InitM�tam�thode()
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
  InitMM1 "S", "Simplifi�"
  InitMM1 "T", ""
  InitMM1 "U", ""
  InitMM1 "V", "AFNOR+Vidas"
  InitMM1 "W", ""
  InitMM1 "X", ""
  InitMM1 "Y", ""
  InitMM1 "Z", ""
End Sub


'' Traces internes
'Sub ListeM�tam�thode(lw As ListView)
'  Dim itmX As ListItem
'
'  lw.ListItems.Clear
'  lw.ColumnHeaders(1).Text = "MM"
'  lw.ColumnHeaders(2).Text = ""
'  lw.ColumnHeaders(3).Text = "Libell�"
'  lw.ColumnHeaders(4).Text = ""
'
'  Dim m As M�tam�thode
'  For Each m In cache
'    Set itmX = lw.ListItems.Add()
'    itmX.Text = m.mm_m�tam�thode
'    itmX.SubItems(2) = m.mm_description
'  Next
'End Sub


