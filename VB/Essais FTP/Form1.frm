VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form Label3Label3Label3 
   Caption         =   "Form1"
   ClientHeight    =   6750
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6555
   LinkTopic       =   "Form1"
   ScaleHeight     =   6750
   ScaleWidth      =   6555
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdDiconnect 
      Caption         =   "Disconnect"
      Height          =   435
      Left            =   5040
      TabIndex        =   13
      Top             =   3240
      Width           =   1215
   End
   Begin VB.CommandButton btnEfface 
      Caption         =   "Efface"
      Height          =   435
      Left            =   5040
      TabIndex        =   12
      Top             =   4320
      Width           =   1215
   End
   Begin VB.ListBox lstEtats 
      Height          =   3375
      Left            =   1320
      TabIndex        =   10
      Top             =   3120
      Width           =   3435
   End
   Begin VB.CommandButton cmdSEND 
      Caption         =   "cmdSEND"
      Height          =   435
      Left            =   5040
      TabIndex        =   9
      Top             =   2700
      Width           =   1215
   End
   Begin VB.CommandButton cmdGET 
      Caption         =   "cmdGET"
      Height          =   435
      Left            =   5040
      TabIndex        =   8
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CommandButton cmdDIR 
      Caption         =   "cmdDIR"
      Height          =   435
      Left            =   5040
      TabIndex        =   7
      Top             =   1620
      Width           =   1215
   End
   Begin VB.CommandButton cmdDELETE 
      Caption         =   "cmdDELETE"
      Height          =   435
      Left            =   5040
      TabIndex        =   6
      Top             =   1080
      Width           =   1215
   End
   Begin VB.TextBox txtResponse 
      Height          =   1935
      Left            =   1320
      MultiLine       =   -1  'True
      TabIndex        =   4
      Top             =   1020
      Width           =   3435
   End
   Begin VB.TextBox txtRemotePath 
      Height          =   315
      Left            =   1320
      TabIndex        =   2
      Top             =   600
      Width           =   3435
   End
   Begin VB.TextBox txtURL 
      Height          =   315
      Left            =   1320
      TabIndex        =   0
      Text            =   "ftp://athos"
      Top             =   180
      Width           =   3435
   End
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   5640
      Top             =   180
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   327681
      Protocol        =   2
      RemotePort      =   21
      URL             =   "ftp://"
      RequestTimeout  =   10
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Etats"
      Height          =   195
      Left            =   300
      TabIndex        =   11
      Top             =   3120
      Width           =   360
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Réponse"
      Height          =   195
      Left            =   240
      TabIndex        =   5
      Top             =   1080
      Width           =   645
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "RemotePath"
      Height          =   195
      Left            =   240
      TabIndex        =   3
      Top             =   660
      Width           =   885
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "URL"
      Height          =   195
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   330
   End
End
Attribute VB_Name = "Label3Label3Label3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' Cet exemple décrit une série d'opérations FTP communes, à l'aide de la méthode Execute,
' et suppose que la feuille contient trois contrôles TextBox.
' Le premier, txtURL contient l'URL du serveur FTP.
' Le deuxième, txtRemotePath, contient les informations supplémentaires que nécessite la commande utilisée.
' Le troisième, txtResponse, contient la réponse du serveur.

Private Sub cmdChangeDirectory_Click()
  ' Remplace le dossier par le contenu
  ' de txtRemotePath.
  Inet1.Execute txtURL.Text, "CD " & txtRemotePath.Text
End Sub

Private Sub btnEfface_Click()
  lstEtats.Clear
End Sub

Private Sub cmdDELETE_Click()
  ' Supprime le dossier spécifié dans
  ' txtRemotePath.
  Inet1.Execute txtURL.Text, "DELETE " & txtRemotePath.Text
End Sub

Private Sub cmdDiconnect_Click()
  Inet1.Cancel
End Sub

Private Sub cmdDIR_Click()
  Inet1.Execute txtURL.Text, "DIR"
End Sub

Private Sub cmdGET_Click()
  Inet1.Execute txtURL.Text, "GET fichiers.htm C:\tmp\toto.htm"
End Sub

Private Sub cmdSEND_Click()
  Inet1.Execute txtURL.Text, "SEND C:\tmp\toto.htm Sent.txt"
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Inet1.Cancel
End Sub

Private Sub Inet1_StateChanged(ByVal State As Integer)
  ' Récupère la réponse du serveur à l'aide de
  ' la méthode GetChunk lorsque State = 12.

  Dim vtData As Variant ' Variable Data.
  Select Case State
    Case icNone: lstEtats.AddItem "icNone (0)"
    Case icResolvingHost: lstEtats.AddItem "icResolvingHost (1)"
    Case icHostResolved: lstEtats.AddItem "icHostResolved (2)"
    Case icConnecting: lstEtats.AddItem "icConnecting (3)"
    Case icConnected: lstEtats.AddItem "icConnected (4)"
    Case icRequesting: lstEtats.AddItem "icRequesting (5)"
    Case icRequestSent: lstEtats.AddItem "icRequestSent (6)"
    Case icReceivingResponse: lstEtats.AddItem "icReceivingResponse (7)"
    Case icResponseReceived: lstEtats.AddItem "icResponseReceived (8)"
    Case icDisconnecting: lstEtats.AddItem "icDisconnecting (9)"
    Case icDisconnected: lstEtats.AddItem "icDisconnected (10)"
  
    Case icError ' 11
      lstEtats.AddItem "icError (11)"
      ' En cas d'erreur, renvoie ResponseCode et ResponseInfo.
      vtData = Inet1.ResponseCode & ":" & Inet1.ResponseInfo
      
    Case icResponseCompleted ' 12
      lstEtats.AddItem "icResponseCompleted (12)"
      vtData = Inet1.GetChunk(1024)
      
    Case Else
      lstEtats.AddItem "? (" & State & ")"
  End Select
  txtResponse.Text = vtData
End Sub

