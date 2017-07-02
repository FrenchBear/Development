using System;
using System.Drawing;
using System.Drawing.Text;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Xml.Serialization;
using System.IO;
using System.IO.IsolatedStorage;

namespace IconComboBoxCS
{
	/// <summary>
	/// A form for demonstrating the features of the IconCombo control.
	/// </summary>
	public class frmTestIconCombo : System.Windows.Forms.Form
	{
		private System.Windows.Forms.ImageList ilsIcons;
		private IconComboBox cboIndented;
		private IconComboBox cboColumns;
		private System.Windows.Forms.Button btnRearrange;
		private System.Windows.Forms.Button btnHideColumns;
		private System.Windows.Forms.Label lblIdentInfo;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private IconComboBox cboDropDownList;
		private System.ComponentModel.IContainer components;

		/// <summary>
		/// Constructs a new instance of the form.
		/// </summary>
		public frmTestIconCombo()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			// Set up the Indented Icon Combo Box:
			populateIndentedIconCombo();			
			// demonstrate new close up event:
			cboIndented.CloseUp += new EventHandler(cboIndented_CloseUp);
			// selection changed:
			cboIndented.SelectedIndexChanged += new EventHandler(cboIndented_SelectedIndexChanged);

			// Set up the drop-down Combo Box:
			populateDropDownListCombo();

			// Set up the multi-column Combo Box
			populateMultiColumnCombo();			

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
			this.components = new System.ComponentModel.Container();
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(frmTestIconCombo));
			this.cboIndented = new IconComboBox();
			this.ilsIcons = new System.Windows.Forms.ImageList(this.components);
			this.cboColumns = new IconComboBox();
			this.btnRearrange = new System.Windows.Forms.Button();
			this.btnHideColumns = new System.Windows.Forms.Button();
			this.lblIdentInfo = new System.Windows.Forms.Label();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.cboDropDownList = new IconComboBox();
			this.SuspendLayout();
			// 
			// cboIndented
			// 
			this.cboIndented.AutoComplete = true;
			this.cboIndented.BorderStyle = IconComboBox.DrawingStyle.Office10;
			this.cboIndented.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawVariable;
			this.cboIndented.FullRowSelect = false;
			this.cboIndented.GridLines = false;
			this.cboIndented.HighlightStyle = IconComboBox.DrawingStyle.Office10;
			this.cboIndented.ImageList = null;
			this.cboIndented.IndentationSize = 16;
			this.cboIndented.Location = new System.Drawing.Point(8, 28);
			this.cboIndented.Name = "cboIndented";
			this.cboIndented.Size = new System.Drawing.Size(288, 22);
			this.cboIndented.TabIndex = 1;
			this.cboIndented.Text = "Indented Icon Combo";
			this.cboIndented.TextBoxIcon = true;
			// 
			// ilsIcons
			// 
			this.ilsIcons.ColorDepth = System.Windows.Forms.ColorDepth.Depth32Bit;
			this.ilsIcons.ImageSize = new System.Drawing.Size(16, 16);
			this.ilsIcons.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("ilsIcons.ImageStream")));
			this.ilsIcons.TransparentColor = System.Drawing.Color.Transparent;
			// 
			// cboColumns
			// 
			this.cboColumns.AutoComplete = true;
			this.cboColumns.BorderStyle = IconComboBox.DrawingStyle.Office10;
			this.cboColumns.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawVariable;
			this.cboColumns.FullRowSelect = false;
			this.cboColumns.GridLines = false;
			this.cboColumns.HighlightStyle = IconComboBox.DrawingStyle.Office10;
			this.cboColumns.ImageList = null;
			this.cboColumns.IndentationSize = 16;
			this.cboColumns.Location = new System.Drawing.Point(8, 136);
			this.cboColumns.Name = "cboColumns";
			this.cboColumns.Size = new System.Drawing.Size(284, 22);
			this.cboColumns.TabIndex = 5;
			this.cboColumns.Text = "Column Icon Combo";
			this.cboColumns.TextBoxIcon = true;
			// 
			// btnRearrange
			// 
			this.btnRearrange.FlatStyle = System.Windows.Forms.FlatStyle.System;
			this.btnRearrange.Location = new System.Drawing.Point(8, 168);
			this.btnRearrange.Name = "btnRearrange";
			this.btnRearrange.Size = new System.Drawing.Size(68, 40);
			this.btnRearrange.TabIndex = 6;
			this.btnRearrange.Text = "Rearrange Columns";
			this.btnRearrange.Click += new System.EventHandler(this.btnRearrange_Click);
			// 
			// btnHideColumns
			// 
			this.btnHideColumns.FlatStyle = System.Windows.Forms.FlatStyle.System;
			this.btnHideColumns.Location = new System.Drawing.Point(84, 168);
			this.btnHideColumns.Name = "btnHideColumns";
			this.btnHideColumns.Size = new System.Drawing.Size(68, 40);
			this.btnHideColumns.TabIndex = 7;
			this.btnHideColumns.Text = "Hide Columns";
			this.btnHideColumns.Click += new System.EventHandler(this.btnHideColumns_Click);
			// 
			// lblIdentInfo
			// 
			this.lblIdentInfo.BackColor = System.Drawing.SystemColors.ControlDark;
			this.lblIdentInfo.ForeColor = System.Drawing.SystemColors.ControlLightLight;
			this.lblIdentInfo.Location = new System.Drawing.Point(8, 8);
			this.lblIdentInfo.Name = "lblIdentInfo";
			this.lblIdentInfo.Size = new System.Drawing.Size(288, 16);
			this.lblIdentInfo.TabIndex = 0;
			this.lblIdentInfo.Text = " Icon Combo Box with Indentations and AutoComplete";
			this.lblIdentInfo.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label1
			// 
			this.label1.BackColor = System.Drawing.SystemColors.ControlDark;
			this.label1.ForeColor = System.Drawing.SystemColors.ControlLightLight;
			this.label1.Location = new System.Drawing.Point(8, 116);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(284, 16);
			this.label1.TabIndex = 4;
			this.label1.Text = " Multi-Column Icon Combo Box";
			this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label2
			// 
			this.label2.BackColor = System.Drawing.SystemColors.ControlDark;
			this.label2.ForeColor = System.Drawing.SystemColors.ControlLightLight;
			this.label2.Location = new System.Drawing.Point(8, 60);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(288, 16);
			this.label2.TabIndex = 2;
			this.label2.Text = " DropDownList Icon Combo Box";
			this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// cboDropDownList
			// 
			this.cboDropDownList.AutoComplete = true;
			this.cboDropDownList.BorderStyle = IconComboBox.DrawingStyle.Office10;
			this.cboDropDownList.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawVariable;
			this.cboDropDownList.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.cboDropDownList.FullRowSelect = false;
			this.cboDropDownList.GridLines = false;
			this.cboDropDownList.HighlightStyle = IconComboBox.DrawingStyle.Office10;
			this.cboDropDownList.ImageList = null;
			this.cboDropDownList.IndentationSize = 16;
			this.cboDropDownList.Location = new System.Drawing.Point(8, 80);
			this.cboDropDownList.Name = "cboDropDownList";
			this.cboDropDownList.Size = new System.Drawing.Size(288, 22);
			this.cboDropDownList.TabIndex = 3;
			this.cboDropDownList.TextBoxIcon = false;
			// 
			// frmTestIconCombo
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 14);
			this.ClientSize = new System.Drawing.Size(308, 266);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.label2,
																		  this.cboDropDownList,
																		  this.cboColumns,
																		  this.cboIndented,
																		  this.label1,
																		  this.lblIdentInfo,
																		  this.btnHideColumns,
																		  this.btnRearrange});
			this.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.Name = "frmTestIconCombo";
			this.Text = "vbAccelerator IconComboBox Demonstration";
			this.Load += new System.EventHandler(this.frmTestIconCombo_Load);
			this.ResumeLayout(false);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new frmTestIconCombo());
		}

		private void frmTestIconCombo_Load(object sender, System.EventArgs e)
		{
		}
		

		private void populateDropDownListCombo()
		{
			// Set up the image list and appearance:
			cboDropDownList.ImageList = ilsIcons;

			// Add some test items to the control:
			for (int i = 0; i < ilsIcons.Images.Count; i++)
			{
				// Create the item:
				IconComboItem ici = new IconComboItem();
				// Set text:
				ici.Text = "Test Item " + i;
				// Set 0-based icon index in ImageList:
				ici.Icon = i;
				// Set Indentation.  This size is multiplied by 
				// the combo's IndentationSize property when the
				// item is rendered.
				ici.Indentation = i % 4;
				// For this demo, every item with ident = 0 has
				// a bold font:
				if (ici.Indentation == 0)
				{
					ici.Font = new Font(cboDropDownList.Font.Name, cboDropDownList.Font.Size, FontStyle.Bold);
				}

				// Add the item to the control:
				cboDropDownList.Items.Add(ici);
			}

			cboDropDownList.SelectedIndex = 0;
		}


		private void populateIndentedIconCombo()
		{
			// Set up the image list and appearance:
			cboIndented.ImageList = ilsIcons;
			cboIndented.TextBoxIcon = true;			

			// Add some test items to the control:
			for (int i = 0; i < ilsIcons.Images.Count; i++)
			{
				// Create the item:
				IconComboItem ici = new IconComboItem();
				// Set text:
				ici.Text = "Test Item " + i;
				// Set 0-based icon index in ImageList:
				ici.Icon = i;
				// Set Indentation.  This size is multiplied by 
				// the combo's IndentationSize property when the
				// item is rendered.
				ici.Indentation = i % 4;

				// Add the item to the control:
				cboIndented.Items.Add(ici);
			}

			// select a default item:
			cboIndented.SelectedIndex = 0;
		}

		private void populateMultiColumnCombo()
		{
			// Set up the image list and appearance:
			cboColumns.ImageList = ilsIcons;
			cboColumns.TextBoxIcon = true;
			cboColumns.GridLines = true;
			
			// Set up the columns to display.  Note that by default
			// an IconComboBox already has one column at order 0.
			cboColumns.Columns[0].ColumnWidth = 128;
			IconComboBoxColumn column = new IconComboBoxColumn();
			column.ColumnWidth = 32;
			cboColumns.Columns.Add(column);
			column = new IconComboBoxColumn();
			column.ColumnWidth = 96;
			cboColumns.Columns.Add(column);
			column = new IconComboBoxColumn();
			column.ColumnWidth = 64;
			cboColumns.Columns.Add(column);

			// Set the drop-down width using the columns we've just set
			// up.  By adding the width of the vertical scroll bar we 
			// can ensure that each row is exactly shown regardless of
			// whether the scroll appears or not.
			int dropDownWidth = SystemInformation.VerticalScrollBarWidth;
			foreach (IconComboBoxColumn col in cboColumns.Columns)
			{
				dropDownWidth += col.ColumnWidth;
			}
			cboColumns.DropDownWidth = dropDownWidth;
			// Show 12 items at a time in the drop-down
			cboColumns.MaxDropDownItems = 12;


			// Add some demonstration items
			
			// This is a custom string formatter we'll use to align
			// the decimal numeric items to the right (in L-t-R environment):
			StringFormat format = new StringFormat();
			format.Alignment = StringAlignment.Far;
			format.LineAlignment = StringAlignment.Center;
			format.FormatFlags = StringFormatFlags.LineLimit | StringFormatFlags.NoWrap;
			format.Trimming = StringTrimming.EllipsisCharacter;

			int imageCount = ilsIcons.Images.Count;
			for (int i = 0; i < imageCount * 10; i++)
			{
				// Create a new item:
				IconComboItem ici = new IconComboItem();
				ici.Text = "Test Item " + i;
				ici.Icon = i % imageCount;
				
				// Add a numeric sub item and format it to one
				// decimal place, aligned Far:
				IconComboSubItem subItem = new IconComboSubItem();
				subItem.Text = i / 3.0F;
				subItem.StringFormat = format;
				subItem.TextFormat = "{0:0.0} ";
				ici.SubItems.Add(subItem);

				// Add a date item, formatted with a custom date format:
				subItem = new IconComboSubItem();
				subItem.Text = DateTime.Now;
				subItem.TextFormat = "{0:d MMMM yyyy}";
				ici.SubItems.Add(subItem);

				// Add a final sub item which has an icon and displays
				// the text "Img:" followed by its icon number if Hex:
				subItem = new IconComboSubItem();
				subItem.Icon = (i / 2) % imageCount;
				subItem.Text = subItem.Icon;
				subItem.TextFormat = "Img:{0:X2}";
				ici.SubItems.Add(subItem);

				// Add the item to the control:
				cboColumns.Items.Add(ici);
			}

			// select a default item:
			cboColumns.SelectedIndex = 0;

		}



		private void btnRearrange_Click(object sender, System.EventArgs e)
		{
			
			if (cboColumns.Columns[0].ColumnOrder == 3)
			{
				for (int i = 0; i < cboColumns.Columns.Count; i++)
				{
					cboColumns.Columns[i].ColumnOrder = i;
				}
			}
			else
			{
				cboColumns.Columns[3].ColumnOrder = 0;
				cboColumns.Columns[0].ColumnOrder = 1;
				cboColumns.Columns[1].ColumnOrder = 2;
				cboColumns.Columns[2].ColumnOrder = 3;	
			}

		}

		private void btnHideColumns_Click(object sender, System.EventArgs e)
		{
			if (cboColumns.Columns[1].ColumnWidth == 0)
			{
				cboColumns.Columns[1].ColumnWidth = 32;
				cboColumns.Columns[2].ColumnWidth = 96;
				btnHideColumns.Text = "Hide Columns";
			}
			else
			{
				cboColumns.Columns[1].ColumnWidth = 0;
				cboColumns.Columns[2].ColumnWidth = 0;
				btnHideColumns.Text = "Show Columns";
			}

			int dropDownWidth = SystemInformation.VerticalScrollBarWidth;
			foreach (IconComboBoxColumn col in cboColumns.Columns)
			{
				dropDownWidth += col.ColumnWidth;
			}
			cboColumns.DropDownWidth = dropDownWidth;

		}

		private void cboIndented_CloseUp(object sender, EventArgs e)
		{
			Console.WriteLine("cboIndented Closed Up");
		}

		private void cboIndented_SelectedIndexChanged(object sender, EventArgs e)
		{
			IconComboItem selected = cboIndented.SelectedItem;
			string text = "No selection";
			if (selected != null)
			{
				text = selected.ToString();
			}
			Console.WriteLine("Selected Index Changed to {0}", text);
		}

	}
}
