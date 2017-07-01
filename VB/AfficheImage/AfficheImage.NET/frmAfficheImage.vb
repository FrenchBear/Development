Option Strict Off
Option Explicit On
Imports VB = Microsoft.VisualBasic
Friend Class frmAfficheImage
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
	Public WithEvents chkStretch As System.Windows.Forms.CheckBox
	Public WithEvents tbBoutons As AxMSComctlLib.AxToolbar
	Public WithEvents lblPos As System.Windows.Forms.TextBox
	Public WithEvents tmrTim As System.Windows.Forms.Timer
	Public WithEvents sbStatus As AxMSComctlLib.AxStatusBar
	Public WithEvents chkAjuster As System.Windows.Forms.CheckBox
	Public WithEvents cboFichiers As System.Windows.Forms.ComboBox
	Public WithEvents ImageList As AxMSComctlLib.AxImageList
	Public WithEvents Image2 As System.Windows.Forms.PictureBox
	Public WithEvents Image1 As System.Windows.Forms.PictureBox
	Public WithEvents cmdBalayer As System.Windows.Forms.MenuItem
	Public WithEvents sep1 As System.Windows.Forms.MenuItem
	Public WithEvents cmdDébut As System.Windows.Forms.MenuItem
	Public WithEvents cmdPrécédent As System.Windows.Forms.MenuItem
	Public WithEvents cmdSuivant As System.Windows.Forms.MenuItem
	Public WithEvents cmdFin As System.Windows.Forms.MenuItem
	Public WithEvents sep2b As System.Windows.Forms.MenuItem
	Public WithEvents cmdHasard As System.Windows.Forms.MenuItem
	Public WithEvents sep3c As System.Windows.Forms.MenuItem
	Public WithEvents cmdAutomatique As System.Windows.Forms.MenuItem
	Public WithEvents sep4b2 As System.Windows.Forms.MenuItem
	Public WithEvents cmdRetour As System.Windows.Forms.MenuItem
	Public WithEvents sep2 As System.Windows.Forms.MenuItem
	Public WithEvents cmdQuitter As System.Windows.Forms.MenuItem
	Public WithEvents mnuFichier As System.Windows.Forms.MenuItem
	Public WithEvents cmdCopier As System.Windows.Forms.MenuItem
	Public WithEvents sep3 As System.Windows.Forms.MenuItem
	Public WithEvents cmdSupprimer As System.Windows.Forms.MenuItem
	Public WithEvents sep3b As System.Windows.Forms.MenuItem
	Public WithEvents cmdNettoyage As System.Windows.Forms.MenuItem
	Public WithEvents mnuEdition As System.Windows.Forms.MenuItem
	Public WithEvents cmdHTML As System.Windows.Forms.MenuItem
	Public WithEvents cmdContact As System.Windows.Forms.MenuItem
	Public WithEvents sep4 As System.Windows.Forms.MenuItem
	Public WithEvents cmdEditer As System.Windows.Forms.MenuItem
	Public WithEvents sep4b As System.Windows.Forms.MenuItem
	Public WithEvents cmdListeFichiers As System.Windows.Forms.MenuItem
	Public WithEvents mnuCommandes As System.Windows.Forms.MenuItem
	Public WithEvents cmdAbout As System.Windows.Forms.MenuItem
	Public WithEvents mnuAide As System.Windows.Forms.MenuItem
	Public MainMenu1 As System.Windows.Forms.MainMenu
	'REMARQUE : la procédure suivante est requise par le Concepteur Windows Form
	'Il peut être modifié à l'aide du Concepteur Windows Form.
	'Ne pas le modifier à l'aide de l'éditeur de code.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(frmAfficheImage))
		Me.components = New System.ComponentModel.Container()
		Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
		Me.ToolTip1.Active = True
		Me.chkStretch = New System.Windows.Forms.CheckBox
		Me.tbBoutons = New AxMSComctlLib.AxToolbar
		Me.lblPos = New System.Windows.Forms.TextBox
		Me.tmrTim = New System.Windows.Forms.Timer(components)
		Me.sbStatus = New AxMSComctlLib.AxStatusBar
		Me.chkAjuster = New System.Windows.Forms.CheckBox
		Me.cboFichiers = New System.Windows.Forms.ComboBox
		Me.ImageList = New AxMSComctlLib.AxImageList
		Me.Image2 = New System.Windows.Forms.PictureBox
		Me.Image1 = New System.Windows.Forms.PictureBox
		Me.MainMenu1 = New System.Windows.Forms.MainMenu
		Me.mnuFichier = New System.Windows.Forms.MenuItem
		Me.cmdBalayer = New System.Windows.Forms.MenuItem
		Me.sep1 = New System.Windows.Forms.MenuItem
		Me.cmdDébut = New System.Windows.Forms.MenuItem
		Me.cmdPrécédent = New System.Windows.Forms.MenuItem
		Me.cmdSuivant = New System.Windows.Forms.MenuItem
		Me.cmdFin = New System.Windows.Forms.MenuItem
		Me.sep2b = New System.Windows.Forms.MenuItem
		Me.cmdHasard = New System.Windows.Forms.MenuItem
		Me.sep3c = New System.Windows.Forms.MenuItem
		Me.cmdAutomatique = New System.Windows.Forms.MenuItem
		Me.sep4b2 = New System.Windows.Forms.MenuItem
		Me.cmdRetour = New System.Windows.Forms.MenuItem
		Me.sep2 = New System.Windows.Forms.MenuItem
		Me.cmdQuitter = New System.Windows.Forms.MenuItem
		Me.mnuEdition = New System.Windows.Forms.MenuItem
		Me.cmdCopier = New System.Windows.Forms.MenuItem
		Me.sep3 = New System.Windows.Forms.MenuItem
		Me.cmdSupprimer = New System.Windows.Forms.MenuItem
		Me.sep3b = New System.Windows.Forms.MenuItem
		Me.cmdNettoyage = New System.Windows.Forms.MenuItem
		Me.mnuCommandes = New System.Windows.Forms.MenuItem
		Me.cmdHTML = New System.Windows.Forms.MenuItem
		Me.cmdContact = New System.Windows.Forms.MenuItem
		Me.sep4 = New System.Windows.Forms.MenuItem
		Me.cmdEditer = New System.Windows.Forms.MenuItem
		Me.sep4b = New System.Windows.Forms.MenuItem
		Me.cmdListeFichiers = New System.Windows.Forms.MenuItem
		Me.mnuAide = New System.Windows.Forms.MenuItem
		Me.cmdAbout = New System.Windows.Forms.MenuItem
		CType(Me.tbBoutons, System.ComponentModel.ISupportInitialize).BeginInit()
		CType(Me.sbStatus, System.ComponentModel.ISupportInitialize).BeginInit()
		CType(Me.ImageList, System.ComponentModel.ISupportInitialize).BeginInit()
		Me.Text = "AfficheImage"
		Me.ClientSize = New System.Drawing.Size(683, 343)
		Me.Location = New System.Drawing.Point(11, 57)
		Me.Font = New System.Drawing.Font("Verdana", 9!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Icon = CType(resources.GetObject("frmAfficheImage.Icon"), System.Drawing.Icon)
		Me.KeyPreview = True
		Me.StartPosition = System.Windows.Forms.FormStartPosition.WindowsDefaultLocation
		Me.AutoScaleBaseSize = New System.Drawing.Size(7, 15)
		Me.BackColor = System.Drawing.SystemColors.Control
		Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Sizable
		Me.ControlBox = True
		Me.Enabled = True
		Me.MaximizeBox = True
		Me.MinimizeBox = True
		Me.Cursor = System.Windows.Forms.Cursors.Default
		Me.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.ShowInTaskbar = True
		Me.HelpButton = False
		Me.WindowState = System.Windows.Forms.FormWindowState.Normal
		Me.Name = "frmAfficheImage"
		Me.chkStretch.Text = "&Réduire si trop grand"
		Me.chkStretch.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.chkStretch.Size = New System.Drawing.Size(144, 14)
		Me.chkStretch.Location = New System.Drawing.Point(536, 4)
		Me.chkStretch.TabIndex = 1
		Me.chkStretch.TabStop = False
		Me.chkStretch.CheckState = System.Windows.Forms.CheckState.Checked
		Me.chkStretch.CheckAlign = System.Drawing.ContentAlignment.MiddleLeft
		Me.chkStretch.BackColor = System.Drawing.SystemColors.Control
		Me.chkStretch.CausesValidation = True
		Me.chkStretch.Enabled = True
		Me.chkStretch.ForeColor = System.Drawing.SystemColors.ControlText
		Me.chkStretch.Cursor = System.Windows.Forms.Cursors.Default
		Me.chkStretch.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.chkStretch.Appearance = System.Windows.Forms.Appearance.Normal
		Me.chkStretch.Visible = True
		Me.chkStretch.Name = "chkStretch"
		tbBoutons.OcxState = CType(resources.GetObject("tbBoutons.OcxState"), System.Windows.Forms.AxHost.State)
		Me.tbBoutons.Size = New System.Drawing.Size(222, 26)
		Me.tbBoutons.Location = New System.Drawing.Point(5, 5)
		Me.tbBoutons.TabIndex = 4
		Me.tbBoutons.Name = "tbBoutons"
		Me.lblPos.AutoSize = False
		Me.lblPos.BackColor = System.Drawing.SystemColors.Control
		Me.lblPos.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.lblPos.Size = New System.Drawing.Size(81, 21)
		Me.lblPos.Location = New System.Drawing.Point(240, 7)
		Me.lblPos.ReadOnly = True
		Me.lblPos.TabIndex = 5
		Me.lblPos.TabStop = False
		Me.lblPos.AcceptsReturn = True
		Me.lblPos.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.lblPos.CausesValidation = True
		Me.lblPos.Enabled = True
		Me.lblPos.ForeColor = System.Drawing.SystemColors.WindowText
		Me.lblPos.HideSelection = True
		Me.lblPos.Maxlength = 0
		Me.lblPos.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.lblPos.MultiLine = False
		Me.lblPos.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.lblPos.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.lblPos.Visible = True
		Me.lblPos.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.lblPos.Name = "lblPos"
		Me.tmrTim.Enabled = False
		Me.tmrTim.Interval = 1
		sbStatus.OcxState = CType(resources.GetObject("sbStatus.OcxState"), System.Windows.Forms.AxHost.State)
		Me.sbStatus.Dock = System.Windows.Forms.DockStyle.Bottom
		Me.sbStatus.Size = New System.Drawing.Size(683, 20)
		Me.sbStatus.Location = New System.Drawing.Point(0, 323)
		Me.sbStatus.TabIndex = 3
		Me.sbStatus.Name = "sbStatus"
		Me.chkAjuster.Text = "Aj&uster à la fenêtre"
		Me.chkAjuster.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.chkAjuster.Size = New System.Drawing.Size(136, 17)
		Me.chkAjuster.Location = New System.Drawing.Point(536, 16)
		Me.chkAjuster.TabIndex = 2
		Me.chkAjuster.TabStop = False
		Me.chkAjuster.CheckState = System.Windows.Forms.CheckState.Checked
		Me.chkAjuster.CheckAlign = System.Drawing.ContentAlignment.MiddleLeft
		Me.chkAjuster.BackColor = System.Drawing.SystemColors.Control
		Me.chkAjuster.CausesValidation = True
		Me.chkAjuster.Enabled = True
		Me.chkAjuster.ForeColor = System.Drawing.SystemColors.ControlText
		Me.chkAjuster.Cursor = System.Windows.Forms.Cursors.Default
		Me.chkAjuster.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.chkAjuster.Appearance = System.Windows.Forms.Appearance.Normal
		Me.chkAjuster.Visible = True
		Me.chkAjuster.Name = "chkAjuster"
		Me.cboFichiers.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.cboFichiers.Size = New System.Drawing.Size(201, 21)
		Me.cboFichiers.Location = New System.Drawing.Point(332, 7)
		Me.cboFichiers.Sorted = True
		Me.cboFichiers.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
		Me.cboFichiers.TabIndex = 0
		Me.cboFichiers.BackColor = System.Drawing.SystemColors.Window
		Me.cboFichiers.CausesValidation = True
		Me.cboFichiers.Enabled = True
		Me.cboFichiers.ForeColor = System.Drawing.SystemColors.WindowText
		Me.cboFichiers.IntegralHeight = True
		Me.cboFichiers.Cursor = System.Windows.Forms.Cursors.Default
		Me.cboFichiers.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.cboFichiers.TabStop = True
		Me.cboFichiers.Visible = True
		Me.cboFichiers.Name = "cboFichiers"
		ImageList.OcxState = CType(resources.GetObject("ImageList.OcxState"), System.Windows.Forms.AxHost.State)
		Me.ImageList.Location = New System.Drawing.Point(448, 220)
		Me.ImageList.Name = "ImageList"
		Me.Image2.Size = New System.Drawing.Size(185, 121)
		Me.Image2.Location = New System.Drawing.Point(448, 80)
		Me.Image2.Visible = False
		Me.Image2.Enabled = True
		Me.Image2.Cursor = System.Windows.Forms.Cursors.Default
		Me.Image2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Normal
		Me.Image2.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Image2.Name = "Image2"
		Me.Image1.Size = New System.Drawing.Size(401, 233)
		Me.Image1.Location = New System.Drawing.Point(4, 40)
		Me.Image1.Enabled = True
		Me.Image1.Cursor = System.Windows.Forms.Cursors.Default
		Me.Image1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Normal
		Me.Image1.Visible = True
		Me.Image1.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Image1.Name = "Image1"
		Me.mnuFichier.Text = "&Fichier"
		Me.mnuFichier.Checked = False
		Me.mnuFichier.Enabled = True
		Me.mnuFichier.Visible = True
		Me.mnuFichier.MDIList = False
		Me.cmdBalayer.Text = "&Balayer..."
		Me.cmdBalayer.Checked = False
		Me.cmdBalayer.Enabled = True
		Me.cmdBalayer.Visible = True
		Me.cmdBalayer.MDIList = False
		Me.sep1.Text = "-"
		Me.sep1.Checked = False
		Me.sep1.Enabled = True
		Me.sep1.Visible = True
		Me.sep1.MDIList = False
		Me.cmdDébut.Text = "&Début"
		Me.cmdDébut.Checked = False
		Me.cmdDébut.Enabled = True
		Me.cmdDébut.Visible = True
		Me.cmdDébut.MDIList = False
		Me.cmdPrécédent.Text = "&Précédent"
		Me.cmdPrécédent.Checked = False
		Me.cmdPrécédent.Enabled = True
		Me.cmdPrécédent.Visible = True
		Me.cmdPrécédent.MDIList = False
		Me.cmdSuivant.Text = "&Suivant"
		Me.cmdSuivant.Checked = False
		Me.cmdSuivant.Enabled = True
		Me.cmdSuivant.Visible = True
		Me.cmdSuivant.MDIList = False
		Me.cmdFin.Text = "&Fin"
		Me.cmdFin.Checked = False
		Me.cmdFin.Enabled = True
		Me.cmdFin.Visible = True
		Me.cmdFin.MDIList = False
		Me.sep2b.Text = "-"
		Me.sep2b.Checked = False
		Me.sep2b.Enabled = True
		Me.sep2b.Visible = True
		Me.sep2b.MDIList = False
		Me.cmdHasard.Text = "Au &hasard"
		Me.cmdHasard.Checked = False
		Me.cmdHasard.Enabled = True
		Me.cmdHasard.Visible = True
		Me.cmdHasard.MDIList = False
		Me.sep3c.Text = "-"
		Me.sep3c.Checked = False
		Me.sep3c.Enabled = True
		Me.sep3c.Visible = True
		Me.sep3c.MDIList = False
		Me.cmdAutomatique.Text = "&Automatique..."
		Me.cmdAutomatique.Checked = False
		Me.cmdAutomatique.Enabled = True
		Me.cmdAutomatique.Visible = True
		Me.cmdAutomatique.MDIList = False
		Me.sep4b2.Text = "-"
		Me.sep4b2.Checked = False
		Me.sep4b2.Enabled = True
		Me.sep4b2.Visible = True
		Me.sep4b2.MDIList = False
		Me.cmdRetour.Text = "&Retour"
		Me.cmdRetour.Checked = False
		Me.cmdRetour.Enabled = True
		Me.cmdRetour.Visible = True
		Me.cmdRetour.MDIList = False
		Me.sep2.Text = "-"
		Me.sep2.Checked = False
		Me.sep2.Enabled = True
		Me.sep2.Visible = True
		Me.sep2.MDIList = False
		Me.cmdQuitter.Text = "&Quitter"
		Me.cmdQuitter.Checked = False
		Me.cmdQuitter.Enabled = True
		Me.cmdQuitter.Visible = True
		Me.cmdQuitter.MDIList = False
		Me.mnuEdition.Text = "&Edition"
		Me.mnuEdition.Checked = False
		Me.mnuEdition.Enabled = True
		Me.mnuEdition.Visible = True
		Me.mnuEdition.MDIList = False
		Me.cmdCopier.Text = "Co&pier"
		Me.cmdCopier.Shortcut = System.Windows.Forms.Shortcut.CtrlC
		Me.cmdCopier.Checked = False
		Me.cmdCopier.Enabled = True
		Me.cmdCopier.Visible = True
		Me.cmdCopier.MDIList = False
		Me.sep3.Text = "-"
		Me.sep3.Checked = False
		Me.sep3.Enabled = True
		Me.sep3.Visible = True
		Me.sep3.MDIList = False
		Me.cmdSupprimer.Text = "&Supprimer"
		Me.cmdSupprimer.Shortcut = System.Windows.Forms.Shortcut.Del
		Me.cmdSupprimer.Checked = False
		Me.cmdSupprimer.Enabled = True
		Me.cmdSupprimer.Visible = True
		Me.cmdSupprimer.MDIList = False
		Me.sep3b.Text = "-"
		Me.sep3b.Checked = False
		Me.sep3b.Enabled = True
		Me.sep3b.Visible = True
		Me.sep3b.MDIList = False
		Me.cmdNettoyage.Text = "Nettoyage"
		Me.cmdNettoyage.Checked = False
		Me.cmdNettoyage.Enabled = True
		Me.cmdNettoyage.Visible = True
		Me.cmdNettoyage.MDIList = False
		Me.mnuCommandes.Text = "&Commandes"
		Me.mnuCommandes.Checked = False
		Me.mnuCommandes.Enabled = True
		Me.mnuCommandes.Visible = True
		Me.mnuCommandes.MDIList = False
		Me.cmdHTML.Text = "&Générer HTML..."
		Me.cmdHTML.Checked = False
		Me.cmdHTML.Enabled = True
		Me.cmdHTML.Visible = True
		Me.cmdHTML.MDIList = False
		Me.cmdContact.Text = "&Planche de contact..."
		Me.cmdContact.Checked = False
		Me.cmdContact.Enabled = True
		Me.cmdContact.Visible = True
		Me.cmdContact.MDIList = False
		Me.sep4.Text = "-"
		Me.sep4.Checked = False
		Me.sep4.Enabled = True
		Me.sep4.Visible = True
		Me.sep4.MDIList = False
		Me.cmdEditer.Text = "&Editer"
		Me.cmdEditer.Checked = False
		Me.cmdEditer.Enabled = True
		Me.cmdEditer.Visible = True
		Me.cmdEditer.MDIList = False
		Me.sep4b.Text = "-"
		Me.sep4b.Checked = False
		Me.sep4b.Enabled = True
		Me.sep4b.Visible = True
		Me.sep4b.MDIList = False
		Me.cmdListeFichiers.Text = "&Liste de fichiers"
		Me.cmdListeFichiers.Checked = False
		Me.cmdListeFichiers.Enabled = True
		Me.cmdListeFichiers.Visible = True
		Me.cmdListeFichiers.MDIList = False
		Me.mnuAide.Text = "&Aide"
		Me.mnuAide.Checked = False
		Me.mnuAide.Enabled = True
		Me.mnuAide.Visible = True
		Me.mnuAide.MDIList = False
		Me.cmdAbout.Text = "&A propos de..."
		Me.cmdAbout.Checked = False
		Me.cmdAbout.Enabled = True
		Me.cmdAbout.Visible = True
		Me.cmdAbout.MDIList = False
		Me.Controls.Add(chkStretch)
		Me.Controls.Add(tbBoutons)
		Me.Controls.Add(lblPos)
		Me.Controls.Add(sbStatus)
		Me.Controls.Add(chkAjuster)
		Me.Controls.Add(cboFichiers)
		Me.Controls.Add(ImageList)
		Me.Controls.Add(Image2)
		Me.Controls.Add(Image1)
		CType(Me.ImageList, System.ComponentModel.ISupportInitialize).EndInit()
		CType(Me.sbStatus, System.ComponentModel.ISupportInitialize).EndInit()
		CType(Me.tbBoutons, System.ComponentModel.ISupportInitialize).EndInit()
		Me.mnuFichier.Index = 0
		Me.mnuEdition.Index = 1
		Me.mnuCommandes.Index = 2
		Me.mnuAide.Index = 3
		MainMenu1.MenuItems.AddRange(New System.Windows.Forms.MenuItem(){Me.mnuFichier, Me.mnuEdition, Me.mnuCommandes, Me.mnuAide})
		Me.cmdBalayer.Index = 0
		Me.sep1.Index = 1
		Me.cmdDébut.Index = 2
		Me.cmdPrécédent.Index = 3
		Me.cmdSuivant.Index = 4
		Me.cmdFin.Index = 5
		Me.sep2b.Index = 6
		Me.cmdHasard.Index = 7
		Me.sep3c.Index = 8
		Me.cmdAutomatique.Index = 9
		Me.sep4b2.Index = 10
		Me.cmdRetour.Index = 11
		Me.sep2.Index = 12
		Me.cmdQuitter.Index = 13
		mnuFichier.MenuItems.AddRange(New System.Windows.Forms.MenuItem(){Me.cmdBalayer, Me.sep1, Me.cmdDébut, Me.cmdPrécédent, Me.cmdSuivant, Me.cmdFin, Me.sep2b, Me.cmdHasard, Me.sep3c, Me.cmdAutomatique, Me.sep4b2, Me.cmdRetour, Me.sep2, Me.cmdQuitter})
		Me.cmdCopier.Index = 0
		Me.sep3.Index = 1
		Me.cmdSupprimer.Index = 2
		Me.sep3b.Index = 3
		Me.cmdNettoyage.Index = 4
		mnuEdition.MenuItems.AddRange(New System.Windows.Forms.MenuItem(){Me.cmdCopier, Me.sep3, Me.cmdSupprimer, Me.sep3b, Me.cmdNettoyage})
		Me.cmdHTML.Index = 0
		Me.cmdContact.Index = 1
		Me.sep4.Index = 2
		Me.cmdEditer.Index = 3
		Me.sep4b.Index = 4
		Me.cmdListeFichiers.Index = 5
		mnuCommandes.MenuItems.AddRange(New System.Windows.Forms.MenuItem(){Me.cmdHTML, Me.cmdContact, Me.sep4, Me.cmdEditer, Me.sep4b, Me.cmdListeFichiers})
		Me.cmdAbout.Index = 0
		mnuAide.MenuItems.AddRange(New System.Windows.Forms.MenuItem(){Me.cmdAbout})
		Me.Menu = MainMenu1
	End Sub
#End Region 
#Region "Prise en charge de la mise à niveau "
	Private Shared m_vb6FormDefInstance As frmAfficheImage
	Private Shared m_InitializingDefInstance As Boolean
	Public Shared Property DefInstance() As frmAfficheImage
		Get
			If m_vb6FormDefInstance Is Nothing OrElse m_vb6FormDefInstance.IsDisposed Then
				m_InitializingDefInstance = True
				m_vb6FormDefInstance = New frmAfficheImage()
				m_InitializingDefInstance = False
			End If
			DefInstance = m_vb6FormDefInstance
		End Get
		Set
			m_vb6FormDefInstance = Value
		End Set
	End Property
#End Region 
	' AfficheImage
	' Application de navigation simple dans une liste d'images
	' Avril 1997, P.Violent
	' 15/05/97 PV     Drag'n'drop OLE
	' 24/05/97 PV     Édition, effacement de l'image après un suppr, contrôle du dossier à balayer, dossier par défaut
	' 25/05/97 PV     Historique, paramétrage de la planche de contact
	' 26/05/97 PV     Mode automatique; Boîte A propos spécialisée; police Verdana
	' 11/11/97 PV     Effacement dans la corbeille (suite à un effacement malheureux !)
	' 15/11/97 PV     Edition correcte des fichiers contenant des espaces
	' 07/09/98 PV 1.2 Utilisation du dialogue "Browse for folder"
	' 12/09/98 PV 1.3 Barre de boutons, navigation complète
	' 11/10/98 PV 1.4 Mécanisme LastKey (espace) fonctionne su action précédente à la souris
	' 20/12/98 PV 1.5 Liste des fichiers
	' 10/01/99 PV     Bouton "Liste des fichiers" dans la barre de boutons; synchro image affichée/sélection de frmFichiers
	'  7/02/99 PV     Sélection récursive à 1 niveau
	' 20/04/02 PV     Limite à 32767 images (une combo ne peut pas contenur un nb d'éléments long...)
	
	
	
	Dim sRep As String ' Répertoire contenant les images
	Public iPos As Short ' N° de l'image courante, de 0 à ...
	Dim LastKeyAscii As Short ' Code de la dernière commande pour répétition avec la barre d'espace
	
	Dim hist As New Historique ' Liste des images parcourues
	
	Enum EnumAuto ' Modes de navigation automatique
		AUTO_AUCUN
		AUTO_SUIVANT
		AUTO_HASARD
	End Enum
	
	Dim iAuto As EnumAuto ' Mode courant de navigation automatique
	
	Dim fso As Scripting.FileSystemObject ' Accès à l'objet FileSystem du scripting
	
	
	Private Sub Analyse1Rep(ByRef sRel As String)
		Dim sFic As String
		
		' D'abord les fichiers du répertoire
		' L'accès avec l'objet FileSystem est beaucoup trop lent...
		'UPGRADE_ISSUE: Impossible de déterminer à quelle constante mettre à niveau vbNormal. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2049"'
		'UPGRADE_WARNING: Dir a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1041"'
		sFic = Dir(sRep & sRel & "*", vbNormal Or FileAttribute.ReadOnly Or FileAttribute.Archive)
		While sFic <> ""
			sFic = LCase(sFic)
			If VB.Right(sFic, 4) = ".gif" Or VB.Right(sFic, 4) = ".bmp" Or VB.Right(sFic, 5) = ".html" Or VB.Right(sFic, 4) = ".jpg" Or VB.Right(sFic, 5) = ".jpeg" Then
				' Par convention on ignore les fichiers dont le nom commence par !
				If VB.Left(sFic, 1) <> "!" Then
					If cboFichiers.Items.Count < 32766 Then
						cboFichiers.Items.Add(sRel & sFic)
						If cboFichiers.Items.Count Mod 100 = 0 Then
							sbStatus.SimpleText = "Analyse des images du dossier " & sRep & sRel & ": " & cboFichiers.Items.Count & " images"
						End If
					End If
				End If
			End If
			'UPGRADE_WARNING: Dir a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1041"'
			sFic = Dir()
		End While
		
		' Puis on analyse les sous-répertoires
		Dim fo, sfo As Scripting.Folder
		fo = fso.GetFolder(sRep & sRel)
		For	Each sfo In fo.SubFolders
			sFic = LCase(sfo.Name)
			Analyse1Rep(sRel & sFic & "\")
		Next sfo
	End Sub
	
	
	Private Sub BalayerImages()
		Dim sRepNouv As String
		
		LastKeyAscii = Asc("?")
		If sRep = "" Then sRep = GetSetting(VB6.GetExeName(), "Config", "Path", "C:\")
		If VB.Right(sRep, 1) = "\" And Len(sRep) > 3 Then sRep = VB.Left(sRep, Len(sRep) - 1)
		sRepNouv = sBrowseForFolder(Me.Handle.ToInt32, sRep, "Sélectionnez le répertoire contenant les images." & vbCrLf & "Précédent: " & sRep)
		If sRepNouv = "" Then Exit Sub
		sRep = sRepNouv
		SaveSetting(VB6.GetExeName(), "Config", "Path", sRep)
		If VB.Right(sRep, 1) <> "\" Then sRep = sRep & "\"
		
		frmFichiers.DefInstance.Close()
		bFrmFichiersChargé = False
		
		'UPGRADE_WARNING: propriété Screen.MousePointer de Screen a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
		System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor
		cboFichiers.Visible = False
		cboFichiers.Items.Clear()
		hist.clear()
		
		fso = New Scripting.FileSystemObject
		sbStatus.SimpleText = "Analyse des images du dossier " & sRep
		sbStatus.CtlRefresh()
		Analyse1Rep("")
		'UPGRADE_NOTE: L'objet fso ne peut pas être détruit tant qu'il n'est pas récupéré par le garbage collector (ramasse-miettes). Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1029"'
		fso = Nothing
		
		sbStatus.SimpleText = ""
		iPos = 0
		AfficheImage()
		cboFichiers.Visible = True
		'UPGRADE_WARNING: propriété Screen.MousePointer de Screen a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
		System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default
	End Sub
	
	Private Sub NavigueHasard()
		LastKeyAscii = Asc("*")
		If cboFichiers.Items.Count = 0 Then Exit Sub
		iPos = Int(cboFichiers.Items.Count * Rnd())
		AfficheImage()
	End Sub
	
	Private Sub NavigueDébut()
		iPos = 0
		AfficheImage()
	End Sub
	
	Private Sub NaviguePrécédent()
		LastKeyAscii = Asc("-")
		If iPos > 0 Then
			iPos = iPos - 1
			AfficheImage()
		End If
	End Sub
	
	Private Sub NavigueSuivant()
		LastKeyAscii = Asc("+")
		If iPos < cboFichiers.Items.Count - 1 Then
			iPos = iPos + 1
			AfficheImage()
		End If
	End Sub
	
	Private Sub NavigueFin()
		iPos = cboFichiers.Items.Count - 1
		If iPos < 0 Then iPos = 0
		AfficheImage()
	End Sub
	
	
	Sub AfficheImage()
		' Cas où il n'y a rien de chargé
		If cboFichiers.Items.Count = 0 Then Exit Sub
		
		' On synchronise la sélction de frmFichiers
		If bFrmFichiersChargé Then
			frmFichiers.DefInstance.lvFichiers.SelectedItem = frmFichiers.DefInstance.lvFichiers.ListItems(iPos + 1)
		End If
		
		On Error Resume Next
		cboFichiers.SelectedIndex = iPos
		Image2.Image = System.Drawing.Image.FromFile(sRep & cboFichiers.Text)
		If Err.Number Then
			Image1.Image = Nothing
			'UPGRADE_ISSUE: Image méthode Image1.Print - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2064"'
			Image1.Print("Échec à l'ouverture de " & sRep & cboFichiers.Text & vbCrLf & "Erreur " & Err.Number & ": " & ErrorToString())
			Text = "AfficheImage"
			sbStatus.Panels("Fichier")._ObjectDefault = ""
			sbStatus.Panels("Résolution")._ObjectDefault = ""
			sbStatus.Panels("Taille")._ObjectDefault = ""
			sbStatus.Panels("Echelle")._ObjectDefault = ""
		Else
			On Error GoTo 0
			DoAffichage()
			Text = cboFichiers.Text & " - AfficheImage"
			hist.Ajoute(iPos)
		End If
		lblPos.Text = iPos + 1 & "/" & cboFichiers.Items.Count
	End Sub
	
	Sub DoAffichage()
		If cboFichiers.Text = "" Then Exit Sub
		
		sbStatus.Panels("Fichier")._ObjectDefault = sRep & cboFichiers.Text
		sbStatus.Panels("Résolution")._ObjectDefault = Image2.Width & " x " & Image2.Height
		sbStatus.Panels("Taille")._ObjectDefault = VB6.Format(FileLen(sRep & cboFichiers.Text) / 1024, "#.0 K")
		Dim r1, r2 As Single
		If chkStretch.CheckState Then
			r1 = (frmAfficheImage.DefInstance.ClientRectangle.Width - 8) / Image2.Width
			r2 = (frmAfficheImage.DefInstance.ClientRectangle.Height - 63) / Image2.Height
			If r2 < r1 Then r1 = r2
			If chkAjuster.CheckState = 0 Then If r1 > 1 Then r1 = 1
			Image1.Image = Nothing
			If r1 < 0 Then Exit Sub
			Image1.SetBounds(Image1.Left, Image1.Top, Image2.Width * r1, Image2.Height * r1)
			sbStatus.Panels("Echelle")._ObjectDefault = VB6.Format(r1, "#%")
		Else
			sbStatus.Panels("Echelle")._ObjectDefault = "100%"
		End If
		Image1.Image = Image2.Image
	End Sub
	
	
	'UPGRADE_WARNING: L'événement cboFichiers.SelectedIndexChanged peut se déclencher lorsque le formulaire est initialisé. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2075"'
	Private Sub cboFichiers_SelectedIndexChanged(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cboFichiers.SelectedIndexChanged
		If iPos <> cboFichiers.SelectedIndex Then
			iPos = cboFichiers.SelectedIndex
			AfficheImage()
		End If
	End Sub
	
	'UPGRADE_WARNING: L'événement chkAjuster.CheckStateChanged peut se déclencher lorsque le formulaire est initialisé. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2075"'
	Private Sub chkAjuster_CheckStateChanged(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles chkAjuster.CheckStateChanged
		DoAffichage()
	End Sub
	
	'UPGRADE_WARNING: L'événement chkStretch.CheckStateChanged peut se déclencher lorsque le formulaire est initialisé. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2075"'
	Private Sub chkStretch_CheckStateChanged(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles chkStretch.CheckStateChanged
		'UPGRADE_WARNING:  . de  a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
		Image1.SizeMode = chkStretch.CheckState
		chkAjuster.Enabled = chkStretch.CheckState
		DoAffichage()
	End Sub
	
	Private Sub NavigueAutomatique()
		If cboFichiers.Items.Count = 0 Then Exit Sub
		
		frmAutomatique.DefInstance.ShowDialog()
		If frmAutomatique.DefInstance.chkOk.CheckState = 0 Then Exit Sub
		
		If frmAutomatique.DefInstance.optAucun.Checked Then
			iAuto = EnumAuto.AUTO_AUCUN
			tmrTim.Enabled = False
			Exit Sub
		ElseIf frmAutomatique.DefInstance.optAléatoire.Checked Then 
			iAuto = EnumAuto.AUTO_HASARD
		Else
			iAuto = EnumAuto.AUTO_SUIVANT
		End If
		'UPGRADE_WARNING: La propriété tmrTim.Interval de la minuterie ne peut pas avoir la valeur 0. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2020"'
		tmrTim.Interval = 1000 * CDbl(frmAutomatique.DefInstance.txtDélai.Text)
		tmrTim.Enabled = True
	End Sub
	
	Private Sub NavigueRetour()
		If hist.count > 1 Then
			iPos = hist.Back
			AfficheImage()
		End If
	End Sub
	
	Private Sub CopieImage()
		If cboFichiers.Text = "" Then Exit Sub
		
		'UPGRADE_ISSUE: Clipboard méthode Clipboard.clear - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2069"'
		Clipboard.clear()
		'UPGRADE_ISSUE: Clipboard méthode Clipboard.SetData - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2069"'
		Clipboard.SetData(Image1.Image)
	End Sub
	
	
	Public Sub SupprimeImage()
		If cboFichiers.Text = "" Then Exit Sub
		
		sbStatus.SimpleText = sRep & cboFichiers.Text & " : Suppression en cours"
		'UPGRADE_WARNING: propriété Screen.MousePointer de Screen a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
		System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor
		
		Dim iErr As Integer
		iErr = EffaceFichierCorbeille(Me.Handle.ToInt32, sRep & cboFichiers.Text)
		If iErr Then
			MsgBox("Échec à la suppression du fichier " & sRep & cboFichiers.Text & vbCrLf & "Err: " & Err.Number & ErrorToString())
		Else
			Image1.Image = Nothing
			sbStatus.SimpleText = sRep & cboFichiers.Text & " : Supprimé (envoyé à la corbeille)"
		End If
		'UPGRADE_WARNING: propriété Screen.MousePointer de Screen a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
		System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default
		
		Dim i As Short
		i = cboFichiers.SelectedIndex
		cboFichiers.Items.RemoveAt(i)
		If i = cboFichiers.Items.Count Then i = i - 1
		cboFichiers.SelectedIndex = i
		AfficheImage()
	End Sub
	
	
	' ===================================================
	' Raccourcis clavier
	
	Private Sub Clic(ByRef sButtonKey As String, ByRef bPressed As Boolean)
		If bPressed Then
			tbBoutons.Buttons(sButtonKey).Value = MSComctlLib.ValueConstants.tbrPressed
			tbBoutons.CtlRefresh()
		Else
			tbBoutons.Buttons(sButtonKey).Value = MSComctlLib.ValueConstants.tbrUnpressed
		End If
	End Sub
	
	Private Sub ListeFichiers()
		Dim l As AxMSComctlLib.AxListView
		Dim i As Short
		l = frmFichiers.DefInstance.lvFichiers
		Dim x As MSComctlLib.ListItem
		If l.ListItems.count = 0 Then
			'UPGRADE_WARNING: propriété Screen.MousePointer de Screen a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
			System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor
			For i = 0 To cboFichiers.Items.Count - 1
				l.ListItems.Add( ,  , VB6.GetItemString(cboFichiers, i))
			Next 
			'UPGRADE_WARNING: propriété Screen.MousePointer de Screen a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
			System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default
		End If
		
		bFrmFichiersChargé = True
		frmFichiers.DefInstance.lvFichiers.SelectedItem = frmFichiers.DefInstance.lvFichiers.ListItems(iPos + 1)
		frmFichiers.DefInstance.Show()
	End Sub
	
	Public Sub cmdNettoyage_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdNettoyage.Popup
		cmdNettoyage_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdNettoyage_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdNettoyage.Click
		Do While iPos < cboFichiers.Items.Count - 1
			If Image2.Width <= 2 Then
				Stop
			Else
				NavigueSuivant()
			End If
		Loop 
	End Sub
	
	Private Sub frmAfficheImage_KeyDown(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.KeyEventArgs) Handles MyBase.KeyDown
		Dim KeyCode As Short = eventArgs.KeyCode
		Dim Shift As Short = eventArgs.KeyData \ &H10000
		Select Case KeyCode
			Case System.Windows.Forms.Keys.Home : Clic("First", True) : NavigueDébut() : Clic("First", False)
			Case System.Windows.Forms.Keys.End : Clic("Last", True) : NavigueFin() : Clic("Last", False)
			Case System.Windows.Forms.Keys.Back : NavigueRetour()
		End Select
	End Sub
	
	Private Sub frmAfficheImage_KeyPress(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.KeyPressEventArgs) Handles MyBase.KeyPress
		Dim KeyAscii As Short = Asc(eventArgs.KeyChar)
		If KeyAscii = 32 Then
			'UPGRADE_ISSUE: Assignation non prise en charge : KeyAscii avec une valeur différente de zéro Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1058"'
			KeyAscii = LastKeyAscii
		End If
		Select Case Chr(KeyAscii)
			Case "?" : Clic("Open", True) : BalayerImages() : Clic("Open", False)
			Case "-" : Clic("Previous", True) : NaviguePrécédent() : Clic("Previous", False)
			Case "+", Chr(13) : Clic("Next", True) : NavigueSuivant() : Clic("Next", False)
			Case "*" : Clic("Random", True) : NavigueHasard() : Clic("Random", False)
		End Select
		If KeyAscii = 0 Then
			eventArgs.Handled = True
		End If
	End Sub
	
	'UPGRADE_WARNING: événement frmAfficheImage.Unload de Form a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
	Private Sub frmAfficheImage_Closed(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Closed
		On Error Resume Next
		frmFichiers.DefInstance.Close() ' La feuille des fichiers n'est pas modale
	End Sub
	
	' ===================================================
	' Barre de boutons
	
	Private Sub tbBoutons_ButtonClick(ByVal eventSender As System.Object, ByVal eventArgs As AxMSComctlLib.IToolbarEvents_ButtonClickEvent) Handles tbBoutons.ButtonClick
		Select Case eventArgs.Button.Key
			Case "Open" : BalayerImages()
			Case "First" : NavigueDébut()
			Case "Previous" : NaviguePrécédent()
			Case "Next" : NavigueSuivant()
			Case "Last" : NavigueFin()
			Case "Random" : NavigueHasard()
			Case "Delete" : SupprimeImage()
			Case "Fichiers" : ListeFichiers()
			Case Else : Stop
		End Select
	End Sub
	
	
	
	' ===================================================
	' Menus
	
	Public Sub cmdBalayer_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdBalayer.Popup
		cmdBalayer_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdBalayer_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdBalayer.Click
		BalayerImages()
	End Sub
	
	
	Public Sub cmdDébut_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdDébut.Popup
		cmdDébut_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdDébut_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdDébut.Click
		NavigueDébut()
	End Sub
	
	Public Sub cmdPrécédent_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdPrécédent.Popup
		cmdPrécédent_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdPrécédent_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdPrécédent.Click
		NaviguePrécédent()
	End Sub
	
	Public Sub cmdSuivant_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdSuivant.Popup
		cmdSuivant_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdSuivant_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdSuivant.Click
		NavigueSuivant()
	End Sub
	
	Public Sub cmdFin_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdFin.Popup
		cmdFin_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdFin_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdFin.Click
		NavigueFin()
	End Sub
	
	
	Public Sub cmdHasard_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdHasard.Popup
		cmdHasard_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdHasard_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdHasard.Click
		NavigueHasard()
	End Sub
	
	Public Sub cmdAutomatique_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdAutomatique.Popup
		cmdAutomatique_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdAutomatique_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdAutomatique.Click
		NavigueAutomatique()
	End Sub
	
	Public Sub cmdRetour_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdRetour.Popup
		cmdRetour_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdRetour_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdRetour.Click
		NavigueRetour()
	End Sub
	
	
	Public Sub cmdQuitter_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdQuitter.Popup
		cmdQuitter_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdQuitter_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdQuitter.Click
		Me.Close()
	End Sub
	
	
	Public Sub cmdCopier_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdCopier.Popup
		cmdCopier_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdCopier_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdCopier.Click
		CopieImage()
	End Sub
	
	Public Sub cmdSupprimer_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdSupprimer.Popup
		cmdSupprimer_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdSupprimer_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdSupprimer.Click
		SupprimeImage()
	End Sub
	
	
	
	Public Sub cmdEditer_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdEditer.Popup
		cmdEditer_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdEditer_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdEditer.Click
		If cboFichiers.Text = "" Then Exit Sub
		FileShellExecute(Handle.ToInt32, Chr(34) & sRep & cboFichiers.Text & Chr(34))
	End Sub
	
	Public Sub cmdListeFichiers_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdListeFichiers.Popup
		cmdListeFichiers_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdListeFichiers_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdListeFichiers.Click
		ListeFichiers()
	End Sub
	
	
	
	
	Public Sub cmdAbout_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdAbout.Popup
		cmdAbout_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdAbout_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdAbout.Click
		frmAPropos.DefInstance.ShowDialog()
	End Sub
	
	
	' ===================================================
	
	
	Private Sub frmAfficheImage_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		cmdBalayer.Text = "&Balayer" & vbTab & "?"
		cmdDébut.Text = "&Début" & vbTab & "Début"
		cmdPrécédent.Text = "&Précédent" & vbTab & "-"
		cmdSuivant.Text = "&Suivant" & vbTab & "+"
		cmdFin.Text = "&Fin" & vbTab & "Fin"
		cmdHasard.Text = "Au &hasard" & vbTab & "*"
		cmdRetour.Text = "&Retour" & vbTab & "Ret.Arr"
		cmdQuitter.Text = "&Quitter" & vbTab & "Alt+F4"
		
		Randomize()
		'UPGRADE_WARNING:  . de  a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
		Image1.SizeMode = chkStretch.CheckState
		Show()
		tbBoutons.CtlRefresh()
		
		cmdBalayer_Click(cmdBalayer, New System.EventArgs())
	End Sub
	
	'UPGRADE_WARNING: L'événement frmAfficheImage.Resize peut se déclencher lorsque le formulaire est initialisé. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2075"'
	Private Sub frmAfficheImage_Resize(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Resize
		If ClientRectangle.Width > 500 Then
			chkAjuster.Left = ClientRectangle.Width - 145
			chkStretch.Left = ClientRectangle.Width - 145
			cboFichiers.Width = ClientRectangle.Width - 480
		End If
		frmAfficheImage_Paint(Me, New System.Windows.Forms.PaintEventArgs(Nothing, Nothing))
		DoAffichage()
	End Sub
	
	Private Sub frmAfficheImage_Paint(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.PaintEventArgs) Handles MyBase.Paint
		'UPGRADE_ISSUE: Form méthode frmAfficheImage.Line - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2064"'
		Me.Line (0, 0) - (ClientRectangle.Width, 0), System.Drawing.ColorTranslator.ToOle(System.Drawing.SystemColors.ControlDark)
		'UPGRADE_ISSUE: Form méthode frmAfficheImage.Line - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2064"'
		Me.Line (0, 1) - (ClientRectangle.Width, 0), System.Drawing.ColorTranslator.ToOle(System.Drawing.SystemColors.ControlLightLight)
		
		'UPGRADE_ISSUE: Form méthode frmAfficheImage.Line - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2064"'
		Me.Line (0, 33) - (ClientRectangle.Width, 0), System.Drawing.ColorTranslator.ToOle(System.Drawing.SystemColors.ControlDark)
		'UPGRADE_ISSUE: Form méthode frmAfficheImage.Line - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2064"'
		Me.Line (0, 34) - (ClientRectangle.Width, 0), System.Drawing.ColorTranslator.ToOle(System.Drawing.SystemColors.ControlLightLight)
	End Sub
	
	
	
	Public Sub cmdHTML_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdHTML.Popup
		cmdHTML_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdHTML_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdHTML.Click
		If cboFichiers.Items.Count = 0 Then Exit Sub
		
		Dim i As Short
		Dim sFic As String
		
		sFic = sRep & "!images.htm"
		sFic = InputBox("Nom du fichier à générer ?",  , sFic)
		If sFic = "" Then Exit Sub
		
		'UPGRADE_WARNING: propriété Screen.MousePointer de Screen a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
		System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor
		
		FileOpen(1, sFic, OpenMode.Output)
		PrintLine(1, "<HTML>")
		PrintLine(1, "<HEAD>")
		PrintLine(1, "<TITLE>Images de " & sRep & "</TITLE>")
		PrintLine(1, "<!-- Généré le " & VB6.Format(Now, "ddd dd/mm/yyyy hh:nn:ss") & "-->")
		PrintLine(1, "</HEAD>")
		PrintLine(1, "<BODY>")
		PrintLine(1, "<H1>Images de " & sRep & "</H1>")
		For i = 0 To cboFichiers.Items.Count - 1
			iPos = i
			'AfficheImage
			'Print #1, "<IMG src=" & Chr(34) & "" & cboFichiers.List(i) & Chr(34) & " width=" & Int(Image2.Width * 0.4) & " height="; Int(Image2.Height * 0.4) & "><BR><BR>"
			'DoEvents
			
			PrintLine(1, "<IMG src=" & Chr(34) & "" & VB6.GetItemString(cboFichiers, i) & Chr(34) & "><BR><BR>")
		Next 
		PrintLine(1, "</BODY>")
		PrintLine(1, "</HTML>")
		FileClose(1)
		
		'UPGRADE_WARNING: propriété Screen.MousePointer de Screen a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
		System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default
	End Sub
	
	
	Public Sub cmdContact_Popup(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdContact.Popup
		cmdContact_Click(eventSender, eventArgs)
	End Sub
	Public Sub cmdContact_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdContact.Click
		If cboFichiers.Items.Count = 0 Then Exit Sub
		
		Dim iVignettesLignes, iVignettesColonnes As Short
		Dim iImageLignes, iImageColonnes As Short
		
		frmOptionsContact.DefInstance.ShowDialog()
		
		If frmOptionsContact.DefInstance.chkOk.CheckState = 0 Then Exit Sub
		iVignettesLignes = CShort(frmOptionsContact.DefInstance.txtVignettesLignes.Text)
		iVignettesColonnes = CShort(frmOptionsContact.DefInstance.txtVignettesColonnes.Text)
		iImageLignes = CShort(frmOptionsContact.DefInstance.txtImageLignes.Text)
		iImageColonnes = CShort(frmOptionsContact.DefInstance.txtImageColonnes.Text)
		
		Dim j, iRang, i, iPlanche As Short
		Dim sContact As String
		iRang = 0
		iPlanche = 1
		
		frmContact.DefInstance.Show()
		frmContact.DefInstance.SetBounds(0, 0, VB6.TwipsToPixelsX(VB6.TwipsPerPixelX * (VB6.PixelsToTwipsX(frmContact.DefInstance.Width) / VB6.TwipsPerPixelX - frmContact.DefInstance.ClientRectangle.Width + iImageColonnes + 1)), VB6.TwipsToPixelsY(VB6.TwipsPerPixelY * (VB6.PixelsToTwipsY(frmContact.DefInstance.Height) / VB6.TwipsPerPixelY - frmContact.DefInstance.ClientRectangle.Height + iImageLignes + 1)))
		Do 
			sContact = "!contact " & VB.Right(Str(iPlanche + 100), 2) & ".bmp"
			'UPGRADE_ISSUE: Form méthode frmContact.Cls - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2064"'
			frmContact.Cls()
			frmContact.DefInstance.Text = sContact
			For i = 0 To iVignettesLignes - 1
				For j = 0 To iVignettesColonnes - 1
					If iRang < cboFichiers.Items.Count Then
						frmContact.DefInstance.Vignette(j, i, sRep, VB6.GetItemString(cboFichiers, iRang), iVignettesColonnes, iVignettesLignes)
						iRang = iRang + 1
					End If
				Next 
			Next 
			'UPGRADE_WARNING: SavePicture a été mis à niveau vers System.Drawing.Image.Save et a un nouveau comportement. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1041"'
			frmContact.DefInstance.Image.Save(sRep & sContact)
			iPlanche = iPlanche + 1
		Loop Until iRang >= cboFichiers.Items.Count
		
		frmContact.DefInstance.Close()
	End Sub
	
	' ========================================================================
	' Drag and drop OLE: liste de fichiers depuis l'explorateur
	
	'UPGRADE_ISSUE: DataObject L'objet - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2068"'
	'UPGRADE_WARNING: Form de l'événement Form. OLEDragOver n'a pas été mis à niveau. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2050"'
	Private Sub Form_OLEDragOver(ByRef Data As DataObject, ByRef Effect As Integer, ByRef Button As Short, ByRef Shift As Short, ByRef x As Single, ByRef y As Single, ByRef State As Short)
		'UPGRADE_ISSUE: La constante vbCFFiles n'a pas été mise à niveau. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2070"'
		'UPGRADE_ISSUE: DataObject méthode Data.GetFormat - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2069"'
		If Data.GetFormat(vbCFFiles) Then
			'Si le format des données est approprié, indique à la source l'action à exécuter
			Effect = System.Windows.Forms.DragDropEffects.Copy And Effect
			Exit Sub
		End If
		'Si le format des données est incorrect, pas de déplacement.
		Effect = System.Windows.Forms.DragDropEffects.None
	End Sub
	
	'UPGRADE_ISSUE: DataObject L'objet - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2068"'
	'UPGRADE_WARNING: Form de l'événement Form. OLEDragDrop n'a pas été mis à niveau. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2050"'
	Private Sub Form_OLEDragDrop(ByRef Data As DataObject, ByRef Effect As Integer, ByRef Button As Short, ByRef Shift As Short, ByRef x As Single, ByRef y As Single)
		cboFichiers.Items.Clear()
		hist.clear()
		
		Dim f As Object
		Dim sFic As String
		sRep = "" ' Chemin absolu pour le drag'n'drop
		'UPGRADE_ISSUE: DataObject propriété Data.Files - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2069"'
		For	Each f In Data.Files
			'UPGRADE_WARNING: Impossible de résoudre la propriété par défaut de l'objet f. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1037"'
			sFic = LCase(f)
			If VB.Right(sFic, 4) = ".gif" Or VB.Right(sFic, 4) = ".bmp" Or VB.Right(sFic, 4) = ".htm" Or VB.Right(sFic, 5) = ".html" Or VB.Right(sFic, 4) = ".jpg" Or VB.Right(sFic, 5) = ".jpeg" Then
				' Par convention on ignore les fichiers dont le nom commence par !
				If VB.Left(sFic, 1) <> "!" Then cboFichiers.Items.Add(sFic)
			End If
		Next f
		iPos = 0
		AfficheImage()
	End Sub
	
	'UPGRADE_ISSUE: DataObject L'objet - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2068"'
	'UPGRADE_WARNING: Image1 de l'événement Image. OLEDragDrop n'a pas été mis à niveau. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2050"'
	Private Sub Image1_OLEDragDrop(ByRef Data As DataObject, ByRef Effect As Integer, ByRef Button As Short, ByRef Shift As Short, ByRef x As Single, ByRef y As Single)
		'UPGRADE_WARNING: Form de l'événement Form. OLEDragDrop n'a pas été mis à niveau. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2050"'
		Form_OLEDragDrop(Data, Effect, Button, Shift, x, y)
	End Sub
	
	'UPGRADE_ISSUE: DataObject L'objet - Mise à niveau non effectuée Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2068"'
	'UPGRADE_WARNING: Image1 de l'événement Image. OLEDragOver n'a pas été mis à niveau. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2050"'
	Private Sub Image1_OLEDragOver(ByRef Data As DataObject, ByRef Effect As Integer, ByRef Button As Short, ByRef Shift As Short, ByRef x As Single, ByRef y As Single, ByRef State As Short)
		'UPGRADE_WARNING: Form de l'événement Form. OLEDragOver n'a pas été mis à niveau. Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2050"'
		Form_OLEDragOver(Data, Effect, Button, Shift, x, y, State)
	End Sub
	
	Private Sub tmrTim_Tick(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles tmrTim.Tick
		Select Case iAuto
			Case EnumAuto.AUTO_HASARD : NavigueHasard()
			Case EnumAuto.AUTO_SUIVANT : NavigueSuivant()
		End Select
	End Sub
End Class