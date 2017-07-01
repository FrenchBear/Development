// PreparePLS
// Prépare les fichiers de Pour La Science pour l'export t411
//
// 2015-07-10   PV
// 2015-08-16   PV      2è série
// 2015-09-05   PV      3è série
// 2015-09-13   PV      6è série

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.IO;
using iTextSharp.text.pdf;
using static System.Console;
using System.Reflection;
using static System.Threading.Interlocked;      // Increment


namespace PreparePLS
{
    class PreparePLS
    {
        //static string sourceDir = @"D:\Home\Pierre\OneDrive\Large\Scans à traiter\PLS Série 6";
        static string sourceDir = @"F:\DocumentsSkull\ScanSnap";
        static string targetDir = @"C:\Temp\PLSOut";


        static Regex r1 = new Regex(@"^Pour la Science n°(\d+) - (\d+)-(\d+) - (.*)$");
        static string[] moisFr = new string[] { "Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre" };


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
            IEnumerable<string> revues = Directory.GetFiles(sourceDir, "*.pdf").OrderBy(x => x);
            int nSource = revues.Count();
            WriteLine($"Source: {sourceDir}, {nSource} file(s) to process");
            WriteLine($"Target: {targetDir}");

            WriteLine("\nEnter to start, Ctrl+C or q to exit");
            string l = ReadLine();
            if (l == "q" || l == "Q")
                return;

            // Prepare files in parallel mode
            revues.AsParallel().ForAll(filename => Prepare(filename));
            //Prepare(revues.First());

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


        static void Prepare(string filename)
        {
            int f = Increment(ref nFiles);

            string basename = Path.GetFileNameWithoutExtension(filename);
            Match m = r1.Match(basename);
            if (!m.Success) Debugger.Break();

            int issue = int.Parse(m.Groups[1].ToString());
            int year = int.Parse(m.Groups[2].ToString());
            int month = int.Parse(m.Groups[3].ToString());
            string summary = m.Groups[4].ToString();

            string title = string.Format("Pour la Science {0} {1} {2}", issue, moisFr[month - 1], year);
            WriteLine($"[{f}] {title}");

            int pages = getPDFPageCount(filename);
            int taille = (int)(0.5 + (new FileInfo(filename)).Length / 1024.0 / 1024.0);

            string dir = Path.Combine(targetDir, title);
            Directory.CreateDirectory(dir);

            using (FileStream fs = new FileStream(dir + @"\" + title + ".nfo", FileMode.Create))
            using (StreamWriter sw = new StreamWriter(fs, Encoding.GetEncoding(850)))
            {
                sw.WriteLine(string.Format("Pour la Science n°{0}", issue));
                sw.WriteLine("=====================================================");
                sw.WriteLine("Langue : Français");
                sw.WriteLine(string.Format("Date de parution : {0} {1}", moisFr[month - 1], year));
                sw.WriteLine(string.Format("Nb de pages : {0}", pages));
                sw.WriteLine("Format : PDF Scanné + texte OCR");
                sw.WriteLine(string.Format("Poids : {0} Mo", taille));
                sw.Write("=====================================================");
                sw.Flush();
            }

            using (FileStream fs = new FileStream(dir + @"\" + title + ".txt", FileMode.Create))
            using (StreamWriter sw = new StreamWriter(fs, Encoding.Default))
            {
                sw.WriteLine(string.Format(@"[center][color=red][b]Archives Pour la Science n°{0} - {1} {2}[/b][/color]


[img](insert path)[/img]

[i]Pour la Science, le magazine de référence de l'actualité scientifique.  En direct des laboratoires du monde entier, Pour la Science offre chaque mois une information rigoureuse et approfondie sur les découvertes scientifiques récentes.[/i]

[i]Archives de la revue d'il y a près de 30 ans, permettant de (re)découvrir avec nostalgie, curiosité, ou juste pour le plaisir l'actualité scientifique avec un quart de siècle de recul![/i]


[img]http://dreamprez.online.fr/img_post/Defaut/info_ebook.png[/img]

[b]Editeur : [/b] [i]Pour la Science[/i]
[b]Format : [/b] [i]PDF[/i]
[b]Genre : [/b] [i]Science[/i]
[b]Date de sortie : [/b] [i]{1} {2}[/i]


[img]http://dreamprez.online.fr/img_post/Defaut/detail_ebook.png[/img]

[b]Sommaire simplifié :[/b][i]
{3}[/i]


[img]http://dreamprez.online.fr/img_post/Defaut/up_ebook.png[/img]

[b]Format : [/b] [i]PDF Scan HQ + texte OCR masqué pour copie/recherche[/i]
[b]Résolution : [/b] [i]2417x3286 pixel[/i]
[b]Langue : [/b] [i]Français[/i]
[b]Nombre de pages : [/b] [i]{4}[/i]
[b]Taille du fichier[/b] : [i]{5} Mo[/i]



Pour la liste des numéros publiés, une simple recherche:
[b][url]http://www.t411.in/torrents/search/?search=Archives+Pour+la+Science&order=name&type=asc[/url][/b]


[url=http://www.t411.in/users/torrents/?id=105617045][img]http://zupimages.net/up/15/41/ne2f.gif[/img][/url]


[url=http://www.dream-prez.com][img]http://dreamprez.online.fr/images/genere.png[/img][/url]

[/center]", issue, moisFr[month - 1], year, summary, pages, taille));
            }

            string localFile = dir + @"\" + title + ".pdf";
            //File.Copy(filename, localFile, true);
            UpdateMetaDataAndCopyPDF(filename, localFile, title, summary);


            string cmdOptions = "A=\"" + localFile + "\" cat A1-1 output c:\\temp\\p" + issue.ToString() + ".pdf dont_ask";
            Process p = System.Diagnostics.Process.Start("pdftk.exe", cmdOptions);
            p.WaitForExit();

            cmdOptions = "C:\\temp\\p" + issue.ToString() + ".pdf -resize 400x552 \"" + dir + @"\" + title + "_Page_001.jpg\"";
            p = System.Diagnostics.Process.Start(@"C:\Program Files\ImageMagick-7\convert.exe", cmdOptions);
            p.WaitForExit();

        }

        private static void UpdateMetaDataAndCopyPDF(string filename, string localFile, string title, string summary)
        {
            using (PdfReader reader = new PdfReader(filename))
            using (PdfStamper stamper = new PdfStamper(reader, new FileStream(localFile, FileMode.Create)))
            {
                SortedDictionary<String, String> inf = new SortedDictionary<String, String>();
                inf.Add("Title", title);
                //inf.Add("Author", "?");
                inf.Add("Subject", summary);
                inf.Add("Keywords", "Scanné par glloq65");
                stamper.MoreInfo = inf;
                stamper.Close();
            }
        }

        static int getPDFPageCount(string path)
        {
            using (PdfReader reader = new PdfReader(path))
                return reader.NumberOfPages;
        }

    }
}
