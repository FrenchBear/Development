// Clean_Comics_Names
// Nettoie les fichiers de comiques
// 2016-12-29 PV

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using static System.Console;
using System.Text.RegularExpressions;
using System.Reflection;


namespace Clean_Comics_Names
{
    class Program
    {
        const string source = @"D:\Users\Pierre\Downloads\Mortal Kombat X";
        static string[] files;

        static StreamWriter sw;

        static void Main(string[] args)
        {
            var n = DateTime.Now;
            using (StreamWriter swu = new StreamWriter(string.Format(@"C:\temp\CleanComicsNames-{0}-{1:D2}-{2:D2}-{3:D2}.{4:D2}.{5:D2}.log", n.Year, n.Month, n.Day, n.Hour, n.Minute, n.Second)))
            {
                swu.AutoFlush = true;
                sw = swu;

                // Application banner
                LogWriteLine(AppTitleVersion());

                files = Directory.GetFiles(source, "*.*", SearchOption.AllDirectories);
                LogWriteLine($"{files.Length} fichiers lus dans {source}");

                Replace(@"(?<! )\(", " (");
                Replace("  ", " ");
                Replace(@" \([^(]*Digital[^)]*\)", "");
                Replace(@" \([^(]*Empire[^)]*\)", "");
                Replace(@" \([^(]*Minute[^)]*\)", "");
                Replace(@" \([^(]*DCP[^)]*\)", "");
                Replace(@" \([^(]*c2c[^)]*\)", "");
                Replace(@" \([^(]*Gold Key[^)]*\)", "");
                Replace(@" \([^(]*Dell[^)]*\)", "");
                Replace(@" \([^(]*repack[^)]*\)", "");
                Replace(@" \([^(]*Top Seller[^)]*\)", "");
                Replace(@" \([^(]*Williams[^)]*\)", "");
                Replace(@" \([^(]*Peters[^)]*\)", "");
                Replace(@" \(F\)", "");
                Replace(@" \(UK\)", "");
                Replace(@" \(HD\)", "");
                Replace(@" \(DC\)", "");
                Replace(@" \(AC\)", "");
                Replace(@" \([^(]*webrip[^)]*\)", "");
                Replace(@" \([^(]*mikk[^)]*\)", "");
                Replace(@" \([^(]*Superscope[^)]*\)", "");
                Replace(@" \(Ajnaabi\)", "");
                Replace(@" \([^(]*Australian[^)]*\)", "");
                Replace(@" \([^(]*Westworld[^)]*\)", "");
                Replace(@" \([^(]*Kiran[^)]*\)", "");
                Replace(@" \([^(]*Vidyarthi[^)]*\)", "");
                Replace(@" \([^(]*Pudgy[^)]*\)", "");
                Replace(@" \([^(]*Horse[^)]*\)", "");
                Replace(@" \([^(]*TPB[^)]*\)", "");
                Replace(@" \([^(]*Byblos[^)]*\)", "");
                Replace(@" \([^(]*TUBCBG[^)]*\)", "");
                Replace(@" \([^(]*NS2011[^)]*\)", "");
                Replace(@" \[extracted\]", "");
                Replace(@" \[ac.?\]", "");
                Replace(@" \[EN\]", "");
                Replace(@" \[americomics\]", "");
                Replace(@" \[paragon\]", "");
                Replace(@" \([^(]*Bumblebee[^)]*\)", "");
                Replace(@" \([^(]*MrWoodman[^)]*\)", "");
                Replace(@" \([^(]*Look-In[^)]*\)", "");
                Replace(@" \([^(]*Kritter[^)]*\)", "");
                Replace(@" \([^(]*FCBD[^)]*\)", "");
                Replace(@" \([^(]*chrisB[^)]*\)", "");
                Replace(@" \([^(]*Alysum[^)]*\)", "");
                Replace(@" \([^(]*high.res[^)]*\)", "");
                Replace(@" \(Paragon\)", "");
                Replace(@" \([^(]*gargantarama[^)]*\)", "");
                Replace(@" \([^(]*cps[^)]*\)", "");
                Replace(@" \d+p\b", "");
                Replace(@" \([^(]*Novus[^)]*\)", "");

                LogWriteLine("\n");
                foreach (string file in files)
                {
                    LogWriteLine(file);
                }
            }
            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }

        private static void Replace(string pattern, string replacement)
        {
            LogWriteLine($"\n Pattern \"{pattern}\", Replacement \"{replacement}\"");
            int touch = 0;
            var reFind = new Regex(pattern, RegexOptions.IgnoreCase);
            for (int i = 0; i < files.Length; i++)
            {
                string filename = Path.GetFileName(files[i]);
                if (reFind.IsMatch(filename))
                {
                    string before = filename;
                    do
                    {
                        filename = reFind.Replace(filename, replacement);
                    } while (reFind.IsMatch(filename));

                    string newname = Path.Combine(Path.GetDirectoryName(files[i]), filename);
                    while (files.Contains(newname, StringComparer.InvariantCultureIgnoreCase))
                        newname = Path.Combine(Path.GetDirectoryName(files[i]), Path.GetFileNameWithoutExtension(newname) + "$" + Path.GetExtension(newname));
                    File.Move(files[i], newname);
                    touch++;
                    files[i] = newname;
                    LogWriteLine($"{before}  -->  {Path.GetFileName(newname)}");
                }
            }

            WriteLine($"\n{touch} update(s)\n");
        }


        // Shows standard application banner
        private static string AppTitleVersion()
        {
            Assembly myAssembly = System.Reflection.Assembly.GetExecutingAssembly();
            AssemblyTitleAttribute aTitleAttr = (AssemblyTitleAttribute)AssemblyTitleAttribute.GetCustomAttribute(myAssembly, typeof(AssemblyTitleAttribute));
            string sAssemblyVersion = myAssembly.GetName().Version.Major.ToString() + "." + myAssembly.GetName().Version.Minor.ToString() + "." + myAssembly.GetName().Version.Build.ToString();

            return aTitleAttr.Title + " " + sAssemblyVersion;
        }


        private static void LogWrite(string s)
        {
            lock (sw) sw.Write(s);
            Write(s);
        }

        private static void LogWriteLine(string s = "")
        {
            lock (sw) sw.WriteLine(s);
            WriteLine(s);
        }


    }
}
