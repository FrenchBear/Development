' QuickFileFilter, FileNameAndSize class
' Very simple container for file name and size
'
' 2016-12-12    PV  v2 with FolderSets
' 2017-01-04    PV  v3, Visual Basic

Imports System.Collections.Generic
Imports System.Linq
Imports System.Text
Imports System.Threading.Tasks

Class FileNameAndSize
    Public Property Name As String
    Public Property Size As Long


    ' Better display in ListView, with thousands separators
    Public ReadOnly Property SizeString() As String
        Get
            Return String.Format("{0:N0}", Size)
        End Get
    End Property
End Class
