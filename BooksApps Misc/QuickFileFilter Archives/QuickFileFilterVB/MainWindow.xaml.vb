' QuickFileFilter, Code Behind MainWindow
' Window
'
' 2016-09-26    PV
' 2017-01-04    PV  v3, Visual Basic

Imports System.ComponentModel
Imports System.IO
Imports System.Windows.Interop


''' <summary>
''' Interaction logic for MainWindow.xaml
''' </summary>
Partial Public Class MainWindow : Inherits Window

    Public Sub New()
        ' Set for current window CultureInfo of the thread, ie. make sure that bound dates and numbers are formatted according to current locale
        System.Windows.FrameworkElement.LanguageProperty.OverrideMetadata(GetType(System.Windows.FrameworkElement), New System.Windows.FrameworkPropertyMetadata(System.Windows.Markup.XmlLanguage.GetLanguage(System.Globalization.CultureInfo.CurrentCulture.IetfLanguageTag)))

        InitializeComponent()

        ' Create and initialize Model and ViewModel
        Dim m = New Model()
        Dim vm = New ViewModel(m, Me)
        m.SetViewModel(vm)
        DataContext = vm

        ' Once window is loaded, move focus to appropriate field and add a command 'About' to system menu
        AddHandler Loaded, Sub(s, e)
                               ' On 1st execution with no folder, move focus on Folder field
                               ' If a previous folder is loaded, focus is already set on Filter field
                               If String.IsNullOrEmpty(FolderTextBox.Text) Then
                                   FolderTextBox.Focus()
                               End If


                               ' Get the Handle for the Forms System Menu   
                               Dim systemMenuHandle = GetSystemMenu(Handle, False)

                               ' Create our new System Menu items just before the Close menu item
                               InsertMenu(systemMenuHandle, 5, MfByposition Or MfSeparator, CType(0, IntPtr), String.Empty)
                               InsertMenu(systemMenuHandle, 6, MfByposition, CType(SettingsSysMenuId, IntPtr), "À &propos de QuickFileFilter...")

                               ' Attach our WindowCommandHandler handler to this Window
                               Dim source = HwndSource.FromHwnd(Handle)

                               ' Add event handler for System Menu
                               source.AddHook(AddressOf WindowCommandHandler)
                           End Sub
    End Sub


    ' Define constants for InsertMenu calls
    Private Const WmSyscommand As Integer = &H112
    Private Const MfSeparator As Integer = &H800
    Private Const MfByposition As Integer = &H400

    ' The constant to identify About command in system menu
    Private Const SettingsSysMenuId As Integer = 1000

    ' Win32 Interop Handle for this Window
    Public ReadOnly Property Handle() As IntPtr
        Get
            Return New WindowInteropHelper(Me).Handle
        End Get
    End Property


    ' Event handler for System Menu
    Private Function WindowCommandHandler(hwnd As IntPtr, msg As Integer, wParam As IntPtr, lParam As IntPtr, ByRef handled As Boolean) As IntPtr
        ' Check if a System Command has been executed
        If msg = WmSyscommand AndAlso wParam.ToInt32() = SettingsSysMenuId Then
            Dim aw = New AboutWindow()
            aw.ShowDialog()
            handled = True
        End If

        Return IntPtr.Zero
    End Function


    ' A double-click on a file name opens that file with default application
    Private Sub FilesListView_MouseDoubleClick(sender As Object, e As System.Windows.Input.MouseButtonEventArgs)
        ' If we double-click a header, or not on a file
        If FilesListView.SelectedItem Is Nothing Then Return

        Dim file As String = DirectCast(FilesListView.SelectedItem, FileNameAndSize).Name
        If Not IO.File.Exists(file) Then
            MessageBox.Show("Fichier non trouvé.", "QuickFileFilter", MessageBoxButton.OK, MessageBoxImage.Exclamation)
            Return
        End If

        Dim start As New ProcessStartInfo()
        Dim exitCode As Integer
        start.FileName = """" & file & """"
        start.UseShellExecute = True
        start.WorkingDirectory = Path.GetDirectoryName(file)
        Using proc As Process = Process.Start(start)
            If proc Is Nothing Then
                MessageBox.Show("Échec à l'ouverture du fichier (suffixe inconnu?)", "QuickFileFilter", MessageBoxButton.OK, MessageBoxImage.Exclamation)
            Else
                proc.WaitForExit()
                exitCode = proc.ExitCode
            End If
        End Using
    End Sub



    ' Support for list sorting when clicking on column header
    Private _lastHeaderClicked As GridViewColumnHeader = Nothing
    Private _lastDirection As ListSortDirection = ListSortDirection.Ascending

    Private Sub FilesListView_Click(sender As Object, e As RoutedEventArgs)
        Dim headerClicked As GridViewColumnHeader = TryCast(e.OriginalSource, GridViewColumnHeader)
        Dim direction As ListSortDirection

        If headerClicked IsNot Nothing Then
            If headerClicked.Role <> GridViewColumnHeaderRole.Padding Then
                If headerClicked IsNot _lastHeaderClicked Then
                    direction = ListSortDirection.Ascending
                Else
                    If _lastDirection = ListSortDirection.Ascending Then
                        direction = ListSortDirection.Descending
                    Else
                        direction = ListSortDirection.Ascending
                    End If
                End If

                ' Must sort on Property name, not header text...
                Dim header As String = TryCast(headerClicked.Column.Header, String)
                If header = "Fichier" Then
                    header = "Name"
                ElseIf header = "Taille" Then
                    header = "Size"
                End If
                Sort(header, direction)

                If direction = ListSortDirection.Ascending Then
                    headerClicked.Column.HeaderTemplate = TryCast(Resources("HeaderTemplateArrowUp"), DataTemplate)
                Else
                    headerClicked.Column.HeaderTemplate = TryCast(Resources("HeaderTemplateArrowDown"), DataTemplate)
                End If

                ' Remove arrow from previously sorted header 
                If _lastHeaderClicked IsNot Nothing AndAlso _lastHeaderClicked IsNot headerClicked Then
                    _lastHeaderClicked.Column.HeaderTemplate = Nothing
                End If

                _lastHeaderClicked = headerClicked
                _lastDirection = direction
            End If
        End If
    End Sub

    ' Helper to sort a ListView
    Private Sub Sort(sortBy As String, direction As ListSortDirection)
        Dim dataView As ICollectionView = CollectionViewSource.GetDefaultView(FilesListView.ItemsSource)

        dataView.SortDescriptions.Clear()
        Dim sd As New SortDescription(sortBy, direction)
        dataView.SortDescriptions.Add(sd)
        dataView.Refresh()
    End Sub

End Class
