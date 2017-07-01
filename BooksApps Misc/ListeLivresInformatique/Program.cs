using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using static System.Console;
using iTextSharp.text.pdf;

namespace ListeLivresInformatique
{
    class Program
    {
        static long grandTotalLength;
        static int grandTotalCount;

        static void Main(string[] args)
        {
            string source = @"W:\Livres\Informatique";

            var directories = (new List<string> { source })
                .Union(Directory.GetDirectories(source, "*.*", SearchOption.AllDirectories)
                .OrderBy(di => di, new WindowsFileExplorerComparer()));
            using (StreamWriter sw = new StreamWriter(@"c:\temp\liste.txt"))
            {
                sw.AutoFlush = true;
                foreach (string directory in directories)
                    ProcessOneDirectory(sw, directory);
                sw.Write("{0,11:N0} K           Grand Total {1} fichiers, {2} dossiers", ((long)(grandTotalLength + 1023) / 1024), grandTotalCount, directories.Count());
            }

            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }

        private static void ProcessOneDirectory(StreamWriter sw, string directory)
        {
            WriteLine(directory.Substring(10));
            sw.WriteLine($"Dossier {directory.Substring(10)}");

            long totalLength = 0;
            int fileIndex = 0;
            var di = new DirectoryInfo(directory);
            FileInfo[] files = di.GetFiles("*.*")
                .OrderBy(fi => fi.Name, new WindowsFileExplorerComparer())
                .ToArray();
            foreach (FileInfo fi in files)
            {
                fileIndex++;
                Write($"{fileIndex}/{files.Length}\r");

                sw.Write("{0,11:N0} K  ", (long)((fi.Length + 1023) / 1024));
                totalLength += fi.Length;
                grandTotalLength += fi.Length;

                int pages = -1;
                if (fi.Name.EndsWith(".pdf", StringComparison.InvariantCultureIgnoreCase))
                    pages = getPDFPageCount(fi.FullName);
                if (pages >= 0)
                    sw.Write("{0,4:D} P   ", pages);
                else
                    sw.Write("         ");

                sw.WriteLine(fi.Name);
            }
            sw.WriteLine();
            sw.Write("{0,11:N0} K           Total {1} fichiers", ((long)(totalLength + 1023) / 1024), files.Length);
            sw.WriteLine();
            sw.WriteLine();

            grandTotalCount += files.Length;

            WriteLine();
        }

        static int getPDFPageCount(string path)
        {
            try
            {
                using (PdfReader reader = new PdfReader(path))
                    return reader.NumberOfPages;
            }
            catch (Exception)
            {
                return -1;
            }
        }
    }
}
