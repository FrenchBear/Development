using System;
using System.Collections;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Forms;

	/// <summary>
	/// A combo box capable of displaying icons and multiple columns
	/// in the drop-down portion.	
	/// </summary>
	public class IconComboBox : System.Windows.Forms.ComboBox, IIconComboBox
	{

		#region ObjectCollection
		/// <summary>
		/// Strongly-typed collection of objects within the IconComboBox.
		/// TODO: Have not found how to attach this to the combo box itself 
		/// yet.
		/// </summary>
		new public class ObjectCollection : System.Windows.Forms.ComboBox.ObjectCollection 
		{		
			#region Member variables
			private IconComboBox owner = null;
			#endregion

			/// <summary>
			/// Returns the item at the specified index within the collection
			/// </summary>			
			new public IIconComboItem this[int index]
			{
				get
				{
					return (IIconComboItem)base[index];
				}
				set
				{
					base[index] = value;
				}
			}
			/// <summary>
			/// Adds an item to the list of items in the IconComboBox
			/// </summary>
			/// <param name="item">Item to add</param>
			/// <returns>Zero-based index of the item in the collection</returns>
			public System.Int32 Add (IIconComboItem item )
			{
				item.Owner = this.owner;
				return base.Add(item);
			}
			/// <summary>
			/// Adds an array of items to the list of items in the IconComboBox
			/// </summary>
			/// <param name="items">An array of objects to add to the list</param>
			public void AddRange ( IIconComboItem[] items )
			{
				foreach (IIconComboItem item in items)
				{
					item.Owner = this.owner;
				}
				base.AddRange(items);
			}
			/// <summary>
			/// Determines whether the specified item is located within the collection
			/// </summary>
			/// <param name="value">An IIconComboItem containing the item to locate in the collection</param>
			/// <returns>True if the item is located within the collection; otherwise false.</returns>
			public bool Contains(IIconComboItem value)
			{
				return base.Contains(value);
			}
			/// <summary>
			/// Copies the entire collection into an existing array of objects at a specified location within the array
			/// </summary>
			/// <param name="dest">The object array in which the items from the collection are copied to</param>
			/// <param name="arrayIndex">The location within the destination array to copy the items from the collection to</param>
			public void CopyTo(IIconComboItem[] dest , System.Int32 arrayIndex )
			{
				base.CopyTo(dest, arrayIndex);
			}
			/// <summary>
			/// Returns the index within the collection of the specified item.
			/// </summary>
			/// <param name="value">The IIconComboItem to locate in the collection.</param>
			/// <returns>The zero-based index where the item is located within the collection, otherwise -1</returns>
			public int IndexOf(IIconComboItem value)
			{
				return base.IndexOf(value);
			}
			/// <summary>
			/// Inserts an item into the list box at the specified index.
			/// </summary>
			/// <param name="index">The zero-based index location where the item is inserted.</param>
			/// <param name="item">The IIconComboItem to insert.</param>
			public void Insert(int index, IIconComboItem item)
			{
				item.Owner = this.owner;
				base.Insert(index, item);
			}

			/// <summary>
			/// Initializes a new instance of the ObjectCollection.
			/// </summary>
			/// <param name="owner">The IconComboBox that owns the collection</param>
			public ObjectCollection ( IconComboBox owner ) : base(owner)
			{
				this.owner = owner;
			}
		}
		#endregion

		#region Enumerations
		/// <summary>
		/// Selection highlighting and border style options for the IconComboBox
		/// </summary>
		public enum DrawingStyle : int
		{
			/// <summary>
			/// Normal ComboBox style selection
			/// </summary>
			Standard = 0,
			/// <summary>
			/// Like the VS.NET/Office XP menus
			/// </summary>
			Office10 = 1			
		}
		#endregion

		#region Member Variables
		private FlatControl flatControl = null;
		private TextBoxMarginCustomise textIcon = null;
		private bool textBoxIcon = false;
		private ImageList imageList = null;
		private IconComboBoxColumnCollection columns = null;
		private int indentSize = 16;
		private DrawingStyle highlightStyle = DrawingStyle.Standard;
		private DrawingStyle borderStyle = DrawingStyle.Standard;
		private bool fullRowSelect = true;
		private bool gridLines = false;
		private bool autoComplete = false;
		private int lastTextLength = 0; // used for auto-complete
		private bool suppressSelectedIndexChange = false;
		#endregion

		#region events
		/// <summary>
		/// Raised when the combo box portion of the control is closed up.
		/// </summary>
		public event EventHandler CloseUp;
		#endregion

		#region Implementation
		/// <summary>
		/// Gets/sets whether this item is auto-complete
		/// </summary>
		public bool AutoComplete
		{
			get
			{
				return this.autoComplete;
			}
			set
			{
				this.autoComplete = value;
			}
		}

		/// <summary>
		/// Gets/sets the selection highlighting style
		/// </summary>
		public DrawingStyle HighlightStyle
		{
			get
			{
				return this.highlightStyle;
			}
			set
			{
				this.highlightStyle = value;
			}
		}

		/// <summary>
		/// Gets/sets the border style for the control.
		/// </summary>
		public DrawingStyle BorderStyle
		{
			get
			{
				return this.borderStyle;
			}
			set
			{
				if (this.borderStyle != value)
				{
					this.borderStyle = value;
					if (this.flatControl != null)
					{
						if (this.borderStyle == DrawingStyle.Office10)
						{
							this.flatControl.Attach(this);
						}
						else
						{
							this.flatControl.ReleaseHandle();
						}
					}
				}
			}
		}

		/// <summary>
		/// Gets/sets whether a full row is shown selected, or
		/// just the first column's icon and text.
		/// </summary>
		public bool FullRowSelect
		{
			get
			{
				return this.fullRowSelect;
			}
			set
			{
				this.fullRowSelect = value;
			}
		}

		/// <summary>
		/// Gets/sets whether grid lines are drawn or not.
		/// </summary>
		public bool GridLines
		{
			get
			{
				return this.gridLines;
			}
			set
			{
				this.gridLines = value;
			}
		}

		/// <summary>
		/// Gets/sets whether the icon is shown when the 
		/// ComboBox has DropDown style
		/// </summary>
		public bool TextBoxIcon
		{
			get
			{
				return this.textBoxIcon;
			}
			set
			{
				this.textBoxIcon = value;
				if ((this.DropDownStyle == ComboBoxStyle.DropDown) && (value))
				{					
					this.textIcon.ImageList = this.imageList;
				}
			}
		}


		/// <summary>
		/// Gets/sets the ImageList associated with this 
		/// control.
		/// </summary>
		public System.Windows.Forms.ImageList ImageList
		{
			get
			{
				return this.imageList;
			}
			set
			{
				this.imageList = value;
				this.textIcon.ImageList = this.imageList;
			}
		}

		/// <summary>
		/// Gets/sets the DropDownStyle of the Combo Box control.
		/// </summary>
		public new ComboBoxStyle DropDownStyle
		{
			get
			{
				return base.DropDownStyle;
			}
			set
			{
				base.DropDownStyle = value;
			}
		}

		/// <summary>
		/// Returns the selected <see cref="IconComboItem"/> in the control, if any, otherwise
		/// <c>null</c>.
		/// </summary>
		public new IconComboItem SelectedItem
		{
			get
			{
				IconComboItem selected = null;
				if (base.SelectedItem != null)
				{
					selected = (IconComboItem) base.SelectedItem;
				}
				return selected;
			}
		}
		
		/// <summary>
		/// Returns the width of an item in the specified column
		/// </summary>
		/// <param name="index">The index of the column to get the width for.</param>
		/// <returns>The width in pixels</returns>
		public int ColumnWidth(int index)
		{
			if ((index < 0) || (index > columns.Count))
			{
				return 0;
			}
			else
			{
				if (((int) this.columns[index].ColumnWidth) < 0)
				{
					return 128;
				}
				else
				{
					return (int) this.columns[index].ColumnWidth;
				}
			}
		}

		/// <summary>
		/// Gets the collection of columns in the control.
		/// </summary>
		public IconComboBoxColumnCollection Columns
		{
			get
			{				
				return this.columns;
			}
		}

		/// <summary>
		/// Returns the index of the column with the specified order
		/// </summary>
		/// <param name="order">Order of column to display</param>
		/// <returns>Index of column or -1 if not a valid column</returns>
		public int ColumnIndex(int order)
		{
			int index = -1;
			for (int i = 0; i < this.columns.Count; i++)
			{
				if (((int) this.columns[i].ColumnOrder) == order)
				{
					index = i;
					break;
				}
			}
			return index;
		}

		/// <summary>
		/// Returns the number of columns associated with the control.
		/// </summary>
		public int ColumnCount
		{
			get
			{
				return this.columns.Count;
			}
		}

		/// <summary>
		/// Gets/sets the size of each unit of indentation for the items within the 
		/// Combo Box.
		/// </summary>
		public int IndentationSize
		{
			get
			{
				return this.indentSize;
			}
			set
			{
				this.indentSize = value;
				Remeasure();
			}		
		}

		/// <summary>
		/// Responds to a non-height property change event of an item.
		/// Forces the ComboBox to redraw the item if necessary
		/// </summary>
		/// <param name="item">Item which has changed</param>
		public void OnItemChanged(IIconComboItem item)
		{
			if (this.DropDownStyle == ComboBoxStyle.DropDownList)
			{
				if (this.Items.IndexOf(item) == this.SelectedIndex)
				{
					this.Invalidate();
				}
			}
		}

		/// <summary>
		/// Responds to a height changed event of an item.
		/// In a ComboBox, the only way to change the height of an item
		/// once it has been Measured is to remove it and then add it
		/// again.
		/// </summary>
		/// <param name="item">Item whose height has changed</param>
		public void OnItemHeightChanged(IIconComboItem item)
		{
			int index = this.Items.IndexOf(item);
			bool selected = (this.SelectedIndex == index);
			this.Items.RemoveAt(index);
			this.Items.Insert(index, item);
			if (selected)
			{
				this.SelectedIndex = index;
			}
		}

		/// <summary>
		/// Measures the item and raises the MeasureItem event
		/// </summary>
		/// <param name="e">MeasureItemEventArgs for the item</param>
		protected override void OnMeasureItem(MeasureItemEventArgs e)
		{
			if ((e.Index >= 0) && (e.Index < this.Items.Count))
			{
				IIconComboItem item = (IIconComboItem) this.Items[e.Index];
				item.Owner = this;
				Size size = item.MeasureItem(
					e.Graphics, 
					this.imageList,
					this.Font,
					this.Width
					);
				// TODO: need to consider what to do with the width
				e.ItemWidth = size.Width;
				e.ItemHeight = size.Height;
			}
			else
			{
				base.OnMeasureItem(e);
			}
		}

		/// <summary>
		/// Draws the SListBox item and raises the DrawItem 
		/// event.
		/// </summary>
		/// <param name="e">DrawItemEventArgs for the item</param>
		protected override void OnDrawItem(DrawItemEventArgs e)
		{
			if ((e.Index >= 0) && (e.Index < this.Items.Count))
			{
				IIconComboItem item = (IIconComboItem) this.Items[e.Index];
				item.DrawItem(
					e.Graphics,
					this.imageList,
					e.Bounds,
					e.Font,
					((e.State & DrawItemState.Selected) == DrawItemState.Selected),
					(this.RightToLeft == RightToLeft.Yes),
					((e.State & DrawItemState.ComboBoxEdit) != DrawItemState.ComboBoxEdit)
					);
			}
			else
			{
				base.OnDrawItem(e);
			}
		}

		/// <summary>
		/// Ensures that the subclasses needed to support the control
		/// are installed.
		/// </summary>
		/// <param name="e">Not used</param>
		protected override void OnHandleCreated ( System.EventArgs e )
		{
			if (this.DropDownStyle == ComboBoxStyle.DropDown)
			{
				this.textIcon.Attach(this);				
			}
			if (this.textBoxIcon)
			{
				this.textIcon.ImageList = this.imageList;
			}
			if ((this.DropDownStyle == ComboBoxStyle.DropDown || this.DropDownStyle == ComboBoxStyle.DropDownList))
			{
				if (this.borderStyle == DrawingStyle.Office10)
				{
					if (this.flatControl.Handle != this.Handle)
					{
						this.flatControl.Attach(this);
					}
				}
			}
			base.OnHandleCreated(e);
		}

		/// <summary>
		/// Handles auto-completion and raises the KeyPress event.
		/// </summary>
		/// <param name="e">Information about the key press associated with the event</param>
		protected override void OnKeyPress ( System.Windows.Forms.KeyPressEventArgs e )
		{
			base.OnKeyPress(e);

			if (this.autoComplete)
			{
				String text = this.Text;
				if (e.KeyChar == 8)
				{
					if ((text.Length == lastTextLength) && (text.Length > 0))
					{
						text = text.Substring(0, text.Length - 1);
						this.Text = text;
					}
				}
				else if (e.KeyChar == 13)
				{
					return;
				}

				// does the typed text match anything?
				int findIndex = this.FindString(text);
				
				if (findIndex > -1) 
				{
					if (this.SelectedIndex != findIndex)
					{
						suppressSelectedIndexChange = true;
						this.SelectedIndex = findIndex;						
						this.SelectionStart = text.Length;
						if (text.Length < this.Items[findIndex].ToString().Length)
						{
							this.SelectionLength = this.Items[findIndex].ToString().Length - text.Length;
						}
					}
				}
				lastTextLength = text.Length;
			}

			if ((this.DropDownStyle == ComboBoxStyle.DropDown) && (this.textBoxIcon))
			{
				if (this.SelectedIndex == -1)
				{
					if (this.textIcon.Icon != -1)
					{
						this.textIcon.Icon = -1;
					}
				}
				else
				{
					if (this.textIcon.Icon != ((IIconComboItem) this.Items[this.SelectedIndex]).Icon)
					{
						this.textIcon.Icon = ((IIconComboItem) this.Items[this.SelectedIndex]).Icon;
					}
				}
			}

		}

		/// <summary>
		/// Handles setting the icon in the text box portion of the control
		/// and raises the SelectedIndexChanged event.
		/// </summary>
		/// <param name="e">Not used</param>
		protected override void OnSelectedIndexChanged(EventArgs e)
		{
			if (this.DropDownStyle == ComboBoxStyle.DropDown)
			{
				if (this.TextBoxIcon)
				{
					if (this.SelectedIndex == -1)
					{
						this.textIcon.Icon = -1;
					}
					else
					{
						IIconComboItem ici = (IIconComboItem) this.Items[this.SelectedIndex];
						this.textIcon.Icon = ici.Icon;
					}
				}
			}
			if (!this.suppressSelectedIndexChange)
			{
				base.OnSelectedIndexChanged(e);
			}
			else
			{
				this.suppressSelectedIndexChange = false;
			}
		}

		private void flatControl_CloseUp(object sender, EventArgs e)
		{
			OnCloseUp(e);
		}

		/// <summary>
		/// Raises the <see cref="CloseUp"/> event for the control.
		/// </summary>
		/// <param name="e">Not used.</param>
		protected virtual void OnCloseUp(EventArgs e)
		{
			if (this.CloseUp != null)
			{
				this.CloseUp(this, e);
			}
		}
		
		private void Remeasure()
		{
		}

		private void textIcon_ComboEditKeyDown(object sender, KeyEventArgs e)
		{
			if (this.AutoComplete)
			{
				OnKeyDown(e);

				if (this.SelectedIndex != -1)
				{
					if (!this.Text.Equals(this.SelectedText))
					{
						this.SelectionStart = 0;
						this.SelectionLength = this.Text.Length;
						OnSelectedIndexChanged(new EventArgs());
					}
				}

				OnKeyUp(e);
			}
		}

		/// <summary>
		/// Constructs a new instance of the control
		/// </summary>
		public IconComboBox() : base()
		{
			this.textIcon = new TextBoxMarginCustomise();
			this.textIcon.ComboEditKeyDown += new KeyEventHandler(textIcon_ComboEditKeyDown);
			this.flatControl = new FlatControl();			
			this.flatControl.CloseUp += new EventHandler(flatControl_CloseUp);
			this.DrawMode =  System.Windows.Forms.DrawMode.OwnerDrawVariable;
			this.columns = new IconComboBoxColumnCollection(this);
		}
		#endregion

	}

	#region IconComboBoxColumnCollection
	/// <summary>
	/// A class which manages the collection of columns associated with an
	/// IconComboBox control.
	/// </summary>
	public class IconComboBoxColumnCollection : ReadOnlyCollectionBase
	{
		/// <summary>
		/// The owning control
		/// </summary>
		private IIconComboBox owner = null;
	
		/// <summary>
		/// Adds a column to the column collection.
		/// </summary>
		/// <param name="column">Column to add</param>
		/// <returns>Index of added column</returns>
		public int Add(IconComboBoxColumn column)
		{
			column.Owner = this.owner;
			if (column.ColumnOrder < 0) // flagged default column order, add to the end
			{
				column.ColumnOrder = owner.ColumnCount;
			}
			else
			{
				// need to check the orders of the other columns & update
				// them accordingly (todo)
			}
			return this.InnerList.Add(column);
		}

		/// <summary>
		/// Removes all columns from the collection.
		/// </summary>
		public void Clear()
		{
			this.InnerList.Clear();
		}
		
		/// <summary>
		/// Returns <c>true</c> if the specified column is found in the column
		/// collection, or <c>false</c> otherwise.
		/// </summary>
		/// <param name="column">Column to find</param>
		/// <returns><c>true</c> if the specified column is found in the column
		/// collection, or <c>false</c> otherwise.</returns>
		public bool Contains(IconComboBoxColumn column)
		{
			return this.InnerList.Contains(column);
		}

		/// <summary>
		/// Gets the 0-based index of the specified column object.
		/// </summary>
		/// <param name="column">Column object to find.</param>
		/// <returns>0-based index if found, -1 otherwise.</returns>
		public int IndexOf(IconComboBoxColumn column)
		{
			return this.InnerList.IndexOf(column);
		}

		/// <summary>
		/// Inserts a column before the specified index.
		/// </summary>
		/// <param name="index">Index to insert column before</param>
		/// <param name="column">Column to insert</param>
		public void Insert(int index, IconComboBoxColumn column)
		{
			column.Owner = this.owner;
			this.InnerList.Insert(index, column);
		}

		/// <summary>
		/// Removes the column at the specified index.
		/// </summary>
		/// <param name="index">Index to remove at</param>
		public void RemoveAt(int index)
		{
			this.InnerList.RemoveAt(index);
		}

		/// <summary>
		/// Gets the Column at the specified index.
		/// </summary>
		public IconComboBoxColumn this[int index]
		{
			get
			{
				return (IconComboBoxColumn) this.InnerList[index];
			}
		}


		/// <summary>
		/// Constructs a new instance of the IconComboBoxColumnCollection
		/// object. Called automatically when an instance of an IconComboBox
		/// is created.
		/// </summary>
		/// <param name="owner">The IconComboBox which owns the columns</param>
		public IconComboBoxColumnCollection(IIconComboBox owner) : base()
		{
			this.owner = owner;
			IconComboBoxColumn column = new IconComboBoxColumn();			
			column.Owner = owner;
			column.ColumnOrder = 0;
			this.InnerList.Add(column);
		}
	}
	#endregion

	#region IconComboBoxColumn
	/// <summary>
	/// Represents a column within an IconComboBox.
	/// </summary>
	public class IconComboBoxColumn
	{
		private int colWidth = -1;
		private int colOrder = -1;
		private int lastColOrder = -1;
		private IIconComboBox owner = null;
		private static bool OrderChangeInterlock = false;

		/// <summary>
		/// Gets/sets the IconComboBox which owns this column.
		/// </summary>
		public IIconComboBox Owner
		{
			get
			{
				return this.owner;
			}
			set
			{
				this.owner = value;
				Rearrange();
			}
		}

		/// <summary>
		/// Gets/sets the width of this column.  Use -1 for
		/// the default width.
		/// </summary>
		public int ColumnWidth
		{
			get
			{
				return colWidth;
			}
			set
			{
				colWidth = value;
			}
		}

		private void Rearrange()
		{
			if ((this.owner != null) && (!IconComboBoxColumn.OrderChangeInterlock))
			{
				// Now check through 
				if (this.lastColOrder != -1)
				{
					IconComboBoxColumn.OrderChangeInterlock = true;

					// Validate the column order:
					if (this.colOrder < 0)
					{
						this.colOrder = 0;
					}
					if (this.colOrder > this.owner.ColumnCount)
					{
						this.colOrder = this.owner.ColumnCount - 1;
					}

					if (this.colOrder == this.lastColOrder)
					{
						// nothing to do
					}
					else if (this.colOrder < this.lastColOrder)
					{
						// anything >= this.colOrder and < this.lastcolOrder has one added:
						foreach (IconComboBoxColumn col in ((IconComboBox) owner).Columns)
						{
							if ((col.ColumnOrder >= this.colOrder) && (col.ColumnOrder < this.lastColOrder))
							{
								if (col != this)
								{
									col.ColumnOrder++;
								}
							}
						}
						// done
					}
					else if (this.colOrder > this.lastColOrder )
					{
						// anything > this.lastColOrder and <= this.colOrder has one subtracted:
						foreach (IconComboBoxColumn col in ((IconComboBox) owner).Columns)
						{
							if ((col.ColumnOrder > this.lastColOrder) && (col.ColumnOrder <= this.colOrder))
							{
								if (col != this)
								{
									col.ColumnOrder--;
								}
							}
						}
						// done
					}

					IconComboBoxColumn.OrderChangeInterlock = false;

				}
			}
			this.lastColOrder = this.colOrder;
		}

		/// <summary>
		/// Gets/sets the order that this column appears in.
		/// Orders are 0-based.
		/// </summary>
		public int ColumnOrder
		{
			get
			{
				return colOrder;
			}
			set
			{
				colOrder = value;
				Rearrange();
			}
		}

		/// <summary>
		/// Constructs a new instance of an IconComboBox column
		/// with default width and order.
		/// </summary>
		public IconComboBoxColumn() : base()
		{
		}
	}
	#endregion

	#region IIconComboBox
	/// <summary>
	/// Interface specifying the contract between an
	/// item and the owning control.
	/// </summary>
	public interface IIconComboBox
	{
		/// <summary>
		/// Called when an item's appearance changes.
		/// </summary>
		/// <param name="item">Item whose appearance has changed</param>
		void OnItemChanged(IIconComboItem item);

		/// <summary>
		/// Called when an item's appearance changes.
		/// </summary>
		/// <param name="item">Item whose appearance has changed</param>
		void OnItemHeightChanged(IIconComboItem item);

		/// <summary>
		/// Gets whether the full row is selected or just the text
		/// (single column combo boxes only)
		/// </summary>
		bool FullRowSelect
		{
			get;
		}

		/// <summary>
		/// Gets whether grid lines should be drawn.  Particularly
		/// useful on multi-column text boxes.
		/// </summary>
		bool GridLines
		{
			get;
		}

		/// <summary>
		/// Gets the selection highlighting style
		/// </summary>
		IconComboBox.DrawingStyle HighlightStyle
		{
			get;
		}

		/// <summary>
		/// Returns the size of the indentation
		/// </summary>
		int IndentationSize
		{
			get;
		}

		/// <summary>
		/// Returns the width of an item in the specified column
		/// </summary>
		/// <param name="index">The index of the column to get the width for.</param>
		/// <returns>The width in pixels</returns>
		int ColumnWidth(int index);

		/// <summary>
		/// Returns the column index for the column at the specified order in 
		/// the display.
		/// </summary>
		/// <param name="order">Order of column in the display</param>
		/// <returns>Index of the column.</returns>
		int ColumnIndex(int order);

		/// <summary>
		/// Gets the number of columns to display.
		/// </summary>
		int ColumnCount
		{
			get;
		}
	}
	#endregion

	#region IIconComboItem
	/// <summary>
	/// Interface specifying the contract between the
	/// owning control and an item
	/// </summary>
	public interface IIconComboItem
	{
		/// <summary>
		/// Gets/sets the control which owns the item.
		/// Called automatically when the item is added to
		/// the control.
		/// </summary>
		IIconComboBox Owner
		{
			get;
			set;
		}

		/// <summary>
		/// Gets/sets the icon to use for the item
		/// </summary>
		int Icon
		{
			get;
			set;
		}

		/// <summary>
		/// Items must support ToString().
		/// </summary>
		/// <returns>String representation of the item.</returns>
		string ToString();

		/// <summary>
		/// Draws this item.
		/// </summary>
		/// <param name="graphics">Graphics object to draw to</param>
		/// <param name="imageList">Source of images</param>
		/// <param name="bounds">Bounding rectangle for the item</param>
		/// <param name="defaultFont">Font to use if the item does not have a font specified</param>
		/// <param name="selected">Whether the item should be rendered selected or not</param>
		/// <param name="rightToLeft">Whether item should be rendered right-to-left</param>
		/// <param name="inList">Whether the item to be drawn is in the list portion or the combo portion</param>
		void DrawItem(
			Graphics graphics,
			ImageList imageList,
			Rectangle bounds,
			Font defaultFont,
			bool selected,
			bool rightToLeft,
			bool inList
			);

		/// <summary>
		/// Measures this item.
		/// </summary>
		/// <param name="graphics">Graphics object to draw to</param>
		/// <param name="imageList">Source of images</param>
		/// <param name="defaultFont">Font to use if the item does not have a font specified</param>
		/// <param name="width">Width to use when calculating height of wrappable text</param>
		/// <returns>The size of the item</returns>
		Size MeasureItem(
			Graphics graphics,
			ImageList imageList,
			Font defaultFont,
			int width
			);


	}
	#endregion

	#region IconComboItem
	/// <summary>
	/// An item to display in the IconComboBox control.  Items have
	/// icons and also may have subitems like the ListView control.
	/// </summary>
	public class IconComboItem : IconComboItemBase
	{

		private IconComboSubItemCollection itemCollection = new IconComboSubItemCollection();
		private bool isGroupRow = false;
		private int indentation = 0;
		private bool lineAbove = false;
		private bool lineBelow = false;
		
		
		/// <summary>
		/// Gets/sets whether this item renders with a line above it or not.
		/// </summary>
		public bool LineAbove
		{
			get
			{
				return this.lineAbove;
			}
			set
			{
				this.lineAbove = value;
			}
		}

		/// <summary>
		/// Gets/sets whether this item renders with a line below it or not.
		/// </summary>
		public bool LineBelow
		{
			get
			{
				return this.lineBelow;
			}
			set
			{
				this.lineBelow = value;
			}
		}

		/// <summary>
		/// Gets/sets the indentation of this item.
		/// </summary>
		public int Indentation
		{
			get
			{
				return this.indentation;
			}
			set
			{
				this.indentation = value;
				base.OnItemChanged();
			}
		}
		

		/// <summary>
		/// Gets the collection of sub-items associated with this item.
		/// </summary>
		public IconComboSubItemCollection SubItems
		{
			get
			{
				return this.itemCollection;
			}
		}

		/// <summary>
		/// Gets/sets whether this item acts as a group row (in which case
		/// the item is drawn extending across the entire row and the 
		/// sub-items, if any, are ignored) or not.
		/// </summary>
		public bool GroupRow
		{
			get
			{
				return this.isGroupRow;
			}
			set
			{
				this.isGroupRow = value;
			}
		}

		/// <summary>
		/// Draws this item.
		/// Used internally to draw the ListBox.
		/// </summary>
		/// <param name="graphics">Graphics object to draw to</param>
		/// <param name="imageList">Source of images</param>
		/// <param name="bounds">Bounding rectangle for the item</param>
		/// <param name="defaultFont">Font to use if the item does not have a font specified</param>
		/// <param name="selected">Whether the item should be rendered selected or not</param>
		/// <param name="rightToLeft">Whether item should be rendered right-to-left</param>
		/// <param name="inList">Whether the item to be drawn is in the list portion or the combo portion</param>
		public override void DrawItem(
			Graphics graphics,
			ImageList imageList,
			Rectangle bounds,
			Font defaultFont,
			bool selected,
			bool rightToLeft,
			bool inList
			)		
		{
			if (this.Owner == null)
			{
				// can't do it
				return;
			}

			int indentSize = Owner.IndentationSize;
			if (!inList)
			{
				indentSize = 0;
			}

			Rectangle selectionBounds = new Rectangle(bounds.Location, bounds.Size);			
			selectionBounds.Width -= this.Indentation * indentSize - 2;
			if (!rightToLeft)
			{
				selectionBounds.X += this.Indentation * indentSize;
			}

			// Always draw the selection box for the entire width 
			// of the item, if selected:
			bool highlightText = false;
			if (selected)
			{
				if ((this.Owner.ColumnCount == 1) && (!this.Owner.FullRowSelect))
				{
					// highlighting just the text
					graphics.FillRectangle(SystemBrushes.Window, selectionBounds);
					highlightText = true;
				}
				else
				{
					if (this.Owner.HighlightStyle == IconComboBox.DrawingStyle.Standard)
					{
						graphics.FillRectangle(SystemBrushes.Highlight, selectionBounds);
					}
					else
					{
						Color selColour = IconComboItemBase.VSNetSelectionColor;
						Brush br = new SolidBrush(selColour);
						graphics.FillRectangle(br, 
							selectionBounds.X + 1, selectionBounds.Y, selectionBounds.Width - 4, selectionBounds.Height - 1);
						br.Dispose();						
						graphics.DrawRectangle(SystemPens.Highlight, 
							selectionBounds.X + 1, selectionBounds.Y, selectionBounds.Width - 4, selectionBounds.Height - 1);
					}
				}
			}
			else
			{
				graphics.FillRectangle(SystemBrushes.Window, selectionBounds);
			}

			// Draw the items:			
			if ((this.isGroupRow) || (Owner.ColumnCount <= 1))
			{
				// this item fills the row
				IconComboItemBase.DefaultDrawItem(
					this,
					graphics, imageList, selectionBounds, defaultFont, 
					selected, highlightText, rightToLeft, inList);				
			}
			else
			{
				Rectangle itemBounds = new Rectangle(
					selectionBounds.Location, selectionBounds.Size);
				if (rightToLeft)
				{
					itemBounds.X += itemBounds.Width;
				}

				for (int order = 0; order < Owner.ColumnCount; order++)
				{
					int colIndex = Owner.ColumnIndex(order);
					if ((colIndex > -1) && (order <= this.itemCollection.Count))
					{
						int colWidth = Owner.ColumnWidth(colIndex);
						if (rightToLeft)
						{
							itemBounds.X -= colWidth;
						}
						itemBounds.Width = colWidth;

						// this item
						if (colIndex == 0)
						{
							IconComboItemBase.DefaultDrawItem(
								this,
								graphics, imageList, itemBounds, defaultFont, 
								selected, false, rightToLeft, inList);				
						}
						else
						{
							IconComboSubItem subItem = this.itemCollection[colIndex - 1];
							subItem.Owner = this.Owner;
							subItem.DrawItem(
								graphics, imageList, itemBounds, defaultFont, selected, rightToLeft, inList);
						}

						if ((Owner.GridLines) && (order < Owner.ColumnCount - 1))
						{
							graphics.DrawLine(SystemPens.ControlDark, 
								new Point(itemBounds.Right, itemBounds.Top), new Point(itemBounds.Right, itemBounds.Bottom - 1));
						}

						if (!rightToLeft)
						{
							itemBounds.X += colWidth;
						}

					}
				}
			}		

			if (this.lineAbove)
			{
				graphics.DrawLine(SystemPens.WindowText, 
					bounds.Location, 
					new Point(bounds.X + bounds.Width, bounds.Y));
			}
			if ((this.lineBelow) || (Owner.GridLines))
			{
				graphics.DrawLine(this.LineBelow ? SystemPens.WindowText : SystemPens.ControlDark, 
					new Point(bounds.Left, bounds.Bottom - 1), 
					new Point(bounds.Right, bounds.Bottom - 1));				
			}
		}

		/// <summary>
		/// Measures this item.
		/// </summary>
		/// <param name="graphics">Graphics object to draw to</param>
		/// <param name="imageList">Source of images</param>
		/// <param name="defaultFont">Font to use if the item does not have a font specified</param>
		/// <param name="width">Width to use when calculating height</param>
		/// <returns>The size of the item</returns>
		public override Size MeasureItem(
			Graphics graphics,
			ImageList imageList,
			Font defaultFont,
			int width
			)
		{
			Size itemSize = IconComboItemBase.DefaultMeasureItem(
				this, graphics, imageList, defaultFont, Owner.ColumnWidth(0));
			if ((!this.isGroupRow) && (Owner.ColumnCount > 1))
			{
				// The width is instead related to the column sizes				
				itemSize.Width = 0;
				for (int order = 0; order < Owner.ColumnCount; order++)
				{
					int colIndex = Owner.ColumnIndex(order);
					if ((colIndex > 0) && (order <= this.itemCollection.Count))
					{
						itemSize.Width += Owner.ColumnWidth(colIndex);
					}
				}
			}
			// Measure the text:			
			return itemSize;
		}

		/// <summary>
		/// Constructs a new instance of this class.
		/// </summary>
		public IconComboItem()
		{
			// intentionally blank.
		}
	}
	#endregion

	#region IconComboSubItemCollection 
	/// <summary>
	/// A collection of sub-items associated with an IconComboItem object.
	/// </summary>
	public class IconComboSubItemCollection : ReadOnlyCollectionBase
	{
		private IIconComboBox owner = null;

		/// <summary>
		/// Gets/sets the control which owns this object.
		/// </summary>
		public IIconComboBox Owner
		{
			get
			{
				return this.owner;
			}
			set
			{
				this.owner = value;
			}
		}

		/// <summary>
		/// Adds a new sub item to the collection.
		/// </summary>
		/// <param name="item">Item to add</param>
		/// <returns>Index at which item was added</returns>
		public int Add(IconComboSubItem item)
		{
			item.Owner = owner;
			return this.InnerList.Add(item);
		}

		/// <summary>
		/// Clears the sub-items collection.
		/// </summary>
		public void Clear()
		{
			this.InnerList.Clear();
		}

		/// <summary>
		/// Returns <c>true</c> if the collection contains the specified
		/// object, <c>false</c> otherwise.
		/// </summary>
		/// <param name="item">Item to look for in the collection</param>
		/// <returns><c>true</c> if the collection contains the specified
		/// object, <c>false</c> otherwise.</returns>
		public bool Contains(IconComboSubItem item)
		{
			return this.InnerList.Contains(item);
		}

		/// <summary>
		/// Returns the 0-based index of the specified item in the collection,
		/// or -1 if it is not found.
		/// </summary>
		/// <param name="item">Item to look for</param>
		/// <returns>0-based index of item if found, -1 otherwise.</returns>
		public int IndexOf(IconComboSubItem item)
		{
			return this.InnerList.IndexOf(item);
		}

		/// <summary>
		/// Inserts the item at the specified 0-based index.
		/// </summary>
		/// <param name="index">Index to insert at.</param>
		/// <param name="item">Item to insert.</param>
		public void Insert(int index, IconComboSubItem item)
		{
			item.Owner = this.owner;
			this.InnerList.Insert(index, item);
		}

		/// <summary>
		/// Removes the specified item.
		/// </summary>
		/// <param name="item">Item to remove</param>
		public void Remove(IconComboSubItem item)
		{
			this.InnerList.Remove(item);		
		}

		/// <summary>
		/// Removes the item with the specified index.
		/// </summary>
		/// <param name="index">Index of item to remove</param>
		public void RemoveAt(int index)
		{
			this.InnerList.RemoveAt(index);
		}
	
		/// <summary>
		/// Gets the item with the specified 0-based index.
		/// </summary>
		public IconComboSubItem this[int index]
		{
			get
			{
				return (IconComboSubItem) this.InnerList[index];
			}
		}

		/// <summary>
		/// Constructs a new instance of this class.
		/// </summary>
		public IconComboSubItemCollection() : base()
		{
		}

	}
	#endregion

	#region IconComboSubItem 
	/// <summary>
	/// An sub-item to display in the IconComboBox control.
	/// </summary>
	public class IconComboSubItem : IconComboItemBase
	{

		/// <summary>
		/// Draws this item.
		/// Used internally to draw the ListBox.
		/// </summary>
		/// <param name="graphics">Graphics object to draw to</param>
		/// <param name="imageList">Source of images</param>
		/// <param name="bounds">Bounding rectangle for the item</param>
		/// <param name="defaultFont">Font to use if the item does not have a font specified</param>
		/// <param name="selected">Whether the item should be rendered selected or not</param>
		/// <param name="rightToLeft">Whether item should be rendered right-to-left</param>
		/// <param name="inList">Whether the item to be drawn is in the list portion or the combo portion</param>
		public override void DrawItem(
			Graphics graphics,
			ImageList imageList,
			Rectangle bounds,
			Font defaultFont,
			bool selected,
			bool rightToLeft,
			bool inList
			)
		{
			IconComboItemBase.DefaultDrawItem(
				this,
				graphics, imageList, bounds, defaultFont, 
				selected, false, rightToLeft, inList);
		}

		/// <summary>
		/// Measures this item.
		/// </summary>
		/// <param name="graphics">Graphics object to draw to</param>
		/// <param name="imageList">Source of images</param>
		/// <param name="defaultFont">Font to use if the item does not have a font specified</param>
		/// <param name="width">Width to use when evaluating wrapped text height</param>
		/// <returns>The size of the item</returns>
		public override Size MeasureItem(
			Graphics graphics,
			ImageList imageList,
			Font defaultFont,
			int width
			)
		{
			return IconComboItemBase.DefaultMeasureItem(
				this,
				graphics, imageList, defaultFont, width);
		}

		/// <summary>
		/// Constructs a new instance of this class.
		/// </summary>
		public IconComboSubItem()
		{
			// intentionally blank.
		}
	}
	#endregion


	#region IconComboItemBase
	/// <summary>
	/// An abstract base class from which the IconComboItem and 
	/// the IconComboSubItem classes derive.  Provides common
	/// functionality associated with drawing, measurement and
	/// the setting of the display properties of the item.
	/// </summary>
	public abstract class IconComboItemBase : IComparable, IDisposable, IIconComboItem
	{

		#region Member Variables
		private object text = null;
		private string textFormat = "";
		private int iconIndex = -1;
		private StringFormat stringFormat = null;
		private Font font = null;
		private Color foreColor = Color.Empty;
		private Color backColor = Color.Empty;
		private int height = 0;
		private bool autoHeight = true;
		private object tag = null;
		private IIconComboBox owner = null;		
		#endregion

		/// <summary>
		/// Gets/sets the control which owns the item.
		/// Called automatically when the item is added to
		/// the control.
		/// </summary>
		public IIconComboBox Owner
		{
			get
			{
				return this.owner;
			}
			set
			{
				this.owner = value;
			}
		}
		/// <summary>
		/// Compares the current instance with another object of the same type.
		/// The class attempts to use the CompareTo method of the text object
		/// for comparision.  If this is not available, the ToString() method 
		/// of this class is used for comparison.
		/// </summary>
		/// <param name="obj">An object to compare with this instance.</param>
		/// <returns>A 32-bit signed integer that indicates the relative order of the comparands.  
		/// The return value has these meanings:
		/// Less than zero This instance is less than obj.  
		/// Zero This instance is equal to obj.  
		/// Greater than zero This instance is greater than obj.</returns>
		public virtual int CompareTo ( object obj )
		{
			int res = 0;
			try
			{
				bool doDefault = false;
				IComparable icThis = null;
				try
				{
					icThis = (IComparable)this.text;
				}
				catch
				{
					doDefault = true;
				}
				if (doDefault)
				{
					res = this.ToString().CompareTo(obj.ToString());
				}
				else
				{
					res = icThis.CompareTo(((IconComboItemBase)obj).Text);
				}
			}
			catch (Exception ex)
			{
				Console.WriteLine("Exception {0}", ex);
			}
			return res;
		}
			
		/// <summary>
		/// Gets/sets the text to display for this item.
		/// Defaults to no text.  The ToString method of the
		/// object will be used to render it unless a TextFormat
		/// string is set, in which case the String.Format method
		/// will be invoked.
		/// </summary>
		public object Text
		{
			get
			{
				return this.text;
			}
			set
			{
				this.text = value;
				OnItemChanged();
			}
		}

		/// <summary>
		/// Returns the text of the item.
		/// </summary>
		/// <returns>The text for the item</returns>
		public override string ToString()
		{
			if (this.text != null)
			{
				if (this.textFormat.Length > 0)
				{
					return String.Format(textFormat, this.text);
				}
				else
				{
					return this.text.ToString();
				}
			}
			else
			{
				return "";
			}
		}


		/// <summary>
		/// Gets/sets the text format to use when rendering the text, for example {0:X8}
		/// </summary>
		public string TextFormat
		{
			get
			{
				return this.textFormat;
			}
			set
			{
				this.textFormat = value;
				OnItemChanged();
			}
		}

		/// <summary>
		/// Gets/sets the index of the icon within the ImageList
		/// to display for this item.  Set to -1 for no icon.
		/// Defaults to -1.
		/// </summary>
		public int Icon
		{
			get
			{
				return this.iconIndex;
			}
			set
			{
				this.iconIndex = value;
				OnItemChanged();
			}
		}

		/// <summary>
		/// Gets/sets a specific string format to use
		/// when drawing this item.  Set to null to 
		/// use default text rendering.  Defaults to 0
		/// </summary>		
		public System.Drawing.StringFormat StringFormat
		{
			get
			{
				return this.stringFormat;
			}
			set
			{
				this.stringFormat = value;
				OnItemChanged();
			}
		}
		/// <summary>
		/// Gets/sets a specific font to use
		/// when drawing this item.  When null, the 
		/// owner ListBox font is used for drawing.
		/// Default is null.
		/// </summary>
		public System.Drawing.Font Font
		{
			get
			{
				return this.font;
			}
			set
			{
				this.font = value;
				OnItemChanged();
			}
		}		
		/// <summary>
		/// Gets/sets a customised foreground
		/// color for this item.  Default is
		/// WindowText.
		/// </summary>
		public Color ForeColor
		{
			get
			{
				return this.foreColor;
			}
			set
			{
				this.foreColor = value;
				OnItemChanged();
			}
		}
		/// <summary>
		/// Gets/sets a customised background
		/// color for this item.  Default is
		/// WindowBackground.
		/// </summary>
		public Color BackColor
		{
			get
			{
				return this.backColor;
			}
			set
			{
				this.backColor = value;
				OnItemChanged();
			}
		}
		/// <summary>
		/// Gets/sets an object associated with the item.
		/// </summary>
		public object Tag
		{
			get
			{
				return this.tag;
			}
			set
			{
				this.tag = value;
				OnItemChanged();
			}
		}
		/// <summary>
		/// Gets/sets the height of this item
		/// </summary>
		public int Height
		{
			get
			{
				return this.height;
			}
			set
			{
				if (this.autoHeight)
				{
					throw new InvalidOperationException("Cannot set height when AutoHeight property is True");
				}
				else
				{
					this.height = value;
					OnHeightChanged();
				}
			}
		}

		/// <summary>
		/// Gets/sets whether the height of this item is automatically calculated
		/// from its contents, or using the Height property.
		/// </summary>
		public bool AutoHeight
		{
			get
			{
				return this.autoHeight;
			}
			set
			{
				this.autoHeight = value;
			}
		}

		/// <summary>
		/// Called whenever a sizing property is changed
		/// </summary>
		protected virtual void OnHeightChanged()
		{
			if (this.owner != null)
			{
				this.owner.OnItemHeightChanged(this);
			}
		}

		/// <summary>
		/// Called whenever a non-sizing property is changed
		/// </summary>
		protected virtual void OnItemChanged()
		{
			if (this.owner != null)
			{
				this.owner.OnItemChanged(this);
			}
		}

		/// <summary>
		/// Draws this item.
		/// Used internally to draw the ListBox.
		/// </summary>
		/// <param name="graphics">Graphics object to draw to</param>
		/// <param name="imageList">Source of images</param>
		/// <param name="bounds">Bounding rectangle for the item</param>
		/// <param name="defaultFont">Font to use if the item does not have a font specified</param>
		/// <param name="selected">Whether the item should be rendered selected or not</param>
		/// <param name="rightToLeft">Whether item should be rendered right-to-left</param>
		/// <param name="inList">Whether the item to be drawn is in the list portion or the combo portion</param>
		public abstract void DrawItem(
			Graphics graphics,
			ImageList imageList,
			Rectangle bounds,
			Font defaultFont,
			bool selected,			
			bool rightToLeft,
			bool inList
			);

		/// <summary>
		/// Draws an item.
		/// Used internally to draw the ListBox.
		/// </summary>
		/// <param name="iconComboItem">The IconCombo Item to draw</param>
		/// <param name="graphics">Graphics object to draw to</param>
		/// <param name="imageList">Source of images</param>
		/// <param name="bounds">Bounding rectangle for the item</param>
		/// <param name="defaultFont">Font to use if the item does not have a font specified</param>
		/// <param name="selected">Whether the item should be rendered selected or not</param>
		/// <param name="highlightText">If selected, then highlight the text background</param>
		/// <param name="rightToLeft">Whether item should be rendered right-to-left</param>
		/// <param name="inList">Whether the item to be drawn is in the list portion or the combo portion</param>		
		public static void DefaultDrawItem(
			IconComboItemBase iconComboItem,
			Graphics graphics,
			ImageList imageList,
			Rectangle bounds,
			Font defaultFont,
			bool selected,
			bool highlightText,
			bool rightToLeft,
			bool inList
			)
		{
			if ((bounds.Width == 0) || (bounds.Height ==0))
			{
				return;
			}

			Rectangle drawRect = new Rectangle(
				bounds.Location, bounds.Size);

			// The default font:
			Font drawFont = iconComboItem.font;
			if (drawFont == null)
			{
				drawFont = defaultFont;
			}

			// Background colour?
			if (!iconComboItem.backColor.Equals(Color.Empty))
			{
				Brush backBrush = new SolidBrush(iconComboItem.backColor);
				graphics.FillRectangle(backBrush, drawRect);
			}

			// Draw icon if necessary:
			if ((iconComboItem.iconIndex > -1) && (imageList != null))
			{
				int iconY = drawRect.Top + (drawRect.Height - imageList.ImageSize.Height) / 2;
				int iconX = drawRect.Left;
				if (rightToLeft)
				{
					iconX += drawRect.Width - 2 - imageList.ImageSize.Width;
					imageList.Draw(graphics, iconX, iconY, iconComboItem.iconIndex);
				}
				else
				{
					iconX += 2;
					imageList.Draw(graphics, iconX, iconY, iconComboItem.iconIndex);
					drawRect.X += 4 + imageList.ImageSize.Width;
				}
				drawRect.Width -= (4 + imageList.ImageSize.Width);
			}

			// Draw text:
			String text = iconComboItem.ToString();

			Brush itemBrush;
			if (selected)
			{
				if (iconComboItem.Owner.HighlightStyle == IconComboBox.DrawingStyle.Standard)
				{
					itemBrush = new SolidBrush(Color.FromKnownColor(KnownColor.HighlightText));
				}
				else
				{
					itemBrush = new SolidBrush(Color.FromKnownColor(KnownColor.WindowText));
				}
			}
			else
			{
				if (iconComboItem.foreColor == Color.Empty)
				{
					itemBrush = new SolidBrush(Color.FromKnownColor(KnownColor.WindowText));
				}
				else
				{
					itemBrush= new SolidBrush(iconComboItem.foreColor);
				}
			}
			
			StringFormat format = iconComboItem.stringFormat;
			if (format == null)
			{
				format = new StringFormat();
				format.Alignment = StringAlignment.Near;
				//format.Alignment = StringAlignment.Far;
				format.LineAlignment = StringAlignment.Center;
				format.FormatFlags = StringFormatFlags.LineLimit | StringFormatFlags.NoWrap;
				format.Trimming = StringTrimming.EllipsisCharacter;
			}
			RectangleF textRect = new RectangleF(
				(float) drawRect.X, (float) drawRect.Y, (float) drawRect.Width, (float) drawRect.Height);

			if (highlightText)
			{
				SizeF measuredSize = graphics.MeasureString(text, drawFont, (int)textRect.Width, format);
				if (measuredSize.Height > (drawRect.Height - 2))
				{
					measuredSize.Height = (float) (drawRect.Height - 2);
				}
				if (iconComboItem.Owner.HighlightStyle == IconComboBox.DrawingStyle.Standard)
				{
					graphics.FillRectangle(SystemBrushes.Highlight, 
						drawRect.X, drawRect.Y + (textRect.Height - measuredSize.Height - 2) / 2, 
						measuredSize.Width, measuredSize.Height + 2);
				}
				else
				{
					if (!inList)
					{
						measuredSize.Height -= 2;
					}
					Brush br = new SolidBrush(IconComboItemBase.VSNetSelectionColor);
					graphics.FillRectangle(br, 
						drawRect.X, drawRect.Y + (textRect.Height - measuredSize.Height - 2) / 2, 
						measuredSize.Width, measuredSize.Height + 2);
					br.Dispose();
					graphics.DrawRectangle(SystemPens.Highlight,
						drawRect.X, drawRect.Y + (textRect.Height - measuredSize.Height - 2) / 2, 
						measuredSize.Width, measuredSize.Height + 2);
					
				}
			}

			// Draw the text:
			graphics.DrawString(
				text,
				drawFont,
				itemBrush,
				textRect,
				format);

			itemBrush.Dispose();
			if (iconComboItem.stringFormat == null)
			{
				format.Dispose();
			}


		}

		/// <summary>
		/// Measures this item.
		/// </summary>
		/// <param name="graphics">Graphics object to draw to</param>
		/// <param name="imageList">Source of images</param>
		/// <param name="defaultFont">Font to use if the item does not have a font specified</param>
		/// <param name="width">Width of item</param>
		/// <returns>The Size of the item</returns>
		public abstract Size MeasureItem(
			Graphics graphics,
			ImageList imageList,
			Font defaultFont,
			int width
			);

		/// <summary>
		/// Measures this item.
		/// </summary>
		/// <param name="iconComboItem">The IconCombo Item to draw</param>
		/// <param name="graphics">Graphics object to draw to</param>
		/// <param name="imageList">Source of images</param>
		/// <param name="defaultFont">Font to use if the item does not have a font specified</param>
		/// <param name="width">Width to use when measuring (allows multi-line items to wrap)</param>
		/// <returns>The Size of the item</returns>
		public static Size DefaultMeasureItem(
			IconComboItemBase iconComboItem,
			Graphics graphics,
			ImageList imageList,
			Font defaultFont,
			int width
			)
		{
			Size size = new Size(18, 18);
			if (imageList != null)
			{
				size.Width = imageList.ImageSize.Width + 4;
			}

			Font drawFont = iconComboItem.Font;
			if (drawFont == null)
			{
				drawFont = defaultFont;
			}
			StringFormat format = iconComboItem.stringFormat;
			if (format == null)
			{
				format = new StringFormat();				
				format.LineAlignment = StringAlignment.Center;
				format.FormatFlags = StringFormatFlags.LineLimit | StringFormatFlags.NoWrap;
				format.Trimming = StringTrimming.EllipsisCharacter;
			}
			SizeF textSize = graphics.MeasureString(
				iconComboItem.ToString(),
				drawFont,
				width,
				format);

			if (iconComboItem.AutoHeight)
			{			
				if (imageList != null)
				{
					size.Height = imageList.ImageSize.Height + 4;
				}
				if (size.Height < ((int) textSize.Height + 4))
				{
					size.Height = (int) textSize.Height + 4;
				}
			}
			else
			{
				size.Height = iconComboItem.Height;
			}

			return size;
		}

		/// <summary>
		/// Returns the selection colour used in VS.NET and Office 10 combo boxes.
		/// </summary>
		public static Color VSNetSelectionColor
		{
			get
			{
				return BlendColor(Color.FromKnownColor(KnownColor.Highlight), Color.FromKnownColor(KnownColor.Window), 80);
			}
		}

		/// <summary>
		/// Blends two colours together using the specified alpha amount.
		/// </summary>
		/// <param name="source">Source colour.</param>
		/// <param name="dest">Destination colour.</param>
		/// <param name="alpha">Alpha amount to use when blending.</param>
		/// <returns>The alpha blended colour.</returns>
		public static Color BlendColor(Color source, Color dest, int alpha)
		{
			return Color.FromArgb( 
				((source.R * alpha) / 255) + ((dest.R * (255 - alpha)) / 255),
				((source.G * alpha) / 255) + ((dest.G * (255 - alpha)) / 255), 
				((source.B * alpha) / 255) + ((dest.B * (255 - alpha)) / 255));
		}

		/// <summary>
		/// Construct a new instance of this type
		/// </summary>
		public IconComboItemBase()
		{			
		}

		/// <summary>
		/// Disposes of any resources associated with the object
		/// </summary>
		public void Dispose()
		{
			if (this.stringFormat != null)
			{
				this.stringFormat.Dispose();
				this.stringFormat = null;
			}
		}
	}
	#endregion

	#region TextBoxMarginCustomise
	/// <summary>
	/// A class for adding right and left margins to a TextBox
	/// or the embedded TextBox within a DropDown ComboBox.
	/// The margin can display an icon, a control or can
	/// be drawn using a custom routine implemented by the
	/// user.  This version also contains code to allow
	/// return and escape to be processed correctly in a
	/// ComboBox
	/// </summary>
	public class TextBoxMarginCustomise : NativeWindow
	{
		#region UnmanagedMethods
		[StructLayout(LayoutKind.Sequential)]
			private struct RECT
		{
			public int left;
			public int top;
			public int right;
			public int bottom;
		}
		
		[DllImport("user32", CharSet=CharSet.Auto)]
		private extern static int SendMessage(
			IntPtr hwnd, 
			int wMsg,
			int wParam, 
			int lParam);
		[DllImport("user32", CharSet=CharSet.Auto)]
		private extern static IntPtr FindWindowEx(
			IntPtr hwndParent, 
			IntPtr hwndChildAfter,
			[MarshalAs(UnmanagedType.LPTStr)]
			string lpszClass,
			[MarshalAs(UnmanagedType.LPTStr)]
			string lpszWindow);
		[DllImport("user32", CharSet=CharSet.Auto)]
		private extern static int GetWindowLong(
			IntPtr hWnd,
			int dwStyle);
		[DllImport("user32")]
		private extern static IntPtr GetDC(
			IntPtr hwnd);
		[DllImport("user32")]
		private extern static int ReleaseDC (
			IntPtr hwnd, 
			IntPtr hdc);
		[DllImport("user32")]
		private extern static int GetClientRect (
			IntPtr hwnd,
			ref RECT rc);
		[DllImport("user32")]
		private extern static int GetWindowRect (
			IntPtr hwnd,
			ref RECT rc);
		[DllImport("user32")]
		private extern static IntPtr GetParent (
			IntPtr hwnd);

		private const int EC_LEFTMARGIN = 0x1;
		private const int EC_RIGHTMARGIN = 0x2;
		private const int EC_USEFONTINFO = 0xFFFF;
		private const int EM_SETMARGINS = 0xD3;
		private const int EM_GETMARGINS = 0xD4;

		private const int WM_PAINT = 0xF;
		
		private const int WM_SETFOCUS = 0x7;
		private const int WM_KILLFOCUS = 0x8;

		private const int WM_SETFONT = 0x30;

		private const int WM_MOUSEMOVE = 0x200;
		private const int WM_LBUTTONDOWN = 0x201;
		private const int WM_RBUTTONDOWN = 0x204;
		private const int WM_MBUTTONDOWN = 0x207;
		private const int WM_LBUTTONUP = 0x202;
		private const int WM_RBUTTONUP = 0x205;
		private const int WM_MBUTTONUP = 0x208;
		private const int WM_LBUTTONDBLCLK = 0x203;
		private const int WM_RBUTTONDBLCLK = 0x206;
		private const int WM_MBUTTONDBLCLK = 0x209;

		private const int WM_KEYDOWN = 0x0100;
		private const int WM_KEYUP = 0x0101;
		private const int WM_CHAR = 0x0102;

		private const int CB_GETDROPPEDSTATE = 0x157;

		private const int GWL_EXSTYLE = (-20);
		private const int WS_EX_RIGHT             = 0x00001000;
		private const int WS_EX_LEFT              = 0x00000000;
		private const int WS_EX_RTLREADING        = 0x00002000;
		private const int WS_EX_LTRREADING        = 0x00000000;
		private const int WS_EX_LEFTSCROLLBAR     = 0x00004000;
		private const int WS_EX_RIGHTSCROLLBAR    = 0x00000000;

		#endregion

		#region Member Variables
		private System.Windows.Forms.ImageList imageList = null;
		private int icon = -1;
		private Control control = null;
		private ITextBoxMarginCustomisePainter customPainter = null;		
		private int customWidth = 0;
		#endregion 

		#region Events
		/// <summary>
		/// Raised when a return or escape key is pressed in the combo box
		/// edit portion.
		/// </summary>
		public event KeyEventHandler ComboEditKeyDown;
		#endregion 

		/// <summary>
		/// Gets whether a Window is <c>RightToLeft.Yes</c> from
		/// its <c>Handle</c>.
		/// </summary>
		/// <param name="handle">Handle of window to check.</param>
		/// <returns><c>True</c> if Window is RightToLeft, <c>False</c> otherwise.</returns>
		private static bool IsRightToLeft(IntPtr handle)
		{
			int style = GetWindowLong(handle, GWL_EXSTYLE);
			return (
				((style & WS_EX_RIGHT) == WS_EX_RIGHT) ||
				((style & WS_EX_RTLREADING) == WS_EX_RTLREADING) ||
				((style & WS_EX_LEFTSCROLLBAR) == WS_EX_LEFTSCROLLBAR));	
		}

		/// <summary>
		/// Gets the far margin of a TextBox control or the
		/// TextBox contained within a ComboBox.
		/// </summary>
		/// <param name="ctl">The Control to get the far margin
		/// for</param>
		/// <returns>Far margin, in pixels.</returns>
		public static int FarMargin(Control ctl)
		{
			IntPtr handle = ctl.Handle;
			if (typeof(System.Windows.Forms.ComboBox).IsAssignableFrom(ctl.GetType()))
			{
				handle = ComboEdithWnd(handle);
			}
			return FarMargin(handle);
		}
		
		private static int FarMargin(IntPtr handle)
		{
			int farMargin = SendMessage(handle, EM_GETMARGINS, 0, 0);			
			if (IsRightToLeft(handle))
			{
				farMargin = farMargin & 0xFFFF;
			}
			else
			{
				farMargin = (farMargin / 0x10000);
			}
			return farMargin;
		}


		/// <summary>
		/// Sets the far margin of a TextBox control or the
		/// TextBox contained within a ComboBox.
		/// </summary>
		/// <param name="ctl">The Control to set the far margin
		/// for</param>
		/// <param name="margin">New far margin in pixels, or -1
		/// to use the default far margin.</param>
		public static void FarMargin(Control ctl, int margin)
		{
			IntPtr handle = ctl.Handle;
			if (typeof(System.Windows.Forms.ComboBox).IsAssignableFrom(ctl.GetType()))
			{
				handle = ComboEdithWnd(handle);
			}
			FarMargin(handle, margin);
		}

		private static void FarMargin(IntPtr handle, int margin)
		{
			int message = IsRightToLeft(handle) ? EC_LEFTMARGIN : EC_RIGHTMARGIN;
			if (message == EC_LEFTMARGIN)
			{
				margin = margin & 0xFFFF;
			}
			else
			{
				margin = margin * 0x10000;
			}
			SendMessage(handle, EM_SETMARGINS, message, margin);
		}

		/// <summary>
		/// Gets the near margin of a TextBox control or the
		/// TextBox contained within a ComboBox.
		/// </summary>
		/// <param name="ctl">The Control to get the near margin
		/// for</param>
		/// <returns>Near margin, in pixels.</returns>
		public static int NearMargin(Control ctl)
		{
			IntPtr handle = ctl.Handle;
			if (typeof(System.Windows.Forms.ComboBox).IsAssignableFrom(ctl.GetType()))
			{
				handle = ComboEdithWnd(handle);
			}
			return NearMargin(handle);
		}

		private static int NearMargin(IntPtr handle)
		{
			int nearMargin = SendMessage(handle, EM_GETMARGINS, 0, 0);
			if (IsRightToLeft(handle))
			{
				nearMargin = nearMargin / 0x10000;
			}
			else
			{
				nearMargin = nearMargin & 0xFFFF;
			}		
			return nearMargin;
		}

		/// <summary>
		/// Sets the near margin of a TextBox control or the
		/// TextBox contained within a ComboBox.
		/// </summary>
		/// <param name="ctl">The Control to set the near margin
		/// for</param>
		/// <param name="margin">New near margin in pixels, or -1
		/// to use the default near margin.</param>
		public static void NearMargin(Control ctl, int margin)
		{			
			IntPtr handle = ctl.Handle;
			if (typeof(System.Windows.Forms.ComboBox).IsAssignableFrom(ctl.GetType()))
			{
				handle = ComboEdithWnd(handle);
			}
			NearMargin(handle, margin);
		}

		private static void NearMargin(IntPtr handle, int margin)
		{
			int message = IsRightToLeft(handle) ? EC_RIGHTMARGIN : EC_LEFTMARGIN;
			if (message == EC_LEFTMARGIN)
			{
				margin = margin & 0xFFFF;
			}
			else
			{
				margin = margin * 0x10000;
			}
			SendMessage(handle, EM_SETMARGINS, message, margin);
		}

		/// <summary>
		/// Gets the handle of the TextBox contained within a 
		/// ComboBox control.
		/// </summary>
		/// <param name="handle">The ComboBox window handle.</param>
		/// <returns>The handle of the contained text box.</returns>
		public static IntPtr ComboEdithWnd(IntPtr handle)
		{
			handle = FindWindowEx(handle, IntPtr.Zero, "EDIT", "\0");
			return handle;
		}

		/// <summary>
		/// Attaches an instance of this class to a ComboBox control.
		/// The control must have the "DropDown" style so it has a 
		/// TextBox.
		/// </summary>
		/// <param name="comboBox">ComboBox with DropDown style to
		/// attach to.</param>
		/// <remarks>Use the <see cref="System.Windows.Forms.NativeWindow.AssignHandle"/> method to attach 
		/// this class to an arbitrary TextBox control using its
		/// handle.</remarks>
		public void Attach(System.Windows.Forms.ComboBox comboBox)
		{
			if (!this.Handle.Equals(IntPtr.Zero))
			{
				this.ReleaseHandle();
			}
			IntPtr handle = ComboEdithWnd(comboBox.Handle);
			this.AssignHandle(handle);
			setMargin();
		}

		/// <summary>
		/// Attaches an instance of this class to a TextBox control.
		/// </summary>
		/// <param name="textBox">TextBox to attach to.</param>
		/// <remarks>Use the <see cref="System.Windows.Forms.NativeWindow.AssignHandle"/> method to attach 
		/// this class to an arbitrary TextBox control using its
		/// handle.</remarks>
		public void Attach(System.Windows.Forms.TextBox textBox)
		{
			if (!this.Handle.Equals(IntPtr.Zero))
			{
				this.ReleaseHandle();
			}
			this.AssignHandle(textBox.Handle);
			setMargin();
		}

		/// <summary>
		/// Gets/sets the ImageList used to draw icons in the control.
		/// </summary>
		public System.Windows.Forms.ImageList ImageList
		{
			get
			{
				return this.imageList;
			}
			set
			{
				this.imageList = value;
				setMargin();
			}
		}

		/// <summary>
		/// Gets/sets the 0-based icon index to draw in the control.
		/// Values &lt; 0 have special meanings. -1 erases the 
		/// icon, and &lt; -1 draws a colour sample box.
		/// </summary>
		public int Icon
		{
			get
			{
				return this.icon;
			}
			set
			{
				this.icon = value;
				setMargin();
			}
		}

		/// <summary>
		/// Gets/sets the control to be displayed in the near margin.
		/// The <see cref="ImageList"/> property must be <c>null</c> if you
		/// want to display a control.
		/// </summary>
		public System.Windows.Forms.Control Control
		{
			get
			{
				return this.control;
			}
			set
			{
				this.control = value;
				setMargin();
			}
		}
	

		/// <summary>
		/// Gets/sets a class which implements the <see cref="ITextBoxMarginCustomisePainter "/>
		/// interface to perform customised painting in the margin.
		/// The <see cref="ImageList"/> and <see cref="Control"/> properties must 
		/// be <c>null</c> if you want to use this technique.
		/// </summary>
		public ITextBoxMarginCustomisePainter CustomPainter
		{
			get
			{
				return this.customPainter;
			}
			set
			{
				this.customPainter = value;
				setMargin();
			}
		}
		

		/// <summary>
		/// Sets the near margin to accommodate the specified control.
		/// </summary>
		private void setMargin()
		{
			if (!this.Handle.Equals(IntPtr.Zero))
			{
				if (this.control != null)
				{
					NearMargin(this.Handle, this.control.Width + 4);
					moveControl();
				}
				else if (this.imageList != null)
				{
					NearMargin(this.Handle, this.imageList.ImageSize.Width + 4);
				}
				else if (this.customPainter != null)
				{
					this.customWidth = this.customPainter.GetMarginWidth();
					NearMargin(this.Handle, this.customWidth);
				}
			}
		}

		/// <summary>
		/// Moves the contained control to the appropriate 
		/// position
		/// </summary>
		private void moveControl()
		{
			if (this.control != null)
			{
				Point currentLocation = this.control.Location;
				RECT rcWindow = new RECT();
				GetWindowRect(this.Handle, ref rcWindow);
				Point moveTo = new Point(rcWindow.left + 2, 
					rcWindow.top + ((rcWindow.bottom - rcWindow.top) - this.control.Height) / 2);
				if (IsRightToLeft(this.Handle))
				{
					moveTo.X = rcWindow.right - this.control.Width - 2;
				}
				moveTo = this.control.Parent.PointToClient(moveTo);
				if (!currentLocation.Equals(moveTo))
				{
					this.control.Location = moveTo;
					this.control.BringToFront();
				}
			}
		}
			
		/// <summary>
		/// Calls the base WndProc and performs WM_PAINT
		/// processing to draw the icon if necessary.
		/// </summary>
		/// <param name="m">Windows Message</param>
		protected override void WndProc(ref Message m)
		{
			if (this.control == null)
			{
				switch (m.Msg)
				{
					case WM_SETFONT:
						base.WndProc(ref m);
						setMargin();
						break;

					case WM_PAINT:
						base.WndProc(ref m);
						RePaint();
						break;

					case WM_SETFOCUS: 
					case WM_KILLFOCUS:
						base.WndProc(ref m);
						RePaint();
						break;

					case WM_LBUTTONDOWN:
					case WM_RBUTTONDOWN:
					case WM_MBUTTONDOWN:
						base.WndProc(ref m);
						RePaint();
						break;

					case WM_LBUTTONUP:
					case WM_RBUTTONUP:
					case WM_MBUTTONUP:
						base.WndProc(ref m);
						RePaint();
						break;

					case WM_LBUTTONDBLCLK:
					case WM_RBUTTONDBLCLK:
					case WM_MBUTTONDBLCLK:
						base.WndProc(ref m);
						RePaint();
						break;

					case WM_KEYDOWN:
					case WM_KEYUP:
						base.WndProc(ref m);
						RePaint();
						break;

					case WM_CHAR:
						RePaint();
						if ((((int) m.WParam) == 0x1B) || (((int) m.WParam) == 0xD))
						{
							if (SendMessage(GetParent(m.HWnd), CB_GETDROPPEDSTATE, 0, 0) != 0)
							{
								base.WndProc(ref m);
							}
							else
							{
								if (this.ComboEditKeyDown != null)
								{
									Keys keyData = Keys.None;
									if (((int) m.WParam) == 0x1B) 
									{
										keyData = Keys.Escape;
									}
									else if (((int) m.WParam) == 0xD)
									{
										keyData = Keys.Return; 
									}
									this.ComboEditKeyDown(this, new KeyEventArgs(keyData));
								}
								m.Result = IntPtr.Zero;
							}
						}
						else
						{
							base.WndProc(ref m);
						}
						break;

					case WM_MOUSEMOVE:
						base.WndProc(ref m);
						if (!m.WParam.Equals(IntPtr.Zero))
						{
							RePaint();
						}
						break;
					
					default:
						base.WndProc(ref m);
						break;
				}
			}
			else
			{
				base.WndProc(ref m);

				switch (m.Msg)
				{
					case WM_PAINT:
						moveControl();
						break;
				}
			}
		}

		/// <summary>
		/// Paints the control if necessary:
		/// </summary>
		private void RePaint()
		{

			if ((this.ImageList != null) ||
				(this.customPainter != null))
			{
				RECT rcClient = new RECT();
				GetClientRect(this.Handle, ref rcClient);
				bool rightToLeft = IsRightToLeft(this.Handle);

				IntPtr handle = this.Handle;
				IntPtr hdc = GetDC(handle);
				Graphics gfx = Graphics.FromHdc(hdc);
				
				if (this.customPainter == null)
				{
					int itemSize = this.imageList.ImageSize.Height;
					Point pt = new Point(0, rcClient.top + (rcClient.bottom - rcClient.top - itemSize) / 2);
					if (rightToLeft)
					{
						pt.X = rcClient.right - itemSize - 2;	
					}
					else
					{
						pt.X = 2;
					}
					if (this.icon > -1)
					{
						gfx.SetClip(new Rectangle(pt.X, pt.Y, this.imageList.ImageSize.Width, this.imageList.ImageSize.Height - 4));
						this.imageList.Draw(gfx, pt, icon);	
						gfx.ResetClip();
					}
					else
					{
						gfx.FillRectangle(SystemBrushes.Window, pt.X, pt.Y, this.imageList.ImageSize.Width, this.imageList.ImageSize.Height + 1);
					}
				}
				else
				{
					Rectangle rcDraw = new Rectangle(
						new Point(0, 0), new Size(this.customWidth, rcClient.bottom - rcClient.top));
					this.customPainter.Draw(gfx, rcDraw, rightToLeft);
				}

				gfx.Dispose();
				ReleaseDC(handle, hdc);
			}

		}

		/// <summary>
		/// Constructs a new instance of this class
		/// </summary>
		public TextBoxMarginCustomise()
		{
			// intentionally blank
		}

	}
	#endregion

	#region ITextBoxMarginCustomisePainter
	/// <summary>
	/// An interface which users of the <see cref="TextBoxMarginCustomise"/>
	/// class can use to provide a customised painting routine for the
	/// margin area.  Create an instance of this class and install it
	/// using the <see cref="TextBoxMarginCustomise.CustomPainter"/>
	/// accessor.
	/// </summary>
	public interface ITextBoxMarginCustomisePainter
	{
		/// <summary>
		/// Called to obtain the width of the margin.
		/// </summary>
		/// <returns>Width of the margin</returns>
		int GetMarginWidth();

		/// <summary>
		/// Called whenever the margin area needs to
		/// be repainted.
		/// </summary>
		/// <param name="gfx">Graphics object to paint on.</param>
		/// <param name="rcDraw">Boundary of margin area.</param>
		/// <param name="rightToLeft">Whether the control is right 
		/// to left or not</param>
		void Draw(Graphics gfx, Rectangle rcDraw, bool rightToLeft);
	}
	#endregion
	
