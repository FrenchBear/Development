// FileFilter Model
// 2016-09-26   PV
// 2016-09-30   PV  CopyFolderPathCommand and IsolatedStorage cache

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

        // List of files to filter
        public ObservableCollection<string> Files;


        public void SetViewModel(ViewModel vm)
        {
            this.vm = vm;
            Files = new ObservableCollection<string>();

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
                        if (version != "1") Debugger.Break();
                        vm.Folder = reader.ReadLine();
                        for (;;)
                        {
                            string line = reader.ReadLine();
                            if (line == null)
                                break;
                            Files.Add(line);
                        }
                    }
                }
                finally
                {
                    if (stream != null)
                        stream.Dispose();
                }

                vm.NotifyFilesChanged();
            }
            catch (Exception)
            {
                vm.Folder = @"W:\BD";
            }
        }

        public async Task SearchFolder(string folder)
        {
            IEnumerable<string> files;

            files = await Task.Run(() =>
            {
                try
                {
                    return System.IO.Directory.GetFiles(folder, "*.*", System.IO.SearchOption.AllDirectories).OrderBy(path => path, new WindowsFileExplorerComparer());
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error enumerating files:\r\n" + ex.Message, "FileFilter", MessageBoxButton.OK, MessageBoxImage.Error);
                    return null;
                }
            });

            if (files == null)
                Files = new ObservableCollection<string>();
            else
                Files = new ObservableCollection<string>(files);
            vm.NotifyFilesChanged();

            IsolatedStorageFile f = IsolatedStorageFile.GetUserStoreForAssembly();
            using (IsolatedStorageFileStream stream = new IsolatedStorageFileStream("cache.dat", FileMode.Create, f))
            using (StreamWriter writer = new StreamWriter(stream))
            {
                writer.WriteLine("1");      // Version of cache structure
                writer.WriteLine(folder);
                foreach (string file in files)
                    writer.WriteLine(file);
            }
        }
    }
}
