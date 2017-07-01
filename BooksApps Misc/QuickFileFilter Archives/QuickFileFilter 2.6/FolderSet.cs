// QuickFileFilter ViewModel
// 2016-12-12   PV  v2 with FolderSets

using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace QuickFileFilter
{
    class FolderSet : INotifyPropertyChanged
    {
        // INotifyPropertyChanged interface
        public event PropertyChangedEventHandler PropertyChanged;

        public void NotifyPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
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
        public int FilesCount => Files?.Count ?? 0;
    }
}
