Attribute VB_Name = "GestionRegistry"
' Module GestionRegistry
' Routines de mise à jour de la registry pour les programmes de Microb'Soft
' 25/08/1998 SS
' 31/08/1998 PV Nettoyage
' 24/07/1999 PV Site de cergy; fin de vienne
' 11/01/2000 PV Sites la roschelle, osny, ...
'  4/02/2000 PV Source cergy
' 15/09/2000 PV Nom de base variable (IDS); picsou -> quantum
' 28/10/2000 PV serveur en IDS; source co2

Option Explicit

Const sODBCPath As String = "HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\"
Const sODBCiniPath As String = "HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\odbc.ini\"

Dim hkey2 As Long       ' Clé de

  
Private Function bTestPrésenceODBCSQL() As Boolean
  Dim hKey As Long
  bTestPrésenceODBCSQL = True
  
  On Error Resume Next
  'On teste la présence de ODBC
  hKey = R0OuvreRegistry(sODBCPath)
  If Err Then
    MsgBox "Le gestionnaire ODBC n'est pas installé." & vbCrLf & "impossible de continuer la mise à jour de la base de registre." & vbCrLf & Err.Number & " (" & Err.Source & ")" & " : " & Err.Description, vbCritical
    bTestPrésenceODBCSQL = False
  End If
  
  'On teste la présence de SQL Retriever
  hKey = R0OuvreRegistry("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBCINST.INI\SCO Vision ODBC")
  If Err Then
    MsgBox "SQL Retriever n'est pas installé." & vbCrLf & "impossible de continuer la mise à jour de la base de registre.", vbCritical
    bTestPrésenceODBCSQL = False
  End If
  On Error GoTo 0
End Function


Private Function CléEnFonctionDeIP() As String
  Dim IPserveur As String
  Dim p1 As Integer, p2 As Integer
  
  'On récupère l'adresse IP du client
  Dim si As New SocketInfo
  IPserveur = si.sAdresseIP
  
  p1 = InStr(IPserveur, ".")
  p1 = InStr(p1 + 1, IPserveur, ".")
  p2 = InStr(p1 + 1, IPserveur, ".")
  IPserveur = Mid(IPserveur, p1 + 1, p2 - p1 - 1)
  
  Select Case IPserveur
    Case "200": CléEnFonctionDeIP = "serveur"
    Case "201": CléEnFonctionDeIP = "cergy"
    Case "202": CléEnFonctionDeIP = "massy1"
    Case "203": CléEnFonctionDeIP = "sun"
    Case "204": CléEnFonctionDeIP = "tripoli"
    Case "210": CléEnFonctionDeIP = "microbe"
    Case "220": CléEnFonctionDeIP = "lyon"
    Case "222": CléEnFonctionDeIP = "hagar"
    Case "223": CléEnFonctionDeIP = "tripoli"
    Case "230": CléEnFonctionDeIP = "bergamo"
    Case "240": CléEnFonctionDeIP = "brux"
    Case Else:  MsgBox "Réseau " & IPserveur & " inconnu, système utilisé: serveur."
                CléEnFonctionDeIP = "serveur"
  End Select
  
  Trace "Réseau " & IPserveur & ", serveur ercem: " & CléEnFonctionDeIP
End Function


Private Sub CréationDesSources(ByVal Nom As String)
  Dim hKey As Long
  Dim Clé As String
  Dim sNomBase As String
  
  sNomBase = "ercem"
  
  If StrComp(Nom, "labo", vbTextCompare) = 0 Then
    Clé = "microbe"
  ElseIf StrComp(Nom, "ercem", vbTextCompare) = 0 Then
    Clé = CléEnFonctionDeIP
    'La clé varie selon le lieu de connexion
  Else
    Clé = Nom
    'sinon elle est identique au nom de la base
  End If
  
  On Error Resume Next
  hKey = R0OuvreRegistry(sODBCiniPath & Nom)
  If Err Then
    CréeCléRegistry (sODBCiniPath & Nom)
    hKey = R0OuvreRegistry(sODBCiniPath & Nom)
  End If
  On Error GoTo 0
   
  R0SetValueEx hKey, "CacheIdle", REG_SZ, "100"
  R0SetValueEx hKey, "CacheMeMemory", REG_SZ, "32"
  R0SetValueEx hKey, "CacheRows", REG_SZ, "0"
  R0SetValueEx hKey, "DBauth", REG_SZ, ""
  R0SetValueEx hKey, "DBName", REG_SZ, sNomBase
  R0SetValueEx hKey, "DBOptions", REG_SZ, ""
  R0SetValueEx hKey, "DBuser", REG_SZ, ""
  R0SetValueEx hKey, "DebugHostAppend", REG_SZ, "1"
  R0SetValueEx hKey, "DebugHostFile", REG_SZ, "vwodbc.log"
  R0SetValueEx hKey, "DebugOptions", REG_SZ, "0"
  R0SetValueEx hKey, "DebugPCAppend", REG_SZ, "1"
  R0SetValueEx hKey, "DebugPCFile", REG_SZ, "C:\VWODBC.TXT"
  R0SetValueEx hKey, "Description", REG_SZ, "SCO Vision ODBC Driver"
  R0SetValueEx hKey, "Driver", REG_SZ, "C:\WINDOWS\SYSTEM\vwodbc32.dll"
  R0SetValueEx hKey, "FetchCache", REG_SZ, "1"
  R0SetValueEx hKey, "Hostname", REG_SZ, Clé
  R0SetValueEx hKey, "PortNumber", REG_SZ, "0"
  R0SetValueEx hKey, "PWD", REG_SZ, ""
  R0SetValueEx hKey, "QueryTimeout", REG_SZ, "0"
  R0SetValueEx hKey, "ReadOnly", REG_SZ, "0"
  R0SetValueEx hKey, "ServerID", REG_SZ, "Informix"
  R0SetValueEx hKey, "ServerOptions", REG_SZ, "1"
  R0SetValueEx hKey, "SQLSyntax", REG_SZ, "3"
  R0SetValueEx hKey, "TCPOptions", REG_SZ, "1"
  R0SetValueEx hKey, "Timeout", REG_SZ, "0"
  R0SetValueEx hKey, "TranslationDLL", REG_SZ, ""
  R0SetValueEx hKey, "TranslationName", REG_SZ, ""
  R0SetValueEx hKey, "TranslationOption", REG_SZ, "1"
  R0SetValueEx hKey, "UID", REG_SZ, "sce"
  R0SetValueEx hKey, "VirtualServer", REG_SZ, "0"
  
  R0SetValueEx hkey2, Nom, REG_SZ, "SCO Vision ODBC"
  
  R0FermeRegistry hKey

End Sub


Public Sub MAJODBC()
  Trace "Mise à jour ODBC…"
  If Not bTestPrésenceODBCSQL Then Exit Sub
  
  'Ouverture de la clé ODBC Data Sources
  On Error Resume Next
  hkey2 = R0OuvreRegistry(sODBCiniPath & "ODBC Data Sources")
  If Err Then
    CréeCléRegistry (sODBCiniPath & "\ODBC Data Sources")
    hkey2 = R0OuvreRegistry(sODBCiniPath & "ODBC Data Sources")
  End If
  On Error GoTo 0
  
  Select Case LangueSystème
    Case LANG_ITALIAN:
      CréationDesSources "bergamo"
      CréationDesSources "ercem"
      
    Case LANG_FRENCH:
      CréationDesSources "grenoble"
      CréationDesSources "serveur"
      CréationDesSources "spip"
      CréationDesSources "quantum"
      CréationDesSources "microbe"
      CréationDesSources "labo"
      CréationDesSources "massy1"
      CréationDesSources "vienne"
      CréationDesSources "hagar"
      CréationDesSources "tripoli"
      CréationDesSources "osny"
      CréationDesSources "cergy"
      CréationDesSources "co2"
      CréationDesSources "lyon"
      CréationDesSources "brux"
      
    Case LANG_ENGLISH:
      CréationDesSources "kilt"
    
    Case LANG_DUTCH:
      CréationDesSources "brux"
  End Select
  
  R0FermeRegistry hkey2 'Fermeture de la clé ODBC Data Sources
End Sub

