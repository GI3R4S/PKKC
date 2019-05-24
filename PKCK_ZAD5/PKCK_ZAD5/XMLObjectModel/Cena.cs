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
        public string cena { get; set; }
        [XmlAttribute("waluta")]
        public string waluta { get; set; }
        [XmlAttribute("promocja")]
        public string promocja { get; set; }

        public string AsString
        {
            get
            {
                return cena.ToString() + " " + waluta.ToString();
            }
        }

    }
}
