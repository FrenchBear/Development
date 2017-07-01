using System;
using System.Collections.ObjectModel;
using System.Windows.Media;
using System.ComponentModel;
using System.Diagnostics;

namespace DataGrid_FrozenRowSample
{
    public class People : ObservableCollection<Person>
    {
        private Random random = new Random();

        public People()
        {
            CreateGenericPersonData(1);
        }

        public People(int multiplier)
        {
            CreateGenericPersonData(multiplier);
        }

        private void CreateGenericPersonData(int multiplier)
        {
            if (multiplier > 0)
            {
                for (int i = 0; i < multiplier; i++)
                {
                    Add(new Person("George", "Washington", GenerateRandomDate()));
                    Add(new Person("John", "Adams", GenerateRandomDate()));
                    Add(new Person("Thomas", "Jefferson", GenerateRandomDate()));
                    Add(new Person("James", "Madison", GenerateRandomDate()));
                    Add(new Person("James", "Monroe", GenerateRandomDate()));
                    Add(new Person("John", "Quincy", "Adams", GenerateRandomDate()));
                    Add(new Person("Andrew", "Jackson", GenerateRandomDate()));
                    Add(new Person("Martin", "Van Buren", GenerateRandomDate()));
                    Add(new Person("William", "H.", "Harrison", GenerateRandomDate()));
                    Add(new Person("John", "Tyler", GenerateRandomDate()));
                    Add(new Person("James", "K.", "Polk", GenerateRandomDate()));
                    Add(new Person("Zachary", "Taylor", GenerateRandomDate()));
                    Add(new Person("Millard", "Fillmore", GenerateRandomDate()));
                    Add(new Person("Franklin", "Pierce", GenerateRandomDate()));
                    Add(new Person("James", "Buchanan", GenerateRandomDate()));
                    Add(new Person("Abraham", "Lincoln", GenerateRandomDate()));
                    Add(new Person("Andrew", "Johnson", GenerateRandomDate()));
                    Add(new Person("Ulysses", "S.", "Grant", GenerateRandomDate()));
                    Add(new Person("Rutherford", "B.", "Hayes", GenerateRandomDate()));
                    Add(new Person("James", "Garfield", GenerateRandomDate()));
                    Add(new Person("Chester", "A.", "Arthur", GenerateRandomDate()));
                    Add(new Person("Grover", "Cleveland", GenerateRandomDate()));
                    Add(new Person("Benjamin", "Harrison", GenerateRandomDate()));
                    Add(new Person("William", "McKinley", GenerateRandomDate()));
                    Add(new Person("Theodore", "Roosevelt", GenerateRandomDate()));
                    Add(new Person("William", "H.", "Taft", GenerateRandomDate()));
                    Add(new Person("Woodrow", "Wilson", GenerateRandomDate()));
                    Add(new Person("Warren", "G.", "Harding", GenerateRandomDate()));
                    Add(new Person("Calvin", "Coolidge", GenerateRandomDate()));
                    Add(new Person("Herbert", "Hoover", GenerateRandomDate()));
                    Add(new Person("Franklin", "D.", "Roosevelt", GenerateRandomDate()));
                    Add(new Person("Harry", "S.", "Truman", GenerateRandomDate()));
                    Add(new Person("Dwight", "D.", "Eisenhower", GenerateRandomDate()));
                    Add(new Person("John", "F.", "Kennedy", GenerateRandomDate()));
                    Add(new Person("Lyndon", "B.", "Johnson", GenerateRandomDate()));
                    Add(new Person("Richard", "Nixon", GenerateRandomDate()));
                    Add(new Person("Gerald", "Ford", GenerateRandomDate()));
                    Add(new Person("Jimmy", "Carter", GenerateRandomDate()));
                    Add(new Person("Ronald", "Reagan", GenerateRandomDate()));
                    Add(new Person("George", "Bush", GenerateRandomDate()));
                    Add(new Person("Bill", "Clinton", GenerateRandomDate()));
                    Add(new Person("George", "W.", "Bush", GenerateRandomDate()));
                }
            }
        }

        private DateTime GenerateRandomDate()
        {
            int randInt = random.Next();
            return new DateTime(Convert.ToInt64(randInt));
        }
    }

    public class Person : INotifyPropertyChanged, ICloneable, IEditableObject
    {
        #region Private Fields

        private Person copy;
        private static int globalId = 0;   // not thread-safe
        private int id;
        private string firstName;
        private string lastName;
        private string middleName;
        private bool likesCake;
        private string cake = String.Empty;
        private Uri homepage = null;
        private DateTime dob;
        private EyeColor eyeColor = EyeColor.Unknown;
        private string picture;

        #endregion Private Fields

        #region Constructors

        public Person()
            : this("Enter FirstName", "Enter LastName")
        {
        }

        public Person(string firstName, string lastName)
            : this(firstName, String.Empty, lastName)
        {
        }

        public Person(string firstName, string lastName, DateTime dob)
            : this(firstName, String.Empty, lastName, dob)
        {
        }

        public Person(string firstName, string middleName, string lastName)
            : this(firstName, middleName, lastName, new DateTime(2008, 10, 26))
        {
        }

        public Person(string firstName, string middleName, string lastName, DateTime dob)
        {
            FirstName = firstName;
            MiddleName = middleName;
            LastName = lastName;
            LikesCake = true; // Everyone likes cake
            Cake = "Chocolate"; // Hehe....
            DOB = dob;
            Id = globalId++;
            Picture = @"Assets\Autumn Leaves.jpg";

            string prefix = firstName.ToLower() + "." + lastName.ToLower();
            Homepage = new Uri("http://" + prefix.Replace(' ', '_') + ".whitehouse.gov/");
        }

        #endregion Constructors

        #region Public Properties

        public int Id
        {
            get { return id; }
            set
            {
                id = value;
                OnPropertyChanged("Id");
            }
        }

        public string FirstName
        {
            get { return firstName; }
            set
            {
                firstName = value;
                OnPropertyChanged("FirstName");
            }
        }

        public string MiddleName
        {
            get { return middleName; }
            set
            {
                middleName = value;
                OnPropertyChanged("MiddleName");
            }
        }

        public string LastName
        {
            get { return lastName; }
            set
            {
                lastName = value;
                OnPropertyChanged("LastName");
            }
        }

        public bool LikesCake
        {
            get { return likesCake; }
            set
            {
                likesCake = value;
                OnPropertyChanged("LikesCake");
            }
        }

        public string Cake
        {
            get { return cake; }
            set
            {
                cake = value;
                OnPropertyChanged("Cake");
            }
        }

        public Uri Homepage
        {
            get
            {
                return homepage;
            }
            set
            {
                homepage = value;
                OnPropertyChanged("Homepage");
            }
        }

        public DateTime DOB
        {
            get
            {
                return dob;
            }
            set
            {
                dob = value;
                OnPropertyChanged("DOB");
            }
        }

        public EyeColor MyEyeColor
        {
            get
            {
                return eyeColor;
            }
            set
            {
                eyeColor = value;
                OnPropertyChanged("MyEyeColor");
            }
        }

        public string Picture
        {
            get { return picture; }
            set
            {
                picture = value;
                OnPropertyChanged("Picture");
            }
        }

        #endregion Public Properties

        #region Public Members

        public enum EyeColor
        {
            Unknown,
            Blue,
            Green,
            Brown,
            Other
        };

        public override string ToString()
        {
            return FirstName + " " + LastName;
        }

        public void CopyFrom(Person person)
        {
            this.FirstName = person.FirstName;
            this.MiddleName = person.MiddleName;
            this.LastName = person.LastName;
            this.Id = person.Id;
            this.Cake = person.Cake;
            this.Homepage = new Uri(person.Homepage.OriginalString);
            this.LikesCake = person.LikesCake;
            this.DOB = person.DOB;
            this.MyEyeColor = person.MyEyeColor;
            this.Picture = person.Picture;
        }

        #endregion Public Members

        #region INotifyPropertyChanged

        public event PropertyChangedEventHandler PropertyChanged;

        private void OnPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }

        #endregion INotifyPropertyChanged

        #region ICloneable

        public object Clone()
        {
            Person person = (Person)this.MemberwiseClone();

            // need to manually copy Uri
            person.Homepage = new Uri(this.Homepage.OriginalString);

            return person;
        }

        #endregion ICloneable

        #region IEditableObject Members

        public void BeginEdit()
        {
            if (this.copy == null)
            {
                this.copy = new Person();
            }

            this.copy = (Person)Clone();
        }

        public void CancelEdit()
        {
            this.CopyFrom(this.copy);
        }

        public void EndEdit()
        {
            this.copy = null;
        }

        #endregion
    }        
}
