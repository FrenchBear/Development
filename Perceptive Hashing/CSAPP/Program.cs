using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.Runtime.InteropServices;


namespace CSAPP
{
    class Program
    {
        [DllImport(@".\pHash.dll", CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Ansi)]
        public static extern int ph_dct_imagehash([MarshalAs(UnmanagedType.LPStr)] string file, ref UInt64 hash);

        [DllImport(@".\pHash.dll", CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Ansi)]
        public static extern int ph_hamming_distance(UInt64 hash1, UInt64 hash2);

        static void Main(string[] args)
        {
            UInt64 hash1 = 0, hash2 = 0;
            string image1 = "C:\\Users\\Kafor_000\\Dropbox\\PicturesDBKB\\Pictures PV\\Tete17.jpg";
            string image2 = "C:\\Users\\Kafor_000\\Dropbox\\PicturesDBKB\\Pictures PV\\Tête17b.jpg";
            ph_dct_imagehash(image1, ref hash1);
            ph_dct_imagehash(image2, ref hash2);

            Console.WriteLine("{0:X}", hash1);
            Console.WriteLine("{0:X}", hash2);

            int d = ph_hamming_distance(hash1, hash2);
            Console.WriteLine("d={0}", d);
            Console.WriteLine();

            for (int i = 2; i <= 17; i++)
            {
                string image = string.Format("C:\\Users\\Kafor_000\\Dropbox\\PicturesDBKB\\Pictures PV\\Tete{0:D2}.jpg", i);
                UInt64 hash = 0;
                ph_dct_imagehash(image, ref hash);
                Console.WriteLine("{0}: {1:X}", i, hash);
            }

            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }
    }
}
