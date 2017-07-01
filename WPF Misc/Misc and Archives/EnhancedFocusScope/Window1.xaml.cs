/*
 * Created by SharpDevelop.
 * User: Daniel
 * Date: 26.07.2009
 * Time: 17:56
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Reflection;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;

namespace TestApp
{
	/// <summary>
	/// Interaction logic for Window1.xaml
	/// </summary>
	public partial class Window1 : Window
	{
		public Window1()
		{
			InitializeComponent();
		}
		
		void Box1_MouseDown(object sender, MouseButtonEventArgs e)
		{
			// How should we know what was last active in the group box?
			object keyboardNavigation = typeof(KeyboardNavigation).InvokeMember(
				"Current",
				BindingFlags.Static | BindingFlags.NonPublic | BindingFlags.GetProperty,
				null, null, null);
			object activeElement = typeof(KeyboardNavigation).InvokeMember(
				"GetActiveElement",
				BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.InvokeMethod,
				null,
				keyboardNavigation,
				new object[] { box1 });
			IInputElement focusedElement = activeElement as IInputElement;
			if (focusedElement != null) {
				Keyboard.Focus(focusedElement);
			} else {
				box1.MoveFocus(new TraversalRequest(FocusNavigationDirection.First));
			}
		}
		
		void Box2_MouseDown(object sender, MouseButtonEventArgs e)
		{
			IInputElement focusedElement = FocusManager.GetFocusedElement(box2);
			if (focusedElement != null) {
				Keyboard.Focus(focusedElement);
			} else {
				box2.MoveFocus(new TraversalRequest(FocusNavigationDirection.First));
			}
		}
		
		void Box3_MouseDown(object sender, MouseButtonEventArgs e)
		{
			EnhancedFocusScope.SetFocusOnActiveElementInScope(box3);
		}
	}
}