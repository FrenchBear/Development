using System;
using System.Drawing;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Windows.Forms;

	/// <summary>
	/// A class which can be attached to a combo box to make
	/// it render in a flat-style, like the combo boxes in
	/// Office and VS.NET
	/// </summary>
	public class FlatControl : NativeWindow
	{
		#region Unmanaged Code
		[StructLayout(LayoutKind.Sequential)]
			private struct RECT
		{
			public int left;
			public int top;
			public int right;
			public int bottom;
		}

		[DllImport("user32")]
		private static extern int GetWindowRect(
			IntPtr hWnd, 
			ref RECT lpRect);
		[DllImport("user32")]
		private static extern int GetClientRect(
			IntPtr hWnd, 
			ref RECT lpRect);
		
		[DllImport("user32")]
		private static extern IntPtr GetDC(
			IntPtr hWnd);
		[DllImport("user32")]
		private static extern int ReleaseDC(
			IntPtr hWnd, 
			IntPtr hdc);

		[DllImport("user32")]
		private extern static IntPtr GetFocus();

		[DllImport("user32", CharSet=CharSet.Auto)]
		private extern static int SendMessage(
			IntPtr hWnd, 
			int wMsg, 
			IntPtr wParam, 
			IntPtr lParam);

		[DllImport("user32")]
		private static extern int IsWindowEnabled(
			IntPtr hWnd);

		[DllImport("user32", CharSet=CharSet.Auto)]
		private static extern int GetWindowLong (
			IntPtr hWnd, 
			int nIndex);

		[DllImport("user32", CharSet=CharSet.Unicode)]
		private static extern int SetWindowTheme (
			IntPtr hWnd, 
			[MarshalAs(UnmanagedType.LPWStr)]
			String pszSubAppName, 
			[MarshalAs(UnmanagedType.LPWStr)]
			String pszSubIdList);

		private const int WM_COMMAND = 0x111;
		private const int WM_PAINT = 0xF;
		private const int WM_SETFOCUS = 0x7;
		private const int WM_KILLFOCUS = 0x8;
		private const int WM_MOUSEACTIVATE = 0x21;
		private const int WM_MOUSEMOVE = 0x200;

		private const int CBN_DROPDOWN = 7;
		private const int CBN_CLOSEUP = 8;
		private const int CB_GETDROPPEDSTATE = 0x157;

		private const int GWL_EXSTYLE = (-20);
		private const int WS_EX_RIGHT = 0x1000;
		private const int WS_EX_LEFTSCROLLBAR = 0x4000;

		#endregion

		#region Enumerations
		/// <summary>
		/// Specifies the Flat Styles that the control can be drawn
		/// with.
		/// </summary>
		public enum FlatControlStyle : int
		{
			/// <summary>
			/// Draw in the Office 9 style.
			/// </summary>
			FlatStyleOffice9,
			/// <summary>
			/// Draw in the Office XP style.
			/// </summary>
			FlatStyleOffice10,
			/// <summary>
			/// Draw in the Office 2003 style (not implemented yet).
			/// </summary>
			FlatStyleOffice11
		}

		private enum DrawStyle : int
		{
			FC_DRAWNORMAL,
			FC_DRAWRAISED,
			FC_DRAWPRESSED
		}
		#endregion

		#region Member Variables
		/// <summary>
		/// An object which subclasses the text box within the 
		/// combo box.
		/// </summary>
		private FlatComboTextBox flatComboTextBox = null;
		private FlatComboParent flatComboParent = null;
		private Timer mouseOverTimer = null;
		private bool mouseOver = false;
		private FlatControlStyle style = FlatControlStyle.FlatStyleOffice10;
		private bool active = true;
		#endregion

		#region Events
		/// <summary>
		/// Raised when the combo portion of the control closes up.
		/// </summary>
		public event EventHandler CloseUp;
		#endregion
		
		/// <summary>
		/// Gets/sets the style used to render the borders of the flat control.
		/// </summary>
		public FlatControlStyle Style
		{
			get
			{
				return this.style;
			}
			set
			{
				this.style = value;
			}
		}

		/// <summary>
		/// Gets/sets whether this class is Active in converting the control's
		/// border.
		/// </summary>
		public bool Active
		{
			get
			{
				return this.active;
			}
			set
			{
				this.active = value;
			}
		}

		/// <summary>
		/// Attaches this class to a Combo Box.
		/// </summary>
		/// <param name="comboBox">The Combo Box to attach to and make
		/// flat.</param>
		public void Attach(System.Windows.Forms.Control comboBox)
		{
			IntPtr comboHandle = comboBox.Handle;
			if (!comboHandle.Equals(this.Handle))
			{
				this.AssignHandle(comboHandle);
				RemoveTheme(this.Handle);			
				flatComboTextBox = new FlatComboTextBox();
				flatComboTextBox.Attach(comboBox, this);
				flatComboParent = new FlatComboParent();
				flatComboParent.Attach(comboBox, this);
				this.mouseOverTimer = new Timer();
				mouseOverTimer.Enabled = false;
				mouseOverTimer.Interval = 10;
				mouseOverTimer.Tick += new System.EventHandler(mouseOverTimer_Tick);
			}
		}		

		/// <summary>
		/// Calls the base WndProc for the control and
		/// responds to events allowing the control to be
		/// drawn with a flat style.
		/// </summary>
		/// <param name="m">WndProc Message.</param>
		protected override void WndProc(ref Message m)
		{
			// Call the base Window Procedure:
			base.WndProc(ref m);

			// Process messages we need to overpaint
			// for:
			switch (m.Msg)
			{
				case WM_PAINT:
					OnPaint();
					break;
				case WM_SETFOCUS:
					OnSetFocus();
					break;
				case WM_KILLFOCUS:
					OnKillFocus();
					break;
				case WM_MOUSEMOVE:
					OnMouseMove();
					break;
			}
		}

		/// <summary>
		/// Called by the FlatComboTextBox class when focus or mouse
		/// move events occur in the internal text box of the combo
		/// box.
		/// </summary>
		/// <param name="msg">Windows message code.</param>
		protected void TextBoxNotify(int msg)
		{
			switch (msg)
			{
				case WM_SETFOCUS:
					OnSetFocus();
					break;
				case WM_KILLFOCUS:
					OnKillFocus();
					break;
				case WM_MOUSEMOVE:
					OnMouseMove();
					break;
				default:
					Debug.Assert(false, "Incorrect message passed from TextBox: " + msg);
					break;		
			}
		}

		/// <summary>
		/// Called by the FlatComboParent class when the combo box 
		/// is closed up.
		/// </summary>
		protected void ParentNotify()
		{
			if (this.CloseUp != null)
			{
				this.CloseUp(this, new EventArgs());
			}
			OnPaint();
		}
				
		private void OnSetFocus()
		{
			OnPaint(true, false);
			OnTimer(false);
		}

		private void OnKillFocus()
		{
			OnPaint(false, false);
		}

		private void OnMouseMove()
		{
			if (!this.mouseOver)
			{
				bool down = DroppedDown();
				IntPtr focusHandle = GetFocus();
				bool focus = (this.Handle == focusHandle || 
					this.flatComboTextBox.Handle == focusHandle || 
					down);
				if (!focus)
				{
					OnPaint(true, false);
					this.mouseOver = true;
					mouseOverTimer.Enabled = true;
				}
			}
		}

		private void OnPaint()
		{
			if (active)
			{
				bool down = DroppedDown();
				IntPtr focusHandle = GetFocus();
				bool focus = (this.Handle == focusHandle || 
					this.flatComboTextBox.Handle == focusHandle || 
					down);
				OnPaint(focus, down);
				if (focus)
				{
					OnTimer(false);
				}
			}
		}

		private void OnPaint(
			bool focus, bool down
			)
		{
			if (active)
			{
				if (focus)
				{
					Color clrTopLeft;
					Color clrBottomRight;
					if (this.style == FlatControlStyle.FlatStyleOffice9)
					{
						clrTopLeft = Color.FromKnownColor(KnownColor.ControlDark);
						clrBottomRight = Color.FromKnownColor(KnownColor.ControlLight);
					}
					else
					{
						clrTopLeft = Color.FromKnownColor(KnownColor.Highlight);
						clrBottomRight = Color.FromKnownColor(KnownColor.Highlight);
					}
					if (down)
					{
						Draw(DrawStyle.FC_DRAWPRESSED, clrTopLeft, clrBottomRight);
					}
					else
					{
						Draw(DrawStyle.FC_DRAWRAISED, clrTopLeft, clrBottomRight);
					}
				}
				else
				{
					if (this.style == FlatControlStyle.FlatStyleOffice9)
					{
						Draw(DrawStyle.FC_DRAWNORMAL, 
							Color.FromKnownColor(KnownColor.Control), 
							Color.FromKnownColor(KnownColor.Control));
					}
					else
					{
						Draw(DrawStyle.FC_DRAWNORMAL, 
							Color.FromKnownColor(KnownColor.Window), 
							Color.FromKnownColor(KnownColor.Window));
					}
				}
			}
		}

		private void Draw(
			DrawStyle drawStyle,
			Color clrTopLeft,
			Color clrBottomRight
			)
		{
			RECT rcClient = new RECT();
			Rectangle rcItem;
			Rectangle rcWork;
			Rectangle rcButton;
			IntPtr hDC = IntPtr.Zero;
			IntPtr focusHandle = IntPtr.Zero;
			
			bool enabled = (IsWindowEnabled(this.Handle) != 0);
			bool rightToLeft = (IsRightToLeft(this.Handle));
   
			GetClientRect(this.Handle, ref rcClient);
			rcItem = new Rectangle(rcClient.left, rcClient.top,
				rcClient.right - rcClient.left, rcClient.bottom - rcClient.top);
			hDC = GetDC(this.Handle);
			Graphics gfx = Graphics.FromHdc(hDC);
   
			if (!enabled)
			{
				if (this.style == FlatControlStyle.FlatStyleOffice9)
				{
					Draw3DRect(gfx, rcItem, 
						Color.FromKnownColor(KnownColor.Control), Color.FromKnownColor(KnownColor.Control));
				}
				else
				{
					Draw3DRect(gfx, rcItem, 
						Color.FromKnownColor(KnownColor.ControlDark), Color.FromKnownColor(KnownColor.ControlDark));
				}
				rcItem.Inflate(-1, -1);
      
				if (this.style == FlatControlStyle.FlatStyleOffice9)
				{
					Draw3DRect(gfx, rcItem, 
						Color.FromKnownColor(KnownColor.ControlLight), Color.FromKnownColor(KnownColor.ControlLight));
				}
				else
				{
					Draw3DRect(gfx, rcItem, 
						Color.FromKnownColor(KnownColor.Control), Color.FromKnownColor(KnownColor.Control));
				}
			}
			else
			{
				Draw3DRect(gfx, rcItem, clrTopLeft, clrBottomRight);
				rcItem.Inflate(-1, -1);
      
				if (this.style == FlatControlStyle.FlatStyleOffice9)
				{
					Draw3DRect(gfx, rcItem, 
						Color.FromKnownColor(KnownColor.Control), Color.FromKnownColor(KnownColor.Control));
				}
				else
				{
					Draw3DRect(gfx, rcItem, 
						Color.FromKnownColor(KnownColor.Window), Color.FromKnownColor(KnownColor.Window));
				}
			}
		

			if (this.style == FlatControlStyle.FlatStyleOffice9)
			{
				// Cover up dark 3D shadow on drop arrow.
				rcButton = new Rectangle(rcItem.Location, rcItem.Size);
				rcButton.Inflate(-1, -1);
				if (!rightToLeft)
				{
					rcButton.X = rcButton.X + rcButton.Width - SystemInformation.VerticalScrollBarWidth;
				}
				rcButton.Width = SystemInformation.VerticalScrollBarWidth;
				Draw3DRect(gfx, rcButton, 
					Color.FromKnownColor(KnownColor.Control), Color.FromKnownColor(KnownColor.Control));      
				
				// Cover up normal 3D shadow on drop arrow.
				rcButton.Inflate(-1, -1);
				Draw3DRect(gfx, rcButton, 
					Color.FromKnownColor(KnownColor.Control), Color.FromKnownColor(KnownColor.Control));

      
				if (enabled)
				{
					switch (drawStyle)
					{
						case DrawStyle.FC_DRAWNORMAL:
							rcButton.Y -= 1;
							rcButton.Height += 1;
							Draw3DRect(gfx, rcButton, 
								Color.FromKnownColor(KnownColor.ControlLight), Color.FromKnownColor(KnownColor.ControlLight));
							rcButton.X -= 1;
							rcButton.Height = 0;
							Draw3DRect(gfx, rcButton, 
								Color.FromKnownColor(KnownColor.Window), Color.Black);     
							break;

						case DrawStyle.FC_DRAWRAISED:
							rcButton.Y -= 1;
							rcButton.Height += 1;
							rcButton.Width += 1;
							Draw3DRect(gfx, rcButton, 
								Color.FromKnownColor(KnownColor.ControlLight), Color.FromKnownColor(KnownColor.ControlDark));
							break;

						case DrawStyle.FC_DRAWPRESSED:
							rcButton.X -= 1;
							rcButton.Y -= 2;
							rcButton.Offset(1, 1);
							Draw3DRect(gfx, rcButton, 
								Color.FromKnownColor(KnownColor.ControlDark), Color.FromKnownColor(KnownColor.ControlLight));
							break;
					}
				}
			}
			else
			{
				if (!enabled)
				{
					rcButton = new Rectangle(rcItem.Location, rcItem.Size);
					if (rightToLeft)
					{
						rcButton.Width = SystemInformation.VerticalScrollBarWidth + 3;
					}
					else
					{
						rcButton.X = rcButton.X + rcButton.Width - 1 -  SystemInformation.VerticalScrollBarWidth;
						rcButton.Width = SystemInformation.VerticalScrollBarWidth;
					}
					gfx.FillRectangle(
						SystemBrushes.Control, rcButton);
            
					DrawComboDropDownGlyph(gfx, rcButton, Color.FromKnownColor(KnownColor.ControlDark));
				}
				else
				{
					rcButton = new Rectangle(rcItem.Location, rcItem.Size);
					if (!rightToLeft)
					{
						rcButton.X = rcButton.X + rcButton.Width -  SystemInformation.VerticalScrollBarWidth;
					}
					rcButton.Width = SystemInformation.VerticalScrollBarWidth;

					Color brushColor;
					if ((drawStyle == DrawStyle.FC_DRAWNORMAL) && (!clrTopLeft.Equals(Color.FromKnownColor(KnownColor.ControlDark))))
					{
						brushColor = Color.FromKnownColor(KnownColor.Control);
					}
					else if (drawStyle == DrawStyle.FC_DRAWPRESSED)
					{
						brushColor = VSNetPressedColor();
					}
					else
					{
						brushColor = VSNetSelectionColor();
					}

					Brush br = new SolidBrush(brushColor);
					gfx.FillRectangle(br, rcButton);
					br.Dispose();

					rcWork = new Rectangle(rcButton.Location, rcButton.Size);
					if (rightToLeft)
					{
						rcWork.X = rcWork.X + rcWork.Width;
					}
					else
					{
						rcWork.X = rcButton.X;
					}
					rcWork.Width = 0;

					if ((drawStyle == DrawStyle.FC_DRAWNORMAL) && (!clrTopLeft.Equals(Color.FromKnownColor(KnownColor.ControlLight))))
					{
						Draw3DRect(gfx, rcWork, 
							Color.FromKnownColor(KnownColor.Window), Color.FromKnownColor(KnownColor.Window));
					}
					else
					{
						Draw3DRect(gfx, rcWork, 
							Color.FromKnownColor(KnownColor.Highlight), Color.FromKnownColor(KnownColor.Highlight));
					}

					if (rightToLeft)
					{
						rcWork.X += 1;
					}
					else
					{
						rcWork.X -=1;
					}
					Draw3DRect(gfx, rcWork, 
						Color.FromKnownColor(KnownColor.Window), Color.FromKnownColor(KnownColor.Window));

					DrawComboDropDownGlyph(gfx, rcButton, Color.FromKnownColor(KnownColor.WindowText));

				}
      
			}
			gfx.Dispose();
			ReleaseDC(this.Handle, hDC);
		}

		private void Draw3DRect(
			Graphics gfx,
			Rectangle rcItem, 
			Color topLeftColor,
			Color bottomRightColor
			)
		{
			Pen pen = new Pen(topLeftColor, 1);
			gfx.DrawLine(pen, rcItem.X, rcItem.Y + rcItem.Height - 1, 
				rcItem.X, rcItem.Y);
			gfx.DrawLine(pen, rcItem.X, rcItem.Y,
				rcItem.X + rcItem.Width - 1, rcItem.Y);
			pen.Dispose();

			if (rcItem.Width != 0)
			{
				pen = new Pen(bottomRightColor, 1);
				gfx.DrawLine(pen, rcItem.X + rcItem.Width - 1, rcItem.Y,
					rcItem.X + rcItem.Width - 1, rcItem.Top + rcItem.Height - 1);
				gfx.DrawLine(pen, rcItem.X + rcItem.Width - 1, rcItem.Top + rcItem.Height - 1,
					rcItem.X, rcItem.Top + rcItem.Height - 1);
				pen.Dispose();
			}     
		}

		private void DrawComboDropDownGlyph(
			Graphics gfx,
			Rectangle rcButton,
			Color color
			)
		{
			int xC = rcButton.X + (rcButton.Width / 2) + 1;
			int yC = rcButton.Y + (rcButton.Height / 2) + 1;

			Pen pen = new Pen(color, 1);

			gfx.DrawLine(pen, xC - 2, yC - 1, xC + 2, yC - 1);
			gfx.DrawLine(pen, xC - 1, yC, xC + 1, yC);
			gfx.DrawLine(pen, xC, yC - 1, xC, yC + 1);

			pen.Dispose();

		}

		private void OnTimer(bool checkMouse )
		{
			if (active)
			{
				bool over = false;
	   
				if (checkMouse)
				{
					over = true;
					Point pt = Cursor.Position;
					RECT rcItem = new RECT();
					GetWindowRect(this.Handle, ref rcItem);
					if ((pt.X < rcItem.left) || (pt.X > rcItem.right))
					{
						over = false;
					}
					else
					{
						if ((pt.Y < rcItem.top) || (pt.Y > rcItem.bottom))
						{
							over = false;
						}
					}
				}
	   
				if (!over)
				{
					mouseOverTimer.Enabled = false;
					this.mouseOver = false;
				}
			}
		}

		private void mouseOverTimer_Tick(object sender, EventArgs e)
		{
			OnTimer(true);
			if (!this.mouseOver)
			{
				OnPaint(false, false);
			}
		}

		private bool DroppedDown()
		{
			bool ret = false;
			ret = (SendMessage(
				this.Handle, CB_GETDROPPEDSTATE, IntPtr.Zero, IntPtr.Zero) != 0);
			return ret;
		}

		/// <summary>
		/// Constructs a new instance of this class
		/// </summary>
		public FlatControl() : base()
		{
		}

		#region FlatComboParent class
		/// <summary>
		/// Internal class to perform subclassing on a
		/// Combo Box's parent.  This is used to detect
		/// drop-down events.
		/// </summary>
		private class FlatComboParent : NativeWindow
		{
			#region Unmanged Code
			[DllImport("user32")]
			private static extern IntPtr GetParent (
				IntPtr hWnd);
			#endregion

			#region Member Variables
			private FlatControl owner = null;
			private IntPtr parentHandle = IntPtr.Zero;
			#endregion

			/// <summary>
			/// Attaches this class to a Combo Box.
			/// </summary>
			/// <param name="comboBox">The Combo Box to attach to and make
			/// flat.</param>
			/// <param name="owner">The <c>FlatControl</c> class which will own 
			/// this instance</param>
			public void Attach(
				System.Windows.Forms.Control comboBox,
				FlatControl owner
				)
			{
				this.owner = owner;
				IntPtr handle = comboBox.Handle;
				this.parentHandle = GetParent(handle);
				this.AssignHandle(this.parentHandle);
			}

			protected override void WndProc(ref Message m)
			{
				if (m.Msg == WM_COMMAND)
				{
					if (m.LParam.Equals(owner.Handle))
					{
						int notifyType = ((int) m.WParam)/ 0x10000;
						if (notifyType == CBN_CLOSEUP)
						{
							owner.ParentNotify();
						}
					}
				}
				base.WndProc(ref m);
			}

		}
		#endregion

		#region FlatComboTextBox class
		/// <summary>
		/// Internal class to perform subclassing on the text
		/// box within the Combo Box.
		/// </summary>
		private class FlatComboTextBox : NativeWindow
		{
			#region Unmanged Code
			[DllImport("user32")]
			private static extern IntPtr GetWindow (
				IntPtr hWnd, 
				int wCmd);
			private const int GW_CHILD = 5;
			#endregion

			#region Member Variables
			private IntPtr textBoxHandle = IntPtr.Zero;
			private FlatControl owner = null;
			#endregion

			/// <summary>
			/// Attaches this class to a Combo Box.
			/// </summary>
			/// <param name="comboBox">The Combo Box to attach to and make
			/// flat.</param>
			/// <param name="owner">The owning <c>FlatControl</c> class for
			/// this class</param>
			public void Attach(
				System.Windows.Forms.Control comboBox,
				FlatControl owner
				)
			{
				this.owner = owner;
				IntPtr handle = comboBox.Handle;
				this.textBoxHandle = GetWindow(handle, GW_CHILD);
				if (this.textBoxHandle != IntPtr.Zero)
				{
					this.AssignHandle(this.textBoxHandle);
				}
			}
		
			protected override void WndProc(ref Message m)
			{			
				base.WndProc(ref m);
				switch (m.Msg)
				{
					case WM_SETFOCUS:
						owner.TextBoxNotify(WM_SETFOCUS);
						break;
					case WM_KILLFOCUS:
						owner.TextBoxNotify(WM_KILLFOCUS);
						break;
					case WM_MOUSEMOVE:
						owner.TextBoxNotify(WM_MOUSEMOVE);
						break;
				}			
			}
			
			/// <summary>
			/// Constructs a new instance of this class
			/// </summary>
			public FlatComboTextBox()
			{
				// intentionally blank
			}
		}
		#endregion


		#region Utility Methods
		private void RemoveTheme(
			IntPtr handle)
		{
			bool isXp = false;
			if (System.Environment.Version.Major > 5)
			{
				isXp = true;
			}
			else if ((System.Environment.Version.Major == 5) && (System.Environment.Version.Minor >= 1))
			{
				isXp = true;
			}
			if (isXp)
			{
				SetWindowTheme(handle, " ", " ");
			}
		}
		private bool IsRightToLeft(
			IntPtr handle)
		{
			int style = 0;
			bool ret = false;
			style = GetWindowLong(handle, GWL_EXSTYLE);
			ret = (((style & WS_EX_RIGHT) == WS_EX_RIGHT) ||
				((style & WS_EX_LEFTSCROLLBAR) == WS_EX_LEFTSCROLLBAR));
			return ret;
		}

		private Color BlendColor(
			Color colorFrom,
			Color colorTo,
			int alpha
			)
		{       
			return Color.FromArgb(
				((colorFrom.R * alpha) / 255) + ((colorTo.R * (255 - alpha)) / 255),
				((colorFrom.G * alpha) / 255) + ((colorTo.G * (255 - alpha)) / 255),
				((colorFrom.B * alpha) / 255) + ((colorTo.B * (255 - alpha)) / 255)
				);      
		}

		private Color VSNetControlColor()
		{
			return BlendColor(
				Color.FromKnownColor(KnownColor.Control), 
				VSNetBackgroundColor(), 
				195);
		}

		private Color VSNetBackgroundColor()
		{
			return BlendColor(
				Color.FromKnownColor(KnownColor.Window), 
				Color.FromKnownColor(KnownColor.Control), 
				220);
		}

		private Color VSNetCheckedColor()
		{
			return BlendColor(
				Color.FromKnownColor(KnownColor.Highlight), 
				Color.FromKnownColor(KnownColor.Window),
				30);
		}
	
		private Color VSNetBorderColor()
		{
			return Color.FromKnownColor(KnownColor.Highlight);
		}

		private Color VSNetSelectionColor()
		{
			return BlendColor(
				Color.FromKnownColor(KnownColor.Highlight), 
				Color.FromKnownColor(KnownColor.Window), 
				70);
		}

		private Color VSNetPressedColor()
		{
			return BlendColor(
				Color.FromKnownColor(KnownColor.Highlight), 
				VSNetSelectionColor(), 
				70);
		}
		#endregion

	}
	


