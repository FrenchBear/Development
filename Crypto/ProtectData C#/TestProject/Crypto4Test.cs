using ProtectedData_example_CS;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace TestProject
{
    
    
    /// <summary>
    ///This is a test class for Crypto4Test and is intended
    ///to contain all Crypto4Test Unit Tests
    ///</summary>
    [TestClass()]
    public class Crypto4Test
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion

        Random rnd = new Random();

        /// <summary>
        ///A test for ByteArrayToHexString
        ///</summary>
        [TestMethod()]
        public void ByteArrayToHexStringTest()
        {
            byte[] Buff = { 0, 1, 2, 14, 15, 16, 17, 254, 255 };
            string expected = "0001020E0F1011FEFF";
            string actual;
            actual = Crypto4.ByteArrayToHexString(Buff);
            Assert.AreEqual(expected, actual);
        }

        /// <summary>
        ///A test for HexStringToByteArray
        ///</summary>
        [TestMethod()]
        public void HexStringToByteArrayTest()
        {
            string s = "0001020E0F1011FEFF";
            byte[] expected = { 0, 1, 2, 14, 15, 16, 17, 254, 255 };
            byte[] actual;
            actual = Crypto4.HexStringToByteArray(s);
            CollectionAssert.AreEqual(expected, actual);
        }

        /// <summary>
        ///Random roundtrip tests for HexString-ByteArray conversions
        ///</summary>
        [TestMethod()]
        public void HexStringByteArrayRandomTest()
        {
            System.Text.StringBuilder sb = null;
            // Test random hex strings
            for (int i = 1; i <= 1000; i++)
            {
                sb = new System.Text.StringBuilder();
                for (int j = 1; j <= 100; j++)
                    sb.Append(rnd.Next(256).ToString("X2"));
                Assert.AreEqual(Crypto4.ByteArrayToHexString(Crypto4.HexStringToByteArray(sb.ToString())), sb.ToString());
            }
            // Test random byte arrays
            for (int i = 1; i <= 1000; i++)
            {
                byte[] Buffer = new byte[101];
                rnd.NextBytes(Buffer);
                CollectionAssert.AreEqual(Crypto4.HexStringToByteArray(Crypto4.ByteArrayToHexString(Buffer)), Buffer);
            }
        }


        // Helper for String-ByteArray conversions
        // Returns a random string of a given length
        // 80% are in 00..FF, 20% in 100..FFFF excluding surrogates (range D800..DFFF)
        private string RandomString(int l)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            while (l > 0)
            {
                if (rnd.NextDouble() < 0.8)
                    sb.Append((char)(rnd.Next(256)));
                else
                {
                    int c = 0;
                    do
                    {
                        c = rnd.Next(65536);
                    } while (c >= 0xd800 && c <= 0xdfff);
                    sb.Append((char)c);
                }
                l = l - 1;
            }
            return sb.ToString();
        }

        // Helper for String-ByteArray conversions
        // Returns a random array of bytes of a given size representing UTF16 characters excluding surrogates
        private byte[] RandomBytes(int l)
        {
            byte[] b = new byte[l];
            for (int i = 0; i <= l - 2; i += 2)
            {
                int c = 0;
                do
                {
                    c = rnd.Next(65536);
                } while (c >= 0xd800 && c <= 0xdfff);
                b[i] = (byte)(c % 256);
                b[i + 1] = (byte)(c / 256);
            }
            // In case an odd size is requested
            if ((l % 2) == 1)
                b[l - 1] = (byte)(rnd.Next(256));
            return b;
        }


        /// <summary>
        ///A test for StringToByteArray
        ///</summary>
        [TestMethod()]
        public void StringToByteArrayTest()
        {
            string sText = "Yé" + (char)0x1234 + (char)0xCAFE;
            byte[] expected = {(byte)'Y', 0, (byte)'é', 0, 0x34, 0x12, 0xFE, 0xCA};
            byte[] actual;
            actual = Crypto4.StringToByteArray(sText);
            CollectionAssert.AreEqual(expected, actual);

            sText = ""+(char)0xCAFE;
            expected = new byte[] {0xFE, 0xCA};
            actual = Crypto4.StringToByteArray(sText);
            CollectionAssert.AreEqual(expected, actual);
        }

        
        /// <summary>
        ///A test for ByteArrayToString
        ///</summary>
        [TestMethod()]
        public void ByteArrayToStringTest()
        {
            byte[] BuffIn = { (byte)'Y', 0, (byte)'é', 0, 0x34, 0x12, 0xFE, 0xCA };
            string expected = "Yé" + (char)0x1234 + (char)0xCAFE;
            string actual;
            actual = Crypto4.ByteArrayToString(BuffIn);
            Assert.AreEqual(expected, actual);
        }


        ///<summary>
        ///Random roundtrip tests for StringToByteArray
        ///</summary>
        [TestMethod()]
        public void StringToByteArrayRandomTests()
        {
            byte[] Buffer = null;
            for (int i = 1; i <= 1000; i++)
            {
                Buffer = RandomBytes(100);
                CollectionAssert.AreEqual(Buffer, Crypto4.StringToByteArray(Crypto4.ByteArrayToString(Buffer)));
            }
            string s = null;
            for (int i = 1; i <= 1000; i++)
            {
                s = RandomString(100);
                Assert.AreEqual(s, Crypto4.ByteArrayToString(Crypto4.StringToByteArray(s)));
            }
        }


        ///<summary>
        ///A test for ProtectDataCore (simple roundtrip protect-unprotect)
        ///</summary>
        [TestMethod()]
        public void ProtectDataCoreTest()
        {
            byte[] data = new byte[9];
            data[0] = 2;
            data[1] = 3;
            data[2] = 5;
            data[3] = 7;
            data[4] = 11;
            data[5] = 13;
            data[6] = 17;
            data[7] = 19;
            data[8] = 23;

            byte[] additionalEntropy = new byte[5];
            additionalEntropy[0] = 9;
            additionalEntropy[1] = 8;
            additionalEntropy[2] = 7;
            additionalEntropy[3] = 6;
            additionalEntropy[4] = 5;

            byte[] expected = data;
            byte[] actual = null;
            actual = Crypto4.UnprotectDataCore(Crypto4.ProtectDataCore(data, additionalEntropy), additionalEntropy);
            CollectionAssert.AreEqual(expected, actual);
        }


        /// <summary>
        ///A test for ProtectString
        ///</summary>
        [TestMethod()]
        public void ProtectStringTest()
        {
            string sClearText = "Secret" + (char)0x1234 + (char)0xCAFE;
            string sSalt = "NaCl" + (char)0x4567 + (char)0xFEDC;
            string expected = sClearText;
            string actual;
            actual = Crypto4.UnprotectString(Crypto4.ProtectString(sClearText, sSalt), sSalt);
            Assert.AreEqual(expected, actual);
        }

        ///<summary>
        ///A test for UnrotectString, only really working for FPVI on SKULL system (test compatibility with VB6 counterpart)
        ///</summary>
        [TestMethod()]
        public void UnprotectStringTestForFPVIOnSKULL()
        {
            string sSecret = "01000000D08C9DDF0115D1118C7A00C04FC297EB0100000053738CE90DB8A74588A16C0DDA2F675B00000000020000000000106600000001000020000000BDEE2E0ED49FB98D2B48D642252741F1CBD3A82D948B78F3D4C7F0209190AB60000000000E8000000002000020000000EFC4BC5FF1FDC38FC11E0776371F00A5ADF423EE5A8D2ADB96DBF8575E18082D20000000E9CD49CB84907F53DFFF3C341726409BE31875F9BD599DEFBD92065D78FAB19D40000000F66C0EDE98245E815B1B30C001A0B35E0CF1C1496FB24395C1D242A8884C3A789BF6ABB54BD40919A6171DA2CB1D34FD41CCC3C913EB3A64257A4053F3563057";
            string expected = "madeinchina";

            string actual = null;
            try
            {
                actual = Crypto4.UnprotectString(Crypto4.HexStringToByteArray(sSecret), "Salt&Pepper");
            }
            catch (Exception ex)
            {
                if (System.Security.Principal.WindowsIdentity.GetCurrent().Name == "SKULL\\Pierre")
                    Assert.Fail();
                // For all other combinations of system and user, failure is normal!
                return;
            }

            Assert.AreEqual(expected, actual);
        }
    }
}
