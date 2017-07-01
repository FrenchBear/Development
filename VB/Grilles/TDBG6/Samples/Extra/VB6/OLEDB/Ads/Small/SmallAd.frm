VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form Form1 
   Caption         =   "APEX True DBGrid Pro 6.0"
   ClientHeight    =   5895
   ClientLeft      =   1665
   ClientTop       =   1860
   ClientWidth     =   4620
   LinkTopic       =   "Form1"
   ScaleHeight     =   5895
   ScaleWidth      =   4620
   Begin TrueOleDBGrid60.TDBDropDown TDBDropDown1 
      Height          =   2160
      Left            =   2760
      OleObjectBlob   =   "SmallAd.frx":0000
      TabIndex        =   1
      Top             =   3600
      Width           =   1815
   End
   Begin TrueOleDBGrid60.TDBGrid TDBGrid1 
      Height          =   5640
      Left            =   120
      OleObjectBlob   =   "SmallAd.frx":51A1
      TabIndex        =   0
      Top             =   120
      Width           =   4395
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim x As New XArrayDB
Dim xd As New XArrayDB

Private Sub Form_Load()
    x.ReDim 0, 12, 0, 2
    xd.ReDim 0, 3, 0, 0
    
    x(0, 0) = "CANADA"
    x(1, 0) = "CANADA"
    x(2, 0) = "CANADA"
    x(3, 0) = "ENGLAND"
    x(4, 0) = "ENGLAND"
    x(5, 0) = "GERMANY"
    x(6, 0) = "GERMANY"
    x(7, 0) = "GERMANY"
    x(8, 0) = "NETHERLANDS"
    x(9, 0) = "NETHERLANDS"
    x(10, 0) = "USA"
    x(11, 0) = "USA"
    x(12, 0) = "USA"
    
    x(0, 1) = "Audio/Video"
    x(1, 1) = "Dining Room"
    x(2, 1) = "Home/Office"
    x(3, 1) = "Audio/Video"
    x(4, 1) = "Home/Office"
    x(5, 1) = "Audio/Video"
    x(6, 1) = "Bar/Grill"
    x(7, 1) = "Dining Room"
    x(8, 1) = "Home/Office"
    x(9, 1) = "Audio/Video"
    x(10, 1) = "Dining Room"
    x(11, 1) = "Home/Office"
    x(12, 1) = "Bar/Grill"

    x(0, 2) = 0
    x(1, 2) = 1
    x(2, 2) = 1
    x(3, 2) = 0
    x(4, 2) = 1
    x(5, 2) = 0
    x(6, 2) = 1
    x(7, 2) = 0
    x(8, 2) = 1
    x(9, 2) = 1
    x(10, 2) = 0
    x(11, 2) = 1
    x(12, 2) = 1

    xd(0, 0) = "Home/Office"
    xd(1, 0) = "Dining Room"
    xd(2, 0) = "Family/Living Room"
    xd(3, 0) = "Audio/Video"

    Set TDBDropDown1.Array = xd
    Set TDBGrid1.Array = x
    

End Sub

