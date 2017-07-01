// PrepareSA
// Prépare les fichiers des Scientific American pour l'export t411
//
// 2015-10-21   PV      1ère version

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.IO;
using iTextSharp.text.pdf;

namespace PrepareSA
{
    class PrepareSA
    {
        static Regex r1 = new Regex(@"^Scientific American - (?:\d+)-(?:\d+) - (.*)$");

        static void Main(string[] args)
        {
            //for (int y = 1993; y < 2016; y++)
            //{
            //    PrepareYear(y);
            //}
            PrepareYear(2016);

            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }

        static void PrepareYear(int year)
        {
            //string folder = @"W:\Revues\Science\Scientific American";
            string folder = @"C:\Downloads\PDF_A_Nettoyer";
            string[] revues = Directory.GetFiles(folder, "Scientific American - " + year.ToString() + "-*.pdf").OrderBy(x => x).ToArray();
            if (revues.Length != 12)
                Debugger.Break();

            string[] covers = new string[12];
            string[] contents = new string[12];
            int[] pages = new int[12];
            double[] sizes = new double[12];

            string f = $"Scientific American {year}";

            string rootdir = @"C:\Temp\#Scientific American";
            string dir = Path.Combine(rootdir, f);
            string subdir = Path.Combine(dir, f);
            if (!Directory.Exists(dir))
                Directory.CreateDirectory(dir);
            if (!Directory.Exists(subdir))
                Directory.CreateDirectory(subdir);

            for (int month = 0; month < 12; month++)
                Prepare(folder, year, month, revues[month], dir, subdir, ref covers[month], ref contents[month], ref pages[month], ref sizes[month]);

            using (FileStream fs = new FileStream(dir + @"\" + f + ".nfo", FileMode.Create))
            using (StreamWriter sw = new StreamWriter(fs, Encoding.GetEncoding(850)))
            {
                sw.WriteLine(string.Format("Scientific American Archives Year {0}", year));
                sw.WriteLine("=====================================================");
                sw.WriteLine("Langue : Anglais");
                sw.WriteLine(string.Format("Année de parution : {0}", year));
                sw.WriteLine("Éditeur : Scientific American Inc.");
                sw.WriteLine("Format : True PDF");
                sw.WriteLine("=====================================================");
                sw.WriteLine();
                for (int i = 0; i < 12; i++)
                {
                    sw.Write(string.Format("{0}-{1:D2}.pdf:  ", year, i + 1));
                    sw.Write(string.Format("Pages: {0,3}   ", pages[i]));
                    sw.WriteLine(string.Format("Poids: {0:F1} Mo", sizes[i]));
                }
                sw.Flush();
            }

            // Assemble 12 pics in a 3x4 mosaic with height=800px
            // montage c*.jpg -tile 3x -geometry +0+0 -resize x200 s4.jpg
            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            start.Arguments = "c*.jpg -tile 3x -geometry +0+0 -resize x200 gc.jpg";
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

            //for (int i = 0; i < 12; i++)
            //    File.Delete(dir + @"\" + covers[i]);

            using (FileStream fs = new FileStream(dir + @"\" + f + ".txt", FileMode.Create))
            using (StreamWriter sw = new StreamWriter(fs, Encoding.Default))
            {

                sw.WriteLine(string.Format(@"[center][color=red][b][size=5]Scientific American Archives {0}[/size][/b][/color]


[i]Founded in 1845, Scientific American is the oldest continuously published magazine in the U.S.  It's the leading source and authority for science, technology information and policy for a general audience.[/i]

[i]Chaque mois, Scientific American présente des informations scientifiques à destination d'un public général éduqué.  Ces archives en version originale (anglais) contiennent les revues publiées depuis 1993, à lire, à relire ou à collectionner pour les amateurs de science.[/i]


[img]gc.jpg[/img]


[img width=500]http://zupimages.net/up/15/42/6r15.png[/img]

[b]Éditeur : [/b] [i]Scientific American Inc.[/i]
[b]Format : [/b] [i].PDF[/i]
[b]Genre : [/b] [i]Sciences[/i]
[b]Année de publication : [/b] [i]{0}[/i]



[img width=500]http://zupimages.net/up/15/42/wmwo.png[/img]

", year));

                for (int i = 0; i < 12; i++)
                {
                    sw.WriteLine(string.Format("{0}-{1:D2}: {3} pages, {4} Mo\r\n{2}\r\n", year, i + 1, contents[i], pages[i], (int)(0.5 + sizes[i])));
                }

                sw.WriteLine(string.Format(@"


[img width=500]http://zupimages.net/up/15/42/bxhg.png[/img]

[b]Format : [/b] [i]True PDF[/i]
[b]Langue : [/b] [i]Anglais[/i]
[b]Taille totale[/b] : [i]{0} Mo[/i]



Pour les autres archives:
[b][url]http://www.t411.in/torrents/search/?search=Scientific+American+Archives&order=name&type=asc[/url][/b]



[url=http://www.t411.in/users/torrents/?id=105617045][img]http://zupimages.net/up/15/41/ne2f.gif[/img][/url]


[/center]", (int)(0.5 + sizes.Sum())));
            }
        }


        static void Prepare(string folder, int year, int month, string filename, string targetImageDir, string targetPDFdir, ref string cover, ref string content, ref int pages, ref double taille)
        {
            string basename = Path.GetFileNameWithoutExtension(filename);
            string dir = Path.GetDirectoryName(filename);

            Match m = r1.Match(basename);
            if (!m.Success) Debugger.Break();
            content = m.Groups[1].ToString();

            string title = string.Format("Scientific American {0}-{1:D2}", year, month + 1);
            Console.WriteLine(title);

            string targetFile = Path.Combine(targetPDFdir, title + ".pdf");
            // Copy already Ok
            File.Copy(filename, targetFile, true);
            File.Copy(filename, @"c:\temp\PDF\" + title + ".pdf", true);

            pages = getPDFPageCount(filename);
            taille = (new FileInfo(filename)).Length / 1024.0 / 1024.0;

            // Images already Ok
            // return;

            // Folder to extract 1st page contains unprotected PDFs that support extraction,
            // so it's not root folder that contains original files with full name
            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            start.Arguments = "A=\"" + @"C:\temp\PDF" + "\\" + title + ".pdf\" cat A1-1 output c:\\temp\\p" + year.ToString() + "-" + (month + 1).ToString("D2") + ".pdf dont_ask";
            //start.Arguments = "A=\"" + targetFile + "\" cat A1-1 output c:\\temp\\p" + year.ToString() + "-" + (month + 1).ToString("D2") + ".pdf dont_ask";
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
