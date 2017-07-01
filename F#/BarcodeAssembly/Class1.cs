using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BarcodeAssembly
{
    public class BarcodeAssembly
    {
        public class TypeOfPrinter
        {
            private TypeofPrinterEnum id;
            public string description;

            internal TypeOfPrinter(TypeofPrinterEnum id, string description)
            {
                this.id = id;
                this.description = description;
            }

            internal TypeofPrinterEnum type
            {
                get { return id; }
            }
        }







        internal enum TypeofPrinterEnum
        {
            TLP2844e,
            Kiestrae
        }


        private TypeOfPrinter TLP2844 = new TypeOfPrinter(TypeofPrinterEnum.TLP2844e, "Standard Zebra printer");
        private TypeOfPrinter Kiestra = new TypeOfPrinter(TypeofPrinterEnum.Kiestrae, "Lab automatic printing system");

        public IEnumerable<TypeOfPrinter> getTypesOfPrinters()
        {
            yield return TLP2844;
            yield return Kiestra;
        }


        public string EncodeSample(TypeOfPrinter p, string inputValue)
        {
            switch (p.type)
            {
                case TypeofPrinterEnum.TLP2844e:
                    return "q300";

                case TypeofPrinterEnum.Kiestrae:
                    return "KI000";
            }
            return "???";
        }
    }

}
