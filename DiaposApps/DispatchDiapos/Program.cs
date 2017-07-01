// DispatchDiapos
// Distribue les diapos par groupes
// 2016-08-02   PV

using System;
using System.Collections.Generic;
using System.Collections.Concurrent;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.IO;
using static System.Console;

namespace DispatchDiapos
{
    class Program
    {
        static void Main(string[] args)
        {
            //DumpPhoto(@"C:\temp\2016-07-03 Annecy 014.jpg");

            string source = @"C:\DiaposTag";
            string dest = @"E:\Diapos2";

            var ds = new Dictionary<string, CountDateMinMax>();

            Regex reFileDate = new Regex(@"^(\d\d\d\d)-(\d\d)-(\d\d) - (\d\d\d) - ([^-]+) - (.*)$");
            var directories = System.IO.Directory.GetDirectories(source, "Boite*", SearchOption.TopDirectoryOnly).OrderBy(x => x);
            foreach (string sourceDirectory in directories)
            {
                WriteLine(sourceDirectory);
                var files = System.IO.Directory.GetFiles(sourceDirectory, "*.jpg", SearchOption.TopDirectoryOnly).OrderBy(x => x);

                files.AsParallel().ForAll(
                    file =>
                    {
                        string basename = Path.GetFileNameWithoutExtension(file);
                        Match ma = reFileDate.Match(basename);
                        if (!ma.Success)
                        {
                            WriteLine("*** Pas de match: " + file);
                            goto nextFile;
                        }

                        int y = int.Parse(ma.Groups[1].Value);
                        int m = int.Parse(ma.Groups[2].Value);
                        int d = int.Parse(ma.Groups[3].Value);
                        int seq = int.Parse(ma.Groups[4].Value);
                        string appareil = ma.Groups[5].Value;
                        string description = ma.Groups[6].Value;

                        // Check date
                        DateTime dd;
                        if (d == 0) d = 1;
                        try
                        {
                            dd = new DateTime(y, m, d);
                        }
                        catch (Exception)
                        {
                            WriteLine("*** Date invalide: " + file);
                            goto nextFile;
                        }

                        lock (ds)
                        {
                            if (ds.ContainsKey(description))
                            {
                                var cmm = ds[description];
                                cmm.Count++;
                                if (dd < cmm.DateMin) cmm.DateMin = dd;
                                if (dd > cmm.DateMax) cmm.DateMax = dd;
                                cmm.filesList.Add(file);
                            }
                            else
                                ds.Add(description, new CountDateMinMax { Count = 1, DateMin = dd, DateMax = dd, filesList = new List<string> { file } });
                        }

                        int h = 12 + (int)(seq / 60);
                        int mm = seq % 60;
                        int ss = 0;

                        string destDir = Path.Combine(dest, Path.GetFileName(sourceDirectory));
                        string destFile = Path.Combine(destDir, basename + ".jpg");
                        string newDate = $"{y:D4}:{m:D2}:{d:D2} {h:D2}:{mm:D2}:{ss:D2}";

                        /*
                        if (!Directory.Exists(destDir))
                            Directory.CreateDirectory(destDir);
                        RedatePhoto(file, destFile, newDate, appareil, description);
                        */
                        nextFile:;
                    });
            }

            /*
            string[] keys = ds.Keys.ToArray();
            Enumerable.Range(0, keys.Length)
                .AsParallel()
                .ForAll(i =>
                {
                    for (int j = i + 1; j < ds.Count; j++)
                    {
                        if (keys[i] != keys[j] && LevenshteinDistance.Distance(keys[i], keys[j], 2) <= 2)
                        {
                            WriteLine($"Almost same group: {keys[i],-30} {keys[j],-30}");
                        }
                    }
                }
                );
            */

            foreach (var kvp in ds.OrderByDescending(x => x.Value.Count))
            {
                string folderName;
                if (kvp.Value.Count >= 5)
                {
                    continue;
                    //WriteLine($"{kvp.Value.Count,4:D}  {kvp.Value.DateMin:d}-{kvp.Value.DateMax:d}  {kvp.Key}");
                    folderName = $"{kvp.Key} - {kvp.Value.DateMin.Year:D}-{kvp.Value.DateMin.Month:D2}-{kvp.Value.DateMin.Day:D2}";
                    if (kvp.Value.DateMin.Year != kvp.Value.DateMax.Year || kvp.Value.DateMin.Month != kvp.Value.DateMax.Month || kvp.Value.DateMin.Day != kvp.Value.DateMax.Day)
                        folderName += $"..{kvp.Value.DateMax.Year:D}-{kvp.Value.DateMax.Month:D2}-{kvp.Value.DateMax.Day:D2}";
                    WriteLine(folderName);
                }
                else
                    folderName = "!Divers";

                folderName = Path.Combine(dest, folderName);
                if (!Directory.Exists(folderName))
                    Directory.CreateDirectory(folderName);
                foreach (string file in kvp.Value.filesList)
                {
                    File.Copy(file, Path.Combine(folderName, Path.GetFileName(file)));
                    WriteLine("  " + file);
                }
            }


            /*
            string[] directories2 = new string[]
            {
                @"E:\_Diapos\1997-09 - Québec, Toronto et Niagara",
                @"E:\_Diapos\2000-06 - Flandres Hanovre",
                @"E:\_Diapos\2000-07 - Birmingham",
                @"E:\_Diapos\2000-09 - Normandie",
                @"E:\_Diapos\2002-03 - Martinique",
                @"E:\_Diapos\2002-09 - Londres",
                @"E:\_Diapos\2003-06 - Vancouver Rocheuses Calgary",
                @"E:\_Diapos\2004-09 - La Baule",
            };

            Regex reDirectoryDate = new Regex(@"^(\d\d\d\d)-(\d\d) - (.*)$");
            Regex reFileSequence = new Regex(@"^.*-(\d\d\d)$");
            foreach (string sourceDirectory in directories2)
            {
                WriteLine(sourceDirectory);
                var files = System.IO.Directory.GetFiles(sourceDirectory, "*.jpg", SearchOption.TopDirectoryOnly).OrderBy(x => x);

                Match maDir = reDirectoryDate.Match(Path.GetFileName(sourceDirectory));
                if (!maDir.Success)
                {
                    WriteLine("*** Pas de match: " + sourceDirectory);
                    Debugger.Break();
                }
                int y = int.Parse(maDir.Groups[1].Value);
                int m = int.Parse(maDir.Groups[2].Value);
                string description = maDir.Groups[3].Value;

                files.AsParallel().ForAll(
                    file =>
                    {
                        string basename = Path.GetFileNameWithoutExtension(file);
                        Match ma = reFileSequence.Match(basename);
                        if (!ma.Success)
                        {
                            WriteLine("*** Pas de match: " + file);
                            goto nextFile;
                        }

                        int seq = int.Parse(ma.Groups[1].Value);

                        // Check date
                        try
                        {
                            DateTime dd = new DateTime(y, m, 1);
                        }
                        catch (Exception)
                        {
                            WriteLine("*** Date invalide: " + file);
                            goto nextFile;
                        }

                        int h = 12 + (int)(seq / 60);
                        int mm = seq % 60;
                        int ss = 0;

                        string destDir = Path.Combine(dest, Path.GetFileName(sourceDirectory));
                        string destFile = Path.Combine(destDir, basename + ".jpg");
                        string newDate = $"{y:D4}:{m:D2}:01 {h:D2}:{mm:D2}:{ss:D2}";

                        if (!Directory.Exists(destDir))
                            Directory.CreateDirectory(destDir);
                        RedatePhoto(file, destFile, newDate, null, description);
                        nextFile:;
                    });
            }
            */

            /*
            string[] directories3 = new string[]
            {
    //                @"\\FLAK\Cloro\Mes photos\_Diapos\2005-03 - Motoneige Québec",
                @"\\FLAK\Cloro\Mes photos\_Diapos\2005-06 - Pinérolo et vallée d'Aoste",
            };

            Regex reFileDateSequence = new Regex(@"^(\d\d\d\d)-(\d\d)-(\d\d) - \d\d - ([^ ]+) - ([^-]+)-(\d\d\d\d)$");
            foreach (string sourceDirectory in directories3)
            {
                WriteLine(sourceDirectory);
                var files = System.IO.Directory.GetFiles(sourceDirectory, "*.jpg", SearchOption.TopDirectoryOnly).OrderBy(x => x);

                files.AsParallel().ForAll(
                    file =>
                    {
                        string basename = Path.GetFileNameWithoutExtension(file);
                        Match ma = reFileDateSequence.Match(basename);
                        if (!ma.Success)
                        {
                            WriteLine("*** Pas de match: " + file);
                            goto nextFile;
                        }

                        int y = int.Parse(ma.Groups[1].Value);
                        int m = int.Parse(ma.Groups[2].Value);
                        int d = int.Parse(ma.Groups[3].Value);
                        string appareil = ma.Groups[4].Value;
                        string description = ma.Groups[5].Value;
                        int seq = int.Parse(ma.Groups[6].Value);

                        // Check date
                        try
                        {
                            DateTime dd = new DateTime(y, m, d);
                        }
                        catch (Exception)
                        {
                            WriteLine("*** Date invalide: " + file);
                            goto nextFile;
                        }

                        int h = 12 + (int)(seq / 60);
                        int mm = seq % 60;
                        int ss = 0;

                        string destDir = Path.Combine(dest, Path.GetFileName(sourceDirectory));
                        string destFile = Path.Combine(destDir, basename + ".jpg");
                        string newDate = $"{y:D4}:{m:D2}:{d:D2} {h:D2}:{mm:D2}:{ss:D2}";

                        if (!Directory.Exists(destDir))
                            Directory.CreateDirectory(destDir);
                        RedatePhoto(file, destFile, newDate, appareil, description);
                        nextFile:;
                    });
            }
            */

            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }


        // Simple helper to dump string properties of existing pic
        private static void DumpPhoto(string filename)
        {
            using (Image img = Image.FromFile(filename))
            {
                foreach (PropertyItem prop in img.PropertyItems)
                {
                    if (prop.Type == 2)
                        WriteLine($"0x{prop.Id:x4} {prop.Type:D2} {prop.Len:D2} {Encoding.ASCII.GetString(prop.Value)}");
                }
            }
        }


        static Regex reExifDate = new Regex(@"^\d\d\d\d:\d\d:\d\d \d\d:\d\d:\d\d$");
        private static void RedatePhoto(string sourceFilename, string destFilename, string newDate, string appareil, string description)
        {
            Debug.Assert(reExifDate.IsMatch(newDate));
            //var str = System.Text.Encoding.ASCII.GetString(dateTimeOriginal.Value);
            //str = "2016:07:03 12:41:44\0";

            using (Image img = Image.FromFile(sourceFilename))
            {
                SetProperty(img, 0x9003, newDate);
                if (appareil != null)
                    SetProperty(img, 0x0110, appareil);
                SetProperty(img, 0x010E, description);

                img.Save(destFilename);
            }
        }

        private static void SetProperty(Image img, int Id, string val)
        {
            Encoding encoding = Encoding.UTF8;
            PropertyItem prop;

            try
            {
                prop = img.GetPropertyItem(Id);
            }
            catch (Exception)
            {
                prop = img.PropertyItems[0];
                prop.Type = 2;
                prop.Id = Id;
            }
            prop.Value = encoding.GetBytes(val + "\0");
            img.SetPropertyItem(prop);
        }

    }

    public class CountDateMinMax
    {
        public int Count;
        public DateTime DateMin;
        public DateTime DateMax;
        public List<string> filesList;
    }


    static class LevenshteinDistance
    {
        // From https://en.wikipedia.org/wiki/Levenshtein_distance
        static public int Distance(string s, string t, int diffMax)
        {
            // Optimisation perso, j'ai pas besoin des distances supérieures à diffMax
            if (Math.Abs(s.Length - t.Length) > diffMax) return diffMax + 1;

            // degenerate cases
            if (s == t) return 0;
            if (s.Length == 0) return t.Length;
            if (t.Length == 0) return s.Length;

            // create two work vectors of integer distances
            int[] v0 = new int[t.Length + 1];
            int[] v1 = new int[t.Length + 1];

            // initialize v0 (the previous row of distances)
            // this row is A[0][i]: edit distance for an empty s
            // the distance is just the number of characters to delete from t
            for (int i = 0; i < v0.Length; i++)
                v0[i] = i;

            for (int i = 0; i < s.Length; i++)
            {
                // calculate v1 (current row distances) from the previous row v0

                // first element of v1 is A[i+1][0]
                //   edit distance is delete (i+1) chars from s to match empty t
                v1[0] = i + 1;

                // use formula to fill in the rest of the row
                for (int j = 0; j < t.Length; j++)
                {
                    var cost = (s[i] == t[j]) ? 0 : 1;
                    v1[j + 1] = Minimum(v1[j] + 1, v0[j + 1] + 1, v0[j] + cost);
                }

                // copy v1 (current row) to v0 (previous row) for next iteration
                for (int j = 0; j < v0.Length; j++)
                    v0[j] = v1[j];
            }

            return v1[t.Length];
        }

        static int Minimum(int a, int b, int c)
        {
            if (a <= b && a <= c) return a;
            if (b <= a && b <= c) return b;
            return c;
        }

    }
}
