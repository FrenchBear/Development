using System;
using System.Windows;
using Microsoft.Expression.Media.Effects;
using WpfWizard.Controls;
using WpfWizard.Controls.TransitionSelectors;

namespace WpfWizard
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class Window1
    {
        public Window1()
        {
            InitializeComponent();

            // Attach simple presentation model
            DataContext = new Window1PresentationModel();
        }

        private void Wizard_OnFinishClick(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Wizard_OnCancelClick(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Wizard_NextClick(object sender, RoutedEventArgs e)
        {
            var wizard = (Wizard) sender;
            var selector = wizard.ContentTransitionSelector as WizardTransitionSelector;
            if (selector != null)
            {
                selector.SlideDirection = SlideDirection.RightToLeft;
            }
        }

        private void Wizard_PreviousClick(object sender, RoutedEventArgs e)
        {
            var wizard = (Wizard)sender;
            var selector = wizard.ContentTransitionSelector as WizardTransitionSelector;
            if (selector != null)
            {
                selector.SlideDirection = SlideDirection.LeftToRight;
            }
        }
    }
}
