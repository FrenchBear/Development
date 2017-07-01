using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BarcodeAssembly;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            var ba = new BarcodeAssembly.BarcodeAssembly();

            foreach (BarcodeAssembly.BarcodeAssembly.TypeOfPrinter item in ba.getTypesOfPrinters())
            {
                Console.WriteLine(item.description);
            }

            BarcodeAssembly.BarcodeAssembly.TypeOfPrinter myPrinterType = ba.getTypesOfPrinters().Last();

            string s = ba.EncodeSample(myPrinterType, "464-2015-07010161");
            Console.WriteLine(s);

            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }
    }
}
