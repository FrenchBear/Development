// FileFilter
// 2016-09-26   PV

using System;
using System.Runtime.InteropServices;
using System.Windows;
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

        private void FilesListBox_MouseDoubleClick(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            try
            {
                System.Windows.Clipboard.Clear();
                if (FilesListBox.SelectedItem != null)
                    System.Windows.Clipboard.SetText((string)(FilesListBox.SelectedItem));
            }
            catch (Exception)
            {
            }
        }


        // Quick app exit, bypassing ViewModel
        //private void QuitButton_Click(object sender, RoutedEventArgs e)
        //{
        //    Application.Current.Shutdown();
        //}

    }
}
