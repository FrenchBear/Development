// TagPDF
// Met à jour les tags PDF pour l'export t411
//
// 2015-10-06   PV

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.IO;
using iTextSharp.text.pdf;
using static System.Console;
using System.Reflection;
using static System.Threading.Interlocked;      // Increment
using System.Text.RegularExpressions;

namespace PreparePLS
{
    class TagPDF
    {
        //static string sourceDir = @"W:\Revues\Science\Pour la Science";
        static string sourceDir = @"F:\DocumentsSkull\ScanSnap";
        static string targetDir = @"C:\Temp\TagPDF";


        static int nFiles = 0;


        static void Main(string[] args)
        {
            // Application banner
            WriteLine(AppTitleVersion());

            // Check and prepare folders
            if (!Directory.Exists(sourceDir))
            {
                WriteLine("Invalid source: " + sourceDir);
                VisualStudioFinalPause();
                Environment.Exit(1);
            }
            // Create some folders if needed, will simply crash if folders are invalid
            if (!Directory.Exists(targetDir))
                Directory.CreateDirectory(targetDir);


            // Almost good to go!
            // Count files to process
            IEnumerable<string> books = Directory.GetFiles(sourceDir, "*.pdf").OrderBy(x => x);
            int nSource = books.Count();
            WriteLine($"Source: {sourceDir}, {nSource} file(s) to process");
            WriteLine($"Target: {targetDir}");

            WriteLine("\nEnter to start, Ctrl+C or q to exit");
            string l = ReadLine();
            if (l == "q" || l == "Q")
                return;

            // Prepare files in parallel mode
            books.AsParallel().ForAll(filename => Prepare(filename));
            //Prepare(books.First());

            VisualStudioFinalPause();
        }


        // If running in Visual Studio, do some pause so we have a chance to read
        // messages before window is closed
        private static void VisualStudioFinalPause()
        {
            if (Debugger.IsAttached)
            {
                WriteLine();
                Write("(Pause)");
                Console.ReadLine();
            }
        }

        // Shows standard application banner
        private static string AppTitleVersion()
        {
            Assembly myAssembly = System.Reflection.Assembly.GetExecutingAssembly();
            AssemblyTitleAttribute aTitleAttr = (AssemblyTitleAttribute)AssemblyTitleAttribute.GetCustomAttribute(myAssembly, typeof(AssemblyTitleAttribute));
            string sAssemblyVersion = myAssembly.GetName().Version.Major.ToString() + "." + myAssembly.GetName().Version.Minor.ToString() + "." + myAssembly.GetName().Version.Build.ToString();

            return aTitleAttr.Title + " " + sAssemblyVersion;
        }


        static void Prepare(string fullFileName)
        {
            //Regex r = new Regex(@"(Bibliothèque Tangente HS \d\d) - (.*).pdf");
            // Pour la Science n°51 - 1982-01 - Les couleurs des papillons - La pêche au XVIè siècle - La naissance de la terre - Les anneaux des planètes
            // Regex r = new Regex(@"(Pour la Science n°\d\d\d?b? - \d{4}-\d{2}) - (.*).pdf");
            Regex r = new Regex(@"(.*La Recherche n°\d\d\d? - \d{4}-\d{2}\.?\.?\d?\d?) - (.*)\.pdf");
            string fileName = Path.GetFileName(fullFileName);
            Match ma = r.Match(fileName);
            if (!ma.Success)
                return;

            int f = Increment(ref nFiles);
            WriteLine($"[{f}] {ma.Groups[1].ToString()} // {ma.Groups[2].ToString()}");

            string target = Path.Combine(targetDir, Path.GetFileName(fullFileName));
            PdfReader reader = new PdfReader(fullFileName);
            PdfStamper stamper = new PdfStamper(reader, new FileStream(target, FileMode.Create));
            SortedDictionary<String, String> inf = new SortedDictionary<String, String>();
            //inf.Add("Title", Path.GetFileNameWithoutExtension(fullFileName));
            inf.Add("Title", ma.Groups[1].ToString());
            inf.Add("Subject", ma.Groups[2].ToString());
            //inf.Add("Author", "Also Yuk Dara");
            inf.Add("Keywords", "Scanné par glloq65");
            stamper.MoreInfo = inf;
            stamper.Close();
        }
    }
}
