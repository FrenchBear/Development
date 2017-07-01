VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmOptionsRA 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Options de RA"
   ClientHeight    =   3360
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8790
   Icon            =   "frmOptionsCRA.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3360
   ScaleWidth      =   8790
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   7380
      TabIndex        =   6
      Top             =   1020
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   7380
      TabIndex        =   4
      Top             =   60
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   7380
      TabIndex        =   5
      Top             =   480
      Width           =   1350
   End
   Begin VB.TextBox txtAutresOptions 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1815
      MaxLength       =   10
      TabIndex        =   3
      Tag             =   "Autres options, non document�es"
      Top             =   2640
      Width           =   1035
   End
   Begin VB.CheckBox chkOption 
      Caption         =   "chkOption"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   0
      Left            =   120
      TabIndex        =   1
      Tag             =   "Affiche ou non le menu syst�me (utile pour la DI)"
      Top             =   480
      Visible         =   0   'False
      Width           =   6675
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   7
      Top             =   3045
      Width           =   8790
      _ExtentX        =   15505
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblTitre 
      AutoSize        =   -1  'True
      Caption         =   "? :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   240
   End
   Begin VB.Label lblAutresOptions 
      AutoSize        =   -1  'True
      Caption         =   "A&utres options :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   120
      TabIndex        =   2
      Top             =   2700
      Width           =   1515
   End
End
Attribute VB_Name = "frmOptionsRA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille d'assistance � la saisie des options de CRA (�dition et labo)"
' frmOptionsRA
' Feuille d'assistance � la saisie des options de RA (�dition et labo)
'  4/09/97 PV
' 14/10/97 PV  Option labo R, �chantillon � revivifier
' 21/10/97 PV  Options labo F (� faxer) et U (pas de GAM sur X4, X6 et K3)
' 26/02/98 PV  Option labo G (garder l'�chantillon)
'  2/11/98 PV  Option L pour les crit�res W20 W21 W22
' 01/02/99 NC  Internationalisation

Option Explicit

Private sOptions As String

Private Sub AddOption(sOption As String, sMessage As String)
  Dim iRang As Integer
  iRang = chkOption.Count
  Load chkOption(iRang)
  chkOption(iRang).Move 120, 480 + (iRang - 1) * 300
  chkOption(iRang).Caption = "&" & sOption & " " & sMessage
  chkOption(iRang).Visible = True
End Sub

Private Sub FinOptions()
  Dim iRang As Integer
  iRang = chkOption.Count
  lblAutresOptions.Top = 300 + iRang * 300
  txtAutresOptions.Top = 270 + iRang * 300
  Height = Height - ScaleHeight + iRang * 300 + 1000
End Sub

' Entr�e principale, options d'�dition
' Retour * en cas d'annulation
Public Function OptionsEdition(ByVal sOptionsBase As String) As String
  lblTitre = sGetIntlLib("OCtxtOptionEdi", "Options d'�dition :")
  AddOption "A", sGetIntlLib("OCtxtA", "Anonyme, pas d'�dition du nom de la personne ni de l'unit�")
  AddOption "L", sGetIntlLib("OCtxtL", "List�ria (automatique en saisie si crit�re W8 W9 W11 W12 W20 W21 W22)")
  AddOption "Y", sGetIntlLib("OCtxtY", "R�sultats crypt�s")
  AddOption "Z", sGetIntlLib("OCtxtZ", "Colonne crit�res non �dit�e")
  AddOption "E", sGetIntlLib("OCtxtE", "R�f�rence r�duite (sans le num�ro de pr�l�vement)")
  AddOption "S", sGetIntlLib("OCtxtS", "Conclusion non �dit�e")
  AddOption "C", sGetIntlLib("OCtxtC", "Cofrac (susceptible d'�tre �dit� avec le logo COFRAC)")
  AddOption "T", sGetIntlLib("OCtxtT", "Analyse prise en charge par le secr�tariat labo")
  FinOptions
  
  sOptions = sOptionsBase
  Show 1
  OptionsEdition = sOptions
  Unload Me
End Function


' Entr�e principale, options du labo
' Retour * en cas d'annulation
Public Function OptionsLabo(ByVal sOptionsBase As String) As String
  lblTitre = sGetIntlLib("OCtxtOptionLabo", "Options d'analyse :  ([*]: entra�ne une relecture du crit�re)")
  AddOption "A", sGetIntlLib("OCtxtLabA", "M�thode d'analyse AFNOR par d�faut pour les nouveaux RA")
  AddOption "C", sGetIntlLib("OCtxtLabC", "Analyse sans C30 (germes 3,27,53) SAUF crit�res Oxx [*]")
  AddOption "F", sGetIntlLib("OCtxtLabF", "R�sultats � faxer par d�faut pour les nouveaux RA")
  AddOption "G", sGetIntlLib("OCtxtLabG", "Garder l'�chantillon")
  AddOption "R", sGetIntlLib("OCtxtLabR", "�chantillon � revivifier")
  AddOption "N", sGetIntlLib("OCtxtLabN", "�chantillon � revivifier si T�<=-10�C ou �chantillon congel�")
  AddOption "S", sGetIntlLib("OCtxtLabS", "Analyse sans salmonelles (germe 7) [*]")
  AddOption "U", sGetIntlLib("OCtxtLabU", "Crudit�s (X4, X6, K3) sans les GAM (germe 2) [*]")
  AddOption "T", sGetIntlLib("OCtxtLabT", "Analyse prise en charge par le secr�tariat labo")
  AddOption "D", sGetIntlLib("OCtxtLabD", "Crit�re sans dilutions (sans bo�tes)")
  FinOptions
  
  sOptions = sOptionsBase
  Show 1
  OptionsLabo = sOptions
  Unload Me
End Function



Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  
  On Error GoTo FinGotFocus
  ActiveControl.SelStart = 0
  ActiveControl.SelLength = 100
FinGotFocus:
End Sub

Private Sub btnAnnuler_Click()
  sOptions = "*"
  Hide
End Sub

Private Sub btnOk_Click()
  Dim i As Integer
  
  sOptions = txtAutresOptions
  For i = 1 To chkOption.Count - 1
    If chkOption(i).Value = vbChecked Then
      sOptions = sOptions & Mid(chkOption(i).Caption, 2, 1)
    End If
  Next
  
  Hide
End Sub

Private Sub Form_Activate()
  sOptions = UCase(sOptions)
  Dim i As Integer
  For i = 1 To chkOption.Count - 1
    Dim p As Integer
    p = InStr(sOptions, Mid(chkOption(i).Caption, 2, 1))
    If p > 0 Then
      chkOption(i).Value = vbChecked
      sOptions = Left(sOptions, p - 1) & Mid(sOptions, p + 1)
    Else
      chkOption(i).Value = vbUnchecked
    End If
  Next
  txtAutresOptions = sOptions
  btnOK.SetFocus
End Sub

Private Sub Form_Load()
  Internationalisation
End Sub

Private Sub txtAutresOptions_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub

Private Sub chkOption_GotFocus(Index As Integer)
  sbStatus.SimpleText = Mid(ActiveControl.Caption, 4)
End Sub


Private Sub txtAutresOptions_KeyPress(KeyAscii As Integer)
  ' Minuscules --> Majuscules
  If KeyAscii >= Asc("a") And KeyAscii <= Asc("z") Then
    KeyAscii = KeyAscii - 32
  End If
  ' Caract�res interdits (chiffres, ponctuation� --> ignor�s
  If KeyAscii >= Asc(" ") And KeyAscii < Asc("A") Or KeyAscii > Asc("Z") Then
    KeyAscii = 0
    Exit Sub
  End If
  
  ' Si l'option correspond � une case � cocher, on change l'�tat de la base
  Dim i As Integer
  For i = 1 To chkOption.Count - 1
    If Asc(Mid(chkOption(i).Caption, 2, 1)) = KeyAscii Then
      ' On change l'�tat
      chkOption(i).Value = vbChecked + vbUnchecked - chkOption(i).Value
      KeyAscii = 0
      Exit Sub
    End If
  Next

  ' Si l'option est d�j� pr�sente, on l'efface
  Dim p As Integer
  p = InStr(txtAutresOptions, Chr(KeyAscii))
  If p > 0 Then
    txtAutresOptions = Left(txtAutresOptions, p - 1) & Mid(txtAutresOptions, p + 1)
    txtAutresOptions.SelStart = 99
    KeyAscii = 0
    Exit Sub
  End If
  
End Sub

'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "OCCaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
    
  SetLib lblTitre, "Caption", "OClblPrefixe"
  SetLib chkOption, "Caption", "OCchkOption"
  SetLib chkOption, "Tag", "OCchkOption.tag"
  SetLib lblAutresOptions, "Caption", "OClblAutresOptions"
  SetLib txtAutresOptions, "Tag", "OCtxtAutresOpt.tag"
    
End Sub

