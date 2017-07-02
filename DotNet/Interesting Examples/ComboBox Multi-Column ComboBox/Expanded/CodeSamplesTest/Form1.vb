Public Class Form1
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
	Friend WithEvents cboBox1 As CodeSamples.Controls.BaseComboBox
	Friend WithEvents cboBox2 As CodeSamples.Controls.BaseComboBox
	Friend WithEvents cboBox3 As CodeSamples.Controls.BaseComboBox
	Friend WithEvents cboBox4 As CodeSamples.Controls.BaseComboBox
	Friend WithEvents imgList As System.Windows.Forms.ImageList
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Me.components = New System.ComponentModel.Container
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Form1))
		Me.cboBox1 = New CodeSamples.Controls.BaseComboBox
		Me.cboBox2 = New CodeSamples.Controls.BaseComboBox
		Me.cboBox3 = New CodeSamples.Controls.BaseComboBox
		Me.cboBox4 = New CodeSamples.Controls.BaseComboBox
		Me.imgList = New System.Windows.Forms.ImageList(Me.components)
		Me.SuspendLayout()
		'
		'cboBox1
		'
		Me.cboBox1.ActiveItem = Nothing
		Me.cboBox1.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
		Me.cboBox1.ItemImages = Me.imgList
		Me.cboBox1.Location = New System.Drawing.Point(28, 44)
		Me.cboBox1.Name = "cboBox1"
		Me.cboBox1.Size = New System.Drawing.Size(164, 21)
		Me.cboBox1.TabIndex = 0
		'
		'cboBox2
		'
		Me.cboBox2.ActiveItem = Nothing
		Me.cboBox2.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
		Me.cboBox2.ItemImages = Me.imgList
		Me.cboBox2.Location = New System.Drawing.Point(28, 72)
		Me.cboBox2.Name = "cboBox2"
		Me.cboBox2.Size = New System.Drawing.Size(164, 21)
		Me.cboBox2.TabIndex = 1
		'
		'cboBox3
		'
		Me.cboBox3.ActiveItem = Nothing
		Me.cboBox3.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
		Me.cboBox3.ItemImages = Me.imgList
		Me.cboBox3.Location = New System.Drawing.Point(28, 100)
		Me.cboBox3.Name = "cboBox3"
		Me.cboBox3.Size = New System.Drawing.Size(164, 21)
		Me.cboBox3.TabIndex = 2
		'
		'cboBox4
		'
		Me.cboBox4.ActiveItem = Nothing
		Me.cboBox4.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
		Me.cboBox4.ItemImages = Nothing
		Me.cboBox4.Location = New System.Drawing.Point(28, 126)
		Me.cboBox4.Name = "cboBox4"
		Me.cboBox4.Size = New System.Drawing.Size(164, 21)
		Me.cboBox4.TabIndex = 3
		'
		'imgList
		'
		Me.imgList.ImageSize = New System.Drawing.Size(16, 16)
		Me.imgList.ImageStream = CType(resources.GetObject("imgList.ImageStream"), System.Windows.Forms.ImageListStreamer)
		Me.imgList.TransparentColor = System.Drawing.Color.Transparent
		'
		'Form1
		'
		Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
		Me.ClientSize = New System.Drawing.Size(292, 273)
		Me.Controls.Add(Me.cboBox4)
		Me.Controls.Add(Me.cboBox3)
		Me.Controls.Add(Me.cboBox2)
		Me.Controls.Add(Me.cboBox1)
		Me.Name = "Form1"
		Me.Text = "Form1"
		Me.ResumeLayout(False)

	End Sub

#End Region

	

	Private Sub cboBox3_FocusChanging(ByVal Sender As Object, ByVal e As CodeSamples.Controls.FocusChangeEventArgs) Handles cboBox3.FocusChanging
		If (e.Direction = CodeSamples.Controls.FocusDirection.Forward) Then
			e.Handled = True
			cboBox1.Focus()
		ElseIf (e.Direction = CodeSamples.Controls.FocusDirection.Backward) Then
			e.Handled = True
			cboBox4.Focus()
		End If
	End Sub

	'Form is Loading
	Private Sub Form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Load

		With cboBox1
			.ListColumns.Add()
			.ListItems.Add("California") : .ListItems(0).ImageIndex = 0
			.ListItems.Add("Ohio") : .ListItems(1).ImageIndex = 0
			.ListItems.Add("New Mexico") : .ListItems(2).ImageIndex = 0
		End With

		With cboBox2
			.ListColumns.Add() : .ListColumns.Add()
			.ListItems.Add("USA") : .ListItems(0).ListSubItems.Add("American") : .ListItems(0).ImageIndex = 1
			.ListItems.Add("Germany") : .ListItems(1).ListSubItems.Add("German")
            .ListItems.Add("Italy") : .ListItems(2).ListSubItems.Add("Italian")
        End With

		With cboBox3
			.ListColumns.Add() : .ListColumns.Add()
            For i As Integer = 0 To 2000
                .ListItems.Add("Item" & i.ToString, "Item " & i.ToString)
                .ListItems(i).ListSubItems.Add("Item " & i.ToString & "'s SubItem with longer Text")
                .ListItems(i).ImageIndex = 2
            Next
            .DropDownWidth = 400

        End With
	End Sub
End Class
