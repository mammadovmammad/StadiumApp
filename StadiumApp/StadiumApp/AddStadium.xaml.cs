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
        public AddStadium()
        {
            InitializeComponent();
        }


        //Add stadium data to database when click addButton
        private void btnAddStadium_Click(object sender, RoutedEventArgs e)
        {
           
            Stadiums stadium = new Stadiums
            {
                Name = txtName.Text,
                Phone = txtPhone.Text
            };

            db.Stadiums.Add(stadium);
            db.SaveChanges();

            txtName.Text = "";
            txtPhone.Text = "";
        }
    }
}
