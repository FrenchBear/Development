Option Strict Off
Option Explicit On
Friend Class frmAPropos
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
	Public WithEvents btnOK As System.Windows.Forms.Button
	Public WithEvents Image1 As System.Windows.Forms.PictureBox
	Public WithEvents imgAuteur As System.Windows.Forms.PictureBox
	Public WithEvents lblBuild As System.Windows.Forms.Label
	Public WithEvents Label3 As System.Windows.Forms.Label
	Public WithEvents Label1 As System.Windows.Forms.Label
	'REMARQUE : la procédure suivante est requise par le Concepteur Windows Form
	'Il peut être modifié à l'aide du Concepteur Windows Form.
	'Ne pas le modifier à l'aide de l'éditeur de code.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(frmAPropos))
		Me.components = New System.ComponentModel.Container()
		Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
		Me.ToolTip1.Active = True
		Me.btnOK = New System.Windows.Forms.Button
		Me.Image1 = New System.Windows.Forms.PictureBox
		Me.imgAuteur = New System.Windows.Forms.PictureBox
		Me.lblBuild = New System.Windows.Forms.Label
		Me.Label3 = New System.Windows.Forms.Label
		Me.Label1 = New System.Windows.Forms.Label
		Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
		Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
		Me.Text = "A propos d'AfficheImage"
		Me.ClientSize = New System.Drawing.Size(479, 101)
		Me.Location = New System.Drawing.Point(211, 144)
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
		Me.Name = "frmAPropos"
		Me.btnOK.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.btnOK.Text = "OK"
		Me.AcceptButton = Me.btnOK
		Me.btnOK.Font = New System.Drawing.Font("Verdana", 9!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.btnOK.Size = New System.Drawing.Size(71, 22)
		Me.btnOK.Location = New System.Drawing.Point(232, 72)
		Me.btnOK.TabIndex = 2
		Me.btnOK.BackColor = System.Drawing.SystemColors.Control
		Me.btnOK.CausesValidation = True
		Me.btnOK.Enabled = True
		Me.btnOK.ForeColor = System.Drawing.SystemColors.ControlText
		Me.btnOK.Cursor = System.Windows.Forms.Cursors.Default
		Me.btnOK.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.btnOK.TabStop = True
		Me.btnOK.Name = "btnOK"
		Me.Image1.Size = New System.Drawing.Size(65, 76)
		Me.Image1.Location = New System.Drawing.Point(16, 11)
		Me.Image1.Image = CType(resources.GetObject("Image1.Image"), System.Drawing.Image)
		Me.Image1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
		Me.Image1.Enabled = True
		Me.Image1.Cursor = System.Windows.Forms.Cursors.Default
		Me.Image1.Visible = True
		Me.Image1.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Image1.Name = "Image1"
		Me.imgAuteur.Size = New System.Drawing.Size(29, 38)
		Me.imgAuteur.Location = New System.Drawing.Point(24, 24)
		Me.imgAuteur.Image = CType(resources.GetObject("imgAuteur.Image"), System.Drawing.Image)
		Me.imgAuteur.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
		Me.imgAuteur.Visible = False
		Me.imgAuteur.Enabled = True
		Me.imgAuteur.Cursor = System.Windows.Forms.Cursors.Default
		Me.imgAuteur.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.imgAuteur.Name = "imgAuteur"
		Me.lblBuild.Text = "Build :"
		Me.lblBuild.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.lblBuild.Size = New System.Drawing.Size(37, 13)
		Me.lblBuild.Location = New System.Drawing.Point(100, 54)
		Me.lblBuild.TabIndex = 3
		Me.lblBuild.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.lblBuild.BackColor = System.Drawing.SystemColors.Control
		Me.lblBuild.Enabled = True
		Me.lblBuild.ForeColor = System.Drawing.SystemColors.ControlText
		Me.lblBuild.Cursor = System.Windows.Forms.Cursors.Default
		Me.lblBuild.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.lblBuild.UseMnemonic = True
		Me.lblBuild.Visible = True
		Me.lblBuild.AutoSize = True
		Me.lblBuild.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.lblBuild.Name = "lblBuild"
		Me.Label3.Text = "(c) 1997  P.VIOLENT"
		Me.Label3.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label3.Size = New System.Drawing.Size(117, 13)
		Me.Label3.Location = New System.Drawing.Point(100, 32)
		Me.Label3.TabIndex = 1
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
		Me.Label1.Text = "AfficheImage - Programme d'affichage d'images simple"
		Me.Label1.Font = New System.Drawing.Font("Verdana", 9!, System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label1.Size = New System.Drawing.Size(366, 14)
		Me.Label1.Location = New System.Drawing.Point(100, 12)
		Me.Label1.TabIndex = 0
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
		Me.Controls.Add(btnOK)
		Me.Controls.Add(Image1)
		Me.Controls.Add(imgAuteur)
		Me.Controls.Add(lblBuild)
		Me.Controls.Add(Label3)
		Me.Controls.Add(Label1)
	End Sub
#End Region 
#Region "Prise en charge de la mise à niveau "
	Private Shared m_vb6FormDefInstance As frmAPropos
	Private Shared m_InitializingDefInstance As Boolean
	Public Shared Property DefInstance() As frmAPropos
		Get
			If m_vb6FormDefInstance Is Nothing OrElse m_vb6FormDefInstance.IsDisposed Then
				m_InitializingDefInstance = True
				m_vb6FormDefInstance = New frmAPropos()
				m_InitializingDefInstance = False
			End If
			DefInstance = m_vb6FormDefInstance
		End Get
		Set
			m_vb6FormDefInstance = Value
		End Set
	End Property
#End Region 
	
	Private Sub btnOK_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles btnOK.Click
		Me.Close()
	End Sub
	
	Private Sub frmAPropos_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		SetBounds(VB6.TwipsToPixelsX((VB6.PixelsToTwipsX(System.Windows.Forms.Screen.PrimaryScreen.Bounds.Width) - VB6.PixelsToTwipsX(Width)) / 2), VB6.TwipsToPixelsY((VB6.PixelsToTwipsY(System.Windows.Forms.Screen.PrimaryScreen.Bounds.Height) - VB6.PixelsToTwipsY(Height)) / 2), 0, 0, Windows.Forms.BoundsSpecified.X Or Windows.Forms.BoundsSpecified.Y)
		'UPGRADE_ISSUE: App propriété App.Revision - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2069"'
		lblBuild.Text = "Version " & System.Diagnostics.FileVersionInfo.GetVersionInfo(System.Reflection.Assembly.GetExecutingAssembly.Location).FileMajorPart & "." & System.Diagnostics.FileVersionInfo.GetVersionInfo(System.Reflection.Assembly.GetExecutingAssembly.Location).FileMinorPart & "." & App.Revision
	End Sub
	
	Private Sub Image1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Image1.Click
		Image1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
		Image1.Image = imgAuteur.Image
	End Sub
End Class