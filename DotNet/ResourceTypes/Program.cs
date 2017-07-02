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
            Console.WriteLine("Manifest resources");
            var assembly=  Assembly.GetExecutingAssembly();
            var names = assembly.GetManifestResourceNames();

            var buffer = new char[30];

            foreach (var name in names)
            {
                using (var stream = assembly.GetManifestResourceStream(name))
                {
                    Console.WriteLine("\t{0}:\r\n\t\t'{1}'", name, GetHead(stream));
                }
            }

            PrintResourceFile("ResourceTypes.g");
            PrintResourceFile("ResourceTypes.Properties.Resources");


            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }

        private static void PrintResourceFile(string name)
        {
            Console.WriteLine();
            Console.WriteLine("Items in " + name + ":");

            var rm = new ResourceManager(name, Assembly.GetExecutingAssembly());
            var rset = rm.GetResourceSet(CultureInfo.CurrentUICulture, true, true);

            foreach (System.Collections.DictionaryEntry entry in rset)
            {
                Console.WriteLine("\t{0}: {1}", entry.Key, GetStringForValue(entry.Value));
            }
        }

        private static string GetStringForValue(object value)
        {
            if (value == null) return "null";
            if (value is Stream) return "Stream: " + GetHead((Stream)value);
            return value.ToString();
        }

        private static string GetHead(Stream stream)
        {
            using (var reader = new StreamReader(stream))
            {
                var buffer = new char[40];
                int nChars = reader.Read(buffer, 0, buffer.Length);
                string text = new String(buffer, 0, nChars);

                if (!reader.EndOfStream) text += "...";
                return text;
            }

        }
    }
}
