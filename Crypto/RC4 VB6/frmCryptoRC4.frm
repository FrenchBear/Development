VERSION 5.00
Begin VB.Form frmCryptoRC4 
   Caption         =   "Form1"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "frmCryptoRC4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' CryptoRC4
' Examples of RC4 algorithm implementation in VB6
' 2012-09-24    PV  Attention, VB6 unicode strings are not handled correctly!

Option Explicit


Private Sub Form_Load()
    Dim sSecret As String
    Dim sMessage As String, sPassword As String
    
    sMessage = "Où ça? Là! 10€"
    sPassword = "þ@sßwørð"

    ' #1
    Debug.Print "Implem #1"
    sSecret = ToHexDump(RC4(sMessage, sPassword))
    Debug.Print sSecret
    Debug.Print RC4(FromHexDump(sSecret), sPassword)
    Debug.Print RC4(FromHexDump(sSecret), sPassword) = sMessage
    Debug.Print
    
    ' #2
    Debug.Print "Implem #2"
    sSecret = ToHexDump(CryptRC4(sMessage, sPassword))
    Debug.Print sSecret
    Debug.Print CryptRC4(FromHexDump(sSecret), sPassword)
    Debug.Print CryptRC4(FromHexDump(sSecret), sPassword) = sMessage
    Debug.Print
    
    End
End Sub
