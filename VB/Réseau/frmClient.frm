VERSION 4.00
Begin VB.Form frmClient 
   Caption         =   "Client réseau"
   ClientHeight    =   4365
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   6885
   Height          =   4770
   Left            =   1080
   LinkTopic       =   "Form1"
   ScaleHeight     =   4365
   ScaleWidth      =   6885
   Top             =   1170
   Width           =   7005
   Begin D_SktLib.Socket socClient 
      Left            =   5670
      Top             =   315
      _version        =   65536
      _extentx        =   767
      _extenty        =   767
      _stockprops     =   0
      protocol        =   0
      localport       =   0
      remoteport      =   0
      icmptype        =   0
      icmpcode        =   0
      receivelen      =   100
      receivesize     =   1024
      sendsize        =   1024
      hostname        =   ""
      hostaddress     =   0
      sendtimeout     =   20
      optionvalue     =   ""
      protocolname    =   ""
      protocolnumber  =   0
      servicename     =   ""
      serviceport     =   0
   End
End
Attribute VB_Name = "frmClient"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
  Show
  
  socClient.HostName = "kim"
  socClient.RemotePort = 6000
  socClient.HostConvert = CONVERT_NAME_TO_ADDRESS
  socClient.Action = ACTION_CONNECT
End Sub

Private Sub socClient_OnAccept()
  Print "socClient: OnAccept"
End Sub

Private Sub socClient_OnClose()
  Print "socClient: OnClose"
End Sub

Private Sub socClient_OnConnect()
  Print "socClient: OnConnect"
End Sub

Private Sub socClient_OnError(ErrorCode As Integer)
  Print "socClient: OnError: "; ErrorCode
End Sub

Private Sub socClient_OnReceive()
  Print "socClient: OnReceive"
End Sub

Private Sub socClient_OnReceiveOOB()
  Print "socClient: OnReceiveOOB"
End Sub
