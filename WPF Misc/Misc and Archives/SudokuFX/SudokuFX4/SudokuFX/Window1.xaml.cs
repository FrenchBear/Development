using System;
using System.Windows;
using System.IO; 
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Collections.Generic;
using System.Reflection;
using System.Security;
using System.Security.Permissions;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using System.Windows.Media.Animation;         
using Microsoft.Win32;

namespace SudokuFX
{
    public partial class Window1 : Window
    {
        ISudokuSolver Solver;

        public Window1()
        {
            InitializeComponent();
            
        }
        void TimerDone(object sender, EventArgs e)
        {
            TimerControls.Opacity = 0.25;
            TimerControls.IsEnabled = false;
            StopwatchControl.IsChecked = false; 
            if (Board.GameBoard.IsFull && Board.GameBoard.IsValid)
            {
                MessageBox.Show("You win!");
            }
            else
            {
                MessageBox.Show("You ran out of time! Better luck next time.");  
            }
        }
        void WindowLoaded(object sender, RoutedEventArgs e)
        {
            TitleReflect.Fill = new VisualBrush(TitleText);
            Solver = LoadSolver("SampleSolver.dll");
            TimerControls.IsEnabled = false;
            TimerControls.Opacity = 0.25; 
            //NewGameClicked(null, null);

            //DoubleAnimation da = new DoubleAnimation(0, 1, new Duration(TimeSpan.FromSeconds(5)));
            //da.RepeatBehavior = RepeatBehavior.Forever;  
            //StopwatchControl.BeginAnimation(Stopwatch.CurrentTimeProperty, da);
            
            
        }
        void PauseTimer(object sender, RoutedEventArgs e)
        {
            Storyboard s = this.Resources["TimerAnimation"] as Storyboard;
            s.Pause(this);
            Board.IsEnabled = false; 
        }
        void ResumeTimer(object sender, RoutedEventArgs e)
        {
            Storyboard s = this.Resources["TimerAnimation"] as Storyboard;
            s.Resume(this);
            Board.IsEnabled = true; 
        }
        void NewGameClicked(object sender, RoutedEventArgs e)
        { 
            Board.GameBoard = new Board((int)BoardSize.SelectedItem);
            
            if (FastGenRadio.IsChecked == true)
            {
                Board.GameBoard.GenerateGame((int)BoardSize.SelectedItem * 2);
            }
            else
            {
                Board.GameBoard.GenerateGameUsingSolver(Solver, (int)BoardSize.SelectedItem * 2);
            }
            Board.GameBoard.PropertyChanged += new System.ComponentModel.PropertyChangedEventHandler(GameBoard_PropertyChanged);  

            Storyboard s = this.Resources["TimerAnimation"] as Storyboard;
            s.Stop(this);
                      
            if (NoTimerRadio.IsChecked == true)
            {
                MinNumber.Tag = 59;
                SecNumber.Tag = 59;
                SubSecNumber.Tag = 59; 
                TimerControls.Opacity = 0.25;
                TimerControls.IsEnabled = false;
                StopwatchControl.IsChecked = false; 
               
            }
            else 
            {
                Int32 length;
                if (EasyTimerRadio.IsChecked == true)
                {
                    length = 15;
                }
                else if (MediumTimerRadio.IsChecked == true)
                {
                    length = 10;
                }
                else
                {
                    length = 5;
                }
                //s.CutoffTime = TimeSpan.FromMinutes(length);
                s.Children[0].Duration = new Duration(TimeSpan.FromMinutes(length));
                s.Children[1].Duration = new Duration(TimeSpan.FromMinutes(length));
                s.Children[2].RepeatBehavior = new RepeatBehavior(TimeSpan.FromMinutes(length));
                s.Children[3].RepeatBehavior = new RepeatBehavior(TimeSpan.FromMinutes(length));
                ((Int32Animation)s.Children[1]).From = length - 1;
                StopwatchControl.IsChecked = true; 
                MinNumber.Tag = length-1;
                TimerControls.Opacity = 1;
                TimerControls.IsEnabled = true;
                s.Begin(this,true); 
                
            }

            Board.IsEnabled = true;
        }

        void GameBoard_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            if (e.PropertyName == "IsFull")
            {
                if (Board.GameBoard.IsFull && Board.GameBoard.IsValid)
                {
                    this.TimerDone(null, null);
                }
            }
        }
        void SaveGameClicked(object sender, RoutedEventArgs e)
        {
            if (TimerControls.IsEnabled)
            {
                MessageBox.Show("Hey! You can't save a timed game!");
                return;
            }
            SaveFileDialog sfd = new SaveFileDialog();
            sfd.OverwritePrompt = true;
            sfd.Filter = "Sudoku Save Files (*.sudoku)|*.sudoku";
            sfd.Title = "Select a File to Save to";
            sfd.ValidateNames = true;
            sfd.FileName = "SavedGame.sudoku";
            if (sfd.ShowDialog(this) == true)
            {
                Stream s = new FileStream(sfd.SafeFileName, FileMode.Create);
                IFormatter f = new BinaryFormatter();
                f.Serialize(s, Board.GameBoard.ToArray());
                s.Close();
            }
           
        }
        void LoadGameClicked(object sender, RoutedEventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            
            ofd.Filter = "Sudoku Save Files (*.sudoku)|*.sudoku";
            ofd.Title = "Select a File to Open";
            ofd.ValidateNames = true;
            ofd.FileName = "SavedGame.sudoku";

            if (ofd.ShowDialog(this) == true)
            {
                Stream s = null;
                try
                {

                   s = new FileStream(ofd.SafeFileName, FileMode.Open);
                }
                catch (IOException)
                {
                    MessageBox.Show("The saved game file you have selected cannot be opened");
                    return;
                }

                IFormatter f = new BinaryFormatter();
                int?[,] a = f.Deserialize(s) as int?[,];
                Board.GameBoard = new Board(a.GetLength(0));
                Board.GameBoard.FromArray(a);
                Board.IsEnabled = true;
                Storyboard sb = this.Resources["TimerAnimation"] as Storyboard;
                sb.Stop(this); 
                MinNumber.Tag = 59;
                SecNumber.Tag = 59;
                SubSecNumber.Tag = 59;
                TimerControls.Opacity = 0.25;
                TimerControls.IsEnabled = false;
                StopwatchControl.IsChecked = false; 

                s.Close();
            }
        }
        void SolveClicked(object sender, RoutedEventArgs e)
        {
            Board.IsEnabled = true;
            Storyboard sb = this.Resources["TimerAnimation"] as Storyboard;
            sb.Stop(this);
            MinNumber.Tag = 59;
            SecNumber.Tag = 59;
            SubSecNumber.Tag = 59;
            TimerControls.Opacity = 0.25;
            TimerControls.IsEnabled = false;
            StopwatchControl.IsChecked = false; 

            int?[,] a = Board.GameBoard.ToArray();
            if (!Solver.Solve(ref a))
            {
                MessageBox.Show("No Solution!");
            }
            else
            {
                Board.GameBoard.FromArray(a);   
            }
        }
        AppDomain ad = null;
        ISudokuSolver LoadSolver(string path)
        {
            if (ad == null)
            {
                AppDomainSetup ads = new AppDomainSetup();

                ads.ApplicationBase = AppDomain.CurrentDomain.BaseDirectory;
                PermissionSet ps = new PermissionSet(null);
                ps.AddPermission(new SecurityPermission(SecurityPermissionFlag.Execution));
                ad = AppDomain.CreateDomain("New AD", null, ads, ps);
            }

            FileStream stream = new FileStream(path,FileMode.Open,FileAccess.Read);     
            byte[] assemblyData = new byte[stream.Length];   
            stream.Read(assemblyData,0,(int)stream.Length);

            Assembly asm = ad.Load(assemblyData); 

            Type[] ts = asm.GetTypes();
            foreach (Type t in ts)
            {
                if (Array.IndexOf(t.GetInterfaces(),typeof(ISudokuSolver)) != -1)
                {
                    Type containter = typeof(SudokuSolverContainer);
                    SudokuSolverContainer ssc = ad.CreateInstanceAndUnwrap(containter.Assembly.FullName, containter.FullName) as SudokuSolverContainer;
                    ssc.Init(t);
                    return ssc;
                }
            }
            return null;

        }
        void QuitClicked(object sender, RoutedEventArgs e)
        {
            this.Close(); 
        }
    }
}