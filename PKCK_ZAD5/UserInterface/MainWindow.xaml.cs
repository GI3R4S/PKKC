using PKCK_ZAD5;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using PKCK_ZAD5.XMLObjectModel;
using Microsoft.Win32;

namespace UserInterface
{
    /// <summary>
    /// Logika interakcji dla klasy MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public Zawartosc Zawartosc { get; set; } = new Zawartosc();
        public MainWindow()
        {
            InitializeComponent();
            Button_Add_New.IsEnabled = false;
        }

        private void Button_Load_XML_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.AddExtension = false;
            var result = openFileDialog.ShowDialog();

            if(result.Value)
            {
                Zawartosc = XMLTools.LoadXmlFile(openFileDialog.FileName);
                foreach(var item in Zawartosc.listaPrzedmiotow.listaPrzedmiotów)
                {
                    ListView_Przedmioty.Items.Add(item);
                }
                foreach (var item in Zawartosc.marki.marki)
                {
                    ListView_Marki.Items.Add(item);
                    ID_Marki_CB.Items.Add(item.id_marki);
                }

                Waluta_CB.Items.Add("zł");
                Waluta_CB.Items.Add("€");
                Waluta_CB.Items.Add("$");
                Button_Add_New.IsEnabled = true;

                ListView_Marki.UpdateLayout();
            }

        }

        private void Button_Save_XML_Click(object sender, RoutedEventArgs e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.AddExtension = true;
            saveFileDialog.DefaultExt = "xml";
            var result = saveFileDialog.ShowDialog();

            if (result.Value)
            {
                XMLTools.SaveToXmlFile(saveFileDialog.FileName, Zawartosc);
            }
        }


        private void Button_Click(object sender, RoutedEventArgs e)
        {
            int index = ListView_Przedmioty.SelectedIndex;

            if (index != -1)
            {
                ListView_Przedmioty.Items.RemoveAt(index);
                Zawartosc.listaPrzedmiotow.listaPrzedmiotów.RemoveAt(index);
                ListView_Przedmioty.UpdateLayout();
            }
        }

        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {

        }

        private void Button_Add_New_Click(object sender, RoutedEventArgs e)
        {
            Przedmiot przedmiotBuilder = new Przedmiot();

            przedmiotBuilder.przedmiotId = ID_Przedmiotu_TB.Text;
            przedmiotBuilder.markaId = ID_Marki_CB.Text;
            przedmiotBuilder.impedancjaSluchawek.impedancjaSluchawek = Impedancja_Jednostka_TB.Text;
            przedmiotBuilder.impedancjaSluchawek.jednostka = Impedancja_Jednostka_TB.Text;
            przedmiotBuilder.kolor = Kolor_TB.Text;
            przedmiotBuilder.nazwa = Nazwa_TB.Text;
            przedmiotBuilder.pasmoPrzenoszeniaSluchawek.minimum.czestotliwosc = Pasmo_Od_TB.Text;
            przedmiotBuilder.pasmoPrzenoszeniaSluchawek.maksimum.czestotliwosc = Pasmo_Do_TB.Text;
            przedmiotBuilder.pasmoPrzenoszeniaSluchawek.minimum.jednostka = Pasmo_Jednostka_TB.Text;
            przedmiotBuilder.pasmoPrzenoszeniaSluchawek.maksimum.jednostka = Pasmo_Jednostka_TB.Text;
            przedmiotBuilder.srednicaMembrany.srednicaMembrany = Srednica_Membrany_TB.Text;
            przedmiotBuilder.srednicaMembrany.jednostka = Srednica_Membrany_Jednostka_TB.Text;
            przedmiotBuilder.typKonstrucji = Typ_Konstrukcji_TB.Text;
            przedmiotBuilder.wbudowanyMikrofon = Mikrofon_CB.IsChecked.Value ? "Tak" : "Nie";
            przedmiotBuilder.dlugoscKabla.dlugoscKabla = Dlugosc_Kabla_TB.Text;
            przedmiotBuilder.dlugoscKabla.jednostka = Dlugosc_Kabla_Jednostka_TB.Text;
            przedmiotBuilder.cena.cena = Cena_TB.Text;
            przedmiotBuilder.cena.waluta = Waluta_CB.Text;
            przedmiotBuilder.cena.promocja = Promocja_CB.IsChecked.Value ? "TAK" : "NIE";

            ListView_Przedmioty.Items.Add(przedmiotBuilder);
            Zawartosc.listaPrzedmiotow.listaPrzedmiotów.Add(przedmiotBuilder);

            ListView_Przedmioty.UpdateLayout();

        }
    }
}
