VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Object = "{CF7901E8-F65A-11D3-AA42-000629C16DEA}#1.4#0"; "MDIActiveX6.ocx"
Begin VB.Form Form3 
   Caption         =   "Controls..."
   ClientHeight    =   4380
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   7530
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form3"
   ScaleHeight     =   4380
   ScaleWidth      =   7530
   StartUpPosition =   3  'Windows Default
   Begin MDIinActiveX6.MDIActiveX MDIActiveX1 
      Left            =   7020
      Top             =   1380
      _ExtentX        =   847
      _ExtentY        =   794
      BorderStyle     =   0
   End
   Begin MSComctlLib.ImageList IlsIcons 
      Left            =   6960
      Top             =   720
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   9
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form3.frx":0000
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form3.frx":0454
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form3.frx":08A8
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form3.frx":0CFC
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form3.frx":1150
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form3.frx":15A4
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form3.frx":19F8
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form3.frx":1E4C
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form3.frx":22A0
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   4215
      Left            =   3240
      TabIndex        =   1
      Top             =   120
      Width           =   4095
      _ExtentX        =   7223
      _ExtentY        =   7435
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin MSComctlLib.TreeView TreeView1 
      Height          =   4215
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2895
      _ExtentX        =   5106
      _ExtentY        =   7435
      _Version        =   393217
      LineStyle       =   1
      Style           =   7
      Appearance      =   1
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  Me.ListView1.SmallIcons = Me.IlsIcons
  Me.ListView1.Icons = Me.IlsIcons
  Me.ListView1.ListItems.Add , "one", "My House", 1, 1
  Me.ListView1.ListItems.Add , "two", "Your House", 2, 2
  Me.ListView1.ListItems.Add , "three", "My Dog", 3, 3
  Me.ListView1.ListItems.Add , "four", "My Cat", 4, 4
  Me.ListView1.ListItems.Add , "five", "Your Bird", 5, 5
  Me.ListView1.ListItems.Add , "six", "Visual Basic", 6, 6
  Me.ListView1.ListItems.Add , "seven", "MDIActiveX", 7, 7
  
  Dim n As Nodes
  Me.TreeView1.ImageList = Me.IlsIcons
  Set Node = Me.TreeView1.Nodes.Add(, , "one", "My House", 1, 1)
  Me.TreeView1.Nodes.Add Node, tvwChild, "Three", "My Dog", 3, 3
  Me.TreeView1.Nodes.Add Node, tvwChild, "four", "My Cat", 4, 4
  Set Node = Me.TreeView1.Nodes.Add(, , "two", "Your House", 2, 2)
  Me.TreeView1.Nodes.Add Node, tvwChild, "five", "Your Bird", 5, 5
  Set Node = Me.TreeView1.Nodes.Add(, , "six", "Visual Basic", 6, 6)
  Set Node = Me.TreeView1.Nodes.Add(, , "seven", "MDIActiveX", 7, 7)


End Sub

