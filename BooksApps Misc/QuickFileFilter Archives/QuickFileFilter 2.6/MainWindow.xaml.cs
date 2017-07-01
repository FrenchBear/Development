// QuickFileFilter
// 2016-09-26   PV
// 2017-02-17   PV  ListView (of files) columns auto-resize with Ctrl+*

using System;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Input;
using System.Windows.Interop;
using static QuickFileFilter.NativeMethods;

namespace QuickFileFilter
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private readonly Model m;
        private readonly ViewModel vm;

        public MainWindow()
        {
            // Set for current window CultureInfo of the thread
            // System.Globalization.CultureInfo.CurrentCulture == Thread.CurrentThread.CurrentCulture
            LanguageProperty.OverrideMetadata(
                typeof(FrameworkElement),
                new FrameworkPropertyMetadata(
                    System.Windows.Markup.XmlLanguage.GetLanguage(System.Globalization.CultureInfo.CurrentCulture.IetfLanguageTag)));

            InitializeComponent();

            m = new Model();
            vm = new ViewModel(m, this);
            m.SetViewModel(vm);
            DataContext = vm;

            Loaded += (s, e) =>
            {
                // Get the Handle for the Forms System Menu
                var systemMenuHandle = GetSystemMenu(Handle, false);

                // Create our new System Menu items just before the Close menu item
                InsertMenu(systemMenuHandle, 5, MfByposition | MfSeparator, (IntPtr)0, string.Empty);
                InsertMenu(systemMenuHandle, 6, MfByposition, (IntPtr)SettingsSysMenuId, "À &propos de QuickFileFilter...");

                // Attach our WindowCommandHandler handler to this Window
                var source = HwndSource.FromHwnd(Handle);
                source.AddHook(WindowCommandHandler);


                //FolderTextBox.Focus();
            };
        }

        /// Define Constants we will use
        private const int WmSyscommand = 0x112;
        private const int MfSeparator = 0x800;
        private const int MfByposition = 0x400;

        // The constant we'll use to identify our custom system menu items
        private const int SettingsSysMenuId = 1000;

        /// <summary>
        /// This is the Win32 Interop Handle for this Window
        /// </summary>
        public IntPtr Handle => new WindowInteropHelper(this).Handle;


        private IntPtr WindowCommandHandler(IntPtr hwnd, int msg, IntPtr wParam, IntPtr lParam, ref bool handled)
        {
            // Check if a System Command has been executed
            if (msg == WmSyscommand && wParam.ToInt32() == SettingsSysMenuId)
            {
                var aw = new AboutWindow();
                aw.ShowDialog();

                handled = true;
            }

            return IntPtr.Zero;
        }

        private void FilesListView_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (FilesListView.SelectedItem == null)
                return;
            string file = ((FileNameAndSize)FilesListView.SelectedItem).Name;
            if (!File.Exists(file))
            {
                MessageBox.Show("Fichier non trouvé.", "QuickFileFilter", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                return;
            }

            ProcessStartInfo start = new ProcessStartInfo
            {
                FileName = "\"" + file + "\"",
                UseShellExecute = true,
                WorkingDirectory = Path.GetDirectoryName(file)
            };
            using (Process proc = Process.Start(start))
            {
                if (proc == null)
                {
                    MessageBox.Show("Échec à l'ouverture du fichier (suffixe inconnu?)", "QuickFileFilter", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                }
                else
                {
                    proc.WaitForExit();
                }
            }
        }

        GridViewColumnHeader _lastHeaderClicked;        // = null;  is implicit
        ListSortDirection _lastDirection = ListSortDirection.Ascending;

        private void FilesListView_Click(object sender, RoutedEventArgs e)
        {
            GridViewColumnHeader headerClicked = e.OriginalSource as GridViewColumnHeader;

            if (headerClicked != null)
            {
                if (headerClicked.Role != GridViewColumnHeaderRole.Padding)
                {
                    ListSortDirection direction;

                    if (!ReferenceEquals(headerClicked, _lastHeaderClicked))
                        direction = ListSortDirection.Ascending;
                    else
                        direction = _lastDirection == ListSortDirection.Ascending ? ListSortDirection.Descending : ListSortDirection.Ascending;

                    // Need to sort on property name.  This is dirty code...
                    var header = headerClicked.Column.Header as string;
                    if (header == "Fichier") header = "Name";
                    else if (header == "Taille") header = "Size";

                    Sort(header, direction);

                    if (direction == ListSortDirection.Ascending)
                    {
                        headerClicked.Column.HeaderTemplate =
                          Resources["HeaderTemplateArrowUp"] as DataTemplate;
                    }
                    else
                    {
                        headerClicked.Column.HeaderTemplate =
                          Resources["HeaderTemplateArrowDown"] as DataTemplate;
                    }

                    // Remove arrow from previously sorted header 
                    if (_lastHeaderClicked != null && _lastHeaderClicked != headerClicked)
                    {
                        _lastHeaderClicked.Column.HeaderTemplate = null;
                    }


                    _lastHeaderClicked = headerClicked;
                    _lastDirection = direction;
                }

            }
        }

        private void Sort(string sortBy, ListSortDirection direction)
        {
            //ICollectionView dataView = CollectionViewSource.GetDefaultView(FilesListView.ItemsSource);
            ICollectionView dataView = CollectionViewSource.GetDefaultView(vm.Files);

            dataView.SortDescriptions.Clear();
            SortDescription sd = new SortDescription(sortBy, direction);
            dataView.SortDescriptions.Add(sd);
            dataView.Refresh();
        }

        // Resize columns of the ListView when pressing Ctrl+* (same as in Windows Explorer or RegEdit)
        private void Window_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Multiply && (e.KeyboardDevice.IsKeyDown(Key.LeftCtrl)|| e.KeyboardDevice.IsKeyDown(Key.RightCtrl)))
            {
                GridView gv = FilesListView.View as GridView;
                if (gv != null)
                {
                    foreach (var c in gv.Columns)
                    {
                        // Code below was found in GridViewColumnHeader.OnGripperDoubleClicked() event handler (using Reflector)
                        // i.e. it is the same code that is executed when the gripper is double clicked
                        if (double.IsNaN(c.Width))
                        {
                            c.Width = c.ActualWidth;
                        }
                        c.Width = double.NaN;
                    }
                }


                e.Handled = true;
            }
        }
    }
}
