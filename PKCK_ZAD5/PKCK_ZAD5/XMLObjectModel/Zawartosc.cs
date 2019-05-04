using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace PKCK_ZAD5.XMLObjectModel
{
    [XmlRoot("zawartość")]
    public class Zawartosc
    {
        [XmlElement("daneDokumentu")]
        public DaneDokumentu daneDokumentu;
        [XmlElement("markiTytuł")]
        public string markiTytul;
        [XmlElement("marki")]
        public Marki marki;
        [XmlElement("listaPrzedmiotów")]
        public ListaPrzedmiotow listaPrzedmiotow;
    }
}
