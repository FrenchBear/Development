' QuickFileFilter, FolderSet class
' A simple container to store FolderSet root and DateTime of last scan
'
' 2016-12-12    PV  v2 with FolderSets
' 2017-01-04    PV  v3, Visual Basic

Imports System.ComponentModel


Class FolderSet
    Implements INotifyPropertyChanged

    ' INotifyPropertyChanged interface
    Private Event PropertyChanged As PropertyChangedEventHandler Implements INotifyPropertyChanged.PropertyChanged

    Public Sub NotifyPropertyChanged(propertyName As String)
        RaiseEvent PropertyChanged(Me, New PropertyChangedEventArgs(propertyName))
    End Sub


    ' Don't need to raise PropertyChanged event since code never update these properties,
    ' so a simplified auto-implemented property is good enough
    Public Property Root As String

    Public Property CacheFilename As String


    Private m_ScanDate As DateTime
    Public Property ScanDate() As DateTime
        Get
            Return m_ScanDate
        End Get
        Set
            If m_ScanDate <> Value Then
                m_ScanDate = Value
                NotifyPropertyChanged("ScanDate")
            End If
        End Set
    End Property


    Public Files As List(Of FileNameAndSize)


    ' Helper property for binding
    Public ReadOnly Property FilesCount() As Integer
        Get
            If Files Is Nothing Then Return 0
            Return Files.Count
        End Get
    End Property

End Class
