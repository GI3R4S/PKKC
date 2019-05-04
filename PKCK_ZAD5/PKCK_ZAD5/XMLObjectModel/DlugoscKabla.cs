using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace PKCK_ZAD5.XMLObjectModel
{
    [XmlRoot("długośćKabla")]
    public class DlugoscKabla
    {
        [XmlText]
        public string dlugoscKabla;
        [XmlAttribute("jednostka")]
        public string jednostka;
    }
}
