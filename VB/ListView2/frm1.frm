VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form Form1 
   Caption         =   "Checking Subcontracted Invoices"
   ClientHeight    =   2310
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8910
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   2310
   ScaleWidth      =   8910
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ListView lvCheck 
      Height          =   2175
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   8775
      _ExtentX        =   15478
      _ExtentY        =   3836
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   6
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Ref"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Client"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Sample"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Date"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "Sub $"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Text            =   "Sell $"
         Object.Width           =   2540
      EndProperty
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    Randomize 4
    
    AddPro "CHICKEN WINGS", "Big Client & Co", "851-2004-00078512", "15/08/2004", 100 * Rnd + 10
    AddPro "SWEET PEAS", "Other Big Client", "851-2004-00078523", "17/08/2004", 100 * Rnd + 10
    AddPro "MASHED POTATOES", "PotatoCompany", "851-2004-00078588", "19/08/2004", 100 * Rnd + 10
    AddPro "HAMBURGER", "FastBoof", "851-2004-00078591", "19/08/2004", 100 * Rnd + 10
    AddPro "CHICKEN WINGS", "Big Client & Co", "851-2004-00078602", "20/08/2004", 100 * Rnd + 10
    AddPro "CHICKEN WINGS", "Big Client & Co", "851-2004-00078611", "23/08/2004", 100 * Rnd + 10
End Sub

Sub AddPro(sRef As String, sCust As String, sSample As String, sDate As String, fSub As Single)
    Dim fSell As Single
    fSell = fSub + 50 * Rnd - 10
    
    Dim x As ListItem
    Set x = lvCheck.ListItems.Add
    x.Text = sRef
    x.SubItems(1) = sCust
    x.SubItems(2) = sSample
    x.SubItems(3) = sDate
    x.SubItems(4) = Format(fSub, "Currency")
    x.SubItems(5) = Format(fSell, "currency")
    Dim i As Integer
    If fSell < fSub Then
        x.ForeColor = vbRed
        x.Bold = True
        For i = 1 To 5
            x.ListSubItems(i).Bold = True
            x.ListSubItems(i).ForeColor = vbRed
        Next
    ElseIf fSell < 1.34 * fSub Then
        x.ForeColor = vbRed
        For i = 1 To 5
            x.ListSubItems(i).ForeColor = vbRed
        Next
    End If
        
    
End Sub
