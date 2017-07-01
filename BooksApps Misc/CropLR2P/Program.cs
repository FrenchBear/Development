// CropLR2P
// Préparation des images La Recherche
// Version 2 pages
// 2017-01-10   PV
// 2017-01-11   PV  Autocrop

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


namespace CropLR2P
{
    class Program
    {
        static string tempFolder = @"C:\Temp\CropLRTemp";

        static StreamWriter sw;
        static int nTotal = 0;
        static int nProblem = 0;


        static void Main(string[] args)
        {
            AppTitleVersion();

            if (!Directory.Exists(tempFolder))
                Directory.CreateDirectory(tempFolder);

            Stopwatch t = Stopwatch.StartNew();
            var n = DateTime.Now;
            using (StreamWriter swu = new StreamWriter(string.Format(@"C:\temp\CropLR2P-{0}-{1:D2}-{2:D2}-{3:D2}.{4:D2}.{5:D2}.log", n.Year, n.Month, n.Day, n.Hour, n.Minute, n.Second)))
            {
                swu.AutoFlush = true;
                sw = swu;

                foreach (string issue in Directory.GetDirectories(@"C:\Temp\La Recherche\2 Pages\Brut2").Select(d => Path.GetFileName(d)))
                {
                    //string issue = "DLR43";

                    string sourceFolder = $@"C:\Temp\La Recherche\2 Pages\Brut2\{issue}";
                    string cropFolder = $@"C:\Temp\La Recherche\2 Pages\Crop\{issue}";
                    string outputPDF = $@"C:\Temp\La Recherche\2 Pages\{issue}.pdf";

                    ProcessFolder(issue, sourceFolder, cropFolder, outputPDF);
                }

                LogWriteLine();
                LogWriteLine($"{nTotal} files converted, {nProblem} problem(s)");
                LogWriteLine("Total time: " + t.Elapsed.ToString(@"hh\:mm\:ss\.FF"));
            }

            WriteLine();
            Write("(Pause)");
            ReadLine();
        }

        //private static void Fix471()
        //{
        //    string issue = "LR471";
        //    string sourceFolder = $@"C:\Temp\La Recherche\2 Pages\Brut2\{issue}";
        //    string cropFolder = $@"C:\Temp\La Recherche\2 Pages\Crop\{issue}";
        //    string outputPDF = $@"C:\Temp\La Recherche\2 Pages\{issue}.pdf";

        //    CleanTempFolder();
        //    foreach (string image in Directory.GetFiles(cropFolder, "*.png").OrderBy(f => f, new WindowsFileExplorerComparer()))
        //    {
        //        Write("+");
        //        ConvertImageToPdf(image, Path.Combine(tempFolder, Path.GetFileNameWithoutExtension(image) + ".pdf"));
        //    }
        //    Write("<");
        //    ConcatenatePages(tempFolder, outputPDF);
        //    WriteLine(">");


        //    Console.WriteLine();
        //    Console.Write("(Pause)");
        //    Console.ReadLine();
        //}

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
            string calibrationImage = null;
            foreach (string pageFile in Directory.GetFiles(sourceFolder, "*.png").OrderBy(name => name, new WindowsFileExplorerComparer()))
            {
                if (pageNum == 3)
                    calibrationImage = pageFile;
                pages.Add(new Tuple<int, string>(pageNum++, pageFile));
            }

            int x1, y1, x2, y2, width, height;
            CalibrateCrop(calibrationImage, out x1, out y1, out x2, out y2, out width, out height);
            //width = 1514;
            //x1 = 1919 - width;
            LogWriteLine($"Crop: P1 ({x1,4}, {y1,4})  P2 ({x2,4}, {y2,4})  W={width,4} H={height,4}");

            object single = new object();
            pages.AsParallel().ForAll(page =>
            {
                LogWrite("x");

                int pL = 2 * (page.Item1 - 1);
                int pR = pL + 1;
                string croppedNameL = pL == 0 ? null : Path.Combine(cropFolder, string.Format("{0}_Page_{1:D3}.png", issue, pL));
                string croppedNameR = page.Item1 == pages.Count ? null : Path.Combine(cropFolder, string.Format("{0}_Page_{1:D3}.png", issue, pR));

                CropImage2P(page.Item2, croppedNameL, croppedNameR, x1, y1, x2, y2, width, height);

                if (croppedNameL != null)
                    ConvertImageToPdf(croppedNameL, Path.Combine(tempFolder, Path.GetFileNameWithoutExtension(croppedNameL) + ".pdf"));
                if (croppedNameR != null)
                    ConvertImageToPdf(croppedNameR, Path.Combine(tempFolder, Path.GetFileNameWithoutExtension(croppedNameR) + ".pdf"));
            });

            LogWrite(" <");
            ConcatenatePages(tempFolder, outputPDF);
            LogWriteLine($">");
        }

        private static void CalibrateCrop(string calibrationImage, out int x1, out int y1, out int x2, out int y2, out int width, out int height)
        {
            // Load image
            BitmapImage img = new BitmapImage(new Uri(calibrationImage, UriKind.RelativeOrAbsolute));
            do { } while (img.IsDownloading);

            // Automatically find crop zone
            int stride = img.PixelWidth * 4;
            int size = img.PixelHeight * stride;
            byte[] pixels = new byte[size];
            img.CopyPixels(pixels, stride, 0);

            const byte bref = 254;
            const byte gref = 250;
            const byte rref = 245;


            int xmin, xmax, ymin, ymax;
            for (xmin = 350; ; xmin++)
            {
                if (xmin >= img.PixelWidth) Debugger.Break();
                int index = 100 * stride + 4 * xmin;
                if (pixels[index] != bref || pixels[index + 1] != gref || pixels[index + 2] != rref)
                    break;
            }
            for (ymin = 5; ; ymin++)
            {
                if (ymin >= img.PixelHeight) Debugger.Break();
                int index = ymin * stride + 4 * 500;
                if ((pixels[index] != bref || pixels[index + 1] != gref || pixels[index + 2] != rref)
                    && (pixels[index] != 254 || pixels[index + 1] != 253 || pixels[index + 2] != 252)
                    && (pixels[index] != 255 || pixels[index + 1] != 255 || pixels[index + 2] != 255))
                    break;
            }
            for (ymax = 2140; ; ymax--)
            {
                if (ymax < 0) Debugger.Break();
                int index = ymax * stride + 4 * 500;
                if ((pixels[index] != bref || pixels[index + 1] != gref || pixels[index + 2] != rref)
                    && (pixels[index] != 254 || pixels[index + 1] != 253 || pixels[index + 2] != 252)
                    && (pixels[index] != 255 || pixels[index + 1] != 255 || pixels[index + 2] != 255))
                    break;
            }

            x1 = xmin + 1;
            y1 = ymin + 1;
            width = 1919 - xmin - 1;
            height = ymax - ymin - 1;
            x2 = 1920;
            y2 = y1;

            pixels = null;
            img = null;
            GC.Collect();
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


        private static void CropImage2P(string source, string destinationL, string destinationR, int x1, int y1, int x2, int y2, int width, int height)
        {
            // Load image
            BitmapImage img = new BitmapImage(new Uri(source, UriKind.RelativeOrAbsolute));
            do { } while (img.IsDownloading);

            if (destinationL != null)
            {
                var cropped = new CroppedBitmap(img, new System.Windows.Int32Rect(x1, y1, width, height));

                var encoder = new PngBitmapEncoder();
                encoder.Frames.Add(BitmapFrame.Create(cropped));
                using (var filestream = new FileStream(destinationL, FileMode.Create))
                    encoder.Save(filestream);
            }

            if (destinationR != null)
            {
                var cropped = new CroppedBitmap(img, new System.Windows.Int32Rect(x2, y2, width, height));

                var encoder = new PngBitmapEncoder();
                encoder.Frames.Add(BitmapFrame.Create(cropped));
                using (var filestream = new FileStream(destinationR, FileMode.Create))
                    encoder.Save(filestream);
            }
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

