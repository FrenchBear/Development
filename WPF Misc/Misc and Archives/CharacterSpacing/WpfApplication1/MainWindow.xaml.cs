using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Windows.Media.Animation;

namespace WpfApplication1
{
	/// <summary>
	/// Interaction logic for MainWindow.xaml
	/// </summary>
	public partial class MainWindow : Window
	{
		public MainWindow()
		{
			InitializeComponent();
		}
	}


	class TextBlock2 : TextBlock
	{
		/// <summary>
		/// Defines charachter/letter spacing
		/// </summary>
		public int Tracking
		{
			get { return (int)GetValue(TrackingProperty); }
			set { SetValue(TrackingProperty, value); }
		}

		public static readonly DependencyProperty TrackingProperty =
		  DependencyProperty.Register("Tracking", typeof(int), typeof(TextBlock2),
		  new FrameworkPropertyMetadata(0, FrameworkPropertyMetadataOptions.AffectsRender, new PropertyChangedCallback(TrackingPropertyChanged)));

		static void TrackingPropertyChanged(DependencyObject o, DependencyPropertyChangedEventArgs e)
		{
			TextBlock2 tb = o as TextBlock2;

			if (tb == null
			  || String.IsNullOrEmpty(tb.Text))
				return;

			tb._Tracking.X = (int)e.NewValue;
			tb._TrackingAlignment.X = -(int)e.NewValue * tb.Text.Length;

			if (tb._LastTrackingTextLength == tb.Text.Length)
				return; // Avoid re-creating effects when you don't have to..

			// Remove unused effects (string has shortened)
			while (tb._TrackingEffects.Count > tb.Text.Length)
			{
				tb.TextEffects.Remove(tb._TrackingEffects[tb._TrackingEffects.Count - 1]);
				tb._TrackingEffects.RemoveAt(tb._TrackingEffects.Count - 1);
			}

			tb._LastTrackingTextLength = tb.Text.Length;

			// Add missing effects (string has grown)
			for (int i = tb._TrackingEffects.Count; i < tb.Text.Length; i++)
			{
				TextEffect fx = new TextEffect()
				{
					PositionCount = i,
					Transform = tb._Tracking
				};
				tb._TrackingEffects.Add(fx);
				tb.TextEffects.Add(fx);
			}

			// Ugly hack to fix overall alignment
			tb.RenderTransform = tb._TrackingAlignment;

		}

		TranslateTransform _Tracking = new TranslateTransform();
		TranslateTransform _TrackingAlignment = new TranslateTransform();
		List<TextEffect> _TrackingEffects = new List<TextEffect>();
		int _LastTrackingTextLength;

	}


	public class MyTextBox : UIElement
	{
		protected override void OnRender(DrawingContext drawingContext)
		{
			const string sampleText = "Sample String";
			const int sampleEmSize = 30;

			GlyphTypeface typeFace = new GlyphTypeface(new Uri("file:///C:/WINDOWS/FONTS/segoeui.ttf"));

			GeometryGroup group = new GeometryGroup();
			group.FillRule = FillRule.Nonzero;

			double x = 0;
			double y = sampleEmSize;
			for (int i = 0; i < sampleText.Length; i++)
			{
				ushort glyphIndex = typeFace.CharacterToGlyphMap[sampleText[i]];
				Geometry glyphGeometry = typeFace.GetGlyphOutline(glyphIndex, sampleEmSize, sampleEmSize).Clone();
				TransformGroup glyphTransform = new TransformGroup();

				if (sampleText[i] == 'm') // this is a sample, we just change the 'm' characte
				{
					const double factor = 2;
					glyphTransform.Children.Add(new ScaleTransform(factor, 1));
					glyphTransform.Children.Add(new TranslateTransform(x, y));
					x += factor * typeFace.AdvanceWidths[glyphIndex] * sampleEmSize;
				}
				else
				{
					glyphTransform.Children.Add(new TranslateTransform(x, y));
					x += typeFace.AdvanceWidths[glyphIndex] * sampleEmSize;
				}

				glyphGeometry.Transform = glyphTransform;
				group.Children.Add(glyphGeometry);
			}

			drawingContext.DrawGeometry(Brushes.Black, null, group);
		}
	}
}