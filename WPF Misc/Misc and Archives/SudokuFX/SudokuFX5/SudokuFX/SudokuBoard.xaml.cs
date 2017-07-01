using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SudokuFX
{
    /// <summary>
    /// Interaction logic for SudokuBoard.xaml
    /// </summary>

    public partial class SudokuBoard : UserControl
    {
        public Board GameBoard
        {
            get
            {
                return MainList.DataContext as Board;  
            }
            set
            {
                MainList.DataContext = value; 
            }
        }
        protected override Size ArrangeOverride(Size arrangeBounds)
        {
            Size sz = new Size(Math.Min(arrangeBounds.Width, arrangeBounds.Height), Math.Min(arrangeBounds.Width, arrangeBounds.Height));
            return base.ArrangeOverride(sz);
        }
        public SudokuBoard()
        {
            InitializeComponent();
            this.IsEnabled = false;
            GameBoard = new Board(9);
        }
    }
}