using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace PKCK_ZAD5.XMLObjectModel
{
    [XmlRoot("listaPrzedmiotów")]
    public class ListaPrzedmiotow
    {
        [XmlElement("przedmiot")]
        public List<Przedmiot> listaPrzedmiotów = new List<Przedmiot>();
    }
}
