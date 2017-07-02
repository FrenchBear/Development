namespace ReparsePointID
{
	partial class Form1
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.RPTreeView = new System.Windows.Forms.TreeView();
			this.label1 = new System.Windows.Forms.Label();
			this.normalisedTargetLabel = new System.Windows.Forms.Label();
			this.linkRadioButton = new System.Windows.Forms.RadioButton();
			this.targetRadioButton = new System.Windows.Forms.RadioButton();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.label5 = new System.Windows.Forms.Label();
			this.actualTargetLabel = new System.Windows.Forms.Label();
			this.label7 = new System.Windows.Forms.Label();
			this.SuspendLayout();
			// 
			// RPTreeView
			// 
			this.RPTreeView.Location = new System.Drawing.Point(12, 12);
			this.RPTreeView.Name = "RPTreeView";
			this.RPTreeView.Size = new System.Drawing.Size(570, 458);
			this.RPTreeView.TabIndex = 0;
			this.RPTreeView.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.RPTreeView_AfterSelect);
			this.RPTreeView.AfterExpand += new System.Windows.Forms.TreeViewEventHandler(this.RPTreeView_AfterExpand);
			// 
			// label1
			// 
			this.label1.AutoSize = true;
			this.label1.Location = new System.Drawing.Point(12, 477);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(89, 13);
			this.label1.TabIndex = 1;
			this.label1.Text = "Normalised target";
			// 
			// normalisedTargetLabel
			// 
			this.normalisedTargetLabel.AutoSize = true;
			this.normalisedTargetLabel.Location = new System.Drawing.Point(107, 477);
			this.normalisedTargetLabel.Name = "normalisedTargetLabel";
			this.normalisedTargetLabel.Size = new System.Drawing.Size(22, 13);
			this.normalisedTargetLabel.TabIndex = 2;
			this.normalisedTargetLabel.Text = "xxx";
			// 
			// linkRadioButton
			// 
			this.linkRadioButton.AutoSize = true;
			this.linkRadioButton.Checked = true;
			this.linkRadioButton.Location = new System.Drawing.Point(15, 513);
			this.linkRadioButton.Name = "linkRadioButton";
			this.linkRadioButton.Size = new System.Drawing.Size(300, 17);
			this.linkRadioButton.TabIndex = 3;
			this.linkRadioButton.TabStop = true;
			this.linkRadioButton.Text = "Access the contents of each folder using the reparse point";
			this.linkRadioButton.UseVisualStyleBackColor = true;
			// 
			// targetRadioButton
			// 
			this.targetRadioButton.AutoSize = true;
			this.targetRadioButton.Location = new System.Drawing.Point(15, 536);
			this.targetRadioButton.Name = "targetRadioButton";
			this.targetRadioButton.Size = new System.Drawing.Size(423, 17);
			this.targetRadioButton.TabIndex = 4;
			this.targetRadioButton.Text = "Access the contents of each folder using the normalised target (must be used on X" +
				"P)";
			this.targetRadioButton.UseVisualStyleBackColor = true;
			// 
			// label2
			// 
			this.label2.AutoSize = true;
			this.label2.Location = new System.Drawing.Point(555, 477);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(25, 13);
			this.label2.TabIndex = 5;
			this.label2.Text = "Key";
			// 
			// label3
			// 
			this.label3.AutoSize = true;
			this.label3.ForeColor = System.Drawing.Color.Red;
			this.label3.Location = new System.Drawing.Point(519, 497);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(63, 13);
			this.label3.TabIndex = 6;
			this.label3.Text = "Mount point";
			// 
			// label4
			// 
			this.label4.AutoSize = true;
			this.label4.ForeColor = System.Drawing.Color.Blue;
			this.label4.Location = new System.Drawing.Point(508, 515);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(74, 13);
			this.label4.TabIndex = 7;
			this.label4.Text = "Junction Point";
			// 
			// label5
			// 
			this.label5.AutoSize = true;
			this.label5.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(0)))));
			this.label5.Location = new System.Drawing.Point(508, 538);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(72, 13);
			this.label5.TabIndex = 8;
			this.label5.Text = "Symbolic Link";
			// 
			// actualTargetLabel
			// 
			this.actualTargetLabel.AutoSize = true;
			this.actualTargetLabel.Location = new System.Drawing.Point(107, 497);
			this.actualTargetLabel.Name = "actualTargetLabel";
			this.actualTargetLabel.Size = new System.Drawing.Size(22, 13);
			this.actualTargetLabel.TabIndex = 10;
			this.actualTargetLabel.Text = "xxx";
			// 
			// label7
			// 
			this.label7.AutoSize = true;
			this.label7.Location = new System.Drawing.Point(12, 497);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(67, 13);
			this.label7.TabIndex = 9;
			this.label7.Text = "Actual target";
			// 
			// Form1
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(594, 568);
			this.Controls.Add(this.actualTargetLabel);
			this.Controls.Add(this.label7);
			this.Controls.Add(this.label5);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.targetRadioButton);
			this.Controls.Add(this.linkRadioButton);
			this.Controls.Add(this.normalisedTargetLabel);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.RPTreeView);
			this.Name = "Form1";
			this.Text = "Reparse Point ID";
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.TreeView RPTreeView;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label normalisedTargetLabel;
		private System.Windows.Forms.RadioButton linkRadioButton;
		private System.Windows.Forms.RadioButton targetRadioButton;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Label actualTargetLabel;
		private System.Windows.Forms.Label label7;
	}
}

