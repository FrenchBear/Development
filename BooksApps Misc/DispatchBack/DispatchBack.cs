using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using static System.Console;
using System.Diagnostics;

namespace DispatchBack
{
    class DispatchBack
    {
        static void Main(string[] args)
        {
            var l1 = Directory.GetFiles(@"C:\Temp\Informatique", "*.pdf");
            WriteLine($"Nb files: {l1.Length}");

            var l2 = Directory.GetFiles(@"W:\Livres\Informatique", "*.pdf", SearchOption.AllDirectories);

            foreach (string file in l1)
            {
                var np = l2.Where(f => Path.GetFileName(file) == Path.GetFileName(f)).FirstOrDefault();
                if (np == null)
                    Debugger.Break();
                else
                    WriteLine($"move /y \"{file}\" \"{np}\"");
            }


            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }
    }
}
