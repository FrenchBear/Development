using System;
using System.ComponentModel;
using System.Windows;
using System.Windows.Input;
using System.Windows.Threading;

namespace WpfFocusedElement
{
    public class DebugFocusedElementProxy : FrameworkElement, INotifyPropertyChanged
    {
        //private readonly string _FocusedElementDescription;

        public string FocusedElementDescription
        {
            get
            {
                if (this.FocusedElement == null)
                    return "None";
                else
                {
                    if (!(FocusedElement is FrameworkElement) || string.IsNullOrEmpty(((FrameworkElement)this.FocusedElement).Name))
                        return this.FocusedElement.GetType().Name;
                    else
                        return ((FrameworkElement)this.FocusedElement).Name;
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
            var timer = new DispatcherTimer { Interval = TimeSpan.FromMilliseconds(100) };
            timer.Tick += (o, ea) =>
                FocusedElement = Keyboard.FocusedElement as UIElement;
            timer.Start();
        }

        #region INotifyPropertyChanged

        public event PropertyChangedEventHandler PropertyChanged;

        private void OnNotifyPropertyChanged(string nomPropriete)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nomPropriete));
        }

        #endregion INotifyPropertyChanged
    }
}