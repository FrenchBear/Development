using System.Windows;
using System.Windows.Controls;

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

            DataContext = TypeHelper.GetDependencyProperties<Button>(new Button());
        }
    }
}