VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl BDSélecteur 
   Alignable       =   -1  'True
   BackStyle       =   0  'Transparent
   ClientHeight    =   1290
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9045
   ClipBehavior    =   0  'None
   ClipControls    =   0   'False
   FillColor       =   &H80000005&
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   ScaleHeight     =   1290
   ScaleWidth      =   9045
   ToolboxBitmap   =   "BDSélecteur.ctx":0000
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9045
      _ExtentX        =   15954
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      AllowCustomize  =   0   'False
      Appearance      =   1
      ImageList       =   "ilToolBar2"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   14
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Query"
            Object.ToolTipText     =   "Rechercher (?)"
            ImageKey        =   "imgQuery"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "First"
            Object.ToolTipText     =   "Premier enregistrement (Début)"
            ImageKey        =   "imgFirst"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Previous"
            Object.ToolTipText     =   "Enregistrement précédent (-)"
            ImageKey        =   "imgPrevious"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Next"
            Object.ToolTipText     =   "Enregistrement suivant (+)"
            ImageKey        =   "imgNext"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Last"
            Object.ToolTipText     =   "Dernier enregistrement (Fin)"
            ImageKey        =   "imgLast"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Add"
            Object.ToolTipText     =   "Nouvel enregistrement"
            ImageKey        =   "imgAdd"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Change"
            Object.ToolTipText     =   "Changer"
            ImageKey        =   "imgEdit"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Delete"
            Object.ToolTipText     =   "Supprimer l'enregistrement (Suppr)"
            ImageKey        =   "imgDelete"
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Validate"
            Object.ToolTipText     =   "Valider / Lancer la recherche (Entrée)"
            ImageKey        =   "imgValidate"
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Cancel"
            Object.ToolTipText     =   "Annuler les changements (Echap)"
            ImageKey        =   "imgCancel"
         EndProperty
      EndProperty
      BorderStyle     =   1
      Begin VB.PictureBox picConteneur 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   390
         Left            =   4020
         ScaleHeight     =   390
         ScaleWidth      =   2535
         TabIndex        =   1
         Top             =   0
         Width           =   2535
         Begin VB.Label txtNuméroEnreg 
            BorderStyle     =   1  'Fixed Single
            Height          =   300
            Left            =   60
            TabIndex        =   3
            Top             =   50
            Width           =   675
         End
         Begin VB.Label txtMessage 
            BackColor       =   &H0080C0FF&
            BackStyle       =   0  'Transparent
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   390
            Left            =   840
            TabIndex        =   2
            Top             =   -15
            Width           =   735
         End
      End
   End
   Begin MSComctlLib.ImageList ilToolBar2 
      Left            =   5820
      Top             =   600
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   10
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "BDSélecteur.ctx":00FA
            Key             =   "imgQuery"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "BDSélecteur.ctx":020C
            Key             =   "imgFirst"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "BDSélecteur.ctx":031E
            Key             =   "imgPrevious"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "BDSélecteur.ctx":0430
            Key             =   "imgNext"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "BDSélecteur.ctx":0542
            Key             =   "imgLast"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "BDSélecteur.ctx":0654
            Key             =   "imgAdd"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "BDSélecteur.ctx":0766
            Key             =   "imgEdit"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "BDSélecteur.ctx":0878
            Key             =   "imgDelete"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "BDSélecteur.ctx":098A
            Key             =   "imgValidate"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "BDSélecteur.ctx":0A94
            Key             =   "imgCancel"
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "BDSélecteur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Contrôle utilisateur BDSélecteur
' Mise en commun de ressources
'  6/05/1998 PV
' 02/07/1998 PV KeyDown delete non transmis à la feuille supportant le contrôle ???
' 19/04/1999 PV Propriété LectureSeule
' 11/08/1999 PV Propriété Message
' 19/08/1999 PV Message et N° d'enregistrement -- enfin -- implantés en label, avec l'astuce d'un conteneur picture


Option Explicit

Event ActionQuery()
Event ActionFirst()
Event ActionPrevious()
Event ActionNext()
Event ActionLast()
Event ActionAdd()
Event ActionChange()
Event ActionDelete()
Event ActionValidate()
Event ActionCancel()


Private bLectureSeule As Boolean


' Bug VB ?
' L'événement KeyDown pour la touche Del n'est pas transmis à la feuille mère
'Private Sub txtNuméroEnreg_KeyDown(KeyCode As Integer, Shift As Integer)
'  If KeyCode = vbKeyDelete Then
'    If tbBoutons.Buttons("Delete").Enabled Then RaiseEvent ActionDelete
'  End If
'End Sub

' ================================================================================
' Evénements reçus par le contrôle

Private Sub UserControl_InitProperties()
  Set txtNuméroEnreg.Font = UserControl.Ambient.Font
End Sub

Private Sub UserControl_Paint()
  ' Dessine un trait sous la barre de boutons
  Line (0, tbBoutons.Height)-Step(ScaleWidth, 0), vbButtonShadow
  Line (0, tbBoutons.Height + 15)-Step(ScaleWidth, 0), vb3DHighlight
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  Set txtNuméroEnreg.Font = PropBag.ReadProperty("Font", Ambient.Font)
  bLectureSeule = PropBag.ReadProperty("LectureSeule", False)
End Sub

Private Sub UserControl_Resize()
  Height = tbBoutons.Height + 20
  If ScaleWidth > 4050 Then picConteneur.Width = ScaleWidth - 4050
  If picConteneur.Width > 850 Then txtMessage.Width = picConteneur.Width - 850
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  PropBag.WriteProperty "Font", txtNuméroEnreg.Font, Ambient.Font
  PropBag.WriteProperty "LectureSeule", bLectureSeule, False
End Sub

' ================================================================================
' Propriétés du contrôle

Public Property Get NumRec() As Variant
  NumRec = txtNuméroEnreg
End Property

Public Property Let NumRec(ByVal vNewValue As Variant)
  txtNuméroEnreg = vNewValue
End Property


Public Sub RefreshNumRec()
  txtNuméroEnreg.Refresh
End Sub

Public Sub RefreshMessage()
  txtMessage.Refresh
End Sub

Public Property Get Font() As Font
  Set Font = txtNuméroEnreg.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  Set txtNuméroEnreg.Font = New_Font
  PropertyChanged "Font"
End Property

Public Property Get LectureSeule() As Boolean
  LectureSeule = bLectureSeule
End Property

Public Property Let LectureSeule(ByVal New_LectureSeule As Boolean)
  bLectureSeule = New_LectureSeule
  PropertyChanged "LectureSeule"
End Property

Public Property Get Message() As String
  Message = txtMessage
End Property

Public Property Let Message(ByVal vNewValue As String)
  txtMessage = vNewValue
End Property

' ================================================================================
' Barre de boutons

Private Sub tbBoutons_ButtonClick(ByVal Button As MSComctlLib.Button)
  Select Case Button.Key
    Case "Query":     RaiseEvent ActionQuery
    Case "First":     RaiseEvent ActionFirst
    Case "Previous":  RaiseEvent ActionPrevious
    Case "Next":      RaiseEvent ActionNext
    Case "Last":      RaiseEvent ActionLast
    Case "Add":       RaiseEvent ActionAdd
    Case "Change":    RaiseEvent ActionChange
    Case "Delete":    RaiseEvent ActionDelete
    Case "Validate":  RaiseEvent ActionValidate
    Case "Cancel":    RaiseEvent ActionCancel
  End Select
End Sub

Public Property Let ButtonEnabled(ByVal sKey As String, ByVal bEnabled As Boolean)
  If StrComp(sKey, "Add", vbTextCompare) = 0 Or StrComp(sKey, "Change", vbTextCompare) = 0 Or StrComp(sKey, "Delete", vbTextCompare) = 0 Then bEnabled = bEnabled And Not bLectureSeule
  tbBoutons.Buttons(sKey).Enabled = bEnabled
End Property

Public Property Get ButtonEnabled(ByVal sKey As String) As Boolean
  ButtonEnabled = tbBoutons.Buttons(sKey).Enabled
End Property

' Helpers
' Contrôle l'activation/désactivation des boutons de navigation, ainsi que Edit et Delete
Public Sub ActiveMouvements(ByVal bEnabled As Boolean)
  ButtonEnabled("First") = bEnabled
  ButtonEnabled("Previous") = bEnabled
  ButtonEnabled("Next") = bEnabled
  ButtonEnabled("Last") = bEnabled

  ButtonEnabled("Change") = bEnabled
  ButtonEnabled("Delete") = bEnabled
End Sub

' Désactive les boutons de mouvements
Public Sub EmpêcheMouvements()
  ButtonEnabled("First") = False
  ButtonEnabled("Previous") = False
  ButtonEnabled("Next") = False
  ButtonEnabled("Last") = False
End Sub


Public Sub ActiveValidation(ByVal bEnabled As Boolean)
  ButtonEnabled("Validate") = bEnabled
  ButtonEnabled("Cancel") = bEnabled
End Sub

' ==============================================================================
' Interface clavier

Public Sub KeyDown(KeyCode As Integer)
  Select Case KeyCode
    Case vbKeyHome:   If tbBoutons.Buttons("First").Enabled Then RaiseEvent ActionFirst
    Case vbKeyEnd:    If tbBoutons.Buttons("Last").Enabled Then RaiseEvent ActionLast
    Case vbKeyDelete: If tbBoutons.Buttons("Delete").Enabled Then RaiseEvent ActionDelete
    Case vbKeyEscape: If tbBoutons.Buttons("Cancel").Enabled Then RaiseEvent ActionCancel
    Case vbKeyReturn: If tbBoutons.Buttons("Validate").Enabled Then RaiseEvent ActionValidate
  End Select
End Sub

Public Sub KeyPress(KeyAscii As Integer)
  Select Case KeyAscii
    Case 63: KeyAscii = 0: If tbBoutons.Buttons("Query").Enabled Then RaiseEvent ActionQuery
    Case 45: KeyAscii = 0: If tbBoutons.Buttons("Previous").Enabled Then RaiseEvent ActionPrevious
    Case 43: KeyAscii = 0: If tbBoutons.Buttons("Next").Enabled Then RaiseEvent ActionNext
    Case 65, 97: KeyAscii = 0: If tbBoutons.Buttons("Add").Enabled Then RaiseEvent ActionAdd
    Case 67, 99: KeyAscii = 0: If tbBoutons.Buttons("Change").Enabled Then RaiseEvent ActionChange
  End Select
End Sub

