VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TCPSynchrone"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Acc�s standardis� aux E/S TCP de fa�on synchrone"
Attribute VB_Ext_KEY = "SavedWithClassBuilder" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
' Classe TCP Synchrone
' Acc�s standardis� aux E/S TCP de fa�on synchrone
' 28/04/96 PV Premi�re version
'  8/08/96 PV Classe ind�pendante
' 11/11/96 PV Gestion des retours d'erreurs de fa�on transparente pour l'application
' 26/12/97 PV Conversion OEM --> ANSI des messages d'erreurs du serveur
'  1/02/99 PV sEtatD�cod�
' 10/04/01 PV Mesages du d�mon commen�ant par !!: sortie sans possibilit� de faire autrement
' 31/08/01 PV Param�trage du d�lai du chien de garde


Option Explicit

Private FileR�ception As New File   ' Structure FIFO pour stocker les donn�es arrivant du socket
Private formTCP As New frmTCP       ' Contient le cont�le TCP et les proc�dures �v�nementielles
Private sSyst�me As String


Public Sub D�finitD�laiGarde(ByVal iNouveauD�lai As Integer)
  FileR�ception.D�finitD�laiGarde iNouveauD�lai
End Sub


Function Re�oit() As String
  Dim sLigne As String
  Do
    sLigne = FileR�ception.Extrait
    If Left(sLigne, 1) <> "!" And Left(sLigne, 1) <> "?" Then
      Re�oit = sLigne
      Exit Function
    End If
    
    Dim sSource As String, sMessage As String, p As Integer
    sLigne = sOEMtoANSI(sLigne)
    p = InStr(sLigne, ":")
    If p = 0 Then
      sSource = Mid(sLigne, 2)
      sMessage = ""
    Else
      sSource = Mid(Left(sLigne, p), 2)
      sMessage = Mid(sLigne, p + 1)
      While Left(sMessage, 1) = " ": sMessage = Mid(sMessage, 2): Wend
    End If
    Dim i As Integer
    If Left(sLigne, 2) = "!!" Then ' Message d'erreur sans possibilit� de continuer
      Dim sMsg As String
      sMsg = sGetIntlLib("CO034", "Question 034")
      MsgBox sprintf(sMsg, sD�mon, sSyst�me) & vbCrLf & vbCrLf & sSource & vbCrLf & sMessage, vbCritical + vbOK
      EmergencyExit
    ElseIf Left(sLigne, 1) = "!" And Left(sLigne, 2) <> "!!" Then ' Message d'erreur
      'Dim sMsg As String
      sMsg = sGetIntlLib("CO034", "Question 034")
      i = MsgBox(sprintf(sMsg, sD�mon, sSyst�me) & vbCrLf & vbCrLf & sSource & vbCrLf & sMessage, vbCritical + vbAbortRetryIgnore + vbDefaultButton3)
      If i = vbAbort Then EmergencyExit
      ' Ignorer ou r�essayer, on continue
    Else                          ' Message d'avertissement
      MsgBox2i "CO033", sD�mon, sSyst�me, sSource, sMessage
    End If
  Loop
End Function

Function AfficheTrace(bAffiche As Boolean)
  frmTCP.Visible = bAffiche
End Function

Sub Envoie(sCmd As String)
  frmTCP.Envoie sCmd
End Sub

Sub Ferme()
  frmTCP.Ferme
  Unload frmTCP
End Sub

Function bConnexion(sHost As String, iPort As Integer) As Boolean
  sSyst�me = sHost
  If Not frmTCP.bConnect(sHost, iPort) Then
    bConnexion = False
  Else
    bConnexion = True
  End If
End Function

Property Get Etat() As Integer
  Etat = frmTCP.GetState()
End Property


Public Function sEtatD�cod�() As String
  Dim sMsg As String, e As Integer
  e = frmTCP.GetState()
  Select Case e
    Case 0: sMsg = sGetIntlLib("TCP0", "D�connect�")
    Case 1: sMsg = sGetIntlLib("TCP1", "Ouvert")
    Case 2: sMsg = sGetIntlLib("TCP2", "Attente connexion") & " " & LCase(sSyst�meDistant)
    Case 3: sMsg = sGetIntlLib("TCP3", "Connexion en cours")
    Case 4: sMsg = sGetIntlLib("TCP4", "Recherche adresse") & " " & sSyst�meDistant
    Case 5: sMsg = sGetIntlLib("TCP5", "Adresse trouv�e") & " " & sSyst�meDistant
    Case 6: sMsg = sGetIntlLib("TCP6", "Connexion en cours")
    Case 7: sMsg = sGetIntlLib("TCP7", "Connect�") & " " & LCase(sSyst�meDistant)
    Case 8: sMsg = sGetIntlLib("TCP8", "D�connexion en cours")
    Case 9: sMsg = sGetIntlLib("TCP9", "Erreur connexion")
    Case Else: sMsg = sGetIntlLib("TCPsStatus", "�tat") & " " & e
  End Select
  sEtatD�cod� = sMsg
End Function


Private Sub Class_Initialize()
  Set frmTCP.tcps = Me
End Sub

Sub AjouteLigne(sLigne As String)
  FileR�ception.Add sLigne
End Sub

' Lib�re proprement les ressources, et dans le bon ordre !
Sub Destruction()
  Set frmTCP.tcps = Nothing
  Unload frmTCP
  Set frmTCP = Nothing
End Sub

