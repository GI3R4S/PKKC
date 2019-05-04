using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace PKCK_ZAD5.XMLObjectModel
{
    [XmlRoot("marka")]
    public class Marka
    {
        [XmlText]
        public string marka;
        [XmlAttribute("id_marki")]
        public string id_marki;
        [XmlAttribute("krajPochodzenia")]
        public string krajPochodzenia;
        [XmlAttribute("rokPowstania")]
        public int rokPowstania;
    }
}
