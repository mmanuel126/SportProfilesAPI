using System.Security.Cryptography ;
using System.Text;

namespace spapi.Helper
{
    /// <summary>
    /// a simple cryptography implementation to encrypt and decrypt a string using DES
    /// DES (Data Ecryption Standard) is a symmetric-key algorithm used for encrypting digital data.
    /// This is an outdated but simple to implement for this project. Replace this to a stronger
    /// algorithm like AES for real world devevelopment.
    /// </summary>
    public static class EncryptionHelper
    {
        private static readonly byte[] IV = [0x12, 0x34, 0x56, 0x78, 0x90, 0xab, 0xcd, 0xef];

        /// <summary>
        /// decrypt a given string 
        /// </summary>
        /// <param name="stringToDecrypt"></param>
        /// <param name="sEncryptionKey"></param>
        /// <returns>returns the string decrypted</returns>
        public static string Decrypt(string stringToDecrypt, string sEncryptionKey)
        {
            stringToDecrypt = stringToDecrypt.Replace(' ', '+');
            byte[] inputByteArray = new byte[stringToDecrypt.Length + 1];
            try
            {
                byte[] key = System.Text.Encoding.UTF8.GetBytes(sEncryptionKey);
                #pragma warning disable SYSLIB0021 // Type or member is obsolete
                DESCryptoServiceProvider des = new DESCryptoServiceProvider();
                #pragma warning restore SYSLIB0021 // Type or member is obsolete
                inputByteArray = Convert.FromBase64String(stringToDecrypt);
                MemoryStream ms = new MemoryStream();
                CryptoStream cs = new CryptoStream(ms,
                  des.CreateDecryptor(key, IV), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();
                System.Text.Encoding encoding = System.Text.Encoding.UTF8;
                return encoding.GetString(ms.ToArray());
            }
            catch (Exception)
            {
                return "";
            }
        }

        /// <summary>
        /// encrypt a given string 
        /// </summary>
        /// <param name="stringToEncrypt"></param>
        /// <param name="SEncryptionKey"></param>
        /// <returns>returns the string encrypted</returns>
        public static string Encrypt(string stringToEncrypt, string SEncryptionKey)
        {
            try
            {
                byte[] key = System.Text.Encoding.UTF8.GetBytes(SEncryptionKey);
                #pragma warning disable SYSLIB0021 // Type or member is obsolete
                DESCryptoServiceProvider des = new DESCryptoServiceProvider();
                #pragma warning restore SYSLIB0021 // Type or member is obsolete
                byte[] inputByteArray = Encoding.UTF8.GetBytes(stringToEncrypt);
                MemoryStream ms = new MemoryStream();
                CryptoStream cs = new CryptoStream(ms,
                  des.CreateEncryptor(key, IV), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();
                return Convert.ToBase64String(ms.ToArray());
            }
            catch (Exception)
            {
                return "";
            }
        }
    }
}
