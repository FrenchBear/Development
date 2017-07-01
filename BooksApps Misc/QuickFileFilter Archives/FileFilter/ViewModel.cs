// FileFilter ViewModel
// 2016-09-26   PV
// 2016-09-30   PV  CopyFolderPathCommand and IsolatedStorage cache
// 2016-10-20   PV  Whole Word option

using System;
using System.IO;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Data;
using System.Windows.Input;

namespace FileFilter
{
    class ViewModel : INotifyPropertyChanged
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
        public ICommand ShowFileCommand { get; private set; }


        // Constructor
        public ViewModel(Model m, MainWindow w)
        {
            model = m;
            window = w;

            // Binding commands with behavior
            SearchCommand = new RelayCommand<object>(SearchExecute, CanSearch);
            ClearCommand = new RelayCommand<object>(ClearExecute, CanClear);
            CopyFolderPathCommand = new RelayCommand<object>(CopyFolderPathExecute, CanCopyFolderPath);
            ShowFileCommand = new RelayCommand<object>(ShowFileExecute, CanShowFile);
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

        private bool ElementIsDisplayed(object element)
        {
            return ((string)element).IndexOf(filter) >= 0;
        }

        private void ApplyFilter()
        {
            ICollectionView view = CollectionViewSource.GetDefaultView(model.Files);

            if (filter.Length == 0)
                view.Filter = null;
            else
            {
                view.Filter = ElementIsDisplayed;
                //    if (RegExp || WholeWord)
                //    {
                //        string regExFilter;
                //        if (RegExp)
                //            regExFilter = filter;
                //        else
                //            regExFilter = Regex.Escape(filter);
                //        if (WholeWord)
                //            regExFilter = @"\b" + regExFilter + @"\b";

                //        if (AccentSensitive)
                //        {
                //            try
                //            {
                //                view.Filter = (searched) => Regex.IsMatch((string)searched, regExFilter, CaseSensitive ? 0 : RegexOptions.IgnoreCase);
                //            }
                //            catch (Exception)
                //            {
                //            }
                //        }
                //        else
                //        {
                //            try
                //            {
                //                regExFilter = RemoveDiacritics(regExFilter);
                //                view.Filter = (searched) => Regex.IsMatch(RemoveDiacritics((string)searched), regExFilter, CaseSensitive ? 0 : RegexOptions.IgnoreCase);
                //            }
                //            catch (Exception)
                //            {
                //            }
                //        }
                //    }
                //    else
                //    {
                //        if (AccentSensitive)
                //            view.Filter = (searched) => ((string)searched).IndexOf(filter, CaseSensitive ? StringComparison.CurrentCulture : StringComparison.InvariantCultureIgnoreCase) >= 0;
                //        else
                //            view.Filter = (searched) => RemoveDiacritics((string)searched).IndexOf(RemoveDiacritics(filter), CaseSensitive ? StringComparison.CurrentCulture : StringComparison.InvariantCultureIgnoreCase) >= 0;
                //    }
                }

                NumFiles = window.FilesListBox.Items.Count;
        }

        // For Accent Insensitive comparisons
        static string RemoveDiacritics(string text)
        {
            StringBuilder sb = new StringBuilder();
            foreach (char ch in text.Normalize(NormalizationForm.FormD))
                if (CharUnicodeInfo.GetUnicodeCategory(ch) != UnicodeCategory.NonSpacingMark)
                    sb.Append(ch);

            return sb.ToString().Normalize(NormalizationForm.FormC);
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


        public ObservableCollection<string> Files
        {
            get
            {
                return model.Files;
            }
        }

        internal void NotifyFilesChanged()
        {
            NotifyPropertyChanged(nameof(Files));
            NumFiles = model.Files.Count;
            if (NumFiles>0)
                window.FilterTextBox.Focus();
        }


        private int _NumFiles;
        public int NumFiles
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

        private bool _WholeWord;
        public bool WholeWord
        {
            get { return _WholeWord; }
            set
            {
                if (_WholeWord != value)
                {
                    _WholeWord = value;
                    NotifyPropertyChanged(nameof(WholeWord));
                    ApplyFilter();
                }
            }
        }

        public string SelectedFile { get; set; }


        // Commands

        private async void SearchExecute(object parameter)
        {
            Filter = "Searching, please wait...";
            Idle = false;
            await model.SearchFolder(folder);
            Idle = true;
            Filter = "";
            window.FilterTextBox.Focus();
        }

        private bool CanSearch(object obj)
        {
            return idle;
        }


        private void ClearExecute(object parameter)
        {
            Filter = "";
        }

        private bool CanClear(object obj)
        {
            return idle;
        }

        private void CopyFolderPathExecute(object obj)
        {
            if (SelectedFile!=null)
            {
                System.Windows.Clipboard.Clear();
                System.Windows.Clipboard.SetText(System.IO.Path.GetDirectoryName(SelectedFile));
            }
        }

        private bool CanCopyFolderPath(object obj)
        {
            return idle && SelectedFile != null;
        }



        private void ShowFileExecute(object obj)
        {
            if (SelectedFile != null && File.Exists(SelectedFile))
            {
                string argument = "/select, \"" + SelectedFile + "\"";
                System.Diagnostics.Process.Start("explorer.exe", argument);
            }
        }

        private bool CanShowFile(object obj)
        {
            return idle && SelectedFile != null;
        }


    }
}
