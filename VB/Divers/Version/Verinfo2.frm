VERSION 5.00
Begin VB.Form Form2 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "File Version Info"
   ClientHeight    =   3345
   ClientLeft      =   6630
   ClientTop       =   2175
   ClientWidth     =   4500
   ForeColor       =   &H80000008&
   LinkMode        =   1  'Source
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   13.937
   ScaleMode       =   4  'Character
   ScaleWidth      =   37.5
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   1680
      TabIndex        =   0
      Top             =   2880
      Width           =   1452
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
   Form2.Hide
End Sub

Private Sub Command1_GotFocus()
  Form_Paint
End Sub

Private Sub Form_Paint()
   Form2.CurrentX = 2
   Form2.CurrentY = 1
   Form2.Print "FileName:"
   Form2.CurrentX = 2
   Form2.Print "Directory:"
   Form2.CurrentX = 2
   Form2.Print "File Version:"
   Form2.CurrentX = 2
   Form2.Print "Product Version:"
   Form2.CurrentX = 2
   Form2.Print "File Flags:"
   Form2.CurrentX = 2
   Form2.Print "File OS:"
   Form2.CurrentX = 2
   Form2.Print "File Type:"
   Form2.CurrentX = 2
   Form2.Print "File Sub-type:"

   Form2.CurrentX = 18
   Form2.CurrentY = 1
   Form2.Print Filename
   Form2.CurrentX = 18
   Form2.Print Directory
   Form2.CurrentX = 18
   Form2.Print FileVer
   Form2.CurrentX = 18
   Form2.Print ProdVer
   Form2.CurrentX = 18
   Form2.Print FileFlags
   Form2.CurrentX = 18
   Form2.Print FileOS
   Form2.CurrentX = 18
   Form2.Print FileType
   Form2.CurrentX = 18
   Form2.Print FileSubType
End Sub
