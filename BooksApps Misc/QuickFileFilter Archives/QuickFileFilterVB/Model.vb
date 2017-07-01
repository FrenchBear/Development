' QuickFileFilter, Model class
' Model
'
' 2016-09-26    PV
' 2016-09-30    PV  CopyFolderPathCommand and IsolatedStorage cache
' 2016-12-12    PV  v2, multiple folders sets and store FileInfo instead of just path
' 2016-12-30    PV  v2.5, Cache and selection memorized in plain files in same folder as executable, not anymore isolated storage
' 2017-01-04    PV  v3, Visual Basic

Imports System.Collections.ObjectModel
Imports System.IO
Imports System.Reflection
Imports System.Text


Class Model
    ' ViewModel access
    Private vm As ViewModel

    ' List of roots and files
    Public FolderSets As ObservableCollection(Of FolderSet)

    Public Sub SetViewModel(vm As ViewModel)
        Me.vm = vm
        FolderSets = New ObservableCollection(Of FolderSet)()

        ' Load all FolderSets, but not the list of files they contain
        Dim version As String, line As String
        For Each cacheFilename As String In Directory.GetFiles(GetCacheFolder(), "*.ffcache")
            Using reader As New StreamReader(cacheFilename)
                version = reader.ReadLine()
                ' Check version
                If version <> "3" Then Debugger.Break()

                Dim fs = New FolderSet()
                fs.Root = reader.ReadLine()
                fs.CacheFilename = cacheFilename
                line = reader.ReadLine()
                fs.ScanDate = DateTime.Parse(line)
                ' Do not read the files
                FolderSets.Add(fs)
            End Using
        Next

        ' Reposition on last selected FolderSet, memorized in selection.ffdata
        Dim def As FolderSet = Nothing
        Dim selectionFile As String = Path.Combine(GetCacheFolder(), "selection.ffdata")
        If File.Exists(selectionFile) Then
            Try
                Using reader As New StreamReader(selectionFile)
                    version = reader.ReadLine()
                    If version <> "3" Then Debugger.Break()
                    Dim root As String = reader.ReadLine()
                    def = FolderSets.Where(Function(fs) Path.GetFullPath(fs.Root) = Path.GetFullPath(root)).FirstOrDefault()
                End Using
            Catch generatedExceptionName As Exception
            End Try
        End If

        ' If there was a previous folder, select it, otherwise select 1st in the list
        If def IsNot Nothing Then
            vm.SelectedFolderSet = def
        ElseIf FolderSets.Count > 0 Then
            vm.SelectedFolderSet = FolderSets(0)
        End If
    End Sub


    ' Loads all files of a FolderSet
    Public Sub LoadFiles(fs As FolderSet)
        ' Unless they have already been read...
        If fs.Files IsNot Nothing Then Return

        Using reader As New StreamReader(fs.CacheFilename)
            ' Skip the 1st three lines (Version, Root, Date) already read on startup
            For i As Integer = 0 To 3
                reader.ReadLine()
            Next
            ' Then read files and sizes
            fs.Files = New List(Of FileNameAndSize)()
            While Not reader.EndOfStream
                Dim name As String = reader.ReadLine()
                If name.Length = 0 Then
                    Exit While
                End If
                Dim line As String = reader.ReadLine()
                fs.Files.Add(New FileNameAndSize() With {
                    .Name = name,
                    .Size = Long.Parse(line)
                })
            End While
        End Using
    End Sub

    ' Called by Model to read (or update) files of a given folder
    Public Async Function SearchFolder(folder As String) As Task
        Dim files As List(Of FileNameAndSize)

        ' Execute file search in a separate thread so that interface is not frozen during search
        files = Await Task.Run(Function()
                                   Dim di = New DirectoryInfo(folder)

                                   Try
                                       Return di.GetFiles("*.*", System.IO.SearchOption.AllDirectories).OrderBy(Function(fi) fi.Name, New WindowsFileExplorerComparer()).OrderBy(Function(fi) Path.GetDirectoryName(fi.FullName), New WindowsFileExplorerComparer()).[Select](Function(fi) New FileNameAndSize() With {
                                            .Name = fi.FullName,
                                            .Size = fi.Length
                                        }).ToList()
                                   Catch ex As Exception
                                       MessageBox.Show("Erreur lors de l'énumération des fichiers:" & vbCr & vbLf + ex.Message, "QuickFileFilter", MessageBoxButton.OK, MessageBoxImage.[Error])
                                       Return Nothing
                                   End Try
                               End Function)

        ' If there was a problem, we're done
        If files Is Nothing Then Return

        ' Update FoldersSets list with the new list, either update an existing FolderSet or create a new one
        ' Find if folder is already in the list
        Dim iPos As Integer = 0
        While iPos < FolderSets.Count
            If FolderSets(iPos).Root.Length = 0 OrElse Path.GetFullPath(FolderSets(iPos).Root) = Path.GetFullPath(folder) Then
                Exit While
            End If
            iPos += 1
        End While
        ' if not, we add the new folder at the top of FolerSets list
        If iPos >= FolderSets.Count Then
            iPos = 0
            FolderSets.Insert(0, New FolderSet())
        End If
        ' Then update properties
        FolderSets(iPos).Root = folder
        FolderSets(iPos).ScanDate = DateTime.Now
        FolderSets(iPos).Files = files

        ' Make sure it's selected
        vm.SelectedFolderSet = FolderSets(iPos)
        vm.Folder = folder

        ' And save FolderSet on disk
        SaveFolderSet(FolderSets(iPos))
    End Function

    ''' <summary>
    ''' Returns folder where .ffcache files are stored
    ''' </summary>
    Private Function GetCacheFolder() As String
        ' For now, stored in executable folder (that's not very good...)
        Return Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location)
    End Function

    ''' <summary>
    ''' Save content of a FolderSet into a .ffcache file
    ''' </summary>
    ''' <param name="fs">FolderSet to save</param>
    Private Sub SaveFolderSet(fs As FolderSet)
        ' Cache filename is root folder with all invalid characters replaced by -, % replaced by %% and - replaced by %-
        ' For instance, root W:\Livres\Informatique becomes W--Livres-Informatique.ffcache
        Dim invalidFileChars As Char() = Path.GetInvalidFileNameChars()
        Dim sbAlt As New StringBuilder()
        For Each c As Char In fs.Root
            If c = "%"c Then
                sbAlt.Append("%%")
            ElseIf c = "-"c Then
                sbAlt.Append("%-")
            ElseIf invalidFileChars.Contains(c) Then
                sbAlt.Append("-"c)
            Else
                sbAlt.Append(c)
            End If
        Next

        ' Write file
        Dim cacheFilename As String = Path.Combine(GetCacheFolder(), sbAlt.ToString() + ".ffcache")
        fs.CacheFilename = cacheFilename
        Using writer As New StreamWriter(cacheFilename, False, Encoding.UTF8)
            writer.WriteLine("3")
            ' Version of cache structure
            writer.WriteLine(fs.Root)
            writer.WriteLine(fs.ScanDate.ToString("s"))     ' "s" is ISO 8601 date format such as "2016-06-15T13:45:30", easy to read
            writer.WriteLine(fs.Files.Count)
            For Each fns As FileNameAndSize In fs.Files
                writer.WriteLine(fns.Name)
                writer.WriteLine(fns.Size)
            Next
        End Using
    End Sub


    ''' <summary>
    ''' Memorize last FolderSet selected, so it can be reloaded next time application is started
    ''' </summary>
    ''' <param name="fs">Selected FolderSet to memorize</param>
    Friend Sub MemorizeSelectedFolderSet(fs As FolderSet)
        Dim cacheFilename As String = Path.Combine(GetCacheFolder(), "selection.ffdata")
        Using writer As New StreamWriter(cacheFilename, False, Encoding.UTF8)
            writer.WriteLine("3")       ' Version of selection structure
            writer.WriteLine(fs.Root)
        End Using
    End Sub


    ''' <summary>
    ''' Called from ViewModel, delete a FolderSet on disk
    ''' </summary>
    ''' <param name="folder">Root folder to delete</param>
    Friend Sub RemoveFolderSet(folder As String)
        Dim iPos As Integer = 0
        While iPos < FolderSets.Count
            If Path.GetFullPath(FolderSets(iPos).Root) = Path.GetFullPath(folder) Then
                Exit While
            End If
            iPos += 1
        End While
        If iPos >= 0 AndAlso iPos < FolderSets.Count Then
            ' Delete cache on disk
            Try
                File.Delete(FolderSets(iPos).CacheFilename)
            Catch generatedExceptionName As Exception

                Throw
            End Try

            ' Delete FolderSet in memory
            FolderSets.RemoveAt(iPos)

            ' Clear selection
            vm.SelectedFolderSet = Nothing
        End If
    End Sub

End Class
