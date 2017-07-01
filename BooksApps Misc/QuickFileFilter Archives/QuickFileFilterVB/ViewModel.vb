' QuickFileFilter, ViewModel class
' ViewModel
'
' 2016-09-26    PV
' 2016-09-30    PV  CopyFolderPathCommand and IsolatedStorage cache
' 2016-10-20    PV  Whole Word option
' 2016-12-12    PV  v2 with FolderSets
' 2016-12-29    PV  v2.2 Show total size of a multiple selection of files; Targets .Net 4.6.2 for Very Long Paths
' 2017-01-01    PV  v2.5.1 Complete filter parsing moved to FilterPredicateBuilder class
' 2017-01-02    PV  v2.5.2 Validation of Folder and Regex
' 2017-01-04    PV  v3, Visual Basic

Imports System.Collections.ObjectModel
Imports System.ComponentModel
Imports System.IO
Imports System.Text
Imports System.Text.RegularExpressions

Class ViewModel
    Implements INotifyPropertyChanged
    Implements IDataErrorInfo


    ' Access to Model and Mindow
    Private model As Model
    Private window As MainWindow


    ' INotifyPropertyChanged interface
    Private Event PropertyChanged As PropertyChangedEventHandler Implements INotifyPropertyChanged.PropertyChanged

    Public Sub NotifyPropertyChanged(propertyName As String)
        RaiseEvent PropertyChanged(Me, New PropertyChangedEventArgs(propertyName))
    End Sub


    ' Commands public interface
    Public Property SearchCommand As ICommand
    Public Property ClearCommand As ICommand
    Public Property CopyFolderPathCommand As ICommand
    Public Property CopyFilePathCommand As ICommand
    Public Property ShowFolderCommand As ICommand
    Public Property ShowFileCommand As ICommand
    Public Property RemoveFolderSetCommand As ICommand


    ' ViewModel Constructor
    Public Sub New(m As Model, w As MainWindow)
        model = m
        window = w

        ' Binding commands with behavior
        SearchCommand = New RelayCommand(Of Object)(AddressOf SearchExecute, AddressOf CanSearch)
        ClearCommand = New RelayCommand(Of Object)(AddressOf ClearExecute, AddressOf CanClear)
        CopyFolderPathCommand = New RelayCommand(Of Object)(AddressOf CopyFolderPathExecute, AddressOf CanCopyFolderPath)
        CopyFilePathCommand = New RelayCommand(Of Object)(AddressOf CopyFilePathExecute, AddressOf CanCopyFilePath)
        ShowFolderCommand = New RelayCommand(Of Object)(AddressOf ShowFolderExecute, AddressOf CanShowFolder)
        ShowFileCommand = New RelayCommand(Of Object)(AddressOf ShowFileExecute, AddressOf CanShowFile)
        RemoveFolderSetCommand = New RelayCommand(Of Object)(AddressOf RemoveFolderSet, AddressOf CanRemoveFolderSet)
    End Sub



    ' Binding variables
    Private m_filter As String
    Public Property Filter() As String
        Get
            Return m_filter
        End Get
        Set
            m_filter = Value
            NotifyPropertyChanged("Filter")
            window.SearchButton.IsDefault = False
            ApplyFilter()
        End Set
    End Property


    Private Sub ApplyFilter()
        Dim view As ListCollectionView = TryCast(CollectionViewSource.GetDefaultView(m_files), ListCollectionView)

        If m_filter Is Nothing OrElse m_filter.Length = 0 Then
            view.Filter = Nothing
        Else
            ' Create a new instance of FilterPredicateBuilder that prepares suitable predicate
            Dim fpb = New FilterPredicateBuilder(m_filter, AccentSensitive, CaseSensitive, RegExp, WholeWords)
            view.Filter = AddressOf fpb.GetFilter
        End If

        If view.Count = m_files.Count Then
            NumFiles = view.Count.ToString
        Else
            NumFiles = view.Count.ToString & " / " & Files.Count.ToString
        End If
    End Sub


    Private m_folder As String = ""
    Public Property Folder() As String
        Get
            Return m_folder
        End Get
        Set(value As String)
            m_folder = Value
            NotifyPropertyChanged("Folder")
            window.SearchButton.IsDefault = True
        End Set
    End Property


    ' Used to disable most interface elements when app if busy enumerating files
    Private m_idle As Boolean = True
    Public Property Idle() As Boolean
        Get
            Return m_idle
        End Get
        Set(value As Boolean)
            If m_idle <> Value Then
                m_idle = Value
                NotifyPropertyChanged("Idle")
            End If
        End Set
    End Property


    ' Current full list of files
    Private m_files As New ObservableCollection(Of FileNameAndSize)()
    Public ReadOnly Property Files() As ObservableCollection(Of FileNameAndSize)
        Get
            Return m_files
        End Get
    End Property


    ' Called by Model, refresh list of files
    Public Sub SetFiles(fnsList As List(Of FileNameAndSize))
        m_files.Clear()
        If fnsList IsNot Nothing Then
            For Each fns As FileNameAndSize In fnsList
                m_files.Add(fns)
            Next
        End If
        NotifyPropertyChanged("Files")
        ' Reapply filter after refreshing the list
        ApplyFilter()
    End Sub


    ' FolderSets are actually managed in Model class
    Public ReadOnly Property FolderSets() As ObservableCollection(Of FolderSet)
        Get
            Return model.FolderSets
        End Get
    End Property


    ' Currently selected FolderSet
    Private m_selectedFolderSet As FolderSet
    Public Property SelectedFolderSet() As FolderSet
        Get
            Return m_selectedFolderSet
        End Get
        Set(value As FolderSet)
            m_selectedFolderSet = Value
            NotifyPropertyChanged("SelectedFolderSet")
            If m_selectedFolderSet Is Nothing Then
                Folder = ""
                SetFiles(Nothing)
            Else
                model.LoadFiles(Value)

                Folder = m_selectedFolderSet.Root
                SetFiles(m_selectedFolderSet.Files)
                window.FilterTextBox.Focus()
                model.MemorizeSelectedFolderSet(m_selectedFolderSet)
            End If
        End Set
    End Property


    Private _NumFiles As String
    Public Property NumFiles() As String
        Get
            Return _NumFiles
        End Get
        Set(value As String)
            If _NumFiles <> Value Then
                _NumFiles = Value
                NotifyPropertyChanged("NumFiles")
            End If
        End Set
    End Property


    Private _SelectionSize As String
    Public Property SelectionSize() As String
        Get
            Return _SelectionSize
        End Get
        Set(value As String)
            If _SelectionSize <> Value Then
                _SelectionSize = Value
                NotifyPropertyChanged("SelectionSize")
            End If
        End Set
    End Property



    Private _CaseSensitive As Boolean
    Public Property CaseSensitive() As Boolean
        Get
            Return _CaseSensitive
        End Get
        Set(value As Boolean)
            If _CaseSensitive <> Value Then
                _CaseSensitive = Value
                NotifyPropertyChanged("CaseSensitive")
                ApplyFilter()
            End If
        End Set
    End Property

    Private _AccentSensitive As Boolean
    Public Property AccentSensitive() As Boolean
        Get
            Return _AccentSensitive
        End Get
        Set(value As Boolean)
            If _AccentSensitive <> Value Then
                _AccentSensitive = Value
                NotifyPropertyChanged("AccentSensitive")
                ApplyFilter()
            End If
        End Set
    End Property

    Private _RegExp As Boolean
    Public Property RegExp() As Boolean
        Get
            Return _RegExp
        End Get
        Set(value As Boolean)
            If _RegExp <> Value Then
                _RegExp = Value
                NotifyPropertyChanged("RegExp")
                NotifyPropertyChanged("IsWholeWordsEnabled")
                ApplyFilter()
            End If
        End Set
    End Property

    Public ReadOnly Property IsRegExEnabled() As Boolean
        Get
            Return Not WholeWords
        End Get
    End Property


    Private _WholeWords As Boolean
    Public Property WholeWords() As Boolean
        Get
            Return _WholeWords
        End Get
        Set(value As Boolean)
            If _WholeWords <> Value Then
                _WholeWords = Value
                NotifyPropertyChanged("WholeWords")
                NotifyPropertyChanged("IsRegExEnabled")
                ApplyFilter()
            End If
        End Set
    End Property

    Public ReadOnly Property IsWholeWordsEnabled() As Boolean
        Get
            Return Not RegExp
        End Get
    End Property


    Private _SelectedFile As FileNameAndSize
    Public Property SelectedFile() As FileNameAndSize
        Get
            Return _SelectedFile
        End Get
        Set(value As FileNameAndSize)
            If _SelectedFile IsNot Value Then
                _SelectedFile = Value
                NotifyPropertyChanged("SelectedFile")
            End If
        End Set
    End Property


    Public Property SelectedItems() As List(Of Object)
        Get
            Return m_SelectedItems
        End Get
        Set
            m_SelectedItems = Value
        End Set
    End Property
    Private m_SelectedItems As List(Of Object)



    ' IDataErrorInfo interface
    Public ReadOnly Property GetError As String Implements IDataErrorInfo.Error
        Get
            Return Me("Folder") & Me("Filter")
        End Get
    End Property

    Default Public ReadOnly Property Item(columnName As String) As String Implements IDataErrorInfo.Item
        Get
            Select Case columnName
                Case "Folder"
                    If Not String.IsNullOrEmpty(Folder) AndAlso Not Directory.Exists(Folder) Then
                        Return "Dossier inexistant ou inaccessible"
                    End If
                    Exit Select

                Case "Filter"
                    If RegExp AndAlso Not String.IsNullOrEmpty(Filter) AndAlso Filter <> "-" Then
                        Dim r As String
                        If Filter.StartsWith("-") Then
                            r = Filter.Substring(1)
                        Else
                            r = m_filter
                        End If

                        Dim isValid As Boolean = False
                        Try
                            Dim re = New Regex(r)
                            isValid = True
                        Catch generatedExceptionName As Exception
                        End Try
                        If Not isValid Then
                            Return "Expression régulière incorrecte"
                        End If
                    End If
                    Exit Select
            End Select
            Return String.Empty
        End Get
    End Property


    ' Commands
    Private Function CanSearch(obj As Object) As Boolean
        Return m_idle AndAlso Folder.Length > 0
    End Function

    Private Async Sub SearchExecute(parameter As Object)
        Filter = "Analyse en cours, patientez..."
        NumFiles = "(analyse en cours)"
        Idle = False
        window.FolderSetsListView.IsEnabled = False
        Await model.SearchFolder(m_folder)
        window.FolderSetsListView.IsEnabled = True
        Idle = True
        Filter = ""
        window.FilterTextBox.Focus()

        ' Force reevaluation of all CommandBinding
        CommandManager.InvalidateRequerySuggested()
    End Sub



    Private Function CanClear(obj As Object) As Boolean
        ' Because of delayed binding, Filter actual content is inaccurate when this function is called
        ' return idle && Filter != null && Filter.Length > 0;

        ' Use information directly from TextBox instead
        Return m_idle AndAlso window.FilterTextBox.Text.Length > 0
    End Function

    Private Sub ClearExecute(parameter As Object)
        Filter = ""
    End Sub


    Private Function CanCopyFolderPath(obj As Object) As Boolean
        If window.FilesListView.SelectedItems.Count > 1 Then
            Dim totalSize As Long = 0
            For Each fns As FileNameAndSize In window.FilesListView.SelectedItems
                totalSize += fns.Size
            Next
            Dim totalSizeString As String
            If totalSize < 1024L Then
                totalSizeString = totalSize.ToString() + " o"
            ElseIf totalSize < 1024L * 1024L Then
                totalSizeString = CLng((totalSize + 1023L) / 1024L).ToString("N0") + " Ko"
            Else
                totalSizeString = CLng((totalSize / 1024L + 1023L) / 1024L).ToString("N0") + " Mo"
            End If
            SelectionSize = window.FilesListView.SelectedItems.Count.ToString & " fichiers sélectionnés, " & totalSizeString
        Else
            SelectionSize = ""
        End If

        Return m_idle AndAlso SelectedFile IsNot Nothing
    End Function

    Private Sub CopyFolderPathExecute(obj As Object)
        If SelectedFile IsNot Nothing Then
            Dim pathsSet = New HashSet(Of String)()
            Dim sb = New StringBuilder()
            For Each fns As FileNameAndSize In window.FilesListView.SelectedItems
                Dim path__1 As String = Path.GetDirectoryName(fns.Name)
                If Not pathsSet.Contains(path__1) Then
                    pathsSet.Add(path__1)
                    sb.AppendLine(path__1)
                End If
            Next
            System.Windows.Clipboard.Clear()
            System.Windows.Clipboard.SetText(sb.ToString())
        End If
    End Sub



    Private Function CanCopyFilePath(obj As Object) As Boolean
        Return m_idle AndAlso SelectedFile IsNot Nothing
    End Function

    ' With Shift, copies all file paths
    Private Sub CopyFilePathExecute(obj As Object)
        If SelectedFile IsNot Nothing Then
            Dim sb = New StringBuilder()
            For Each fns As FileNameAndSize In window.FilesListView.SelectedItems
                sb.AppendLine(fns.Name)
            Next
            System.Windows.Clipboard.Clear()
            System.Windows.Clipboard.SetText(sb.ToString())
        End If
    End Sub


    Private Function CanShowFolder(obj As Object) As Boolean
        Return m_idle AndAlso SelectedFile IsNot Nothing AndAlso Directory.Exists(Path.GetDirectoryName(SelectedFile.Name)) AndAlso window.FilesListView.SelectedItems.Count = 1
    End Function

    Private Sub ShowFolderExecute(obj As Object)
        If SelectedFile IsNot Nothing AndAlso Directory.Exists(Path.GetDirectoryName(SelectedFile.Name)) Then
            Dim argument As String = "/select, """ + Path.GetDirectoryName(SelectedFile.Name) + """"
            System.Diagnostics.Process.Start("explorer.exe", argument)
        End If
    End Sub




    Private Function CanShowFile(obj As Object) As Boolean
        Return m_idle AndAlso SelectedFile IsNot Nothing AndAlso File.Exists(SelectedFile.Name) AndAlso window.FilesListView.SelectedItems.Count = 1
    End Function

    Private Sub ShowFileExecute(obj As Object)
        If SelectedFile IsNot Nothing AndAlso File.Exists(SelectedFile.Name) Then
            Dim argument As String = "/select, """ + SelectedFile.Name + """"
            System.Diagnostics.Process.Start("explorer.exe", argument)
        End If
    End Sub



    Private Function CanRemoveFolderSet(obj As Object) As Boolean
        Return m_idle AndAlso (SelectedFolderSet IsNot Nothing)
    End Function

    Private Sub RemoveFolderSet(obj As Object)
        If SelectedFolderSet IsNot Nothing Then
            model.RemoveFolderSet(SelectedFolderSet.Root)
        End If
    End Sub

End Class
