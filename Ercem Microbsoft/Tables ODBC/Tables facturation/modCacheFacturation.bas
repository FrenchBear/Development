Attribute VB_Name = "modCacheFacturation"
' modCacheFacturation
' Gestion de caches sp�cialis�s pour la facturation, pour optimiser l'acc�s BD
' 27/08/1999 NC

Option Explicit

' Caches
Private colLibFCent As New Collection       ' Libell�s de la facturation, cl�="L" & n�libell�
Private colBanque As New Collection         ' Nom de la banque, cl�="B" & n�banque


' ================================================================================
' Banque

Public Function sGetBanque(ByVal sBan As String) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetBanque = colBanque("B" & sBan)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis � d�faut dans la base
  Dim s As String
  s = BDCurseurExpress("select ban_l1 from banque where ban_numbanque='" & sBan & "'")
  colBanque.Add s, "B" & sBan   ' On conserve le r�sultat
  sGetBanque = s
End Function


' ================================================================================
' Libell�s de facturation

Public Function sGetLibfcent(ByVal sLfc As String) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetLibfcent = colLibFCent("L" & sLfc)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis � d�faut dans la base
  Dim s As String
  s = BDCurseurExpress("select ler_libelle from libercem where ler_numler='" & sLfc & "' and ler_langue='F' and ler_application='fcent'")
  colLibFCent.Add s, "L" & sLfc   ' On conserve le r�sultat
  sGetLibfcent = s
End Function

