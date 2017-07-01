' QuickFileFilter,  WindowsFileExplorerComparer Class
' Sorts string in a similar way to Windows File Explorer
' From http://stackoverflow.com/questions/3099581/sorting-an-array-of-folder-names-like-windows-explorer-numerically-and-alphabet
'
' 2016-09-30    PV
' 2016-12-11    PV  Declaration of StrCmpLogicalW moved to NativeMethods static class for compliance with MS code analysis recommendations
' 2017-01-04    PV  v3, Visual Basic

Friend Class WindowsFileExplorerComparer
    Implements IComparer(Of String)
    Private Function Compare(x As String, y As String) As Integer Implements IComparer(Of String).Compare
        Return StrCmpLogicalW(x, y)
    End Function
End Class
