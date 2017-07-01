Option Strict Off
Option Explicit On
Friend Class frmOptionsContact
	Inherits System.Windows.Forms.Form
#Region "Code généré par le Concepteur Windows Form "
	Public Sub New()
		MyBase.New()
		If m_vb6FormDefInstance Is Nothing Then
			If m_InitializingDefInstance Then
				m_vb6FormDefInstance = Me
			Else
				Try 
					'Pour le formulaire de démarrage, la première instance créée est l'instance par défaut.
					If System.Reflection.Assembly.GetExecutingAssembly.EntryPoint.DeclaringType Is Me.GetType Then
						m_vb6FormDefInstance = Me
					End If
				Catch
				End Try
			End If
		End If
		'Cet appel est requis par le Concepteur Windows Form.
		InitializeComponent()
	End Sub
	'La méthode substituée Dispose du formulaire pour nettoyer la liste des composants.
	Protected Overloads Overrides Sub Dispose(ByVal Disposing As Boolean)
		If Disposing Then
			If Not components Is Nothing Then
				components.Dispose()
			End If
		End If
		MyBase.Dispose(Disposing)
	End Sub
	'Requis par le Concepteur Windows Form
	Private components As System.ComponentModel.IContainer
	Public ToolTip1 As System.Windows.Forms.ToolTip
	Public WithEvents txtImageLignes As System.Windows.Forms.TextBox
	Public WithEvents txtImageColonnes As System.Windows.Forms.TextBox
	Public WithEvents Label4 As System.Windows.Forms.Label
	Public WithEvents Label3 As System.Windows.Forms.Label
	Public WithEvents Frame2 As System.Windows.Forms.GroupBox
	Public WithEvents txtVignettesColonnes As System.Windows.Forms.TextBox
	Public WithEvents txtVignettesLignes As System.Windows.Forms.TextBox
	Public WithEvents Label2 As System.Windows.Forms.Label
	Public WithEvents Label1 As System.Windows.Forms.Label
	Public WithEvents Frame1 As System.Windows.Forms.GroupBox
	Public WithEvents chkOk As System.Windows.Forms.CheckBox
	Public WithEvents btnAnnuler As System.Windows.Forms.Button
	Public WithEvents btnOk As System.Windows.Forms.Button
	'REMARQUE : la procédure suivante est requise par le Concepteur Windows Form
	'Il peut être modifié à l'aide du Concepteur Windows Form.
	'Ne pas le modifier à l'aide de l'éditeur de code.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(frmOptionsContact))
		Me.components = New System.ComponentModel.Container()
		Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
		Me.ToolTip1.Active = True
		Me.Frame2 = New System.Windows.Forms.GroupBox
		Me.txtImageLignes = New System.Windows.Forms.TextBox
		Me.txtImageColonnes = New System.Windows.Forms.TextBox
		Me.Label4 = New System.Windows.Forms.Label
		Me.Label3 = New System.Windows.Forms.Label
		Me.Frame1 = New System.Windows.Forms.GroupBox
		Me.txtVignettesColonnes = New System.Windows.Forms.TextBox
		Me.txtVignettesLignes = New System.Windows.Forms.TextBox
		Me.Label2 = New System.Windows.Forms.Label
		Me.Label1 = New System.Windows.Forms.Label
		Me.chkOk = New System.Windows.Forms.CheckBox
		Me.btnAnnuler = New System.Windows.Forms.Button
		Me.btnOk = New System.Windows.Forms.Button
		Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
		Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
		Me.Text = "Options de la planche de contact"
		Me.ClientSize = New System.Drawing.Size(352, 125)
		Me.Location = New System.Drawing.Point(229, 223)
		Me.MaximizeBox = False
		Me.MinimizeBox = False
		Me.ShowInTaskbar = False
		Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
		Me.BackColor = System.Drawing.SystemColors.Control
		Me.ControlBox = True
		Me.Enabled = True
		Me.KeyPreview = False
		Me.Cursor = System.Windows.Forms.Cursors.Default
		Me.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.HelpButton = False
		Me.WindowState = System.Windows.Forms.FormWindowState.Normal
		Me.Name = "frmOptionsContact"
		Me.Frame2.Text = "&Image"
		Me.Frame2.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Frame2.Size = New System.Drawing.Size(225, 49)
		Me.Frame2.Location = New System.Drawing.Point(8, 64)
		Me.Frame2.TabIndex = 5
		Me.Frame2.BackColor = System.Drawing.SystemColors.Control
		Me.Frame2.Enabled = True
		Me.Frame2.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Frame2.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Frame2.Visible = True
		Me.Frame2.Name = "Frame2"
		Me.txtImageLignes.AutoSize = False
		Me.txtImageLignes.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.txtImageLignes.Size = New System.Drawing.Size(49, 19)
		Me.txtImageLignes.Location = New System.Drawing.Point(8, 20)
		Me.txtImageLignes.TabIndex = 6
		Me.txtImageLignes.Text = "637"
		Me.txtImageLignes.AcceptsReturn = True
		Me.txtImageLignes.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.txtImageLignes.BackColor = System.Drawing.SystemColors.Window
		Me.txtImageLignes.CausesValidation = True
		Me.txtImageLignes.Enabled = True
		Me.txtImageLignes.ForeColor = System.Drawing.SystemColors.WindowText
		Me.txtImageLignes.HideSelection = True
		Me.txtImageLignes.ReadOnly = False
		Me.txtImageLignes.Maxlength = 0
		Me.txtImageLignes.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.txtImageLignes.MultiLine = False
		Me.txtImageLignes.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.txtImageLignes.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.txtImageLignes.TabStop = True
		Me.txtImageLignes.Visible = True
		Me.txtImageLignes.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.txtImageLignes.Name = "txtImageLignes"
		Me.txtImageColonnes.AutoSize = False
		Me.txtImageColonnes.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.txtImageColonnes.Size = New System.Drawing.Size(49, 19)
		Me.txtImageColonnes.Location = New System.Drawing.Point(112, 20)
		Me.txtImageColonnes.TabIndex = 8
		Me.txtImageColonnes.Text = "1016"
		Me.txtImageColonnes.AcceptsReturn = True
		Me.txtImageColonnes.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.txtImageColonnes.BackColor = System.Drawing.SystemColors.Window
		Me.txtImageColonnes.CausesValidation = True
		Me.txtImageColonnes.Enabled = True
		Me.txtImageColonnes.ForeColor = System.Drawing.SystemColors.WindowText
		Me.txtImageColonnes.HideSelection = True
		Me.txtImageColonnes.ReadOnly = False
		Me.txtImageColonnes.Maxlength = 0
		Me.txtImageColonnes.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.txtImageColonnes.MultiLine = False
		Me.txtImageColonnes.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.txtImageColonnes.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.txtImageColonnes.TabStop = True
		Me.txtImageColonnes.Visible = True
		Me.txtImageColonnes.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.txtImageColonnes.Name = "txtImageColonnes"
		Me.Label4.Text = "lignes x"
		Me.Label4.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label4.Size = New System.Drawing.Size(44, 13)
		Me.Label4.Location = New System.Drawing.Point(64, 23)
		Me.Label4.TabIndex = 7
		Me.Label4.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label4.BackColor = System.Drawing.SystemColors.Control
		Me.Label4.Enabled = True
		Me.Label4.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label4.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label4.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label4.UseMnemonic = True
		Me.Label4.Visible = True
		Me.Label4.AutoSize = True
		Me.Label4.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label4.Name = "Label4"
		Me.Label3.Text = "colonnes"
		Me.Label3.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label3.Size = New System.Drawing.Size(50, 13)
		Me.Label3.Location = New System.Drawing.Point(168, 23)
		Me.Label3.TabIndex = 9
		Me.Label3.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label3.BackColor = System.Drawing.SystemColors.Control
		Me.Label3.Enabled = True
		Me.Label3.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label3.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label3.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label3.UseMnemonic = True
		Me.Label3.Visible = True
		Me.Label3.AutoSize = True
		Me.Label3.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label3.Name = "Label3"
		Me.Frame1.Text = "&Vignettes"
		Me.Frame1.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Frame1.Size = New System.Drawing.Size(225, 49)
		Me.Frame1.Location = New System.Drawing.Point(8, 8)
		Me.Frame1.TabIndex = 0
		Me.Frame1.BackColor = System.Drawing.SystemColors.Control
		Me.Frame1.Enabled = True
		Me.Frame1.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Frame1.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Frame1.Visible = True
		Me.Frame1.Name = "Frame1"
		Me.txtVignettesColonnes.AutoSize = False
		Me.txtVignettesColonnes.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.txtVignettesColonnes.Size = New System.Drawing.Size(49, 19)
		Me.txtVignettesColonnes.Location = New System.Drawing.Point(112, 20)
		Me.txtVignettesColonnes.TabIndex = 3
		Me.txtVignettesColonnes.Text = "8"
		Me.txtVignettesColonnes.AcceptsReturn = True
		Me.txtVignettesColonnes.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.txtVignettesColonnes.BackColor = System.Drawing.SystemColors.Window
		Me.txtVignettesColonnes.CausesValidation = True
		Me.txtVignettesColonnes.Enabled = True
		Me.txtVignettesColonnes.ForeColor = System.Drawing.SystemColors.WindowText
		Me.txtVignettesColonnes.HideSelection = True
		Me.txtVignettesColonnes.ReadOnly = False
		Me.txtVignettesColonnes.Maxlength = 0
		Me.txtVignettesColonnes.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.txtVignettesColonnes.MultiLine = False
		Me.txtVignettesColonnes.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.txtVignettesColonnes.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.txtVignettesColonnes.TabStop = True
		Me.txtVignettesColonnes.Visible = True
		Me.txtVignettesColonnes.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.txtVignettesColonnes.Name = "txtVignettesColonnes"
		Me.txtVignettesLignes.AutoSize = False
		Me.txtVignettesLignes.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.txtVignettesLignes.Size = New System.Drawing.Size(49, 19)
		Me.txtVignettesLignes.Location = New System.Drawing.Point(8, 20)
		Me.txtVignettesLignes.TabIndex = 1
		Me.txtVignettesLignes.Text = "7"
		Me.txtVignettesLignes.AcceptsReturn = True
		Me.txtVignettesLignes.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.txtVignettesLignes.BackColor = System.Drawing.SystemColors.Window
		Me.txtVignettesLignes.CausesValidation = True
		Me.txtVignettesLignes.Enabled = True
		Me.txtVignettesLignes.ForeColor = System.Drawing.SystemColors.WindowText
		Me.txtVignettesLignes.HideSelection = True
		Me.txtVignettesLignes.ReadOnly = False
		Me.txtVignettesLignes.Maxlength = 0
		Me.txtVignettesLignes.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.txtVignettesLignes.MultiLine = False
		Me.txtVignettesLignes.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.txtVignettesLignes.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.txtVignettesLignes.TabStop = True
		Me.txtVignettesLignes.Visible = True
		Me.txtVignettesLignes.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.txtVignettesLignes.Name = "txtVignettesLignes"
		Me.Label2.Text = "colonnes"
		Me.Label2.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label2.Size = New System.Drawing.Size(50, 13)
		Me.Label2.Location = New System.Drawing.Point(168, 23)
		Me.Label2.TabIndex = 4
		Me.Label2.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label2.BackColor = System.Drawing.SystemColors.Control
		Me.Label2.Enabled = True
		Me.Label2.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label2.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label2.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label2.UseMnemonic = True
		Me.Label2.Visible = True
		Me.Label2.AutoSize = True
		Me.Label2.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label2.Name = "Label2"
		Me.Label1.Text = "lignes x"
		Me.Label1.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label1.Size = New System.Drawing.Size(44, 13)
		Me.Label1.Location = New System.Drawing.Point(64, 23)
		Me.Label1.TabIndex = 2
		Me.Label1.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label1.BackColor = System.Drawing.SystemColors.Control
		Me.Label1.Enabled = True
		Me.Label1.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label1.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label1.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label1.UseMnemonic = True
		Me.Label1.Visible = True
		Me.Label1.AutoSize = True
		Me.Label1.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label1.Name = "Label1"
		Me.chkOk.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.chkOk.Size = New System.Drawing.Size(14, 14)
		Me.chkOk.Location = New System.Drawing.Point(328, 88)
		Me.chkOk.TabIndex = 12
		Me.chkOk.TabStop = False
		Me.chkOk.Visible = False
		Me.chkOk.CheckAlign = System.Drawing.ContentAlignment.MiddleLeft
		Me.chkOk.BackColor = System.Drawing.SystemColors.Control
		Me.chkOk.Text = ""
		Me.chkOk.CausesValidation = True
		Me.chkOk.Enabled = True
		Me.chkOk.ForeColor = System.Drawing.SystemColors.ControlText
		Me.chkOk.Cursor = System.Windows.Forms.Cursors.Default
		Me.chkOk.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.chkOk.Appearance = System.Windows.Forms.Appearance.Normal
		Me.chkOk.CheckState = System.Windows.Forms.CheckState.Unchecked
		Me.chkOk.Name = "chkOk"
		Me.btnAnnuler.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.CancelButton = Me.btnAnnuler
		Me.btnAnnuler.Text = "Annuler"
		Me.btnAnnuler.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.btnAnnuler.Size = New System.Drawing.Size(73, 25)
		Me.btnAnnuler.Location = New System.Drawing.Point(272, 48)
		Me.btnAnnuler.TabIndex = 11
		Me.btnAnnuler.BackColor = System.Drawing.SystemColors.Control
		Me.btnAnnuler.CausesValidation = True
		Me.btnAnnuler.Enabled = True
		Me.btnAnnuler.ForeColor = System.Drawing.SystemColors.ControlText
		Me.btnAnnuler.Cursor = System.Windows.Forms.Cursors.Default
		Me.btnAnnuler.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.btnAnnuler.TabStop = True
		Me.btnAnnuler.Name = "btnAnnuler"
		Me.btnOk.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.btnOk.Text = "OK"
		Me.AcceptButton = Me.btnOk
		Me.btnOk.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.btnOk.Size = New System.Drawing.Size(73, 25)
		Me.btnOk.Location = New System.Drawing.Point(272, 16)
		Me.btnOk.TabIndex = 10
		Me.btnOk.BackColor = System.Drawing.SystemColors.Control
		Me.btnOk.CausesValidation = True
		Me.btnOk.Enabled = True
		Me.btnOk.ForeColor = System.Drawing.SystemColors.ControlText
		Me.btnOk.Cursor = System.Windows.Forms.Cursors.Default
		Me.btnOk.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.btnOk.TabStop = True
		Me.btnOk.Name = "btnOk"
		Me.Controls.Add(Frame2)
		Me.Controls.Add(Frame1)
		Me.Controls.Add(chkOk)
		Me.Controls.Add(btnAnnuler)
		Me.Controls.Add(btnOk)
		Me.Frame2.Controls.Add(txtImageLignes)
		Me.Frame2.Controls.Add(txtImageColonnes)
		Me.Frame2.Controls.Add(Label4)
		Me.Frame2.Controls.Add(Label3)
		Me.Frame1.Controls.Add(txtVignettesColonnes)
		Me.Frame1.Controls.Add(txtVignettesLignes)
		Me.Frame1.Controls.Add(Label2)
		Me.Frame1.Controls.Add(Label1)
	End Sub
#End Region 
#Region "Prise en charge de la mise à niveau "
	Private Shared m_vb6FormDefInstance As frmOptionsContact
	Private Shared m_InitializingDefInstance As Boolean
	Public Shared Property DefInstance() As frmOptionsContact
		Get
			If m_vb6FormDefInstance Is Nothing OrElse m_vb6FormDefInstance.IsDisposed Then
				m_InitializingDefInstance = True
				m_vb6FormDefInstance = New frmOptionsContact()
				m_InitializingDefInstance = False
			End If
			DefInstance = m_vb6FormDefInstance
		End Get
		Set
			m_vb6FormDefInstance = Value
		End Set
	End Property
#End Region 
	' frmOptionsContact
	' Options de génération de la feuille de contact
	' PV
	
	
	Private Sub btnAnnuler_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles btnAnnuler.Click
		Hide()
	End Sub
	
	Private Sub btnOK_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles btnOK.Click
		chkOk.CheckState = System.Windows.Forms.CheckState.Checked
		
		If Not CtrlNumeric(txtVignettesLignes, "nombre de vignettes par ligne", 2, 10) Then
			chkOk.CheckState = System.Windows.Forms.CheckState.Unchecked
		ElseIf Not CtrlNumeric(txtVignettesColonnes, "nombre de vignettes par colonne", 2, 10) Then 
			chkOk.CheckState = System.Windows.Forms.CheckState.Unchecked
		ElseIf Not CtrlNumeric(txtImageLignes, "nombre de lignes par image", 100, 740) Then 
			chkOk.CheckState = System.Windows.Forms.CheckState.Unchecked
		ElseIf Not CtrlNumeric(txtImageColonnes, "nombre de colonnes par image", 100, 1018) Then 
			chkOk.CheckState = System.Windows.Forms.CheckState.Unchecked
		Else
			Hide()
		End If
	End Sub
	
	Private Sub frmOptionsContact_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		chkOk.CheckState = System.Windows.Forms.CheckState.Unchecked
		txtVignettesLignes.SelectionStart = 0
		txtVignettesColonnes.SelectionLength = 99
	End Sub
End Class