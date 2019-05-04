using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace PKCK_ZAD5.XMLObjectModel
{
    [XmlRoot("pasmoPrzenoszeniaSłuchawek")]
    public class PasmoPrzenoszeniaSluchawek
    {  
        [XmlElement("minimum")]
        public Minimum minimum;
        [XmlElement("maximum")]
        public Maximum maksimum;

        [XmlRoot("minimum")]
        public class Minimum
        {
            [XmlText]
            public string czestotliwosc;
            [XmlAttribute("jednostka")]
            public string jednostka;
        }
        [XmlRoot("miximum")]
        public class Maximum
        {
            [XmlText]
            public string czestotliwosc;
            [XmlAttribute("jednostka")]
            public string jednostka;
        }
    }
}
