using System.Windows;
using Microsoft.Expression.Media.Effects;

namespace WpfWizard.Controls
{
    public abstract class TransitionSelector
    {
        public abstract TransitionEffect GetTransition(object oldContent, object newContent, DependencyObject container);
    }
}