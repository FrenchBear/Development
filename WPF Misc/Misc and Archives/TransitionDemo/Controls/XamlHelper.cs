using System;
using System.Windows;

namespace WpfWizard.Controls
{
    public static class XamlHelper
    {
        public static void ExecuteOnLoaded(FrameworkElement fe, Action action)
        {
            if (fe.IsLoaded)
            {
                if (action != null)
                {
                    action();
                }
            }
            else
            {
                RoutedEventHandler handler = null;
                handler = delegate
                {
                    fe.Loaded -= handler;

                    if (action != null)
                    {
                        action();
                    }
                };

                fe.Loaded += handler;
            }
        }
    }
}