Option Strict Off
Option Explicit On
Friend Class frmAutomatique
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
	Public WithEvents optAucun As System.Windows.Forms.RadioButton
	Public WithEvents txtDélai As System.Windows.Forms.TextBox
	Public WithEvents optSuivant As System.Windows.Forms.RadioButton
	Public WithEvents optAléatoire As System.Windows.Forms.RadioButton
	Public WithEvents btnOk As System.Windows.Forms.Button
	Public WithEvents btnAnnuler As System.Windows.Forms.Button
	Public WithEvents chkOk As System.Windows.Forms.CheckBox
	Public WithEvents Label1 As System.Windows.Forms.Label
	'REMARQUE : la procédure suivante est requise par le Concepteur Windows Form
	'Il peut être modifié à l'aide du Concepteur Windows Form.
	'Ne pas le modifier à l'aide de l'éditeur de code.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(frmAutomatique))
		Me.components = New System.ComponentModel.Container()
		Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
		Me.ToolTip1.Active = True
		Me.optAucun = New System.Windows.Forms.RadioButton
		Me.txtDélai = New System.Windows.Forms.TextBox
		Me.optSuivant = New System.Windows.Forms.RadioButton
		Me.optAléatoire = New System.Windows.Forms.RadioButton
		Me.btnOk = New System.Windows.Forms.Button
		Me.btnAnnuler = New System.Windows.Forms.Button
		Me.chkOk = New System.Windows.Forms.CheckBox
		Me.Label1 = New System.Windows.Forms.Label
		Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
		Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
		Me.Text = "Affichage automatique"
		Me.ClientSize = New System.Drawing.Size(226, 89)
		Me.Location = New System.Drawing.Point(333, 249)
		Me.ControlBox = False
		Me.MaximizeBox = False
		Me.MinimizeBox = False
		Me.ShowInTaskbar = False
		Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
		Me.BackColor = System.Drawing.SystemColors.Control
		Me.Enabled = True
		Me.KeyPreview = False
		Me.Cursor = System.Windows.Forms.Cursors.Default
		Me.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.HelpButton = False
		Me.WindowState = System.Windows.Forms.FormWindowState.Normal
		Me.Name = "frmAutomatique"
		Me.optAucun.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
		Me.optAucun.Text = "&Aucun"
		Me.optAucun.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.optAucun.Size = New System.Drawing.Size(81, 17)
		Me.optAucun.Location = New System.Drawing.Point(8, 8)
		Me.optAucun.TabIndex = 0
		Me.optAucun.Checked = True
		Me.optAucun.CheckAlign = System.Drawing.ContentAlignment.MiddleLeft
		Me.optAucun.BackColor = System.Drawing.SystemColors.Control
		Me.optAucun.CausesValidation = True
		Me.optAucun.Enabled = True
		Me.optAucun.ForeColor = System.Drawing.SystemColors.ControlText
		Me.optAucun.Cursor = System.Windows.Forms.Cursors.Default
		Me.optAucun.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.optAucun.Appearance = System.Windows.Forms.Appearance.Normal
		Me.optAucun.TabStop = True
		Me.optAucun.Visible = True
		Me.optAucun.Name = "optAucun"
		Me.txtDélai.AutoSize = False
		Me.txtDélai.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.txtDélai.Size = New System.Drawing.Size(49, 19)
		Me.txtDélai.Location = New System.Drawing.Point(64, 61)
		Me.txtDélai.TabIndex = 4
		Me.txtDélai.Text = "5"
		Me.txtDélai.AcceptsReturn = True
		Me.txtDélai.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.txtDélai.BackColor = System.Drawing.SystemColors.Window
		Me.txtDélai.CausesValidation = True
		Me.txtDélai.Enabled = True
		Me.txtDélai.ForeColor = System.Drawing.SystemColors.WindowText
		Me.txtDélai.HideSelection = True
		Me.txtDélai.ReadOnly = False
		Me.txtDélai.Maxlength = 0
		Me.txtDélai.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.txtDélai.MultiLine = False
		Me.txtDélai.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.txtDélai.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.txtDélai.TabStop = True
		Me.txtDélai.Visible = True
		Me.txtDélai.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.txtDélai.Name = "txtDélai"
		Me.optSuivant.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
		Me.optSuivant.Text = "&Suivant"
		Me.optSuivant.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.optSuivant.Size = New System.Drawing.Size(81, 17)
		Me.optSuivant.Location = New System.Drawing.Point(8, 40)
		Me.optSuivant.TabIndex = 2
		Me.optSuivant.CheckAlign = System.Drawing.ContentAlignment.MiddleLeft
		Me.optSuivant.BackColor = System.Drawing.SystemColors.Control
		Me.optSuivant.CausesValidation = True
		Me.optSuivant.Enabled = True
		Me.optSuivant.ForeColor = System.Drawing.SystemColors.ControlText
		Me.optSuivant.Cursor = System.Windows.Forms.Cursors.Default
		Me.optSuivant.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.optSuivant.Appearance = System.Windows.Forms.Appearance.Normal
		Me.optSuivant.TabStop = True
		Me.optSuivant.Checked = False
		Me.optSuivant.Visible = True
		Me.optSuivant.Name = "optSuivant"
		Me.optAléatoire.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
		Me.optAléatoire.Text = "Au &hasard"
		Me.optAléatoire.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.optAléatoire.Size = New System.Drawing.Size(81, 17)
		Me.optAléatoire.Location = New System.Drawing.Point(8, 24)
		Me.optAléatoire.TabIndex = 1
		Me.optAléatoire.CheckAlign = System.Drawing.ContentAlignment.MiddleLeft
		Me.optAléatoire.BackColor = System.Drawing.SystemColors.Control
		Me.optAléatoire.CausesValidation = True
		Me.optAléatoire.Enabled = True
		Me.optAléatoire.ForeColor = System.Drawing.SystemColors.ControlText
		Me.optAléatoire.Cursor = System.Windows.Forms.Cursors.Default
		Me.optAléatoire.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.optAléatoire.Appearance = System.Windows.Forms.Appearance.Normal
		Me.optAléatoire.TabStop = True
		Me.optAléatoire.Checked = False
		Me.optAléatoire.Visible = True
		Me.optAléatoire.Name = "optAléatoire"
		Me.btnOk.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.btnOk.Text = "OK"
		Me.AcceptButton = Me.btnOk
		Me.btnOk.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.btnOk.Size = New System.Drawing.Size(73, 25)
		Me.btnOk.Location = New System.Drawing.Point(144, 8)
		Me.btnOk.TabIndex = 5
		Me.btnOk.BackColor = System.Drawing.SystemColors.Control
		Me.btnOk.CausesValidation = True
		Me.btnOk.Enabled = True
		Me.btnOk.ForeColor = System.Drawing.SystemColors.ControlText
		Me.btnOk.Cursor = System.Windows.Forms.Cursors.Default
		Me.btnOk.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.btnOk.TabStop = True
		Me.btnOk.Name = "btnOk"
		Me.btnAnnuler.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.CancelButton = Me.btnAnnuler
		Me.btnAnnuler.Text = "Annuler"
		Me.btnAnnuler.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.btnAnnuler.Size = New System.Drawing.Size(73, 25)
		Me.btnAnnuler.Location = New System.Drawing.Point(144, 40)
		Me.btnAnnuler.TabIndex = 6
		Me.btnAnnuler.BackColor = System.Drawing.SystemColors.Control
		Me.btnAnnuler.CausesValidation = True
		Me.btnAnnuler.Enabled = True
		Me.btnAnnuler.ForeColor = System.Drawing.SystemColors.ControlText
		Me.btnAnnuler.Cursor = System.Windows.Forms.Cursors.Default
		Me.btnAnnuler.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.btnAnnuler.TabStop = True
		Me.btnAnnuler.Name = "btnAnnuler"
		Me.chkOk.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.chkOk.Size = New System.Drawing.Size(14, 14)
		Me.chkOk.Location = New System.Drawing.Point(200, 72)
		Me.chkOk.TabIndex = 7
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
		Me.Label1.Text = "Délai (s) :"
		Me.Label1.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label1.Size = New System.Drawing.Size(58, 13)
		Me.Label1.Location = New System.Drawing.Point(13, 64)
		Me.Label1.TabIndex = 3
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
		Me.Controls.Add(optAucun)
		Me.Controls.Add(txtDélai)
		Me.Controls.Add(optSuivant)
		Me.Controls.Add(optAléatoire)
		Me.Controls.Add(btnOk)
		Me.Controls.Add(btnAnnuler)
		Me.Controls.Add(chkOk)
		Me.Controls.Add(Label1)
	End Sub
#End Region 
#Region "Prise en charge de la mise à niveau "
	Private Shared m_vb6FormDefInstance As frmAutomatique
	Private Shared m_InitializingDefInstance As Boolean
	Public Shared Property DefInstance() As frmAutomatique
		Get
			If m_vb6FormDefInstance Is Nothing OrElse m_vb6FormDefInstance.IsDisposed Then
				m_InitializingDefInstance = True
				m_vb6FormDefInstance = New frmAutomatique()
				m_InitializingDefInstance = False
			End If
			DefInstance = m_vb6FormDefInstance
		End Get
		Set
			m_vb6FormDefInstance = Value
		End Set
	End Property
#End Region 
	
	Private Sub btnAnnuler_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles btnAnnuler.Click
		Hide()
	End Sub
	
	Private Sub frmAutomatique_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		chkOk.CheckState = System.Windows.Forms.CheckState.Unchecked
		txtDélai.SelectionStart = 0
		txtDélai.SelectionLength = 99
	End Sub
	
	Private Sub btnOK_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles btnOK.Click
		chkOk.CheckState = System.Windows.Forms.CheckState.Checked
		
		If Not CtrlNumeric(txtDélai, "délai d'affichage automatique", 1, 60) Then
			chkOk.CheckState = System.Windows.Forms.CheckState.Unchecked
		Else
			Hide()
		End If
	End Sub
End Class