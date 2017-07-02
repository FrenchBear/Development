using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;

namespace CustomizeTabs
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.TabControl tabControl1;
		private System.Windows.Forms.TabPage tabPage1;
		private System.Windows.Forms.TabPage tabPage2;
		private System.Windows.Forms.TabPage tabPage3;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//set the drawmode and subscribe to the DrawItem event
			this.tabControl1.DrawMode = System.Windows.Forms.TabDrawMode.OwnerDrawFixed;
			this.tabControl1.DrawItem += new DrawItemEventHandler(this.tabControl1_DrawItem);
		
			
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if (components != null) 
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.tabControl1 = new System.Windows.Forms.TabControl();
			this.tabPage1 = new System.Windows.Forms.TabPage();
			this.tabPage2 = new System.Windows.Forms.TabPage();
			this.tabPage3 = new System.Windows.Forms.TabPage();
			this.tabControl1.SuspendLayout();
			this.SuspendLayout();
			// 
			// tabControl1
			// 
			this.tabControl1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					  this.tabPage1,
																					  this.tabPage2,
																					  this.tabPage3});
			this.tabControl1.Location = new System.Drawing.Point(32, 32);
			this.tabControl1.Name = "tabControl1";
			this.tabControl1.SelectedIndex = 0;
			this.tabControl1.Size = new System.Drawing.Size(256, 144);
			this.tabControl1.TabIndex = 0;
			// 
			// tabPage1
			// 
			this.tabPage1.Location = new System.Drawing.Point(4, 22);
			this.tabPage1.Name = "tabPage1";
			this.tabPage1.Size = new System.Drawing.Size(336, 206);
			this.tabPage1.TabIndex = 0;
			this.tabPage1.Text = "tabPage1";
			// 
			// tabPage2
			// 
			this.tabPage2.Location = new System.Drawing.Point(4, 22);
			this.tabPage2.Name = "tabPage2";
			this.tabPage2.Size = new System.Drawing.Size(336, 206);
			this.tabPage2.TabIndex = 1;
			this.tabPage2.Text = "tabPage2";
			// 
			// tabPage3
			// 
			this.tabPage3.Location = new System.Drawing.Point(4, 22);
			this.tabPage3.Name = "tabPage3";
			this.tabPage3.Size = new System.Drawing.Size(248, 118);
			this.tabPage3.TabIndex = 2;
			this.tabPage3.Text = "tabPage3";
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(328, 230);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.tabControl1});
			this.Name = "Form1";
			this.Text = "Form1";
			this.tabControl1.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new Form1());
		}

		private void tabControl1_DrawItem(object sender, System.Windows.Forms.DrawItemEventArgs e)
		{
			Font f;
			Brush backBrush;
			Brush foreBrush;
			
			if(e.Index == this.tabControl1.SelectedIndex)
			{
				f = new Font(e.Font, FontStyle.Italic | FontStyle.Bold);
				backBrush = new System.Drawing.Drawing2D.LinearGradientBrush(e.Bounds, Color.Blue, Color.Red, System.Drawing.Drawing2D.LinearGradientMode.BackwardDiagonal);
				foreBrush = Brushes.PowderBlue;
			}
			else
			{
				f = e.Font;
				backBrush = new SolidBrush(e.BackColor); 
				foreBrush = new SolidBrush(e.ForeColor);
			}

			string tabName = this.tabControl1.TabPages[e.Index].Text;
			StringFormat sf = new StringFormat();
			sf.Alignment = StringAlignment.Center;
			e.Graphics.FillRectangle(backBrush, e.Bounds);
			Rectangle r = e.Bounds;
			r = new Rectangle(r.X, r.Y + 3, r.Width, r.Height - 3);
			e.Graphics.DrawString(tabName, f, foreBrush, r, sf);

			sf.Dispose();
			if(e.Index == this.tabControl1.SelectedIndex)
			{
				f.Dispose();
				backBrush.Dispose();
			}
			else
			{
				backBrush.Dispose();
				foreBrush.Dispose();
			}
		}
	}
}
