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
        }
        
        //Fill contacts to checkbox to mainWindow from database
        public void fillContacts()
        {
            cmbContacts.Items.Clear();
            foreach (Contacts contacts in db.Contacts)
            {
                cmbContacts.Items.Add(contacts.Name+" "+contacts.Surname+" "+ contacts.Phone);
            }
        }

        //Show AddContactForm 
        private void btnAddContact_Click(object sender, RoutedEventArgs e)
        {
            AddContact addContact = new AddContact(this);
            addContact.ShowDialog();
        }

        //Show AddStadiumForm
        private void BtnAddStadium_Click(object sender, RoutedEventArgs e)
        {
            AddStadium addStadium = new AddStadium(this);
            addStadium.ShowDialog();
        }
        
        //Fill Avaible Play Hours to combobox from database
        private void FillHours()
        {
            //cmbHours.Items.Clear();
            //cmbHours.Text = "";
            //cmbContacts.Items.Clear();

            //cmbContacts.Visibility = Visibility.Hidden;
            //cmbStadiums.Visibility = Visibility.Hidden;

            TimeSpan StartTime = new TimeSpan(10, 0, 0);
            TimeSpan EndTime = new TimeSpan(2, 0, 0);
            int interval = (int)(EndTime.Subtract(StartTime).TotalHours + 24);
            
            for (int i = 0; i < interval; i++)
            {

                //int count = db.Bookings.Where(b => b.Date == date.Date && b.Time == StartTime).Count();
                //if (count == 0)
                //{

                //   cmbHours.Items.Add(StartTime.ToString(@"hh\:mm"));

                //}

                cmbHours.Items.Add(StartTime.ToString(@"hh\:mm"));
                StartTime = StartTime.Add(new TimeSpan(1, 0, 0));

                if (StartTime.Hours == 0)
                {
                    StartTime = new TimeSpan(0, 0, 0);
                }
            }
    }

        //Fill stadiums to stadium checkbox from database
        public void fillStadiums()
        {
            cmbStadiums.Items.Clear();

            Stadiums stad = db.Stadiums.FirstOrDefault(s => s.Name == cmbStadiums.Text);
            DateTime date = dtpPlayTime.SelectedDate.Value;

            if (cmbHours.SelectedItem!=null)
            {
                string hour = cmbHours.SelectedItem.ToString();
                TimeSpan time = TimeSpan.Parse(hour);

                foreach (Stadiums std in db.Stadiums.Where(s => s.Bookings.Where(b => b.Date == date && b.Time == time).Count() == 0).ToList())
                {
                    cmbStadiums.Items.Add(std.Name);
                }
            }
            
        }

        //Show available hours when select date from DatePicker
        private void dtpPlayTime_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            cmbHours.Items.Clear();
            FillHours();
            
        }

        //Show available stadiums when select hour from combobox
        private void cmbHours_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            fillStadiums();
            
             if(cmbContacts.SelectedIndex==-1)
            {
                fillContacts();
                cmbStadiums.Visibility = Visibility.Visible;
                cmbContacts.Visibility = Visibility.Visible;
                btnAddContact.Visibility = Visibility.Visible;
                BtnAddStadium.Visibility = Visibility.Visible;
                lblContact.Visibility = Visibility.Visible;
                lblStadium.Visibility = Visibility.Visible;
            }
        }

        private void btnBooking_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
