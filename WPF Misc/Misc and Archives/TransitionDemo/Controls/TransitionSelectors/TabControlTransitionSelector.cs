using System;
using System.Windows;
using Microsoft.Expression.Media.Effects;

namespace WpfWizard.Controls.TransitionSelectors
{
    public class TabControlTransitionSelector : TransitionSelector
    {
        private readonly Random _random = new Random();

        private readonly TransitionEffect[] _transitions = new TransitionEffect[]
                                                               {
                                                                   new SmoothSwirlGridTransitionEffect(),
                                                                   new BlindsTransitionEffect(),
                                                                   new CircleRevealTransitionEffect(),
                                                                   new CloudRevealTransitionEffect(),
                                                                   new FadeTransitionEffect(),
                                                                   new PixelateTransitionEffect(),
                                                                   new RadialBlurTransitionEffect(),
                                                                   new RippleTransitionEffect(),
                                                                   new WaveTransitionEffect(),
                                                                   new WipeTransitionEffect(),
                                                                   new SlideInTransitionEffect { SlideDirection = SlideDirection.TopToBottom }
                                                               };
        public override TransitionEffect GetTransition(object oldContent, object newContent, DependencyObject container)
        {
            var index = _random.NextDouble() * _transitions.Length;
            return _transitions[(int) index];
        }
    }
}