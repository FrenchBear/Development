// QuickFileFilter Model
// 2016-09-26   PV
// 2016-09-30   PV  CopyFolderPathCommand and IsolatedStorage cache
// 2016-12-12   PV  v2, multiple folders sets and store FileInfo instead of just path
// 2016-12-30   PV  v2.5, Cache and selection memorized in plain files in same folder as executable, not anymore isolated storage

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows;


namespace QuickFileFilter
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

            // Load all caches
            string version;
            foreach (string cacheFilename in Directory.GetFiles(GetCacheFolder(), "*.ffcache"))
            {
                using (StreamReader reader = new StreamReader(cacheFilename))
                {
                    version = reader.ReadLine();
                    if (version != "3") Debugger.Break();

                    FolderSets.Add(new FolderSet
                    {
                        Root = reader.ReadLine(),
                        CacheFilename = cacheFilename,
                        ScanDate = DateTime.Parse(reader.ReadLine())
                    });
                }
            }

            // Reposition on last selected FolderSet, memorized in selection.ffdata
            FolderSet def = null;
            string selectionFile = Path.Combine(GetCacheFolder(), "selection.ffdata");
            if (File.Exists(selectionFile))
                try
                {
                    using (StreamReader reader = new StreamReader(selectionFile))
                    {
                        version = reader.ReadLine();
                        if (version != "3") Debugger.Break();
                        string root = reader.ReadLine();

                        def = FolderSets.FirstOrDefault(fs => Path.GetFullPath(fs.Root) == Path.GetFullPath(root));
                    }
                }
                catch (Exception)
                { }
            if (def != null)
                vm.SelectedFolderSet = def;
            else if (FolderSets.Count > 0)
                vm.SelectedFolderSet = FolderSets[0];
        }

        public void LoadFiles(FolderSet fs)
        {
            if (fs.Files != null)
                return;

            //Debug.WriteLine("Loading cache from " + fs.CacheFilename);
            using (StreamReader reader = new StreamReader(fs.CacheFilename))
            {
                for (int i = 0; i < 4; i++)
                    reader.ReadLine();
                fs.Files = new List<FileNameAndSize>();
                while (!reader.EndOfStream)
                {
                    string name = reader.ReadLine();
                    if (name.Length == 0)
                        break;
                    string line = reader.ReadLine();
                    fs.Files.Add(new FileNameAndSize { Name = name, Size = long.Parse(line) });
                }
            }
        }

        public async Task SearchFolder(string folder)
        {
            var files = await Task.Run(() =>
            {
                var di = new DirectoryInfo(folder);

                try
                {
                    return di.GetFiles("*.*", SearchOption.AllDirectories)
                        .OrderBy(fi => Path.GetDirectoryName(fi.FullName), new WindowsFileExplorerComparer())
                        .ThenBy(fi => fi.Name, new WindowsFileExplorerComparer())
                        .Select(fi => new FileNameAndSize { Name = fi.FullName, Size = fi.Length })
                        .ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erreur lors de l'énumération des fichiers:\r\n" + ex.Message, "QuickFileFilter", MessageBoxButton.OK, MessageBoxImage.Error);
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
            FolderSets[iPos].ScanDate = DateTime.Now;
            FolderSets[iPos].Files = files;

            vm.SelectedFolderSet = FolderSets[iPos];

            SaveFolderSet(FolderSets[iPos]);
        }

        /// <summary>
        /// Returns folder where .ffcache files are stored
        /// </summary>
        private string GetCacheFolder()
        {
            // For now, stored in executable folder (that's not very good...)
            return Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
        }

        private void SaveFolderSet(FolderSet fs)
        {
            // Cache filename is root folder with all invalid characters replaced by -, % replaced by %% and - replaced by %-
            // For instance, root W:\Livres\Informatique becomes W--Livres-Informatique.ffcache
            char[] invalidFileChars = Path.GetInvalidFileNameChars();
            StringBuilder sbAlt = new StringBuilder();
            foreach (char c in fs.Root)
            {
                if (c == '%')
                    sbAlt.Append("%%");
                else if (c == '-')
                    sbAlt.Append("%-");
                else if (invalidFileChars.Contains(c))
                    sbAlt.Append('-');
                else
                    sbAlt.Append(c);
            }

            string cacheFilename = Path.Combine(GetCacheFolder(), sbAlt.ToString() + ".ffcache");
            fs.CacheFilename = cacheFilename;
            using (StreamWriter writer = new StreamWriter(cacheFilename, false, Encoding.UTF8))
            {
                writer.WriteLine("3");      // Version of cache structure
                writer.WriteLine(fs.Root);
                writer.WriteLine(fs.ScanDate.ToString("s"));
                writer.WriteLine(fs.Files.Count);
                foreach (FileNameAndSize fns in fs.Files)
                {
                    writer.WriteLine(fns.Name);
                    writer.WriteLine(fns.Size);
                }
            }
        }


        internal void MemorizeSelectedFolderSet(FolderSet fs)
        {
            string cacheFilename = Path.Combine(GetCacheFolder(), "selection.ffdata");
            using (StreamWriter writer = new StreamWriter(cacheFilename, false, Encoding.UTF8))
            {
                writer.WriteLine("3");      // Version of selection structure
                writer.WriteLine(fs.Root);
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
                // Delete cache on disk, raise an exception if needed
                File.Delete(FolderSets[iPos].CacheFilename);

                // Delete FolderSet in memory
                FolderSets.RemoveAt(iPos);

                // Clear selection
                vm.SelectedFolderSet = null;
            }
        }
    }
}
