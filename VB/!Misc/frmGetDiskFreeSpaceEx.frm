VERSION 5.00
Begin VB.Form frmTestGetDiskFreeSpaceEx 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnTest 
      Caption         =   "Test"
      Default         =   -1  'True
      Height          =   495
      Left            =   3120
      TabIndex        =   0
      Top             =   1800
      Width           =   1215
   End
End
Attribute VB_Name = "frmTestGetDiskFreeSpaceEx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Test de la fonction GetDiskFreeSpaceEx en Vb"
' frmTestGetDiskFreeSpaceEx
' Test de la fonction GetDiskFreeSpaceEx en Vb
' 29/11/1997 PV

Option Explicit

Private Sub btnTest_Click()
  Dim FreeBytesAvailableToCaller As Currency
  Dim TotalNumberOfBytes As Currency
  Dim TotalNumberOfFreeBytes As Currency
  
  If VbGetDiskFreeSpaceEx("G:\", FreeBytesAvailableToCaller, TotalNumberOfBytes, TotalNumberOfFreeBytes) Then
    Print "Ok"
    Print "FreeBytesAvailableToCaller: "; FreeBytesAvailableToCaller
    Print "TotalNumberOfBytes:         "; TotalNumberOfBytes
    Print "TotalNumberOfFreeBytes:     "; TotalNumberOfFreeBytes
  Else
    Print "Echec au GetDiskFreeSpaceEx"
  End If
End Sub
