// QuickFileFilter class FileNameAndSize
// Very simple container for file name and size
// 2016-12-12   PV  v2 with FolderSets

namespace QuickFileFilter
{
    class FileNameAndSize
    {
        public string Name { get; set; }
        public long Size { get; set; }


        // Better display in ListView, with thousands separators
        public string SizeString => $"{Size:N0}";
    }
}
