﻿// DataTemplates Mini PropertyGrid
// From http://www.wpftutorial.net/datatemplates.html
// 2012-04-23 PV    Added EnumValueToStringConverter so that ComboBoxes get cound to correct current value

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DataTemplates
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        public Window1()
        {
            InitializeComponent();

            DataContext = TypeHelper.GetDependencyProperties<Button>( new Button());
        }
    }


}
