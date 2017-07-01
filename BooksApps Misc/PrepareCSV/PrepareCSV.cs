// PrepareCSV
// Prépare les fichiers des Cahiers de Science & Vie pour l'export t411
//
// 2015-09-09   PV      1ère version
// 2015-10-06   PV      t411.in et logo glloq65
// 2015-10-28   PV      Version après le ban


using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.IO;
using iTextSharp.text.pdf;


namespace PrepareCSV
{
    class PrepareCSV
    {
        static Regex r1 = new Regex(@"^Les Cahiers de Science & Vie n°(\d+) - (\d+)-(\d+) - (.*)$");
        static string[] moisFr = new string[] { "Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre" };

        static void Main(string[] args)
        {
            PrepareFolder(@"F:\T411b\#Les Cahiers de Science & Vie\Archives Cahiers S&V 1998 49-53");
            //foreach (var d in Directory.GetDirectories(@"F:\T411b\#Les Cahiers de Science & Vie").OrderBy(d => d).Skip(1))
            //    PrepareFolder(d);

            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }

        static void PrepareFolder(string f)
        {
            string[] revues = Directory.GetFiles(Path.Combine(f, Path.GetFileName(f)), "*.pdf").OrderBy(x => x).ToArray();
            if (revues.Length != 6)
                Debugger.Break();

            string[] titles = new string[6];
            string[] covers = new string[6];
            int[] issues = new int[6];
            int[] years = new int[6];
            int[] months = new int[6];
            string[] contents = new string[6];
            int[] pages = new int[6];
            double[] sizes = new double[6];

            for (int i = 0; i < 6; i++)
                Prepare(revues[i], ref titles[i], ref covers[i], ref issues[i], ref years[i], ref months[i], ref contents[i], ref pages[i], ref sizes[i]);

            string dir = Path.GetFileName(f).Replace(" SV ", " S&V ");
            string subdir = Path.Combine(f, dir);
            //if (!Directory.Exists(subdir))
            //    Directory.CreateDirectory(subdir);

            using (FileStream fs = new FileStream(f + @"\" + dir + ".nfo", FileMode.Create))
            using (StreamWriter sw = new StreamWriter(fs, Encoding.GetEncoding(850)))
            {
                sw.WriteLine(string.Format("Les Cahiers de Science & Vie {0}, n°{1}-{2}", years[0], issues[0], issues[5]));
                sw.WriteLine("=====================================================");
                sw.WriteLine("Langue : Français");
                sw.WriteLine(string.Format("Année de parution : {0}", years[0]));
                sw.WriteLine("Éditeur : Excelsior Publications");
                sw.WriteLine("Format : PDF scanné, résolution 2430x3350 pixel");
                sw.WriteLine("=====================================================");
                for (int i = 0; i < 6; i++)
                {
                    sw.WriteLine();
                    sw.WriteLine(string.Format("N°{0} - {1} {2} - {3}", issues[i], moisFr[months[i] - 1], years[i], contents[i]));
                    sw.WriteLine(string.Format("Nombre de pages : {0}", pages[i]));
                    sw.WriteLine(string.Format("Poids : {0:F1} Mo", sizes[i]));
                }
                sw.Flush();
            }

            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            start.Arguments = covers[0] + " " + covers[1] + " +append s1.jpg";
            start.FileName = @"C:\Program Files\ImageMagick-7\convert.exe";
            start.UseShellExecute = true;
            start.WindowStyle = ProcessWindowStyle.Hidden;
            start.CreateNoWindow = true;
            start.WorkingDirectory = f;
            using (Process proc = Process.Start(start))
            {
                proc.WaitForExit();
                exitCode = proc.ExitCode;
            }

            start.Arguments = covers[2] + " " + covers[3] + " +append s2.jpg";
            using (Process proc = Process.Start(start))
            {
                proc.WaitForExit();
                exitCode = proc.ExitCode;
            }

            start.Arguments = covers[4] + " " + covers[5] + " +append s3.jpg";
            using (Process proc = Process.Start(start))
            {
                proc.WaitForExit();
                exitCode = proc.ExitCode;
            }


            for (int i = 0; i < 6; i++)
                File.Delete(f + @"\" + covers[i]);


            using (FileStream fs = new FileStream(f + @"\" + dir + ".txt", FileMode.Create))
            using (StreamWriter sw = new StreamWriter(fs, Encoding.Default))
            {

                sw.WriteLine(string.Format(@"[center][color=red][size=5][b]Archives Les Cahiers de Science & Vie {0}, n°{1}-{2}[/b][/size][/color]


[i]Tous les deux mois, les Cahiers de Science & Vie vous invitent à une promenade dans le grenier des savoirs et techniques.  Cette collection d'archives vous propose les premiers numéros publiés entre 1991 et 1999.[/i]

[i]Chacun des fascicules de 100 pages est un récit, une narration détaillée de quelques moments de l'Histoire des Sciences et des Techniques, se focalisant tour à tour sur des grandes controverses, des révolutions scientifiques, les grands projets scientifiques, les pères fondateurs de la science, les grands inventeurs et les grands ingénieurs...[/i]

[i](Re)découvrez avec 20-25 ans de recul une série au style clair et illustrée, vous proposant un voyage documenté dans l'histoire des connaissances et de ses acteurs.[/i]


[img]s1.jpg[/img]
[img]s2.jpg[/img]
[img]s3.jpg[/img]



[img width=500]http://zupimages.net/up/15/42/6r15.png[/img]

[b]Éditeur : [/b] [i]Excelsior Publications[/i]
[b]Format : [/b] [i].PDF[/i]
[b]Genre : [/b] [i]Sciences, Histoire[/i]
[b]Année de publication : [/b] [i]{3}[/i]



[img width=500]http://zupimages.net/up/15/42/wmwo.png[/img]

[b]Sommaire simplifié :[/b][i]", years[0], issues[0], issues[5], years[0]));

                for (int i = 0; i < 6; i++)
                {
                    sw.WriteLine($"N°{issues[i]}, {moisFr[months[i] - 1]} {years[i]}: {contents[i]}");
                }

                sw.WriteLine(string.Format(@"


[img width=500]http://zupimages.net/up/15/42/bxhg.png[/img]

[b]Format : [/b] [i]PDF Scan HQ + texte OCR masqué pour copie/recherche[/i]
[b]Résolution : [/b] [i]2430x3350 pixel[/i]
[b]Langue : [/b] [i]Français[/i]
[b]Nombre de pages : [/b] [i]100[/i]
[b]Taille totale[/b] : [i]{0} Mo[/i]



Pour les autres archives:
[b][url]http://www.t411.in/torrents/search/?search=Archives+Cahiers+Science+Vie&order=name&type=asc[/url][/b]



[url=http://www.t411.in/users/torrents/?id=105617045][img]http://zupimages.net/up/15/41/ne2f.gif[/img][/url]

[/center]", (int)(0.5 + sizes.Sum())));
            }
        }


        static void Prepare(string filename, ref string title, ref string cover, ref int issue, ref int year, ref int month, ref string content, ref int pages, ref double taille)
        {
            string basename = Path.GetFileNameWithoutExtension(filename);
            string dir = Path.GetDirectoryName(Path.GetDirectoryName(filename));

            Match m = r1.Match(basename);
            if (!m.Success) Debugger.Break();

            issue = int.Parse(m.Groups[1].ToString());
            year = int.Parse(m.Groups[2].ToString());
            month = int.Parse(m.Groups[3].ToString());
            content = m.Groups[4].ToString();

            title = string.Format("Les Cahiers de Science & Vie n°{0} {1} {2}", issue, moisFr[month - 1], year);
            Console.WriteLine(title);

            pages = getPDFPageCount(filename);
            taille = (new FileInfo(filename)).Length / 1024.0 / 1024.0;

            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            start.Arguments = "A=\"" + filename + "\" cat A1-1 output c:\\temp\\p" + issue.ToString() + ".pdf dont_ask";
            start.FileName = @"pdftk.exe";
            start.UseShellExecute = true;
            start.WindowStyle = ProcessWindowStyle.Hidden;
            start.CreateNoWindow = true;
            start.WorkingDirectory = dir;
            using (Process proc = Process.Start(start))
            {
                proc.WaitForExit();
                exitCode = proc.ExitCode;
            }

            cover = "C" + issue.ToString() + ".jpg";
            start.Arguments = "C:\\temp\\p" + issue.ToString() + ".pdf -resize 250x \"" + dir + @"\" + cover + "\"";
            start.FileName = @"C:\Program Files\ImageMagick-7\convert.exe";
            start.UseShellExecute = true;
            start.WindowStyle = ProcessWindowStyle.Hidden;
            start.CreateNoWindow = true;
            start.WorkingDirectory = dir;
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
