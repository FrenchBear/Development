// DIF - Duplicate Image Finder
// 2013-05-25   PV
// 2013-07-21   PV  AddKBCommand
// 2016-04-08   PV  TraceText
// 2017-02-22   PV  ProgressBar for Delete operation; UnselectAll; Double-click on duplicate row

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
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
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        // Commands public interface
        public ICommand HashCommand { get; private set; }
        public ICommand FindDuplicatesCommand { get; private set; }
        public ICommand DeleteSelectedImagesCommand { get; private set; }
        public ICommand UnselectAllCommand { get; private set; }
        public ICommand FolderAddCommand { get; private set; }
        public ICommand FolderRemoveCommand { get; private set; }
        public ICommand FolderAddKBCommand { get; private set; }
        public ICommand FolderMoveUpCommand { get; private set; }
        public ICommand FolderMoveDownCommand { get; private set; }
        public ICommand ShowFileCommand { get; private set; }


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
            UnselectAllCommand = new RelayCommand<object>(UnselectAllExecute, CanUnselectAll);
            FolderAddCommand = new RelayCommand<object>(FolderAddExecute, CanFolderAdd);
            FolderRemoveCommand = new RelayCommand<object>(FolderRemoveExecute, CanFolderRemove);
            FolderAddKBCommand = new RelayCommand<object>(FolderAddKBExecute, CanFolderAdd);
            FolderMoveUpCommand = new RelayCommand<object>(FolderMoveUpExecute, CanFolderMoveUp);
            FolderMoveDownCommand = new RelayCommand<object>(FolderMoveDownExecute, CanFolderMoveDown);
            ShowFileCommand= new RelayCommand<object>(ShowFileExecute);
        }

        // Access to Model and window
        private readonly Model model;
        private readonly MainWindow window;

        private bool isHashInProgress = false;


        // Helpers for Model
        public void RefreshDuplicatesList()
        {
            NotifyPropertyChanged(nameof(DuplicatesList));
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
            NotifyPropertyChanged(nameof(HashProgress));
            NotifyPropertyChanged(nameof(HashProgressValue));

            if (t.Item1 == t.Item2 && HashButtonCaption != "Hash")
            {
                HashButtonCaption = "Hash";
                isHashInProgress = false;
                window.DuplicatesList.Refresh();
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
                    NotifyPropertyChanged(nameof(DuplicatesList));
                    window.DuplicatesList.Refresh();
                }
                FindDuplicatesButtonCaption = "Stop";
                FindDuplicatesProgress = 0.0;
                cts = new CancellationTokenSource();
                IProgress<Tuple<int, int>> progress = new Progress<Tuple<int, int>>(d => UpdateFindDuplicatesProgress(d));
                model.DoFindDuplicates(cts.Token, progress);
            }
            else
            {
                FindDuplicatesButtonCaption = "Find Duplicates";
                cts.Cancel();
            }
        }

        private bool CanFindDuplicates(object parameter)
        {
            return model.processedFilesList != null;    // !isHashInProgress; // && !isFindDuplicatesInProgress;
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
            NotifyPropertyChanged(nameof(FindDuplicatesProgress));
            NotifyPropertyChanged(nameof(FindDuplicatesProgressValue));
        }

        // When model.DoFindDuplicates has finished
        public void FindDuplicatesDone()
        {
            FindDuplicatesButtonCaption = "Find Duplicates";
            NotifyPropertyChanged(nameof(DuplicatesList));
        }



        public void UpdateDeleteProgress(Tuple<int, int> t)
        {
            if (t.Item2 == 0)
            {
                DeleteProgress = 0;
                DeleteProgressValue = "(Nothing to do)";
            }
            else
            {
                DeleteProgress = (100.0 * t.Item1) / t.Item2;
                DeleteProgressValue = string.Format("{0} / {1}", t.Item1, t.Item2);
            }
            NotifyPropertyChanged(nameof(DeleteProgress));
            NotifyPropertyChanged(nameof(DeleteProgressValue));
            window.DeleteProgressGrid.Refresh();
        }


        private void DeleteSelectedImagesExecute(object parameter)
        {
            ClearSelectedImageInfo();
            model.DoDeleteSelectedImages();
            NotifyPropertyChanged(nameof(DuplicatesList));
        }

        private bool CanDeleteSelectedImages(object parameter)
        {
            return !isHashInProgress;
        }


        private bool CanUnselectAll(object obj)
        {
            return DuplicatesList?.Count > 0;
        }

        private void UnselectAllExecute(object obj)
        {
            foreach (HashSet<DuplicateFile> hss in DuplicatesList)
                foreach (DuplicateFile df in hss)
                    df.IsSelected = false;
        }




        private void FolderAddExecute(object parameter)
        {
            var dialog = new System.Windows.Forms.FolderBrowserDialog();
            if (SelectedFolderIndex >= 0)
                dialog.SelectedPath = model.Folders[SelectedFolderIndex];
            System.Windows.Forms.DialogResult result = dialog.ShowDialog();
            if (result == System.Windows.Forms.DialogResult.OK)
                model.AddRootFolder(dialog.SelectedPath);
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
                NotifyPropertyChanged(nameof(SelectedFolderIndex));
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
                NotifyPropertyChanged(nameof(SelectedFolderIndex));
            }
        }

        private bool CanFolderMoveDown(object parameter)
        {
            return SelectedFolderIndex >= 0 && SelectedFolderIndex < model.Folders.Count - 1;
        }


        // On a click on duplicate file hyperlink
        private void ShowFileExecute(object obj)
        {
            if (FilePath?.Length > 0)
            {
                string argument = "/select, \"" + FilePath + "\"";
                Process.Start("explorer.exe", argument);
            }
        }




        // Relay of events
        public void Image_MouseEnter(object sender, MouseEventArgs e)
        {
            if (sender is Image i)
            {
                var s = new Uri(i.Source.ToString()).LocalPath;
                FilePath = s;
                NotifyPropertyChanged(nameof(FilePath));
                FileSize = (new System.IO.FileInfo(s).Length).ToString();
                NotifyPropertyChanged(nameof(FileSize));
                ImageSize = i.Source.Width.ToString() + " x " + i.Source.Height.ToString();
                NotifyPropertyChanged(nameof(ImageSize));
                ImageRealSize = i.Source;
                NotifyPropertyChanged(nameof(ImageRealSize));
            }
        }

        public void ClearSelectedImageInfo()
        {
            FilePath = "";
            NotifyPropertyChanged(nameof(FilePath));
            FileSize = "";
            NotifyPropertyChanged(nameof(FileSize));
            ImageSize = "";
            NotifyPropertyChanged(nameof(ImageSize));
            ImageRealSize = null;
            NotifyPropertyChanged(nameof(ImageRealSize));
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
                    NotifyPropertyChanged(nameof(HashButtonCaption));
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
                    NotifyPropertyChanged(nameof(FindDuplicatesButtonCaption));
                }
            }
        }

        public double HashProgress { get; set; }
        public string HashProgressValue { get; set; }

        public double FindDuplicatesProgress { get; set; }
        public string FindDuplicatesProgressValue { get; set; }

        public double DeleteProgress { get; set; }
        public string DeleteProgressValue { get; set; }


        private string _TraceText;
        public string TraceText
        {
            get { return _TraceText; }
            set
            {
                if (_TraceText != value)
                {
                    _TraceText = value;
                    NotifyPropertyChanged(nameof(TraceText));
                    try
                    {
                        window.TraceTextBox.ScrollToEnd();
                        window.TraceTextBox.Refresh();
                    }
                    catch (Exception)
                    {
                    }
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
                    NotifyPropertyChanged(nameof(SelectedFolderIndex));
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


        public ObservableCollection<HashSet<DuplicateFile>> DuplicatesList
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
                    NotifyPropertyChanged(nameof(Threshold));
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
        private static readonly Action EmptyDelegate = delegate () { };

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
