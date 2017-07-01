VERSION 5.00
Begin VB.Form frmTestDictionary 
   Caption         =   "Test dictionary"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1740
      TabIndex        =   0
      Top             =   1380
      Width           =   1215
   End
End
Attribute VB_Name = "frmTestDictionary"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
  Dim dict As Dictionary
  Dim keyArray, itemArray, element
  
  dict.
  
  Set dict = New Dictionary
  With dict
     'set compare mode
     .CompareMode = BinaryCompare
     'add item using named arguments
     .Add Key:="mike", Item:=22
     'add item without named arguments
     .Add "joe", 33
  
     'case sensitivity and Exists method
     'does MIKE exist?
     Print "MIKE exists = " & .Exists("MIKE")
     'change key value
     .Key("mike") = "MIKE"
     'does MIKE exist?
     Print "MIKE exists = " & .Exists("MIKE")
  
     'extract keys into variant array
     Print "Array of Keys"
     keyArray = .Keys
     For Each element In keyArray
        Print element
     Next
  
     'extract items into variant array
     Print "Array of Items"
     itemArray = .Items
     For Each element In itemArray
        Print element
     Next
  
     'empty the dictionary
     .RemoveAll
     Print .Count & " Items in Dictionary"
  
  End With
  Set dict = Nothing
End Sub
