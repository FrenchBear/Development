VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Begin VB.Form frmMsgHtml 
   Caption         =   "HMsgBox"
   ClientHeight    =   3555
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7710
   Icon            =   "frmMsgHtml.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   3555
   ScaleWidth      =   7710
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnHome 
      Height          =   495
      Left            =   60
      Picture         =   "frmMsgHtml.frx":000C
      Style           =   1  'Graphical
      TabIndex        =   2
      ToolTipText     =   "Affiche le message de départ"
      Top             =   600
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.CommandButton btnOk 
      Cancel          =   -1  'True
      Caption         =   "Ok"
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
      Height          =   435
      Left            =   2820
      TabIndex        =   1
      Top             =   2700
      Width           =   1215
   End
   Begin SHDocVwCtl.WebBrowser WB 
      Height          =   2415
      Left            =   660
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   60
      Width           =   6075
      ExtentX         =   10716
      ExtentY         =   4260
      ViewMode        =   1
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   -1  'True
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
   Begin VB.Image imgIcône 
      Appearance      =   0  'Flat
      Height          =   480
      Left            =   60
      Top             =   60
      Width           =   480
   End
   Begin VB.Image imgIcônes 
      Height          =   480
      Index           =   3
      Left            =   60
      Picture         =   "frmMsgHtml.frx":04FE
      Top             =   2520
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgIcônes 
      Height          =   480
      Index           =   2
      Left            =   60
      Picture         =   "frmMsgHtml.frx":0940
      Top             =   2040
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgIcônes 
      Height          =   480
      Index           =   1
      Left            =   60
      Picture         =   "frmMsgHtml.frx":0D82
      Top             =   1560
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgIcônes 
      Height          =   480
      Index           =   0
      Left            =   60
      Picture         =   "frmMsgHtml.frx":11C4
      Top             =   1080
      Visible         =   0   'False
      Width           =   480
   End
End
Attribute VB_Name = "frmMsgHtml"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmMsgHTML
' Affiche un message en HTML
' 26/05/1998 PV
' 17/12/1998 PV Erreur 13: Type inconpatible due au changement de type HTMLDocument entre IE4 et IE5

Option Explicit

Private sMsgGlobal As String
Private sTitle As String

Private Sub btnHome_Click()
  If WB.LocationURL <> "about:blank" Then
    WB.Navigate "about:blank"
    Caption = sTitle
    btnHome.Visible = False
  End If
End Sub

Private Sub btnOk_Click()
  Hide
End Sub

Public Function HMsgBox(ByVal sMsg As String, Optional Buttons As VbMsgBoxStyle = vbOKOnly, Optional Title As String) As VbMsgBoxResult
  Caption = Title
  sMsgGlobal = sMsg
  sTitle = Title
  btnHome.Visible = False
  WB.Navigate "about:blank"
  DoEvents
  Select Case Buttons And (vbCritical Or vbQuestion Or vbExclamation Or vbInformation)
    Case vbCritical:    Set imgIcône.Picture = imgIcônes(0).Picture
    Case vbQuestion:    Set imgIcône.Picture = imgIcônes(1).Picture
    Case vbExclamation: Set imgIcône.Picture = imgIcônes(2).Picture
    Case vbInformation: Set imgIcône.Picture = imgIcônes(3).Picture
    Case Else:          Set imgIcône.Picture = LoadPicture
  End Select
  Show vbModal
  HMsgBox = vbOK
  Unload Me
End Function


' On centre la feuille à l'écran
Private Sub Form_Load()
  Me.Move (Screen.Width - Me.Width) / 2, (Screen.Height - Me.Height) / 2
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  btnOk.Move (frmMsgHtml.ScaleWidth - btnOk.Width) / 2, frmMsgHtml.ScaleHeight - btnOk.Height - 80
  WB.Move WB.Left, WB.Top, frmMsgHtml.ScaleWidth - WB.Left - 50, frmMsgHtml.ScaleHeight - WB.Top - btnOk.Height - 200
End Sub

Private Sub WB_BeforeNavigate2(ByVal pDisp As Object, URL As Variant, Flags As Variant, TargetFrameName As Variant, PostData As Variant, Headers As Variant, Cancel As Boolean)
  If StrComp(URL, "about:blank", vbTextCompare) = 0 Then Exit Sub
  Cancel = True
  If StrComp(Left(URL, 5), "http:", vbTextCompare) = 0 Then
    FileShellExecute hWnd, URL
  ElseIf StrComp(Left(URL, 5), "exec:", vbTextCompare) = 0 Then
    FileShellExecute hWnd, Mid(URL, 6)
  ElseIf StrComp(Left(URL, 8), "interne:", vbTextCompare) = 0 Then
    MsgBox "Internal link: " & URL
  Else
    sMsgGlobal = URL
    Hide
  End If
End Sub

Private Sub WB_DocumentComplete(ByVal pDisp As Object, URL As Variant)
  If WB.Document Is Nothing Then Exit Sub
  
' Plante (Erreur 13: Type incompatible) si compilé enironnement IE5
' et exécuté environnement IE4…
' Dim d As HTMLDocument

  Dim d
  Set d = WB.Document
  WB.TheaterMode = True
  d.createStyleSheet.cssText = _
    "BODY      {color: #000000; font: 10pt Verdana, Arial;}" & _
    "H1        {color: #FF3300; font: 13pt Verdana, Arial; font-weight:bold; background: #FFCC00}" & _
    "A:link    {color: #0000FF; font: 10pt Verdana, Arial; font-weight:bold}" & _
    "A:visited {color: #FF00FF; font: 10pt Verdana, Arial; font-weight:bold}"
'  d.body.Style.backgroundColor = "#CCDDEE"
  d.body.Style.marginTop = "4pt"
  d.body.innerHTML = sMsgGlobal
  Screen.MousePointer = vbArrow
End Sub

