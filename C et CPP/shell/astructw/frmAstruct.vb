Public Class frmAstruct
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
    Friend WithEvents btnOk As System.Windows.Forms.Button
    Friend WithEvents btnCancel As System.Windows.Forms.Button
    Friend WithEvents FolderBrowser As System.Windows.Forms.FolderBrowserDialog
    Friend WithEvents btnLookupDestination As System.Windows.Forms.Button
    Friend WithEvents btnLookupSource As System.Windows.Forms.Button
    Friend WithEvents txtDestination As System.Windows.Forms.TextBox
    Friend WithEvents lblDestination As System.Windows.Forms.Label
    Friend WithEvents txtSource As System.Windows.Forms.TextBox
    Friend WithEvents lblSource As System.Windows.Forms.Label
    Friend WithEvents fraExclusions As System.Windows.Forms.GroupBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.btnOk = New System.Windows.Forms.Button
        Me.btnCancel = New System.Windows.Forms.Button
        Me.FolderBrowser = New System.Windows.Forms.FolderBrowserDialog
        Me.btnLookupDestination = New System.Windows.Forms.Button
        Me.btnLookupSource = New System.Windows.Forms.Button
        Me.txtDestination = New System.Windows.Forms.TextBox
        Me.lblDestination = New System.Windows.Forms.Label
        Me.txtSource = New System.Windows.Forms.TextBox
        Me.lblSource = New System.Windows.Forms.Label
        Me.fraExclusions = New System.Windows.Forms.GroupBox
        Me.SuspendLayout()
        '
        'btnOk
        '
        Me.btnOk.Location = New System.Drawing.Point(460, 8)
        Me.btnOk.Name = "btnOk"
        Me.btnOk.TabIndex = 2
        Me.btnOk.Text = "Ok"
        '
        'btnCancel
        '
        Me.btnCancel.Location = New System.Drawing.Point(460, 40)
        Me.btnCancel.Name = "btnCancel"
        Me.btnCancel.TabIndex = 3
        Me.btnCancel.Text = "Cancel"
        '
        'btnLookupDestination
        '
        Me.btnLookupDestination.Location = New System.Drawing.Point(296, 64)
        Me.btnLookupDestination.Name = "btnLookupDestination"
        Me.btnLookupDestination.Size = New System.Drawing.Size(24, 23)
        Me.btnLookupDestination.TabIndex = 11
        Me.btnLookupDestination.Text = "..."
        '
        'btnLookupSource
        '
        Me.btnLookupSource.Location = New System.Drawing.Point(296, 24)
        Me.btnLookupSource.Name = "btnLookupSource"
        Me.btnLookupSource.Size = New System.Drawing.Size(24, 23)
        Me.btnLookupSource.TabIndex = 8
        Me.btnLookupSource.Text = "..."
        '
        'txtDestination
        '
        Me.txtDestination.HideSelection = False
        Me.txtDestination.Location = New System.Drawing.Point(8, 64)
        Me.txtDestination.Name = "txtDestination"
        Me.txtDestination.Size = New System.Drawing.Size(280, 20)
        Me.txtDestination.TabIndex = 10
        Me.txtDestination.Text = ""
        '
        'lblDestination
        '
        Me.lblDestination.Location = New System.Drawing.Point(8, 48)
        Me.lblDestination.Name = "lblDestination"
        Me.lblDestination.Size = New System.Drawing.Size(128, 16)
        Me.lblDestination.TabIndex = 9
        Me.lblDestination.Text = "Répertoire destination :"
        '
        'txtSource
        '
        Me.txtSource.HideSelection = False
        Me.txtSource.Location = New System.Drawing.Point(8, 24)
        Me.txtSource.Name = "txtSource"
        Me.txtSource.Size = New System.Drawing.Size(280, 20)
        Me.txtSource.TabIndex = 7
        Me.txtSource.Text = ""
        '
        'lblSource
        '
        Me.lblSource.Location = New System.Drawing.Point(8, 8)
        Me.lblSource.Name = "lblSource"
        Me.lblSource.Size = New System.Drawing.Size(100, 16)
        Me.lblSource.TabIndex = 6
        Me.lblSource.Text = "Répertoire source :"
        '
        'fraExclusions
        '
        Me.fraExclusions.Location = New System.Drawing.Point(8, 124)
        Me.fraExclusions.Name = "fraExclusions"
        Me.fraExclusions.Size = New System.Drawing.Size(308, 136)
        Me.fraExclusions.TabIndex = 12
        Me.fraExclusions.TabStop = False
        Me.fraExclusions.Text = "Exclusions"
        '
        'frmAstruct
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(544, 270)
        Me.Controls.Add(Me.fraExclusions)
        Me.Controls.Add(Me.btnLookupDestination)
        Me.Controls.Add(Me.btnLookupSource)
        Me.Controls.Add(Me.txtDestination)
        Me.Controls.Add(Me.lblDestination)
        Me.Controls.Add(Me.txtSource)
        Me.Controls.Add(Me.lblSource)
        Me.Controls.Add(Me.btnCancel)
        Me.Controls.Add(Me.btnOk)
        Me.Name = "frmAstruct"
        Me.Text = "astructw"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Me.Close()
    End Sub

    Private Sub btnOk_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnOk.Click
        Shell("astruct /p c:\p1 c:\p2")
    End Sub

    Private Sub btnLookupSource_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        FolderBrowser.SelectedPath = txtSource.Text
        FolderBrowser.ShowNewFolderButton = False
        FolderBrowser.Description = "Sélectionnez le dossier contenant les images source :"
        If FolderBrowser.ShowDialog(Me) = DialogResult.OK Then
            txtSource.Text = FolderBrowser.SelectedPath
            txtSource.SelectionStart = 0
            txtSource.SelectionLength = 999
        End If
    End Sub
End Class
