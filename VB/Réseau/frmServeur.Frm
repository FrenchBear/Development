VERSION 4.00
Begin VB.Form frmServeur 
   Caption         =   "Serveur réseau"
   ClientHeight    =   4920
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   7065
   Height          =   5325
   Left            =   1080
   LinkTopic       =   "Form1"
   ScaleHeight     =   4920
   ScaleWidth      =   7065
   Top             =   1170
   Width           =   7185
   Begin D_SktLib.Socket socServeur 
      Left            =   6090
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
      servicename     =   "ercem1"
      serviceport     =   6600
   End
End
Attribute VB_Name = "frmServeur"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
  Show
  socServeur.LocalPort = 6000
  socServeur.Action = ACTION_LISTEN
End Sub

Private Sub socServeur_OnAccept()
  Print "Serveur: OnAccept"
End Sub

Private Sub socServeur_OnClose()
  Print "Serveur: OnClose"
End Sub

Private Sub socServeur_OnConnect()
  Print "Serveur: OnConnect"
End Sub

Private Sub socServeur_OnError(ErrorCode As Integer)
  Print "Serveur: OnError: "; ErrorCode
End Sub

Private Sub socServeur_OnReceive()
  Print "Serveur: OnReceive"
End Sub

Private Sub socServeur_OnReceiveOOB()
  Print "Serveur: OnReceiveOOB"
End Sub
