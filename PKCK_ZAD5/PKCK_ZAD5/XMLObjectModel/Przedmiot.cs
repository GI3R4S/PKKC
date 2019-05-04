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
        [XmlAttribute("przedmiotID")]
        public string przedmiotId;
        [XmlAttribute("markaID")]
        public string markaId;
        [XmlElement("nazwa")]
        public string nazwa;
        [XmlElement("cena")]
        public Cena cena;
        [XmlElement("typKonstrukcji")]
        public string typKonstrucji;
        [XmlElement("średnicaMembrany")]
        public SrednicaMembrany srednicaMembrany;
        [XmlElement("pasmoPrzenoszeniaSłuchawek")]
        public PasmoPrzenoszeniaSluchawek pasmoPrzenoszeniaSluchawek;
        [XmlElement("impedancjaSłuchawek")]
        public ImpedancjaSluchawek impedancjaSluchawek;
        [XmlElement("czułośćSłuchawek")]
        public CzuloscSluchawek czuloscSluchawek;
        [XmlElement("wbudowanyMikrofon")]
        public string wbudowanyMikrofon;
        [XmlElement("kolor")]
        public string kolor;
        [XmlElement("długośćKabla")]
        public DlugoscKabla dlugoscKabla;
    }
}
