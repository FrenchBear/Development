// Perceptual hash calculation tests
// 2013-05-25   PV
//
// pHash algorithm from http://phash.org/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Threading.Tasks;


namespace CSAPP
{
    class Program
    {
        static void Main(string[] args)
        {
            (new App()).Run();

            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }
    }

    class App
    {
        [DllImport(@".\pHash.dll", CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Ansi)]
        public static extern int ph_dct_imagehash([MarshalAs(UnmanagedType.LPStr)] string file, ref UInt64 hash);

        [DllImport(@".\pHash.dll", CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Ansi)]
        public static extern int ph_hamming_distance(UInt64 hash1, UInt64 hash2);


        public void Run()
        {
            var listFiles = new List<string>(System.IO.Directory.GetFiles(@"C:\Users\Kafor_000\Dropbox\PicturesDBKB\Drawings", "*.jpg"));
            //while (listFiles.Count > 100)
            //    listFiles.RemoveAt(0);

            var sw = Stopwatch.StartNew();
            var r = ParallelHash(listFiles);
            sw.Stop();
            Console.WriteLine("Parallel: {0}", sw.Elapsed.ToString());
            Console.WriteLine("{0} results", r.Count());

            const int threshold = 13;

            var tr = r.ToArray();
            for (int i = 0; i < tr.Length; i++)
                for (int j = i + 1; j < tr.Length; j++)
                {
                    int d = ph_hamming_distance(tr[i].Item2, tr[j].Item2);
                    if (d <= threshold)
                        Console.WriteLine("{0}    {1}    {2}", System.IO.Path.GetFileName(tr[i].Item1), System.IO.Path.GetFileName(tr[j].Item1), d);
                }
        }

        public Tuple<string, UInt64> ImageHash(string file)
        {
            UInt64 hash = 0;
            ph_dct_imagehash(file, ref hash);
            return new Tuple<string, UInt64>(file, hash);
        }

        const int MAX_PARALLISM = 10;

        public IEnumerable<Tuple<string, UInt64>> ParallelHash(IEnumerable<string> listFiles)
        {
            var lt = new List<Task<Tuple<string, UInt64>>>();
            var r = new List<Tuple<string, UInt64>>();

            int n = 0;
            foreach (string file in listFiles)
            {
                string s = file;
                lt.Add(Task.Run(() => ImageHash(s)));
                n++;
                if (n == MAX_PARALLISM)
                {
                    Task.WaitAny(lt.ToArray());
                    lock (lt)
                    {
                        var lf = new List<Task<Tuple<string, UInt64>>>();
                        foreach (var t in lt)
                            if (t.IsCompleted)
                            {
                                lf.Add(t);
                                n--;
                                r.Add(t.Result);
                                //Console.WriteLine("{0}  -->  {1:X}", System.IO.Path.GetFileName(t.Result.Item1), t.Result.Item2);
                            }
                        foreach (var t in lf)
                            lt.Remove(t);
                    }
                }
            }

            Task.WaitAll(lt.ToArray());
            foreach (var t in lt)
            {
                r.Add(t.Result);
                //Console.WriteLine("{0}  -->  {1:X}", System.IO.Path.GetFileName(t.Result.Item1), t.Result.Item2);
            }

            return r;
        }
    }
}

