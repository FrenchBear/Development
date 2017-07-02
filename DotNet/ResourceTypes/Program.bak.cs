using System;
using System.Globalization;
using System.IO;
using System.Reflection;
using System.Resources;

namespace ResourceTypes
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Embedded resources");
            var assembly=  Assembly.GetExecutingAssembly();
            var names = assembly.GetManifestResourceNames();

            var buffer = new char[20];

            foreach (var name in names)
            {
                using (var stream = assembly.GetManifestResourceStream(name))
                {
                    Console.WriteLine("\t{0}: {1}", name, GetHead(stream));
                }
            }

            //const string name1 = "ResourceTypes.g.resources";
            PrintResourceFile("ResourceTypes.Properties.Resources");
            //var rm = new ResourceManager(name1, assembly);
            //var v = /*Properties.Resources.MyKey; */rm.GetString("MyKey", null);
            //var c = Properties.Resources.Culture;
            //var s = rm.GetResourceSet(CultureInfo.CurrentUICulture, false, true);

            /*
            using (var stream = rm.GetStream("/EmbeddedResourceFile.txt"))
            {
                Console.WriteLine(name1, GetHead(stream));
            }*/
        }

        private static void PrintResourceFile(string name)
        {
            Console.WriteLine(name);
            var rm = new ResourceManager(name, Assembly.GetExecutingAssembly());
            var rset = rm.GetResourceSet(CultureInfo.CurrentUICulture, false, true);
            foreach (System.Collections.DictionaryEntry entry in rset)
            {
                Console.WriteLine("\t{0}: {1}", entry.Key, entry.Value);
            }
        }

        private static string GetHead(Stream stream)
        {
            using (var reader = new StreamReader(stream))
            {
                var buffer = new char[20];
                int nChars = reader.Read(buffer, 0, buffer.Length);
                string text = new String(buffer, 0, nChars);

                if (!reader.EndOfStream) text += "...";
                return text;
            }

        }
    }
}
