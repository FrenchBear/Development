using System.Windows;
using Microsoft.Expression.Media.Effects;

namespace WpfWizard.Controls.TransitionSelectors
{
    public class WizardTransitionSelector : TransitionSelector
    {
        public WizardTransitionSelector()
        {
            SlideDirection = SlideDirection.LeftToRight;
        }

        public SlideDirection SlideDirection { get; set; }

        public override TransitionEffect GetTransition(object oldContent, object newContent, DependencyObject container)
        {
            return new SlideInTransitionEffect { SlideDirection = SlideDirection };
        }
    }
}