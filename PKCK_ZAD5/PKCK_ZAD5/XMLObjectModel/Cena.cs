using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace PKCK_ZAD5.XMLObjectModel
{
    [XmlRoot("cena")]
    public class Cena
    {
        [XmlText]
        public double cena;
        [XmlAttribute("waluta")]
        public string waluta;
        [XmlAttribute("promocja")]
        public string promocja;

    }
}
