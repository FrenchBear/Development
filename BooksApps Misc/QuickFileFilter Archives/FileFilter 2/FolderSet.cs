// FileFilter ViewModel
// 2016-12-12   PV  v2 with FolderSets

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FileFilter
{
    class FolderSet
    {
        public string Root { get; set; }
        public List<FileNameAndSize> Files;
    }
}
