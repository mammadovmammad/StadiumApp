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
    /// Interaction logic for Stadium.xaml
    /// </summary>
    public partial class AddContact : Window
    {
        //Connection database
        FootballStadiumEntities1 db = new FootballStadiumEntities1();
        Stadium stadium;
        public AddContact(Stadium sta)
        {
            stadium = sta;
            InitializeComponent();
            fillFullname();
        }
        
        // Full name for Combobox to list from database
        public void fillFullname()
        {
            foreach (Contacts contact in db.Contacts.ToList())
            {
                Fullname fullname = new Fullname
                {
                    Id = contact.Id,
                    All = contact.Name + " " + contact.Surname + " " + contact.Phone
                };

                cmbContact.Items.Add(fullname);
  
            }
        }

        // Add Contact to contact combobox 
        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(txtSurname.Text) || string.IsNullOrEmpty(txtPhone.Text))
            {
                MessageBox.Show("Sahələr boş buraxıla bilməz");
                return;
            }

            if (db.Contacts.FirstOrDefault(c=>c.Phone==txtPhone.Text)!=null)
            {
                MessageBox.Show("Bu nömrə ilə qeydiyyat mövcuddur!");
                return;
            }


            cmbContact.Items.Clear();
            Contacts contacts = new Contacts
            {
                Name = txtName.Text,
                Surname = txtSurname.Text,
                Phone = txtPhone.Text
            };

            
           
            db.Contacts.Add(contacts);
            db.SaveChanges();

            MessageBox.Show("İstifadəçi əlavə edildi!");
            
            txtName.Text = "";
            txtSurname.Text = "";
            txtPhone.Text = "";
            fillFullname();

        }

        // Fill selected contact to textbox
        private void cmbContact_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {
            
            Fullname fullname = cmbContact.SelectedItem as Fullname;
            Contacts contact = db.Contacts.Find(fullname.Id);
            if (contact != null)
            {
                txtName.Text = contact.Name;
                txtSurname.Text = contact.Surname;
                txtPhone.Text = contact.Phone;
            }
        }

        //Fill contact data to main Form when close Addcontact form
        private void Window_Closed(object sender, EventArgs e)
        {
            stadium.fillContacts();
        }
    }
}

