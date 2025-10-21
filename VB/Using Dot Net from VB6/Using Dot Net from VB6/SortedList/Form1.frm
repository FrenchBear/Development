VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4680
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4215
   LinkTopic       =   "Form1"
   ScaleHeight     =   4680
   ScaleWidth      =   4215
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox List1 
      Height          =   3765
      Left            =   120
      TabIndex        =   1
      Top             =   720
      Width           =   3975
   End
   Begin VB.CommandButton cmdGetFiles 
      Caption         =   "Get Files"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdGetFiles_Click()
    
    ' Use the FileSystemObject to get access to the
    ' desired folder
    Dim fso As Scripting.FileSystemObject
    Set fso = New Scripting.FileSystemObject
    Dim f As Scripting.Folder
    Set f = fso.GetFolder("c:\windows\system32")
    
    ' Create an instance of a SortedList to store
    ' the file names in sorted order
    Dim sa As mscorlib.SortedList
    Set sa = New SortedList
    
    ' Loop through all the files and add them
    ' to the SortedList
    Dim fi As Scripting.File
    For Each fi In f.Files
        sa.Add fi.Name, fi.Size
    Next
    
    ' Loop through the list and add the items to
    ' the ListBox, sorted by the key (the file
    ' name, in this case
    Dim i As Integer
    For i = 0 To sa.Count - 1
        List1.AddItem (sa.getkey(i))
    Next
End Sub
