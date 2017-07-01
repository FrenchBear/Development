// FileFilter Model
// 2016-09-26   PV
// 2016-09-30   PV  CopyFolderPathCommand and IsolatedStorage cache
// 2016-12-12   PV  v2, multiple folders sets and store FileInfo instead of just path

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.IO.IsolatedStorage;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace FileFilter
{
    class Model
    {
        // ViewModel
        private ViewModel vm;

        // List of roots and files
        public ObservableCollection<FolderSet> FolderSets;

        public void SetViewModel(ViewModel vm)
        {
            this.vm = vm;
            FolderSets = new ObservableCollection<FolderSet>();

            // Read cache
            IsolatedStorageFile f = IsolatedStorageFile.GetUserStoreForAssembly();
            try
            {
                // Original code, causing warning CA2202 during code analysis
                // Warning	CA2202	Object 'stream' can be disposed more than once in method 'Model.SetViewModel(ViewModel)'. To avoid generating a System.ObjectDisposedException you should not call Dispose more than one time on an object.
                // Fix according to warning help page...
                //using (IsolatedStorageFileStream stream = new IsolatedStorageFileStream("cache.dat", FileMode.Open, f))
                //using (StreamReader reader = new StreamReader(stream))
                //{
                //    string version = reader.ReadLine();
                //    if (version != "1") Debugger.Break();
                //    vm.Folder = reader.ReadLine();
                //    for(;;)
                //    {
                //        string line = reader.ReadLine();
                //        if (line == null)
                //            break;
                //        Files.Add(line);
                //    }
                //}

                IsolatedStorageFileStream stream = null;
                try
                {
                    stream = new IsolatedStorageFileStream("cache.dat", FileMode.Open, f);
                    using (StreamReader reader = new StreamReader(stream))
                    {
                        stream = null;
                        string version = reader.ReadLine();
                        if (version != "2") Debugger.Break();
                        while (!reader.EndOfStream)
                        {
                            string root = reader.ReadLine();
                            var files = new List<FileNameAndSize>();
                            FolderSets.Add(new FolderSet { Root = root, Files = files });
                            for (;;)
                            {
                                string name = reader.ReadLine();
                                if (name.Length == 0)
                                    break;
                                string line = reader.ReadLine();
                                files.Add(new FileNameAndSize { Name = name, Size = long.Parse(line) });
                            }
                        }
                    }
                }
                finally
                {
                    if (stream != null)
                        stream.Dispose();
                }

                // Reposition on last selected FolderSet, memorized in selection.dat
                FolderSet def = null;
                try
                {
                    stream = new IsolatedStorageFileStream("selection.dat", FileMode.Open, f);
                    using (StreamReader reader = new StreamReader(stream))
                    {
                        stream = null;
                        string version = reader.ReadLine();
                        if (version != "2") Debugger.Break();
                        string root = reader.ReadLine();

                        def = FolderSets.Where(fs => Path.GetFullPath(fs.Root) == Path.GetFullPath(root)).FirstOrDefault();
                    }
                }
                finally
                {
                    if (stream != null)
                        stream.Dispose();
                }
                if (def != null)
                    vm.SelectedFolderSet = def;
                else
                    vm.SelectedFolderSet = FolderSets[0];

            }
            catch (Exception)
            {
                //vm.Folder = @"W:\Livres\Art";
            }
        }

        public async Task SearchFolder(string folder)
        {
            List<FileNameAndSize> files;

            files = await Task.Run(() =>
            {
                var di = new DirectoryInfo(folder);

                try
                {
                return di.GetFiles("*.*", System.IO.SearchOption.AllDirectories)
                    .OrderBy(fi => fi.Name, new WindowsFileExplorerComparer())
                    .OrderBy(fi => Path.GetDirectoryName(fi.FullName), new WindowsFileExplorerComparer())
                    .Select(fi => new FileNameAndSize { Name = fi.FullName, Size = fi.Length })
                    .ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error enumerating files:\r\n" + ex.Message, "FileFilter", MessageBoxButton.OK, MessageBoxImage.Error);
                    return null;
                }
            });

            if (files == null)
                return;

            int iPos = 0;
            for (; iPos < FolderSets.Count; iPos++)
            {
                if (FolderSets[iPos].Root.Length == 0 || Path.GetFullPath(FolderSets[iPos].Root) == Path.GetFullPath(folder))
                    break;
            }
            if (iPos >= FolderSets.Count)
            {
                iPos = 0;
                FolderSets.Insert(0, new FolderSet());
            }
            FolderSets[iPos].Root = folder;
            FolderSets[iPos].Files = files;

            vm.SelectedFolderSet = FolderSets[iPos];

            SaveCache();
        }

        private void SaveCache()
        {
            IsolatedStorageFile f = IsolatedStorageFile.GetUserStoreForAssembly();
            using (IsolatedStorageFileStream stream = new IsolatedStorageFileStream("cache.dat", FileMode.Create, f))
            using (StreamWriter writer = new StreamWriter(stream))
            {
                writer.WriteLine("2");      // Version of cache structure
                foreach (FolderSet fs in FolderSets)
                {
                    writer.WriteLine(fs.Root);
                    foreach (FileNameAndSize fns in fs.Files)
                    {
                        writer.WriteLine(fns.Name);
                        writer.WriteLine(fns.Size);
                    }
                    writer.WriteLine();
                }
            }
        }

        internal void MemorizeSelectedFolderSet(string root)
        {
            IsolatedStorageFile f = IsolatedStorageFile.GetUserStoreForAssembly();
            using (IsolatedStorageFileStream stream = new IsolatedStorageFileStream("selection.dat", FileMode.Create, f))
            using (StreamWriter writer = new StreamWriter(stream))
            {
                writer.WriteLine("2");      // Version of selection structure
                writer.WriteLine(root);
            }
        }

        internal void RemoveFolderSet(string folder)
        {
            int iPos = 0;
            for (; iPos < FolderSets.Count; iPos++)
            {
                if (Path.GetFullPath(FolderSets[iPos].Root) == Path.GetFullPath(folder))
                    break;
            }
            if (iPos >= 0 && iPos < FolderSets.Count)
            {
                FolderSets.RemoveAt(iPos);
                vm.SelectedFolderSet = null;
            }

            SaveCache();
        }
    }
}
