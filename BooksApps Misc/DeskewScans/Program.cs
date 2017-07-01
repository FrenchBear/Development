// DeskewScans
// Find skew angle of scans in a folder and prints the ones greater than 0,1°
// 2017-01-28   PV  First version using ImageMagick

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Console;


namespace DeskewScans
{
    class FileSkew
    {
        public string File;
        public double Skew;
        public int Width, Height;
        public char op = ' ';
    }

    class Program
    {
        const string sourceFolder = @"C:\Temp\PLS21";
        const string targetFolder = @"C:\Temp\PLS21Deskew";
        const string logFile = @"C:\Temp\PLS21Skew.txt";

        static string[] supportedExtensions = { ".jpg", ".png", ".gif" };

        const string convertApp = @"C:\Program Files\ImageMagick-7\convert.exe";


        static void Main(string[] args)
        {
            if (!Directory.Exists(sourceFolder))
            {
                WriteLine("Can't find source folder " + sourceFolder);

                Console.WriteLine();
                Console.Write("(Pause)");
                Console.ReadLine();
                return;
            }

            if (!Directory.Exists(targetFolder))
                Directory.CreateDirectory(targetFolder);

            var files = Directory.GetFiles(sourceFolder)
                .Where(f => supportedExtensions.Contains(Path.GetExtension(f), StringComparer.InvariantCultureIgnoreCase))
                .ToArray();
            var fileSkewList = new List<FileSkew>();
            files.AsParallel().ForAll(file =>
                {
                    Write(".");
                    FileSkew fs = FindAngleIM(file);
                    if (fs != null)
                    {
                        lock (fileSkewList)
                            fileSkewList.Add(fs);
                        if (Math.Abs(fs.Skew) > 0.1 && Math.Abs(fs.Skew) < 2)
                            RedresseImageIM(fs);
                        //else
                        //{
                        //    File.Copy(fs.File, Path.Combine(targetFolder, Path.GetFileName(fs.File)));
                        //    Write("=");
                        //}
                    }
                });
            WriteLine();

            using (StreamWriter sw = new StreamWriter(new FileStream(logFile, FileMode.Create)))
            {
                foreach (var fs in fileSkewList.OrderByDescending(x => Math.Abs(x.Skew)))
                {
                    sw.WriteLine($"{fs.File,-15}{fs.Skew,6:F2} {fs.Width,4} {fs.Height,4} {fs.op}");
                    WriteLine($"{fs.File,-15}{fs.Skew,6:F2} {fs.Width,4} {fs.Height,4} {fs.op}");
                }
            }


            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }

        private static void RedresseImageIM(FileSkew fs)
        {
            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            start.FileName = "\"" + convertApp + "\"";
            start.Arguments = "\"" + fs.File + "\" " + $"-deskew 40% -gravity center -crop {fs.Width}x{fs.Height}+0+0 \"" + Path.Combine(targetFolder, Path.GetFileName(fs.File)) + "\"";
            start.UseShellExecute = false;
            start.WindowStyle = ProcessWindowStyle.Hidden;
            start.WorkingDirectory = Path.GetDirectoryName(fs.File);

            using (Process proc = Process.Start(start))
            {
                if (proc == null)
                {
                    WriteLine($"Échec à l'exécution de la commande {start.FileName} {start.Arguments}");
                }
                else
                {
                    proc.WaitForExit();
                    exitCode = proc.ExitCode;
                }
            }

            Write("*");
            fs.op = '*';
        }

        static FileSkew FindAngleIM(string file)
        {
            ProcessStartInfo start = new ProcessStartInfo();
            int exitCode;
            start.FileName = "\"" + convertApp + "\"";
            start.Arguments = "\"" + file + "\" -print \"%w %h \" -deskew 40% -print \"%[deskew:angle]\" NUL:";
            start.UseShellExecute = false;
            start.RedirectStandardOutput = true;
            start.WindowStyle = ProcessWindowStyle.Hidden;
            start.WorkingDirectory = Path.GetDirectoryName(file);

            string output = null;
            using (Process proc = Process.Start(start))
            {
                if (proc == null)
                {
                    WriteLine($"Échec à l'exécution de la commande {start.FileName} {start.Arguments}");
                    return null;
                }
                else
                {
                    output = proc.StandardOutput.ReadToEnd();
                    proc.WaitForExit();
                    exitCode = proc.ExitCode;
                }
            }

            FileSkew fs = new FileSkew();
            string[] ts = output.Split(' ');
            fs.File = file;
            var cultureUS = CultureInfo.GetCultureInfo("en-US");
            fs.Width = int.Parse(ts[0]);
            fs.Height = int.Parse(ts[1]);
            if (!double.TryParse(ts[2], NumberStyles.Number, cultureUS, out fs.Skew))
            {
                WriteLine($"Error parsing output {output}");
                return null;
            }
            return fs;
        }
    }
}
