Attribute VB_Name = "GestionRegistry"
' Module GestionRegistry
' Routines de mise � jour de la registry pour les programmes de Microb'Soft
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

Dim hkey2 As Long       ' Cl� de

  
Private Function bTestPr�senceODBCSQL() As Boolean
  Dim hKey As Long
  bTestPr�senceODBCSQL = True
  
  On Error Resume Next
  'On teste la pr�sence de ODBC
  hKey = R0OuvreRegistry(sODBCPath)
  If Err Then
    MsgBox "Le gestionnaire ODBC n'est pas install�." & vbCrLf & "impossible de continuer la mise � jour de la base de registre." & vbCrLf & Err.Number & " (" & Err.Source & ")" & " : " & Err.Description, vbCritical
    bTestPr�senceODBCSQL = False
  End If
  
  'On teste la pr�sence de SQL Retriever
  hKey = R0OuvreRegistry("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBCINST.INI\SCO Vision ODBC")
  If Err Then
    MsgBox "SQL Retriever n'est pas install�." & vbCrLf & "impossible de continuer la mise � jour de la base de registre.", vbCritical
    bTestPr�senceODBCSQL = False
  End If
  On Error GoTo 0
End Function


Private Function Cl�EnFonctionDeIP() As String
  Dim IPserveur As String
  Dim p1 As Integer, p2 As Integer
  
  'On r�cup�re l'adresse IP du client
  Dim si As New SocketInfo
  IPserveur = si.sAdresseIP
  
  p1 = InStr(IPserveur, ".")
  p1 = InStr(p1 + 1, IPserveur, ".")
  p2 = InStr(p1 + 1, IPserveur, ".")
  IPserveur = Mid(IPserveur, p1 + 1, p2 - p1 - 1)
  
  Select Case IPserveur
    Case "200": Cl�EnFonctionDeIP = "serveur"
    Case "201": Cl�EnFonctionDeIP = "cergy"
    Case "202": Cl�EnFonctionDeIP = "massy1"
    Case "203": Cl�EnFonctionDeIP = "sun"
    Case "204": Cl�EnFonctionDeIP = "tripoli"
    Case "210": Cl�EnFonctionDeIP = "microbe"
    Case "220": Cl�EnFonctionDeIP = "lyon"
    Case "222": Cl�EnFonctionDeIP = "hagar"
    Case "223": Cl�EnFonctionDeIP = "tripoli"
    Case "230": Cl�EnFonctionDeIP = "bergamo"
    Case "240": Cl�EnFonctionDeIP = "brux"
    Case Else:  MsgBox "R�seau " & IPserveur & " inconnu, syst�me utilis�: serveur."
                Cl�EnFonctionDeIP = "serveur"
  End Select
  
  Trace "R�seau " & IPserveur & ", serveur ercem: " & Cl�EnFonctionDeIP
End Function


Private Sub Cr�ationDesSources(ByVal Nom As String)
  Dim hKey As Long
  Dim Cl� As String
  Dim sNomBase As String
  
  sNomBase = "ercem"
  
  If StrComp(Nom, "labo", vbTextCompare) = 0 Then
    Cl� = "microbe"
  ElseIf StrComp(Nom, "ercem", vbTextCompare) = 0 Then
    Cl� = Cl�EnFonctionDeIP
    'La cl� varie selon le lieu de connexion
  Else
    Cl� = Nom
    'sinon elle est identique au nom de la base
  End If
  
  On Error Resume Next
  hKey = R0OuvreRegistry(sODBCiniPath & Nom)
  If Err Then
    Cr�eCl�Registry (sODBCiniPath & Nom)
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
  R0SetValueEx hKey, "Hostname", REG_SZ, Cl�
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
  Trace "Mise � jour ODBC�"
  If Not bTestPr�senceODBCSQL Then Exit Sub
  
  'Ouverture de la cl� ODBC Data Sources
  On Error Resume Next
  hkey2 = R0OuvreRegistry(sODBCiniPath & "ODBC Data Sources")
  If Err Then
    Cr�eCl�Registry (sODBCiniPath & "\ODBC Data Sources")
    hkey2 = R0OuvreRegistry(sODBCiniPath & "ODBC Data Sources")
  End If
  On Error GoTo 0
  
  Select Case LangueSyst�me
    Case LANG_ITALIAN:
      Cr�ationDesSources "bergamo"
      Cr�ationDesSources "ercem"
      
    Case LANG_FRENCH:
      Cr�ationDesSources "grenoble"
      Cr�ationDesSources "serveur"
      Cr�ationDesSources "spip"
      Cr�ationDesSources "quantum"
      Cr�ationDesSources "microbe"
      Cr�ationDesSources "labo"
      Cr�ationDesSources "massy1"
      Cr�ationDesSources "vienne"
      Cr�ationDesSources "hagar"
      Cr�ationDesSources "tripoli"
      Cr�ationDesSources "osny"
      Cr�ationDesSources "cergy"
      Cr�ationDesSources "co2"
      Cr�ationDesSources "lyon"
      Cr�ationDesSources "brux"
      
    Case LANG_ENGLISH:
      Cr�ationDesSources "kilt"
    
    Case LANG_DUTCH:
      Cr�ationDesSources "brux"
  End Select
  
  R0FermeRegistry hkey2 'Fermeture de la cl� ODBC Data Sources
End Sub

