VERSION 5.00
Begin VB.UserControl BDSélecteurTableau 
   ClientHeight    =   2040
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   390
   DefaultCancel   =   -1  'True
   ScaleHeight     =   2040
   ScaleWidth      =   390
   Begin VB.CommandButton btnTabCancel 
      Height          =   360
      Left            =   0
      Picture         =   "BDSélecteurTableau.ctx":0000
      Style           =   1  'Graphical
      TabIndex        =   4
      ToolTipText     =   "Annule les modifications du tableau"
      Top             =   1680
      Width           =   375
   End
   Begin VB.CommandButton btnTabValidate 
      Height          =   360
      Left            =   0
      Picture         =   "BDSélecteurTableau.ctx":014A
      Style           =   1  'Graphical
      TabIndex        =   3
      ToolTipText     =   "Valide les modifications du tableau"
      Top             =   1320
      Width           =   375
   End
   Begin VB.CommandButton btnTabDeleteRow 
      Height          =   360
      Left            =   0
      Picture         =   "BDSélecteurTableau.ctx":0294
      Style           =   1  'Graphical
      TabIndex        =   2
      ToolTipText     =   "Supprime une ligne du tableau (F8)"
      Top             =   840
      Width           =   375
   End
   Begin VB.CommandButton btnTabInsertRow 
      Height          =   360
      Left            =   0
      Picture         =   "BDSélecteurTableau.ctx":03DE
      Style           =   1  'Graphical
      TabIndex        =   1
      ToolTipText     =   "Insère une ligne dans le tableau (F7)"
      Top             =   480
      Width           =   375
   End
   Begin VB.CommandButton btnTabChange 
      Height          =   360
      Left            =   0
      Picture         =   "BDSélecteurTableau.ctx":0528
      Style           =   1  'Graphical
      TabIndex        =   0
      ToolTipText     =   "Modifie les données du tableau"
      Top             =   0
      Width           =   375
   End
End
Attribute VB_Name = "BDSélecteurTableau"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Contrôle utilisateur BDSélecteurTableau
' Groupe de boutons pour les tableaux
'  3/11/1999 PV
'  8/11/1999 PV Propriétés Default et Cancel des boutons


Option Explicit

Event ActionTabChange()
Event ActionTabInsertRow()
Event ActionTabDeleteRow()
Event ActionTabValidate()
Event ActionTabCancel()


Private bLectureSeule As Boolean
Private bLocked As Boolean



' ================================================================================
' Evénements reçus par le contrôle

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  bLectureSeule = PropBag.ReadProperty("LectureSeule", False)
  bLocked = PropBag.ReadProperty("Locked", False)
End Sub

Private Sub UserControl_Resize()
  Height = 2040
  Width = 390
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  PropBag.WriteProperty "LectureSeule", bLectureSeule, False
  PropBag.WriteProperty "Locked", bLocked, False
End Sub


' ================================================================================
' Propriétés du contrôle

Public Property Get LectureSeule() As Boolean
  LectureSeule = bLectureSeule
End Property

Public Property Let LectureSeule(ByVal New_LectureSeule As Boolean)
  bLectureSeule = New_LectureSeule
  PropertyChanged "LectureSeule"
End Property


Public Property Get Locked() As Boolean
  Locked = bLocked
End Property

Public Property Let Locked(ByVal New_Locked As Boolean)
  bLocked = New_Locked
  PropertyChanged "Locked"
End Property


' ================================================================================
' Boutons


Private Sub btnTabChange_Click()
  RaiseEvent ActionTabChange
End Sub

Private Sub btnTabInsertRow_Click()
  RaiseEvent ActionTabInsertRow
End Sub

Private Sub btnTabDeleteRow_Click()
  RaiseEvent ActionTabDeleteRow
End Sub

Private Sub btnTabValidate_Click()
  RaiseEvent ActionTabValidate
End Sub

Private Sub btnTabCancel_Click()
  RaiseEvent ActionTabCancel
End Sub


Public Property Let ButtonEnabled(Optional ByVal sKey As String = "all", ByVal bEnabled As Boolean)
  If sKey = "all" Or StrComp(sKey, "change", vbTextCompare) = 0 Then btnTabChange.Enabled = bEnabled And Not bLectureSeule
  If sKey = "all" Or StrComp(sKey, "insertrow", vbTextCompare) = 0 Then btnTabInsertRow.Enabled = bEnabled And Not bLectureSeule
  If sKey = "all" Or StrComp(sKey, "deleterow", vbTextCompare) = 0 Then btnTabDeleteRow.Enabled = bEnabled And Not bLectureSeule
  If sKey = "all" Or StrComp(sKey, "validate", vbTextCompare) = 0 Then
    btnTabValidate.Enabled = bEnabled And Not bLectureSeule
    If btnTabValidate.Enabled Then btnTabValidate.Default = True
  End If
  If sKey = "all" Or StrComp(sKey, "cancel", vbTextCompare) = 0 Then
    btnTabCancel.Enabled = bEnabled And Not bLectureSeule
    If btnTabCancel.Enabled Then btnTabCancel.Cancel = True
  End If
End Property

Public Property Get ButtonEnabled(ByVal sKey As String) As Boolean
  Select Case LCase(sKey)
    Case "change":    ButtonEnabled = btnTabChange.Enabled
    Case "insertrow": ButtonEnabled = btnTabInsertRow.Enabled
    Case "deleterow": ButtonEnabled = btnTabDeleteRow.Enabled
    Case "validate":  ButtonEnabled = btnTabValidate.Enabled
    Case "cancel":    ButtonEnabled = btnTabCancel.Enabled
  End Select
End Property


' Helpers
' Contrôle Edit et Delete
Public Sub ActiveValidation(ByVal bEnabled As Boolean)
  ButtonEnabled("Validate") = bEnabled
  ButtonEnabled("Cancel") = bEnabled
End Sub


' ==============================================================================
' Interface clavier

Public Sub KeyDown(KeyCode As Integer, Shift As Integer)
  Select Case KeyCode
    Case vbKeyEscape: If btnTabCancel.Enabled Then RaiseEvent ActionTabCancel
    Case vbKeyReturn: If btnTabValidate.Enabled Then RaiseEvent ActionTabValidate
    Case vbKeyF7:     If btnTabInsertRow.Enabled Then RaiseEvent ActionTabInsertRow
    Case vbKeyF8:     If btnTabDeleteRow.Enabled Then RaiseEvent ActionTabDeleteRow
  End Select
End Sub

