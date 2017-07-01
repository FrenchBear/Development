VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmSaisieProCrit 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Saisie d'un produit-critère"
   ClientHeight    =   1755
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5010
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmSaisieProCrit.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1755
   ScaleWidth      =   5010
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtType 
      Height          =   315
      Left            =   1200
      MaxLength       =   25
      TabIndex        =   3
      Tag             =   "Entrez le type à utiliser a.b.c.d.e (facultatif)"
      Top             =   480
      Width           =   2235
   End
   Begin VB.TextBox txtCritère 
      Height          =   315
      Left            =   1200
      MaxLength       =   10
      TabIndex        =   1
      Tag             =   "Entrez le critère sélectionné"
      Top             =   60
      Width           =   1515
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   3600
      TabIndex        =   6
      Top             =   480
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   3600
      TabIndex        =   5
      Top             =   60
      Width           =   1350
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   3600
      TabIndex        =   7
      Top             =   1020
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   4
      Top             =   1440
      Width           =   5010
      _ExtentX        =   8837
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
   Begin VB.Label lblLibelle 
      Caption         =   "Attention, les nouveaux types sont de la forme 0.n.n.n.0 !"
      Height          =   435
      Left            =   120
      TabIndex        =   8
      Top             =   900
      Width           =   3315
   End
   Begin VB.Label lblType 
      AutoSize        =   -1  'True
      Caption         =   "&Type :"
      Height          =   210
      Left            =   120
      TabIndex        =   2
      Top             =   540
      Width           =   585
   End
   Begin VB.Label lblCritère 
      AutoSize        =   -1  'True
      Caption         =   "&Critère :"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   780
   End
End
Attribute VB_Name = "frmSaisieProCrit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille de saisie d'un critère+type comme produit"
' frmSaisieProCrit
' Feuille de saisie d'un critère+type comme produit
' 23/10/1997
' 21/12/1998 PV Type par défaut 4.20.1.1.10
' 01/02/1999 NC Internationalisation

Option Explicit

Private sFinal As String

Public Function Saisie(ByVal sValeurDéfaut As String) As String
  Dim iPosV As Integer
  iPosV = InStr(sValeurDéfaut, ",")
  If iPosV > 0 Then
    txtCritère = Trim(Left(sValeurDéfaut, iPosV - 1))
    txtType = Trim(Mid(sValeurDéfaut, iPosV + 1))
  Else
    txtCritère = Trim(sValeurDéfaut)
    txtType = ""
  End If
  
  Show 1
  Saisie = sFinal
  Unload Me
End Function


Private Sub btnAnnuler_Click()
  sFinal = ""
  Hide
End Sub

Private Sub btnOk_Click()
  If Not bCheckCritère(True) Then Exit Sub
  If Not bCheckType(True) Then Exit Sub
  
  sFinal = txtCritère
  If txtType <> "" Then sFinal = sFinal & ", " & txtType

  Hide
End Sub


Private Sub Form_Load()
  Internationalisation
End Sub

' ===============================================================
' Critère

Private Sub txtCritère_Change()
  ' On convertit en majuscules
  If txtCritère <> UCase(txtCritère) Then
    Dim sStart As Integer, sLength As Integer
    sStart = txtCritère.SelStart
    sLength = txtCritère.SelLength
    txtCritère = UCase(txtCritère)
    txtCritère.SelStart = sStart
    txtCritère.SelLength = sLength
  End If
End Sub

Private Function bCheckCritère(bMessage As Boolean) As Boolean
  If txtCritère = "" Then
    If bMessage Then MsgBox2i "CR264"
    'MsgBox "Le critère est obligatoire.", vbExclamation, sNomApp
    bCheckCritère = False
    Exit Function
  End If
  
  ' On vérifie simplement que le critère existe en AFNOR ou en simplifié
  Dim cr As RA
  Set cr = LireCritèreDilutions(txtCritère, 0, "A", "")
  If cr Is Nothing Then Set cr = LireCritèreDilutions(txtCritère, 0, "S", "")
  If cr Is Nothing Then Set cr = LireCritèreDilutions(txtCritère, 0, "P", "")
  If cr Is Nothing Then
    If bMessage Then MsgBox2i "CR265"
    'MsgBox "Critère inexistant (n'existe ni en AFNOR, ni en simplifié).", vbExclamation, sNomApp
    bCheckCritère = False
    Exit Function
  End If
    
  bCheckCritère = True
End Function


' ===============================================================
' Type

Private Function bCheckType(bMessage As Boolean) As Boolean
  ' Le type est facultatif
  If txtType = "" Then
    txtType = "4.20.1.1.10"   ' Type des produits-critères
    bCheckType = True
    Exit Function
  End If
  
  ' On vérifie simplement que le type est de la forme a.b.c.d.e
  Dim p As Integer
  Dim i As Integer, iType As Long
  Dim sBufferAnalyse As String
  
  sBufferAnalyse = txtType & "."
  For i = 1 To 5
    p = InStr(sBufferAnalyse, ".")
    If p = 0 Then
      If bMessage Then MsgBox2i "CR266"
      'MsgBox "Type incorrect.", vbExclamation, sNomApp
      bCheckType = False
      Exit Function
    End If
    
    If Not IsNumeric(Left(sBufferAnalyse, p - 1)) Then
      If bMessage Then MsgBox2i "CR266"
      'MsgBox "Type incorrect.", vbExclamation, sNomApp
      bCheckType = False
      Exit Function
    End If
    
    iType = CLng(Left(sBufferAnalyse, p - 1))
    If iType < 0 Or iType > 1000 Then
      If bMessage Then MsgBox2i "CR266"
      'MsgBox "Type incorrect.", vbExclamation, sNomApp
      bCheckType = False
      Exit Function
    End If
    
    sBufferAnalyse = Mid(sBufferAnalyse, p + 1)
  Next
  
  If sBufferAnalyse <> "" Then
    If bMessage Then MsgBox2i "CR267"
    'MsgBox "Type incorrect. Il est composé de 5 nombres séparés par des points.", vbExclamation, sNomApp
    bCheckType = False
    Exit Function
  End If
  
  If Not bTypeExistant(txtType) Then
    MsgBox2i "CO005", txtType
    txtType.SetFocus
    'MsgBox "Type inexistant.", vbExclamation, sNomApp
    bCheckType = False
    Exit Function
  End If
  
  bCheckType = True
End Function



' ===============================================================

Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  
  On Error GoTo FinGotFocus
  ActiveControl.SelStart = 0
  ActiveControl.SelLength = 100
FinGotFocus:
End Sub

Private Sub txtCritère_GotFocus(): GotFocus: End Sub
Private Sub txtType_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub


'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "PCCaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
    
  SetLib lblCritère, "Caption", "PClblCritère"
  SetLib txtCritère, "Tag", "PCtxtCritère.tag"
  SetLib lblType, "Caption", "PClblType"
  SetLib txtType, "Tag", "PCtxtType.tag"
  SetLib lblLibelle, "Caption", "PClblLibelle"
    
End Sub


