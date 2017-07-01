// PrepareSV
// Prépare les fichiers des archives Science & Vie par semestre pour l'export t411
//
// 2016-02-18   PV      1ère version
// 2016-03-30   PV      .in -> .ch

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


namespace PrepareSV
{
    class PrepareSV
    {

        static int totalPages = 0;
        static void Main(string[] args)
        {
            PrepareYear(1979, 1);
            PrepareYear(1979, 2);
            //for (int y = 1980; y <= 2002; y++)
            //{
            //    PrepareYear(y, 1);
            //    PrepareYear(y, 2);
            //}

            WriteLine();
            WriteLine($"Total pages: {totalPages}");

            WriteLine();
            Write("(Pause)");
            ReadLine();
        }

        static void PrepareYear(int year, int semester)
        {
            string sourcePath = @"F:\Science & Vie OCR";
            string folder = Path.Combine(sourcePath, $"{year} ocr");
            var q = Directory.GetFiles(folder, "*.pdf").OrderBy(x => x);
            string[] revues;
            if (semester == 1)
                revues = q.Take(6).ToArray();
            else
                revues = q.Skip(6).ToArray();

            if (revues.Length != 6)
                Debugger.Break();

            int[] issues = new int[6];
            string[] covers = new string[6];
            string[] contents = new string[6];
            int[] pages = new int[6];
            double[] sizes = new double[6];

            string f = $"Science & Vie {year}-S{semester}";

            string rootdir = @"C:\Temp\#Science & Vie";
            if (!Directory.Exists(rootdir))
                Directory.CreateDirectory(rootdir);
            string dir = Path.Combine(rootdir, f);
            string subdir = Path.Combine(dir, f);
            if (!Directory.Exists(dir))
                Directory.CreateDirectory(dir);
            if (!Directory.Exists(subdir))
                Directory.CreateDirectory(subdir);

            for (int month = 0; month < 6; month++)
                Prepare(folder, year, semester, month, revues[month], dir, subdir, ref issues[month], ref covers[month], ref contents[month], ref pages[month], ref sizes[month]);

            using (FileStream fs = new FileStream(dir + @"\" + f + ".nfo", FileMode.Create))
            using (StreamWriter sw = new StreamWriter(fs, Encoding.GetEncoding(850)))
            {
                sw.WriteLine(string.Format("Science & Vie {0}-S{1}", year, semester));
                sw.WriteLine("=====================================================");
                sw.WriteLine("Langue : Français");
                sw.WriteLine(string.Format("Année de parution : {0}", year));
                sw.WriteLine("Éditeur : Excelsior Publications SA");
                sw.WriteLine("Format : PDF Scanné (1950x2810 environ) + texte OCR");
                sw.WriteLine("=====================================================");
                sw.WriteLine();
                for (int i = 0; i < 6; i++)
                {
                    sw.Write(string.Format("n°{0} - {1}-{2:D2}.pdf:  ", issues[i], year, i + 1 + 6 * (semester - 1)));
                    sw.Write(string.Format("Pages: {0,3}   ", pages[i]));
                    sw.WriteLine(string.Format("Poids: {0:F1} Mo", sizes[i]));
                }
                sw.Flush();
            }

            // Assemble 6 pics in a 3x4 mosaic with height=800px
            // montage c*.jpg -tile 3x -geometry +0+0 -resize x200 s4.jpg
            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            start.Arguments = "c*.jpg -tile 2x -geometry +0+0 -resize x265 gc.jpg";
            start.FileName = @"C:\Program Files\ImageMagick-7\montage.exe";
            start.UseShellExecute = true;
            start.WindowStyle = ProcessWindowStyle.Hidden;
            start.CreateNoWindow = true;
            start.WorkingDirectory = dir;
            using (Process proc = Process.Start(start))
            {
                proc.WaitForExit();
                exitCode = proc.ExitCode;
            }

            using (FileStream fs = new FileStream(dir + @"\" + f + ".txt", FileMode.Create))
            using (StreamWriter sw = new StreamWriter(fs, Encoding.Default))
            {

                sw.WriteLine(string.Format(@"[center][color=red][b][size=5]Archives Science & Vie {0}-S{1}[/size][/b][/color]


[i]Science & Vie, célèbre mensuel et premier magazine de vulgarisation scientifique européen, publie chaque mois sur plus de 160 pages des articles clairs et illustrés sur des sujets variés.  Destiné à un large public de curieux et d'amateurs de science, techniques, santé, écologie, aéronautique, astronomie, électronique, photographie, informatique, ..., il est publié depuis plus de 100 ans.[/i]

[i]Cette série d'archives numérisées couvre presque un quart de siècle, 276 numéros du n°748 de janvier 1980 à 9 Francs au n°1023 de décembre 2002 à 3,50 €.  (Re)découvrez avec nostalgie, curiosité, ou juste pour le plaisir de lire l'actualité scientifique et technique, et retrouvez les évènements, les pubs et les 'nouveaux produits' de la fin du XXe siècle![/i]


[img]gc.jpg[/img]


[img width=500]http://zupimages.net/up/15/42/6r15.png[/img]

[b]Éditeur : [/b] [i]Excelsior Publications SA[/i]
[b]Format : [/b] [i]PDF[/i]
[b]Genre : [/b] [i]Science, Techniques[/i]
[b]Date de publication : [/b] [i]{0} {2} semestre[/i]



[img width=500]http://zupimages.net/up/15/42/wmwo.png[/img]

", year, semester, semester == 1 ? "1er" : "2ème"));

                for (int i = 0; i < 6; i++)
                {
                    sw.WriteLine(string.Format("n°{5} - {0}-{1:D2}: {3} pages, {4} Mo\r\n{2}\r\n", year, i + 1 + 6 * (semester - 1), contents[i], pages[i], (int)(0.5 + sizes[i]), issues[i]));

                    totalPages += pages[i];
                }

                sw.WriteLine(string.Format(@"


[img width=500]http://zupimages.net/up/15/42/bxhg.png[/img]

[b]Format : [/b] [i]PDF Scan HQ + texte OCR masqué pour copie/recherche[/i]
[b]Résolution : [/b] [i]1950x2180 pixels environ[/i]
[b]Langue : [/b] [i]Français[/i]
[b]Taille totale[/b] : [i]{0} Mo[/i]


Pour les autres archives:
[b][url]http://www.t411.ch/torrents/search/?search=Archives+Science+Vie&order=name&type=asc[/url][/b]



[url=http://www.t411.ch/users/torrents/?id=105617045][img]http://zupimages.net/up/15/41/ne2f.gif[/img][/url]


[/center]", (int)(0.5 + sizes.Sum())));
            }

            WriteLine();
        }



        static Regex r1 = new Regex(@"^Science & Vie n°(\d+) - (?:\d+)-(?:\d+) - (.*)$");

        static void Prepare(string folder, int year, int semester, int month, string filename, string targetImageDir, string targetPDFdir, ref int issue, ref string cover, ref string content, ref int pages, ref double taille)
        {
            string basename = Path.GetFileNameWithoutExtension(filename);
            string dir = Path.GetDirectoryName(filename);

            Match m = r1.Match(basename);
            if (!m.Success) Debugger.Break();
            issue = int.Parse(m.Groups[1].ToString());
            content = m.Groups[2].ToString().Replace('§', '?');

            string title = string.Format("Science & Vie n°{0} - {1}-{2:D2}", issue, year, month + 1 + 6 * (semester - 1));
            WriteLine(basename);

            string targetFile = Path.Combine(targetPDFdir, title.Replace("§", "") + ".pdf");
            UpdateMetaDataAndCopyPDF(filename, targetFile, title, content);

            pages = getPDFPageCount(filename);
            taille = (new FileInfo(filename)).Length / 1024.0 / 1024.0;

            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            start.Arguments = "A=\"" + targetFile + "\" cat A1-1 output c:\\temp\\p" + year.ToString() + "-" + (month + 1).ToString("D2") + ".pdf dont_ask";
            start.FileName = @"pdftk.exe";
            start.UseShellExecute = true;
            start.WindowStyle = ProcessWindowStyle.Hidden;
            start.CreateNoWindow = true;
            start.WorkingDirectory = @"C:\temp";
            using (Process proc = Process.Start(start))
            {
                proc.WaitForExit();
                exitCode = proc.ExitCode;
            }

            cover = "C" + year.ToString() + "-" + (month + 1).ToString("D2") + ".jpg";
            start.Arguments = "C:\\temp\\p" + year.ToString() + "-" + (month + 1).ToString("D2") + ".pdf -alpha remove -resize x400 \"" + targetImageDir + @"\" + cover + "\"";
            start.FileName = @"C:\Program Files\ImageMagick-7\convert.exe";
            start.UseShellExecute = true;
            start.WindowStyle = ProcessWindowStyle.Hidden;
            start.CreateNoWindow = true;
            start.WorkingDirectory = @"C:\temp";
            using (Process proc = Process.Start(start))
            {
                proc.WaitForExit();
                exitCode = proc.ExitCode;
            }
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

                stamper.Writer.ExtraCatalog.Put(PdfName.PAGELAYOUT, PdfName.TWOPAGERIGHT);

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
