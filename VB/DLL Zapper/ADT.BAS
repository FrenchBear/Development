Attribute VB_Name = "ADT"
Option Explicit
'Maintain all the sorted file lists
'This form is meant to abstract the intricacies of the
'data structures from the rest of the program in teh form of
'an Abstract Data Type.  This allows for the data structure to be
'changed without affecting the rest of the program

'See the sortfiles subroutine for an explanation of the
'working of the data structure

Dim Files()  As FileInfo    ' Store the file info
Dim FileCount  As Integer   ' How many files are in the array
Dim Idx() As Integer        ' File index (for sorting)

Const FILECHUNK = 10        'Size of chunk in which to allocate space

Sub AddFile(Path$, Filename$)
'Add a file to the structure

    'Allocate more space if necessary
    If (FileCount Mod FILECHUNK) = 0 Then
        ReDim Preserve Files(FileCount + FILECHUNK)
    End If

    FileCount = FileCount + 1
    Files(FileCount).Path = Path$
    Files(FileCount).File = Filename$
End Sub

Sub DisplayFiles(L As Control)
'List the files in the array
Dim i As Integer

    L.Clear
    For i = 1 To FileCount
        L.AddItem Files(Idx(i)).File & Chr$(9) & Files(Idx(i)).Path & Chr$(9) & Format$(Files(Idx(i)).Size, "###,###,###") & Chr$(9) & Format$(Files(Idx(i)).DateTime, "mm/dd/yy") & Chr$(9) & Files(Idx(i)).Version & Chr$(9) & Format$(Files(Idx(i)).DateTime, "hh:mm:ss")
        L.ItemData(L.NewIndex) = i
    Next i
    
End Sub

Function FilesFound() As Integer
'Informs the caller how many files are in the structure
    FilesFound = FileCount
End Function

Sub GetAllFileInfo()
' Get file date, size, and version for each file
Dim i As Integer, File As String

'On Error GoTo errGetAllFileInfo
On Error Resume Next

    For i = 1 To FileCount
        'Only work out the full path etc once
        File = Files(Idx(i)).Path & "\" & Files(Idx(i)).File
        Files(Idx(i)).DateTime = FileDateTime(File)
        Files(Idx(i)).Size = FileLen(File)
        'Only get version info for these kinds of files
        If InStr("DLL VBX EXE VXD", Right$(File, 3)) > 0 Then
            Files(Idx(i)).Version = GetVersion(File)
        Else
            Files(Idx(i)).Version = "(n/a)"
        End If
    Next i
    Exit Sub

errGetAllFileInfo:
    ErrorOccured = True
    MsgBox "Error getting file info"
    Exit Sub

End Sub

Function GetFileName(i%) As String
'Returns a a file name based on its index in Idx
    GetFileName = Files(Idx(i%)).Path & "\" & Files(Idx(i%)).File
End Function

Sub QuickSort(Low As Integer, High As Integer)
'A VB implementation of the QuickSort algorithm
'Sorts a list by recursively splitting it up into smaller
'and smaller pieces and then sorting those pieces
'This code is an adaptation of a sample in QuickBASIC 4.5
Dim Part As String, RandIndex As Integer
Dim i  As Integer, j As Integer

' ============================== QuickSort ===================================
'   QuickSort works by picking a random "pivot" element in Files, then
'   moving every element that is bigger to one side of the pivot, and every
'   element that is smaller to the other side.  QuickSort is then called
'   recursively with the two subdivisions created by the pivot.  Once the
'   number of elements in a subdivision reaches two, the recursive calls end
'   and the array is sorted.
' ============================================================================

    If Low < High Then

      ' Only two elements in this subdivision; swap them if they are out of
      ' order, then end recursive calls:
        If High - Low = 1 Then
            If Files(Idx(Low)).File > Files(Idx(High)).File Then
                Call Swap(Idx(Low), Idx(High))
            End If
        Else
        
         ' Pick a pivot elment at random, then move it to the end:
            RandIndex = Int((High - Low + 1) * Rnd + 1)
            Swap Idx(High), Idx(RandIndex)
            Call Swap(Idx(High), Idx(RandIndex))
            Part = Files(Idx(High)).File
            Do
    
                ' Move in from both sides towards the pivot element:
                i = Low
                j = High
                Do While (i < j) And (Files(Idx(i)).File <= Part)
                    i = i + 1
                Loop
                Do While (j > i) And (Files(Idx(j)).File >= Part)
                    j = j - 1
                Loop
    
                ' If we haven't reached the pivot element, it means that two
                ' elements on either side are out of order, so swap them:
                If i < j Then
                    Swap Idx(i), Idx(j)
                End If
            Loop While i < j

         ' Move the pivot element back to its proper place in the array:
            Swap Idx(i), Idx(High)
         
         ' Recursively call the QuickSort procedure (pass the smaller
         ' subdivision first to use less stack space):
            If (i - Low) < (High - i) Then
                QuickSort Low, i - 1
                QuickSort i + 1, High
            Else
                QuickSort i + 1, High
                QuickSort Low, i - 1
            End If
        End If
    End If
End Sub

Sub ResetFileList()
'Clear the data structure
    FileCount = 0
    Erase Files
End Sub

Sub SortFiles()
Dim i As Integer, j As Integer

    'Initialize the index
    ReDim Idx(FileCount)
    For i = 1 To FileCount
        Idx(i) = i
    Next i
    
    'Start the quicksort
    Call QuickSort(1, FileCount)

'How the data structure works

'All data about files is captured in the array Files()
'However, sorting this array would be very time-consuming, because of the
'large chunks of memory which would have to be moved around for each
'swap operation.  So instead, and index array is set up, pointing to
'the elements in the Files() structure.  Then, when a swap is
'necessary during the sort, the elements of the index are swapped.
'The index elements are integers, which can be swapped MUCH quicker

'EXAMPLE

'   Idx     Files
'1    3       D
'2    4       C
'3    2       A
'4    1       B

'So Files(Idx(1)) translates to Files(3).  Files(3) is A - the first
'item in the list

    
End Sub

Sub StripUnique()
'Remove unique files
'This is done by taking the sorted array and looking for
'sequences of identical file names
Dim i As Integer, j As Integer, Idx2() As Integer, Flag As Integer

    If FileCount > 1 Then
        
        ReDim Idx2(FileCount) ' Create a new index
        
        j = 1
        i = 2
        Flag = False
          
        For i = 2 To FileCount
            ' Is the file name the same as the previous one ?
            If Files(Idx(i)).File = Files(Idx(i - 1)).File Then
                If Not Flag Then         'There is a special case for adding the first item
                    Idx2(j) = Idx(i - 1) 'in the sequence to the new index.  Flag indicates
                    Flag = True          'that the first item in a sequence has been added
                    j = j + 1
                End If
                Idx2(j) = Idx(i)    'Add the index of the item to the new index
                j = j + 1
            ElseIf Flag Then
                Flag = False
            End If
            
        Next i
        
        ReDim Idx(j - 1)        'Rebuild the original array to only include the duplicated items
        For i = 1 To j - 1
            Idx(i) = Idx2(i)
        Next i
        FileCount = j - 1       'Reduce the count of the number of files found
   End If
End Sub

Sub Swap(X As Integer, Y As Integer)
'Swap two integers
Dim T As Integer

    T = X
    X = Y
    Y = T

End Sub

