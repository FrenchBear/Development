// DIF - Duplicate Image Finder
// 2013-05-25   PV
// 2013-07-21   PV  AddKBCommand
// 2016-04-08   PV  TraceText

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Threading;

namespace DIF
{
    public class ViewModel : INotifyPropertyChanged
    {
        // INotifyPropertyChanged interface
        public event PropertyChangedEventHandler PropertyChanged;

        public void NotifyPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
        }

        // Commands public interface
        public ICommand HashCommand { get; private set; }
        public ICommand FindDuplicatesCommand { get; private set; }
        public ICommand DeleteSelectedImagesCommand { get; private set; }
        public ICommand FolderAddCommand { get; private set; }
        public ICommand FolderRemoveCommand { get; private set; }
        public ICommand FolderAddKBCommand { get; private set; }
        public ICommand FolderMoveUpCommand { get; private set; }
        public ICommand FolderMoveDownCommand { get; private set; }

        // Constructor
        public ViewModel(Model m, MainWindow w)
        {
            model = m;
            window = w;

            // Binding commands with behavior
            HashCommand = new RelayCommand<object>(HashExecute);
            HashButtonCaption = "Hash";
            FindDuplicatesButtonCaption = "Find Duplicates";
            FindDuplicatesCommand = new RelayCommand<object>(FindDuplicatesExecute, CanFindDuplicates);
            DeleteSelectedImagesCommand = new RelayCommand<object>(DeleteSelectedImagesExecute, CanDeleteSelectedImages);
            FolderAddCommand = new RelayCommand<object>(FolderAddExecute, CanFolderAdd);
            FolderRemoveCommand = new RelayCommand<object>(FolderRemoveExecute, CanFolderRemove);
            FolderAddKBCommand = new RelayCommand<object>(FolderAddKBExecute, CanFolderAdd);
            FolderMoveUpCommand = new RelayCommand<object>(FolderMoveUpExecute, CanFolderMoveUp);
            FolderMoveDownCommand = new RelayCommand<object>(FolderMoveDownExecute, CanFolderMoveDown);
        }

        // Access to Model and window
        private Model model;
        private MainWindow window;

        private bool isHashInProgress = false;
        private bool isFindDuplicatesInProgress = false;


        // Helpers for Model
        public void RefreshDuplicatesList()
        {
            NotifyPropertyChanged("DuplicatesList");
            window.DIFWindow.Refresh();
            System.GC.Collect();
            System.GC.Collect();
        }

        public void ShowLastFolder()
        {
            SelectedFolderIndex = model.Folders.Count - 1;
        }


        // Commands private implementation
        private CancellationTokenSource cts;
        private void HashExecute(object parameter)
        {
            if (HashButtonCaption == "Hash")
            {
                HashButtonCaption = "Stop";
                HashProgress = 0.0;
                isHashInProgress = true;
                cts = new CancellationTokenSource();
                IProgress<Tuple<int, int>> progress = new Progress<Tuple<int, int>>(d => UpdateHashProgress(d));
                model.DoHash(cts.Token, progress);
            }
            else
            {
                HashButtonCaption = "Hash";
                cts.Cancel();
                isHashInProgress = false;
            }
        }

        private void UpdateHashProgress(Tuple<int, int> t)
        {
            if (t.Item2 != 0)
            {
                HashProgress = (100.0 * t.Item1) / t.Item2;
                HashProgressValue = string.Format("{0} / {1}", t.Item1, t.Item2);
            }
            else
            {
                HashProgress = 0;
                HashProgressValue = "(Nothing to do)";
            }
            NotifyPropertyChanged("HashProgress");
            NotifyPropertyChanged("HashProgressValue");

            if (t.Item1 == t.Item2 && HashButtonCaption != "Hash")
            {
                HashButtonCaption = "Hash";
                isHashInProgress = false;
                window.DuplicatesList.Refresh();
                //window.TraceTextBox.Refresh();
                FindDuplicatesExecute(null);
            }
        }

        private void FindDuplicatesExecute(object parameter)
        {
            if (FindDuplicatesButtonCaption == "Find Duplicates")
            {
                // Clear existing list 1st
                if (model.DuplicatesList != null)
                {
                    model.DuplicatesList = null;
                    NotifyPropertyChanged("DuplicatesList");
                    window.DuplicatesList.Refresh();
                }
                FindDuplicatesButtonCaption = "Stop";
                FindDuplicatesProgress = 0.0;
                isFindDuplicatesInProgress = true;
                cts = new CancellationTokenSource();
                IProgress<Tuple<int, int>> progress = new Progress<Tuple<int, int>>(d => UpdateFindDuplicatesProgress(d));
                model.DoFindDuplicates(cts.Token, progress);
            }
            else
            {
                FindDuplicatesButtonCaption = "Find Duplicates";
                cts.Cancel();
                isFindDuplicatesInProgress = false;
            }
        }

        private bool CanFindDuplicates(object parameter)
        {
            return model.processedFilesList!=null;    // !isHashInProgress; // && !isFindDuplicatesInProgress;
        }

        private void UpdateFindDuplicatesProgress(Tuple<int, int> t)
        {
            if (t.Item2 == 0)
            {
                FindDuplicatesProgress = 0;
                FindDuplicatesProgressValue = "(Nothing to do)";
            }
            else
            {
                FindDuplicatesProgress = (100.0 * t.Item1) / t.Item2;
                FindDuplicatesProgressValue = string.Format("{0} / {1}", t.Item1, t.Item2);
            }
            NotifyPropertyChanged("FindDuplicatesProgress");
            NotifyPropertyChanged("FindDuplicatesProgressValue");
        }

        // When model.DoFindDuplicates has finished
        public void FindDuplicatesDone()
        {
            FindDuplicatesButtonCaption = "Find Duplicates";
            isFindDuplicatesInProgress = false;
            NotifyPropertyChanged("DuplicatesList");
        }



        private void DeleteSelectedImagesExecute(object parameter)
        {
            ClearSelectedImageInfo();
            model.DoDeleteSelectedImages();
            NotifyPropertyChanged("DuplicatesList");
        }

        private bool CanDeleteSelectedImages(object parameter)
        {
            return !isHashInProgress;
        }


        private void FolderAddExecute(object parameter)
        {
            var dialog = new System.Windows.Forms.FolderBrowserDialog();
            if (SelectedFolderIndex >= 0)
                dialog.SelectedPath = model.Folders[SelectedFolderIndex];
            System.Windows.Forms.DialogResult result = dialog.ShowDialog();
            if (result == System.Windows.Forms.DialogResult.OK)
                model.AddFolder(dialog.SelectedPath);
        }

        private bool CanFolderAdd(object parameter)
        {
            return !isHashInProgress;
        }


        private void FolderAddKBExecute(object parameter)
        {
            model.AddKBFolders();
        }


        private void FolderRemoveExecute(object parameter)
        {
            if (SelectedFolderIndex >= 0)
                model.Folders.RemoveAt(SelectedFolderIndex);
        }

        private bool CanFolderRemove(object parameter)
        {
            return SelectedFolderIndex >= 0;
        }


        private void FolderMoveUpExecute(object parameter)
        {
            if (SelectedFolderIndex > 0)
            {
                int i = SelectedFolderIndex;
                string s = model.Folders[SelectedFolderIndex];
                model.Folders.RemoveAt(SelectedFolderIndex);
                model.Folders.Insert(i - 1, s);
                SelectedFolderIndex = i - 1;
                NotifyPropertyChanged("SelectedFolderIndex");
            }
        }

        private bool CanFolderMoveUp(object parameter)
        {
            return SelectedFolderIndex > 0;
        }


        private void FolderMoveDownExecute(object parameter)
        {
            if (CanFolderMoveDown(parameter))
            {
                int i = SelectedFolderIndex;
                string s = model.Folders[SelectedFolderIndex];
                model.Folders.RemoveAt(SelectedFolderIndex);
                model.Folders.Insert(i + 1, s);
                SelectedFolderIndex = i + 1;
                NotifyPropertyChanged("SelectedFolderIndex");
            }
        }

        private bool CanFolderMoveDown(object parameter)
        {
            return SelectedFolderIndex >= 0 && SelectedFolderIndex < model.Folders.Count - 1;
        }



        // Relay of events
        public void Image_MouseEnter(object sender, MouseEventArgs e)
        {
            Image i = sender as Image;
            if (i != null)
            {
                var s = new Uri(i.Source.ToString()).LocalPath;
                FilePath = s;
                NotifyPropertyChanged("FilePath");
                FileSize = (new System.IO.FileInfo(s).Length).ToString();
                NotifyPropertyChanged("FileSize");
                ImageSize = i.Source.Width.ToString() + " x " + i.Source.Height.ToString();
                NotifyPropertyChanged("ImageSize");
                ImageRealSize = i.Source;
                NotifyPropertyChanged("ImageRealSize");
            }
        }

        public void ClearSelectedImageInfo()
        {
            FilePath = "";
            NotifyPropertyChanged("FilePath");
            FileSize = "";
            NotifyPropertyChanged("FileSize");
            ImageSize = "";
            NotifyPropertyChanged("ImageSize");
            ImageRealSize = null;
            NotifyPropertyChanged("ImageRealSize");
        }


        // Properties for view binding
        private string hashButtonCaption = "";
        public string HashButtonCaption
        {
            get { return hashButtonCaption; }
            set
            {
                if (value != hashButtonCaption)
                {
                    hashButtonCaption = value;
                    NotifyPropertyChanged("HashButtonCaption");
                }
            }
        }

        private string findDuplicatesButtonCaption = "";
        public string FindDuplicatesButtonCaption
        {
            get { return findDuplicatesButtonCaption; }
            set
            {
                if (value != findDuplicatesButtonCaption)
                {
                    findDuplicatesButtonCaption = value;
                    NotifyPropertyChanged("FindDuplicatesButtonCaption");
                }
            }
        }

        public double HashProgress { get; set; }
        public string HashProgressValue { get; set; }

        public double FindDuplicatesProgress { get; set; }
        public string FindDuplicatesProgressValue { get; set; }

        private string _TraceText;
        public string TraceText
        {
            get { return _TraceText; }
            set
            {
                if (_TraceText != value)
                {
                    _TraceText = value;
                    NotifyPropertyChanged("TraceText");
                }
            }
        }


        private int selectedFolderIndex = -1;
        public int SelectedFolderIndex
        {
            get { return selectedFolderIndex; }
            set
            {
                if (value != selectedFolderIndex)
                {
                    selectedFolderIndex = value;
                    NotifyPropertyChanged("SelectedFolderIndex");
                }
            }
        }


        public ObservableCollection<string> Folders
        {
            get
            {
                return model.Folders;
            }
        }


        public List<HashSet<DuplicateFile>> DuplicatesList
        {
            get
            {
                return model.DuplicatesList;
            }
        }

        public int Threshold
        {
            get { return model.Threshold; }
            set
            {
                if (value != model.Threshold)
                {
                    model.Threshold = value;
                    NotifyPropertyChanged("Threshold");
                    // Launch again dup search                    
                }
            }
        }

        public string FilePath { get; set; }
        public string FileSize { get; set; }
        public string ImageSize { get; set; }
        public ImageSource ImageRealSize { get; set; }



    }

    public static class ExtensionMethods
    {
        private static Action EmptyDelegate = delegate() { };

        // Extension method to force the refresh of a UIElement
        public static void Refresh(this UIElement uiElement)
        {
            // By calling Dispatcher.Invoke, the code essentially asks the system to execute all operations that are Render or higher priority, 
            // thus the control will then render itself (drawing the new content).  Afterwards, it will then execute the provided delegate,
            // which is our empty method.
            uiElement.Dispatcher.Invoke(DispatcherPriority.Render, EmptyDelegate);
        }
    }
}
