VERSION 2.00
Begin Form Form1 
   Caption         =   "Essai de communications série"
   ClientHeight    =   6456
   ClientLeft      =   852
   ClientTop       =   1500
   ClientWidth     =   6324
   Height          =   6828
   Left            =   828
   LinkTopic       =   "Form1"
   ScaleHeight     =   6456
   ScaleWidth      =   6324
   Top             =   1152
   Width           =   6372
   Begin MSComm Comm1 
      Interval        =   1000
      Left            =   120
      Top             =   120
   End
End

Sub Form_Load ()
  Show

  ' Use COM1.
  Comm1.CommPort = 1
  ' 9600 baud, no parity, 8 data, and 1 stop bit.
  Comm1.Settings = "9600,N,8,1"
  ' Tell the control to read entire buffer when Input is used.
  Comm1.InputLen = 0
  ' Open the port.
  Comm1.PortOpen = True
  ' Send the attention command to the modem.
  Print "Envoi AT"
  Comm1.Output = "AT" + Chr$(13)
  ' Wait for data to come back to the serial port.
  Do
    Dummy = DoEvents()
  Loop Until Comm1.InBufferCount >= 2
  ' Read the "OK" response data in the serial port.
  InString$ = Comm1.Input

  Print "Reçu: "; InString$

  ' Close the serial port.
  Comm1.PortOpen = False
End Sub

