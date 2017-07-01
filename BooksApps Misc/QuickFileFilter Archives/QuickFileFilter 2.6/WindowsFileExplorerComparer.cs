// WindowsFileExplorerComparer class
// Sorts string in a similar way to Windows File Explorer
// From http://stackoverflow.com/questions/3099581/sorting-an-array-of-folder-names-like-windows-explorer-numerically-and-alphabet
// 2016-09-30   PV
// 2016-12-11   PV  Declaration of StrCmpLogicalW moved to NativeMethods static class for compliance with MS code analysis recommendations

using System.Collections.Generic;
using static QuickFileFilter.NativeMethods;


namespace QuickFileFilter
{
    internal class WindowsFileExplorerComparer : IComparer<string>
    {
        public int Compare(string x, string y)
        {
            return StrCmpLogicalW(x, y);
        }
    }
}

