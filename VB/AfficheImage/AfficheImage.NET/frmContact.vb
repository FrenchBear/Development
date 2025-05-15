Option Strict Off
Option Explicit On
Friend Class frmContact
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
	Public WithEvents Img As System.Windows.Forms.PictureBox
	'REMARQUE : la procédure suivante est requise par le Concepteur Windows Form
	'Il peut être modifié à l'aide du Concepteur Windows Form.
	'Ne pas le modifier à l'aide de l'éditeur de code.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(frmContact))
		Me.components = New System.ComponentModel.Container()
		Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
		Me.ToolTip1.Active = True
		Me.Img = New System.Windows.Forms.PictureBox
		Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
		Me.BackColor = System.Drawing.SystemColors.Window
		Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
		Me.Text = "Planche de contact"
		Me.ClientSize = New System.Drawing.Size(312, 213)
		Me.Location = New System.Drawing.Point(246, 197)
		Me.ControlBox = False
		Me.MaximizeBox = False
		Me.MinimizeBox = False
		Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
		Me.Enabled = True
		Me.KeyPreview = False
		Me.Cursor = System.Windows.Forms.Cursors.Default
		Me.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.ShowInTaskbar = True
		Me.HelpButton = False
		Me.WindowState = System.Windows.Forms.FormWindowState.Normal
		Me.Name = "frmContact"
		Me.Img.Size = New System.Drawing.Size(81, 33)
		Me.Img.Location = New System.Drawing.Point(120, 88)
		Me.Img.Visible = False
		Me.Img.Enabled = True
		Me.Img.Cursor = System.Windows.Forms.Cursors.Default
		Me.Img.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Normal
		Me.Img.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Img.Name = "Img"
		Me.Controls.Add(Img)
	End Sub
#End Region 
#Region "Prise en charge de la mise à niveau "
	Private Shared m_vb6FormDefInstance As frmContact
	Private Shared m_InitializingDefInstance As Boolean
	Public Shared Property DefInstance() As frmContact
		Get
			If m_vb6FormDefInstance Is Nothing OrElse m_vb6FormDefInstance.IsDisposed Then
				m_InitializingDefInstance = True
				m_vb6FormDefInstance = New frmContact()
				m_InitializingDefInstance = False
			End If
			DefInstance = m_vb6FormDefInstance
		End Get
		Set
			m_vb6FormDefInstance = Value
		End Set
	End Property
#End Region 
	' AfficheImage - frmContact
	' Feuille utilisée pour la génération des plances de contact
	' PV mai 97
	
	
	
	' Dessine une vignette contenant le nom et l'image d'un fichier
	Sub Vignette(ByRef i As Short, ByRef j As Short, ByRef sRep As String, ByRef sFic As String, ByRef iVignettesColonnes As Short, ByRef iVignettesLignes As Short)
		Dim x, y As Single
		Dim w, h As Single
		
		w = (ClientRectangle.Width - 1) / iVignettesColonnes
		h = (ClientRectangle.Height - 1) / iVignettesLignes
		x = i * w
		y = h * j
		'UPGRADE_ISSUE: Form méthode frmContact.Line - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2064"'
		Me.Line (x, y) - (w, h), B
		
		'UPGRADE_ISSUE: Form méthode frmContact.TextHeight - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2064"'
		TexteCentré(Me, x, x + w, y + h - TextHeight(sFic), sFic)
		
		x = x + 2
		y = y + 2
		w = w - 3
		h = h - 4
		
		'UPGRADE_ISSUE: Form méthode frmContact.TextHeight - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2064"'
		h = h - TextHeight(sFic)
		On Error Resume Next
		Img.Image = System.Drawing.Image.FromFile(sRep & sFic)
		If Err.Number Then Img.Image = Nothing
		On Error GoTo 0
		
		Dim r2, r1, r As Single
		r1 = w / Img.Width
		r2 = h / Img.Height
		If r1 < r2 Then ' Image plus large que haute
			y = y + (h - r1 * Img.Height) / 2
			r = r1
		Else ' Image plus haute que large
			x = x + (w - r2 * Img.Width) / 2
			r = r2
		End If
		On Error Resume Next
		'UPGRADE_ISSUE: Form méthode frmContact.PaintPicture - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2064"'
		PaintPicture(Img.Image, x, y, Img.Width * r, Img.Height * r)
		On Error GoTo 0
		System.Windows.Forms.Application.DoEvents()
	End Sub
	
	
	Private Sub TexteCentré(ByRef o As Object, ByRef x1 As Single, ByRef x2 As Single, ByRef y As Single, ByRef sTexte As String)
		'UPGRADE_WARNING: Impossible de résoudre la propriété par défaut de l'objet o.CurrentX. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1037"'
		'UPGRADE_WARNING: Impossible de résoudre la propriété par défaut de l'objet o.TextWidth. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1037"'
		o.CurrentX = x1 + (x2 - x1 - o.TextWidth(sTexte)) / 2
		'UPGRADE_WARNING: Impossible de résoudre la propriété par défaut de l'objet o.CurrentY. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1037"'
		o.CurrentY = y
		'UPGRADE_WARNING: Impossible de résoudre la propriété par défaut de l'objet o.Print. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1037"'
		o.Print(sTexte)
	End Sub
End Class