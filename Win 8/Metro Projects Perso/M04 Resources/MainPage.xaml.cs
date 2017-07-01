// M04 Resources
// Windows 8 Store implementation of FrameworkElement does NOT provide a FindResource method!
// Try to rewrite it by hand
// 2013-09-22   PV

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// The Blank Page item template is documented at http://go.microsoft.com/fwlink/?LinkId=234238

namespace M04_Resources
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class MainPage : Page
    {
        public MainPage()
        {
            this.InitializeComponent();

            Brush b1 = FindResource(bigEight, "Brush8") as Brush;
            //Brush b = this.Resources["Brush8"] as Brush;
        }

        /// <summary>
        /// Invoked when this page is about to be displayed in a Frame.
        /// </summary>
        /// <param name="e">Event data that describes how this page was reached.  The Parameter
        /// property is typically used to configure the page.</param>
        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
        }

        // Manual rewrite of FindResource for Windows 8 Modern UI apps
        // Should be rewritten as an extension of FrameworkElement
        private object FindResource(FrameworkElement element, object key)
        {
            for (; ; )
            {
                if (element.Resources.ContainsKey(key))
                    return element.Resources[key];
                element = element.Parent as FrameworkElement;
                if (element == null) break;
            }

            if (Application.Current.Resources.ContainsKey(key))
                return Application.Current.Resources[key];

            return null;
        }
    }
}
