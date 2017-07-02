Option Strict On
Option Explicit On 
'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
Imports System.ComponentModel
Imports System.Runtime.InteropServices
'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>


Namespace Controls
	'List Item Collection Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	Public NotInheritable Class ListItems
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Declarations"

		'Implementations
		Implements ICollection, IEnumerable, IList, IDisposable

		'Constants
		Private Const DEFAULT_CAPACITY As Integer = 10

		'Property Variables
		Private _Count As Integer

		'Variables
		Private _Items() As ListItem
		Private bRefreshing, bDisposed As Boolean

		'Events
		Friend Event Cleared()
		Friend Event ItemAdded(ByRef Item As ListItem)
		Friend Event ItemChanged(ByRef Item As ListItem)
		Friend Event ItemIndexChanged(ByVal PreviousIndex As Integer, ByVal NewIndex As Integer)
		Friend Event ItemRemoved(ByVal Index As Integer)
		Friend Event Refreshing()
		Friend Event SubItemAdded(ByVal Item As Integer, ByVal SubItem As Integer)
		Friend Event SubItemChanged(ByVal Item As Integer, ByVal SubItem As Integer)
		Friend Event SubItemRemoved(ByVal Item As Integer, ByVal SubItem As Integer)

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Properties"

		'Property to Determine if the Collection Contains a Key
		Public ReadOnly Property Contains(ByVal Key As String) As Boolean
			Get
				Return CBool(Me.GetIndex(Key) >= 0)
			End Get
		End Property

		'Property to Return the Count
		Public ReadOnly Property Count() As Integer Implements ICollection.Count
			Get
				Return _Count
			End Get
		End Property

		'Property to Return an Item using the Index
		Default Public ReadOnly Property Item(ByVal Index As Integer) As ListItem
			Get
				'Exit if there are no Items
				If (_Count = 0) Then Return Nothing
				If (Index < 0) Or (Index > _Items.GetLength(0) - 1) Then Return Nothing Else Return _Items(Index)
			End Get
		End Property

		'Property to Return an Item using the Key
		Default Public ReadOnly Property Item(ByVal Key As String) As ListItem
			Get
				'Determine if the Key Exists
				Dim i As Integer = Me.GetIndex(Key)
				If (i >= 0) Then Return _Items(i) Else Return Nothing
			End Get
		End Property

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Methods"

		'Routine to Add using the Text
		Public Sub Add(ByVal Text As String)
			Dim mItem As New ListItem(Text)
			Call Me.Add(mItem)
			mItem = Nothing
		End Sub

		'Routine to Add using the Index and Text
		Public Sub Add(ByVal Index As Integer, ByVal Text As String)
			Dim mItem As New ListItem(Index, Text)
			Call Me.Add(mItem)
			mItem = Nothing
		End Sub

		'Routine to Add using the Key and Text
		Public Sub Add(ByVal Key As String, ByVal Text As String)
			Dim mItem As New ListItem(Key, Text)
			Call Me.Add(mItem)
			mItem = Nothing
		End Sub

		'Routine to Add using the Index, Key asd Text
		Public Sub Add(ByVal Index As Integer, ByVal Key As String, ByVal Text As String)
			Dim mItem As New ListItem(Index, Key, Text)
			Call Me.Add(mItem)
			mItem = Nothing
		End Sub

		'Routine to Add using the Object
		Public Sub Add(ByVal Item As ListItem)
			Dim i, nItem As Integer
			Dim bNew As Boolean

			'Ensure the Capacity
			If (_Count = _Items.Length) Then Call EnsureCapacity(_Count + 1)

			'Determine if the Key is Unique
			If (Not IsNothing(Item._Key)) AndAlso (Item._Key.Length > 0) Then nItem = Me.GetIndex(Item._Key) Else nItem = -1
			bNew = (nItem = -1)

			'Determine the Index
			If (Item._Index < 0) OrElse (Item._Index > _Count) Then Item._Index = _Count 'Ensure the Index falls within the Array Bounds

			'Resort the Array to ensure the Item falls into the correct Index
			If (nItem < 0) Then nItem = _Count
			For i = nItem To Item._Index
				If (i = Item._Index) Then
					_Items(i) = Item					'Insert the New Item
					_Items(i)._Collection = Me
				Else
					_Items(i) = _Items(i - 1)					'Move the Item to the Next Slot
				End If
				_Items(i)._Index = i				 'Set the Index
			Next i

			'Raise the Event
			If (bNew) Then
				_Count += 1
				RaiseEvent ItemAdded(Item)
			Else
				If (nItem <> Item._Index) Then
					RaiseEvent ItemIndexChanged(nItem, Item._Index)
				Else
					RaiseEvent ItemChanged(Item)
				End If
			End If
			Item = Nothing
		End Sub

		'Routine to Clear the Collection
		Public Sub Clear()
			Dim i As Integer

			'Dispose the Items
			For i = 0 To _Count - 1
				If (Not IsNothing(_Items(i))) Then
					_Items(i).Dispose()
					_Items(i) = Nothing
				End If
			Next i

			'Clear the Array
			_Count = 0
			Erase _Items
			If (Not bDisposed) Then _Items = New ListItem(DEFAULT_CAPACITY) {}
			If (Not bDisposed) Then RaiseEvent Cleared()
		End Sub

		'Routine to Remove All Items
		Public Sub Remove()
			Call Me.Clear()
		End Sub

		'Routine to Remove an Item using the Index
		Public Sub Remove(ByVal Index As Integer) Implements IList.RemoveAt
			Call Me.Remove(Me.Item(Index))
		End Sub

		'Routine to Remove an Item using the Index
		Public Sub Remove(ByVal Key As String)
			Call Me.Remove(Me.Item(Key))
		End Sub

		'Routine to Delete an Item using the Object
		Public Sub Remove(ByVal Item As ListItem)
			'Raise the Event
			RaiseEvent ItemRemoved(Item._Index)

			'Dispose the Item
			_Items(Item.Index).Dispose()
			_Items(Item.Index) = Nothing

			'Remove the Item from the Array
			_Count -= 1			  'Deincrement the Counter
			If (Item.Index < _Count) Then Array.Copy(_Items, Item.Index + 1, _Items, Item.Index, _Count - Item.Index)
			ReDim Preserve _Items(_Count)
			Item = Nothing
		End Sub

		'Function for Enumeration
		Public Function GetEnumerator() As IListItemEnumerator
			Return New ListItems.ListItemEnumerator(Me)
		End Function

		'Routine to Refresh the Collection
		Public Sub Refresh()
			bRefreshing = True
			RaiseEvent Refreshing()
			bRefreshing = False
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Methods:  Internal"

		'Routine to Ensure the Capacity
		Private Sub EnsureCapacity(ByVal Min As Integer)
			Dim nCapacity As Integer
			If (_Items.Length = 0) Then nCapacity = DEFAULT_CAPACITY Else nCapacity = _Items.Length + DEFAULT_CAPACITY
			If (nCapacity < Min) Then nCapacity = Min

			If (nCapacity <> _Items.Length) Then
				If (nCapacity > 0) Then
					ReDim Preserve _Items(nCapacity)
				Else
					_Items = New ListItem(DEFAULT_CAPACITY) {}
				End If
			End If
		End Sub

		'Function to Get the Index of a Key
		Protected Friend Function GetIndex(ByVal Key As String) As Integer
			Dim i As Integer

			'Exit if there are no Items
			If (_Count = 0) Then Return -1

			'Determine if the Key Exists
			For i = 0 To _Items.GetLength(0) - 1
				If (Not IsNothing(_Items(i))) Then
					If (_Items(i).Key = Key) Then Return i : Exit For
				End If
			Next i
			If (i > _Items.GetLength(0) - 1) Then Return -1
		End Function

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Methods:  Overrideable / Events"

		'Item was Added
		Protected Friend Sub OnItemAdded(ByRef Item As ListItem)
			RaiseEvent ItemAdded(Item)
		End Sub

		'Item was Changed
		Protected Friend Sub OnItemChanged(ByRef Item As ListItem)
			RaiseEvent ItemChanged(Item)
		End Sub

		'Item was Removed
		Protected Friend Sub OnItemRemoved(ByVal Index As Integer)
			RaiseEvent ItemRemoved(Index)
		End Sub

		'SubItem was Added
		Protected Friend Sub OnSubItemAdded(ByVal Item As Integer, ByVal SubItem As Integer)
			RaiseEvent SubItemAdded(Item, SubItem)
		End Sub

		'SubItem was Changed
		Protected Friend Sub OnSubItemChanged(ByVal Item As Integer, ByVal SubItem As Integer)
			RaiseEvent SubItemChanged(Item, SubItem)
		End Sub

		'SubItem was Removed
		Protected Friend Sub OnSubItemRemoved(ByVal Item As Integer, ByVal SubItem As Integer)
			RaiseEvent SubItemRemoved(Item, SubItem)
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Nested Enumerator Class"

		Private Class ListItemEnumerator
			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Declarations"

			'Implementations
			Implements System.Collections.IEnumerator, IListItemEnumerator

			'Variables
			Private _Items As ListItems
			Private _Index As Integer

#End Region
			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Properties"

			'Property to Return the Current Item 
			Public ReadOnly Property Current() As ListItem Implements IListItemEnumerator.Current
				Get
					Return _Items(_Index)
				End Get
			End Property

			'Property to Return the Current Item (IEnumerator)
			Private ReadOnly Property IEnumerator_Current() As Object Implements IEnumerator.Current
				Get
					Return CType(Me.Current, Object)
				End Get
			End Property

#End Region
			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Methods"

			'Function to Move Next
			Public Function MoveNext() As Boolean Implements IEnumerator.MoveNext, IListItemEnumerator.MoveNext
				_Index += 1
				If (_Index < _Items.Count) Then Return True Else Return False
			End Function

			'Routine to Reset
			Public Sub Reset() Implements IEnumerator.Reset, IListItemEnumerator.Reset
				_Index = -1
			End Sub

#End Region
			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Class Constructors / Destructors"

			Public Sub New(ByVal ListItems As ListItems)
				_Items = ListItems
				_Index = -1
			End Sub

#End Region
			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
		End Class

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "ICollection Implementation"

		'Routine to CopyTo an Array
		Private Sub CopyTo(ByVal Array As System.Array, ByVal Index As Integer) Implements ICollection.CopyTo
		End Sub

		'Property to Determine if the Collection IsSynchronized
		Private ReadOnly Property IsSynchronized() As Boolean Implements System.Collections.ICollection.IsSynchronized
			Get
				Return _Items.IsSynchronized
			End Get
		End Property

		'Property to Return the Sync Object
		Private ReadOnly Property SyncRoot() As Object Implements System.Collections.ICollection.SyncRoot
			Get
				Return _Items.SyncRoot
			End Get
		End Property

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "IList Implementation"

		'Property to Return an Item
		Private Property IList_Item(ByVal Index As Integer) As Object Implements System.Collections.IList.Item
			Get
				Return CType(Me.Item(Index), Object)
			End Get
			Set(ByVal Value As Object)
			End Set
		End Property
		Private Function IList_Add(ByVal Value As Object) As Integer Implements System.Collections.IList.Add
		End Function
		Private Sub IList_Clear() Implements System.Collections.IList.Clear
			Call Me.Clear()
		End Sub
		Private Function IList_Contains(ByVal Value As Object) As Boolean Implements System.Collections.IList.Contains
			If (TypeOf Value Is String) Then
				Return Me.Contains(Value.ToString)
			End If
		End Function
		Private Function IList_IndexOf(ByVal Value As Object) As Integer Implements System.Collections.IList.IndexOf
			If (TypeOf Value Is String) Then
				Return Me.GetIndex(Value.ToString)
			End If
		End Function
		Private Sub IList_Insert(ByVal index As Integer, ByVal value As Object) Implements System.Collections.IList.Insert
		End Sub
		Private ReadOnly Property IList_IsFixedSize() As Boolean Implements System.Collections.IList.IsFixedSize
			Get
				Return False
			End Get
		End Property
		Private ReadOnly Property IList_IsReadOnly() As Boolean Implements System.Collections.IList.IsReadOnly
			Get
				Return False
			End Get
		End Property
		Private Sub IList_Remove(ByVal Value As Object) Implements System.Collections.IList.Remove
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "IEnumerable Implementation"

		'Function for Enumeration (IEnumerator)
		Private Function IEnumerable_GetEnumerator() As IEnumerator Implements IEnumerable.GetEnumerator
			Return CType(Me.GetEnumerator, IEnumerator)
		End Function

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Class Constructors / Destructors"

		'Class is Initializing
		Public Sub New()
			Call Initialize()
		End Sub

		'Routine to Initialize the Class
		Private Sub Initialize()
			_Count = 0
			_Items = New ListItem(DEFAULT_CAPACITY) {}
		End Sub

		'Class is Disposing
		Public Sub Dispose() Implements System.IDisposable.Dispose
			If (Not bDisposed) Then
				bDisposed = True
				Call Me.Clear()

				GC.SuppressFinalize(Me)
			End If
		End Sub

		'Class is Finalizing
		Protected Overrides Sub Finalize()
			If (Not bDisposed) Then Call Me.Dispose()
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	End Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>


	'List Item Enumerator
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	Public Interface IListItemEnumerator
		ReadOnly Property Current() As ListItem
		Function MoveNext() As Boolean
		Sub Reset()
	End Interface
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>


	'List Item Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	Public NotInheritable Class ListItem
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Declarations"

		'Implementations
		Implements IComponent

		'Property Variables
		Friend _Collection As ListItems
		Friend _ListSubItems As ListSubItems

		Friend _Index, _ImageIndex As Integer
		Friend _Key, _Text As String
		Friend _Tag, _TagInternal As Object
		Friend _BackColor, _ForeColor As Color
		Friend _Font As Font
		Friend _Focused, _Selected As Boolean
		Friend _Checked As Boolean
		Private _Site As ISite

		'Variables
		Private bDisposed As Boolean

		'Events
		Public Event Disposed(ByVal sender As Object, ByVal e As System.EventArgs) Implements System.ComponentModel.IComponent.Disposed

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Properties"

		'Property for the Back Color
		<Category("Appearance"), Description("Gets or Sets the Back Color of the Item.")> _
		Public Property BackColor() As Color
			Get
				Return _BackColor
			End Get
			Set(ByVal Value As Color)
				If (_BackColor.Equals(Value)) Then Exit Property
				_BackColor = Value
				If (Not IsNothing(_Collection)) Then _Collection.OnItemChanged(Me)
			End Set
		End Property

		'Property for the Checked State
		<Category("Appearance"), Description("Gets or Sets the Checked State of the Item.")> _
		Public Property Checked() As Boolean
			Get
				Return _Checked
			End Get
			Set(ByVal Value As Boolean)
				If (_Checked.Equals(Value)) Then Exit Property
				_Checked = Value
				If (Not IsNothing(_Collection)) Then _Collection.OnItemChanged(Me)
			End Set
		End Property

		'Property for the Focused State
		<Category("Appearance"), Description("Gets or Sets the Focused State of the Item.")> _
		Public Property Focused() As Boolean
			Get
				Return _Focused
			End Get
			Set(ByVal Value As Boolean)
				If (_Focused.Equals(Value)) Then Exit Property
				_Focused = Value
				If (Not IsNothing(_Collection)) Then _Collection.OnItemChanged(Me)
			End Set
		End Property

		'Property for the Fore Color
		<Category("Appearance"), Description("Gets or Sets the ForeColor of the Item.")> _
		Public Property ForeColor() As Color
			Get
				Return _ForeColor
			End Get
			Set(ByVal Value As Color)
				If (_ForeColor.Equals(Value)) Then Exit Property
				_ForeColor = Value
				If (Not IsNothing(_Collection)) Then _Collection.OnItemChanged(Me)
			End Set
		End Property

		'Property for the Font
		<Category("Appearance"), Description("Gets or Sets the Font of the Item.")> _
		Public Property Font() As Font
			Get
				Return _Font
			End Get
			Set(ByVal Value As Font)
				If (_Font.Equals(Value)) Then Exit Property
				_Font = Value
				If (Not IsNothing(_Collection)) Then _Collection.OnItemChanged(Me)
			End Set
		End Property

		'Property for the Image Index
		<Category("Appearance"), Description("Gets or Sets the Image to use for the Item based on the Index within the ImageList.")> _
		Public Property ImageIndex() As Integer
			Get
				Return _ImageIndex
			End Get
			Set(ByVal Value As Integer)
				If (_ImageIndex.Equals(Value)) Then Exit Property
				_ImageIndex = Value
				If (Not IsNothing(_Collection)) Then _Collection.OnItemChanged(Me)
			End Set
		End Property

		'Property for the Index
		<Category("Appearance"), Description("Gets or Sets the Index of the Item within the Collection.")> _
		Public Property Index() As Integer
			Get
				Return _Index
			End Get
			Set(ByVal Value As Integer)
				If (_Index.Equals(Value)) Then Exit Property
				_Index = Value
				If (Not IsNothing(_Collection)) Then _Collection.Add(Me)
			End Set
		End Property

		'Property for the Key
		<Category("Behavior"), Description("Gets or Sets the Unique Key to use for the Item.")> _
		Public Property Key() As String
			Get
				Return _Key
			End Get
			Set(ByVal Value As String)
				If (Not IsNothing(_Key)) Then If (_Key.Equals(Value)) Then Exit Property
				If (Not IsNothing(_Collection)) Then If (_Collection.GetIndex(Value) = -1) Then _Key = String.Intern(Value)
			End Set
		End Property

		'Property for the Selected State
		<Category("Appearance"), Description("Gets or Sets the Selected State of the Item.")> _
		Public Property Selected() As Boolean
			Get
				Return _Selected
			End Get
			Set(ByVal Value As Boolean)
				If (_Selected.Equals(Value)) Then Exit Property
				_Selected = Value
				If (Not IsNothing(_Collection)) Then _Collection.OnItemChanged(Me)
			End Set
		End Property

		'Property for the List Sub Items
		<Category("Appearance"), Description("Returns the Collection of ListSubItem Objects for the specific ListItem.")> _
		Public ReadOnly Property ListSubItems() As ListSubItems
			Get
				Return _ListSubItems
			End Get
		End Property

		'Property for the Tag
		<Category("Behavior"), Description("Gets or Sets User Defined Data stored within the Item.")> _
		Public Property Tag() As Object
			Get
				Return _Tag
			End Get
			Set(ByVal Value As Object)
				If (_Tag.Equals(Value)) Then Exit Property
				_Tag = Value
			End Set
		End Property

		'Property for the Text
		<Category("Appearance"), Description("Gets or Sets the Text displayed on the Item.")> _
		Public Property Text() As String
			Get
				Return _Text
			End Get
			Set(ByVal Value As String)
				If (Not IsNothing(_Text)) Then If (_Text.Equals(Value)) Then Exit Property
				_Text = String.Intern(Value)
				If (Not IsNothing(_Collection)) Then _Collection.OnItemChanged(Me)
			End Set
		End Property

		<Browsable(False), DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)> _
		Public Property Site() As System.ComponentModel.ISite Implements System.ComponentModel.IComponent.Site
			Get
				Return _Site
			End Get
			Set(ByVal Value As System.ComponentModel.ISite)
				_Site = Value
			End Set
		End Property

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Methods"

		'Function to Return the ToString
		Public Overrides Function ToString() As String
			Return _Text
		End Function

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Class Constructors / Destructors"

		'Initialize the Class
		Public Sub New()
			Call Initialize()
		End Sub

		'Initialize with Text
		Public Sub New(ByVal Text As String)
			Call Initialize()
			_Text = Text
		End Sub

		'Initialize with an Index / Text
		Public Sub New(ByVal Index As Integer, ByVal Text As String)
			Call Initialize()
			_Index = Index
			_Text = Text
		End Sub

		'Initialize with a Key and Text
		Public Sub New(ByVal Key As String, ByVal Text As String)
			Call Initialize()
			_Key = Key
			_Text = Text
		End Sub

		'Initialize with an Index, Key, and Text
		Public Sub New(ByVal Index As Integer, ByVal Key As String, ByVal Text As String)
			Call Initialize()
			_Index = Index
			_Key = Key
			_Text = Text
		End Sub

		'Routine to Initialize
		Private Sub Initialize()
			_Index = -1
			_ImageIndex = -1
			_ListSubItems = New ListSubItems(Me)
		End Sub

		'Routine to Dispose
		Public Sub Dispose() Implements System.ComponentModel.IComponent.Dispose
			If (Not bDisposed) Then
				bDisposed = True
				_Collection = Nothing
				_Tag = Nothing : _TagInternal = Nothing
				_ListSubItems.Dispose() : _ListSubItems = Nothing
				_Font = Nothing

				GC.SuppressFinalize(Me)
			End If
		End Sub

		'Routine to Finalize
		Protected Overrides Sub Finalize()
			If (Not bDisposed) Then Call Me.Dispose()
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	End Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>


	'List Sub Item Collection Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	Public NotInheritable Class ListSubItems
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Declarations"

		'Implementations
		Implements ICollection, IEnumerable, IList, IDisposable

		'Constants
		Private Const DEFAULT_CAPACITY As Integer = 10

		'Property Variables
		Friend _Item As ListItem		   'Parent Item
		Private _Count As Integer

		'Variables
		Private _Items() As ListSubItem
		Private bRefreshing, bDisposed As Boolean

		'Events
		Friend Event Cleared()
		Friend Event ItemAdded(ByRef Item As ListSubItem)
		Friend Event ItemChanged(ByRef Item As ListSubItem)
		Friend Event ItemIndexChanged(ByVal PreviousIndex As Integer, ByVal NewIndex As Integer)
		Friend Event ItemRemoved(ByVal Index As Integer)

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Properties"

		'Property to Determine if the Collection Contains a Key
		Public ReadOnly Property Contains(ByVal Key As String) As Boolean
			Get
				Return CBool(Me.GetIndex(Key) >= 0)
			End Get
		End Property

		'Property to Return the Count
		Public ReadOnly Property Count() As Integer Implements ICollection.Count
			Get
				Return _Count
			End Get
		End Property

		'Property to Return an Item using the Index
		Default Public ReadOnly Property Item(ByVal Index As Integer) As ListSubItem
			Get
				'Exit if there are no Items
				If (_Count = 0) Then Return Nothing
				If (Index < 0) Or (Index > _Items.GetLength(0) - 1) Then Return Nothing Else Return _Items(Index)
			End Get
		End Property

		'Property to Return an Item using the Key
		Default Public ReadOnly Property Item(ByVal Key As String) As ListSubItem
			Get
				'Determine if the Key Exists
				Dim i As Integer = Me.GetIndex(Key)
				If (i >= 0) Then Return _Items(i) Else Return Nothing
			End Get
		End Property

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Methods"

		'Routine to Add using the Text
		Public Sub Add(ByVal Text As String)
			Dim mItem As New ListSubItem(Text)
			Call Me.Add(mItem)
			mItem = Nothing
		End Sub

		'Routine to Add using the Index and Text
		Public Sub Add(ByVal Index As Integer, ByVal Text As String)
			Dim mItem As New ListSubItem(Index, Text)
			Call Me.Add(mItem)
			mItem = Nothing
		End Sub

		'Routine to Add using the Key and Text
		Public Sub Add(ByVal Key As String, ByVal Text As String)
			Dim mItem As New ListSubItem(Key, Text)
			Call Me.Add(mItem)
			mItem = Nothing
		End Sub

		'Routine to Add using the Index, Key asd Text
		Public Sub Add(ByVal Index As Integer, ByVal Key As String, ByVal Text As String)
			Dim mItem As New ListSubItem(Index, Key, Text)
			Call Me.Add(mItem)
			mItem = Nothing
		End Sub

		'Routine to Add using the Object
		Public Sub Add(ByVal Item As ListSubItem)
			Dim i, nItem As Integer
			Dim bNew As Boolean

			'Ensure the Capacity
			If (_Count = _Items.Length) Then Call EnsureCapacity(_Count + 1)

			'Determine if the Key is Unique
			If (Not IsNothing(Item._Key)) AndAlso (Item._Key.Length > 0) Then nItem = Me.GetIndex(Item._Key) Else nItem = -1
			bNew = (nItem = -1)

			'Determine the Index
			If (Item._Index < 0) OrElse (Item._Index > _Count) Then Item._Index = _Count 'Ensure the Index falls within the Array Bounds

			'Resort the Array to ensure the Item falls into the correct Index
			If (nItem < 0) Then nItem = _Count
			For i = nItem To Item._Index
				If (i = Item._Index) Then
					_Items(i) = Item					'Insert the New Item
					_Items(i)._Collection = Me
					_Items(i)._Item = _Item
					_Items(i)._BackColor = _Item._BackColor
					_Items(i)._Font = _Item._Font
					_Items(i)._ForeColor = _Item._ForeColor
				Else
					_Items(i) = _Items(i - 1)					'Move the Item to the Next Slot
				End If
				_Items(i)._Index = i				 'Set the Index
			Next i

			'Raise the Event
			If (bNew) Then
				_Count += 1
				If (Not IsNothing(_Item._Collection)) Then _Item._Collection.OnSubItemAdded(_Item._Index, Item._Index)
			Else
				If (Not IsNothing(_Item._Collection)) Then _Item._Collection.OnSubItemChanged(_Item._Index, Item._Index)
			End If
			Item = Nothing
		End Sub

		'Routine to Clear the Collection
		Public Sub Clear()
			Dim i As Integer

			'Dispose the Items
			For i = 0 To _Count - 1
				If (Not IsNothing(_Items(i))) Then
					_Items(i).Dispose()
					_Items(i) = Nothing
				End If
			Next i

			'Clear the Array
			_Count = 0
			'Array.Clear(_Items, 0, _Items.Length)
			Erase _Items
			If (Not bDisposed) Then _Items = New ListSubItem(DEFAULT_CAPACITY) {}
			If (Not bDisposed) Then RaiseEvent Cleared()
		End Sub

		'Routine to Remove All Items
		Public Sub Remove()
			Call Me.Clear()
		End Sub

		'Routine to Remove an Item using the Index
		Public Sub Remove(ByVal Index As Integer) Implements IList.RemoveAt
			Call Me.Remove(Me.Item(Index))
		End Sub

		'Routine to Remove an Item using the Index
		Public Sub Remove(ByVal Key As String)
			Call Me.Remove(Me.Item(Key))
		End Sub

		'Routine to Delete an Item using the Object
		Public Sub Remove(ByVal Item As ListSubItem)
			'Raise the Event
			RaiseEvent ItemRemoved(Item.Index)

			'Dispose the Item
			_Items(Item.Index).Dispose()
			_Items(Item.Index) = Nothing

			'Remove the Item from the Array
			_Count -= 1			  'Deincrement the Counter
			If (Item.Index < _Count) Then Array.Copy(_Items, Item.Index + 1, _Items, Item.Index, _Count - Item.Index)
			ReDim Preserve _Items(_Count)
			Item = Nothing
		End Sub

		'Function for Enumeration 
		Public Function GetEnumerator() As IListSubItemEnumerator
			Return New ListSubItems.ListSubItemEnumerator(Me)
		End Function

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Internal Methods"

		'Routine to Ensure the Capacity
		Private Sub EnsureCapacity(ByVal Min As Integer)
			Dim nCapacity As Integer
			If (_Items.Length = 0) Then nCapacity = DEFAULT_CAPACITY Else nCapacity = _Items.Length + DEFAULT_CAPACITY
			If (nCapacity < Min) Then nCapacity = Min

			If (nCapacity <> _Items.Length) Then
				If (nCapacity > 0) Then
					ReDim Preserve _Items(nCapacity)
				Else
					_Items = New ListSubItem(DEFAULT_CAPACITY) {}
				End If
			End If
		End Sub

		'Function to Get the Index of a Key
		Protected Friend Function GetIndex(ByVal Key As String) As Integer
			Dim i As Integer

			'Exit if there are no Items
			If (_Count = 0) Then Return -1

			'Determine if the Key Exists
			For i = 0 To _Items.GetLength(0) - 1
				If (Not IsNothing(_Items(i))) Then
					If (_Items(i).Key = Key) Then Return i : Exit For
				End If
			Next i
			If (i > _Items.GetLength(0) - 1) Then Return -1
		End Function

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Nested Enumerator Class"

		Private Class ListSubItemEnumerator
			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Declarations"

			'Implementations
			Implements System.Collections.IEnumerator, IListSubItemEnumerator

			'Variables
			Private _Items As ListSubItems
			Private _Index As Integer

#End Region
			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Properties"

			'Property to Return the Current Item
			Public ReadOnly Property Current() As ListSubItem Implements IListSubItemEnumerator.Current
				Get
					Return _Items(_Index)
				End Get
			End Property

			'Property to Return the Current Item (IEnumerator)
			Private ReadOnly Property IEnumerator_Current() As Object Implements IEnumerator.Current
				Get
					Return CType(Me.Current, Object)
				End Get
			End Property

#End Region
			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Methods"

			'Function to Move Next
			Public Function MoveNext() As Boolean Implements IEnumerator.MoveNext, IListSubItemEnumerator.MoveNext
				_Index += 1
				If (_Index < _Items.Count) Then Return True Else Return False
			End Function

			'Routine to Reset
			Public Sub Reset() Implements IEnumerator.Reset, IListSubItemEnumerator.Reset
				_Index = -1
			End Sub

#End Region
			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Class Constructors / Destructors"

			Public Sub New(ByVal SubItems As ListSubItems)
				_Items = SubItems
				_Index = -1
			End Sub

#End Region
			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
		End Class

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "ICollection Implementation"

		'Routine to CopyTo an Array
		Private Sub CopyTo(ByVal Array As System.Array, ByVal Index As Integer) Implements ICollection.CopyTo
		End Sub

		'Property to Determine if the Collection IsSynchronized
		Private ReadOnly Property IsSynchronized() As Boolean Implements System.Collections.ICollection.IsSynchronized
			Get
				Return _Items.IsSynchronized
			End Get
		End Property

		'Property to Return the Sync Object
		Private ReadOnly Property SyncRoot() As Object Implements System.Collections.ICollection.SyncRoot
			Get
				Return _Items.SyncRoot
			End Get
		End Property

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "IList Implementation"

		'Property to Return an Item
		Private Property IList_Item(ByVal Index As Integer) As Object Implements System.Collections.IList.Item
			Get
				Return CType(Me.Item(Index), Object)
			End Get
			Set(ByVal Value As Object)
			End Set
		End Property
		Private Function IList_Add(ByVal Value As Object) As Integer Implements System.Collections.IList.Add
		End Function
		Private Sub IList_Clear() Implements System.Collections.IList.Clear
			Call Me.Clear()
		End Sub
		Private Function IList_Contains(ByVal Value As Object) As Boolean Implements System.Collections.IList.Contains
			If (TypeOf Value Is String) Then
				Return Me.Contains(Value.ToString)
			End If
		End Function
		Private Function IList_IndexOf(ByVal Value As Object) As Integer Implements System.Collections.IList.IndexOf
			If (TypeOf Value Is String) Then
				Return Me.GetIndex(Value.ToString)
			End If
		End Function
		Private Sub IList_Insert(ByVal index As Integer, ByVal value As Object) Implements System.Collections.IList.Insert
		End Sub
		Private ReadOnly Property IList_IsFixedSize() As Boolean Implements System.Collections.IList.IsFixedSize
			Get
				Return False
			End Get
		End Property
		Private ReadOnly Property IList_IsReadOnly() As Boolean Implements System.Collections.IList.IsReadOnly
			Get
				Return False
			End Get
		End Property
		Private Sub IList_Remove(ByVal Value As Object) Implements System.Collections.IList.Remove
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "IEnumerable Implementation"

		'Function for Enumeration (IEnumerator)
		Private Function IEnumerable_GetEnumerator() As IEnumerator Implements IEnumerable.GetEnumerator
			Return CType(Me.GetEnumerator, IEnumerator)
		End Function

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Class Constructors / Destructors"

		'Class is Initializing
		Public Sub New(ByVal ParentItem As ListItem)
			_Item = ParentItem
			Call Me.Initialize()
		End Sub

		'Routine to Initialize the Class
		Private Sub Initialize()
			_Count = 0
			_Items = New ListSubItem(DEFAULT_CAPACITY) {}
		End Sub

		'Class is Disposing
		Public Sub Dispose() Implements System.IDisposable.Dispose
			If (Not bDisposed) Then
				bDisposed = True
				Call Me.Clear()
				_Item = Nothing
				GC.SuppressFinalize(Me)
			End If
		End Sub

		'Class is Finalizing
		Protected Overrides Sub Finalize()
			If (Not bDisposed) Then Call Me.Dispose()
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	End Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>



	'List Sub Item Enumerator
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	Public Interface IListSubItemEnumerator
		ReadOnly Property Current() As ListSubItem
		Function MoveNext() As Boolean
		Sub Reset()
	End Interface
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>


	'List Sub Item Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	Public NotInheritable Class ListSubItem
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Declarations"

		'Implementations
		Implements IDisposable

		'Property Variables
		Friend _Collection As ListSubItems
		Friend _Item As ListItem		   'Parent Item
		Friend _Key, _Text As String
		Friend _Index As Integer
		Friend _Tag As Object
		Friend _BackColor, _ForeColor As Color
		Friend _Font As Font

		'Variables
		Private bDisposed As Boolean

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Properties"

		'Property for the Back Color
		<Category("Appearance"), Description("Gets or Sets the Back Color of the SubItem.")> _
		Public Property BackColor() As Color
			Get
				Return _BackColor
			End Get
			Set(ByVal Value As Color)
				If (_BackColor.Equals(Value)) Then Exit Property
				_BackColor = Value
				If (Not IsNothing(_Item)) Then If (Not IsNothing(_Item._Collection)) Then _Item._Collection.OnSubItemChanged(_Item._Index, _Index)
			End Set
		End Property

		'Property for the Fore Color
		<Category("Appearance"), Description("Gets or Sets the Fore Color of the SubItem.")> _
		Public Property ForeColor() As Color
			Get
				Return _ForeColor
			End Get
			Set(ByVal Value As Color)
				If (_ForeColor.Equals(Value)) Then Exit Property
				_ForeColor = Value
				If (Not IsNothing(_Item)) Then If (Not IsNothing(_Item._Collection)) Then _Item._Collection.OnSubItemChanged(_Item._Index, _Index)
			End Set
		End Property

		'Property for the Font
		<Category("Appearance"), Description("Gets or Sets the Font for the SubItem.")> _
		Public Property Font() As Font
			Get
				Return _Font
			End Get
			Set(ByVal Value As Font)
				If (_Font.Equals(Value)) Then Exit Property
				_Font = Value
				If (Not IsNothing(_Item)) Then If (Not IsNothing(_Item._Collection)) Then _Item._Collection.OnSubItemChanged(_Item._Index, _Index)
			End Set
		End Property

		'Property for the Index
		<Category("Appearance"), Description("Returns the Index of the SubItem within the Collection.")> _
		Public ReadOnly Property Index() As Integer
			Get
				Return _Index
			End Get
		End Property

		'Property for the Key
		<Category("Behavior"), Description("Gets or Sets the Key used for the SubItem.")> _
		Public Property Key() As String
			Get
				Return _Key
			End Get
			Set(ByVal Value As String)
				If (Not IsNothing(_Key)) Then If (_Key.Equals(Value)) Then Exit Property
				_Key = String.Intern(Value)
				If (Not IsNothing(_Collection)) Then If (_Collection.GetIndex(Value) = -1) Then _Key = String.Intern(Value)
			End Set
		End Property

		'Property for the Tag
		<Category("Behavior"), Description("Gets or Sets the User Defined Data to store within the SubItem.")> _
		Public Property Tag() As Object
			Get
				Return _Tag
			End Get
			Set(ByVal Value As Object)
				If (_Tag.Equals(Value)) Then Exit Property
				_Tag = Value
			End Set
		End Property

		'Property for the Text
		<Category("Appearance"), Description("Gets or Sets the Text to Display for the SubItem.")> _
		Public Property Text() As String
			Get
				Return _Text
			End Get
			Set(ByVal Value As String)
				If (Not IsNothing(_Text)) Then If (_Text.Equals(Value)) Then Exit Property
				_Text = String.Intern(Value)
				If (Not IsNothing(_Item)) Then If (Not IsNothing(_Item._Collection)) Then _Item._Collection.OnSubItemChanged(_Item._Index, _Index)
			End Set
		End Property

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Methods"

		'Function to Return the ToString
		Public Overrides Function ToString() As String
			Return _Text
		End Function

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Class Constructors / Destructors"

		'Initialize the Class
		Friend Sub New()
			_Index = -1
		End Sub

		'Initialize with Text
		Friend Sub New(ByVal Text As String)
			_Index = -1
			_Text = Text
		End Sub

		'Initialize with an Index / Text
		Friend Sub New(ByVal Index As Integer, ByVal Text As String)
			_Index = Index
			_Text = Text
		End Sub

		'Initialize with a Key and Text
		Friend Sub New(ByVal Key As String, ByVal Text As String)
			_Index = -1
			_Key = Key
			_Text = Text
		End Sub

		'Initialize with an Index, Key, and Text
		Friend Sub New(ByVal Index As Integer, ByVal Key As String, ByVal Text As String)
			_Index = Index
			_Key = Key
			_Text = Text
		End Sub

		'Routine to Dispose
		Public Sub Dispose() Implements System.IDisposable.Dispose
			If (Not bDisposed) Then
				bDisposed = True
				_Item = Nothing
				_Collection = Nothing
				_Tag = Nothing

				GC.SuppressFinalize(Me)
			End If
		End Sub

		'Routine to Finalize
		Protected Overrides Sub Finalize()
			If (Not bDisposed) Then Call Me.Dispose()
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	End Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

End Namespace