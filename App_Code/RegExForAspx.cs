using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;
using System.Text.RegularExpressions;

namespace RegExForAspx
{ 
    public class regPass
    { 
        public static string EncryptStringPass(string queryValue)
        {
            string str_queryStringValue;
            str_queryStringValue = Convert.ToBase64String(System.Text.Encoding.Unicode.GetBytes(queryValue));
            return str_queryStringValue;
        }
        public static string DecryptStringPass(string encryptedQueryValue)
        {
            string str_DecryptedString;
            if (encryptedQueryValue.Length >= 2)
            {
                str_DecryptedString = System.Text.Encoding.Unicode.GetString(Convert.FromBase64String(encryptedQueryValue));

                return str_DecryptedString;

            }
            else
                str_DecryptedString = "0";
            return str_DecryptedString;
        }

    }
}
 