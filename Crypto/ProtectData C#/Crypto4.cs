using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;

namespace ProtectedData_example_CS
{
    public static class Crypto4
    {

        // Windows Data Protection API
        public static byte[] ProtectDataCore(byte[] data, byte[] additionalEntropy)
        {
            try
            {
                // Encrypt the data using DataProtectionScope.CurrentUser. The result can be decrypted 
                //  only by the same current user. 
                return ProtectedData.Protect(data, additionalEntropy, DataProtectionScope.CurrentUser);
            }
            catch (CryptographicException e)
            {
                Console.WriteLine("Data was not encrypted. An error occurred.");
                Console.WriteLine(e.Message);
                return null;
            }
        }

        public static byte[] UnprotectDataCore(byte[] data, byte[] additionalEntropy)
        {
            try
            {
                //Decrypt the data using DataProtectionScope.CurrentUser. 
                return ProtectedData.Unprotect(data, additionalEntropy, DataProtectionScope.CurrentUser);
            }
            catch (CryptographicException e)
            {
                Console.WriteLine("Data was not decrypted. An error occurred.");
                Console.WriteLine(e.Message);
                return null;
            }
        }


        // Simple, direct conversion of Unicode strings into an array of bytes
        // Only support UTF-16 with NO support for surrogates (range D800-DFFF)
        public static byte[] StringToByteArray(string sText)
        {
            return System.Text.UnicodeEncoding.Unicode.GetBytes(sText);
        }

        public static string ByteArrayToString(byte[] BuffIn)
        {
            return System.Text.UnicodeEncoding.Unicode.GetString(BuffIn);
        }


        // Helpers working directly on strings rather than byte arrays
        public static byte[] ProtectString(string sClearText, string sSalt)
        {
            return ProtectDataCore(StringToByteArray(sClearText), StringToByteArray(sSalt));
        }

        public static string UnprotectString(byte[] Protect, string sSalt)
        {
            return ByteArrayToString(UnprotectDataCore(Protect, StringToByteArray(sSalt)));
        }


        // ==================================================================================
        // Byte Array <--> Hex String conversions
        public static string ByteArrayToHexString(byte[] Buff)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            int i = 0;
            for (i = 0; i < Buff.Length; i++)
                sb.Append(Buff[i].ToString("X2"));
            return sb.ToString();
        }

        public static byte[] HexStringToByteArray(string s)
        {
            byte[] b = null;
            int i = 0;
            b = new byte[(s.Length - 1) / 2 + 1];
            for (i = 0; i <s.Length; i += 2)
                b[i / 2] = byte.Parse(s.Substring(i,2), System.Globalization.NumberStyles.HexNumber);
            return b;
        }

    }
}
