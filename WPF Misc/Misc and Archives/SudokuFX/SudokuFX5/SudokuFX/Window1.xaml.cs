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
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace SudokuFX
{
    public partial class Window1 : Window
    {
        ObservableCollection<ISudokuSolver> Solvers = new ObservableCollection<ISudokuSolver>();
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
                ShowMessage("You win!");
            }
            else
            {
                ShowMessage("You ran out of time! Better luck next time.");  
            }
        }
        
        void WindowLoaded(object sender, RoutedEventArgs e)
        {
            
            TitleReflect.Fill = new VisualBrush(TitleText);
            string[] plugins = Directory.GetFiles("Solvers\\","*.dll");
            foreach (string p in plugins)
            {
                LoadSolvers(p);
            }

            SolverList.ItemsSource = Solvers;

            TimerControls.IsEnabled = false;
            TimerControls.Opacity = 0.25;

            Graph.SelectionChanged += new SelectionChangedEventHandler(this.PluginListSelectionChanged);

            BenchButton.IsEnabled = false;
            SolverGenRadio.IsEnabled = false;
            FastGenRadio.IsChecked = true;
            SolverGenRadio.IsChecked = false;
            SolveButton.IsEnabled = false;
            
            
        }
        BackgroundWorker solverWorker;

        void BenchmarkClick(object sender, RoutedEventArgs e)
        {
            SolverResult s = new SolverResult();
            s.Solver = SolverList.SelectedItem as ISudokuSolver;
            int?[,] arr = Board.GameBoard.ToArray();
            BenchButton.IsEnabled = false;
            InfoPanel.Visibility = Visibility.Hidden;
            WaitPanel.Visibility = Visibility.Visible;
            long tick = DateTime.Now.Ticks;
            
            solverWorker = new BackgroundWorker();
            
            solverWorker.DoWork += new DoWorkEventHandler(delegate(object dwsender, DoWorkEventArgs dwe)
            {
                s.Failed = !s.Solver.Solve(ref arr);
                s.TimeTaken = TimeSpan.FromTicks((DateTime.Now.Ticks - tick));
            });
            solverWorker.RunWorkerCompleted += new RunWorkerCompletedEventHandler(delegate(object rwcsender, RunWorkerCompletedEventArgs rwce)
            {
                Graph.Items.Add(s);
                InfoPanel.Visibility = Visibility.Visible;
                WaitPanel.Visibility = Visibility.Hidden;
                BenchButton.IsEnabled = true;
            });
            solverWorker.RunWorkerAsync();
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
            Storyboard s = this.Resources["TimerAnimation"] as Storyboard;

            if (FastGenRadio.IsChecked == true)
            {
                Board.GameBoard.GenerateGame((int)BoardSize.SelectedItem * 2);
                Board.GameBoard.PropertyChanged += new System.ComponentModel.PropertyChangedEventHandler(GameBoard_PropertyChanged);  
            }
            else
            {
                Board b = Board.GameBoard;
                int givens = (int)BoardSize.SelectedItem * 2;
                ISudokuSolver sol = SolverList.SelectedItem as ISudokuSolver;
                solverWorker = new BackgroundWorker();
                ShowWait();
                solverWorker.DoWork += new DoWorkEventHandler(delegate(object dwsender, DoWorkEventArgs dwe)
                {
                    b.GenerateGameUsingSolver(sol, givens);
                });
                solverWorker.RunWorkerCompleted += new RunWorkerCompletedEventHandler(delegate(object rwcsender, RunWorkerCompletedEventArgs rwce)
                {
                    MessageLayer.IsEnabled = false;
                    s.Begin(this, true);
                    Board.GameBoard.PropertyChanged += new System.ComponentModel.PropertyChangedEventHandler(GameBoard_PropertyChanged);  
                });
                solverWorker.RunWorkerAsync();
            }
            
            

            
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
                if (FastGenRadio.IsChecked == true) s.Begin(this,true); 
                
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
                ShowMessage("Hey! You can't save a timed game!");
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
                    ShowMessage("The saved game file you have selected cannot be opened");
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
            ISudokuSolver sol = SolverList.SelectedItem as ISudokuSolver;
            Board.IsEnabled = true;
            Storyboard sb = this.Resources["TimerAnimation"] as Storyboard;
            sb.Stop(this);
            MinNumber.Tag = 59;
            SecNumber.Tag = 59;
            SubSecNumber.Tag = 59;
            TimerControls.Opacity = 0.25;
            TimerControls.IsEnabled = false;
            StopwatchControl.IsChecked = false;
            ShowWait();
            
            int?[,] a = Board.GameBoard.ToArray();
            bool solved = false;

            solverWorker = new BackgroundWorker();

            solverWorker.DoWork += new DoWorkEventHandler(delegate(object dwsender, DoWorkEventArgs dwe)
            {
                solved = sol.Solve(ref a);
            });
            solverWorker.RunWorkerCompleted += new RunWorkerCompletedEventHandler(delegate(object rwcsender, RunWorkerCompletedEventArgs rwce)
            {
                MessageLayer.IsEnabled = false;
                if (!solved)
                {
                    ShowMessage("No Solution!");
                }
                else
                {
                    Board.GameBoard.FromArray(a);
                }
            });
            solverWorker.RunWorkerAsync();

           
          
        }
        AppDomain SolverDomain = null;
        void LoadSolvers(string path)
        {
            if (SolverDomain == null)
            {
                AppDomainSetup ads = new AppDomainSetup();

                ads.ApplicationBase = AppDomain.CurrentDomain.BaseDirectory + "\\Solvers";
                ads.PrivateBinPath = System.IO.Path.GetDirectoryName(System.IO.Path.GetFullPath(path));

                PermissionSet ps = new PermissionSet(null);
                ps.AddPermission(new SecurityPermission(SecurityPermissionFlag.Execution));

                SolverDomain = AppDomain.CreateDomain("New AD", null, ads, ps);
            }

            FileStream stream = new FileStream(path,FileMode.Open,FileAccess.Read);     
            byte[] assemblyData = new byte[stream.Length];   
            stream.Read(assemblyData,0,(int)stream.Length);

            Assembly asm = SolverDomain.Load(assemblyData); 

            Type[] ts = asm.GetTypes();
            foreach (Type t in ts)
            {
                if (Array.IndexOf(t.GetInterfaces(),typeof(ISudokuSolver)) != -1)
                {
                    Type container = typeof(SudokuSolverContainer);
                    SudokuSolverContainer ssc = SolverDomain.CreateInstanceAndUnwrap(container.Assembly.FullName, container.FullName) as SudokuSolverContainer;
                    ssc.Init(t);
                    Solvers.Add(ssc);
                }
            }
        }
        public void PluginListSelectionChanged(object sender, RoutedEventArgs e)
        {
            if (SolverList.SelectedItem == null)
            {
                BenchButton.IsEnabled = false;
                SolverGenRadio.IsEnabled = false;
                FastGenRadio.IsChecked = true;
                SolverGenRadio.IsChecked = false;
                SolveButton.IsEnabled = false;
            }
            else
            {
                BenchButton.IsEnabled = true;
                SolverGenRadio.IsEnabled = true;
                SolveButton.IsEnabled = true;
            }
            if (Graph.SelectedItem == null) return;
            if (sender == Graph)
            {
                SolverList.SelectedItem = ((SolverResult)Graph.SelectedItem).Solver;
            }
            else if (sender == SolverList)
            {
                if (((SolverResult)Graph.SelectedItem).Solver != SolverList.SelectedItem)
                {
                    foreach (SolverResult s in Graph.Items)
                    {
                        if (s.Solver == SolverList.SelectedItem)
                        {
                            Graph.SelectedItem = s;
                            return;
                        }
                    }
                }
            }
        }
        void ClearGraphClicked(object sender, RoutedEventArgs e)
        {
            Graph.Items.Clear();
        }
        void ShowMessage(string m)
        {
            MessageText.Text = m;
            MessageExpander.Visibility = Visibility.Visible;
            WaitExpander.Visibility = Visibility.Hidden;
            MessageLayer.IsEnabled = true;
        }
        void ShowWait()
        {
            MessageExpander.Visibility = Visibility.Hidden;
            WaitExpander.Visibility = Visibility.Visible;
            MessageLayer.IsEnabled = true;
        }
        void MessageClosed(object sender, RoutedEventArgs e)
        {
            MessageLayer.IsEnabled = false;
        }
        void QuitClicked(object sender, RoutedEventArgs e)
        {
            this.Close(); 
        }
    }
}