using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using static System.Console;

namespace JPGtoPDF
{
    class JPGtoPDF
    {
        static void Main(string[] args)
        {
            foreach (string s in new string[] {"00", "03", "04" })
            {
                WriteLine(s);
                ConvertImageToPdf(@"c:\temp\" + s + ".jpg", @"c:\temp\" + s + ".pdf");
            }


            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }


        // From https://alandjackson.wordpress.com/2013/09/27/convert-an-image-to-a-pdf-in-c-using-itextsharp/
        public static void ConvertImageToPdf(string srcFilename, string dstFilename)
        {
            iTextSharp.text.Rectangle pageSize = null;

            using (var srcImage = new Bitmap(srcFilename))
            {
                pageSize = new iTextSharp.text.Rectangle(0, 0, srcImage.Width, srcImage.Height);
            }
            using (var ms = new MemoryStream())
            {
                var document = new iTextSharp.text.Document(pageSize, 0, 0, 0, 0);
                iTextSharp.text.pdf.PdfWriter.GetInstance(document, ms).SetFullCompression();
                document.Open();
                var image = iTextSharp.text.Image.GetInstance(srcFilename);
                document.Add(image);
                document.Close();

                File.WriteAllBytes(dstFilename, ms.ToArray());
            }
        }
    }
}
