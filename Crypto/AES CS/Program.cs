using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace AES_CS
{
    class Program
    {
        static void Main(string[] args)
        {
            WriteTest();
            ReadTest();

            Console.WriteLine();
            Console.Write("(Pause)");
            Console.ReadLine();
        }

        static void ReadTest()
        {
            Console.WriteLine("Enter password: ");
            string password = Console.ReadLine();

            using (StreamReader reader = new StreamReader("aes.cs.txt"))
            {
                EncryptedData enc = new EncryptedData();
                enc.SaltString = reader.ReadLine();
                enc.MACString = reader.ReadLine();
                enc.DataString = reader.ReadLine();

                Console.WriteLine("The decrypted data was: " + Crypto.Decrypt(password, enc));
            }
        }

        static void WriteTest()
        {
            Console.WriteLine("Enter data: ");
            string data = Console.ReadLine();
            Console.WriteLine("Enter password: ");
            string password = Console.ReadLine();

            EncryptedData enc = Crypto.Encrypt(password, data);

            using (StreamWriter stream = new StreamWriter("aes.cs.txt"))
            {
                stream.WriteLine(enc.SaltString);
                stream.WriteLine(enc.MACString);
                stream.WriteLine(enc.DataString);

                Console.WriteLine("The encrypted data was: " + enc.DataString);
            }
        }
    }
}
