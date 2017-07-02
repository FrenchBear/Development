Option Strict On
Option Explicit On 
'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
Imports System.ComponentModel
Imports System.Runtime.InteropServices
'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

Namespace Controls
	Public Enum FocusDirection
		Backward = 0
		Forward = 1
	End Enum

	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Misc Classes"

	Public Class FocusChangeEventArgs : Inherits System.EventArgs

		Protected Friend _Direction As FocusDirection = FocusDirection.Forward
		Public Handled As Boolean

		Public ReadOnly Property Direction() As FocusDirection
			Get
				Return _Direction
			End Get
		End Property

		Friend Sub New(ByVal Direction As FocusDirection)
			_Direction = Direction
		End Sub
	End Class

#End Region
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>


	'ComboBox Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	<ToolboxItem(True), DefaultEvent("ActiveItemChanged")> _
	Public Class BaseComboBox : Inherits System.Windows.Forms.ComboBox
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Declarations"

		'API Declarations
		Private Declare Ansi Function GetWindowLong Lib "user32.dll" Alias "GetWindowLongA" (ByVal Handle As IntPtr, ByVal nIndex As Integer) As Integer
		Private Declare Ansi Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As IntPtr, ByVal Msg As Integer, ByVal wParam As Integer, ByVal lParam As Integer) As Integer
		Private Declare Ansi Function SetWindowLong Lib "user32.dll" Alias "SetWindowLongA" (ByVal Handle As IntPtr, ByVal nIndex As Integer, ByVal dwNewLong As Integer) As Integer
		Private Declare Auto Function SetWindowPos Lib "user32" (ByVal Handle As IntPtr, ByVal hWndInsertAfter As Integer, ByVal x As Integer, ByVal y As Integer, ByVal cx As Integer, ByVal cy As Integer, ByVal wFlags As Integer) As Integer
		Private Declare Auto Function GetKeyState Lib "user32.dll" (ByVal VKey As Integer) As Integer

		'Property Variables
		Private _ActiveItem As ListItem
		Private _Columns As ListColumns
		Private _Items As ListItems
		Private _ItemImages As ImageList
		Private _TextColumn As Integer = 0

		'Variables
		Private ColLengths(), nCurrentIndex, nListWidth As Integer
		Private gInternal As Graphics		  'Graphics for Internal use
		Private Components As System.ComponentModel.IContainer		  'Required by the Windows Form Designer
		Private bDropped, bInProcess As Boolean

		'Events
		Public Event ActiveItemChanged()
		Public Event FocusChanging(ByVal Sender As Object, ByVal e As FocusChangeEventArgs)
		Public Shadows Event GotFocus(ByVal Sender As Object, ByVal e As EventArgs)
		Public Shadows Event LostFocus(ByVal Sender As Object, ByVal e As EventArgs)

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Properties"

		'Property for the Active Item
		Public Property ActiveItem() As ListItem
			Get
				Return _ActiveItem
			End Get
			Set(ByVal Value As ListItem)
				Try
					If (IsNothing(_ActiveItem)) AndAlso (IsNothing(Value)) Then Exit Try

					If (IsNothing(Value)) Then
						bInProcess = True
						nCurrentIndex = -1
						_ActiveItem = Nothing
						Me.SelectedItem = Nothing
						RaiseEvent ActiveItemChanged()
						bInProcess = False
					Else
						If (nCurrentIndex.Equals(Value._Index)) Then Exit Try
						Me.SelectedIndex = Value._Index
					End If

				Catch

					Call [Global].ErrorMessage("BaseComboBox.Set_ActiveItem")

				End Try
			End Set
		End Property

		'Property for the Column Collection
		Public ReadOnly Property ListColumns() As ListColumns
			Get
				Return _Columns
			End Get
		End Property

		'Property for the List Items
		Public ReadOnly Property ListItems() As ListItems
			Get
				Return _Items
			End Get
		End Property

		'Property for the Image List
		Public Property ItemImages() As ImageList
			Get
				Return _ItemImages
			End Get
			Set(ByVal Value As ImageList)
				_ItemImages = Value
			End Set
		End Property

		'Property for the Text Column
		'(This does not work yet)
		'Public Property TextColumn() As Integer
		'	Get
		'		Return _TextColumn
		'	End Get
		'	Set(ByVal Value As Integer)
		'		If (_TextColumn.Equals(Value)) Then Exit Property

		'		If (Value >= _Columns.Count) Then Value = _Columns.Count - 1
		'		If (Value < 0) Then Value = 0
		'		_TextColumn = Value
		'	End Set
		'End Property

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Methods"

		'Routine to Find an Item
		Public Function FindItem(ByVal Text As String, Optional ByVal Column As Integer = 0, Optional ByVal StartIndex As Integer = 0) As Integer
			Dim i As Integer
			Dim sText As String
			Dim bFound As Boolean

			Try
				'Determine if the Item Exists
				If (Column < 0) Then Column = 0
				If (Column > _Columns.Count) Then Column = _Columns.Count

				For i = StartIndex To _Items.Count - 1
					'Determine if the Text Matches
					If (Column = 0) Then sText = _Items(i)._Text Else sText = _Items(i)._ListSubItems(Column - 1)._Text
					If (Text.Length <= sText.Length) Then
						bFound = (String.Compare(sText.Substring(0, Text.Length), Text, True) = 0)
					Else
						bFound = (String.Compare(sText, Text, True) = 0)
					End If
					If (bFound) Then Exit For
				Next i
			Catch
			End Try

			'Return the Value
			If (Not bFound) Then i = -1
			Return i
		End Function

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Methods:  Item Methods"

		'Routine to Calculate the width of the Drop-Down List
		Private Function CalculateListWidth() As Integer
			Dim i, nWidth, nMaxWidth As Integer

			'Determine the Max Column Width
			For i = 0 To _Columns.Count - 1
				If (_Columns(i)._Visible) Then
					nWidth = 0
					If (_Columns(i)._Width = -1) Then
						If (i < ColLengths.Length) Then nWidth = ColLengths(i)
					Else
						nWidth = _Columns(i)._Width
					End If

					nMaxWidth += nWidth
				End If
			Next i

			'Determine if there are Images
			If (Not IsNothing(_ItemImages)) AndAlso (_ItemImages.Images.Count > 0) Then nMaxWidth += _ItemImages.Images(0).Width
			Return nMaxWidth
		End Function

		'Routine to Refresh the Item Background
		Private Sub RefreshItemBackground(ByRef g As Graphics, ByVal Item As Integer, ByRef ItemRect As Rectangle, ByVal Selected As Boolean)
			Dim hBrush As SolidBrush
			Dim hColor As Color = Painting.Grafix.CalculateColor(SystemColors.Highlight, SystemColors.Window, 70)
			Dim hPen As New Pen(Color.DimGray)

			If (Selected) Then
				'Draw the Highlight Rectangle
				hBrush = New SolidBrush(hColor)
				g.FillRectangle(hBrush, ItemRect)
				g.DrawRectangle(hPen, ItemRect.Left, ItemRect.Top, ItemRect.Width - 1, ItemRect.Height - 1)
			Else
				'Reset the Item Background
				hBrush = New SolidBrush(Me.BackColor)
				g.FillRectangle(hBrush, ItemRect)
			End If

			hPen.Dispose() : hPen = Nothing
			hBrush.Dispose() : hBrush = Nothing
		End Sub

		'Routine to Refresh the Item
		Private Sub RefreshItemForeground(ByRef g As Graphics, ByVal Item As Integer, ByRef ItemRect As Rectangle)
			Dim mItem As ListItem = _Items(Item)
			Dim iCol, nWidth As Integer
			Dim fRect As RectangleF = RectangleF.op_Implicit(ItemRect)
			Dim sFormat As New StringFormat(StringFormatFlags.NoWrap)
			sFormat.Trimming = StringTrimming.EllipsisCharacter

			'Draw the Item
			Try
				'Enumerate the Columns
				For iCol = 0 To _Columns.Count - 1
					If (_Columns(iCol)._Visible) Then					   'Column is Visible
						If (iCol = 0) Then
							'Determine the Width
							If (_Columns(iCol)._Width = -1) Then fRect.Width = ColLengths(iCol) Else fRect.Width = (_Columns(iCol)._Width)

							'Draw the Item Text
							'sFormat.Alignment = CType(_Columns(iCol)._HAlign, Drawing.StringAlignment)
							g.DrawString(mItem._Text, mItem._Font, New SolidBrush(mItem._ForeColor), fRect, sFormat)
						Else
							'Draw the SubItem
							If (Not IsNothing(mItem._ListSubItems(iCol - 1))) Then
								Dim mSubItem As ListSubItem = mItem._ListSubItems(iCol - 1)

								'Determine the Width
								If (_Columns(iCol)._Width = -1) Then fRect.Width = ColLengths(iCol) Else fRect.Width = (_Columns(iCol)._Width)

								'Draw the Item Text
								'sFormat.Alignment = CType(_Columns(iCol)._HAlign, Drawing.StringAlignment)
								g.DrawString(mSubItem._Text, mSubItem._Font, New SolidBrush(mSubItem._ForeColor), fRect, sFormat)
								mSubItem = Nothing
							End If
						End If

						'Draw the Column Separator
						'If (iCol > 0) Then g.DrawLine(New Pen(Color.Silver), ItemRect.X - 1, ItemRect.Y - 1, ItemRect.X - 1, ItemRect.Height)

						'Adjust the Item Rect
						fRect.X += fRect.Width
					End If
				Next iCol
			Catch
				Call [Global].ErrorMessage("BaseComboBox.OnDrawItem.DrawItem")
			End Try
		End Sub

		'Routine to Refresh the Item Image
		Private Sub RefreshItemImage(ByRef g As Graphics, ByVal Item As Integer, ByRef ItemRect As Rectangle)
			Dim mItem As ListItem = _Items(Item)

			'Draw the Image
			Try
				If (Not IsNothing(_ItemImages)) Then
					If (mItem.ImageIndex >= 0) AndAlso (Not mItem.ImageIndex >= _ItemImages.Images.Count) Then
						_ItemImages.Draw(g, ItemRect.Left, ItemRect.Top, mItem.ImageIndex)
						ItemRect.X = _ItemImages.ImageSize.Width						  'Adjust the Rect for the Image
					End If
				End If
			Catch
				Call [Global].ErrorMessage("BaseComboBox.RefreshItemImage")
			Finally
				mItem = Nothing
			End Try
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Events:  Base"

		'Property to Return the Create Params
		Protected Overrides ReadOnly Property CreateParams() As System.Windows.Forms.CreateParams
			Get
				Dim mParams As CreateParams = MyBase.CreateParams
				mParams.Style = (mParams.Style Or Win32.WindowStyles.wsHScroll)
				Return mParams
			End Get
		End Property

		'Control is Draw the ComboItem
		Protected Overrides Sub OnDrawItem(ByVal e As System.Windows.Forms.DrawItemEventArgs)
			Dim itmRect As New Rectangle(e.Bounds.X, e.Bounds.Y, e.Bounds.Width, e.Bounds.Height)
			If (itmRect.Width < nListWidth) Then itmRect.Width = nListWidth

			'Allow the Control to Draw the Item
			MyBase.OnDrawItem(e)

			'Custom Drawing
			If (e.Index >= 0) Then
				Dim bSelected As Boolean = ((e.State = DrawItemState.Focus) Or (e.State = DrawItemState.HotLight) Or (e.State = DrawItemState.Selected) Or (e.State = DrawItemState.Checked))
				Call Me.RefreshItemBackground(e.Graphics, e.Index, itmRect, bSelected)
				Call Me.RefreshItemImage(e.Graphics, e.Index, itmRect)
				Call Me.RefreshItemForeground(e.Graphics, e.Index, itmRect)
				'e.Graphics.Flush(Drawing.Drawing2D.FlushIntention.Sync)
			End If
		End Sub

		'Combo is Dropped
		Protected Overrides Sub OnDropDown(ByVal e As System.EventArgs)
			Const CB_GETHORIZONTALEXTENT As Integer = &H15D
			Const CB_SETHORIZONTALEXTENT As Integer = &H15E

			If (_Items.Count > 0) Then
				Dim nLen As Integer = Me.CalculateListWidth()
				Dim iLen As Integer = Me.SendMessage(Me.Handle, CB_GETHORIZONTALEXTENT, 0, 0)
				If (nLen > iLen) Then Call Me.SendMessage(Me.Handle, CB_SETHORIZONTALEXTENT, nLen, 0) : nListWidth = nLen Else nListWidth = iLen
			End If
			MyBase.OnDropDown(e)
		End Sub

		'Control Handle was Created
		Protected Overrides Sub OnHandleCreated(ByVal e As System.EventArgs)
			MyBase.OnHandleCreated(e)
			If (Not Me.DesignMode) Then gInternal = Me.CreateGraphics()
		End Sub

		'Key was Pressed
		Protected Overrides Sub OnKeyPress(ByVal e As System.Windows.Forms.KeyPressEventArgs)
			Dim sPart As String, sText As String
			Dim nIndex As Integer, iPos As Integer = Me.SelectionStart
			Dim bFound As Boolean

			e.Handled = True
			MyBase.OnKeyPress(e)
			If (bInProcess) Then Return 'Exit if Updating
			'If (sText.Length = 0) Then Return 'Exit if there is No Text

			'Determine which Key was Pressed
			Select Case CType(AscW(e.KeyChar), Keys)
				Case Keys.Left, Keys.Right, Keys.Up, Keys.Down, _
				  Keys.End, Keys.Enter, Keys.Escape, Keys.Home, Keys.PageDown, Keys.PageUp, Keys.Return, Keys.Tab				' Don't Process
					Return

				Case Keys.Back, Keys.Delete				   'BackSpace was Pressed
					If (iPos <= 1) Then
						sText = "" : nIndex = -1 : iPos = 0
					Else
						iPos -= 1
						sText = Me.Text.Substring(0, iPos)
					End If

				Case Else
					sText = Me.Text.Substring(0, iPos) & e.KeyChar.ToString
					iPos += 1

			End Select

			'Determine if an Item Exists
			If (nIndex > -1) Then
				nIndex = Me.FindItem(sText, _TextColumn)
				If (nIndex = -1) AndAlso (sText.Length > 0) Then
					'No Item was Found, Loop until something Found
					Do
						If (iPos = 0) AndAlso (sText.Length >= 1) Then
							sText = sText.Substring(iPos + 1)
						ElseIf (Not Me.SelectionStart = 0) Then
							sText = sText.Substring(0, iPos - 1)
						End If

						'Attempt the Find the Item
						nIndex = Me.FindItem(sText, _TextColumn)
						bFound = (nIndex >= 0)

						'If not Found, Move the SelPos
						If (iPos > 0) Then iPos -= 1
					Loop Until bFound
				End If
			End If

			'Display the Selected Item
			bInProcess = True
			If (sText.Length = 0) AndAlso (Not Me.Text.Equals(sText)) Then
				Me.Text = sText
				bInProcess = False
				Me.SelectedIndex = -1
				RaiseEvent ActiveItemChanged()
				Return				 'Exit if there was no Item found
			ElseIf (sText.Length = 0) AndAlso (Me.Text.Equals(sText)) Then
				bInProcess = False
				Return				'No changes
			Else
				Me.BeginUpdate()
				If (nIndex > -1) Then If (_TextColumn = 0) Then sText = _Items(nIndex)._Text Else sText = _Items(nIndex)._ListSubItems(_TextColumn - 1)._Text
				If (nIndex = -1) Then _ActiveItem = Nothing Else _ActiveItem = _Items(nIndex)
				If (nCurrentIndex <> nIndex) Then
					nCurrentIndex = nIndex
					Me.SelectedIndex = nIndex
					RaiseEvent ActiveItemChanged()
				End If
				Me.Text = sText

				'Set the Cursor Position
				Me.SelectionStart = iPos
				Me.SelectionLength = (Me.Text.Length - iPos)
				Me.EndUpdate()
			End If
			bInProcess = False
		End Sub

		'Selected Item was Changed
		Protected Overrides Sub OnSelectedIndexChanged(ByVal e As System.EventArgs)
			MyBase.OnSelectedIndexChanged(e)
			If (Not bInProcess) Then
				'Determine if the Active Item is Changing
				If (nCurrentIndex <> Me.SelectedIndex) Then
					nCurrentIndex = Me.SelectedIndex
					If (Me.SelectedIndex = -1) Then _ActiveItem = Nothing Else _ActiveItem = _Items(Me.SelectedIndex)
					RaiseEvent ActiveItemChanged()
				End If
			End If
		End Sub

		Protected Overrides Sub OnGotFocus(ByVal e As System.EventArgs)
			MyBase.OnGotFocus(e)

			RaiseEvent GotFocus(Me, New EventArgs)
		End Sub

		Protected Overrides Sub OnLostFocus(ByVal e As System.EventArgs)
			MyBase.OnLostFocus(e)
			RaiseEvent LostFocus(Me, New EventArgs)
		End Sub

		'Process the Tab / Shift + Tab Keys
		Protected Overrides Function ProcessCmdKey(ByRef msg As System.Windows.Forms.Message, ByVal keyData As System.Windows.Forms.Keys) As Boolean
			Dim bHandled As Boolean = False

			If (keyData = (Keys.Tab Or Keys.Shift)) And (Me.ModifierKeys = Keys.Shift) Then
				Dim e As New FocusChangeEventArgs(FocusDirection.Backward)
				RaiseEvent FocusChanging(Me, e)
				'If (bHandled) Then msg.Result = IntPtr.Zero
				Return e.Handled
			ElseIf (keyData = Keys.Tab) Then
				Dim e As New FocusChangeEventArgs(FocusDirection.Forward)
				RaiseEvent FocusChanging(Me, e)
				'If (bHandled) Then msg.Result = IntPtr.Zero
				Return e.Handled
			Else
				Return MyBase.ProcessCmdKey(msg, keyData)
			End If
		End Function

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Events:  ListItems"

		'List Items were Cleared
		Private Sub ListItemsCleared()
			Erase ColLengths : ColLengths = Nothing
			Me.Items.Clear()
		End Sub

		'ListItem was Added
		Private Sub ListItemAdded(ByRef Item As ListItem)
			If (Item._BackColor.Equals(Color.Empty)) Then Item._BackColor = Me.BackColor
			If (Item._ForeColor.Equals(Color.Empty)) Then Item._ForeColor = Me.ForeColor
			If (IsNothing(Item._Font)) Then Item._Font = Me.Font

			'Determine if the Length array is Initialized
			If (IsNothing(ColLengths)) Then ReDim ColLengths(0)

			'Determine the Length of the Item's Text
			If (IsNothing(gInternal)) Then gInternal = Me.CreateGraphics()
			Dim iLen As Integer = CInt(gInternal.MeasureString(Item._Text, Item._Font).Width) + 1
			If (iLen > ColLengths(0)) Then ColLengths(0) = iLen 'Store the Longest TextLen

			'Add the Item
			Me.Items.Add(Item)
		End Sub

		'List Item was Changed
		Private Sub ListItemChanged(ByRef Item As ListItem)
			If (Item._BackColor.Equals(Color.Empty)) Then Item._BackColor = Me.BackColor
			If (Item._ForeColor.Equals(Color.Empty)) Then Item._ForeColor = Me.ForeColor
			If (IsNothing(Item._Font)) Then Item._Font = Me.Font

			'Determine the Length of the Item's Text
			If (IsNothing(gInternal)) Then gInternal = Me.CreateGraphics()
			Dim iLen As Integer = CInt(gInternal.MeasureString(Item._Text, Item._Font).Width) + 1
			If (iLen > ColLengths(0)) Then ColLengths(0) = iLen 'Store the Longest TextLen
		End Sub

		'List Item was Changed
		Private Sub ListItemChangedIndex(ByVal PreviousIndex As Integer, ByVal NewIndex As Integer)
			Me.Items.RemoveAt(PreviousIndex)
			Call Me.ListItemAdded(_Items(NewIndex))
		End Sub

		'ListItem was Removed
		Private Sub ListItemRemoved(ByVal Item As Integer)
			Me.Items.RemoveAt(Item)
		End Sub

		'ListSubItem was Changed
		Private Sub ListSubItemChanged(ByVal Item As Integer, ByVal SubItem As Integer)
			Dim mSubItem As ListSubItem = _Items(Item)._ListSubItems(SubItem)

			'Ensure that the ItemLength Array is Initialized
			If (ColLengths.Length = (SubItem + 1)) Then ReDim Preserve ColLengths(SubItem + 1)

			'Determine the SubItem's Length
			If (IsNothing(gInternal)) Then gInternal = Me.CreateGraphics()
			Dim iLen As Integer = CInt(gInternal.MeasureString(mSubItem._Text, mSubItem._Font).Width) + 1
			If (iLen > ColLengths(SubItem + 1)) Then ColLengths(SubItem + 1) = iLen
			mSubItem = Nothing
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Constructors / Destructors"

		'Initialize the Control
		Public Sub New()
			MyBase.New()
			InitializeComponent()			 'This call is required by the Windows Form Designer.

			'Initialize the Variables
			_Columns = New ListColumns
			_Items = New ListItems
			nCurrentIndex = -1

			'Add the Event Handlers
			If (Not Me.DesignMode) Then
				AddHandler _Items.Cleared, AddressOf Me.ListItemsCleared
				AddHandler _Items.ItemAdded, AddressOf Me.ListItemAdded
				AddHandler _Items.ItemChanged, AddressOf Me.ListItemChanged
				AddHandler _Items.ItemIndexChanged, AddressOf Me.ListItemChangedIndex
				AddHandler _Items.ItemRemoved, AddressOf Me.ListItemRemoved
				AddHandler _Items.SubItemAdded, AddressOf Me.ListSubItemChanged
				AddHandler _Items.SubItemChanged, AddressOf Me.ListSubItemChanged
			End If

			'Initialize the Control
			Me.DrawMode = DrawMode.OwnerDrawFixed
			Me.ResizeRedraw = True
		End Sub

		'Dispose the Control
		Protected Overloads Overrides Sub Dispose(ByVal Disposing As Boolean)
			If (Disposing) Then
				Try
					'Remove the Event Handlers
					If (Not Me.DesignMode) AndAlso (Not IsNothing(_Items)) Then
						RemoveHandler _Items.Cleared, AddressOf Me.ListItemsCleared
						RemoveHandler _Items.ItemAdded, AddressOf Me.ListItemAdded
						RemoveHandler _Items.ItemChanged, AddressOf Me.ListItemChanged
						RemoveHandler _Items.ItemIndexChanged, AddressOf Me.ListItemChangedIndex
						RemoveHandler _Items.ItemRemoved, AddressOf Me.ListItemRemoved
						RemoveHandler _Items.SubItemAdded, AddressOf Me.ListSubItemChanged
						RemoveHandler _Items.SubItemChanged, AddressOf Me.ListSubItemChanged
					End If

					If (Not IsNothing(_ActiveItem)) Then _ActiveItem = Nothing
					If (Not IsNothing(_Columns)) Then _Columns.Dispose() : _Columns = Nothing
					If (Not IsNothing(_Items)) Then _Items.Dispose() : _Items = Nothing
					If (Not IsNothing(_ItemImages)) Then _ItemImages.Dispose() : _ItemImages = Nothing
					If (Not IsNothing(gInternal)) Then gInternal.Dispose() : gInternal = Nothing
					If (Not IsNothing(Components)) Then Components.Dispose() : Components = Nothing
				Catch
					Call [Global].ErrorMessage("BaseComboBox.Dispose")

				End Try
			End If
			MyBase.Dispose(Disposing)
		End Sub

		'NOTE: The following procedure is required by the Windows Form Designer
		'It can be modified using the Windows Form Designer.  
		'Do not modify it using the code editor.
		<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
			Components = New System.ComponentModel.Container
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	End Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
End Namespace