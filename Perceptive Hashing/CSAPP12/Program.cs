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
            UInt64 hash1 = 0, hash2 = 0;
            string image1 = "C:\\Users\\Kafor_000\\Dropbox\\PicturesDBKB\\Pictures PV\\Tete17.jpg";
            string image2 = "C:\\Users\\Kafor_000\\Dropbox\\PicturesDBKB\\Pictures PV\\Tête17b.jpg";
            hash1 = ImageHash(image1);
            hash2 = ImageHash(image2);
            Console.WriteLine("{0:X}", hash1);
            Console.WriteLine("{0:X}", hash2);

            int d = ph_hamming_distance(hash1, hash2);
            Console.WriteLine("d={0}", d);
            Console.WriteLine();

            var listFiles = new List<string>();
            for (int i = 2; i <= 17; i++)
                listFiles.Add(string.Format("C:\\Users\\Kafor_000\\Dropbox\\PicturesDBKB\\Pictures PV\\Tete{0:D2}.jpg", i));

            TimeSpan t;

            t = Chrono(() => TestParallel(listFiles));
            Console.WriteLine("Parallel: {0}", t.ToString());

            t = Chrono(() => TestSequential(listFiles));
            Console.WriteLine("Sequential: {0}", t.ToString());
        }

        public UInt64 ImageHash(string file)
        {
            UInt64 hash = 0;
            ph_dct_imagehash(file, ref hash);
            return hash;
        }

        public TimeSpan Chrono(Action a)
        {
            var sw = Stopwatch.StartNew();
            a();
            sw.Stop();
            return sw.Elapsed;
        }

        public Dictionary<string, UInt64> TestSequential(IEnumerable<string> listFiles)
        {
            var d = new Dictionary<string, UInt64>();
            foreach (string file in listFiles)
            {
                UInt64 hash = ImageHash(file);
                d.Add(file, hash);
                Console.WriteLine("{0:X}", hash);
            }
            return d;
        }

        public Dictionary<string, UInt64> TestParallel(IEnumerable<string> listFiles)
        {
            var lt = new List<Task<UInt64>>();
            var d = new Dictionary<string, UInt64>();
            int n = 0;
            foreach (string file in listFiles)
            {
                string s = file;
                lt.Add(Task.Run(() => ImageHash(s)));
                n++;
            }

            Task<UInt64>[] tt = lt.ToArray();
            Task.WaitAll(tt);

            n = 0;
            foreach (string file in listFiles)
            {
                Console.WriteLine("{0:X}", tt[n].Result);
                d.Add(file, tt[n].Result);
                n++;
            }

            return d;
        }
    }
}

