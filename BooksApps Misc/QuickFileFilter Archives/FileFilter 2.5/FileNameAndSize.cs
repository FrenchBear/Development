// FileFilter ViewModel
// 2016-12-12   PV  v2 with FolderSets

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FileFilter
{
    class FileNameAndSize
    {
        public string Name { get; set; }
        public long Size { get; set; }


        public string SizeString
        {
            get
            {
                return string.Format("{0:N0}", Size);
            }
        }
    }
}
