using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;


namespace SudokuFX
{
    public partial class Window1 : Window
    {
        public Window1()
        {
            InitializeComponent();
            
        }
        void WindowLoaded(object sender, RoutedEventArgs e)
        {
            TitleReflect.Fill = new VisualBrush(TitleText);
        }
        void NewGameClicked(object sender, RoutedEventArgs e)
        { 
            Board.GameBoard = new Board((int)BoardSize.SelectedItem);
            Board.GameBoard.GenerateGame((int)BoardSize.SelectedItem *2);  
        }
        void QuitClicked(object sender, RoutedEventArgs e)
        {
            this.Close(); 
        }
    }
}