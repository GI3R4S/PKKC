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
        public string marka { get; set; }
        [XmlAttribute("id_marki")]
        public string id_marki { get; set; }
        [XmlAttribute("krajPochodzenia")]
        public string krajPochodzenia { get; set; }
        [XmlAttribute("rokPowstania")]
        public int rokPowstania { get; set; }
    }
}
