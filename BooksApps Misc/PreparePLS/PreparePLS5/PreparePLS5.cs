// PreparePLS5
// Prépare les fichiers des Pour la Science par semestre pour l'export t411
//
// 2016-05-24   PV  1ère version; path pour imageMagick
// 2016-12-22   PV  4è version, export annuel
// 2016-12-27   PV  5è version pour les Dossiers PlS

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

namespace PreparePLS5
{
    class PreparePLS5
    {
        static Regex r1 = new Regex(@"^Dossier Pour la Science n°(\d+) - (\d+)-(\d{2}\.{2}\d{2}) - (.*)$");

        const string imageMagickPath = @"C:\Program Files\ImageMagick-7";

        static void Main(string[] args)
        {
            int[] years = { 1993, 1996, 1999, 2002, 2005, 2008, 2011, 2014 };
            //var years = Enumerable.Range(1999, 7);
            years.AsParallel().ForAll(y => PrepareYear(y));
            //    PrepareYear(y);
            //PrepareYear(1993);      // 3 years starting 1993
            //PrepareYear(1996);

            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }

        static void PrepareYear(int year)
        {
            string folder = @"E:\DPLSUnprot";
            string[] revues = Directory.GetFiles(folder, "*.pdf")
                .Where(file => file.Contains($" - {year}-") || file.Contains($" - {year + 1}-") || file.Contains($" - {year + 2}-"))
                .OrderBy(x => x)
                .ToArray();
            if ((year == 1993 && revues.Length != 9) || (year != 1993 && revues.Length != 12))
                Debugger.Break();

            int[] issues = new int[12];
            int[] years = new int[12];
            string[] periods = new string[12];
            string[] covers = new string[12];
            string[] contents = new string[12];
            int[] pages = new int[12];
            double[] sizes = new double[12];

            string fRevues = $"Dossier Pour la Science {year}-{year+2}";
            string fPrez = $"Prez Dossier Pour la Science {year}-{year + 2}";

            string rootdir = @"C:\Temp\#Dossier Pour la Science";
            string dirRevues = Path.Combine(rootdir, fRevues);
            string dirPrez = Path.Combine(rootdir, fPrez);
            if (!Directory.Exists(dirRevues))
                Directory.CreateDirectory(dirRevues);
            if (!Directory.Exists(dirPrez))
                Directory.CreateDirectory(dirPrez);

            for (int i = 0; i < (year == 1993 ? 9 : 12); i++)
                Prepare(folder, ref years[i], ref periods[i], revues[i], dirPrez, dirRevues, ref issues[i], ref covers[i], ref contents[i], ref pages[i], ref sizes[i]);

            using (FileStream fs = new FileStream(dirPrez + @"\" + fRevues + ".nfo", FileMode.Create))
            using (StreamWriter sw = new StreamWriter(fs, Encoding.GetEncoding(850)))
            {
                sw.WriteLine(string.Format("Dossiers Pour la Science {0}-{1}", year, year + 2));
                sw.WriteLine("=====================================================");
                sw.WriteLine("Langue : Français");
                sw.WriteLine(string.Format("Année de parution : {0} à {1}", year, year + 2));
                sw.WriteLine("Éditeur : Pour la Science");
                if (year < 1997)
                    sw.WriteLine("Format : PDF Scanné (1660x2250 environ) + texte OCR");
                else
                    sw.WriteLine("Format : True PDF (images 1590x2190 environ) + texte");
                sw.WriteLine("=====================================================");
                sw.WriteLine();
                for (int i = 0; i < (year == 1993 ? 9 : 12); i++)
                {
                    sw.Write(string.Format("Pages: {0,3}   ", pages[i]));
                    sw.Write(string.Format("Poids: {0,5:F1} Mo   ", sizes[i]));
                    sw.WriteLine(string.Format("Dossier Pour la Science n°{0} - {1}-{2} - {3}.pdf", issues[i], years[i], periods[i], contents[i]));
                }
                sw.Flush();
            }

            // Assemble 12 pics in a 3x4 mosaic with height=800px
            // montage c*.jpg -tile 3x -geometry +0+0 -resize x200 s4.jpg
            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            start.Arguments = $"c*.jpg -colorspace sRGB -tile 3x -geometry +0+0 -resize x195 gc-{year}-{year + 2}.jpg";
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

            using (FileStream fs = new FileStream(dirPrez + @"\" + fRevues + ".txt", FileMode.Create))
            using (StreamWriter sw = new StreamWriter(fs, Encoding.Default))
            {
                sw.WriteLine(string.Format(@"[center][color=red][b][size=5]Archives Dossiers Pour la Science {0}-{1}[/size][/b][/color]


[i]Pour la Science, le magazine de référence de l'actualité scientifique, est l'édition française de la revue Scientific American.  En direct des laboratoires du monde entier, Pour la Science offre chaque mois une information rigoureuse et approfondie sur les découvertes scientifiques récentes.[/i]

[i]Ce post publie 24 années d'archives des hors-série thématiques, les Dossiers Pour la Science.  Chaque numéro développe en détail un thème scientifique spécifique, avec des articles rédigés par des chercheurs et des scientifiques spécialistes du sujet.[/i]

[i]L'intégralité des 93 Dossiers, de 1993 à 2016, est publiée par groupe de trois années, soit douze numéros à la fois.  Tous les PDF sont 'nettoyés', la protection retirée et le texte (OCR pour les Dossiers 1 à 11, True PDF à partir du n°12) est disponible pour recherche ou indexation.  Les pages blanches des Dossiers 1 à 33 correspondent aux pages de publicité retirées, de façon à ce que ceux qui visualisent deux pages à la fois aient la même disposition des pages gauche et droite que dans la revue papier.[/i]

[img]gc.jpg[/img]


[img width=500]http://zupimages.net/up/15/42/6r15.png[/img]

[b]Editeur : [/b] [i]Pour la Science[/i]
[b]Format : [/b] [i]PDF[/i]
[b]Genre : [/b] [i]Science[/i]
[b]Date de publication : [/b] [i]{0} à {1}[/i]



[img width=500]http://zupimages.net/up/15/42/wmwo.png[/img]

", year, year + 2));

                for (int i = 0; i < (year == 1993 ? 9 : 12); i++)
                    sw.WriteLine($"n°{issues[i]} - {years[i]}-{periods[i]}: {pages[i]} pages, {(int)(0.5 + sizes[i])} Mo\r\n{contents[i].Replace('¿', '?')}\r\n");

                sw.WriteLine(string.Format(@"


[img width=500]http://zupimages.net/up/15/42/bxhg.png[/img]

[b]Format : [/b] [i]{0}[/i]
[b]Résolution : [/b] [i]{1}[/i]
[b]Langue : [/b] [i]Français[/i]
[b]Taille totale[/b] : [i]{2} Mo[/i]



Pour les autres archives:
[b][url]http://www.t411.li/torrents/search/?search=Archives+Pour+la+Science&order=name&type=desc[/url][/b]



[url=http://www.t411.li/users/torrents/?id=105617045][img]http://zupimages.net/up/15/41/ne2f.gif[/img][/url]


[/center]", year < 1997 ? "PDF Scanné + texte OCR masqué pour copie/recherche" : "True PDF avec texte",
            year < 1997 ? "1660x2250 pixels environ" : "1590x2190 pixels environ",
            (int)(0.5 + sizes.Sum())));
            }
        }


        static void Prepare(string folder, ref int year, ref string period, string filename, string targetImageDir, string targetPDFdir, ref int issue, ref string cover, ref string content, ref int pages, ref double taille)
        {
            string basename = Path.GetFileNameWithoutExtension(filename);
            string dir = Path.GetDirectoryName(filename);

            Match m = r1.Match(basename);
            if (!m.Success) Debugger.Break();
            issue = int.Parse(m.Groups[1].ToString());
            year = int.Parse(m.Groups[2].ToString());
            period = m.Groups[3].ToString();
            content = m.Groups[4].ToString();

            string title = string.Format("Dossier Pour la Science n°{0} - {1}-{2}", issue, year, period);
            Console.WriteLine(title);

            string targetFile = Path.Combine(targetPDFdir, title + " - " + content + ".pdf");
            File.Copy(filename, targetFile, true);

            pages = getPDFPageCount(filename);
            taille = (new FileInfo(filename)).Length / 1024.0 / 1024.0;

            // Images already Ok
            //return;

            // Folder to extract 1st page contains unprotected PDFs that support extraction,
            // so it's not root folder that contains original files with full name
            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            //start.Arguments = "A=\"" + @"C:\temp\PDF" + "\\" + title + ".pdf\" cat A1-1 output c:\\temp\\p" + year.ToString() + "-" + (month + 1).ToString("D2") + ".pdf dont_ask";
            start.Arguments = "A=\"" + targetFile + "\" cat A1-1 output c:\\temp\\p" + year.ToString() + "-" + period.Substring(0, 2) + ".pdf dont_ask";
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

            cover = "C" + year.ToString() + "-" + (period + 1).Substring(0, 2) + ".jpg";
            start.Arguments = "C:\\temp\\p" + year.ToString() + "-" + period.Substring(0, 2) + ".pdf -alpha remove -resize x400 \"" + targetImageDir + @"\" + cover + "\"";
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
