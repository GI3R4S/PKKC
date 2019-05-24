using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace PKCK_ZAD5.XMLObjectModel
{
    [XmlRoot("czułośćSłuchawek")]
    public class CzuloscSluchawek
    {
        [XmlText]
        public int czuloscSluchawek { get; set; }
        [XmlAttribute("jednostka")]
        public string jednostka { get; set; }

        public string AsString
        {
            get
            {
                return czuloscSluchawek.ToString() + " " + jednostka.ToString();
            }
        }
    }
}
