// TagSV
// Tague les fichiers des archives Science & Vie
//
// 2016-02-19   PV      1ère version

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


namespace TagSV
{
    class TagSV
    {
        static string rootDir = @"C:\Temp\#Science & Vie";

        static void Main(string[] args)
        {
            //PrepareYear(1980, 1);
            for (int y = 1980; y <= 2002; y++)
            {
                PrepareYear(y, 1);
                PrepareYear(y, 2);
            }

            WriteLine();
            Write("(Pause)");
            ReadLine();
        }

        static void PrepareYear(int year, int semester)
        {
            string sourcePath = @"W:\Revues\Science\Science & Vie\New scans";
            string folder = Path.Combine(sourcePath, $"{year} ocr");
            var q = Directory.GetFiles(folder, "*.pdf").OrderBy(x => x);
            string[] revues;
            if (semester == 1)
                revues = q.Take(6).ToArray();
            else
                revues = q.Skip(6).ToArray();

            if (revues.Length != 6)
                Debugger.Break();

            string f = ($"Science & Vie {year}-S{semester}").Replace('§', '?');

            if (!Directory.Exists(rootDir))
                Directory.CreateDirectory(rootDir);

            //for (int month = 0; month < 6; month++)
            //    Prepare(revues[month]);
            revues.AsParallel().ForAll(r => Prepare(r));

            WriteLine();
        }



        static Regex r1 = new Regex(@"^Science & Vie n°(\d+) - (\d+)-(\d+) - (.*)$");

        static void Prepare(string filename)
        {
            string basename = Path.GetFileNameWithoutExtension(filename);
            string dir = Path.GetDirectoryName(filename);

            Match m = r1.Match(basename);
            if (!m.Success) Debugger.Break();
            int issue = int.Parse(m.Groups[1].ToString());
            int year = int.Parse(m.Groups[2].ToString());
            int month = int.Parse(m.Groups[3].ToString());
            string content = m.Groups[4].ToString().Replace('§','?');

            string title = string.Format("Science & Vie n°{0} - {1}-{2:D2}", issue, year, month);
            WriteLine(basename);

            string targetFile = Path.Combine(rootDir, basename.Replace('§', '？') + ".pdf");
            UpdateMetaDataAndCopyPDF(filename, targetFile, title, content);
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
    }
}
