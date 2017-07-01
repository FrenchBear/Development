// PreparePLS2
// Prépare les fichiers des Pour la Science par semestre pour l'export t411
//
// 2015-11-29   PV      1ère version

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.IO;
using iTextSharp.text.pdf;

namespace PreparePLS2
{
    class PreparePLS2
    {
        static Regex r1 = new Regex(@"^Pour la Science n°(\d+) - (?:\d+)-(?:\d+) - (.*)$");

        static void Main(string[] args)
        {
            for (int y = 1994; y < 1996; y++)
            {
                PrepareYear(y, 1);
                PrepareYear(y, 2);
            }
            //PrepareYear(1992, 2);

            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }

        static void PrepareYear(int year, int semester)
        {
            string folder = @"W:\Revues\Science\Pour la Science";
            var q = Directory.GetFiles(folder, "*.pdf").Where(file => file.Contains($" - {year}-")).OrderBy(x => x);
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

            string f = $"Pour la Science {year}-S{semester}";

            string rootdir = @"C:\Temp\#Pour la Science";
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
                sw.WriteLine(string.Format("Pour la Science {0}-S{1}", year, semester));
                sw.WriteLine("=====================================================");
                sw.WriteLine("Langue : Français");
                sw.WriteLine(string.Format("Année de parution : {0}", year));
                sw.WriteLine("Éditeur : Pour la Science");
                sw.WriteLine("Format : PDF Scanné (2410x3300 environ) + texte OCR");
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

            //for (int i = 0; i < 6; i++)
            //    File.Delete(dir + @"\" + covers[i]);

            using (FileStream fs = new FileStream(dir + @"\" + f + ".txt", FileMode.Create))
            using (StreamWriter sw = new StreamWriter(fs, Encoding.Default))
            {

                sw.WriteLine(string.Format(@"[center][color=red][b][size=5]Archives Pour la Science {0}-S{1}[/size][/b][/color]


[i]Pour la Science, le magazine de référence de l'actualité scientifique.  En direct des laboratoires du monde entier, Pour la Science offre chaque mois une information rigoureuse et approfondie sur les découvertes scientifiques récentes.[/i]

[i]Archives de la revue d'il y a près de 20 ans, permettant de (re)découvrir avec nostalgie, curiosité, ou juste pour le plaisir l'actualité scientifique avec un quart de siècle de recul![/i]


[img]gc.jpg[/img]


[img width=500]http://zupimages.net/up/15/42/6r15.png[/img]

[b]Editeur : [/b] [i]Pour la Science[/i]
[b]Format : [/b] [i]PDF[/i]
[b]Genre : [/b] [i]Science[/i]
[b]Date de publication : [/b] [i]{0} {2} semestre[/i]



[img width=500]http://zupimages.net/up/15/42/wmwo.png[/img]

", year, semester, semester==1?"1er":"2ème"));

                for (int i = 0; i < 6; i++)
                {
                    sw.WriteLine(string.Format("n°{5} - {0}-{1:D2}: {3} pages, {4} Mo\r\n{2}\r\n", year, i + 1, contents[i], pages[i], (int)(0.5 + sizes[i]), issues[i]));
                }

                sw.WriteLine(string.Format(@"


[img width=500]http://zupimages.net/up/15/42/bxhg.png[/img]

[b]Format : [/b] [i]PDF Scan HQ + texte OCR masqué pour copie/recherche[/i]
[b]Résolution : [/b] [i]2410x3300 pixels environ[/i]
[b]Langue : [/b] [i]Français[/i]
[b]Taille totale[/b] : [i]{0} Mo[/i]



Pour les autres archives:
[b][url]http://www.t411.in/torrents/search/?search=Archives+Pour+la+Science&order=name&type=desc[/url][/b]



[url=http://www.t411.in/users/torrents/?id=105617045][img]http://zupimages.net/up/15/41/ne2f.gif[/img][/url]


[/center]", (int)(0.5 + sizes.Sum())));
            }
        }


        static void Prepare(string folder, int year, int semester, int month, string filename, string targetImageDir, string targetPDFdir, ref int issue, ref string cover, ref string content, ref int pages, ref double taille)
        {
            string basename = Path.GetFileNameWithoutExtension(filename);
            string dir = Path.GetDirectoryName(filename);

            Match m = r1.Match(basename);
            if (!m.Success) Debugger.Break();
            issue = int.Parse(m.Groups[1].ToString());
            content = m.Groups[2].ToString();

            string title = string.Format("Pour la Science n°{0} - {1}-{2:D2}", issue, year, month + 1+ 6 * (semester - 1));
            Console.WriteLine(title);

            string targetFile = Path.Combine(targetPDFdir, title + ".pdf");
            File.Copy(filename, targetFile, true);
            //File.Copy(filename, @"c:\temp\PDF\" + title + ".pdf", true);

            pages = getPDFPageCount(filename);
            taille = (new FileInfo(filename)).Length / 1024.0 / 1024.0;

            // Images already Ok
            // return;

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


        static int getPDFPageCount(string path)
        {
            using (PdfReader reader = new PdfReader(path))
                return reader.NumberOfPages;
        }

    }
}
