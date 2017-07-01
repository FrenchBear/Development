VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmAutomate 
   Caption         =   "Automate"
   ClientHeight    =   3345
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   10200
   Icon            =   "frmTrace.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   223
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   680
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog cdOuvrir 
      Left            =   5820
      Top             =   300
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DefaultExt      =   ".clo"
      DialogTitle     =   "Ouvrir un script de commandes Automate"
      Filter          =   "Scripts de commandes (*.clo)|*.clo|Tous les fichiers (*.*)|*.*"
      Flags           =   4096
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   5100
      Top             =   360
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTrace.frx":0442
            Key             =   "imgNew"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTrace.frx":0556
            Key             =   "imgOpen"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTrace.frx":0676
            Key             =   "imgStop"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTrace.frx":078A
            Key             =   "imgPause"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTrace.frx":089E
            Key             =   "imgHelp"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   10200
      _ExtentX        =   17992
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   8
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "New"
            Object.ToolTipText     =   "Nouveau sc�nario (Ctrl+N)"
            ImageKey        =   "imgNew"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Open"
            Object.ToolTipText     =   "Ouvrir un sc�nario (Ctrl+O)"
            ImageKey        =   "imgOpen"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Key             =   "Pause"
            Object.ToolTipText     =   "Pause (Ctrl+P)"
            ImageKey        =   "imgPause"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Key             =   "Stop"
            Object.ToolTipText     =   "Interrompre l'ex�cution du sc�nario (Ctrl+I)"
            ImageKey        =   "imgStop"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Help"
            Object.ToolTipText     =   "Aide (F1)"
            ImageKey        =   "imgHelp"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   1
      Top             =   3000
      Width           =   10200
      _ExtentX        =   17992
      _ExtentY        =   609
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.ListBox lstTrace 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2535
      Left            =   0
      TabIndex        =   0
      Top             =   450
      Width           =   10155
   End
   Begin VB.Menu mnuFichier 
      Caption         =   "&Fichier"
      Begin VB.Menu cmdNouveau 
         Caption         =   "&Nouveau sc�nario�"
         Shortcut        =   ^N
      End
      Begin VB.Menu cmdOuvrirSc�nario 
         Caption         =   "&Ouvrir un sc�nario�"
         Shortcut        =   ^O
      End
      Begin VB.Menu sep0 
         Caption         =   "-"
      End
      Begin VB.Menu cmdPause 
         Caption         =   "&Pause"
         Enabled         =   0   'False
         Shortcut        =   ^P
      End
      Begin VB.Menu cmdInterrompreSc�nario 
         Caption         =   "&Interrompre le sc�nario"
         Enabled         =   0   'False
         Shortcut        =   ^I
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu cmdTopMost 
         Caption         =   "&Toujours au premier plan"
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdQuitterAutomate 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&?"
      Begin VB.Menu cmdAideAutomate 
         Caption         =   "&Aide"
         Shortcut        =   {F1}
      End
      Begin VB.Menu cmdAPropos 
         Caption         =   "� &propos d'Automate�"
      End
   End
End
Attribute VB_Name = "frmAutomate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmAutomate
' Feuille d'ex�cution du programme automate
' CR+PV 5/5/99
' 18/09/2004    D�poussi�rage, traitement correct des guillemets
' d:\cloro\automate\Sc�narii\test.clo

Option Explicit
Option Compare Text                 ' a = A

Dim sNomfic As String               ' Fichier .clo

Dim bQuitter As Boolean             ' Vrai: fin du programme demand�e
Dim bStop As Boolean                ' Vrai: arr�t demand�
Dim bPause As Boolean               ' Vrai: pause demand�e


' Pour ouvrir facilement des fichiers de donn�es
Private Declare Function ShellExecute Lib "Shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long


' =======================================================================
' Menus

Private Sub cmdNouveau_Click()
  Shell "notepad", vbNormalFocus
  Pause 0.5
  SendKeys "^z"   ' Pour le lancement avec le raccourci Ctrl+N
  SendKeys "' Sc�nario automate~' Cr�� le " & Format(Now, "ddd dd/mm/yyyy hh:mm") & "~~"
End Sub

Private Sub cmdOuvrirSc�nario_Click()
  cdOuvrir.ShowOpen
  If cdOuvrir.FileName = "" Then Exit Sub
  Ex�cuteAutomate cdOuvrir.FileName
End Sub

Private Sub cmdInterrompreSc�nario_Click()
  bStop = True      ' Demande d'arr�t d�s que possible
End Sub

Private Sub cmdPause_Click()
  bPause = True     ' Demande de pause d�s que possible
End Sub

Private Sub cmdQuitterAutomate_Click()
  If sNomfic = "" Then
    ' Pas de script en cours d'ex�cution, fin normale
    Unload Me
  Else
    ' On demande au script de se terminer et de quitter
    bQuitter = True
  End If
End Sub

' Aide HTML
Private Sub cmdAideAutomate_Click()
  ShellExecute hwnd, "open", App.Path & "\Automate.htm", "", "", 1
End Sub

Private Sub cmdAPropos_Click()
  Dim sVersion As String
  sVersion = App.Major & "." & App.Minor & "." & App.Revision
    MsgBox "Interpr�teur de fichiers de commandes" & vbCrLf & vbCrLf & _
      "Version " & sVersion & vbCrLf & _
      "Auteur : Pierre Violent - mai 1999" & vbCrLf & vbCrLf & _
      "Automate est garanti compatible avec l'an 2000", vbInformation, "� propos d'Automate"
End Sub


Private Sub cmdTopMost_Click()
  cmdTopMost.Checked = Not cmdTopMost.Checked
  SetTopMostWindow hwnd, cmdTopMost.Checked
End Sub

' =======================================================================
' Ev�nements
' Chargement normal

Private Sub Form_Load()
  If App.PrevInstance Then Unload Me
  
  ' On indique le raccourci Alt+F4 pour la commande quitter
  cmdQuitterAutomate.Caption = "&Quitter" & Chr(9) & "Alt+F4"
  
  Dim sVersion As String
  sVersion = App.Major & "." & App.Minor & "." & App.Revision
  
' Option -? : Aide
  If Command = "/?" Or Command = "-?" Then
    ShellExecute hwnd, "open", App.Path & "\Automate.htm", "", "", 1
    DoEvents
    End
  End If
 
' Option -v : message de version et d'usage
  If UCase(Command) = "/V" Or UCase(Command) = "-V" Then
    cmdAPropos_Click
    End
  End If
  
  Show
  If Command = "" Then
    ' Pas d'arguments : On demande le fichier � l'utilisateur
    cdOuvrir.ShowOpen
    If cdOuvrir.FileName = "" Then Exit Sub ' On ne donne pas de nom de fichier � ouvrir : le programme s'arr�te
    Ex�cuteAutomate cdOuvrir.FileName
  Else
    ' Un argument : c'est le nom du fichier
    Dim sFichier As String
    
    If Left(Command, 1) = Chr(34) Then      ' Guillemets
      sFichier = sTrimGuillemets(Command)   ' On �limine les guillemets externes
    Else
      sFichier = Command
    End If
    Ex�cuteAutomate sFichier
  End If
End Sub


' On vient de redimensionner la fen�tre
Private Sub Form_Resize()
  On Error Resume Next    ' Pour �viter les ennuis avec une fen�tre microscopique
  lstTrace.Width = frmAutomate.ScaleWidth
  lstTrace.Height = frmAutomate.ScaleHeight - sbStatus.Height - Toolbar1.Height
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  End       ' On arr�te tout !
End Sub


Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
  Select Case Button.Key
    Case "New":   cmdNouveau_Click
    Case "Open":  cmdOuvrirSc�nario_Click
    Case "Pause": cmdPause_Click
    Case "Stop":  cmdInterrompreSc�nario_Click
    Case "Help":  cmdAideAutomate_Click
  End Select
End Sub

' =======================================================================
' Fonctions de service

Private Sub Ex�cuteAutomate(sFichierCommande As String)
  sNomfic = sFichierCommande
  bStop = False
  bPause = False
  
' Ouverture
  On Error Resume Next
  Open sNomfic For Input As #1
  If Err <> 0 Then    ' �a s'est mal pass� !
    MsgBox "Automate : �chec � l'ouverture du fichier " & sNomfic & vbCrLf & "Erreur " & Err & " : " & Err.Description, vbCritical
    End
  End If
  On Error GoTo 0
  
' Titre de la feuille
  Caption = sBaseName(sNomfic) & " - Automate"
  
' Mise � jour des menus
  cmdOuvrirSc�nario.Enabled = False   ' On d�sactive la commande ouvrir pendant un sc�nario
  cmdPause.Enabled = True
  cmdInterrompreSc�nario.Enabled = True
  Toolbar1.Buttons("Open").Enabled = False
  Toolbar1.Buttons("Pause").Enabled = True
  Toolbar1.Buttons("Stop").Enabled = True
  
' Lecture du fichier
  Dim sLigne As String                  ' Une ligne compl�te du fichier
  Dim sLigneOrigine As String           ' Copie de sLigne avant d�coupage
  Dim iNoLigne As Integer               ' N� de ligne dans sLigne
  Dim sCommandeAutomate As String       ' Nom de la commande automate � ex�cuter
  Dim sParam�treAutomate1 As String     ' 1er argument
  Dim sParam�treAutomate2 As String     ' 2�me argument
  Dim sParam�treAutomate3 As String     ' 3�me argument
  
  iNoLigne = 0
  Do Until EOF(1)
    Line Input #1, sLigne
    sLigneOrigine = sLigne
    iNoLigne = iNoLigne + 1
    
    lstTrace.AddItem sLigne
    lstTrace.ListIndex = lstTrace.ListCount - 1
    
  ' D�coupage de la ligne
    sCommandeAutomate = vbEmpty
    sParam�treAutomate1 = ""
    sParam�treAutomate2 = ""
    sParam�treAutomate3 = ""
    
  ' On enl�ve les espaces en t�te et en queue
    sLigne = Trim(sLigne)
    
  ' On r�cup�re la commande et ses �ventuels param�tres
    sCommandeAutomate = sPremierMot(sLigne)
    If sLigne <> "" Then sParam�treAutomate1 = sPremierMot(sLigne)
    If sLigne <> "" Then sParam�treAutomate2 = sPremierMot(sLigne)
    If sLigne <> "" Then sParam�treAutomate3 = sPremierMot(sLigne)
    
    ' Ex�cution de la commande automate
    On Error GoTo PbEx�cution
    Select Case LCase(sCommandeAutomate)
      Case "shell":
        If sParam�treAutomate2 = "" Then sParam�treAutomate2 = vbNormalFocus
        Shell sTrimGuillemets(sParam�treAutomate1), CInt(sParam�treAutomate2)
        Pause 0.2
      
      Case "execute":
        ' Si on ne pr�cise pas le type de focus en 2�me param�tre � Execute, alors utilise vbNormalFocus (Window has focus and is restored to its original size and position.)
        If sParam�treAutomate2 = "" Then sParam�treAutomate2 = vbNormalFocus
        
        ' On s�pare le programme des param�tres du programme (1er espace hors guillemets trouv�)
        Dim bDansGuillemets As Boolean
        Dim i As Integer
        
        bDansGuillemets = False
        For i = 1 To Len(sParam�treAutomate1)
          Select Case Mid(sParam�treAutomate1, i, 1)
            Case Chr(34):     ' Guillemets
              bDansGuillemets = Not bDansGuillemets
              
            Case " ", Chr(9):
              If Not bDansGuillemets Then Exit For
          End Select
        Next
        
        Dim sCommandeWindows As String
        Dim sParam�tresWindows As String
        
        sCommandeWindows = sTrimGuillemets(Left(sParam�treAutomate1, i - 1))
        sParam�tresWindows = Mid(sParam�treAutomate1, i + 1)
        
        Dim lStatus As Long
        lStatus = ShellExecute(hwnd, "open", sCommandeWindows, sParam�tresWindows, "", CInt(sParam�treAutomate2))
        If lStatus <= 32 Then Err.Raise 1003, "ShellExecute", "�chec du ShellExecute, erreur " & lStatus
        Pause 0.2
      
'      Case "shellexecute":
'        ' M�me chose que Execute, mais s�pare la commande des arguments
'        ' Permet une syntaxe plus simple dans le fichier puisqu'il n'y a qu'� mettre des guillemets simples autour de la commande m�me si elle contient des espaces
'        ' Attention - cette simpification ne s'applique pas aux arguments !
'        ' 3�me param�tre optionnel: mode d'affichage de la fen�tre
'        If sParam�treAutomate3 = "" Then sParam�treAutomate3 = vbNormalFocus
'
'        lStatus = ShellExecute(hwnd, "open", sParam�treAutomate1, sParam�treAutomate2, "", CInt(sParam�treAutomate3))
'        If lStatus <= 32 Then Err.Raise 1003, "ShellExecute", "�chec du ShellExecute, erreur " & lStatus
'        Pause 0.2
      
      Case "sendkeys":
        If sParam�treAutomate2 = "" Then sParam�treAutomate2 = False
        SendKeys sTrimGuillemets(sParam�treAutomate1), CBool(sParam�treAutomate2)
        
      Case "date":
        Dim sFormat As String     ' 1er param�tre: format de date
        Dim iOffset As Integer    ' 2�me param�tre: d�calage en jours
        
        If sParam�treAutomate1 = "" Or sParam�treAutomate1 = """""" Then
          sFormat = "dd/mm/yyyy"
        Else
          sFormat = sTrimGuillemets(sParam�treAutomate1)
        End If
        
        If sParam�treAutomate2 = "" Then
          iOffset = 0
        Else
          iOffset = Val(sParam�treAutomate2)
        End If
        SendKeys Format(Now + iOffset, sFormat)
      
      Case "pause":
        Pause Val(Subst(sParam�treAutomate1, ",", "."))
        
      Case "msgbox":
        If sParam�treAutomate2 = "" Then sParam�treAutomate2 = vbOKOnly
        MsgBox sTrimGuillemets(sParam�treAutomate1), CLng(sParam�treAutomate2)
        
      Case "appactivate":
        If sParam�treAutomate2 <> "" Then Err.Raise 1004, "AppActivate", "Trop de param�tres."
        AppActivate sTrimGuillemets(sParam�treAutomate1)
        
      Case "quit":
        Pause 0.5   ' Par s�curit�
        bQuitter = True
        
      Case "run":                 ' Encha�ne un autre script
        Close #1                  ' Plus besoin de lire dans le fichier actuel
        Open sTrimGuillemets(sParam�treAutomate1) For Input As #1 ' On ouvre le fichier suivant
                
        ' C'est Ok, le nouveau fichier est ouvert, on initialise tout correctement
        sNomfic = sTrimGuillemets(sParam�treAutomate1)
        iNoLigne = 0
        Caption = sBaseName(sNomfic) & " - Automate"  ' Titre de la feuille
        lstTrace.AddItem "--- Nouveau sc�nario : " & sNomfic
        
      Case "":
        If sParam�treAutomate1 <> "" Or sParam�treAutomate2 <> "" Then Err.Raise 1002, "main", "Commande inconnue"
        ' sNomfice vide, rien � faire
        
      Case Else:
        Err.Raise 1002, "main", "Commande inconnue"
    End Select
    
    ' Gestion des demandes de pause
    If bPause Then
      Dim iRep As VbMsgBoxStyle
      iRep = MsgBox("Cliquer pour Ok pour continuer, vous avez alors 5 secondes pour restaurer l'application active de votre choix, ou cliquez sur Annuler pour interrompre le sc�nario.", vbExclamation + vbOKCancel, "Automate [Pause]")
      If iRep = vbCancel Then
        bStop = True          ' Arr�t du sc�nario
      Else
        bPause = 0            ' On annule la demande de pause
        Pause 5               ' Et on souffle un peu avant de continuer
      End If
    End If
    
    If bStop Or bQuitter Then Exit Do     ' Arr�t du sc�nario demand�
  Loop
  Close
  Pause 0.5   ' Pour laisser traiter les derniers SendKeys
  
  ' bQuitter � vrai, on d�charge la feuille
  If bQuitter Then Unload Me
  
  lstTrace.AddItem ""
  If bStop Then
    lstTrace.AddItem "--- Interrompu !"
  Else
    lstTrace.AddItem "--- Termin� !"
  End If
  lstTrace.ListIndex = lstTrace.ListCount - 1
  
' Restauration des menus
  cmdOuvrirSc�nario.Enabled = True   ' On r�active la commande ouvrir pendant un sc�nario
  cmdPause.Enabled = False
  cmdInterrompreSc�nario.Enabled = False
  Toolbar1.Buttons("Open").Enabled = True
  Toolbar1.Buttons("Pause").Enabled = False
  Toolbar1.Buttons("Stop").Enabled = False
  
  ' Fin du script, on efface tout
  Caption = "Automate"
  sNomfic = ""
  
  Exit Sub
  
' Traitement g�n�ral des erreurs
PbEx�cution:
  Pause 0.5             ' Le temps d'absorber les touches de la file clavier
  AppActivate Caption
  MsgBox "�chec � l'ex�cution de la commande " & sLigneOrigine & vbCrLf & "Fichier " & sNomfic & " en ligne " & iNoLigne & vbCrLf & vbCrLf & _
    "Erreur " & Err & " : " & Err.Description, vbCritical
  End   ' Arr�t brutal !
  
End Sub

' Attend t secondes
' t peut �tre d�cimal, mais la pr�cision est le 1/18� de seconde
' 86400 = Nb de secondes en une journ�e pour les attentes passant minuit

Public Sub Pause(t As Single)
  Dim t0 As Single, te As Single
  t0 = Timer
  Do
    DoEvents                          ' Laisser bosser les autres programmes
    te = Timer - t0                   ' Temps �coul�
    If te < -1 Then te = te + 86400#  ' Si on d�passe minuit
    sbStatus.SimpleText = "Temps �coul�: " & Format(te, "0.0") & "  Temps restant: " & Format(t - te, "0.0")
    If bQuitter Or bStop Or bPause Then Exit Do   ' Arr�t demand�
  Loop While te < t
  sbStatus.SimpleText = ""
End Sub

