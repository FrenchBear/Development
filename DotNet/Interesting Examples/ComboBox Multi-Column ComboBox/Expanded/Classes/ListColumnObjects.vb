Option Strict On
Option Explicit On 
'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
Imports System.Collections
Imports System.ComponentModel
Imports System.Windows.Forms
'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>


Namespace Controls
	'ListColumn Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	Public NotInheritable Class ListColumn
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Declarations"

		'Implementations
		Implements IDisposable

		'Enumerations
		Public Enum ColumnDataTypes
			Text = 0
			Numeric = 1
			DateTime = 2
			Currency = 3
		End Enum

		'Property Variables
		Friend _Index, _Width As Integer
		Friend _Key, _Text As String
		Friend _Tag, _TagInternal As Object
		Friend _Collection As ListColumns
		Friend _DataType As ColumnDataTypes
		Friend _HAlign, _VAlign As Painting.TextAlignments
		Friend _Image As Integer
		Friend _Sorted As Boolean
		Friend _Visible As Boolean

		'Variables
		Private bDisposed As Boolean

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Properties"

		'Property for the Data Type
		Public Property DataType() As ColumnDataTypes
			Get
				Return _DataType
			End Get
			Set(ByVal Value As ColumnDataTypes)
				If (_DataType.Equals(Value)) Then Exit Property
				_DataType = Value
			End Set
		End Property

		'Property for the Index
		Public Property Index() As Integer
			Get
				Return _Index
			End Get
			Set(ByVal Value As Integer)
				If (_Index.Equals(Value)) Then Exit Property
				_Index = Value
				If (Not IsNothing(_Collection)) Then _Collection.Add(Me) 'Ensure the Item is Updated within the Collection
			End Set
		End Property

		'Property for the Key
		Public Property Key() As String
			Get
				Return _Key
			End Get
			Set(ByVal Value As String)
				If (Not IsNothing(_Key)) Then If (_Key.Equals(Value)) Then Exit Property
				Dim bExists As Boolean

				'Determine if the Key already Exists
				If (Not IsNothing(_Collection)) Then
					If (Not IsNothing(_Collection.Item(Value))) Then bExists = True
				End If
				If (Not bExists) Then _Key = Value
			End Set
		End Property

		'Property for the Image
		Public Property ImageIndex() As Integer
			Get
				Return _Image
			End Get
			Set(ByVal Value As Integer)
				If (_Image.Equals(Value)) Then Exit Property
				_Image = Value
				If (Not IsNothing(_Collection)) Then _Collection.OnItemChanged(Me)
			End Set
		End Property

		'Property for the Sorted State
		Public Property Sorted() As Boolean
			Get
				Return _Sorted
			End Get
			Set(ByVal Value As Boolean)
				If (_Sorted.Equals(Value)) Then Exit Property
				_Sorted = Value
				If (Not IsNothing(_Collection)) Then _Collection.OnItemChanged(Me)
			End Set
		End Property

		'Property for the Tag
		Public Property Tag() As Object
			Get
				Return _Tag
			End Get
			Set(ByVal Value As Object)
				If (Not IsNothing(_Tag)) Then If (_Tag.Equals(Value)) Then Exit Property
				_Tag = Value
			End Set
		End Property

		'Property for the Text
		Public Property Text() As String
			Get
				Return _Text
			End Get
			Set(ByVal Value As String)
				If (Not IsNothing(_Text)) Then If (_Text.Equals(Value)) Then Exit Property
				_Text = Value
				If (Not IsNothing(_Collection)) Then _Collection.OnItemChanged(Me)
			End Set
		End Property

		'Property for the Horizontal Alignment
		Public Property TextHAlign() As Painting.TextAlignments
			Get
				Return _HAlign
			End Get
			Set(ByVal Value As Painting.TextAlignments)
				If (_HAlign.Equals(Value)) Then Exit Property
				_HAlign = Value
				If (Not IsNothing(_Collection)) Then _Collection.OnItemChanged(Me)
			End Set
		End Property

		'Property for the Horizontal Alignment
		Public Property TextVAlign() As Painting.TextAlignments
			Get
				Return _VAlign
			End Get
			Set(ByVal Value As Painting.TextAlignments)
				If (_VAlign.Equals(Value)) Then Exit Property
				_VAlign = Value
				If (Not IsNothing(_Collection)) Then _Collection.OnItemChanged(Me)
			End Set
		End Property

		'Property for the Width
		Public Property Width() As Integer
			Get
				Return _Width
			End Get
			Set(ByVal Value As Integer)
				If (_Width.Equals(Value)) Then Exit Property
				_Width = Value
				If (Not IsNothing(_Collection)) Then _Collection.OnItemChanged(Me)
			End Set
		End Property

		'Property for the Visible State
		Public Property Visible() As Boolean
			Get
				Return _Visible
			End Get
			Set(ByVal Value As Boolean)
				If (_Visible.Equals(Value)) Then Exit Property
				_Visible = Value
			End Set
		End Property

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Methods"

		'Routine to Refresh the Item
		Public Sub Refresh()
			If (Not IsNothing(_Collection)) Then _Collection.OnItemChanged(Me)
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Class Constructors / Destructors"

		'Initialize the Class
		Public Sub New()
			Call Me.Initialize()
		End Sub

		'Initialize the Class with Text
		Public Sub New(ByVal Text As String)
			Call Me.Initialize()
			_Text = Text
		End Sub

		'Initialize with the Index & Text
		Public Sub New(ByVal Index As Integer, ByVal Text As String)
			Call Me.Initialize()
			_Index = Index
			_Text = Text
		End Sub

		'Initialize with the Key & Text
		Public Sub New(ByVal Key As String, ByVal Text As String)
			Call Me.Initialize()
			_Key = Key
			_Text = Text
		End Sub

		'Initialize with Index, Key, & Text
		Public Sub New(ByVal Index As Integer, ByVal Key As String, ByVal Text As String)
			Call Me.Initialize()
			_Index = Index
			_Key = Key
			_Text = Text
		End Sub

		'Routine to Initialize the Class
		Private Sub Initialize()
			_Index = -1
			_Width = -1
			_Image = -1
			_Visible = True
		End Sub

		'Routine to Dispose
		Public Sub Dispose() Implements IDisposable.Dispose
			If (Not bDisposed) Then
				bDisposed = True
				_Tag = Nothing
				_Collection = Nothing

				GC.SuppressFinalize(Me)
			End If
		End Sub

		'Finalize the Class
		Protected Overrides Sub Finalize()
			If (Not bDisposed) Then Call Me.Dispose()
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	End Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>


	'List Column Enumerator
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	Public Interface IListColumnEnumerator
		ReadOnly Property Current() As ListColumn
		Function MoveNext() As Boolean
		Sub Reset()
	End Interface
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>


	'List Column Collection Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	Public NotInheritable Class ListColumns
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Declarations"

		'Implementations
		Implements ICollection, IEnumerable, IList, IDisposable

		'Constants
		Private Const DEFAULT_CAPACITY As Integer = 10

		'Property Variables
		Private _Count As Integer

		'Variables
		Private _Items() As ListColumn
		Private bRefreshing, bDisposed As Boolean

		'Events
		Friend Event Cleared()
		Friend Event ItemAdded(ByVal Item As ListColumn)
		Friend Event ItemChanged(ByVal Item As ListColumn)
		Friend Event ItemIndexChanged(ByVal PreviousIndex As Integer, ByVal NewIndex As Integer)
		Friend Event ItemRemoved(ByVal Item As ListColumn)
		Friend Event Refreshed()

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
		Default Public ReadOnly Property Item(ByVal Index As Integer) As ListColumn
			Get
				'Exit if there are no Items
				If (_Count = 0) Then Return Nothing
				If (Index < 0) Or (Index > _Items.GetLength(0) - 1) Then Return Nothing Else Return _Items(Index)
			End Get
		End Property

		'Property to Return an Item using the Key
		Default Public ReadOnly Property Item(ByVal Key As String) As ListColumn
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

		'Routine to Add with No Parameters
		Public Sub Add()
			Call Me.Add(New ListColumn())
		End Sub

		'Routine to Add using the Text
		Public Sub Add(ByVal Text As String)
			Dim mItem As New ListColumn(Text)
			Call Me.Add(mItem)
			mItem = Nothing
		End Sub

		'Routine to Add using the Index and Text
		Public Sub Add(ByVal Index As Integer, ByVal Text As String)
			Dim mItem As New ListColumn(Index, Text)
			Call Me.Add(mItem)
			mItem = Nothing
		End Sub

		'Routine to Add using the Key and Text
		Public Sub Add(ByVal Key As String, ByVal Text As String)
			Dim mItem As New ListColumn(Key, Text)
			Call Me.Add(mItem)
			mItem = Nothing
		End Sub

		'Routine to Add using the Index, Key asd Text
		Public Sub Add(ByVal Index As Integer, ByVal Key As String, ByVal Text As String)
			Dim mItem As New ListColumn(Index, Key, Text)
			Call Me.Add(mItem)
			mItem = Nothing
		End Sub

		'Routine to Add using the Object
		'The Add Method will overwrite any Objects that use the Same Keys
		Public Sub Add(ByVal Item As ListColumn)
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
				_Items(i).Dispose()
				_Items(i) = Nothing
			Next i

			'Clear the Array
			_Count = 0
			Erase _Items
			If (Not bDisposed) Then _Items = New ListColumn(DEFAULT_CAPACITY) {}
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
		Public Sub Remove(ByVal Item As ListColumn)
			'Raise the Event 
			RaiseEvent ItemRemoved(Item)

			'Dispose the Item
			_Items(Item._Index).Dispose()
			_Items(Item._Index) = Nothing

			'Remove the Item from the Array
			_Count -= 1			  'Deincrement the Counter
			If (Item._Index < _Count) Then Array.Copy(_Items, Item._Index + 1, _Items, Item._Index, _Count - Item._Index)
			ReDim Preserve _Items(_Count)
			Item.Dispose() : Item = Nothing
		End Sub

		'Function for Enumeration
		Public Function GetEnumerator() As IListColumnEnumerator
			Return New ListColumns.ListColumnEnumerator(Me)
		End Function

		'Routine to Refresh the Collection
		Public Sub Refresh()
			bRefreshing = True
			RaiseEvent Refreshed()
			bRefreshing = False
		End Sub

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
					_Items = New ListColumn(DEFAULT_CAPACITY) {}
				End If
			End If
		End Sub

		'Function to Get the Index of a Key
		Friend Function GetIndex(ByVal Key As String) As Integer
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

		'List Column is Changing
		Friend Sub OnItemChanged(ByVal Item As ListColumn)
			RaiseEvent ItemChanged(Item)
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Nested Enumerator Class"

		Private Class ListColumnEnumerator
			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Declarations"

			'Implementations
			Implements System.Collections.IEnumerator, IListColumnEnumerator

			'Variables
			Private _Items As ListColumns
			Private _Index As Integer

#End Region
			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Properties"

			'Property to Return the Current Item (IFileEnumerator)
			Public ReadOnly Property Current() As ListColumn Implements IListColumnEnumerator.Current
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
			Public Function MoveNext() As Boolean Implements IEnumerator.MoveNext, IListColumnEnumerator.MoveNext
				_Index += 1
				If (_Index < _Items.Count) Then Return True Else Return False
			End Function

			'Routine to Reset
			Public Sub Reset() Implements IEnumerator.Reset, IListColumnEnumerator.Reset
				_Index = -1
			End Sub

#End Region
			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

			'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Class Constructors / Destructors"

			Public Sub New(ByVal Columns As ListColumns)
				_Items = Columns
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
			_Items = New ListColumn(DEFAULT_CAPACITY) {}
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
End Namespace