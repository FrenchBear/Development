VERSION 5.00
Begin VB.Form frmDocument 
   Caption         =   "Document"
   ClientHeight    =   3720
   ClientLeft      =   2250
   ClientTop       =   2820
   ClientWidth     =   4920
   Icon            =   "frmDocument.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   248
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   328
   Begin VB.TextBox txtDocumentWrap 
      BeginProperty Font 
         Name            =   "Lucida Console"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   915
      Left            =   1200
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   1380
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtDocumentNoWrap 
      BeginProperty Font 
         Name            =   "Lucida Console"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   915
      Left            =   1200
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   300
      Visible         =   0   'False
      Width           =   1815
   End
End
Attribute VB_Name = "frmDocument"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Document de l'éditeur multiple
' 26/01/1997 P.Violent

Option Explicit

Public bDirty As Boolean
Public sFullPath As String
Public bFichier As Boolean    ' Vrai si le fichier a été chargé depuis un fichier

Public txtDocument As TextBox

Private bChangementTypeEnCours As Boolean

Private Sub Form_Load()
  If mdiEditeur.cmdWrap.Checked Then
    Set txtDocument = txtDocumentWrap
  Else
    Set txtDocument = txtDocumentNoWrap
  End If
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If bDirty Then
    Dim iRep As Integer
    Do
      iRep = MsgBox("Le texte dans le fichier " & mdiEditeur.sFilePart(sFullPath) & " a changé." & vbCrLf & vbCrLf & "Voulez-vous enregistrer les changements ?", vbYesNoCancel Or vbExclamation)
      If iRep = vbNo Then Exit Do
      If iRep = vbCancel Then Cancel = True: Exit Sub
      If iRep = vbYes Then
        If mdiEditeur.bDoEnregistrer(Me) Then Exit Do
      End If
    Loop
  End If
End Sub

Private Sub Form_Resize()
  txtDocument.Move -2, -2, ScaleWidth + 3, ScaleHeight + 3
End Sub

Public Sub DocChange()
  If Not bChangementTypeEnCours And Not bDirty Then
    bDirty = 1
    Caption = Caption & " *"
  End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
  mdiEditeur.iNbDoc = mdiEditeur.iNbDoc - 1
  mdiEditeur.MajNbDoc
End Sub

Private Sub txtDocumentNoWrap_Change()
  DocChange
End Sub

Private Sub txtDocumentWrap_Change()
  DocChange
End Sub


Sub ChangeType()
  Dim iSelStart As Integer, iSelLength As Integer
  iSelStart = txtDocument.SelStart
  iSelLength = txtDocument.SelLength
  
  bChangementTypeEnCours = True
  If mdiEditeur.cmdWrap.Checked Then
    txtDocumentWrap = txtDocumentNoWrap
    txtDocumentNoWrap = ""
    txtDocumentNoWrap.Visible = False
    Set txtDocument = txtDocumentWrap
    Form_Resize
    txtDocumentWrap.Visible = True
  Else
    txtDocumentNoWrap = txtDocumentWrap
    txtDocumentWrap = ""
    txtDocumentWrap.Visible = False
    Set txtDocument = txtDocumentNoWrap
    Form_Resize
    txtDocumentNoWrap.Visible = True
  End If
  bChangementTypeEnCours = False
  
  txtDocument.SelStart = iSelStart
  txtDocument.SelLength = iSelLength
End Sub
