VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{38911DA0-E448-11D0-84A3-00DD01104159}#1.1#0"; "COMCT332.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5175
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   6120
   LinkTopic       =   "Form1"
   ScaleHeight     =   5175
   ScaleWidth      =   6120
   StartUpPosition =   3  'Windows Default
   Begin ComCtl3.CoolBar CoolBar1 
      Align           =   1  'Align Top
      Height          =   450
      Left            =   0
      TabIndex        =   9
      Top             =   0
      Width           =   6120
      _ExtentX        =   10795
      _ExtentY        =   794
      BandCount       =   1
      _CBWidth        =   6120
      _CBHeight       =   450
      _Version        =   "6.0.8169"
      Child1          =   "Toolbar1"
      MinHeight1      =   390
      Width1          =   2280
      NewRow1         =   0   'False
      Begin MSComctlLib.Toolbar Toolbar1 
         Height          =   390
         Left            =   30
         TabIndex        =   10
         Top             =   30
         Width           =   6000
         _ExtentX        =   10583
         _ExtentY        =   688
         ButtonWidth     =   609
         ImageList       =   "ImageList1"
         DisabledImageList=   "ImageList1"
         HotImageList    =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   3
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Style           =   3
            EndProperty
            BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Key             =   "Q"
               ImageIndex      =   1
            EndProperty
            BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               ImageIndex      =   2
               Style           =   5
               BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
                  NumButtonMenus  =   2
                  BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                     Key             =   "Z"
                     Object.Tag             =   "Z"
                     Text            =   "Z"
                  EndProperty
                  BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                     Key             =   "X"
                     Object.Tag             =   "X"
                     Text            =   "X"
                  EndProperty
               EndProperty
            EndProperty
         EndProperty
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   8
      Top             =   4800
      Width           =   6120
      _ExtentX        =   10795
      _ExtentY        =   661
      Style           =   1
      SimpleText      =   "Barre d'état"
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.TextBox Text1 
      Height          =   345
      Left            =   4140
      TabIndex        =   7
      Text            =   "Text1"
      Top             =   540
      Width           =   675
   End
   Begin MSComCtl2.UpDown UpDown1 
      Height          =   495
      Left            =   4695
      TabIndex        =   6
      Top             =   2280
      Width           =   240
      _ExtentX        =   423
      _ExtentY        =   873
      _Version        =   393216
      AutoBuddy       =   -1  'True
      BuddyControl    =   "Slider1"
      BuddyDispid     =   196615
      OrigLeft        =   4800
      OrigTop         =   60
      OrigRight       =   5040
      OrigBottom      =   375
      SyncBuddy       =   -1  'True
      BuddyProperty   =   11
      Enabled         =   -1  'True
   End
   Begin MSComctlLib.Slider Slider1 
      Height          =   495
      Left            =   2940
      TabIndex        =   5
      Top             =   2280
      Width           =   1755
      _ExtentX        =   3096
      _ExtentY        =   873
      _Version        =   393216
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   5340
      Top             =   720
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   6
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmCommonControls.frx":0000
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmCommonControls.frx":0454
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmCommonControls.frx":08A8
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmCommonControls.frx":0CFC
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmCommonControls.frx":1150
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmCommonControls.frx":15A4
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageCombo ImageCombo1 
      Height          =   330
      Left            =   2820
      TabIndex        =   4
      Top             =   1020
      Width           =   2355
      _ExtentX        =   4154
      _ExtentY        =   582
      _Version        =   393216
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Text            =   "ImageCombo1"
      ImageList       =   "ImageList1"
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   1275
      Left            =   60
      TabIndex        =   3
      Top             =   3000
      Width           =   5955
      _ExtentX        =   10504
      _ExtentY        =   2249
      SortKey         =   1
      View            =   3
      LabelEdit       =   1
      Sorted          =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      AllowReorder    =   -1  'True
      Checkboxes      =   -1  'True
      FlatScrollBar   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      HotTracking     =   -1  'True
      HoverSelection  =   -1  'True
      _Version        =   393217
      SmallIcons      =   "ImageList1"
      ColHdrIcons     =   "ImageList1"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Un"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Deux"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Trois"
         Object.Width           =   2540
      EndProperty
   End
   Begin MSComCtl2.FlatScrollBar FlatScrollBar1 
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   4380
      Width           =   5835
      _ExtentX        =   10292
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   65538
      Arrows          =   65537
      Orientation     =   8323073
   End
   Begin MSComCtl2.DTPicker DTPicker1 
      Height          =   315
      Left            =   2820
      TabIndex        =   1
      Top             =   540
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   556
      _Version        =   393216
      Format          =   24444929
      CurrentDate     =   36082
   End
   Begin MSComCtl2.MonthView MonthView1 
      Height          =   2370
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   2595
      _ExtentX        =   4577
      _ExtentY        =   4180
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      Appearance      =   1
      StartOfWeek     =   24444930
      CurrentDate     =   36082
   End
   Begin VB.Menu mnuFichier 
      Caption         =   "&Fichier"
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Add(sNom As String, iIcône As Integer)
  Dim X As ComboItem
  Set X = ImageCombo1.ComboItems.Add
  X.SelImage = 3 + iIcône
  X.Image = iIcône
  X.Text = sNom
  X.Indentation = 3 - iIcône
  
  Dim Y As ListItem
  Set Y = ListView1.ListItems.Add
  Y.Text = sNom
  Y.SmallIcon = iIcône
  Y.SubItems(1) = Rnd
  Y.SubItems(2) = Rnd
End Sub

Private Sub cmdQuitter_Click()
  End
End Sub

Private Sub Form_Load()
  Add "Vert", 3
  Add "Orange", 2
  Add "Rouge", 1
End Sub

Private Sub ListView1_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
  If ListView1.Sorted And ListView1.SortKey = ColumnHeader.Index - 1 Then
    ListView1.SortOrder = IIf(ListView1.SortOrder = lvwAscending, lvwDescending, lvwAscending)
    ColumnHeader.Icon = IIf(ListView1.SortOrder = lvwAscending, 4, 6)
  Else
    ListView1.SortKey = ColumnHeader.Index - 1
    ListView1.Sorted = True
    Dim c As MSComctlLib.ColumnHeader
    For Each c In ListView1.ColumnHeaders
      c.Icon = vbEmpty
    Next
    ColumnHeader.Icon = 4
  End If
End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
  Select Case Button.Key
    Case "Q": cmdQuitter_Click
  End Select
End Sub
