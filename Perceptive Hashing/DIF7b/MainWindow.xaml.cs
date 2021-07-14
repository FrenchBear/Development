// DIF - Duplicate Image Finder
// 2013-05-25   PV
// 2013-07-21   PV  Add About command in system menu, from http://stackoverflow.com/questions/4144154/making-a-wpf-system-context-menu-item-toggleable

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DIF
{

    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        readonly ViewModel vm;

        public MainWindow()
        {
            InitializeComponent();

            var m = new Model();
            vm = new ViewModel(m, this);
            m.SetViewModel(vm,this);
            DataContext = vm;

            Loaded += (s, e) =>
            {
                // Get the Handle for the Forms System Menu
                var systemMenuHandle = GetSystemMenu(Handle, false);

                // Create our new System Menu items just before the Close menu item
                InsertMenu(systemMenuHandle, 5, MfByposition | MfSeparator, 0, string.Empty); // <-- Add a menu seperator
                InsertMenu(systemMenuHandle, 6, MfByposition, SettingsSysMenuId, "&About Duplicate Image Finder...");

                // Attach our WindowCommandHandler handler to this Window
                var source = HwndSource.FromHwnd(Handle);
                source.AddHook(WindowCommandHandler);
            };
        }

#region Win32 API Stuff
        // Define the Win32 API methods we are going to use
        [DllImport("user32.dll")]
        private static extern IntPtr GetSystemMenu(IntPtr hWnd, bool bRevert);

        [DllImport("user32.dll")]
        private static extern bool InsertMenu(IntPtr hMenu, Int32 wPosition, Int32 wFlags, Int32 wIDNewItem, string lpNewItem);

        /// Define our Constants we will use
        private const int WmSyscommand = 0x112;
        private const int MfSeparator = 0x800;
        private const int MfByposition = 0x400;
#endregion

        // The constants we'll use to identify our custom system menu items
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


        // Quick app exit, bypassing ViewModel
        private void QuitButton_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        // Relay manually event to ViewModel, much more simpler using code behind than awfully complex WindowInteraction that doesn't pass event sender
        // Binding:http://stackoverflow.com/questions/4897775/wpf-binding-ui-events-to-commands-in-viewmodel
        // Complex partial fix for EventArgs: http://stackoverflow.com/questions/6205472/mvvm-passing-eventargs-as-command-parameter
        private void Image_MouseEnter(object sender, MouseEventArgs e)
        {
            vm.Image_MouseEnter(sender, e);
        }

        // Make sure selected item is visible
        // Since it can be considered as a view-only issue, it's Ok to have code behind
        // For other methods: http://stackoverflow.com/questions/8827489/scroll-wpf-listbox-to-the-selecteditem-set-in-code-in-a-view-model
        private void ListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (((ListBox)sender).SelectedItem != null)
                ((ListBox)sender).ScrollIntoView(((ListBox)sender).SelectedItem);
        }

        // Double-click on a duplicate row removes it
        private void DuplicatesList_PreviewMouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (DuplicatesList.SelectedIndex>=0)
                vm.DuplicatesList.RemoveAt(DuplicatesList.SelectedIndex);
        }
    }
}
