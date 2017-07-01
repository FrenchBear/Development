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
        public SudokuBoard()
        {
            InitializeComponent();
            this.GameBoard = new Board(9);
            this.GameBoard.GenerateGame(18);  
        }
    }
}