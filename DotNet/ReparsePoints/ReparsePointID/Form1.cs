using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using ReparsePoints;

// Shows a tree of folders, and indicates which ones are Symbolic Links, Junction Points or Mount Points and shows the target.
// Does not show Symbolic Links pointing to files
namespace ReparsePointID
{
	public partial class Form1 : Form
	{
		public Form1()
		{
			InitializeComponent();

			// Put drives into treeview
			DriveInfo[] drives = DriveInfo.GetDrives();
			foreach (DriveInfo drive in drives)
			{
				RPTreeView.Nodes.Add(drive.Name.Substring(0,2));		// Take off the \
			}
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="node"></param>
		private void fillNode(TreeNode node)
		{
			node.Nodes.Clear();
			string fullpath = "";
			TreeNode nextNode = node;
			// Build the full path by working our way up the tree adding each node's text to the full path.
			// If we're using targets and we hit a reparse point, put the RPs target on the front and stop looping
			do
			{
				if (targetRadioButton.Checked &&
					nextNode.Tag != null &&
					((ReparsePoint)nextNode.Tag).Tag != ReparsePoint.TagType.None &&
					((ReparsePoint)nextNode.Tag).Tag != ReparsePoint.TagType.MountPoint)	// Don;t trya and access mountpoints by target
				{
					// access the folder via its target rather than its actual name (this is the only way under XP)
					fullpath = ((ReparsePoint)nextNode.Tag).ToString() + "\\" + fullpath;
					break;
				}
				else
				{
					fullpath = nextNode.Text + "\\" + fullpath;
					nextNode = nextNode.Parent;
				}
			} while (nextNode != null);
			try
			{
				foreach (string directory in Directory.GetDirectories(fullpath))
				{
					ReparsePoint reparsePoint = new ReparsePoint(directory);
					TreeNode newNode = node.Nodes.Add(directory.Substring(directory.LastIndexOf('\\') + 1));
					newNode.Tag = reparsePoint;
					if (reparsePoint.Tag == ReparsePoint.TagType.MountPoint)
					{
						newNode.ForeColor = Color.Red;
					}
					else if (reparsePoint.Tag == ReparsePoint.TagType.JunctionPoint)
					{
						newNode.ForeColor = Color.Blue;
					}
					if (reparsePoint.Tag == ReparsePoint.TagType.SymbolicLink)
					{
						newNode.ForeColor = Color.Green;
					}
				}
			}
			catch (Exception exception)
			{
				MessageBox.Show(exception.Message, exception.GetType().ToString());
			}
			node.Expand();
		}

		private void RPTreeView_AfterExpand(object sender, TreeViewEventArgs e)
		{
			if (e.Action == TreeViewAction.ByKeyboard || e.Action == TreeViewAction.ByMouse)
			{
				fillNode(e.Node);
			}
		}

		private void RPTreeView_AfterSelect(object sender, TreeViewEventArgs e)
		{
			if (e.Action != TreeViewAction.Collapse & e.Action != TreeViewAction.Unknown)
			{
				fillNode(e.Node);
				if (((ReparsePoint)e.Node.Tag) == null || ((ReparsePoint)e.Node.Tag).Tag == ReparsePoint.TagType.None)
				{
					normalisedTargetLabel.Text = "";
					actualTargetLabel.Text = "";
				}
				else
				{
					normalisedTargetLabel.Text = "'" + ((ReparsePoint)e.Node.Tag).ToString() + "'";
					actualTargetLabel.Text = "'" + ((ReparsePoint)e.Node.Tag).Target + "'";
				}
			}
		}
	}
}