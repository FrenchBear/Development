// Simple packaging of managed AES encryption
// From http://stackoverflow.com/questions/4545387/using-aes-encryption-in-net-cryptographicexception-saying-the-padding-is-inva
// 2012-09-24   PV

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace AES_CS
{
    public static class Crypto
    {
        public static EncryptedData Encrypt(string password, string data)
        {
            return Crypto.Transform(true, password, data, null, null) as EncryptedData;
        }

        public static string Decrypt(string password, EncryptedData data)
        {
            return Crypto.Transform(false, password, data.DataString, data.SaltString, data.MACString) as string;
        }

        private static object Transform(bool encrypt, string password, string data, string saltString, string macString)
        {
            using (AesManaged aes = new AesManaged())
            {
                aes.Mode = CipherMode.CBC;
                aes.Padding = PaddingMode.PKCS7;
                int key_len = aes.KeySize / 8;
                int iv_len = aes.BlockSize / 8;
                const int salt_size = 8;
                const int iterations = 8192;

                byte[] salt = encrypt ? new byte[salt_size] : Convert.FromBase64String(saltString);
                if (encrypt)
                {
                    new RNGCryptoServiceProvider().GetBytes(salt);
                }

                byte[] bc_key = new Rfc2898DeriveBytes("BLK" + password, salt, iterations).GetBytes(key_len);
                byte[] iv = new Rfc2898DeriveBytes("IV" + password, salt, iterations).GetBytes(iv_len);
                byte[] mac_key = new Rfc2898DeriveBytes("MAC" + password, salt, iterations).GetBytes(16);

                aes.Key = bc_key;
                aes.IV = iv;

                byte[] rawData = encrypt ? Encoding.UTF8.GetBytes(data) : Convert.FromBase64String(data);

                using (ICryptoTransform transform = encrypt ? aes.CreateEncryptor() : aes.CreateDecryptor())
                using (MemoryStream memoryStream = encrypt ? new MemoryStream() : new MemoryStream(rawData))
                using (CryptoStream cryptoStream = new CryptoStream(memoryStream, transform, encrypt ? CryptoStreamMode.Write : CryptoStreamMode.Read))
                {
                    if (encrypt)
                    {
                        cryptoStream.Write(rawData, 0, rawData.Length);
                        cryptoStream.FlushFinalBlock(); 

                        return new EncryptedData(salt, mac_key, memoryStream.ToArray());
                    }
                    else
                    {
                        byte[] originalData = new byte[rawData.Length];
                        int count = cryptoStream.Read(originalData, 0, originalData.Length);

                        return Encoding.UTF8.GetString(originalData, 0, count);
                    }
                }
            }
        }
    }

    public class EncryptedData
    {
        public EncryptedData()
        {
        }

        public EncryptedData(byte[] salt, byte[] mac, byte[] data)
        {
            this.Salt = salt;
            this.MAC = mac;
            this.Data = data;
        }

        public EncryptedData(string salt, string mac, string data)
        {
            this.SaltString = salt;
            this.MACString = mac;
            this.DataString = data;
        }

        public byte[] Salt
        {
            get;
            set;
        }

        public string SaltString
        {
            get { return Convert.ToBase64String(this.Salt); }
            set { this.Salt = Convert.FromBase64String(value); }
        }

        public byte[] MAC
        {
            get;
            set;
        }

        public string MACString
        {
            get { return Convert.ToBase64String(this.MAC); }
            set { this.MAC = Convert.FromBase64String(value); }
        }

        public byte[] Data
        {
            get;
            set;
        }

        public string DataString
        {
            get { return Convert.ToBase64String(this.Data); }
            set { this.Data = Convert.FromBase64String(value); }
        }
    }

}
