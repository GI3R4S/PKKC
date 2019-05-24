using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PKCK_ZAD5
{
    class Program
    {
        static void Main(string[] args)
        {
            var zawartosc = XMLTools.LoadXmlFile("../../listaSłuchawek.xml");
            XMLTools.SaveToXmlFile("../../listaSłuchawek2.xml", zawartosc);
        }
    }
}
