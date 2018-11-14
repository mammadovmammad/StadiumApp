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
using System.Windows.Shapes;
using StadiumApp.Models;

namespace StadiumApp
{
    /// <summary>
    /// Interaction logic for AddStadium.xaml
    /// </summary>
    public partial class AddStadium : Window
    {
        //Connection database
        FootballStadiumEntities1 db = new FootballStadiumEntities1();

        Stadium stadium;

        public Stadiums selecstad;
        public AddStadium(Stadium main)
        {
            InitializeComponent();
            fillStadiums();
            this.stadium=main;
        }

        private void fillStadiums()
        {
            foreach (Stadiums stadium in db.Stadiums.ToList())
            {
                cmbStadium.Items.Add(stadium);
            }
        }

        //Add stadium data to database when click addButton
        private void btnAddStadium_Click(object sender, RoutedEventArgs e)
        {
            cmbStadium.Items.Clear();
            Stadiums stadium = new Stadiums
            {
                Name = txtName.Text,
               
            };

            db.Stadiums.Add(stadium);
            db.SaveChanges();
            this.stadium.fillStadiums();
            txtName.Text = "";
            fillStadiums();
            
            
        }



        private void cmbStadium_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {
            Stadiums stadium = cmbStadium.SelectedItem as Stadiums;
            Stadiums stad = db.Stadiums.Find(stadium.Id);

            txtName.Text = stad.Name;
        }
    }
}
