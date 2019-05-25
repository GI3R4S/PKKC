using PKCK_ZAD5.XMLObjectModel;
using System.IO;
using System.Net;
using System.Xml;
using System.Xml.Serialization;
using System.Xml.XPath;
using System.Xml.Xsl;


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
                XmlSerializerNamespaces ns = new XmlSerializerNamespaces();
                xmlSerializer.Serialize(textWriter, aZawartosc, ns);
            }
        }

        public static void GenerateDocument(string aXmlPath, string aXsltPath)
        {
            // reading source and transformation file
            XmlDocument sourceXmlDocument = new XmlDocument();
            sourceXmlDocument.Load(aXmlPath);
            string test = "";
            using (TextReader textReader = new StreamReader(aXsltPath))
            {
                test = textReader.ReadToEnd();
            }

            XmlUrlResolver resolver = new XmlUrlResolver();
            resolver.Credentials = CredentialCache.DefaultCredentials;

            XslCompiledTransform transformer = new XslCompiledTransform();
            transformer.Load(new XPathDocument(aXsltPath), XsltSettings.Default, resolver);


            MemoryStream outputStream = new MemoryStream();
            XmlWriter xmlWriter = XmlWriter.Create(outputStream, transformer.OutputSettings);
            transformer.Transform(sourceXmlDocument, null, xmlWriter);
            outputStream.Position = 0;
            StreamReader streamReader = new StreamReader(outputStream);
            using (TextWriter textWriter = new StreamWriter(aXmlPath.Replace(".xml", ".txt")))
            {
                textWriter.Write(streamReader.ReadToEnd());
            }
        }
    }
}
