using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.ComponentModel;
using System.Windows.Threading;

namespace SilverlightFocusedElement
{
    public class DebugFocusedElementProxy: FrameworkElement, INotifyPropertyChanged
    {
        private string _FocusedElementDescription;
        public string FocusedElementDescription
        {
            get { return _FocusedElementDescription; }
            set { _FocusedElementDescription = value; OnNotifyPropertyChanged("FocusedElementDescription"); }
        }

        public DebugFocusedElementProxy()
        {
            var timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromMilliseconds(100);
            timer.Tick += (o, ea) =>
            {
                var fe = FocusManager.GetFocusedElement();
                if (fe == null)
                    this.FocusedElementDescription = "None";
                else
                {
                    var element = fe as FrameworkElement;
                    if (string.IsNullOrEmpty(element.Name))
                        this.FocusedElementDescription = fe.GetType().Name;
                    else
                        this.FocusedElementDescription = element.Name;
                }
            };
            timer.Start();
        }

        #region INotifyPropertyChanged
        public event PropertyChangedEventHandler PropertyChanged;
        void OnNotifyPropertyChanged(string nomPropriete)
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(nomPropriete));
        }
        #endregion
    }
}
