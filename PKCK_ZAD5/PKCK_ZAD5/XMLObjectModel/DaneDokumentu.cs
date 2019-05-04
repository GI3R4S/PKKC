using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace PKCK_ZAD5.XMLObjectModel
{
    [XmlRoot("daneDokumentu")]
    public class DaneDokumentu
    {
        [XmlElement("opisDokumentu")]
        public string OpisDokumentu;
        [XmlElement("autorzy")]
        public Autorzy autorzy;
        [XmlElement("dataUtworzenia")]
        public DateTime dataUtworzenia;
        [XmlElement("dataModyfikacji")]
        public DateTime dataModyfikacji;
    }
}
