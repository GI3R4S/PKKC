﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace PKCK_ZAD5.XMLObjectModel
{
    [XmlRoot("średnicaMembrany")]
    public class SrednicaMembrany
    {
        [XmlText]
        public int srednicaMembrany;
        [XmlAttribute("jednostka")]
        public string jednostka;
    }
}
