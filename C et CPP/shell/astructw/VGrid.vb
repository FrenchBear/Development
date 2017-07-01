Option Strict Off
Option Explicit On
Imports VB = Microsoft.VisualBasic
Friend Class VGrid
	Inherits System.Windows.Forms.UserControl
#Region "Windows Form Designer generated code "
	Public Sub New()
		MyBase.New()
		'This call is required by the Windows Form Designer.
		InitializeComponent()
        ReDim Preserve tctColType(fgGrid.Rows - 1)
        ReDim Preserve tsColOption(fgGrid.Rows - 1)
    End Sub
    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal Disposing As Boolean)
        If Disposing Then
            If Not components Is Nothing Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(Disposing)
    End Sub
    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer
    Public ToolTip1 As System.Windows.Forms.ToolTip
    Friend WithEvents cboInput As System.Windows.Forms.ComboBox
    Friend WithEvents txtInput As System.Windows.Forms.TextBox
    Friend WithEvents fgGrid As AxMSFlexGridLib.AxMSFlexGrid
    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(VGrid))
        Me.components = New System.ComponentModel.Container
        Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
        Me.ToolTip1.Active = True
        Me.cboInput = New System.Windows.Forms.ComboBox
        Me.txtInput = New System.Windows.Forms.TextBox
        Me.fgGrid = New AxMSFlexGridLib.AxMSFlexGrid
        CType(Me.fgGrid, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.ClientSize = New System.Drawing.Size(519, 362)
        MyBase.Location = New System.Drawing.Point(0, 0)
        MyBase.Name = "VGrid"
        Me.cboInput.Size = New System.Drawing.Size(81, 21)
        Me.cboInput.Location = New System.Drawing.Point(140, 296)
        Me.cboInput.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cboInput.TabIndex = 2
        Me.cboInput.Visible = False
        Me.cboInput.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cboInput.BackColor = System.Drawing.SystemColors.Window
        Me.cboInput.CausesValidation = True
        Me.cboInput.Enabled = True
        Me.cboInput.ForeColor = System.Drawing.SystemColors.WindowText
        Me.cboInput.IntegralHeight = True
        Me.cboInput.Cursor = System.Windows.Forms.Cursors.Default
        Me.cboInput.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cboInput.Sorted = False
        Me.cboInput.TabStop = True
        Me.cboInput.Name = "cboInput"
        Me.txtInput.AutoSize = False
        Me.txtInput.Size = New System.Drawing.Size(73, 17)
        Me.txtInput.Location = New System.Drawing.Point(276, 296)
        Me.txtInput.TabIndex = 0
        Me.txtInput.Visible = False
        Me.txtInput.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtInput.AcceptsReturn = True
        Me.txtInput.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
        Me.txtInput.BackColor = System.Drawing.SystemColors.Window
        Me.txtInput.CausesValidation = True
        Me.txtInput.Enabled = True
        Me.txtInput.ForeColor = System.Drawing.SystemColors.WindowText
        Me.txtInput.HideSelection = True
        Me.txtInput.ReadOnly = False
        Me.txtInput.MaxLength = 0
        Me.txtInput.Cursor = System.Windows.Forms.Cursors.IBeam
        Me.txtInput.Multiline = False
        Me.txtInput.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.txtInput.ScrollBars = System.Windows.Forms.ScrollBars.None
        Me.txtInput.TabStop = True
        Me.txtInput.BorderStyle = System.Windows.Forms.BorderStyle.None
        Me.txtInput.Name = "txtInput"
        fgGrid.OcxState = CType(resources.GetObject("fgGrid.OcxState"), System.Windows.Forms.AxHost.State)
        Me.fgGrid.Size = New System.Drawing.Size(485, 289)
        Me.fgGrid.Location = New System.Drawing.Point(0, 0)
        Me.fgGrid.TabIndex = 1
        Me.fgGrid.Name = "fgGrid"
        Me.Controls.Add(cboInput)
        Me.Controls.Add(txtInput)
        Me.Controls.Add(fgGrid)
        CType(Me.fgGrid, System.ComponentModel.ISupportInitialize).EndInit()
    End Sub
#End Region 
	Public Event ColTypeChange()
	Public Event FixedColsChange()
	Public Event EnabledChange()
	Public Event MaxLengthChange()
	Public Event FontChange()
	Public Event ColWidthChange()
	Public Event ColOptionChange()
	Public Event BackColorChange()
	Public Event ColsChange()
	Public Event CellBackColorChange()
	Public Event TextMatrixChange()
	Public Event ColAlignmentChange()
	Public Event RowSelChange()
	Public Event RowChange()
	Public Event CellForeColorChange()
	Public Event TextChange()
	Public Event BorderStyleChange()
	Public Event FixedRowsChange()
	Public Event ColSelChange()
	Public Event ForeColorChange()
	Public Event ColChange()
	Public Event RowsChange()
	' VGrid
	' Simple editable grid based on MS Flexgrid
	' Integrate low-level input management
	' 2005-05-08 FPVI
	' 2005-05-13 FPVI   BeforeRowDelete/AfterRowDelete Events; Sub AddItem; CellForeColor; InsertRow; DeleteRow; Clipboard operations
	' 2005-05-15 FPVI   EndCellEdit event replaced by more powerful CellChanged event; ColTypes
	
	
	
	
	Shadows Event Click(ByVal Sender As System.Object, ByVal e As System.EventArgs) 'MappingInfo=fgGrid,fgGrid,-1,Click
	Event DblClick(ByVal Sender As System.Object, ByVal e As System.EventArgs) 'MappingInfo=fgGrid,fgGrid,-1,DblClick
	<System.Runtime.InteropServices.ProgId("KeyDownEventArgs_NET.KeyDownEventArgs")> Public NotInheritable Class KeyDownEventArgs
		Inherits System.EventArgs
		Public KeyCode As Short
		Public Shift As Short
		Public Sub New(ByRef KeyCode As Short, ByRef Shift As Short)
			MyBase.New()
			Me.KeyCode = KeyCode
			Me.Shift = Shift
		End Sub
	End Class
	Shadows Event KeyDown(ByVal Sender As System.Object, ByVal e As KeyDownEventArgs) 'MappingInfo=fgGrid,fgGrid,-1,KeyDown
	<System.Runtime.InteropServices.ProgId("KeyPressEventArgs_NET.KeyPressEventArgs")> Public NotInheritable Class KeyPressEventArgs
		Inherits System.EventArgs
		Public KeyAscii As Short
		Public Sub New(ByRef KeyAscii As Short)
			MyBase.New()
			Me.KeyAscii = KeyAscii
		End Sub
	End Class
	Shadows Event KeyPress(ByVal Sender As System.Object, ByVal e As KeyPressEventArgs) 'MappingInfo=fgGrid,fgGrid,-1,KeyPress
	<System.Runtime.InteropServices.ProgId("KeyUpEventArgs_NET.KeyUpEventArgs")> Public NotInheritable Class KeyUpEventArgs
		Inherits System.EventArgs
		Public KeyCode As Short
		Public Shift As Short
		Public Sub New(ByRef KeyCode As Short, ByRef Shift As Short)
			MyBase.New()
			Me.KeyCode = KeyCode
			Me.Shift = Shift
		End Sub
	End Class
	Shadows Event KeyUp(ByVal Sender As System.Object, ByVal e As KeyUpEventArgs) 'MappingInfo=fgGrid,fgGrid,-1,KeyUp
	<System.Runtime.InteropServices.ProgId("MouseDownEventArgs_NET.MouseDownEventArgs")> Public NotInheritable Class MouseDownEventArgs
		Inherits System.EventArgs
		Public Button As Short
		Public Shift As Short
		Public x As Single
		Public y As Single
		Public Sub New(ByRef Button As Short, ByRef Shift As Short, ByRef x As Single, ByRef y As Single)
			MyBase.New()
			Me.Button = Button
			Me.Shift = Shift
			Me.x = x
			Me.y = y
		End Sub
	End Class
	Shadows Event MouseDown(ByVal Sender As System.Object, ByVal e As MouseDownEventArgs) 'MappingInfo=fgGrid,fgGrid,-1,MouseDown
	<System.Runtime.InteropServices.ProgId("MouseMoveEventArgs_NET.MouseMoveEventArgs")> Public NotInheritable Class MouseMoveEventArgs
		Inherits System.EventArgs
		Public Button As Short
		Public Shift As Short
		Public x As Single
		Public y As Single
		Public Sub New(ByRef Button As Short, ByRef Shift As Short, ByRef x As Single, ByRef y As Single)
			MyBase.New()
			Me.Button = Button
			Me.Shift = Shift
			Me.x = x
			Me.y = y
		End Sub
	End Class
	Shadows Event MouseMove(ByVal Sender As System.Object, ByVal e As MouseMoveEventArgs) 'MappingInfo=fgGrid,fgGrid,-1,MouseMove
	<System.Runtime.InteropServices.ProgId("MouseUpEventArgs_NET.MouseUpEventArgs")> Public NotInheritable Class MouseUpEventArgs
		Inherits System.EventArgs
		Public Button As Short
		Public Shift As Short
		Public x As Single
		Public y As Single
		Public Sub New(ByRef Button As Short, ByRef Shift As Short, ByRef x As Single, ByRef y As Single)
			MyBase.New()
			Me.Button = Button
			Me.Shift = Shift
			Me.x = x
			Me.y = y
		End Sub
	End Class
	Shadows Event MouseUp(ByVal Sender As System.Object, ByVal e As MouseUpEventArgs) 'MappingInfo=fgGrid,fgGrid,-1,MouseUp
	<System.Runtime.InteropServices.ProgId("BeforeRowDeleteEventArgs_NET.BeforeRowDeleteEventArgs")> Public NotInheritable Class BeforeRowDeleteEventArgs
		Inherits System.EventArgs
		Public iRowStart As Short
		Public iRowEnd As Short
		Public Sub New(ByVal iRowStart As Short, ByVal iRowEnd As Short)
			MyBase.New()
			Me.iRowStart = iRowStart
			Me.iRowEnd = iRowEnd
		End Sub
	End Class
	Event BeforeRowDelete(ByVal Sender As System.Object, ByVal e As BeforeRowDeleteEventArgs)
	<System.Runtime.InteropServices.ProgId("AfterRowDeleteEventArgs_NET.AfterRowDeleteEventArgs")> Public NotInheritable Class AfterRowDeleteEventArgs
		Inherits System.EventArgs
		Public iRowStart As Short
		Public iRowEnd As Short
		Public Sub New(ByVal iRowStart As Short, ByVal iRowEnd As Short)
			MyBase.New()
			Me.iRowStart = iRowStart
			Me.iRowEnd = iRowEnd
		End Sub
	End Class
	Event AfterRowDelete(ByVal Sender As System.Object, ByVal e As AfterRowDeleteEventArgs)
	<System.Runtime.InteropServices.ProgId("CellChangedEventArgs_NET.CellChangedEventArgs")> Public NotInheritable Class CellChangedEventArgs
		Inherits System.EventArgs
		Public iRow As Short
		Public iCol As Short
		Public ccrReason As vgCellChangedReason
		Public Sub New(ByVal iRow As Short, ByVal iCol As Short, ByVal ccrReason As vgCellChangedReason)
			MyBase.New()
			Me.iRow = iRow
			Me.iCol = iCol
			Me.ccrReason = ccrReason
		End Sub
	End Class
	Event CellChanged(ByVal Sender As System.Object, ByVal e As CellChangedEventArgs)
	Event EnterCell(ByVal Sender As System.Object, ByVal e As System.EventArgs)
	
	Public Enum vgCellChangedReason
		ccInteractiveEdit = 1
		ccInteractiveDelete = 2
		ccCutCommand = 3
		ccPasteCommand = 4
		ccCodeChange = 5
	End Enum
	
	Public Enum vgColType
		ctText = 0
		ctCombo = 1
	End Enum
	
	Private tctColType() As vgColType
	Private tsColOption() As String
	
	
	
	Private Sub fgGrid_EnterCell(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles fgGrid.EnterCell
		RaiseEvent EnterCell(Me, Nothing)
	End Sub
	
	Private Sub VGrid_Resize(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Resize
		fgGrid.SetBounds(0, 0, MyBase.Width, MyBase.Height)
	End Sub
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,BackColor
	
	Public Overrides Property BackColor() As System.Drawing.Color
		Get
			Return fgGrid.BackColor
		End Get
		Set(ByVal Value As System.Drawing.Color)
			fgGrid.BackColor = Value
			RaiseEvent BackColorChange()
		End Set
	End Property
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,ForeColor
	
	Public Overrides Property ForeColor() As System.Drawing.Color
		Get
			Return fgGrid.ForeColor
		End Get
		Set(ByVal Value As System.Drawing.Color)
			fgGrid.ForeColor = Value
			RaiseEvent ForeColorChange()
		End Set
	End Property
	
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,CellBackColor
	
	Public Property CellBackColor() As System.Drawing.Color
		Get
			CellBackColor = fgGrid.CellBackColor
		End Get
		Set(ByVal Value As System.Drawing.Color)
			fgGrid.CellBackColor = Value
			RaiseEvent CellBackColorChange()
		End Set
	End Property
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,CellForeColor
	
	Public Property CellForeColor() As System.Drawing.Color
		Get
			CellForeColor = fgGrid.CellForeColor
		End Get
		Set(ByVal Value As System.Drawing.Color)
			fgGrid.CellForeColor = Value
			RaiseEvent CellForeColorChange()
		End Set
	End Property
	
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,Enabled
	
	Public Shadows Property Enabled() As Boolean
		Get
			Return fgGrid.Enabled
		End Get
		Set(ByVal Value As Boolean)
			fgGrid.Enabled = Value
			RaiseEvent EnabledChange()
		End Set
	End Property
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,Font
	
	Public Overrides Property Font() As System.Drawing.Font
		Get
			Font = fgGrid.Font
		End Get
		Set(ByVal Value As System.Drawing.Font)
			fgGrid.Font = Value
			RaiseEvent FontChange()
		End Set
	End Property
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,BorderStyle
	
	Public Property BorderStyle() As MSFlexGridLib.BorderStyleSettings
		Get
			BorderStyle = fgGrid.BorderStyle
		End Get
		Set(ByVal Value As MSFlexGridLib.BorderStyleSettings)
			fgGrid.BorderStyle = Value
			RaiseEvent BorderStyleChange()
		End Set
	End Property
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,Rows
	
	Public Property Rows() As Integer
		Get
			Rows = fgGrid.Rows
		End Get
		Set(ByVal Value As Integer)
			fgGrid.Rows = Value
			RaiseEvent RowsChange()
		End Set
	End Property
	
	
	
	Public Property MaxLength() As Integer
		Get
			'UPGRADE_WARNING: TextBox property txtInput.MaxLength has a new behavior. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
			MaxLength = txtInput.Maxlength
		End Get
		Set(ByVal Value As Integer)
			'UPGRADE_WARNING: TextBox property txtInput.MaxLength has a new behavior. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
			txtInput.Maxlength = Value
			RaiseEvent MaxLengthChange()
		End Set
	End Property
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,FixedCols
	
	Public Property FixedCols() As Integer
		Get
			FixedCols = fgGrid.FixedCols
		End Get
		Set(ByVal Value As Integer)
			fgGrid.FixedCols = Value
			RaiseEvent FixedColsChange()
		End Set
	End Property
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,FixedRows
	
	Public Property FixedRows() As Integer
		Get
			FixedRows = fgGrid.FixedRows
		End Get
		Set(ByVal Value As Integer)
			fgGrid.FixedRows = Value
			RaiseEvent FixedRowsChange()
		End Set
	End Property
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,Cols
	
	Public Property cols() As Integer
		Get
			cols = fgGrid.cols
		End Get
		Set(ByVal Value As Integer)
			fgGrid.cols = Value
			RaiseEvent ColsChange()
			ReDim Preserve tctColType(Value - 1)
			ReDim Preserve tsColOption(Value - 1)
		End Set
	End Property
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,TextMatrix
	
	Public Property TextMatrix(ByVal Row As Integer, ByVal col As Integer) As String
		Get
			TextMatrix = fgGrid.get_TextMatrix(Row, col)
		End Get
		Set(ByVal Value As String)
			fgGrid.set_TextMatrix(Row, col, Value)
			RaiseEvent TextMatrixChange()
			RaiseEvent CellChanged(Me, New CellChangedEventArgs(Row, col, vgCellChangedReason.ccCodeChange))
		End Set
	End Property
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,ColWidth
	
	Public Property ColWidth(ByVal Index As Integer) As Integer
		Get
			ColWidth = fgGrid.get_ColWidth(Index)
		End Get
		Set(ByVal Value As Integer)
			fgGrid.set_ColWidth(Index, Value)
			RaiseEvent ColWidthChange()
		End Set
	End Property
	
	
	
	Public Property ColType(ByVal Index As Integer) As vgColType
		Get
			ColType = tctColType(Index)
		End Get
		Set(ByVal Value As vgColType)
			tctColType(Index) = Value
			RaiseEvent ColTypeChange()
		End Set
	End Property
	
	
	
	Public Property ColOption(ByVal Index As Integer) As String
		Get
			ColOption = tsColOption(Index)
		End Get
		Set(ByVal Value As String)
			tsColOption(Index) = Value
			RaiseEvent ColOptionChange()
		End Set
	End Property
	
	
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,ColAlignment
	
	Public Property ColAlignment(ByVal Index As Integer) As Integer
		Get
			ColAlignment = fgGrid.get_ColAlignment(Index)
		End Get
		Set(ByVal Value As Integer)
			fgGrid.set_ColAlignment(Index, Value)
			RaiseEvent ColAlignmentChange()
		End Set
	End Property
	
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,Row
	
	Public Property Row() As Short
		Get
			Row = fgGrid.Row
		End Get
		Set(ByVal Value As Short)
			fgGrid.Row = Value
			RaiseEvent RowChange()
		End Set
	End Property
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,Col
	
	Public Property col() As Object
		Get
			'UPGRADE_WARNING: Couldn't resolve default property of object col. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1037"'
			col = fgGrid.col
		End Get
		Set(ByVal Value As Object)
			'UPGRADE_WARNING: Couldn't resolve default property of object New_Col. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1037"'
			fgGrid.col = Value
			RaiseEvent ColChange()
		End Set
	End Property
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,Text
	
	Public Overrides Property Text() As String
		Get
			Return fgGrid.Text
		End Get
		Set(ByVal Value As String)
			fgGrid.Text = Value
			RaiseEvent TextChange()
			RaiseEvent CellChanged(Me, New CellChangedEventArgs(fgGrid.Row, fgGrid.col, vgCellChangedReason.ccCodeChange))
		End Set
	End Property
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,RowSel
	
	Public Property RowSel() As Short
		Get
			RowSel = fgGrid.RowSel
		End Get
		Set(ByVal Value As Short)
			fgGrid.RowSel = Value
			RaiseEvent RowSelChange()
		End Set
	End Property
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,ColSel
	
	Public Property ColSel() As Short
		Get
			ColSel = fgGrid.ColSel
		End Get
		Set(ByVal Value As Short)
			fgGrid.ColSel = Value
			RaiseEvent ColSelChange()
		End Set
	End Property
	
	'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
	'MappingInfo=fgGrid,fgGrid,-1,Refresh
	Public Overrides Sub Refresh()
		fgGrid.CtlRefresh()
	End Sub
	
	Private Sub fgGrid_ClickEvent(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles fgGrid.ClickEvent
		RaiseEvent Click(Me, Nothing)
	End Sub
	
	Private Sub fgGrid_KeyUpEvent(ByVal eventSender As System.Object, ByVal eventArgs As AxMSFlexGridLib.DMSFlexGridEvents_KeyUpEvent) Handles fgGrid.KeyUpEvent
		RaiseEvent KeyUp(Me, New KeyUpEventArgs(eventArgs.KeyCode, eventArgs.Shift))
	End Sub
	
	Private Sub fgGrid_MouseDownEvent(ByVal eventSender As System.Object, ByVal eventArgs As AxMSFlexGridLib.DMSFlexGridEvents_MouseDownEvent) Handles fgGrid.MouseDownEvent
		RaiseEvent MouseDown(Me, New MouseDownEventArgs(eventArgs.Button, eventArgs.Shift, eventArgs.x, eventArgs.y))
	End Sub
	
	Private Sub fgGrid_MouseMoveEvent(ByVal eventSender As System.Object, ByVal eventArgs As AxMSFlexGridLib.DMSFlexGridEvents_MouseMoveEvent) Handles fgGrid.MouseMoveEvent
		RaiseEvent MouseMove(Me, New MouseMoveEventArgs(eventArgs.Button, eventArgs.Shift, eventArgs.x, eventArgs.y))
	End Sub
	
	Private Sub fgGrid_MouseUpEvent(ByVal eventSender As System.Object, ByVal eventArgs As AxMSFlexGridLib.DMSFlexGridEvents_MouseUpEvent) Handles fgGrid.MouseUpEvent
		RaiseEvent MouseUp(Me, New MouseUpEventArgs(eventArgs.Button, eventArgs.Shift, eventArgs.x, eventArgs.y))
	End Sub
	

	Public Sub AddItem(ByVal New_Text As String)
		fgGrid.AddItem(New_Text)
	End Sub
	
	
	
	
	'===================================================================
	' Grid management
	
	Private Sub fgGrid_DblClick(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles fgGrid.DblClick
		RaiseEvent DblClick(Me, Nothing)
		GridEditA(Asc(" "))
	End Sub
	
	Private Sub fgGrid_KeyPressEvent(ByVal eventSender As System.Object, ByVal eventArgs As AxMSFlexGridLib.DMSFlexGridEvents_KeyPressEvent) Handles fgGrid.KeyPressEvent
		RaiseEvent KeyPress(Me, New KeyPressEventArgs(eventArgs.KeyAscii))
		If eventArgs.KeyAscii = 32 And bShiftPressed Then Exit Sub ' Row selection
		If eventArgs.KeyAscii >= 32 Then GridEditA(eventArgs.KeyAscii)
	End Sub
	
	Private Sub fgGrid_KeyDownEvent(ByVal eventSender As System.Object, ByVal eventArgs As AxMSFlexGridLib.DMSFlexGridEvents_KeyDownEvent) Handles fgGrid.KeyDownEvent
		RaiseEvent KeyDown(Me, New KeyDownEventArgs(eventArgs.KeyCode, eventArgs.Shift))
		If eventArgs.KeyCode = 0 Then Exit Sub
		
		Dim c1, r1, r2, c2 As Short
		r1 = iMin(fgGrid.Row, fgGrid.RowSel) : r2 = iMax(fgGrid.Row, fgGrid.RowSel)
		c1 = iMin(fgGrid.col, fgGrid.ColSel) : c2 = iMax(fgGrid.col, fgGrid.ColSel)
		
		' Row Selection (Shift+Space)
		If eventArgs.KeyCode = 32 And eventArgs.Shift = 1 Then
			fgGrid.Row = r1
			fgGrid.col = fgGrid.FixedCols
			fgGrid.ColSel = fgGrid.cols - 1
			fgGrid.RowSel = r2
			eventArgs.KeyCode = 0
			Exit Sub
		End If
		
		If eventArgs.KeyCode = System.Windows.Forms.Keys.F2 Then GridEditA(Asc(" "))
		
		Dim i, j As Short
		If eventArgs.KeyCode = System.Windows.Forms.Keys.Delete And eventArgs.Shift = 0 Then
			' Cell delete
			For i = r1 To r2
				For j = c1 To c2
					If fgGrid.get_TextMatrix(i, j) <> "" Then
						If fgGrid.get_TextMatrix(i, j) <> "" Then
							fgGrid.set_TextMatrix(i, j, "")
							RaiseEvent CellChanged(Me, New CellChangedEventArgs(i, j, vgCellChangedReason.ccInteractiveDelete))
						End If
					End If
				Next 
			Next 
			fgGrid.Row = r1 : fgGrid.col = c1
			eventArgs.KeyCode = 0
			Exit Sub
		End If
		
		' Clipboard shortcuts, in case hosting application do not
		' handle them in menus
		If eventArgs.KeyCode = Asc("C") And eventArgs.Shift = 2 Then
			Copy()
			eventArgs.KeyCode = 0
			Exit Sub
		End If
		If eventArgs.KeyCode = Asc("V") And eventArgs.Shift = 2 Then
			Paste()
			eventArgs.KeyCode = 0
			Exit Sub
		End If
		If eventArgs.KeyCode = Asc("X") And eventArgs.Shift = 2 Then
			Cut()
			eventArgs.KeyCode = 0
			Exit Sub
		End If
	End Sub
	
	Sub GridEditA(ByRef KeyAscii As Short)
		Dim s As Object
		Dim i As Short
		If tctColType(fgGrid.col) = vgColType.ctCombo Then
			' Prepare edit combo box
			cboInput.Items.Clear()
			For	Each s In Split(tsColOption(fgGrid.col), ",")
				'UPGRADE_WARNING: Couldn't resolve default property of object s. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1037"'
				cboInput.Items.Add(s)
			Next s
			
			cboInput.Font = VB6.FontChangeName(cboInput.Font, fgGrid.Font.Name)
			cboInput.Font = VB6.FontChangeSize(cboInput.Font, fgGrid.Font.SizeInPoints)
			Select Case KeyAscii
				Case 0 To Asc(" ") - 1
					cboInput.SelectedIndex = 0
				Case Asc(" ")
					For i = 0 To cboInput.Items.Count - 1
						If VB6.GetItemString(cboInput, i) = fgGrid.Text Then
							cboInput.SelectedIndex = i
							Exit For
						End If
					Next 
				Case Else
					For i = 0 To cboInput.Items.Count - 1
						If VB.Left(VB6.GetItemString(cboInput, i), 1) = Chr(KeyAscii) Then
							cboInput.SelectedIndex = i
							Exit For
						End If
					Next 
			End Select
			
			' Position the combo
			cboInput.Left = VB6.TwipsToPixelsX(fgGrid.CellLeft + VB6.PixelsToTwipsX(fgGrid.Left))
			cboInput.Top = VB6.TwipsToPixelsY(fgGrid.CellTop + VB6.PixelsToTwipsY(fgGrid.Top))
			cboInput.Width = VB6.TwipsToPixelsX(fgGrid.CellWidth + 300)
			'cboInput.Height = fgGrid.CellHeight
			cboInput.Visible = True
			cboInput.Focus()
			
		Else
			
			' Prepare edit text box
			txtInput.Font = VB6.FontChangeName(txtInput.Font, fgGrid.Font.Name)
			txtInput.Font = VB6.FontChangeSize(txtInput.Font, fgGrid.Font.SizeInPoints)
			Select Case KeyAscii
				Case 0 To Asc(" ")
					txtInput.Text = fgGrid.Text
					txtInput.SelectionStart = 1000
				Case Else
					txtInput.Text = Chr(KeyAscii)
					txtInput.SelectionStart = 1
			End Select
			txtInput.SelectionLength = 0
			
			'position the edit box
			txtInput.Left = VB6.TwipsToPixelsX(fgGrid.CellLeft + VB6.PixelsToTwipsX(fgGrid.Left))
			txtInput.Top = VB6.TwipsToPixelsY(fgGrid.CellTop + VB6.PixelsToTwipsY(fgGrid.Top))
			txtInput.Width = VB6.TwipsToPixelsX(fgGrid.CellWidth)
			txtInput.Height = VB6.TwipsToPixelsY(fgGrid.CellHeight)
			txtInput.Visible = True
			txtInput.Focus()
			
		End If
	End Sub
	
	
	Private Sub txtInput_KeyDown(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.KeyEventArgs) Handles txtInput.KeyDown
		Dim KeyCode As Short = eventArgs.KeyCode
		Dim Shift As Short = eventArgs.KeyData \ &H10000
		Dim R, c As Short
		Dim rs, cs As Short
		Dim i As Short
		Dim sTxt As String
		Select Case KeyCode
			Case System.Windows.Forms.Keys.Escape
				txtInput.Visible = False
				fgGrid.Focus()
				
			Case System.Windows.Forms.Keys.Return
				R = fgGrid.Row
				c = fgGrid.col
				rs = fgGrid.RowSel
				cs = fgGrid.ColSel
				fgGrid.Focus()
				System.Windows.Forms.Application.DoEvents()
				' Input in several cells
				If R <> rs Then
					sTxt = fgGrid.Text
					For i = iMin(R, rs) To iMax(R, rs)
						If i <> R Then
							If fgGrid.get_TextMatrix(i, c) <> sTxt Then
								fgGrid.set_TextMatrix(i, c, sTxt)
								RaiseEvent CellChanged(Me, New CellChangedEventArgs(i, c, vgCellChangedReason.ccInteractiveEdit))
							End If
						End If
					Next 
					fgGrid.Row = R
					fgGrid.col = c
				Else
					' Simple validation
					' Auto Move Down
					If R < fgGrid.Rows - 1 Then
						fgGrid.Row = R + 1
					End If
					fgGrid.col = c
				End If
				EnsureSelectionVisible()
				
			Case System.Windows.Forms.Keys.Down
				fgGrid.Focus()
				System.Windows.Forms.Application.DoEvents()
				If fgGrid.Row < fgGrid.Rows - 1 Then
					fgGrid.Row = fgGrid.Row + 1
				End If
				
			Case System.Windows.Forms.Keys.Up
				fgGrid.Focus()
				System.Windows.Forms.Application.DoEvents()
				If fgGrid.Row > fgGrid.FixedRows Then
					fgGrid.Row = fgGrid.Row - 1
				End If
		End Select
	End Sub
	
	' Nice trick...
	Public Sub EnsureSelectionVisible()
		Dim x As Integer
		x = fgGrid.CellLeft + VB6.PixelsToTwipsX(fgGrid.Left) + fgGrid.CellTop + VB6.PixelsToTwipsY(fgGrid.Top)
	End Sub
	
	
	Private Sub txtInput_KeyPress(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.KeyPressEventArgs) Handles txtInput.KeyPress
		Dim KeyAscii As Short = Asc(eventArgs.KeyChar)
		' Noise suppression
		If KeyAscii = System.Windows.Forms.Keys.Return Then KeyAscii = 0
		If KeyAscii = 0 Then
			eventArgs.Handled = True
		End If
	End Sub
	
	Private Sub txtInput_Leave(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles txtInput.Leave
		If txtInput.Visible Then EndCellEdit()
	End Sub
	
	
	Private Sub cboInput_KeyDown(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.KeyEventArgs) Handles cboInput.KeyDown
		Dim KeyCode As Short = eventArgs.KeyCode
		Dim Shift As Short = eventArgs.KeyData \ &H10000
		Dim R, c As Short
		Dim rs, cs As Short
		Dim i As Short
		Dim sTxt As String
		Select Case KeyCode
			Case System.Windows.Forms.Keys.F2
				System.Windows.Forms.SendKeys.Send("{F4}")
				
			Case System.Windows.Forms.Keys.Escape
				cboInput.Visible = False
				fgGrid.Focus()
				
			Case System.Windows.Forms.Keys.Return
				R = fgGrid.Row
				c = fgGrid.col
				rs = fgGrid.RowSel
				cs = fgGrid.ColSel
				fgGrid.Focus()
				System.Windows.Forms.Application.DoEvents()
				If R <> rs Then
					sTxt = fgGrid.Text
					For i = iMin(R, rs) To iMax(R, rs)
						If i <> R Then
							If fgGrid.get_TextMatrix(i, c) <> sTxt Then
								fgGrid.set_TextMatrix(i, c, sTxt)
								RaiseEvent CellChanged(Me, New CellChangedEventArgs(i, c, vgCellChangedReason.ccInteractiveEdit))
							End If
						End If
					Next 
					fgGrid.Row = R
					fgGrid.col = c
				End If
		End Select
	End Sub
	
	Private Sub cboInput_KeyPress(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.KeyPressEventArgs) Handles cboInput.KeyPress
		Dim KeyAscii As Short = Asc(eventArgs.KeyChar)
		' Noise suppression
		If KeyAscii = System.Windows.Forms.Keys.Return Then KeyAscii = 0
		If KeyAscii = 0 Then
			eventArgs.Handled = True
		End If
	End Sub
	
	Private Sub cboInput_Leave(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cboInput.Leave
		If cboInput.Visible Then
			EndCellEdit()
		End If
	End Sub
	
	
	
	Private Sub fgGrid_Leave(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles fgGrid.Leave
		If bTabPressed Then
			fgGrid.Focus()
			If bShiftPressed Then
				If fgGrid.col > 1 Then fgGrid.col = fgGrid.col - 1
			Else
				If fgGrid.col < fgGrid.cols - 1 Then fgGrid.col = fgGrid.col + 1
			End If
		End If
	End Sub
	
	Private Sub fgGrid_LeaveCell(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles fgGrid.LeaveCell
		If txtInput.Visible Or cboInput.Visible Then EndCellEdit()
	End Sub
	
	
	Sub EndCellEdit()
		Dim c As System.Windows.Forms.Control
		If txtInput.Visible Then
			c = txtInput
		Else
			c = cboInput
		End If
		
		If c.Visible Then
			If fgGrid.Text <> c.Text Then
				fgGrid.Text = c.Text
				RaiseEvent CellChanged(Me, New CellChangedEventArgs(fgGrid.Row, fgGrid.col, vgCellChangedReason.ccInteractiveEdit))
			End If
			c.Visible = False
			
			If bTabPressed Then
				fgGrid.Focus()
				If bShiftPressed Then
					If fgGrid.col > 1 Then fgGrid.col = fgGrid.col - 1
				Else
					If fgGrid.col < fgGrid.cols - 1 Then fgGrid.col = fgGrid.col + 1
				End If
			End If
		End If
	End Sub
	
	
	' Adds a line if there is any information on last line
	Public Sub AutoTableExpansion()
		Dim i As Short
		For i = fgGrid.FixedCols To fgGrid.cols - 1
			If fgGrid.get_TextMatrix(fgGrid.Rows - 1, i) <> "" Then
				fgGrid.Rows = fgGrid.Rows + 1
				Exit Sub
			End If
		Next 
	End Sub
	
	
	' Insert rows in grid
	Public Sub InsertRow(ByVal r1 As Short, ByVal r2 As Short)
		Dim iOldRows, iDelta, iNewRows As Short
		iDelta = r2 - r1 + 1
		iOldRows = fgGrid.Rows
		iNewRows = iOldRows + iDelta
		fgGrid.Rows = iNewRows
		
		Dim R, c As Short
		For R = iOldRows - iDelta To r1 Step -1
			For c = 0 To fgGrid.cols - 1
				fgGrid.set_TextMatrix(R + iDelta, c, fgGrid.get_TextMatrix(R, c))
			Next 
		Next 
		For R = r1 To r2
			For c = 0 To fgGrid.cols - 1
				fgGrid.set_TextMatrix(R, c, "")
			Next 
		Next 
		fgGrid.Row = r1
		fgGrid.col = 1
	End Sub
	
	' Deletes rows in the grid
	Public Sub DeleteRow(ByVal r1 As Short, ByVal r2 As Short)
		Dim iOldRows, iDelta, iNewRows As Short
		iDelta = r2 - r1 + 1
		iOldRows = fgGrid.Rows
		iNewRows = iOldRows - iDelta
		
		Dim R, c As Short
		RaiseEvent BeforeRowDelete(Me, New BeforeRowDeleteEventArgs(r1, r2))
		For R = r1 To iOldRows - 1 - iDelta
			For c = 0 To fgGrid.cols - 1
				fgGrid.set_TextMatrix(R, c, fgGrid.get_TextMatrix(R + iDelta, c))
			Next 
		Next 
		fgGrid.Row = r1
		fgGrid.col = 1
		
		fgGrid.Rows = iNewRows
		RaiseEvent AfterRowDelete(Me, New AfterRowDeleteEventArgs(r1, r2))
	End Sub
	
	
	' ========================================================================
	' Clipboard
	
	Public Sub Cut()
		CutCopy(True)
	End Sub
	
	Public Sub Copy()
		CutCopy(False)
	End Sub
	
	Sub CutCopy(ByVal bCut As Boolean)
		Dim r1, R, r2 As Short
		Dim c1, c, c2 As Short
		Dim s As String
		r1 = iMin(fgGrid.Row, fgGrid.RowSel)
		r2 = iMax(fgGrid.Row, fgGrid.RowSel)
		c1 = iMin(fgGrid.col, fgGrid.ColSel)
		c2 = iMax(fgGrid.col, fgGrid.ColSel)
		For R = r1 To r2
			For c = c1 To c2
				s = s & fgGrid.get_TextMatrix(R, c)
				If c <> c2 Then s = s & vbTab
				If bCut Then
					If fgGrid.get_TextMatrix(R, c) <> "" Then
						fgGrid.set_TextMatrix(R, c, "")
						RaiseEvent CellChanged(Me, New CellChangedEventArgs(R, c, vgCellChangedReason.ccCutCommand))
					End If
				End If
			Next 
			s = s & vbCrLf
		Next 
		'UPGRADE_ISSUE: Clipboard method Clipboard.Clear was not upgraded. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2069"'
		Clipboard.Clear()
		'UPGRADE_ISSUE: Clipboard method Clipboard.SetText was not upgraded. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2069"'
		Clipboard.SetText(s)
	End Sub
	
	Public Sub Paste()
		'UPGRADE_ISSUE: Constant vbCFText was not upgraded. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2070"'
		'UPGRADE_ISSUE: Clipboard method Clipboard.GetFormat was not upgraded. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2069"'
		If Not Clipboard.GetFormat(vbCFText) Then Exit Sub
		
		Dim t() As String
		Dim rm, cm As Short
		Dim r1, R, r2 As Short
		Dim c1, c, c2 As Short
		
		'UPGRADE_ISSUE: Clipboard method Clipboard.GetText was not upgraded. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2069"'
		t = Split(Replace(Clipboard.GetText, vbCrLf, vbCr), vbCr)
		rm = iMax(0, UBound(t) - 1)
		cm = 0
		For R = 0 To rm
			cm = iMax(cm, UBound(Split(t(R), vbTab)))
		Next 
		
		r1 = iMin(fgGrid.Row, fgGrid.RowSel)
		r2 = iMax(fgGrid.Row, fgGrid.RowSel)
		c1 = iMin(fgGrid.col, fgGrid.ColSel)
		c2 = iMax(fgGrid.col, fgGrid.ColSel)
		
		' if there is a selection before paste
		If r1 <> r2 Or c1 <> c2 Then
			' Just one text in clipboard: fill selection
			If rm = 0 And cm = 0 Then
				For R = r1 To r2
					For c = c1 To c2
						fgGrid.set_TextMatrix(R, c, t(0))
						RaiseEvent CellChanged(Me, New CellChangedEventArgs(R, c, vgCellChangedReason.ccPasteCommand))
					Next 
				Next 
				Exit Sub
			End If
			
			' Else selection size must match clipboard size
			If r2 - r1 <> rm Or c2 - c1 <> cm Then
				MsgBox("Selection (" & r2 - r1 + 1 & "R x " & c2 - c1 + 1 & "C) and Clipboard (" & rm + 1 & "R x " & cm + 1 & "C) are not the same size." & vbCrLf & "Have only top left destination cell selected when pasting a block of cells.", MsgBoxStyle.Exclamation)
				Exit Sub
			End If
		End If
		
		' Past from r1,c1
		Dim l() As String
		For R = 0 To rm
			l = Split(t(R), vbTab)
			For c = 0 To cm
				If c > UBound(l) Then
					If fgGrid.get_TextMatrix(r1 + R, c1 + c) <> "" Then
						fgGrid.set_TextMatrix(r1 + R, c1 + c, "")
						RaiseEvent CellChanged(Me, New CellChangedEventArgs(R, c, vgCellChangedReason.ccPasteCommand))
					End If
				Else
					If fgGrid.get_TextMatrix(r1 + R, c1 + c) <> l(c) Then
						fgGrid.set_TextMatrix(r1 + R, c1 + c, l(c))
						RaiseEvent CellChanged(Me, New CellChangedEventArgs(R, c, vgCellChangedReason.ccPasteCommand))
					End If
				End If
			Next 
		Next 
	End Sub
	
	
	' Resize user columns, with a maximum of 5000
	Public Sub AutoResize()
		Dim i, j As Short
		Dim iMaxW As Short
		For i = fgGrid.FixedCols To fgGrid.cols - 1
			iMaxW = 0
			For j = 0 To fgGrid.Rows - 1
				'UPGRADE_ISSUE: UserControl method VGrid.TextWidth was not upgraded. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2064"'
				If TextWidth(fgGrid.get_TextMatrix(j, i)) > iMaxW Then iMaxW = TextWidth(fgGrid.get_TextMatrix(j, i))
			Next 
			fgGrid.set_ColWidth(i, iMin(iMaxW + 100, 5000))
		Next 
	End Sub
End Class