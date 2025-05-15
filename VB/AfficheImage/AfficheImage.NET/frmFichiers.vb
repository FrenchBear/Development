Option Strict Off
Option Explicit On
Friend Class frmFichiers
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
	Public WithEvents lvFichiers As AxMSComctlLib.AxListView
	'REMARQUE : la procédure suivante est requise par le Concepteur Windows Form
	'Il peut être modifié à l'aide du Concepteur Windows Form.
	'Ne pas le modifier à l'aide de l'éditeur de code.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(frmFichiers))
		Me.components = New System.ComponentModel.Container()
		Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
		Me.ToolTip1.Active = True
		Me.lvFichiers = New AxMSComctlLib.AxListView
		CType(Me.lvFichiers, System.ComponentModel.ISupportInitialize).BeginInit()
		Me.Text = "Liste des fichiers"
		Me.ClientSize = New System.Drawing.Size(411, 312)
		Me.Location = New System.Drawing.Point(4, 23)
		Me.Icon = CType(resources.GetObject("frmFichiers.Icon"), System.Drawing.Icon)
		Me.ShowInTaskbar = False
		Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
		Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
		Me.BackColor = System.Drawing.SystemColors.Control
		Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Sizable
		Me.ControlBox = True
		Me.Enabled = True
		Me.KeyPreview = False
		Me.MaximizeBox = True
		Me.MinimizeBox = True
		Me.Cursor = System.Windows.Forms.Cursors.Default
		Me.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.HelpButton = False
		Me.WindowState = System.Windows.Forms.FormWindowState.Normal
		Me.Name = "frmFichiers"
		lvFichiers.OcxState = CType(resources.GetObject("lvFichiers.OcxState"), System.Windows.Forms.AxHost.State)
		Me.lvFichiers.Size = New System.Drawing.Size(289, 149)
		Me.lvFichiers.Location = New System.Drawing.Point(52, 44)
		Me.lvFichiers.TabIndex = 0
		Me.lvFichiers.Name = "lvFichiers"
		Me.Controls.Add(lvFichiers)
		CType(Me.lvFichiers, System.ComponentModel.ISupportInitialize).EndInit()
	End Sub
#End Region 
#Region "Prise en charge de la mise à niveau "
	Private Shared m_vb6FormDefInstance As frmFichiers
	Private Shared m_InitializingDefInstance As Boolean
	Public Shared Property DefInstance() As frmFichiers
		Get
			If m_vb6FormDefInstance Is Nothing OrElse m_vb6FormDefInstance.IsDisposed Then
				m_InitializingDefInstance = True
				m_vb6FormDefInstance = New frmFichiers()
				m_InitializingDefInstance = False
			End If
			DefInstance = m_vb6FormDefInstance
		End Get
		Set
			m_vb6FormDefInstance = Value
		End Set
	End Property
#End Region 
	' frmFichiers
	' Affichage de la liste complète des fichiers
	' 20/12/98 PV
	'  2/01/99 PV Optimisation: hide au lieu de unload sur fermeture; ListView au lieu de la liste standard
	' 10/01/99 PV Toujours au-dessus de frmAfficheImage
	
	
	
	Private Declare Function SetWindowWord Lib "user32" (ByVal hwnd As Integer, ByVal nIndex As Integer, ByVal wNewWord As Integer) As Integer
	
	Const GWW_HWNDPARENT As Short = (-8)
	Dim OriginalParenthWnd As Integer
	
	
	
	'UPGRADE_WARNING: L'événement frmFichiers.Resize peut se déclencher lorsque le formulaire est initialisé. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2075"'
	Private Sub frmFichiers_Resize(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Resize
		lvFichiers.SetBounds(0, 0, ClientRectangle.Width, ClientRectangle.Height)
	End Sub
	
	Private Sub lvFichiers_DblClick(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles lvFichiers.DblClick
		Me.Hide()
	End Sub
	
	Private Sub lvFichiers_ItemClick(ByVal eventSender As System.Object, ByVal eventArgs As AxMSComctlLib.ListViewEvents_ItemClickEvent) Handles lvFichiers.ItemClick
		frmAfficheImage.DefInstance.cboFichiers.SelectedIndex = eventArgs.Item.Index - 1
	End Sub
	
	Private Sub lvFichiers_KeyDownEvent(ByVal eventSender As System.Object, ByVal eventArgs As AxMSComctlLib.ListViewEvents_KeyDownEvent) Handles lvFichiers.KeyDownEvent
		If eventArgs.KeyCode = 46 Then ' Suppr
			frmAfficheImage.DefInstance.SupprimeImage()
			'lvFichiers.SelectedItem.Text = "[Supprimé]"
			lvFichiers.ListItems.Remove(lvFichiers.SelectedItem.Index)
			
			frmFichiers.DefInstance.lvFichiers.SelectedItem = frmFichiers.DefInstance.lvFichiers.ListItems(frmAfficheImage.DefInstance.iPos + 1)
		End If
	End Sub
	
	
	' Optimisation
	' La fermeture avec la croix ne fait que cacher la fenêtre
	'UPGRADE_WARNING: événement frmFichiers.QueryUnload de Form a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
	Private Sub frmFichiers_Closing(ByVal eventSender As System.Object, ByVal eventArgs As System.ComponentModel.CancelEventArgs) Handles MyBase.Closing
		Dim Cancel As Short = eventArgs.Cancel
		'UPGRADE_ISSUE: Le paramètre d'événement UnloadMode n'a pas été mis à niveau. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1057"'
		If UnloadMode = 0 Then ' Croix de fermeture
			Me.Hide()
			Cancel = 1
			GoTo EventExitSub
		End If
		Cancel = 0
EventExitSub: 
		eventArgs.Cancel = Cancel
	End Sub
	
	
	Sub frmFichiers_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		' Set parent for the toolbar to display on top of:
		OriginalParenthWnd = SetWindowWord(Me.Handle.ToInt32, GWW_HWNDPARENT, frmAfficheImage.DefInstance.Handle.ToInt32)
		
		'  Me.Width = Form1.Width \ 3      ' Scale child form
		'  Me.Height = Form1.Height \ 3
	End Sub
	
	
	'UPGRADE_WARNING: événement frmFichiers.Unload de Form a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
	Private Sub frmFichiers_Closed(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Closed
		Dim ret As Integer
		
		' Return the original parent handle to avoid a GP Fault
		ret = SetWindowWord(Me.Handle.ToInt32, GWW_HWNDPARENT, OriginalParenthWnd)
	End Sub
End Class