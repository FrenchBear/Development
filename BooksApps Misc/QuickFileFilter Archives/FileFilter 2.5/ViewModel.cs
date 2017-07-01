// FileFilter ViewModel
// 2016-09-26   PV
// 2016-09-30   PV  CopyFolderPathCommand and IsolatedStorage cache
// 2016-10-20   PV  Whole Word option
// 2016-12-12   PV  v2 with FolderSets
// 2016-12-29   PV  v2.2 Show total size of a multiple selection of files; Targets .Net 4.6.2 for Very Long Paths
// 2017-01-01   PV  v2.5.1 Complete filter parsing moved to FilterPredicateBuilder class
// 2017-01-02   PV  v2.5.2 Validation of Folder and Regex

using System;
using System.IO;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Text;
using System.Windows.Data;
using System.Windows.Input;
using System.Text.RegularExpressions;

namespace FileFilter
{
    class ViewModel : INotifyPropertyChanged, IDataErrorInfo
    {
        // Access to Model and window
        private Model model;
        private MainWindow window;


        // INotifyPropertyChanged interface
        public event PropertyChangedEventHandler PropertyChanged;

        public void NotifyPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
        }

        // Commands public interface
        public ICommand SearchCommand { get; private set; }
        public ICommand ClearCommand { get; private set; }
        public ICommand CopyFolderPathCommand { get; private set; }
        public ICommand CopyFilePathCommand { get; private set; }
        public ICommand ShowFolderCommand { get; private set; }
        public ICommand ShowFileCommand { get; private set; }
        public ICommand RemoveFolderSetCommand { get; private set; }


        // Constructor
        public ViewModel(Model m, MainWindow w)
        {
            model = m;
            window = w;

            // Binding commands with behavior
            SearchCommand = new RelayCommand<object>(SearchExecute, CanSearch);
            ClearCommand = new RelayCommand<object>(ClearExecute, CanClear);
            CopyFolderPathCommand = new RelayCommand<object>(CopyFolderPathExecute, CanCopyFolderPath);
            CopyFilePathCommand = new RelayCommand<object>(CopyFilePathExecute, CanCopyFilePath);
            ShowFolderCommand = new RelayCommand<object>(ShowFolderExecute, CanShowFolder);
            ShowFileCommand = new RelayCommand<object>(ShowFileExecute, CanShowFile);
            RemoveFolderSetCommand = new RelayCommand<object>(RemoveFolderSet, CanRemoveFolderSet);
        }



        // Binding variables
        private string filter;
        public string Filter
        {
            get { return filter; }
            set
            {
                filter = value;
                NotifyPropertyChanged(nameof(Filter));
                window.SearchButton.IsDefault = false;
                ApplyFilter();
            }
        }

        //private bool isShiftPressed()
        //{
        //    return System.Windows.Input.Keyboard.IsKeyDown(Key.LeftShift) ||
        //           System.Windows.Input.Keyboard.IsKeyDown(Key.RightShift);
        //}

        private void ApplyFilter()
        {
            ListCollectionView view = CollectionViewSource.GetDefaultView(files) as ListCollectionView;

            if (filter == null || filter.Length == 0)
                view.Filter = null;
            else
            {
                // Create a new instance of FilterPredicateBuilder that prepares suitable predicate
                var fpb = new FilterPredicateBuilder(filter, AccentSensitive, CaseSensitive, RegExp, WholeWords);
                view.Filter = fpb.GetFilter;
            }

            if (view.Count == files.Count)
                NumFiles = $"{view.Count}";
            else
                NumFiles = $"{view.Count} / {files.Count}";
        }


        private string folder = "";
        public string Folder
        {
            get { return folder; }
            set
            {
                folder = value;
                NotifyPropertyChanged(nameof(Folder));
                window.SearchButton.IsDefault = true;
            }
        }


        private bool idle = true;
        public bool Idle
        {
            get { return idle; }
            set
            {
                if (idle != value)
                {
                    idle = value;
                    NotifyPropertyChanged(nameof(Idle));
                }
            }
        }

        // List of files to filter
        private ObservableCollection<FileNameAndSize> files = new ObservableCollection<FileNameAndSize>();
        public ObservableCollection<FileNameAndSize> Files
        {
            get
            {
                return files;
            }
        }

        public void SetFiles(List<FileNameAndSize> fnsList)
        {
            files.Clear();
            if (fnsList != null)
                foreach (FileNameAndSize fns in fnsList)
                    files.Add(fns);
            NotifyPropertyChanged(nameof(Files));
            ApplyFilter();
        }


        // Folder sets
        public ObservableCollection<FolderSet> FolderSets
        {
            get
            {
                return model.FolderSets;
            }
        }

        private FolderSet selectedFolderSet;
        public FolderSet SelectedFolderSet
        {
            get
            {
                return selectedFolderSet;
            }
            set
            {
                selectedFolderSet = value;
                NotifyPropertyChanged(nameof(SelectedFolderSet));
                if (selectedFolderSet == null)
                {
                    Folder = "";
                    SetFiles(null);
                }
                else
                {
                    model.LoadFiles(value);

                    Folder = selectedFolderSet.Root;
                    SetFiles(selectedFolderSet.Files);
                    window.FilterTextBox.Focus();
                    model.MemorizeSelectedFolderSet(selectedFolderSet);
                }
            }
        }


        private string _NumFiles;
        public string NumFiles
        {
            get { return _NumFiles; }
            set
            {
                if (_NumFiles != value)
                {
                    _NumFiles = value;
                    NotifyPropertyChanged(nameof(NumFiles));
                }
            }
        }


        private string _SelectionSize;
        public string SelectionSize
        {
            get { return _SelectionSize; }
            set
            {
                if (_SelectionSize != value)
                {
                    _SelectionSize = value;
                    NotifyPropertyChanged(nameof(SelectionSize));
                }
            }
        }



        private bool _CaseSensitive;
        public bool CaseSensitive
        {
            get { return _CaseSensitive; }
            set
            {
                if (_CaseSensitive != value)
                {
                    _CaseSensitive = value;
                    NotifyPropertyChanged(nameof(CaseSensitive));
                    ApplyFilter();
                }
            }
        }

        private bool _AccentSensitive;
        public bool AccentSensitive
        {
            get { return _AccentSensitive; }
            set
            {
                if (_AccentSensitive != value)
                {
                    _AccentSensitive = value;
                    NotifyPropertyChanged(nameof(AccentSensitive));
                    ApplyFilter();
                }
            }
        }

        private bool _RegExp;
        public bool RegExp
        {
            get { return _RegExp; }
            set
            {
                if (_RegExp != value)
                {
                    _RegExp = value;
                    NotifyPropertyChanged(nameof(RegExp));
                    ApplyFilter();
                }
            }
        }

        private bool _WholeWords;
        public bool WholeWords
        {
            get { return _WholeWords; }
            set
            {
                if (_WholeWords != value)
                {
                    _WholeWords = value;
                    NotifyPropertyChanged(nameof(WholeWords));
                    ApplyFilter();
                }
            }
        }

        private FileNameAndSize _SelectedFile;
        public FileNameAndSize SelectedFile
        {
            get { return _SelectedFile; }
            set
            {
                if (_SelectedFile != value)
                {
                    _SelectedFile = value;
                    NotifyPropertyChanged(nameof(SelectedFile));
                }
            }
        }


        public List<object> SelectedItems { get; set; }



        // IDataErrorInfo interface
        public string Error
        {
            get
            {
                return this["Folder"] + this["Filter"];
            }
        }

        public string this[string columnName]
        {
            get
            {
                switch (columnName)
                {
                    case "Folder":
                        if (!string.IsNullOrEmpty(Folder) && !Directory.Exists(Folder))
                            return "Inexistent or inaccessible folder";
                        break;

                    case "Filter":
                        if (RegExp && !string.IsNullOrEmpty(Filter) && Filter != "-")
                        {
                            string r;
                            if (Filter.StartsWith("-"))
                                r = Filter.Substring(1);
                            else
                                r = filter;

                            bool isValid = false;
                            try
                            {
                                var re = new Regex(r);
                                isValid = true;
                            }
                            catch (Exception)
                            {
                            }
                            if (!isValid)
                                return "Invalid Regular Expression";
                        }
                        break;
                }
                return string.Empty;
            }
        }


        // Commands

        private bool CanSearch(object obj)
        {
            return idle && Folder.Length > 0;
        }

        private async void SearchExecute(object parameter)
        {
            Filter = "Searching, please wait...";
            NumFiles = "(searching)";
            Idle = false;
            int saveIndex = window.FolderSetsListView.SelectedIndex;
            window.FolderSetsListView.IsEnabled = false;
            await model.SearchFolder(folder);
            window.FolderSetsListView.IsEnabled = true;
            window.FolderSetsListView.SelectedIndex = saveIndex;
            Idle = true;
            Filter = "";

            // Force reevaluation of all commandbinding
            CommandManager.InvalidateRequerySuggested();
        }



        private bool CanClear(object obj)
        {
            // Because of delayed binding, Filter actual content is inaccurate when this function is called
            // return idle && Filter != null && Filter.Length > 0;

            // Use information directly from TextBox instead
            return idle && window.FilterTextBox.Text.Length > 0;
        }

        private void ClearExecute(object parameter)
        {
            Filter = "";
        }


        private bool CanCopyFolderPath(object obj)
        {
            if (window.FilesListView.SelectedItems.Count > 1)
            {
                long totalSize = 0;
                foreach (FileNameAndSize fns in window.FilesListView.SelectedItems)
                    totalSize += fns.Size;
                string totalSizeString;
                if (totalSize < 1024L)
                    totalSizeString = totalSize.ToString() + " B";
                else if (totalSize < 1024L * 1024L)
                    totalSizeString = ((long)((totalSize + 1023L) / 1024L)).ToString("N0") + " KB";
                else
                    totalSizeString = ((long)((totalSize / 1024L + 1023L) / 1024L)).ToString("N0") + " MB";
                SelectionSize = $"{window.FilesListView.SelectedItems.Count} files selected, " + totalSizeString;
            }
            else
                SelectionSize = "";

            return idle && SelectedFile != null;
        }

        private void CopyFolderPathExecute(object obj)
        {
            if (SelectedFile != null)
            {
                var pathsSet = new HashSet<string>();
                var sb = new StringBuilder();
                foreach (FileNameAndSize fns in window.FilesListView.SelectedItems)
                {
                    string path = Path.GetDirectoryName(fns.Name);
                    if (!pathsSet.Contains(path))
                    {
                        pathsSet.Add(path);
                        sb.AppendLine(path);
                    }
                }
                System.Windows.Clipboard.Clear();
                System.Windows.Clipboard.SetText(sb.ToString());
            }
        }



        private bool CanCopyFilePath(object obj)
        {
            return idle && SelectedFile != null;
        }

        // With Shift, copies all file paths
        private void CopyFilePathExecute(object obj)
        {
            if (SelectedFile != null)
            {
                var sb = new StringBuilder();
                foreach (FileNameAndSize fns in window.FilesListView.SelectedItems)
                    sb.AppendLine(fns.Name);
                System.Windows.Clipboard.Clear();
                System.Windows.Clipboard.SetText(sb.ToString());
            }
        }


        private bool CanShowFolder(object obj)
        {
            return idle
                && SelectedFile != null
                && Directory.Exists(Path.GetDirectoryName(SelectedFile.Name))
                && window.FilesListView.SelectedItems.Count == 1;
        }

        private void ShowFolderExecute(object obj)
        {
            if (SelectedFile != null && Directory.Exists(Path.GetDirectoryName(SelectedFile.Name)))
            {
                string argument = "/select, \"" + Path.GetDirectoryName(SelectedFile.Name) + "\"";
                System.Diagnostics.Process.Start("explorer.exe", argument);
            }
        }




        private bool CanShowFile(object obj)
        {
            return idle
                && SelectedFile != null
                && File.Exists(SelectedFile.Name)
                && window.FilesListView.SelectedItems.Count == 1;
        }

        private void ShowFileExecute(object obj)
        {
            if (SelectedFile != null && File.Exists(SelectedFile.Name))
            {
                string argument = "/select, \"" + SelectedFile.Name + "\"";
                System.Diagnostics.Process.Start("explorer.exe", argument);
            }
        }



        private bool CanRemoveFolderSet(object obj)
        {
            return idle && (SelectedFolderSet != null);
        }

        private void RemoveFolderSet(object obj)
        {
            if (SelectedFolderSet != null)
            {
                model.RemoveFolderSet(SelectedFolderSet.Root);
            }
        }


    }
}
