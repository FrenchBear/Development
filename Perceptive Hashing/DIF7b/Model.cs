// DIF - Duplicate Image Finder
// Model implementation: Active code to hash files and find duplicates
//
// 2013-05-25   PV
// 2013-07-02   PV      Development
// 2016-03-08   PV      When choosing a duplicate to keep, if same folder, keep shortest file name
// 2016-05-16   PV      Added Monsters; Auto-add KB folders on start if list is empty
// 2016-08-07   PV      Moved code managing tasks to a dedicated class PVScheduler and code optimization
// 2017-02-22   PV      DuplicateFile implements INotifyPropertyChanged (to deselect a duplicate from code) and a non file locking ImageSource (IS)

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.ExceptionServices;
using System.Runtime.InteropServices;
using System.Security;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Media.Imaging;
using System.Xml;
using Microsoft.VisualBasic.FileIO;
using System.ComponentModel;
using System.Windows.Media;

namespace DIF
{
    public class HashedFile
    {
        public string file;
        public int width;
        public int height;
        public long size;
        public UInt64 hash;
        public DateTime hashedOn;
    }

    public class PairDistance
    {
        public int File1Index { get; set; }
        public int File2Index { get; set; }
        public int D { get; set; }
    }

    public class DuplicateFile : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        private void NotifyPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public string Name { get; set; }

        // For picture Source binding, create an in-memory BitmapImage that does not lock the file
        // contrary to a direct binding of Source to Name
        // Note that the code doesn't react too well if the file Name is deleted or renamed during execution
        public ImageSource IS
        {
            get
            {
                BitmapImage image = new BitmapImage();
                image.BeginInit();
                image.CacheOption = BitmapCacheOption.OnLoad;
                image.UriSource = new Uri(Name);
                image.EndInit();
                return image;
            }
        }


        private bool _IsSelected;

        public bool IsSelected
        {
            get { return _IsSelected; }
            set
            {
                if (_IsSelected != value)
                {
                    _IsSelected = value;
                    NotifyPropertyChanged(nameof(IsSelected));
                }
            }
        }
    }

    public class Model
    {
        [DllImport(@".\pHash.dll", CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Ansi)]
        public static extern int ph_dct_imagehash([MarshalAs(UnmanagedType.LPStr)] string file, ref UInt64 hash);

        // Actually obsolete, there is a C# direct implementation in ph_hamming_distance_local
        //[DllImport(@".\pHash.dll", CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Ansi)]
        //public static extern int ph_hamming_distance(UInt64 hash1, UInt64 hash2);


        // Initialization
        public Model()
        {
            hashedFilesDictionary = new SerializableDictionary<string, HashedFile>(StringComparer.InvariantCultureIgnoreCase);

            // Load from persisted cache
            DIFCache = Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), "DIFCache.dic");
            if (File.Exists(DIFCache))
                using (XmlReader reader = XmlReader.Create(DIFCache))
                {
                    reader.ReadStartElement("DIFDictionary");
                    hashedFilesDictionary.ReadXml(reader);
                }
        }


        // ViewModel
        private ViewModel vm;
        private MainWindow w;
        public void SetViewModel(ViewModel vm, MainWindow w)
        {
            this.vm = vm;
            this.w = w;
            Folders = new ObservableCollection<string>();

            Assembly myAssembly = System.Reflection.Assembly.GetExecutingAssembly();
            AssemblyTitleAttribute aTitleAttr = (AssemblyTitleAttribute)AssemblyTitleAttribute.GetCustomAttribute(myAssembly, typeof(AssemblyTitleAttribute));
            string sAssemblyVersion = myAssembly.GetName().Version.ToString();
            AddTrace(aTitleAttr.Title + ", version " + sAssemblyVersion);
            AddTrace($"DIFCache: {DIFCache}, {hashedFilesDictionary.Count} entries loaded.");
            AddTrace($"ProcessorCount: {Environment.ProcessorCount}");
        }

        private StringBuilder traceStringBuilder = new StringBuilder();
        private void AddTrace(string s)
        {
            lock (traceStringBuilder)
            {
                while (traceStringBuilder.Length > 10000)
                    traceStringBuilder.Remove(0, 1000);
                traceStringBuilder.AppendLine(s);
                vm.TraceText = traceStringBuilder.ToString();
                //w.TraceTextBox.ScrollToEnd();
            }
        }


        // Variables exposed to ViewModel
        public ObservableCollection<string> Folders;            // List of selected folder for analysis
        public int Threshold = 9;                               // Default max distance threshold level when finding duplicates (7 is pretty reliable)
        public ObservableCollection<HashSet<DuplicateFile>> DuplicatesList;     // Duplicates files


        // Processed files and cache
        private string DIFCache;                                // Cache filename
        private SerializableDictionary<string, HashedFile> hashedFilesDictionary;
        public List<FileInfo> processedFilesList;               // List of filenames being hashed
        private List<HashedFile> hashedFilesList;


        public void AddKBFolders()
        {
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Best Of");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Dogs");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Bears and bears");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Bear Tats");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Drawings");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Tools");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\FF");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Monsters");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Other");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Sex");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Uro");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Red Heads");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Armpits");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Breeding");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Gif");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Jus");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\BDSM Leather");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Bears");
            AddRootFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Downloads");
        }


        // Add folder and all subdirectories to the list of folders
        public void AddRootFolder(string folder)
        {
            try
            {
                List<string> lfd = new List<string>(Directory.GetDirectories(folder));
                if (!lfd.Contains(folder, StringComparer.InvariantCultureIgnoreCase))
                    lfd.Insert(0, folder);
                foreach (string s in lfd.Reverse<string>())
                    if (!Folders.Contains(s, StringComparer.InvariantCultureIgnoreCase))
                        Folders.Add(s);
                // Select last folder
                vm.ShowLastFolder();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Exception raised when adding folder " + folder + ":\r\n" + ex.Message);
            }
        }



        public void DoHash(CancellationToken cancelToken, IProgress<Tuple<int, int>> progress)
        {
            // If there are no folder, automatically add KB folders
            if (Folders.Count == 0)
                AddKBFolders();

            // Build the list of files to process
            processedFilesList = new List<FileInfo>();
            foreach (string folder in Folders)
            {
                AddTrace("Reading folder " + folder);
                Debug.WriteLine(folder);
                var di = new DirectoryInfo(folder);
                processedFilesList.AddRange(di.GetFiles("*.jpg", System.IO.SearchOption.TopDirectoryOnly));
                // Only process jpg files, png files crash pHash lib...
            }

            bool cacheUpdated = false;

            // In case there is no file to process...
            if (processedFilesList.Count == 0)
            {
                progress.Report(new Tuple<int, int>(0, 0));
                return;
            }

            AddTrace("Start hashing of " + processedFilesList.Count.ToString() + " pictures");
            Stopwatch sw = Stopwatch.StartNew();

            // Will execute hashing in a separate thread, no need for async/await since everything is done
            // in this thread, there is no final action to indicate that hashing is done, this is reported
            Task.Run(() =>
            {
                PVScheduler<HashedFile> myHashedFileScheduler = new PVScheduler<HashedFile>();
                int p = 0;      // Number of processed files

                foreach (var fileInfo in processedFilesList)
                {
                    string file = fileInfo.FullName;
                    if (cancelToken.IsCancellationRequested) goto ExitHash;

                    long size = fileInfo.Length;

                    // Already hashed?
                    if (hashedFilesDictionary.ContainsKey(file) && hashedFilesDictionary[file].size == size)
                    {
                        p++;
                        progress.Report(new Tuple<int, int>(p, processedFilesList.Count));
                        // Move to next file
                        continue;
                    }

                    myHashedFileScheduler.RunTask(
                        () => ImageHash(fileInfo),
                        (HashedFile hf) =>
                            {
                                progress.Report(new Tuple<int, int>(++p, processedFilesList.Count));
                                if (hf != null)
                                {
                                    AddFile(hf);
                                    cacheUpdated = true;
                                }
                            }
                    );
                }

                myHashedFileScheduler.WaitAll();

                ExitHash:
                if (cacheUpdated)
                {
                    // Write cache
                    XmlWriterSettings settings = new XmlWriterSettings();
                    //settings.OmitXmlDeclaration = true;
                    settings.ConformanceLevel = ConformanceLevel.Fragment;
                    using (XmlWriter writer = XmlWriter.Create(DIFCache, settings))
                    {
                        writer.WriteStartElement("DIFDictionary");
                        hashedFilesDictionary.WriteXml(writer);
                        writer.WriteEndElement();
                    }
                }

                TimeSpan ts = sw.Elapsed;
                AddTrace("End hashing, elapsed: " + String.Format("{0:00}:{1:00}.{2:00}", ts.Minutes, ts.Seconds, ts.Milliseconds / 10));

            }, cancelToken);
        }

        // Actual image hashing
        // Add file size and resolution, and hashing time (local)
        [HandleProcessCorruptedStateExceptions]     // http://stackoverflow.com/questions/3469368/how-to-handle-accessviolationexception
        [SecurityCritical]
        private HashedFile ImageHash(FileInfo fileInfo)
        {
            UInt64 h = 0;
            try
            {
                ph_dct_imagehash(fileInfo.FullName, ref h);
                HashedFile hf = new HashedFile { file = fileInfo.FullName, hash = h };

                hf.size = fileInfo.Length;
                BitmapImage bi = new BitmapImage(new Uri(hf.file));
                hf.width = bi.PixelWidth;
                hf.height = bi.PixelHeight;
                hf.hashedOn = DateTime.Now;

                return hf;
            }
            catch (Exception ex)
            {
                AddTrace("Hashing error: " + ex.Message + "\r\n" + fileInfo.FullName);
                return null;
            }
        }

        // When hashing is done, add entry to dictionary
        // Called sequentially, no need to lock dictionary
        private void AddFile(HashedFile hf)
        {
            if (hashedFilesDictionary.ContainsKey(hf.file))
                hashedFilesDictionary.Remove(hf.file);
            hashedFilesDictionary.Add(hf.file, hf);
        }



        // Task to find similar images to hashedFilesList[i] (look only for indexes >i)
        private IEnumerable<PairDistance> CompareImages(int i)
        {
            List<PairDistance> l = null;

            for (int j = i + 1; j < hashedFilesList.Count; j++)
            {
                int d = ph_hamming_distance_local(hashedFilesList[i].hash, hashedFilesList[j].hash);
                if (d <= Threshold)
                {
                    if (l == null) l = new List<PairDistance>();
                    l.Add(new PairDistance { File1Index = i, File2Index = j, D = d });
                }
            }
            return l;
        }

        public async void DoFindDuplicates(CancellationToken cancelToken, IProgress<Tuple<int, int>> progress)
        {
            // Build an indexed list of hashed files amond files to process
            // It's not the full list if hashing has been interrupted
            hashedFilesList = new List<HashedFile>();
            foreach (var fileInfo in processedFilesList)
                if (hashedFilesDictionary.ContainsKey(fileInfo.FullName))
                    hashedFilesList.Add(hashedFilesDictionary[fileInfo.FullName]);

            AddTrace("Start comparing " + hashedFilesList.Count.ToString() + " pictures");
            Stopwatch sw = Stopwatch.StartNew();

            // Build close file list, a collection of [index1, index2, distance] when distance<=threshold
            // Do search in parallel
            // Note that since call to DoFindDuplicates doesn't use await, it will return at this point
            // but the code will actually wait for the tasks to finish before continuing
            List<PairDistance> closeFilesList = new List<PairDistance>();
            await Task.Run(() =>
            {
                DateTime dt = DateTime.Now;
                int i;
                PVScheduler<IEnumerable<PairDistance>> myIEnumPDFileScheduler = new PVScheduler<IEnumerable<PairDistance>>();

                for (i = 0; i < hashedFilesList.Count; i++)
                {
                    if (cancelToken.IsCancellationRequested) goto ExitCompare;

                    // Report progress every 250ms
                    if (DateTime.Now - dt > TimeSpan.FromMilliseconds(250))
                    {
                        progress.Report(new Tuple<int, int>(i + 1, hashedFilesList.Count));
                        dt = DateTime.Now;
                    }

                    // It's critical NEVER use an external loop variable directly in a closure/lambda...
                    int i2 = i;
                    myIEnumPDFileScheduler.RunTask(() => CompareImages(i2),
                        (IEnumerable<PairDistance> enumPD) =>
                        {
                            if (enumPD != null)
                                closeFilesList.AddRange(enumPD);
                        });
                }

                // Wail all tasks to terminate
                myIEnumPDFileScheduler.WaitAll();

                ExitCompare:
                progress.Report(new Tuple<int, int>(i + 1, hashedFilesList.Count));

                TimeSpan ts = sw.Elapsed;
                AddTrace("End comparing, elapsed: " + String.Format("{0:00}:{1:00}.{2:00}", ts.Minutes, ts.Seconds, ts.Milliseconds / 10));

            }, cancelToken);

            // Sort by distance
            closeFilesList.Sort((d1, d2) => { return Math.Abs(d2.D - d1.D); });

            // Finally build final list, 1st using indexes
            List<HashSet<int>> DuplicatesIndexesList = new List<HashSet<int>>();
            for (int i = 0; i < closeFilesList.Count; i++)
            {
                bool bFound = false;
                for (int j = 0; j < DuplicatesIndexesList.Count; j++)
                {
                    if (DuplicatesIndexesList[j].Contains(closeFilesList[i].File1Index) || DuplicatesIndexesList[j].Contains(closeFilesList[i].File2Index))
                    {
                        if (!DuplicatesIndexesList[j].Contains(closeFilesList[i].File1Index)) DuplicatesIndexesList[j].Add(closeFilesList[i].File1Index);
                        if (!DuplicatesIndexesList[j].Contains(closeFilesList[i].File2Index)) DuplicatesIndexesList[j].Add(closeFilesList[i].File2Index);
                        bFound = true;
                        break;
                    }
                }
                if (!bFound)
                {
                    var hsi = new HashSet<int> { closeFilesList[i].File1Index, closeFilesList[i].File2Index };
                    DuplicatesIndexesList.Add(hsi);
                }
            }

            // Convert into DuplicateFile HashSets
            DuplicatesList = new ObservableCollection<HashSet<DuplicateFile>>();
            int jBest;
            for (int i = 0; i < DuplicatesIndexesList.Count; i++)
            {
                var hss = new HashSet<DuplicateFile>();
                jBest = -1;
                foreach (int j in DuplicatesIndexesList[i])
                {
                    hss.Add(new DuplicateFile { Name = hashedFilesList[j].file, IsSelected = false });
                    if (jBest < 0)
                        jBest = j;
                    else
                    {
                        // Keep high resolution first
                        if (hashedFilesList[j].width * hashedFilesList[j].height > hashedFilesList[jBest].width * hashedFilesList[jBest].height)
                            jBest = j;
                        else if (hashedFilesList[j].width * hashedFilesList[j].height == hashedFilesList[jBest].width * hashedFilesList[jBest].height)
                            // Then keep higher size
                            if (hashedFilesList[j].size > hashedFilesList[jBest].size)
                                jBest = j;
                            else if (hashedFilesList[j].size == hashedFilesList[jBest].size)
                            // Keep 1st folder first
                            {
                                int jSource = -1;
                                int jBestSource = -1;
                                for (int k = 0; k < Folders.Count; k++)
                                {
                                    if (Path.GetDirectoryName(hashedFilesList[j].file) == Folders[k]) jSource = k;
                                    if (Path.GetDirectoryName(hashedFilesList[jBest].file) == Folders[k]) jBestSource = k;
                                }

                                if (jSource == jBestSource)
                                {
                                    // If same folder, keep shortest file name
                                    if (hashedFilesList[j].file.Length < hashedFilesList[jBest].file.Length)
                                        jBest = j;
                                }
                                else
                                {
                                    // Keep 1st folder
                                    if (jSource < jBestSource) jBest = j;
                                }
                            }
                    }
                }

                // Check all but best file
                foreach (DuplicateFile df in hss)
                    df.IsSelected = df.Name != hashedFilesList[jBest].file;

                DuplicatesList.Add(hss);
            }

            hashedFilesList = null;
            closeFilesList = null;
            DuplicatesIndexesList = null;
            System.GC.Collect();
            System.GC.Collect();

            // Notify VM that finding duplicates is finished
            vm.FindDuplicatesDone();
        }

        private int ph_hamming_distance_local(UInt64 hash1, UInt64 hash2)
        {
            UInt64 x = hash1 ^ hash2;
            const UInt64 m1 = 0x5555555555555555;
            const UInt64 m2 = 0x3333333333333333;
            const UInt64 h01 = 0x0101010101010101;
            const UInt64 m4 = 0x0f0f0f0f0f0f0f0f;
            x -= (x >> 1) & m1;
            x = (x & m2) + ((x >> 2) & m2);
            x = (x + (x >> 4)) & m4;
            return (int)((x * h01) >> 56);
        }

        public void DoDeleteSelectedImages()
        {
            var lf = new List<string>();
            foreach (HashSet<DuplicateFile> hss in DuplicatesList)
            {
                foreach (DuplicateFile df in hss)
                {
                    if (df.IsSelected)
                        lf.Add(df.Name);
                }
            }
            DuplicatesList = null;
            vm.RefreshDuplicatesList();

            // Move files to trash
            int ndel = 0;
            foreach (string f in lf)
            {
                vm.UpdateDeleteProgress(new Tuple<int, int>(++ndel, lf.Count));
                if (File.Exists(f))
                    FileSystem.DeleteFile(f, UIOption.OnlyErrorDialogs, RecycleOption.SendToRecycleBin);
                //if (processedFilesList.Contains(f))
                //    processedFilesList.Remove(f);
            }

            if (lf.Count > 0)
                MessageBox.Show(string.Format("{0} file(s) moved to recycle bin.", lf.Count), "Duplicate Image Finder", MessageBoxButton.OK, MessageBoxImage.Information);
        }

    }

}
