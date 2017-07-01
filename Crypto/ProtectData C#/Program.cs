// From http://msdn.microsoft.com/en-us/library/system.security.cryptography.protecteddata.aspx
// 2012-09-24   FPVI

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;

public class DataProtectionSample
{
    // Create byte array for additional entropy when using Protect method. 
    static byte[] s_aditionalEntropy = { 9, 8, 7, 6, 5 };

    public static void Main()
    {
        // Create a simple byte array containing data to be encrypted. 

        byte[] secret = { 2, 3, 5, 7, 11, 13, 17, 19, 23 };

        //Encrypt the data. 
        byte[] encryptedSecret = Protect(secret);
        Console.WriteLine("The encrypted byte array is:");
        PrintValues(encryptedSecret);

        // Decrypt the data and store in a byte array. 
        byte[] originalData = Unprotect(encryptedSecret);
        Console.WriteLine("{0}The original data is:", Environment.NewLine);
        PrintValues(originalData);

        // bytes protected From VB6 test app with identical salt
        Console.WriteLine();
        byte[] protectedData={1, 0, 0, 0, 208, 140, 157, 223, 1, 21, 209, 17, 140, 122, 0, 192, 79, 194, 151, 235, 1, 0, 0, 0, 45, 166, 113, 5, 143, 72, 32, 68, 178, 175, 217, 117, 134, 26, 2, 116, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 16, 102, 0, 0, 0, 1, 0, 0, 32, 0, 0, 0, 244, 227, 52, 56, 135, 198, 83, 166, 87, 140, 89, 223, 82, 182, 184, 40, 104, 149, 79, 162, 129, 203, 43, 190, 63, 242, 97, 150, 133, 103, 78, 136, 0, 0, 0, 0, 14, 128, 0, 0, 0, 2, 0, 0, 32, 0, 0, 0, 129, 83, 19, 144, 123, 23, 65, 103, 16, 191, 134, 12, 196, 78, 155, 208, 245, 51, 215, 110, 170, 186, 144, 145, 178, 1, 172, 149, 89, 254, 130, 104, 16, 0, 0, 0, 166, 56, 122, 60, 79, 166, 187, 6, 20, 220, 137, 62, 27, 187, 99, 193, 64, 0, 0, 0, 30, 175, 211, 192, 105, 26, 107, 111, 50, 250, 215, 27, 69, 182, 119, 55, 57, 146, 247, 35, 211, 16, 61, 167, 94, 90, 46, 73, 231, 10, 102, 153, 43, 111, 11, 252, 244, 236, 182, 62, 64, 234, 131, 70, 83, 109, 40, 57, 228, 96, 40, 3, 80, 222, 118, 2, 143, 243, 9, 29, 191, 160, 3, 174};
        byte[] unprotectedData = Unprotect(protectedData);
        PrintValues(unprotectedData);

        Console.WriteLine();
        Console.Write("(Pause)");
        Console.ReadLine();
    }

    public static byte[] Protect(byte[] data)
    {
        try
        {
            // Encrypt the data using DataProtectionScope.CurrentUser. The result can be decrypted 
            //  only by the same current user. 
            return ProtectedData.Protect(data, s_aditionalEntropy, DataProtectionScope.CurrentUser);
        }
        catch (CryptographicException e)
        {
            Console.WriteLine("Data was not encrypted. An error occurred.");
            Console.WriteLine(e.ToString());
            return null;
        }
    }

    public static byte[] Unprotect(byte[] data)
    {
        try
        {
            //Decrypt the data using DataProtectionScope.CurrentUser. 
            return ProtectedData.Unprotect(data, s_aditionalEntropy, DataProtectionScope.CurrentUser);
        }
        catch (CryptographicException e)
        {
            Console.WriteLine("Data was not decrypted. An error occurred.");
            Console.WriteLine(e.ToString());
            return null;
        }
    }

    public static void PrintValues(Byte[] myArr)
    {
        foreach (Byte i in myArr)
        {
            Console.Write(" {0}", i);
        }
        Console.WriteLine();
    }

}