// CropLR
// Préparation des images La Recherche
// Crop des PNG à la taille exacte de la page
// 2017-01-05   PV
// 2017-01-07   PV  Autocrop
// 2017-01-08   PV  Renomme les fichiers découpés avec le n° de la revue
// 2017-03-02   PV  Nom du répertoire temporaire créé dynamiquement

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Drawing;
using static System.Console;
using System.Diagnostics;
using iTextSharp.text.pdf;
using static System.Threading.Interlocked;      // Increment
using System.Reflection;
using System.Windows.Media.Imaging;


namespace CropLR
{
    class Program
    {
        static string tempFolder;

        static StreamWriter sw;
        static int nTotal = 0;
        static int nProblem = 0;


        static void Main(string[] args)
        {
            AppTitleVersion();

            // Prepare a random temp folder
            var rnd = new Random();
            tempFolder = Path.Combine(Path.GetTempPath(), "CropLRTemp." + rnd.Next().ToString() + rnd.Next().ToString());
            if (!Directory.Exists(tempFolder))
                Directory.CreateDirectory(tempFolder);

            Stopwatch t = Stopwatch.StartNew();
            var n = DateTime.Now;
            using (StreamWriter swu = new StreamWriter(string.Format(@"C:\temp\CropLR-{0}-{1:D2}-{2:D2}-{3:D2}.{4:D2}.{5:D2}.log", n.Year, n.Month, n.Day, n.Hour, n.Minute, n.Second)))
            {
                swu.AutoFlush = true;
                sw = swu;

                const string sourceRoot = @"D:\La Recherche\1 Page";
                //foreach (string issue in Directory.GetDirectories(sourceRoot+@"\Brut").Select(d => Path.GetFileName(d)))
                foreach (string issue in new string[] { "LR520", "LR521", "HS21" })
                {
                    string sourceFolder = $@"{sourceRoot}\Brut\{issue}";
                    string cropFolder = $@"{sourceRoot}\Crop\{issue}";
                    string outputPDF = $@"{sourceRoot}\{issue}.pdf";

                    ProcessFolder(issue, sourceFolder, cropFolder, outputPDF);
                }

                LogWriteLine();
                LogWriteLine($"{nTotal} files converted, {nProblem} problem(s)");
                LogWriteLine("Total time: " + t.Elapsed.ToString(@"hh\:mm\:ss\.FF"));
            }

            CleanTempFolder();
            Directory.Delete(tempFolder);

            WriteLine();
            Write("(Pause)");
            ReadLine();
        }

        private static void ProcessFolder(string issue, string sourceFolder, string cropFolder, string outputPDF)
        {
            if (!Directory.Exists(sourceFolder))
            {
                WriteLine("*** Error, source folder " + sourceFolder + " not found.");
                return;
            }

            if (!Directory.Exists(cropFolder))
                Directory.CreateDirectory(cropFolder);

            LogWriteLine("Process " + sourceFolder);
            nTotal++;

            CleanTempFolder();

            List<Tuple<int, string>> pages = new List<Tuple<int, string>>();
            int pageNum = 1;
            foreach (string pageFile in Directory.GetFiles(sourceFolder, "*.png").OrderBy(name => name, new WindowsFileExplorerComparer()))
            {
                pages.Add(new Tuple<int, string>(pageNum++, pageFile));
            }

            int xmina = 500, xmaxa = 500, ymina = 1000, ymaxa = 1000;
            object single = new object();
            pages.AsParallel().ForAll(page =>
            {
                LogWrite("x");
                string croppedName = Path.Combine(cropFolder, string.Format("{0}_Page_{1:D3}.png", issue, page.Item1));
                int xmin, xmax, ymin, ymax;
                CropImage(page.Item2, croppedName, out xmin, out xmax, out ymin, out ymax);
                lock (single)
                {
                    if (xmin < xmina) xmina = xmin;
                    if (xmax > xmaxa) xmaxa = xmax;
                    if (ymin < ymina) ymina = ymin;
                    if (ymax > ymaxa) ymaxa = ymax;
                }
                ConvertImageToPdf(croppedName, Path.Combine(tempFolder, Path.GetFileNameWithoutExtension(croppedName) + ".pdf"));
            });

            LogWrite(" <");
            ConcatenatePages(tempFolder, outputPDF);
            LogWriteLine($"> Crop from({xmina + 1}, {ymina + 1})  width={xmaxa - xmina - 1}, height={ymaxa - ymina - 1}");
        }


        // Clean one-page PDF folder
        private static void CleanTempFolder()
        {
            System.IO.DirectoryInfo downloadedMessageInfo = new DirectoryInfo(tempFolder);
            foreach (FileInfo file in downloadedMessageInfo.GetFiles())
                try
                {
                    file.Delete();
                }
                catch (Exception)
                {
                    // In case of problem, wait for 500ms before trying again
                    System.Threading.Thread.Sleep(500);
                    try
                    {
                        file.Delete();
                    }
                    catch (Exception)
                    {
                        throw;
                    }
                }

            foreach (DirectoryInfo dir in downloadedMessageInfo.GetDirectories())
                dir.Delete(true);
        }


        // Shows standard application banner
        private static string AppTitleVersion()
        {
            Assembly myAssembly = System.Reflection.Assembly.GetExecutingAssembly();
            AssemblyTitleAttribute aTitleAttr = (AssemblyTitleAttribute)AssemblyTitleAttribute.GetCustomAttribute(myAssembly, typeof(AssemblyTitleAttribute));
            string sAssemblyVersion = myAssembly.GetName().Version.Major.ToString() + "." + myAssembly.GetName().Version.Minor.ToString() + "." + myAssembly.GetName().Version.Build.ToString();

            return aTitleAttr.Title + " " + sAssemblyVersion;
        }


        private static void LogWrite(string s)
        {
            lock (sw) sw.Write(s);
            Write(s);
        }

        private static void LogWriteLine(string s = "")
        {
            lock (sw) sw.WriteLine(s);
            WriteLine(s);
        }


        private static void CropImage(string source, string destination, out int xmin, out int xmax, out int ymin, out int ymax)
        {
            // Load image
            BitmapImage img = new BitmapImage(new Uri(source, UriKind.RelativeOrAbsolute));
            do { } while (img.IsDownloading);


            // Automatically find crop zone
            int stride = img.PixelWidth * 4;
            int size = img.PixelHeight * stride;
            byte[] pixels = new byte[size];
            img.CopyPixels(pixels, stride, 0);

            const byte bref = 254;
            const byte gref = 250;
            const byte rref = 245;

            //int xmin, xmax, ymin, ymax;
            for (xmin = 30; ; xmin++)
            {
                if (xmin >= img.PixelWidth) Debugger.Break();
                int index = 1500 * stride + 4 * xmin;
                if (pixels[index] != bref || pixels[index + 1] != gref || pixels[index + 2] != rref)
                    break;
            }
            for (xmax = img.PixelWidth - 1; ; xmax--)
            {
                if (xmax < 0) Debugger.Break();
                int index = 1500 * stride + 4 * xmax;
                if (pixels[index] != bref || pixels[index + 1] != gref || pixels[index + 2] != rref)
                    break;
            }
            for (ymin = 430; ; ymin++)
            {
                if (ymin >= img.PixelHeight) Debugger.Break();
                int index = ymin * stride + 4 * 1000;
                if (pixels[index] != bref || pixels[index + 1] != gref || pixels[index + 2] != rref)
                    break;
            }
            for (ymax = 3530; ; ymax--)
            {
                if (ymax < 0) Debugger.Break();
                int index = ymax * stride + 4 * 1000;
                if (pixels[index] != bref || pixels[index + 1] != gref || pixels[index + 2] != rref)
                    break;
            }

            // Extract interesting part
            //var cropped = new CroppedBitmap(img, new System.Windows.Int32Rect(71, 596, 2078, 2776));
            var cropped = new CroppedBitmap(img, new System.Windows.Int32Rect(xmin + 1, ymin + 1, xmax - xmin - 1, ymax - ymin - 1));

            // Save it
            var encoder = new PngBitmapEncoder();
            encoder.Frames.Add(BitmapFrame.Create(cropped));
            using (var filestream = new FileStream(destination, FileMode.Create))
                encoder.Save(filestream);

            pixels = null;
            cropped = null;
            img = null;
            GC.Collect();
        }


        // From https://alandjackson.wordpress.com/2013/09/27/convert-an-image-to-a-pdf-in-c-using-itextsharp/
        public static void ConvertImageToPdf(string srcFilename, string dstFilename)
        {
            iTextSharp.text.Rectangle pageSize = null;

            try
            {
                using (var srcImage = new Bitmap(srcFilename))
                {
                    pageSize = new iTextSharp.text.Rectangle(0, 0, srcImage.Width, srcImage.Height);
                }
                using (var ms = new MemoryStream())
                {
                    var document = new iTextSharp.text.Document(pageSize, 0, 0, 0, 0);
                    var LogWriter = iTextSharp.text.pdf.PdfWriter.GetInstance(document, ms);
                    LogWriter.SetFullCompression();
                    LogWriter.SetPdfVersion(PdfWriter.PDF_VERSION_1_7);
                    document.Open();
                    var image = iTextSharp.text.Image.GetInstance(srcFilename);
                    document.Add(image);
                    document.Close();

                    File.WriteAllBytes(dstFilename, ms.ToArray());
                }
            }
            catch (Exception)
            {
                // Do nothing
                LogWriteLine("\r\n*** Image conversion failed: " + srcFilename);
                Increment(ref nProblem);
            }
        }


        // Use PDFTK to merge all pages in a single PDF document
        private static void ConcatenatePages(string sourceFolder, string outputFile)
        {
            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            start.Arguments = "*.pdf output \"" + outputFile + "\" dont_ask";
            start.FileName = @"C:\Utils\pdftk.exe";
            start.UseShellExecute = true;
            start.WindowStyle = ProcessWindowStyle.Hidden;
            start.CreateNoWindow = true;
            start.WorkingDirectory = tempFolder;
            using (Process proc = Process.Start(start))
            {
                proc.WaitForExit();
                exitCode = proc.ExitCode;
            }
        }
    }

}

