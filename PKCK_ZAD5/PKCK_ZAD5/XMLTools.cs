using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using PKCK_ZAD5.XMLObjectModel;

namespace PKCK_ZAD5
{
    public static class XMLTools
    {
        public static Zawartosc LoadXmlFile(string aPath)
        {
            using (TextReader textReader = new StreamReader(aPath))
            {
                XmlSerializer xmlSerializer = new XmlSerializer(typeof(Zawartosc));
                return (Zawartosc)xmlSerializer.Deserialize(textReader);
            }
        }

        public static void SaveToXmlFile(string aPath, Zawartosc aZawartosc)
        {
            string path = "";
            if (aPath.EndsWith(".xml"))
            {
                path = aPath;
            }
            else
            {
                path = aPath + ".xml";
            }
            using (TextWriter textWriter = new StreamWriter(path))
            {
                XmlSerializer xmlSerializer = new XmlSerializer(typeof(Zawartosc));
                xmlSerializer.Serialize(textWriter, aZawartosc);
            }
        }
    }
}
