VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "À propos de MonApplication"
   ClientHeight    =   3555
   ClientLeft      =   2340
   ClientTop       =   1935
   ClientWidth     =   5730
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3555
   ScaleWidth      =   5730
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox picIcon 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      Height          =   480
      Left            =   240
      Picture         =   "frmAbout.frx":0000
      ScaleHeight     =   337.12
      ScaleMode       =   0  'User
      ScaleWidth      =   337.12
      TabIndex        =   1
      Top             =   180
      Width           =   480
   End
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   4065
      TabIndex        =   0
      Top             =   2685
      Width           =   1575
   End
   Begin VB.CommandButton cmdSysInfo 
      Caption         =   "&Infos système…"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   4080
      TabIndex        =   2
      Top             =   3135
      Width           =   1575
   End
   Begin VB.Label txtOSVersion 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   4860
      TabIndex        =   22
      Top             =   2340
      Width           =   60
   End
   Begin VB.Label txtOSMM 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   4860
      TabIndex        =   21
      Top             =   2100
      Width           =   60
   End
   Begin VB.Label txtOSPlatform 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   4860
      TabIndex        =   20
      Top             =   1860
      Width           =   60
   End
   Begin VB.Label lblOSVersion 
      AutoSize        =   -1  'True
      Caption         =   "OS Version :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   3600
      TabIndex        =   19
      Top             =   2340
      Width           =   1095
   End
   Begin VB.Label lblOSMM 
      AutoSize        =   -1  'True
      Caption         =   "OS M.M :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   3600
      TabIndex        =   18
      Top             =   2100
      Width           =   780
   End
   Begin VB.Label lblOSPlatform 
      AutoSize        =   -1  'True
      Caption         =   "OS Platform :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   3600
      TabIndex        =   17
      Top             =   1860
      Width           =   1170
   End
   Begin VB.Label txtDomaine 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   1200
      TabIndex        =   16
      Top             =   2340
      Width           =   60
   End
   Begin VB.Label txtUtilisateur 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   1200
      TabIndex        =   15
      Top             =   2100
      Width           =   60
   End
   Begin VB.Label txtMicro 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   1200
      TabIndex        =   14
      Top             =   1860
      Width           =   60
   End
   Begin VB.Label lblDomaine 
      AutoSize        =   -1  'True
      Caption         =   "Domaine :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   120
      TabIndex        =   13
      Top             =   2340
      Width           =   900
   End
   Begin VB.Label lblUtilisateur 
      AutoSize        =   -1  'True
      Caption         =   "Utilisateur :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   120
      TabIndex        =   12
      Top             =   2100
      Width           =   990
   End
   Begin VB.Label lblMicro 
      AutoSize        =   -1  'True
      Caption         =   "Micro :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   120
      TabIndex        =   11
      Top             =   1860
      Width           =   585
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   2
      X1              =   135
      X2              =   5699
      Y1              =   2580
      Y2              =   2580
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      Index           =   3
      X1              =   120
      X2              =   5669
      Y1              =   2595
      Y2              =   2595
   End
   Begin VB.Label lblVersionTDG 
      AutoSize        =   -1  'True
      Caption         =   "-- Non trouvé --"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   2040
      TabIndex        =   10
      Top             =   2940
      Width           =   1365
   End
   Begin VB.Label lblVersionVBVM 
      AutoSize        =   -1  'True
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   2040
      TabIndex        =   9
      Top             =   2700
      Width           =   105
   End
   Begin VB.Label lblTDG 
      AutoSize        =   -1  'True
      Caption         =   "Version TODG6.OCX:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   120
      TabIndex        =   8
      Top             =   2940
      Width           =   1845
   End
   Begin VB.Label lblComments 
      Caption         =   "Commentaires (App.Comments)"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   615
      Left            =   1020
      TabIndex        =   7
      Top             =   1080
      Width           =   4575
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   1
      X1              =   120
      X2              =   5684
      Y1              =   1785
      Y2              =   1785
   End
   Begin VB.Label lblCopyright 
      Caption         =   "Copyright (App.LegalCopyright)"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   1020
      TabIndex        =   3
      Top             =   840
      Width           =   4575
   End
   Begin VB.Label lblTitle 
      Caption         =   "Titre (App.FileDescription)"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   435
      Left            =   1020
      TabIndex        =   5
      Top             =   180
      Width           =   4575
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      Index           =   0
      X1              =   105
      X2              =   5654
      Y1              =   1800
      Y2              =   1800
   End
   Begin VB.Label lblVersion 
      Caption         =   "Version (App.Major . App.Minor . App.Revision)"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   1020
      TabIndex        =   6
      Top             =   600
      Width           =   4575
   End
   Begin VB.Label lblVBVM 
      AutoSize        =   -1  'True
      Caption         =   "Version VBVM60.DLL:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   2700
      Width           =   1860
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmAbout
' Grille A Propos... standard des applis ODBC Silliker
' PV
' 26/11/1999 PV Version True Data Grid
' 12/04/2000 PV SysInfo
' 11/09/2000 PV CtrlVB6SP4


Option Explicit

' Options de sécurité des clés de base de registres…
Const READ_CONTROL = &H20000
Const KEY_QUERY_VALUE = &H1
Const KEY_SET_VALUE = &H2
Const KEY_CREATE_SUB_KEY = &H4
Const KEY_ENUMERATE_SUB_KEYS = &H8
Const KEY_NOTIFY = &H10
Const KEY_CREATE_LINK = &H20
Const KEY_ALL_ACCESS = KEY_QUERY_VALUE + KEY_SET_VALUE + _
                       KEY_CREATE_SUB_KEY + KEY_ENUMERATE_SUB_KEYS + _
                       KEY_NOTIFY + KEY_CREATE_LINK + READ_CONTROL
                     
' Types racines des clés de base de registres…
Const HKEY_LOCAL_MACHINE = &H80000002
Const ERROR_SUCCESS = 0
Const REG_SZ = 1                         ' Chaîne terminée par un caractère nul Unicode.
Const REG_DWORD = 4                      ' Nombre 32 bits.

Const gREGKEYSYSINFOLOC = "SOFTWARE\Microsoft\Shared Tools Location"
Const gREGVALSYSINFOLOC = "MSINFO"
Const gREGKEYSYSINFO = "SOFTWARE\Microsoft\Shared Tools\MSINFO"
Const gREGVALSYSINFO = "PATH"

Private Declare Function RegOpenKeyEx Lib "advapi32" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, ByRef phkResult As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByVal lpData As String, ByRef lpcbData As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32" (ByVal hKey As Long) As Long

Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

Private g_i As Picture


' ==============================================================================

Private Sub cmdOK_Click()
  Unload Me
End Sub


Public Function APropos(i As Picture)
  Set g_i = i
  Show vbModal
End Function


Public Sub CtrlVB6SP4()
  Dim sSysDir100 As String * 100, iLen As Integer, sSysDir As String
  Dim VerInfo As VS_FIXEDFILEINFO
  
  iLen = GetSystemDirectory(sSysDir100, 100)
  sSysDir = Left(sSysDir100, iLen)

  If GetVersion(sSysDir & "\msvbvm60.dll", VerInfo) Then
    Dim v As Integer
    v = 100 * VerInfo.dwFileVersionLSh + VerInfo.dwFileVersionLSl
    If (VerInfo.dwFileVersionMSh > 6) Or (VerInfo.dwFileVersionMSh = 6 And VerInfo.dwFileVersionMSl > 0) Or (VerInfo.dwFileVersionMSh = 6 And VerInfo.dwFileVersionMSl = 0 And v >= 8877) Then
      ' Ok !
    Else
      Dim iRep As VbMsgBoxResult
      iRep = MsgBox("Attention - Vos fichiers système nécessitent une mise à jour." & vbCrLf & "Vous devez installer les composants VB6SP4 avant d'utiliser ce programme." & vbCrLf & "Souhaitez-vous installer la mise à jour maintenant ?", vbQuestion + vbYesNo, App.Title)
      If iRep = vbYes Then
        Shell "Z:\Install\Microbsoft\Installation VB6 SP4\setup.exe", vbNormalFocus
        EmergencyExit
      End If
    End If
  End If
End Sub


Private Sub Form_Load()
  Caption = "À propos de " & App.Title
  lblTitle.Caption = App.FileDescription
  lblVersion.Caption = "Version " & App.Major & "." & App.Minor & "." & App.Revision
  lblCopyright = App.LegalCopyright
  lblComments = App.Comments
  picIcon = g_i
  
  Dim sSysDir100 As String * 100, iLen As Integer, sSysDir As String
  iLen = GetSystemDirectory(sSysDir100, 100)
  sSysDir = Left(sSysDir100, iLen)

  Dim VerInfo As VS_FIXEDFILEINFO
  If GetVersion(sSysDir & "\msvbvm60.dll", VerInfo) Then
    lblVersionVBVM = VerInfo.dwFileVersionMSh & "." & VerInfo.dwFileVersionMSl & "." & VerInfo.dwFileVersionLSh & VerInfo.dwFileVersionLSl
  End If
  If GetVersion(sSysDir & "\todg6.ocx", VerInfo) Then
    lblVersionTDG = VerInfo.dwFileVersionMSh & "." & VerInfo.dwFileVersionMSl & "." & VerInfo.dwFileVersionLSh & VerInfo.dwFileVersionLSl
  End If
  
  If g_SysInfo Is Nothing Then Set g_SysInfo = New SysInfo
  txtUtilisateur = g_SysInfo.UserName
  txtDomaine = g_SysInfo.Domain
  txtMicro = g_SysInfo.ComputerName
  txtOSPlatform = g_SysInfo.OSPlatform
  txtOSMM = g_SysInfo.OSMajorVersion & "." & g_SysInfo.OSMinorVersion
  txtOSVersion = g_SysInfo.OSVersion
End Sub


' ==============================================================================

Private Sub cmdSysInfo_Click()
  Call StartSysInfo
End Sub

Public Sub StartSysInfo()
    On Error GoTo SysInfoErr
  
    Dim rc As Long
    Dim SysInfoPath As String
    
    ' Essaie d'obtenir le chemin et le nom du programme Infos système dans la base de registre…
    If GetKeyValue(HKEY_LOCAL_MACHINE, gREGKEYSYSINFO, gREGVALSYSINFO, SysInfoPath) Then
    ' Essaie d'obtenir uniquement le chemin du programme Infos système dans la base de registre…
    ElseIf GetKeyValue(HKEY_LOCAL_MACHINE, gREGKEYSYSINFOLOC, gREGVALSYSINFOLOC, SysInfoPath) Then
        ' Valide l'existence de la version du fichier 32 bits connu.
        If (Dir(SysInfoPath & "\MSINFO32.EXE") <> "") Then
            SysInfoPath = SysInfoPath & "\MSINFO32.EXE"
            
        ' Erreur - Impossible de trouver le fichier…
        Else
            GoTo SysInfoErr
        End If
    ' Erreur - Impossible de trouver l'entrée de la base de registre…
    Else
        GoTo SysInfoErr
    End If
    
    Call Shell(SysInfoPath, vbNormalFocus)
    
    Exit Sub
SysInfoErr:
    MsgBox "Les informations système ne sont pas disponibles actuellement", vbOKOnly
End Sub

Public Function GetKeyValue(KeyRoot As Long, KeyName As String, SubKeyRef As String, ByRef KeyVal As String) As Boolean
    Dim i As Long                                           ' Compteur de boucle.
    Dim rc As Long                                          ' Code de retour.
    Dim hKey As Long                                        ' Descripteur d'une clé de base de registres ouverte.
    Dim hDepth As Long                                      '
    Dim KeyValType As Long                                  ' Type de données d'une clé de base de registres.
    Dim tmpVal As String                                    ' Stockage temporaire pour une valeur de clé de base de registres.
    Dim KeyValSize As Long                                  ' Taille de la variable de la clé de base de registres.
    '------------------------------------------------------------
    ' Ouvre la clé de base de registres sous la racine clé {HKEY_LOCAL_MACHINE…}.
    '------------------------------------------------------------
    rc = RegOpenKeyEx(KeyRoot, KeyName, 0, KEY_ALL_ACCESS, hKey) ' Ouvre la clé de base de registres.
    
    If (rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' Gère l'erreur…
    
    tmpVal = String$(1024, 0)                             ' Alloue de l'espace pour la variable.
    KeyValSize = 1024                                       ' Définit la taille de la variable.
    
    '------------------------------------------------------------
    ' Extrait la valeur de la clé de base de registres…
    '------------------------------------------------------------
    rc = RegQueryValueEx(hKey, SubKeyRef, 0, _
                         KeyValType, tmpVal, KeyValSize)    ' Obtient/Crée la valeur de la clé.
                        
    If (rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' Gère l'erreur.
    
    If (Asc(Mid(tmpVal, KeyValSize, 1)) = 0) Then           ' Win95 ajoute une chaîne terminée par un caractère nul…
        tmpVal = Left(tmpVal, KeyValSize - 1)               ' Caractère nul trouvé, extrait de la chaîne.
    Else                                                    ' WinNT ne termine pas la chaîne par un caractère nul…
        tmpVal = Left(tmpVal, KeyValSize)                   ' Caractère nul non trouvé, extrait la chaîne uniquement.
    End If
    '------------------------------------------------------------
    ' Détermine le type de valeur de la clé pour la conversion…
    '------------------------------------------------------------
    Select Case KeyValType                                  ' Recherche les types de données…
    Case REG_SZ                                             ' Type de données chaîne de la clé de la base de registres.
        KeyVal = tmpVal                                     ' Copie la valeur de la chaîne.
    Case REG_DWORD                                          ' Type de données double mot de la clé de base de registres.
        For i = Len(tmpVal) To 1 Step -1                    ' Convertit chaque bit.
            KeyVal = KeyVal + Hex(Asc(Mid(tmpVal, i, 1)))   ' Construit la valeur caractère par caractère.
        Next
        KeyVal = Format$("&h" + KeyVal)                     ' Convertit le mot double en chaîne.
    End Select
    
    GetKeyValue = True                                      ' Retour avec succès.
    rc = RegCloseKey(hKey)                                  ' Ferme la clé de base de registres
    Exit Function                                           ' Quitte.
    
GetKeyError:      ' Réinitialise après qu'une erreur s'est produite…
    KeyVal = ""                                             ' Affecte une chaîne vide à la valeur de retour.
    GetKeyValue = False                                     ' Retour avec échec.
    rc = RegCloseKey(hKey)                                  ' Ferme la clé de base de registres.
End Function

