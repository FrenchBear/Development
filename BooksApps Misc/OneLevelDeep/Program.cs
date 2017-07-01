// OnelevelDeep
// Flattens files in 2nd level of subfolders to 1st level only
// Used to removed extra structure after WinRar extraction in specific folders
// 2015-07-12   PV

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace OneLevelDeep
{
    class Program
    {
        static void Main(string[] args)
        {
            string path = @"D:\Users\Pierre\Downloads\A_Trier_BD\A_Trier_BD";

            var folders = Directory.GetDirectories(path);
            foreach (string folder in folders)
            {
                Console.WriteLine(folder);

                var files = Directory.GetFiles(folder, "*.*", SearchOption.AllDirectories);
                bool isCleanupNeeded = false;
                foreach (string file in files)
                {
                    if (Path.GetDirectoryName(file) != folder)
                    {
                        Console.WriteLine("  " + file.Substring(folder.Length + 1));
                        File.Move(file, Path.Combine(folder, Path.GetFileName(file)));
                        isCleanupNeeded = true;
                    }
                }
                var subfolders = Directory.GetDirectories(folder, "*.*", SearchOption.AllDirectories);
                foreach (string subfolder in subfolders.OrderByDescending(d => d.Length))
                {
                    Directory.Delete(subfolder);
                }

                //Console.ReadLine();
            }



            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }
    }
}
