VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7875
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10050
   LinkTopic       =   "Form1"
   ScaleHeight     =   7875
   ScaleWidth      =   10050
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Download"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   7095
      Left            =   120
      Stretch         =   -1  'True
      Top             =   600
      Width           =   9735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Dim webDownload As System.WebClient
    Set webDownload = New System.WebClient
    webDownload.downloadFile "http://www.ssec.wisc.edu/data/west/latest_westir.jpg", App.Path & "\latest_westir.jpg"
    Set Image1.Picture = LoadPicture(App.Path & "\latest_westir.jpg")
End Sub

