VERSION 5.00
Begin VB.UserControl C1 
   BackColor       =   &H0080C0FF&
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.CommandButton btnHello 
      Caption         =   "Hello"
      Height          =   495
      Left            =   1140
      TabIndex        =   2
      Top             =   1980
      Width           =   1215
   End
   Begin VB.Label lblGreeting 
      Caption         =   "Label1"
      Height          =   495
      Left            =   1140
      TabIndex        =   1
      Top             =   1320
      Width           =   2415
   End
   Begin VB.Label lblPrivate 
      Caption         =   "This is a private control."
      Height          =   495
      Left            =   1080
      TabIndex        =   0
      Top             =   300
      Visible         =   0   'False
      Width           =   2475
   End
End
Attribute VB_Name = "C1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Implements PrivateInterface.PrivateMDI


Private m_Enabled As Boolean
Private m_User As String

Private Const m_def_FirstNumber As Integer = 1
Private Const m_def_SecondNumber As Integer = 1

Private m_FirstNumber As Integer
Private m_SecondNumber As Integer



Private Sub btnHello_Click()
  MsgBox "Hello, World !"
End Sub



Private Sub PrivateMDI_Enable()
   m_Enabled = True
End Sub

Private Sub PrivateMDI_SetUser(ByVal UserName As String)
  m_User = UserName
End Sub

Private Sub UserControl_Show()
   Dim ctl As Object
   If Not m_Enabled Then
      For Each ctl In _
         UserControl.Controls
         ctl.Visible = False
      Next ctl
      lblPrivate.Visible = True
   Else
      lblGreeting.Caption = _
         "Welcome " & m_User
   End If

End Sub



' Load property values from storage
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
   Call PrivateMDI_LoadProperties(PropBag)
End Sub

' Write property values to storage
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
   PrivateMDI_StoreProperties PropBag
End Sub

Private Sub PrivateMDI_LoadProperties(P As PropertyBag)
   m_FirstNumber = P.ReadProperty("FirstNumber", m_def_FirstNumber)
   m_SecondNumber = P.ReadProperty("SecondNumber", m_def_SecondNumber)
End Sub

Private Function PrivateMDI_ProgID() As String
   PrivateMDI_ProgID = App.Title & "." & UserControl.Name
End Function

Private Sub PrivateMDI_StoreProperties(P As PropertyBag)
   Call P.WriteProperty("FirstNumber", m_FirstNumber, m_def_FirstNumber)
   Call P.WriteProperty("SecondNumber", m_SecondNumber, m_def_SecondNumber)
End Sub




Private Function PrivateMDI_GetMenuEntry(Index As Integer) As String
   Select Case Index
      Case 0
         PrivateMDI_GetMenuEntry = "First Control Menu"
      Case 1
         PrivateMDI_GetMenuEntry = "Second Control Menu"
   End Select
End Function

Private Sub PrivateMDI_MenuClicked(MenuName As String)
   MsgBox "Control Menu " & MenuName & " clicked"
End Sub
 


