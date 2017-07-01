// FileFilter ViewModel
// 2016-12-12   PV  v2 with FolderSets

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FileFilter
{
    class FolderSet : INotifyPropertyChanged
    {
        // INotifyPropertyChanged interface
        public event PropertyChangedEventHandler PropertyChanged;

        public void NotifyPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
        }


        public string Root { get; set; }
        public string CacheFilename { get; set; }


        private DateTime _ScanDate;
        public DateTime ScanDate
        {
            get { return _ScanDate; }
            set
            {
                if (_ScanDate != value)
                {
                    _ScanDate = value;
                    NotifyPropertyChanged(nameof(ScanDate));
                }
            }
        }


        public List<FileNameAndSize> Files;
        public int FilesCount 
        {
            get
            {
                return Files?.Count ?? 0;
            }
        }

    }
}
