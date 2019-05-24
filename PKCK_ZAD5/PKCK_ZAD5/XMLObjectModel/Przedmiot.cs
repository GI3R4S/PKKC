using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace PKCK_ZAD5.XMLObjectModel
{
    [XmlRoot("przedmiot")]
    public class Przedmiot
    {
        [XmlText]
        public string przedmiot { get; set; }
        [XmlAttribute("przedmiotID")]
        public string przedmiotId { get; set; }
        [XmlAttribute("markaID")]
        public string markaId { get; set; }
        [XmlElement("nazwa")]
        public string nazwa { get; set; }
        [XmlElement("cena")]
        public Cena cena { get; set; } = new Cena();
        [XmlElement("typKonstrukcji")]
        public string typKonstrucji { get; set; }
        [XmlElement("średnicaMembrany")]
        public SrednicaMembrany srednicaMembrany { get; set; } = new SrednicaMembrany();
        [XmlElement("pasmoPrzenoszeniaSłuchawek")]
        public PasmoPrzenoszeniaSluchawek pasmoPrzenoszeniaSluchawek { get; set; } = new PasmoPrzenoszeniaSluchawek();
        [XmlElement("impedancjaSłuchawek")]
        public ImpedancjaSluchawek impedancjaSluchawek { get; set; } = new ImpedancjaSluchawek();
        [XmlElement("czułośćSłuchawek")]
        public CzuloscSluchawek czuloscSluchawek { get; set; } = new CzuloscSluchawek();
        [XmlElement("wbudowanyMikrofon")]
        public string wbudowanyMikrofon { get; set; }
        [XmlElement("kolor")]
        public string kolor { get; set; }
        [XmlElement("długośćKabla")]
        public DlugoscKabla dlugoscKabla { get; set; } = new DlugoscKabla();
    }
}
