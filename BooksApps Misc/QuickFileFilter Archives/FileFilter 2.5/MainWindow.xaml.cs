// FileFilter
// 2016-09-26   PV

using System;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Runtime.InteropServices;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Interop;
using static FileFilter.NativeMethods;

namespace FileFilter
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            // Set for current window CultureInfo of the thread
            // System.Globalization.CultureInfo.CurrentCulture == Thread.CurrentThread.CurrentCulture
            System.Windows.FrameworkElement.LanguageProperty.OverrideMetadata(
                typeof(System.Windows.FrameworkElement),
                new System.Windows.FrameworkPropertyMetadata(
                    System.Windows.Markup.XmlLanguage.GetLanguage(System.Globalization.CultureInfo.CurrentCulture.IetfLanguageTag)));

            InitializeComponent();

            var m = new Model();
            var vm = new ViewModel(m, this);
            m.SetViewModel(vm);
            DataContext = vm;

            Loaded += (s, e) =>
            {
                // Get the Handle for the Forms System Menu
                var systemMenuHandle = GetSystemMenu(Handle, false);

                // Create our new System Menu items just before the Close menu item
                InsertMenu(systemMenuHandle, 5, MfByposition | MfSeparator, (IntPtr)0, string.Empty);
                InsertMenu(systemMenuHandle, 6, MfByposition, (IntPtr)SettingsSysMenuId, "&About FileFilter...");

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
        public IntPtr Handle
        {
            get { return new WindowInteropHelper(this).Handle; }
        }


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

        private void FilesListView_MouseDoubleClick(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            if (FilesListView.SelectedItem == null)
                return;
            string file = ((FileNameAndSize)FilesListView.SelectedItem).Name;
            if (!File.Exists(file))
            {
                MessageBox.Show("Fichier non trouvé.", "FileFilter", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                return;
            }

            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            start.FileName = "\"" + file + "\"";
            start.UseShellExecute = true;
            start.WorkingDirectory = Path.GetDirectoryName(file);
            using (Process proc = Process.Start(start))
            {
                if (proc == null)
                {
                    MessageBox.Show("Échec à l'ouverture du fichier (suffixe inconnu?)", "FileFilter", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                }
                else
                {
                    proc.WaitForExit();
                    exitCode = proc.ExitCode;
                }
            }
        }

        GridViewColumnHeader _lastHeaderClicked = null;
        ListSortDirection _lastDirection = ListSortDirection.Ascending;

        private void FilesListView_Click(object sender, RoutedEventArgs e)
        {
            GridViewColumnHeader headerClicked = e.OriginalSource as GridViewColumnHeader;
            ListSortDirection direction;

            if (headerClicked != null)
            {
                if (headerClicked.Role != GridViewColumnHeaderRole.Padding)
                {
                    if (headerClicked != _lastHeaderClicked)
                    {
                        direction = ListSortDirection.Ascending;
                    }
                    else
                    {
                        if (_lastDirection == ListSortDirection.Ascending)
                        {
                            direction = ListSortDirection.Descending;
                        }
                        else
                        {
                            direction = ListSortDirection.Ascending;
                        }
                    }

                    string header = headerClicked.Column.Header as string;
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
            ICollectionView dataView =
              CollectionViewSource.GetDefaultView(FilesListView.ItemsSource);

            dataView.SortDescriptions.Clear();
            SortDescription sd = new SortDescription(sortBy, direction);
            dataView.SortDescriptions.Add(sd);
            dataView.Refresh();
        }




        // Quick app exit, bypassing ViewModel
        //private void QuitButton_Click(object sender, RoutedEventArgs e)
        //{
        //    Application.Current.Shutdown();
        //}

    }
}
