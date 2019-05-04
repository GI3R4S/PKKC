using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace PKCK_ZAD5.XMLObjectModel
{
    [XmlRoot("autor")]
    public class Autor
    {
        [XmlElement("pseudonim")]
        public string pseudonim;
        [XmlElement("imie")]
        public string imie;
        [XmlElement("nazwisko")]
        public string nazwisko;
    }
}
