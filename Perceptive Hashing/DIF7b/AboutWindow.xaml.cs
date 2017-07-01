// Standard About Window for Duplicate Image Finder
//
// 2013-07-21   PV  First version

using System;
using System.Linq;
using System.Reflection;
using System.Windows;
using System.Windows.Markup;
using System.Windows.Media.Imaging;

namespace DIF
{
    /// <summary>
    /// Interaction logic for AboutWindow.xaml
    /// </summary>
    public partial class AboutWindow : Window
    {
        public AboutWindow()
        {
            InitializeComponent();

            Assembly myAssembly = System.Reflection.Assembly.GetExecutingAssembly();
            AssemblyTitleAttribute aTitleAttr = (AssemblyTitleAttribute)AssemblyTitleAttribute.GetCustomAttribute(myAssembly, typeof(AssemblyTitleAttribute));
            AssemblyDescriptionAttribute aDescAttr = (AssemblyDescriptionAttribute) AssemblyDescriptionAttribute.GetCustomAttribute(myAssembly, typeof(AssemblyDescriptionAttribute));
            string sAssemblyVersion = myAssembly.GetName().Version.ToString();
            AssemblyCopyrightAttribute aCopyrightAttr = (AssemblyCopyrightAttribute)AssemblyTitleAttribute.GetCustomAttribute(myAssembly, typeof(AssemblyCopyrightAttribute));

            AssemblyTitle.Text = aTitleAttr.Title;
            AssemblyDescription.Text = aDescAttr.Description;
            AssemblyVersion.Text = "Version " + sAssemblyVersion;
            AssemblyCopyright.Text = aCopyrightAttr.Copyright;
        }

        private void OKButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }

    /// <summary>
    /// Simple extension for ico, let you choose icon with specific size.
    /// Usage sample: Image Stretch="None" Source="{common:Icon /ControlsTester;component/icons/custom-reports.ico, 16}"
    /// Or: Image Source="{common:Icon Source={Binding IconResource},Size=16} "
    /// </summary> 
    public class IconExtension : MarkupExtension
    {
        private string source;

        public string Source
        {
            get
            {
                return this.source;
            }

            set
            {
                // Have to make full pack URI from short form, so System.Uri can regognize it.
                this.source = "pack://application:,,," + value;
            }
        }

        public int Size { get; set; }

        public override object ProvideValue(IServiceProvider serviceProvider)
        {
            var decoder = BitmapDecoder.Create(new Uri(this.Source), BitmapCreateOptions.DelayCreation, BitmapCacheOption.OnDemand);

            var result = decoder.Frames.SingleOrDefault(f => f.Width == this.Size);
            if (result == default(BitmapFrame))
                result = decoder.Frames.OrderBy(f => f.Width).First();
            return result;
        }

        public IconExtension(string source, int size)
        {
            this.Source = source;
            this.Size = size;
        }

        public IconExtension() { }
    }

}
