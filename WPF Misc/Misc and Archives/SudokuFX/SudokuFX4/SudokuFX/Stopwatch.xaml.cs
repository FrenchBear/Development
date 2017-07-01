using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;   
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Globalization; 
namespace SudokuFX
{
    /// <summary>
    /// Interaction logic for Stopwatch.xaml
    /// </summary>
    [ValueConversion(typeof(double), typeof(double))]
    public class AngleConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return (double)value * 360; 
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return (double)value / 360;
        }
    }
 


    public partial class Stopwatch : ToggleButton
    {
       
        public static readonly DependencyProperty CurrentTimeProperty = DependencyProperty.Register(
          "CurrentTime",
          typeof(double),
          typeof(Stopwatch),
          new FrameworkPropertyMetadata(0.0,
              FrameworkPropertyMetadataOptions.AffectsRender
          )
        );
      
        public double CurrentTime
        {
            get
            {
                return (double)this.GetValue(CurrentTimeProperty);   
            }
            set
            {
                this.SetValue(CurrentTimeProperty, value);
            }
        }
         
     
        public Stopwatch()
        {
            InitializeComponent();
        }

    }
}