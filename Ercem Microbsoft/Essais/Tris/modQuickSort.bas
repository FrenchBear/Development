Attribute VB_Name = "Module1"
Option Explicit


' ============================ QuickSort ============================
' QuickSort works by picking a random "pivot" element in SortArray,
' then moving every element that is bigger to one side of the pivot,
' and every element that is smaller to the other side. QuickSort is
' then called recursively with the two subdivisions created by the
' pivot. Once the number of elements in a subdivision reaches two,
' the recursive calls end and the array is sorted.
' ===================================================================
'
Public Sub QuickSort(SortArray() As String, ByVal Low As Long, ByVal High As Long)
   Dim i As Long, J As Long, RandIndex As Long, Partition As String
   Dim tmp As String
   
   If Low < High Then
      ' Only two elements in this subdivision; swap them if they are
      ' out of order, then end recursive calls:
      If High - Low = 1 Then
         If UCase(SortArray(Low)) > UCase(SortArray(High)) Then tmp = SortArray(Low): SortArray(Low) = SortArray(High): SortArray(High) = tmp
      Else
         ' Pick a pivot element at random, then move it to the end:
         RandIndex = Rnd() * (High - Low) + Low ' RandInt%(Low, High)
         tmp = SortArray(High): SortArray(High) = SortArray(RandIndex): SortArray(RandIndex) = tmp
         Partition = UCase(SortArray(High))
         Do
            ' Move in from both sides towards the pivot element:
            i = Low: J = High
            Do While (i < J) And (UCase(SortArray(i)) <= Partition)
               i = i + 1
            Loop
            Do While (J > i) And (UCase(SortArray(J)) >= Partition)
               J = J - 1
            Loop

            ' If we haven't reached the pivot element it means that 2
            ' elements on either side are out of order, so swap them:
            If i < J Then
               tmp = SortArray(i): SortArray(i) = SortArray(J): SortArray(J) = tmp
            End If
         Loop While i < J

         ' Move the pivot element to its proper place in the array:
         tmp = SortArray(i): SortArray(i) = SortArray(High): SortArray(High) = tmp

         ' Recursively call the QuickSort procedure (pass the
         ' smaller subdivision first to use less stack space):
         If (i - Low) < (High - i) Then
            QuickSort SortArray, Low, i - 1
            QuickSort SortArray, i + 1, High
         Else
            QuickSort SortArray, i + 1, High
            QuickSort SortArray, Low, i - 1
         End If
      End If
   End If
End Sub

