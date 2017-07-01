// PreparePLS4
// Prépare les fichiers des Pour la Science par semestre pour l'export t411
//
// 2016-05-24   PV  1ère version; path pour imageMagick
// 2016-12-22   PV  4è version, export annuel

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

namespace PreparePLS4
{
    class PreparePLS4
    {
        static Regex r1 = new Regex(@"^Pour la Science n°(\d+) - (?:\d+)-(?:\d+) - (.*)$");

        const string imageMagickPath = @"C:\Program Files\ImageMagick-7";

        static void Main(string[] args)
        {
            //var years = Enumerable.Range(1984, 33);
            var years = Enumerable.Range(1999, 7);
            years.AsParallel().ForAll(y => PrepareYear(y));
            //for (int y = 1984; y < 2006; y++)
            //    PrepareYear(y);
            //PrepareYear(2006);

            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }

        static void PrepareYear(int year)
        {
            string folder = @"E:\Pour la Science";
            string[] revues = Directory.GetFiles(folder, "*.pdf").Where(file => file.Contains($" - {year}-")).OrderBy(x => x).ToArray();
            if (revues.Length != 12)
                Debugger.Break();

            int[] issues = new int[12];
            string[] covers = new string[12];
            string[] contents = new string[12];
            int[] pages = new int[12];
            double[] sizes = new double[12];

            string fRevues = $"Pour la Science {year}";
            string fPrez = $"Prez Pour la Science {year}";

            string rootdir = @"C:\Temp\#Pour la Science";
            string dirRevues = Path.Combine(rootdir, fRevues);
            string dirPrez = Path.Combine(rootdir, fPrez);
            if (!Directory.Exists(dirRevues))
                Directory.CreateDirectory(dirRevues);
            if (!Directory.Exists(dirPrez))
                Directory.CreateDirectory(dirPrez);

            for (int month = 0; month < 12; month++)
                Prepare(folder, year, month, revues[month], dirPrez, dirRevues, ref issues[month], ref covers[month], ref contents[month], ref pages[month], ref sizes[month]);

            /*
            using (FileStream fs = new FileStream(dirPrez + @"\" + fRevues + ".nfo", FileMode.Create))
            using (StreamWriter sw = new StreamWriter(fs, Encoding.GetEncoding(850)))
            {
                sw.WriteLine(string.Format("Pour la Science {0}", year));
                sw.WriteLine("=====================================================");
                sw.WriteLine("Langue : Français");
                sw.WriteLine(string.Format("Année de parution : {0}", year));
                sw.WriteLine("Éditeur : Pour la Science");
                if (year < 1996)
                    sw.WriteLine("Format : PDF Scanné (2410x3300 environ) + texte OCR");
                else
                    sw.WriteLine("Format : PDF (images 1650x2260 environ) + texte");
                sw.WriteLine("=====================================================");
                sw.WriteLine();
                for (int i = 0; i < 12; i++)
                {
                    sw.Write(string.Format("Pages: {0,3}   ", pages[i]));
                    sw.Write(string.Format("Poids: {0,5:F1} Mo   ", sizes[i]));
                    sw.WriteLine(string.Format("Pour la Science n°{0} - {1}-{2:D2} - {3}.pdf", issues[i], year, i + 1, contents[i]));
                }
                sw.Flush();
            }
            */

            /*
            // Assemble 12 pics in a 3x4 mosaic with height=800px
            // montage c*.jpg -tile 3x -geometry +0+0 -resize x200 s4.jpg
            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            start.Arguments = $"c*.jpg -colorspace sRGB -tile 3x -geometry +0+0 -resize x195 gc-{year}.jpg";
            start.FileName = imageMagickPath + @"\montage.exe";
            start.UseShellExecute = true;
            start.WindowStyle = ProcessWindowStyle.Hidden;
            start.CreateNoWindow = true;
            start.WorkingDirectory = dirPrez;
            using (Process proc = Process.Start(start))
            {
                proc.WaitForExit();
                exitCode = proc.ExitCode;
            }
            */

            using (FileStream fs = new FileStream(dirPrez + @"\" + fRevues + ".txt", FileMode.Create))
            using (StreamWriter sw = new StreamWriter(fs, Encoding.Default))
            {
                sw.WriteLine(string.Format(@"[center][color=red][b][size=5]Archives Pour la Science {0}[/size][/b][/color]


[i]Pour la Science, le magazine de référence de l'actualité scientifique, est l'édition française de la revue Scientific American.  En direct des laboratoires du monde entier, Pour la Science offre chaque mois une information rigoureuse et approfondie sur les découvertes scientifiques récentes.[/i]

[i]Ce post republie 33 années des archives de la revue soit l'intégralité des numéros depuis 1984, permettant de (re)découvrir avec nostalgie, curiosité, ou juste pour le plaisir l'actualité scientifique de ces trente dernières années.

Ces archives ont déjà été publiées sous forme individuelle ou en semestres jusqu'à 1995, ce qui ne permettait pas de les récupérer facilement, avec plus d'une centaine de torrents.  La nouvelle version des archives a un contenu pdf inchangé, mais ajoute 21 années supplémentaires de 1996 à 2016, et regroupe désormais les numéros par année, plus pratique pour ceux qui veulent les récupérer d'un coup.  Tous les PDF sont 'nettoyés', la protection retirée et le texte (True PDF ou OCR) est disponible pour recherche ou indexation.[/i]


[img]gc.jpg[/img]


[img width=500]http://zupimages.net/up/15/42/6r15.png[/img]

[b]Editeur : [/b] [i]Pour la Science[/i]
[b]Format : [/b] [i]PDF[/i]
[b]Genre : [/b] [i]Science[/i]
[b]Date de publication : [/b] [i]{0}[/i]



[img width=500]http://zupimages.net/up/15/42/wmwo.png[/img]

", year));

                for (int i = 0; i < 12; i++)
                {
                    sw.WriteLine(string.Format("n°{5} - {0}-{1:D2}: {3} pages, {4} Mo\r\n{2}\r\n", year, i + 1, contents[i], pages[i], (int)(0.5 + sizes[i]), issues[i]));
                }

                sw.WriteLine(string.Format(@"


[img width=500]http://zupimages.net/up/15/42/bxhg.png[/img]

[b]Format : [/b] [i]{0}[/i]
[b]Résolution : [/b] [i]{1}[/i]
[b]Langue : [/b] [i]Français[/i]
[b]Taille totale[/b] : [i]{2} Mo[/i]



Pour les autres archives:
[b][url]http://www.t411.li/torrents/search/?search=Archives+Pour+la+Science&order=name&type=desc[/url][/b]



[url=http://www.t411.li/users/torrents/?id=105617045][img]http://zupimages.net/up/15/41/ne2f.gif[/img][/url]


[/center]", year < 1996 ? "PDF Scan HQ + texte OCR masqué pour copie/recherche" : "True PDF ou PDF avec texte OCR",
            year < 1996 ? "2410x3300 pixels environ" : "1650x2260 pixels environ",
            (int)(0.5 + sizes.Sum())));
            }

        }


        static void Prepare(string folder, int year, int month, string filename, string targetImageDir, string targetPDFdir, ref int issue, ref string cover, ref string content, ref int pages, ref double taille)
        {
            string basename = Path.GetFileNameWithoutExtension(filename);
            string dir = Path.GetDirectoryName(filename);

            Match m = r1.Match(basename);
            if (!m.Success) Debugger.Break();
            issue = int.Parse(m.Groups[1].ToString());
            content = m.Groups[2].ToString();

            string title = string.Format("Pour la Science n°{0} - {1}-{2:D2}", issue, year, month + 1);
            Console.WriteLine(title);

            string targetFile = Path.Combine(targetPDFdir, title + " - " + content + ".pdf");
            //File.Copy(filename, targetFile, true);

            pages = getPDFPageCount(filename);
            taille = (new FileInfo(filename)).Length / 1024.0 / 1024.0;

            // Images already Ok
            return;

            // Folder to extract 1st page contains unprotected PDFs that support extraction,
            // so it's not root folder that contains original files with full name
            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            //start.Arguments = "A=\"" + @"C:\temp\PDF" + "\\" + title + ".pdf\" cat A1-1 output c:\\temp\\p" + year.ToString() + "-" + (month + 1).ToString("D2") + ".pdf dont_ask";
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
            start.FileName = imageMagickPath + @"\convert.exe";
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

        static int getPDFPageCount(string path)
        {
            using (PdfReader reader = new PdfReader(path))
                return reader.NumberOfPages;
        }

    }
}
