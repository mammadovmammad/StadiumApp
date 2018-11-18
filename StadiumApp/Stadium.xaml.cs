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
        TimeSpan starttime = new TimeSpan(10, 0, 0);
        TimeSpan endtime = new TimeSpan(2, 0, 0);

        public Stadium()
        {
            InitializeComponent();
            fillSearchHours();
            fillSearchStadiums();
            dtpPlayTime.DisplayDateStart = DateTime.Today;
        }

        //Clear combobox text when click booking button
        private void ClearComponent()
        {
            cmbContacts.Text = "";
            cmbHours.Text = "";
            cmbStadiums.Text = "";
            dtpPlayTime.SelectedDate = DateTime.Now;
        }

        //Button,combobox and labels are hidden when click booking button
        private void HideComponents()
        {
            cmbStadiums.Visibility = Visibility.Hidden;
            cmbContacts.Visibility = Visibility.Hidden;
            btnAddContact.Visibility = Visibility.Hidden;
            BtnAddStadium.Visibility = Visibility.Hidden;
            btnBooking.Visibility = Visibility.Hidden;
            lblContact.Visibility = Visibility.Hidden;
            lblStadium.Visibility = Visibility.Hidden;
        }

        #region Fill

        //Fill contacts to checkbox to mainWindow from database
        public void fillContacts()
        {
            cmbContacts.Items.Clear();
            foreach (Contacts contacts in db.Contacts)
            {
                cmbContacts.Items.Add(contacts.Name + " " + contacts.Surname + " " + contacts.Phone);
            }
        }

        //Fill Avaible Play Hours to combobox from database
        private void FillHours()
        {
            TimeSpan StartTime = new TimeSpan(10, 0, 0);
            TimeSpan EndTime = new TimeSpan(2, 0, 0);
            int interval = (int)(EndTime.Subtract(StartTime).TotalHours + 24);

            for (int i = 0; i < interval; i++)
            {
                cmbHours.Items.Add(StartTime.ToString(@"hh\:mm"));
                StartTime = StartTime.Add(new TimeSpan(1, 0, 0));

                if (StartTime.Hours == 0)
                {
                    StartTime = new TimeSpan(0, 0, 0);
                }
            }
        }

        //Fill stadiums to stadium combobox from database
        public void fillStadiums()
        {
            cmbStadiums.Items.Clear();

            Stadiums stad = db.Stadiums.FirstOrDefault(s => s.Name == cmbStadiums.Text);
            DateTime date = dtpPlayTime.SelectedDate.Value;

            if (cmbHours.SelectedItem != null)
            {
                string hour = cmbHours.SelectedItem.ToString();
                TimeSpan time = TimeSpan.Parse(hour);

                foreach (Stadiums std in db.Stadiums.Where(s => s.Bookings.Where(b => b.Date == date && b.Time == time).Count() == 0).ToList())
                {
                    cmbStadiums.Items.Add(std.Name);
                }
            }

        }

        //Fill hours to search combobox 
        private void fillSearchHours()
        {
            TimeSpan StartTime = new TimeSpan(10, 0, 0);
            TimeSpan EndTime = new TimeSpan(2, 0, 0);
            int interval = (int)(EndTime.Subtract(StartTime).TotalHours + 24);

            for (int i = 0; i < interval; i++)
            {
                cmbSearchHour.Items.Add(StartTime.ToString(@"hh\:mm"));
                StartTime = StartTime.Add(new TimeSpan(1, 0, 0));

                if (StartTime.Hours == 0)
                {
                    StartTime = new TimeSpan(0, 0, 0);
                }
            }
        }

        //Fill rezerved stadiums to search combobox
        public void fillSearchStadiums()
        {
            cmbStadiums.Items.Clear();

            Stadiums all = new Stadiums
            {
                Id = 0,
                Name = "Hamısı"
            };

            cmbSearchStadium.Items.Add(all);
            cmbSearchStadium.SelectedValuePath = "0";

            foreach (Stadiums std in db.Stadiums.ToList())
            {
                cmbSearchStadium.Items.Add(std);
            }
        }
        
        #endregion

        #region Buttons

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

        //Add to database bookings 
        private void btnBooking_Click(object sender, RoutedEventArgs e)
        {

            TimeSpan time = new TimeSpan(Convert.ToInt32(cmbHours.Text.Split(':')[0]), 0, 0);
            string phone = cmbContacts.Text.Split(' ')[2];
            DateTime date = dtpPlayTime.SelectedDate.Value;
            decimal dec = 30;
            
            if (time.Hours < starttime.Hours)
            {
                date = date.AddDays(1);
            }


            Bookings booking = new Bookings
            {
                StadiumId = db.Stadiums.FirstOrDefault(s => s.Name == cmbStadiums.Text).Id,
                Date = date,
                Time = time,
                ContactId = db.Contacts.FirstOrDefault(c => c.Phone == phone).Id,
                Price = dec
            };

            MessageBox.Show("Qeydiyyat tamamlandı!");

            
            db.Bookings.Add(booking);
            db.SaveChanges();

            ClearComponent();
            HideComponents();
        }

        // Finding reserved games by stadium and time
        private void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            dgBooking.Items.Clear();

            int stadiumId = 0;

            if (!string.IsNullOrEmpty(cmbSearchStadium.Text) && cmbSearchStadium.Text != "Hamisi")
            {
                stadiumId = db.Stadiums.FirstOrDefault(s => s.Name == cmbSearchStadium.Text).Id;
            }
            
            string hour = cmbSearchHour.SelectedItem.ToString();
            TimeSpan time = TimeSpan.Parse(hour);

            List<Bookings> bookings = db.Bookings.Where(b => b.Date == dtpSearchDate.SelectedDate.Value && (stadiumId != 0 ? b.StadiumId == stadiumId : true) && (b.Time == time)).ToList();

            foreach (Bookings item in bookings.Where(b => b.Date == dtpSearchDate.SelectedDate.Value))
            {
                VwBooking booking = new VwBooking
                {
                    Id = item.Id,
                    Date = item.Date.Date.ToString("dd.MM.yyyy"),
                    Hour = item.Time.ToString(@"hh\:mm"),
                    Stadium = item.Stadiums.Name,
                    Contact = item.Contacts.Name + " " + item.Contacts.Surname
                };
                dgBooking.Items.Add(booking);
            }
        }

        //Show monthly price by selected date 
        private void btnMonthlyResult_Click_1(object sender, RoutedEventArgs e)
        {
            DateTime currentDate = dtpSearchDate.SelectedDate.Value;
            int price = 30;
            int isPlayed = 0;

            foreach (Bookings item in db.Bookings.ToList())
            {
                if (item.Date.Month == currentDate.Month && item.IsPlayed == true)
                {
                    isPlayed++;
                }
            }

            lblMonthlyPrice.Content = (price * isPlayed + " Azn").ToString();
        }
        #endregion

        #region Selected Change 

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

            if (cmbContacts.SelectedIndex == -1)
            {
                fillContacts();
                cmbStadiums.Visibility = Visibility.Visible;

                BtnAddStadium.Visibility = Visibility.Visible;

                lblStadium.Visibility = Visibility.Visible;
            }
        }

        //Show available contacts when select stadium from combobox
        private void cmbStadiums_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            cmbContacts.Visibility = Visibility.Visible;
            lblContact.Visibility = Visibility.Visible;
            btnAddContact.Visibility = Visibility.Visible;
        }

        //Show booking button when select stadium from combobox
        private void cmbContacts_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            btnBooking.Visibility = Visibility.Visible;
        }
        #endregion

    }
}
