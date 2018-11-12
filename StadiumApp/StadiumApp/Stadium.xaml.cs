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
using System.IO;
using StadiumApp.Models;

namespace StadiumApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>

    public partial class Stadium : Window
    {
        //Connection database 
        FootballStadiumEntities1 db = new FootballStadiumEntities1();
        public Stadium()
        {
            InitializeComponent();
            fillContacts();
            fillStadiums();
        }
        
        //Fill contacts to checkbox to mainWindow from database
        private void fillContacts()
        {
            foreach (Contacts contacts in db.Contacts)
            {
                cmbContacts.Items.Add(contacts.Name+" "+contacts.Surname+" "+ contacts.Phone);
            }
        }

        //Show AddContactForm 
        private void btnAddContact_Click(object sender, RoutedEventArgs e)
        {
            AddContact addContact = new AddContact();
            addContact.ShowDialog();
        }

        //Fill stadiums to stadium checkbox from database
        private void fillStadiums()
        {
            foreach(Stadiums std in db.Stadiums.ToList())
            {
                cmbStadiums.Items.Add(std.Name + " " + std.Phone);
            }
        }
    }
}
