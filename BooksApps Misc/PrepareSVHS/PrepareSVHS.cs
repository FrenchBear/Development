// PrepareSVHS
// Prépare les fichiers des archives Science & Vie Hors-Série par année pour l'export t411
//
// 2016-04-22   PV      Première version
// 2016-05-11   PV      imageMagickPath

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


namespace PrepareSVHS
{
    class PrepareSVHS
    {
        private const string imageMagickPath = @"C:\Program Files\ImageMagick-7";
        static int totalPages = 0;

        static void Main(string[] args)
        {
            //PrepareYear(2000);
            for (int y = 2000; y < 2004; y++)
                PrepareYear(y);

            WriteLine();
            WriteLine($"Total pages: {totalPages}");

            WriteLine();
            Write("(Pause)");
            ReadLine();
        }

        static void PrepareYear(int year)
        {
            string sourcePath = @"F:\S&V HS après OCR";
            string[] revues = Directory.GetFiles(sourcePath, $"* - {year}-*.pdf").OrderBy(x => x).ToArray();

            if (revues.Length != 4)
                Debugger.Break();

            int[] issues = new int[4];
            string[] covers = new string[4];
            string[] contents = new string[4];
            int[] pages = new int[4];
            double[] sizes = new double[4];

            string f = $"Science & Vie Hors-Série {year}";

            string rootdir = @"C:\Temp\#Science & Vie Hors-Série";
            if (!Directory.Exists(rootdir))
                Directory.CreateDirectory(rootdir);
            string dir = Path.Combine(rootdir, "Prez " + f);
            string subdir = Path.Combine(rootdir, f);
            if (!Directory.Exists(dir))
                Directory.CreateDirectory(dir);
            if (!Directory.Exists(subdir))
                Directory.CreateDirectory(subdir);

            for (int issue = 0; issue < 4; issue++)
                Prepare(sourcePath, year, issue * 3 + 3, revues[issue], dir, subdir, ref issues[issue], ref covers[issue], ref contents[issue], ref pages[issue], ref sizes[issue]);

            using (FileStream fs = new FileStream(dir + @"\" + f + ".nfo", FileMode.Create))
            using (StreamWriter sw = new StreamWriter(fs, Encoding.GetEncoding(850)))
            {
                sw.WriteLine(string.Format("Science & Vie Hors-Série {0}", year));
                sw.WriteLine("=====================================================");
                sw.WriteLine("Langue : Français");
                sw.WriteLine(string.Format("Année de parution : {0}", year));
                sw.WriteLine("Éditeur : Excelsior Publications SA");
                sw.WriteLine("Format : PDF Scanné (1950x2810 environ) + texte OCR");
                sw.WriteLine("=====================================================");
                sw.WriteLine();
                for (int i = 0; i < 4; i++)
                {
                    sw.Write(string.Format("Science & Vie HS {0} - {1}-{2:D2}.pdf:  ", issues[i], year, i * 3 + 3));
                    sw.Write(string.Format("Pages: {0,3}   ", pages[i]));
                    sw.WriteLine(string.Format("Poids: {0:F1} Mo", sizes[i]));
                }
                sw.Flush();
            }

            // Assemble 4 pics in a 2x2 mosaic with height=800px
            // montage c*.jpg -tile 2x -geometry +0+0 -resize x200 s4.jpg
            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            start.Arguments = "c*.jpg -tile 2x -geometry +0+0 -resize x350 gc.jpg";
            start.FileName = Path.Combine(imageMagickPath, "montage.exe");
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

                sw.WriteLine(string.Format(@"[center][color=red][b][size=5]Archives Science & Vie Hors-Série {0}[/size][/b][/color]


[i]Quatre fois par an est publié un numéro de Science & Vie Hors-Série, célèbre mensuel de vulgarisation scientifique.  En 160 pages et très peu de publicité, un thème spécifique de santé, aviation, automobile, astronomie… est abordé en détail sous divers angles, avec la participation de scientifiques et d'experts reconnus dans le domaine.[/i]

[i]Cette nouvelle série d'archives numérisées couvre 4 années en 16 numéros, de mars 2000 à décembre 2003, et fait suite aux 21 années déjà publiées.  (Re)découvrez avec nostalgie, curiosité, ou juste pour le plaisir de lire les thèmes scientifiques et techniques de ces numéros, tels qu'ils étaient perçus et développés en ce début du XXIe siècle![/i]


[img]gc.jpg[/img]


[img width=500]http://zupimages.net/up/15/42/6r15.png[/img]

[b]Éditeur : [/b] [i]Excelsior Publications SA[/i]
[b]Format : [/b] [i]PDF[/i]
[b]Genre : [/b] [i]Science, Techniques[/i]
[b]Année de publication : [/b] [i]{0}[/i]



[img width=500]http://zupimages.net/up/15/42/wmwo.png[/img]

", year));

                for (int i = 0; i < 4; i++)
                {
                    sw.WriteLine(string.Format("n°{5} - {0}-{1:D2}: {3} pages, {4} Mo\r\n{2}\r\n", year, i * 3 + 3, contents[i], pages[i], (int)(0.5 + sizes[i]), issues[i]));

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



        static Regex r1 = new Regex(@"^Science & Vie HS (\d+) - (?:\d+)-(?:\d+) - (.*)$");

        static void Prepare(string folder, int year, int month, string filename, string targetImageDir, string targetPDFdir, ref int issue, ref string cover, ref string content, ref int pages, ref double taille)
        {
            string basename = Path.GetFileNameWithoutExtension(filename);
            string dir = Path.GetDirectoryName(filename);

            Match m = r1.Match(basename);
            if (!m.Success) Debugger.Break();
            issue = int.Parse(m.Groups[1].ToString());
            content = m.Groups[2].ToString().Replace('§', '?');

            string title = string.Format("Science & Vie HS {0} - {1}-{2:D2}", issue, year, month);
            WriteLine(basename);

            string targetFile = Path.Combine(targetPDFdir, title.Replace("§", "") + ".pdf");
            UpdateMetaDataAndCopyPDF(filename, targetFile, title, content);
            //string t2 = @"c:\temp\pdf\" + basename + ".pdf";
            //UpdateMetaDataAndCopyPDF(filename, t2, title, content);

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
            start.FileName = Path.Combine(imageMagickPath, "convert.exe");
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
