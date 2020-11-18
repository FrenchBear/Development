using System;
using System.Windows;

namespace ThemedProgressPie
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        protected override void OnStartup(StartupEventArgs e)
        {
            /*
            base.OnStartup(e);
            //Uri uri = new Uri("PresentationFramework.Aero;V4.0.0.0;31bf3856ad364e35;component\\themes/aero.normalcolor.xaml", UriKind.Relative);
            Uri uri = new Uri("PresentationFramework.Luna;V4.0.0.0;31bf3856ad364e35;component\\themes/luna.normalcolor.xaml", UriKind.Relative);
            //Uri uri = new Uri("PresentationFramework.Royale;V4.0.0.0;31bf3856ad364e35;component\\themes/royale.normalcolor.xaml", UriKind.RelativeOrAbsolute);

            Resources.MergedDictionaries.Add(Application.LoadComponent(uri) as ResourceDictionary);
            */
        }

    }
}
