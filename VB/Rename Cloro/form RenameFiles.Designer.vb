<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmRenameFiles
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmRenameFiles))
        Me.txtFolder = New System.Windows.Forms.TextBox
        Me.lblFolder = New System.Windows.Forms.Label
        Me.FolderBrowserDialog1 = New System.Windows.Forms.FolderBrowserDialog
        Me.btnSelectFolder = New System.Windows.Forms.Button
        Me.gbTypeOfRename = New System.Windows.Forms.GroupBox
        Me.optRegEx = New System.Windows.Forms.RadioButton
        Me.optStringReplace = New System.Windows.Forms.RadioButton
        Me.txtSearch = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.txtReplace = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.btnPreview = New System.Windows.Forms.Button
        Me.btnRename = New System.Windows.Forms.Button
        Me.lvPreview = New System.Windows.Forms.ListView
        Me.chBefore = New System.Windows.Forms.ColumnHeader
        Me.chAction = New System.Windows.Forms.ColumnHeader
        Me.chAfter = New System.Windows.Forms.ColumnHeader
        Me.txtLike = New System.Windows.Forms.TextBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip
        Me.ToolStripProgressBar1 = New System.Windows.Forms.ToolStripProgressBar
        Me.tsslText = New System.Windows.Forms.ToolStripStatusLabel
        Me.chkIncludeSubfolders = New System.Windows.Forms.CheckBox
        Me.chkCaseSignificant = New System.Windows.Forms.CheckBox
        Me.gbTypeOfRename.SuspendLayout()
        Me.StatusStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'txtFolder
        '
        Me.txtFolder.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.txtFolder.Location = New System.Drawing.Point(98, 12)
        Me.txtFolder.Name = "txtFolder"
        Me.txtFolder.Size = New System.Drawing.Size(362, 20)
        Me.txtFolder.TabIndex = 1
        Me.txtFolder.Text = "\\spiff\d\Cloro\Mes photos\Photos D80\A garder"
        '
        'lblFolder
        '
        Me.lblFolder.AutoSize = True
        Me.lblFolder.Location = New System.Drawing.Point(9, 15)
        Me.lblFolder.Name = "lblFolder"
        Me.lblFolder.Size = New System.Drawing.Size(39, 13)
        Me.lblFolder.TabIndex = 0
        Me.lblFolder.Text = "Fol&der:"
        '
        'btnSelectFolder
        '
        Me.btnSelectFolder.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btnSelectFolder.Location = New System.Drawing.Point(466, 12)
        Me.btnSelectFolder.Name = "btnSelectFolder"
        Me.btnSelectFolder.Size = New System.Drawing.Size(27, 21)
        Me.btnSelectFolder.TabIndex = 2
        Me.btnSelectFolder.Text = "..."
        Me.btnSelectFolder.UseVisualStyleBackColor = True
        '
        'gbTypeOfRename
        '
        Me.gbTypeOfRename.Controls.Add(Me.optRegEx)
        Me.gbTypeOfRename.Controls.Add(Me.optStringReplace)
        Me.gbTypeOfRename.Enabled = False
        Me.gbTypeOfRename.Location = New System.Drawing.Point(12, 66)
        Me.gbTypeOfRename.Name = "gbTypeOfRename"
        Me.gbTypeOfRename.Size = New System.Drawing.Size(200, 57)
        Me.gbTypeOfRename.TabIndex = 5
        Me.gbTypeOfRename.TabStop = False
        Me.gbTypeOfRename.Text = "Type of rename"
        '
        'optRegEx
        '
        Me.optRegEx.AutoSize = True
        Me.optRegEx.Enabled = False
        Me.optRegEx.Location = New System.Drawing.Point(6, 33)
        Me.optRegEx.Name = "optRegEx"
        Me.optRegEx.Size = New System.Drawing.Size(115, 17)
        Me.optRegEx.TabIndex = 1
        Me.optRegEx.Text = "Regular e&xpression"
        Me.optRegEx.UseVisualStyleBackColor = True
        '
        'optStringReplace
        '
        Me.optStringReplace.AutoSize = True
        Me.optStringReplace.Checked = True
        Me.optStringReplace.Enabled = False
        Me.optStringReplace.Location = New System.Drawing.Point(6, 16)
        Me.optStringReplace.Name = "optStringReplace"
        Me.optStringReplace.Size = New System.Drawing.Size(122, 17)
        Me.optStringReplace.TabIndex = 0
        Me.optStringReplace.TabStop = True
        Me.optStringReplace.Text = "Si&mple string replace"
        Me.optStringReplace.UseVisualStyleBackColor = True
        '
        'txtSearch
        '
        Me.txtSearch.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.txtSearch.Enabled = False
        Me.txtSearch.Location = New System.Drawing.Point(98, 129)
        Me.txtSearch.Name = "txtSearch"
        Me.txtSearch.Size = New System.Drawing.Size(395, 20)
        Me.txtSearch.TabIndex = 9
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Enabled = False
        Me.Label1.Location = New System.Drawing.Point(9, 132)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(44, 13)
        Me.Label1.TabIndex = 8
        Me.Label1.Text = "&Search:"
        '
        'txtReplace
        '
        Me.txtReplace.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.txtReplace.Enabled = False
        Me.txtReplace.Location = New System.Drawing.Point(98, 155)
        Me.txtReplace.Name = "txtReplace"
        Me.txtReplace.Size = New System.Drawing.Size(395, 20)
        Me.txtReplace.TabIndex = 11
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Enabled = False
        Me.Label2.Location = New System.Drawing.Point(9, 158)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(50, 13)
        Me.Label2.TabIndex = 10
        Me.Label2.Text = "&Replace:"
        '
        'btnPreview
        '
        Me.btnPreview.Location = New System.Drawing.Point(12, 188)
        Me.btnPreview.Name = "btnPreview"
        Me.btnPreview.Size = New System.Drawing.Size(75, 23)
        Me.btnPreview.TabIndex = 12
        Me.btnPreview.Text = "&Preview"
        Me.btnPreview.UseVisualStyleBackColor = True
        '
        'btnRename
        '
        Me.btnRename.Location = New System.Drawing.Point(98, 188)
        Me.btnRename.Name = "btnRename"
        Me.btnRename.Size = New System.Drawing.Size(75, 23)
        Me.btnRename.TabIndex = 13
        Me.btnRename.Text = "Re&name"
        Me.btnRename.UseVisualStyleBackColor = True
        '
        'lvPreview
        '
        Me.lvPreview.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.lvPreview.CheckBoxes = True
        Me.lvPreview.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.chBefore, Me.chAction, Me.chAfter})
        Me.lvPreview.FullRowSelect = True
        Me.lvPreview.GridLines = True
        Me.lvPreview.HideSelection = False
        Me.lvPreview.Location = New System.Drawing.Point(12, 217)
        Me.lvPreview.MultiSelect = False
        Me.lvPreview.Name = "lvPreview"
        Me.lvPreview.Size = New System.Drawing.Size(481, 182)
        Me.lvPreview.TabIndex = 14
        Me.lvPreview.UseCompatibleStateImageBehavior = False
        Me.lvPreview.View = System.Windows.Forms.View.Details
        '
        'chBefore
        '
        Me.chBefore.Text = "File name"
        Me.chBefore.Width = 175
        '
        'chAction
        '
        Me.chAction.Text = "Action"
        Me.chAction.Width = 69
        '
        'chAfter
        '
        Me.chAfter.Text = "Renamed"
        Me.chAfter.Width = 182
        '
        'txtLike
        '
        Me.txtLike.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.txtLike.Location = New System.Drawing.Point(98, 38)
        Me.txtLike.Name = "txtLike"
        Me.txtLike.Size = New System.Drawing.Size(362, 20)
        Me.txtLike.TabIndex = 4
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(9, 41)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(50, 13)
        Me.Label3.TabIndex = 3
        Me.Label3.Text = "Files li&ke:"
        '
        'StatusStrip1
        '
        Me.StatusStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripProgressBar1, Me.tsslText})
        Me.StatusStrip1.Location = New System.Drawing.Point(0, 402)
        Me.StatusStrip1.Name = "StatusStrip1"
        Me.StatusStrip1.Size = New System.Drawing.Size(505, 22)
        Me.StatusStrip1.TabIndex = 15
        Me.StatusStrip1.Text = "StatusStrip1"
        '
        'ToolStripProgressBar1
        '
        Me.ToolStripProgressBar1.Name = "ToolStripProgressBar1"
        Me.ToolStripProgressBar1.Size = New System.Drawing.Size(100, 16)
        Me.ToolStripProgressBar1.Style = System.Windows.Forms.ProgressBarStyle.Continuous
        Me.ToolStripProgressBar1.Visible = False
        '
        'tsslText
        '
        Me.tsslText.Name = "tsslText"
        Me.tsslText.Size = New System.Drawing.Size(0, 17)
        '
        'chkIncludeSubfolders
        '
        Me.chkIncludeSubfolders.AutoSize = True
        Me.chkIncludeSubfolders.Enabled = False
        Me.chkIncludeSubfolders.Location = New System.Drawing.Point(230, 82)
        Me.chkIncludeSubfolders.Name = "chkIncludeSubfolders"
        Me.chkIncludeSubfolders.Size = New System.Drawing.Size(112, 17)
        Me.chkIncludeSubfolders.TabIndex = 6
        Me.chkIncludeSubfolders.Text = "&Include subfolders"
        Me.chkIncludeSubfolders.UseVisualStyleBackColor = True
        '
        'chkCaseSignificant
        '
        Me.chkCaseSignificant.AutoSize = True
        Me.chkCaseSignificant.Enabled = False
        Me.chkCaseSignificant.Location = New System.Drawing.Point(230, 99)
        Me.chkCaseSignificant.Name = "chkCaseSignificant"
        Me.chkCaseSignificant.Size = New System.Drawing.Size(182, 17)
        Me.chkCaseSignificant.TabIndex = 7
        Me.chkCaseSignificant.Text = "&Case significant Search/Replace"
        Me.chkCaseSignificant.UseVisualStyleBackColor = True
        '
        'frmRenameFiles
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(505, 424)
        Me.Controls.Add(Me.chkCaseSignificant)
        Me.Controls.Add(Me.chkIncludeSubfolders)
        Me.Controls.Add(Me.StatusStrip1)
        Me.Controls.Add(Me.txtLike)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.lvPreview)
        Me.Controls.Add(Me.btnRename)
        Me.Controls.Add(Me.btnPreview)
        Me.Controls.Add(Me.txtReplace)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.txtSearch)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.gbTypeOfRename)
        Me.Controls.Add(Me.btnSelectFolder)
        Me.Controls.Add(Me.txtFolder)
        Me.Controls.Add(Me.lblFolder)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "frmRenameFiles"
        Me.Text = "Rename Files"
        Me.gbTypeOfRename.ResumeLayout(False)
        Me.gbTypeOfRename.PerformLayout()
        Me.StatusStrip1.ResumeLayout(False)
        Me.StatusStrip1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents txtFolder As System.Windows.Forms.TextBox
    Friend WithEvents lblFolder As System.Windows.Forms.Label
    Friend WithEvents FolderBrowserDialog1 As System.Windows.Forms.FolderBrowserDialog
    Friend WithEvents btnSelectFolder As System.Windows.Forms.Button
    Friend WithEvents gbTypeOfRename As System.Windows.Forms.GroupBox
    Friend WithEvents optRegEx As System.Windows.Forms.RadioButton
    Friend WithEvents optStringReplace As System.Windows.Forms.RadioButton
    Friend WithEvents txtSearch As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents txtReplace As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents btnPreview As System.Windows.Forms.Button
    Friend WithEvents btnRename As System.Windows.Forms.Button
    Friend WithEvents lvPreview As System.Windows.Forms.ListView
    Friend WithEvents chBefore As System.Windows.Forms.ColumnHeader
    Friend WithEvents chAction As System.Windows.Forms.ColumnHeader
    Friend WithEvents chAfter As System.Windows.Forms.ColumnHeader
    Friend WithEvents txtLike As System.Windows.Forms.TextBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents StatusStrip1 As System.Windows.Forms.StatusStrip
    Friend WithEvents ToolStripProgressBar1 As System.Windows.Forms.ToolStripProgressBar
    Friend WithEvents chkIncludeSubfolders As System.Windows.Forms.CheckBox
    Friend WithEvents chkCaseSignificant As System.Windows.Forms.CheckBox
    Friend WithEvents tsslText As System.Windows.Forms.ToolStripStatusLabel

End Class
