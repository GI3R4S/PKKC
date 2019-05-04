using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace PKCK_ZAD5.XMLObjectModel
{
    [XmlRoot("marki")]
    public class Marki
    {
        [XmlElement("marka")]
        public List<Marka> marki = new List<Marka>();
    }
}
