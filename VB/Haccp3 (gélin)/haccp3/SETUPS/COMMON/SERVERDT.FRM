VERSION 4.00
Begin VB.Form frmRemoteServerDetails 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "#"
   ClientHeight    =   4545
   ClientLeft      =   3195
   ClientTop       =   2400
   ClientWidth     =   7800
   ControlBox      =   0   'False
   Height          =   4950
   Icon            =   "SERVERDT.frx":0000
   Left            =   3135
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4545
   ScaleWidth      =   7800
   Top             =   2055
   Width           =   7920
   Begin VB.CommandButton cmdCancel 
      Caption         =   "#"
      Height          =   375
      Left            =   5580
      TabIndex        =   5
      Top             =   3930
      Width           =   1935
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "#"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   375
      Left            =   3540
      TabIndex        =   4
      Top             =   3930
      Width           =   1935
   End
   Begin VB.ComboBox cboNetworkProtocol 
      Height          =   300
      Left            =   2400
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   3165
      Width           =   5100
   End
   Begin VB.TextBox txtNetworkAddress 
      Height          =   300
      Left            =   2400
      TabIndex        =   1
      Top             =   2535
      Width           =   5100
   End
   Begin VB.Frame Frame1 
      Height          =   555
      Left            =   225
      TabIndex        =   7
      Top             =   1395
      Width           =   7290
      Begin VB.Label lblServerName 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         Caption         =   "#"
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   8.25
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   135
         TabIndex        =   8
         Top             =   240
         Width           =   7020
         WordWrap        =   -1  'True
      End
   End
   Begin VB.Label lblNetworkProtocol 
      AutoSize        =   -1  'True
      Caption         =   "#"
      Height          =   195
      Left            =   210
      TabIndex        =   2
      Top             =   3165
      Width           =   2100
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblNetworkAddress 
      AutoSize        =   -1  'True
      Caption         =   "#"
      Height          =   195
      Left            =   225
      TabIndex        =   0
      Top             =   2535
      Width           =   2100
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblRemoteServerDetails 
      AutoSize        =   -1  'True
      Caption         =   "#"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   360
      TabIndex        =   6
      Top             =   360
      Width           =   7020
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "frmRemoteServerDetails"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit
Option Compare Text

Private fNetworkAddressSpecified As Boolean
Private fNetworkProtocolSpecified As Boolean

#If Win32 Then
Private Declare Function RpcNetworkIsProtseqValid Lib "rpcrt4.dll" Alias "RpcNetworkIsProtseqValidA" (ByVal strProtseq As String) As Long
#End If

#If Win32 Then
' D�termine si une s�quence de protocole donn�e est g�r�e et disponible sur cette machine.
Function fIsProtocolSeqSupported(ByVal strProto As String, ByVal strProtoFriendlyName) As Boolean
    Const RPC_S_OK = 0&
    Const RPC_S_PROTSEQ_NOT_SUPPORTED = 1703&
    Const RPC_S_INVALID_RPC_PROTSEQ = 1704&

    Dim rcps As Long
    Static fUnexpectedErr As Boolean

    On Error Resume Next

    fIsProtocolSeqSupported = False
    rcps = RpcNetworkIsProtseqValid(strProto)

    Select Case rcps
        Case RPC_S_OK
            fIsProtocolSeqSupported = True
        Case RPC_S_PROTSEQ_NOT_SUPPORTED
            LogNote ResolveResString(resNOTEPROTOSEQNOTSUPPORTED, "|1", strProto, "|2", strProtoFriendlyName)
        Case RPC_S_INVALID_RPC_PROTSEQ
            LogWarning ResolveResString(resNOTEPROTOSEQINVALID, "|1", strProto, "|2", strProtoFriendlyName)
        Case Else
            If Not fUnexpectedErr Then
                MsgWarning ResolveResString(resPROTOSEQUNEXPECTEDERR), vbOKOnly Or vbInformation, gstrTitle
                fUnexpectedErr = True
            End If
    End Select
End Function
#End If

Private Sub cboNetworkProtocol_Click()
    cmdOK.Enabled = fValid()
End Sub

Private Sub cmdCancel_Click()
    ExitSetup frmRemoteServerDetails, gintRET_EXIT
End Sub

Private Sub cmdOK_Click()
    Hide
End Sub

Private Sub Form_Load()
    Dim fMoveControlsUp As Boolean  ' Indique le d�placement vers le haut des contr�les pour
                                    ' combler un espace libre.
    Dim yTopCutoff As Integer       ' Tous les contr�les seront en dessous de cette valeur
                                    ' d'ordonn�e.
    
    Caption = ResolveResString(resREMOTESERVERDETAILSTITLE)
    lblRemoteServerDetails.Caption = ResolveResString(resREMOTESERVERDETAILSLBL)
    lblNetworkAddress.Caption = ResolveResString(resNETWORKADDRESS)
    lblNetworkProtocol.Caption = ResolveResString(resNETWORKPROTOCOL)
    cmdOK.Caption = ResolveResString(resOK)
    cmdCancel.Caption = ResolveResString(resCANCEL)

    FillInProtocols
    
    ' Maintenant il faut s�lectivement valider ou non les contr�les disponibles
    ' en fonction du nombre d'informations n�cessaires venant de l'utilisateur.
    If fNetworkAddressSpecified Then
        ' L'adresse r�seau � d�j� �t� indiqu�e, donc il est possible de cacher
        ' de contr�le et de passer au suivant.
        txtNetworkAddress.Visible = False
        lblNetworkAddress.Visible = False
        fMoveControlsUp = True
        yTopCutoff = txtNetworkAddress.Top
    ElseIf fNetworkProtocolSpecified Then
        ' Le protocole r�seau � d�j� �t� indiqu�, donc il est possible de cacher
        ' de contr�le et de passer au suivant.
        cboNetworkProtocol.Visible = False
        lblNetworkProtocol.Visible = False
        fMoveControlsUp = True
        yTopCutoff = cboNetworkProtocol.Top
    End If
    
    If fMoveControlsUp Then
        ' Recherche le nombre de contr�les � monter.
        Dim yDiff As Integer
        yDiff = cboNetworkProtocol.Top - txtNetworkAddress.Top
        
        Dim c As Control
        For Each c In Controls
            If c.Top > yTopCutoff Then
                c.Top = c.Top - yDiff
            End If
        Next c
        
        ' Finalement, r�duit la feuille.
        Height = Height - yDiff
    End If
    
    ' Centre la feuille.
    Top = (Screen.Height - Height) \ 2
    Left = (Screen.Width - Width) \ 2
End Sub

'-----------------------------------------------------------
' SUB: GetServerDetails
'
' Demande � l'utilisateur les informations manquantes pour
' le serveur � distance.
'
' Entr�e:
'   [strRegFile] - le nom du fichier d'inscription � distance.
'   [strNetworkAddress] - l'adresse r�seau, si elle esr connue.
'   [strNetworkProtocol] - le protocole r�seau, s'il est connu.
'
' Sortie:
'   [strNetworkAddress] - l'adresse r�seau soit entr�e, soit
'                         obtenue de l'utilisateur.
'   [strNetworkProtocol] - le protocole r�seau soit entr�, soit
'                          obtenu de l'utilisateur.
'-----------------------------------------------------------
'
Public Sub GetServerDetails( _
    ByVal strRegFile As String, _
    strNetworkAddress As String, _
    strNetworkProtocol As String _
)
    Dim i As Integer
    
    ' V�rifie si quelque chose est manquant.
    fNetworkAddressSpecified = (strNetworkAddress <> "")
    fNetworkProtocolSpecified = (strNetworkProtocol <> "")
    
    If fNetworkAddressSpecified And fNetworkProtocolSpecified Then
        ' L'adresse r�seau et la s�quence de protocole ont d�ja �t�
        ' sp�cifi�s dans SETUP.LST. Il n'y a pas besoin de demander
        ' plus d'information � l'utilisateur.
        
        ' Cependant, il faut v�rifier que la s�quence de protocole sp�cifi�e
        ' dans SETUP.LST est actuellement install�e et disponible sur cette
        ' machine (32 bits seulement).
        CheckSpecifiedProtocolSequence strNetworkProtocol, strGetServerName(strRegFile)
        
        Exit Sub
    End If
    
    lblServerName.Caption = strGetServerName(strRegFile)
    
    ' Affiche la feuille est extrait les informations n�cessaires de l'utilisateur.
    Show 1
        
    If fNetworkProtocolSpecified Then
        ' La s�quence de protocoles r�seau a d�j� �t� sp�cifi�e dans
        ' SETUP.LST. Il faut v�rifier que la s�quence de protocole sp�cifi�
        ' dans SETUP.LST est actuellement install�e et disponible sur cette
        ' machine (32 bits seulement).
        CheckSpecifiedProtocolSequence strNetworkProtocol, strGetServerName(strRegFile)
    End If
    
    If Not fNetworkAddressSpecified Then
        strNetworkAddress = txtNetworkAddress
    End If
    If Not fNetworkProtocolSpecified Then
        strNetworkProtocol = gProtocol(cboNetworkProtocol.ListIndex + 1).strName
    End If
    
    Unload Me
End Sub

'-----------------------------------------------------------
' SUB: FillInProtocols
'
' Remplit la liste des protocoles avec les protocoles
' disponibles de SETUP.LST.
'-----------------------------------------------------------
Private Sub FillInProtocols()
    Dim i As Integer
    Dim fSuccessReading As Boolean
    
    cboNetworkProtocol.Clear
    fSuccessReading = ReadProtocols(gstrSetupInfoFile, gstrINI_SETUP)
    If Not fSuccessReading Or gcProtocols <= 0 Then
        MsgError ResolveResString(resNOPROTOCOLSINSETUPLST), vbExclamation Or vbOKOnly, gstrTitle
        ExitSetup frmRemoteServerDetails, gintRET_FATAL
    End If
    
    For i = 1 To gcProtocols
        #If Win32 Then
        If fIsProtocolSeqSupported(gProtocol(i).strName, gProtocol(i).strFriendlyName) Then
        #End If
            cboNetworkProtocol.AddItem gProtocol(i).strFriendlyName
        #If Win32 Then
        End If
        #End If
    Next i

    If cboNetworkProtocol.ListCount Then
        ' Il y a au moins un protocole disponible sur cette machine qui a �t� trouv�.
        Exit Sub
    End If
    
    ' Aucun des protocoles sp�cifi�s dans SETUP.LST n'est disponible sur cette machine.
    ' Il faut indiquer � l'utilisateur le probl�me et inclure les protocoles attendus.
    MsgError ResolveResString(resNOPROTOCOLSSUPPORTED1), vbExclamation Or vbOKOnly, gstrTitle
    Dim strMsg As String
    strMsg = ResolveResString(resNOPROTOCOLSSUPPORTED2) & LF$

    For i = 1 To gcProtocols
        strMsg = strMsg & LF$ & Chr$(9) & gProtocol(i).strFriendlyName
    Next i
    
    MsgError strMsg, vbExclamation Or vbOKOnly, gstrTitle
    ExitSetup frmRemoteServerDetails, gintRET_FATAL
End Sub

'-----------------------------------------------------------
' SUB: strGetServerName
'
' En donnant un fichier d'inscription d'une serveur � distance,
' retrouve le nom complet du serveur.
'-----------------------------------------------------------
Private Function strGetServerName(ByVal strRegFilename As String) As String
    Const strKey = "AppDescription="
    Dim strLine As String
    Dim iFile As Integer
    
    On Error GoTo DoErr
    
    ' Utilise le nom du serveur si le nom complet ne peut pas �tre trouv�.
    strGetServerName = GetFileName(strRegFilename)
    
    iFile = FreeFile
    Open strRegFilename For Input Access Read Lock Read Write As #iFile
    While Not EOF(iFile)
        Line Input #iFile, strLine
        If Left$(strLine, Len(strKey)) = strKey Then
            ' La ligne contenant le nom complet a �t� trouv�e.
            Dim strName As String
            strName = Mid$(strLine, Len(strKey) + 1)
            If strName <> "" Then
                strGetServerName = strName
            End If
            Close iFile
            Exit Function
        End If
    Wend
    Close iFile
    
    Exit Function
DoErr:
    strGetServerName = ""
End Function

Private Sub txtNetworkAddress_Change()
    cmdOK.Enabled = fValid()
End Sub

' Renvoie Vrai si et seulement si les entr�es sont valides.
Private Function fValid() As Boolean
    fValid = True
    
    If Not fNetworkProtocolSpecified And (cboNetworkProtocol.ListIndex < 0) Then
        fValid = False
    End If
    
    If Not fNetworkAddressSpecified And (txtNetworkAddress = "") Then
        fValid = False
    End If
End Function

Private Sub CheckSpecifiedProtocolSequence(ByVal strNetworkProtocol As String, ByVal strFriendlyServerName As String)
    #If Win32 Then
        ' Essaye de rechercher le nom complet de ce protocole du fichier SETUP.LST.
        Dim fSuccessReading As Boolean
        Dim strFriendlyName As String
        Dim i As Integer
        
        ' Utilise le nom du protocole si le nom complet ne peut pas �tre trouv�.
        strFriendlyName = strNetworkProtocol
        
        fSuccessReading = ReadProtocols(gstrSetupInfoFile, gstrINI_SETUP)
        If fSuccessReading And gcProtocols > 0 Then
            For i = 1 To gcProtocols
                If gProtocol(i).strName = strNetworkProtocol Then
                    strFriendlyName = gProtocol(i).strFriendlyName
                    Exit For
                End If
            Next i
        End If
        
        ' V�rifie si le protocole est disponible.
        If fIsProtocolSeqSupported(strNetworkProtocol, strFriendlyName) Then
            ' OK
            Exit Sub
        Else
            ' Non, pas support�. Donne un message d'information pour demander
            ' quoi faire, et continuer l'installation.
Retry:
            If MsgError( _
                ResolveResString(resSELECTEDPROTONOTSUPPORTED, "|1", strFriendlyServerName, "|2", strFriendlyName), _
                vbInformation Or vbOKCancel, _
                gstrTitle) _
              = vbCancel Then
                ' L'utilisateur � choisi d'annuler. Lui donner une chance de sortir.
                ExitSetup frmRemoteServerDetails, gintRET_EXIT
                GoTo Retry
            Else
                ' L'utilisateur � choisi OK, continuer l'installation.
                Exit Sub
            End If
        End If
    #Else
        Exit Sub
    #End If
End Sub
