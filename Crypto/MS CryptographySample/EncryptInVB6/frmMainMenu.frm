VERSION 5.00
Begin VB.Form frmMainMenu 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   1680
   ClientLeft      =   1560
   ClientTop       =   1845
   ClientWidth     =   4620
   Icon            =   "frmMainMenu.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1680
   ScaleWidth      =   4620
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdChoice 
      Caption         =   "Test &Encyption"
      Height          =   375
      Index           =   0
      Left            =   600
      TabIndex        =   2
      Top             =   1080
      Width           =   1695
   End
   Begin VB.CommandButton cmdChoice 
      Caption         =   "E&xit"
      Height          =   375
      Index           =   9
      Left            =   2760
      TabIndex        =   0
      Top             =   1080
      Width           =   1275
   End
   Begin VB.Label lblMyLabel 
      BackStyle       =   0  'Transparent
      Height          =   405
      Left            =   180
      TabIndex        =   1
      Top             =   4620
      Width           =   2595
   End
End
Attribute VB_Name = "frmMainMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' ===========================================================================
'    DATE      NAME                      DESCRIPTION
' -----------  ------------------------  ------------------------------------
' 30-DEC-2000  Kenneth Ives              Written by kenaso@home.com
' ---------------------------------------------------------------------------
' Module level variables
' ---------------------------------------------------------------------------
  Private m_blnEncryptFiles As Boolean
  '
  

Private Sub cmdChoice_Click(Index As Integer)

' ---------------------------------------------------------------------------
' Hide the main menu
' ---------------------------------------------------------------------------
  frmMainMenu.Hide

' ---------------------------------------------------------------------------
' Based on the button pressed
' ---------------------------------------------------------------------------
  Select Case Index

         Case 6:   ' Test Encryption
              If m_blnEncryptFiles Then
                  frmEncFiles.Reset_frmEncfiles
              End If
        Case 9:
            End
  End Select

End Sub

Private Sub Form_Load()

' ---------------------------------------------------------------------------
' Set the default option
' ---------------------------------------------------------------------------
  optEncrypt_Click 0
  
' ---------------------------------------------------------------------------
' Display this form
' ---------------------------------------------------------------------------
  With frmMainMenu
       .Show vbModeless  ' reduce flicker
  End With
  
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
 
'
End Sub

Private Sub optEncrypt_Click(Index As Integer)
  m_blnEncryptFiles = False
  Select Case Index
         
          
         
         Case 1   ' Work with files
              optEncrypt(1).Value = True   ' Files
              m_blnEncryptFiles = True
  End Select
  
End Sub
