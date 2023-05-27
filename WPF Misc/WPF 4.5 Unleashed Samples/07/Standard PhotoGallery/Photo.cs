using System;
using System.IO;

namespace PhotoGallery
{
    public class Photo
    {
        readonly string name;
        readonly DateTime dateTime;
        readonly string size;
        readonly string path;

        public Photo(string filename)
        {
            var info = new FileInfo(filename);
            size = (info.Length / 1024).ToString("N0") + " KB";
            dateTime = info.LastWriteTime;
            name = info.Name;
            path = info.DirectoryName;
        }

        public string Name => name;

        public DateTime DateTime => dateTime;

        public string Size => size;

        public string Path => path;

        public string FullPath => System.IO.Path.Combine(Path, Name);

        public override string ToString() => FullPath;
    }
}
