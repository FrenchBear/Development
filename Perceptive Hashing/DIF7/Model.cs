// DIF - Duplicate Image Finder
// Model implementation: Active code to hash files and find duplicates
//
// 2013-05-25   PV
// 2013-07-02   PV      Development
// 2016-03-08   PV      When choosing a duplicate to keep, if same folder, keep shortest file name
// 2016-05-16   PV      Added Monsters; Auto-add KB folders on start if list is empty

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

    public class DuplicateFile
    {
        public string Name { get; set; }
        public bool IsSelected { get; set; }
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
                    reader.Close();
                    reader.Dispose();
                }

            // Initialization for multitasking (Max number of // tasks)
            if (Environment.ProcessorCount > 4)
                MAX_PARALLISM = Environment.ProcessorCount - 2;
            else if (Environment.ProcessorCount > 2)
                MAX_PARALLISM = Environment.ProcessorCount - 1;
            else
                MAX_PARALLISM = Environment.ProcessorCount;
            if (MAX_PARALLISM < 1) MAX_PARALLISM = 1;

            // For debugging in Visual Studio
            //MAX_PARALLISM = 1;
        }


        // ViewModel
        private ViewModel vm;
        public void SetViewModel(ViewModel vm)
        {
            this.vm = vm;
            Folders = new ObservableCollection<string>();

            AddTrace("DIFCache: " + DIFCache);
            AddTrace("ProcessorCount: " + Environment.ProcessorCount.ToString() + ", MAX_PARALLISM: " + MAX_PARALLISM.ToString());
        }

        private StringBuilder traceStringBuilder = new StringBuilder();
        private void AddTrace(string s)
        {
            lock (traceStringBuilder)
            {
                while (traceStringBuilder.Length > 10000)
                {
                    traceStringBuilder.Remove(0, 1000);
                }
                traceStringBuilder.AppendLine(s);
                vm.TraceText = traceStringBuilder.ToString();
            }
        }


        // Variables exposed to ViewModel
        public ObservableCollection<string> Folders;            // List of selected folder for analysis
        public int Threshold = 9;                               // Default max distance threshold level when finding duplicates (7 is pretty reliable)
        public List<HashSet<DuplicateFile>> DuplicatesList;     // Dupicates files


        // Processed files and cache
        private string DIFCache;                                // Cache filename
        private SerializableDictionary<string, HashedFile> hashedFilesDictionary;
        public List<string> processedFilesList;                // List of filenames being hashed
        private List<HashedFile> hashedFilesList;

        // Multitasking
        private readonly int MAX_PARALLISM;


        public void AddKBFolders()
        {
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Best Of");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Dogs");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Bears and bears");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Bear Tats");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Drawings");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Tools");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\FF");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Monsters");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Uro");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Red Heads");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Armpits");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Breeding");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Gif");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Jus");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\BDSM Leather");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Bears");
            AddFolder(@"D:\Home\Kaforas\GoogleDrive\PicturesGDKB\Downloads");
        }


        // Add folder and all subdirectories to the list of folders
        public void AddFolder(string folder)
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
            processedFilesList = new List<string>();
            foreach (string folder in Folders)
            {
                processedFilesList.AddRange(Directory.GetFiles(folder, "*.jpg"));
                // PNG files crash pHash lib...
                //listFiles.AddRange(.Directory.GetFiles(folder, "*.png"));
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

            // List of tasks running in parallel
            var lt = new List<Task<HashedFile>>();

            // Will execute hashing in a separate thread, no need for async/await since everything is done
            // in this thread, there is no final action to indicate that hashing is done, this is reported

            Task.Run(/* async */ () =>
            {
                int n = 0;      // Number of active hashing tasks
                int p = 0;      // Number of processed files

                // Hash MAX_PARALLISM files in parallel
                foreach (string file in processedFilesList)
                {
                    if (cancelToken.IsCancellationRequested) goto ExitHash;

                    // Get file size before checking cache
                    long size = (new FileInfo(file)).Length;

                    // Already hashed?
                    if (hashedFilesDictionary.ContainsKey(file) && hashedFilesDictionary[file].size == size)
                    {
                        p++;
                        progress.Report(new Tuple<int, int>(p, processedFilesList.Count));
                        // Move to next file
                        continue;
                    }

                    string s = file;    // Avoid problems with loop variables
                    lt.Add(Task.Run(() => ImageHash(s)));
                    n++;
                    if (n == MAX_PARALLISM)
                    {
                        //await Task.WhenAny(lt.ToArray());
                        Task.WaitAny(lt.ToArray());
                        lock (lt)
                        {
                            var lf = new List<Task<HashedFile>>();
                            foreach (var t in lt)
                                if (t.IsCompleted)
                                {
                                    lf.Add(t);
                                    n--;
                                    progress.Report(new Tuple<int, int>(++p, processedFilesList.Count));
                                    if (t.Result != null)
                                    {
                                        AddFile(t.Result);
                                        cacheUpdated = true;
                                    }
                                }
                            foreach (var t in lf)
                                lt.Remove(t);
                        }

                    }
                }

                // Wail all tasks to terminate
                while (n > 0)
                {
                    if (cancelToken.IsCancellationRequested) goto ExitHash;

                    //await Task.WhenAny(lt.ToArray());
                    Task.WaitAny(lt.ToArray());
                    lock (lt)
                    {
                        var lf = new List<Task<HashedFile>>();
                        foreach (var t in lt)
                            if (t.IsCompleted)
                            {
                                lf.Add(t);
                                n--;
                                progress.Report(new Tuple<int, int>(++p, processedFilesList.Count));
                                if (t.Result != null)
                                {
                                    AddFile(t.Result);
                                    cacheUpdated = true;
                                }
                            }
                        foreach (var t in lf)
                            lt.Remove(t);
                    }
                }

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
        private HashedFile ImageHash(string fileName)
        {
            UInt64 h = 0;
            try
            {
                ph_dct_imagehash(fileName, ref h);
                HashedFile hf = new HashedFile { file = fileName, hash = h };

                hf.size = (new FileInfo(hf.file)).Length;
                BitmapImage bi = new BitmapImage(new Uri(hf.file));
                hf.width = bi.PixelWidth;
                hf.height = bi.PixelHeight;
                hf.hashedOn = DateTime.Now;

                return hf;
            }
            catch (Exception ex)
            {
                AddTrace("Hashing error: " + ex.Message + "\r\n" + fileName);
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
            foreach (string file in processedFilesList)
                if (hashedFilesDictionary.ContainsKey(file))
                    hashedFilesList.Add(hashedFilesDictionary[file]);

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
                int n = 0;      // Number of active compare tasks
                int i;
                var lt = new List<Task<IEnumerable<PairDistance>>>();

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
                    lt.Add(Task.Run(() => CompareImages(i2)));
                    n++;
                    if (n == MAX_PARALLISM)
                    {
                        Task.WaitAny(lt.ToArray());
                        lock (lt)
                        {
                            var lf = new List<Task<IEnumerable<PairDistance>>>();
                            foreach (var t in lt)
                                if (t.IsCompleted)
                                {
                                    lf.Add(t);
                                    n--;
                                    if (t.Result != null)
                                        closeFilesList.AddRange(t.Result);
                                }
                            foreach (var t in lf)
                                lt.Remove(t);
                        }
                    }
                }

                // Wail all tasks to terminate
                while (n > 0)
                {
                    if (cancelToken.IsCancellationRequested) goto ExitCompare;

                    //await Task.WhenAny(lt.ToArray());
                    Task.WaitAny(lt.ToArray());
                    lock (lt)
                    {
                        var lf = new List<Task<IEnumerable<PairDistance>>>();
                        foreach (var t in lt)
                            if (t.IsCompleted)
                            {
                                lf.Add(t);
                                n--;
                                if (t.Result != null)
                                    closeFilesList.AddRange(t.Result);
                            }
                        foreach (var t in lf)
                            lt.Remove(t);
                    }
                }

            ExitCompare:
                progress.Report(new Tuple<int, int>(i + 1, hashedFilesList.Count));

                TimeSpan ts = sw.Elapsed;
                AddTrace("End comparing, elapsed: " + String.Format("{0:00}:{1:00}.{2:00}", ts.Minutes, ts.Seconds, ts.Milliseconds / 10));

            }, cancelToken);

            //Debug.WriteLine("DoFindDuplicates.3: {0}", closeFilesList.Count);

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

            //Debug.WriteLine("DoFindDuplicates.4: {0}", DuplicatesIndexesList.Count);

            // Convert into DuplicateFile HashSets
            DuplicatesList = new List<HashSet<DuplicateFile>>();
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

            //Debug.WriteLine("DoFindDuplicates.5: {0}", DuplicatesList.Count);

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
            foreach (string f in lf)
            {
                if (File.Exists(f))
                    FileSystem.DeleteFile(f, UIOption.OnlyErrorDialogs, RecycleOption.SendToRecycleBin);
                if (processedFilesList.Contains(f))
                    processedFilesList.Remove(f);
            }

            if (lf.Count > 0)
                MessageBox.Show(string.Format("{0} file(s) moved to recycle bin.", lf.Count), "Duplicate Image Finder", MessageBoxButton.OK, MessageBoxImage.Information);
        }

    }

}
