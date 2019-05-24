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
        public Minimum minimum { get; set; } = new Minimum();
        [XmlElement("maximum")]
        public Maximum maksimum { get; set; } = new Maximum();

        [XmlRoot("minimum")]
        public class Minimum
        {
            [XmlText]
            public string czestotliwosc { get; set; }
            [XmlAttribute("jednostka")]
            public string jednostka { get; set; }
        }
        [XmlRoot("miximum")]
        public class Maximum
        {
            [XmlText]
            public string czestotliwosc { get; set; }
            [XmlAttribute("jednostka")]
            public string jednostka { get; set; }
        }

        public string AsString
        {
            get
            {
                return minimum.czestotliwosc.ToString() + " " + minimum.jednostka + " - " + maksimum.czestotliwosc.ToString() + " " + maksimum.jednostka;
            }
        }
    }
}
