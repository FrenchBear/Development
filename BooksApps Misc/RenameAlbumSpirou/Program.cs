using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Text.RegularExpressions;
using System.Diagnostics;
using static System.Console;


namespace RenameAlbumSpirou
{
    class Program
    {
        static Regex reAlbumSpirou = new Regex(@"^Spirou - (.*) \(Album (\d\d\d)\)$");

        static void Main(string[] args)
        {
            string[] files = Directory.GetFiles(@"C:\temp\PDF", "*.pdf");
            foreach (string file in files)
            {
                string baseName = Path.GetFileNameWithoutExtension(file);
                if (baseName.StartsWith("Almanach"))
                    continue;

                Match myMatch = reAlbumSpirou.Match(baseName);
                if (!myMatch.Success)
                    Debugger.Break();

                int na = int.Parse(myMatch.Groups[2].ToString());
                string a = "";
                if (na == 7) a = "1940";
                else if (na >= 8 && na <= 9) a = "1941";
                else if (na >= 10 && na <= 12) a = "1942";
                else if (na >= 13 && na <= 14) a = "1943";
                else if (na ==15) a = "1944";
                else if (na >= 16 && na <= 17) a = "1945";
                else if (na >= 18 && na <= 20) a = "1946";
                else if (na >= 21 && na <= 23) a = "1947";
                else if (na >= 24 && na <= 27) a = "1948";
                else if (na >= 28 && na <= 31) a = "1949";
                else if (na >= 32 && na <= 35) a = "1950";
                else if (na >= 36 && na <= 39) a = "1951";
                else if (na >= 40 && na <= 43) a = "1952";
                else if (na >= 44 && na <= 47) a = "1953";
                else if (na >= 48 && na <= 51) a = "1954";
                else if (na >= 52 && na <= 55) a = "1955";
                else if (na >= 56 && na <= 59) a = "1956";
                else if (na >= 60 && na <= 64) a = "1957";
                else if (na >= 65 && na <= 69) a = "1958";
                else if (na >= 70 && na <= 74) a = "1959";
                else if (na >= 75 && na <= 79) a = "1960";
                else if (na >= 80 && na <= 83) a = "1961";
                else if (na >= 84 && na <= 87) a = "1962";
                else if (na >= 88 && na <= 91) a = "1963";
                else if (na >= 92 && na <= 95) a = "1964";
                else if (na >= 96 && na <= 99) a = "1965";
                else if (na >= 100 && na <= 103) a = "1966";
                else if (na >= 104 && na <= 107) a = "1967";
                else if (na >= 108 && na <= 111) a = "1968";
                else if (na >= 112 && na <= 115) a = "1969";
                else if (na >= 116 && na <= 119) a = "1970";
                else if (na >= 120 && na <= 123) a = "1971";
                else if (na >= 124 && na <= 127) a = "1972";
                else if (na >= 128 && na <= 131) a = "1973";
                else if (na >= 132 && na <= 135) a = "1974";
                else if (na >= 136 && na <= 139) a = "1975";
                else if (na >= 140 && na <= 143) a = "1976";
                else if (na >= 144 && na <= 147) a = "1977";
                else if (na >= 148 && na <= 151) a = "1978";
                else if (na >= 152 && na <= 155) a = "1979";
                else if (na >= 156 && na <= 159) a = "1980";
                else if (na >= 160 && na <= 163) a = "1981";
                else if (na >= 160 && na <= 163) a = "1981";
                else if (na >= 164 && na <= 167) a = "1982";
                else if (na >= 168 && na <= 172) a = "1983-84";
                else if (na >= 173 && na <= 177) a = "1984-85";

                if (a == "")
                    Debugger.Break();

                string newName = "Album de Spirou n°" + string.Format("{0:D3}", na) + " - " + a + " - Journal de Spirou " + myMatch.Groups[1].ToString();

                WriteLine($"REN \"{baseName}.pdf\" \"{newName}.pdf\"");
            }


            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }
    }
}
