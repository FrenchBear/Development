using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Collections.Generic;
using System.Globalization;
using System.Collections;

namespace SudokuFX
{
    /// <summary>
    /// Interaction logic for GraphControl.xaml
    /// </summary>
    /// 
   
    [ValueConversion(typeof(Color), typeof(Color))]
    public class ColorLightnessConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null) return null;
            int param = int.Parse(parameter.ToString());

            Color src = (Color)value;
            Color ret = new Color();
            ret.A = src.A;
            ret.R = (byte)Math.Max(Math.Min(src.R + param,255),0);
            ret.G = (byte)Math.Max(Math.Min(src.G + param, 255), 0);
            ret.B = (byte)Math.Max(Math.Min(src.B + param, 255), 0);
            return ret;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null) return null;
            int param = int.Parse(parameter.ToString());

            Color src = (Color)value;
            Color ret = new Color();
            ret.A = src.A;
            ret.R = (byte)Math.Max(Math.Min(src.R - param, 255), 0);
            ret.G = (byte)Math.Max(Math.Min(src.G - param, 255), 0);
            ret.B = (byte)Math.Max(Math.Min(src.B - param, 255), 0);
            return ret;
        }
    }

    [ValueConversion(typeof(int), typeof(Color))]
    public class BarColorConverter : IValueConverter
    {
        static Color[] BarColors = {
                                    Colors.SteelBlue,
                                    Colors.Green,
                                    Colors.Firebrick,
                                    Colors.DarkSlateGray,
                                    Colors.Orange,
                                    Colors.Khaki
                                    };
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            int v = (int)value;
            return BarColors[v % BarColors.Length];
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            Color v = (Color)value;
            return Array.IndexOf<Color>(BarColors, v);
        }
        
    }

    public partial class GraphControl : ListBox
    {
        public static readonly DependencyProperty BarHeightProperty = DependencyProperty.RegisterAttached("BarHeight", typeof(double), typeof(DependencyObject), new PropertyMetadata(0.0));
        public static double GetBarHeight(DependencyObject d)
        {
            return (double)d.GetValue(BarHeightProperty);
        }
        public static void SetBarHeight(DependencyObject d, double h)
        {
            d.SetValue(BarHeightProperty, h);
        }

        public static readonly DependencyProperty IndexProperty = DependencyProperty.RegisterAttached("Index", typeof(Int32), typeof(DependencyObject), new PropertyMetadata(0));
        public static Int32 GetIndex(DependencyObject d)
        {
            return (Int32)d.GetValue(IndexProperty);
        }
        public static void SetIndex(DependencyObject d, Int32 i)
        {
            d.SetValue(IndexProperty, i);
        }

       
       
        public GraphControl()
        {
            InitializeComponent();
        }
        protected override void OnItemsChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            base.OnItemsChanged(e);

            long maxVal = 0;   
            foreach (SolverResult s in Items)
            {
                if (!s.Failed && s.TimeTaken.Ticks > maxVal) maxVal = s.TimeTaken.Ticks;
            }
            foreach (SolverResult s in Items)
            {
                if (s.Failed)
                {
                    GraphControl.SetBarHeight(s, ActualHeight - 25);
                }
                else
                {
                    double h = (double)s.TimeTaken.Ticks / (double)maxVal * (ActualHeight - 25);
                    if (h > 10)
                    {
                        GraphControl.SetBarHeight(s, h);
                    }
                    else
                    {
                        GraphControl.SetBarHeight(s, 10);
                    }
                }
                GraphControl.SetIndex(s, Items.IndexOf(s));
            }
        }
        
       
    }
}