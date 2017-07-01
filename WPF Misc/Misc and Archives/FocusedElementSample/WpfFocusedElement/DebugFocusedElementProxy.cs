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

namespace WpfFocusedElement
{
    public class DebugFocusedElementProxy: FrameworkElement, INotifyPropertyChanged
    {
        private string _FocusedElementDescription;
        public string FocusedElementDescription
        {
            get
            {
                if (this.FocusedElement == null)
                    return "None";
                else
                {
                    if (!(this.FocusedElement is FrameworkElement) || string.IsNullOrEmpty(((FrameworkElement)this.FocusedElement).Name))
                        return this.FocusedElement.GetType().Name;
                    else
                        return ((FrameworkElement) this.FocusedElement).Name;
                }

            }
        }

        private UIElement _FocusedElement;
        public UIElement FocusedElement
        {
            get { return _FocusedElement; }
            set
            {
                _FocusedElement = value;
                OnNotifyPropertyChanged("FocusedElement");
                OnNotifyPropertyChanged("FocusedElementDescription");
            }
        }

        public DebugFocusedElementProxy()
        {
            var timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromMilliseconds(100);
            timer.Tick += (o, ea) =>
            {
                this.FocusedElement = Keyboard.FocusedElement as UIElement;
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
