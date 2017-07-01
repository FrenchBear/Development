// PreparePLS6
// Prépare les fichiers des Pour la Science par semestre pour l'export t411
//
// 2016-05-24   PV  1ère version; path pour imageMagick
// 2016-12-22   PV  4è version, export annuel
// 2016-12-27   PV  5è version pour les Dossiers PlS
// 2016-12-27   PV  6è version pour les bonus

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

namespace PreparePLS6
{
    class PreparePLS6
    {
        //static Regex r1 = new Regex(@"^Pour la Science n°(\d+)b - (\d+)-(\d{2}) - (.*)$");
        static Regex r1 = new Regex(@"^PTPLS - (\d+) - (.*)$");

        const string imageMagickPath = @"C:\Program Files\ImageMagick-7";

        static void Main(string[] args)
        {
            PrepareYear(@"F:\T411b\#Pour la Science\Pour la Science Bonus\Les petits thématiques Pour la Science");

            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }

        static void PrepareYear(string folder)
        {
            string[] revues = Directory.GetFiles(folder, "*.pdf")
                .OrderBy(x => x)
                .ToArray();

            int[] issues = new int[30];
            int[] years = new int[30];
            string[] periods = new string[30];
            string[] covers = new string[30];
            string[] contents = new string[30];
            int[] pages = new int[30];
            double[] sizes = new double[30];

            string fRevues = $"Dossier Pour la Science Bonus PTPLS";
            string fPrez = $"Prez Dossier Pour la Science Bonus PTPLS";

            string rootdir = @"C:\Temp\#Dossier Pour la Science";
            string dirRevues = Path.Combine(rootdir, fRevues);
            string dirPrez = Path.Combine(rootdir, fPrez);
            if (!Directory.Exists(dirRevues))
                Directory.CreateDirectory(dirRevues);
            if (!Directory.Exists(dirPrez))
                Directory.CreateDirectory(dirPrez);

            for (int i = 0; i < revues.Length; i++)
                Prepare(folder, ref years[i], ref periods[i], revues[i], dirPrez, dirRevues, ref issues[i], ref covers[i], ref contents[i], ref pages[i], ref sizes[i]);

            using (FileStream fs = new FileStream(dirPrez + @"\" + fRevues + ".nfo", FileMode.Create))
            using (StreamWriter sw = new StreamWriter(fs, Encoding.GetEncoding(850)))
            {
                sw.WriteLine("Dossiers Pour la Science Bonus");
                sw.WriteLine("=====================================================");
                sw.WriteLine("Langue : Français");
                sw.WriteLine(string.Format("Année de parution : 1983 à 1983"));
                sw.WriteLine("Éditeur : Pour la Science");
                sw.WriteLine("PDF Scanné (2410x3300 environ) + texte OCR");
                sw.WriteLine("=====================================================");
                sw.WriteLine();
                for (int i = 0; i < revues.Length; i++)
                {
                    sw.Write(string.Format("Pages: {0,3}   ", pages[i]));
                    sw.Write(string.Format("Poids: {0,5:F1} Mo   ", sizes[i]));
                    //sw.WriteLine(string.Format("Dossier Pour la Science n°{0} - {1}-{2} - {3}.pdf", issues[i], years[i], periods[i], contents[i]));
                    sw.WriteLine(string.Format("Les petits thématiques Pour la Science n°{0} - {1}.pdf", issues[i], contents[i]));
                }
                sw.Flush();
            }

            // Assemble 12 pics in a 3x4 mosaic with height=800px
            // montage c*.jpg -tile 3x -geometry +0+0 -resize x200 s4.jpg
            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            start.Arguments = $"c*.jpg -colorspace sRGB -tile 5x -geometry +0+0 -resize x195 gc.jpg";
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
                sw.WriteLine(string.Format(@"[center][color=red][b][size=5]Pour la Science Bonus[/size][/b][/color]


[i]Pour la Science, le magazine de référence de l'actualité scientifique, est l'édition française de la revue Scientific American.  En direct des laboratoires du monde entier, Pour la Science offre chaque mois une information rigoureuse et approfondie sur les découvertes scientifiques récentes.[/i]

[i]Ce post publie 24 années d'archives des hors-série thématiques, les Dossiers Pour la Science.  Chaque numéro développe en détail un thème scientifique spécifique, avec des articles rédigés par des chercheurs et des scientifiques spécialistes du sujet.[/i]

[i]L'intégralité des 93 Dossiers, de 1993 à 2016, est publiée par groupe de trois années, soit douze numéros à la fois.  Tous les PDF sont 'nettoyés', la protection retirée et le texte (OCR pour les Dossiers 1 à 11, True PDF à partir du n°12) est disponible pour recherche ou indexation.  Les pages blanches des Dossiers 1 à 33 correspondent aux pages de publicité retirées, de façon à ce que ceux qui visualisent deux pages à la fois aient la même disposition des pages gauche et droite que dans la revue papier.[/i]

[img]gc.jpg[/img]


[img width=500]http://zupimages.net/up/15/42/6r15.png[/img]

[b]Editeur : [/b] [i]Pour la Science[/i]
[b]Format : [/b] [i]PDF[/i]
[b]Genre : [/b] [i]Science[/i]
[b]Date de publication : [/b] [i]X à Y[/i]



[img width=500]http://zupimages.net/up/15/42/wmwo.png[/img]

"));

                for (int i = 0; i < revues.Length; i++)
                    sw.WriteLine($"n°{issues[i]}: {pages[i]} pages, {(int)(0.5 + sizes[i])} Mo\r\n{contents[i].Replace('¿', '?')}\r\n");

                sw.WriteLine(string.Format(@"


[img width=500]http://zupimages.net/up/15/42/bxhg.png[/img]

[b]Format : [/b] [i]{0}[/i]
[b]Résolution : [/b] [i]{1}[/i]
[b]Langue : [/b] [i]Français[/i]
[b]Taille totale[/b] : [i]{2} Mo[/i]



Pour les autres archives:
[b][url]http://www.t411.li/torrents/search/?search=Archives+Pour+la+Science&order=name&type=desc[/url][/b]



[url=http://www.t411.li/users/torrents/?id=105617045][img]http://zupimages.net/up/15/41/ne2f.gif[/img][/url]


[/center]", "PDF Scan HQ + texte OCR masqué pour copie/recherche",
            "2410x3300 pixels environ",
            (int)(0.5 + sizes.Sum())));
            }
        }


        static void Prepare(string folder, ref int Zyear, ref string Zperiod, string filename, string targetImageDir, string targetPDFdir, ref int issue, ref string cover, ref string content, ref int pages, ref double taille)
        {
            string basename = Path.GetFileNameWithoutExtension(filename);
            string dir = Path.GetDirectoryName(filename);

            Match m = r1.Match(basename);
            if (!m.Success) Debugger.Break();
            issue = int.Parse(m.Groups[1].ToString());
            content = m.Groups[2].ToString();
            //year = int.Parse(m.Groups[2].ToString());
            //period = m.Groups[3].ToString();
            //content = m.Groups[4].ToString();

            //string title = string.Format("Pour la Science n°{0} - {1}-{2}", issue, year, period);
            string title = string.Format("Les petits thématiques Pour la Science n°{0}", issue);
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
            //start.Arguments = "A=\"" + targetFile + "\" cat A1-1 output c:\\temp\\p" + year.ToString() + "-" + period.Substring(0, 2) + ".pdf dont_ask";
            start.Arguments = "A=\"" + targetFile + "\" cat A1-1 output c:\\temp\\p" + issue.ToString() + ".pdf dont_ask";
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

            //cover = "C" + year.ToString() + "-" + (period + 1).Substring(0, 2) + ".jpg";
            cover = "C" + issue.ToString() + ".jpg";
            start.Arguments = "C:\\temp\\p" + issue.ToString()  + ".pdf -alpha remove -resize x400 \"" + targetImageDir + @"\" + cover + "\"";
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
