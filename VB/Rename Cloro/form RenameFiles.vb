' frmRenameFiles
' Quick tool to rename a series of files in a folder
' 2006-07-26 FPVI   Version 2.0 in VB.Net
' 2006-07-28 FPVI   2.1 Like filter, ^^ ^& ^l ^u in replacement expression, about box, columns sorting
' 2006-09-27 FPVI   2.2 Option "recurse folders"
' 2006-09-27 FPVI   2.3 Option "case significant"

Option Compare Text

Imports vb = Microsoft.VisualBasic
Imports System.Text.RegularExpressions


''' <summary>
''' Main form of RenameFiles
''' </summary>
Public Class frmRenameFiles
    ''' <summary>About command in System menu</summary>
    Private WithEvents mobjSubclassedSystemMenu As SubclassedSystemMenu

    Private nbFile As Integer = 0
    Private nbRename As Integer = 0

    ''' <summary>
    ''' Form initialization
    ''' </summary>
    Private Sub frmRenameFiles_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' About command in System menu
        mobjSubclassedSystemMenu = New SubclassedSystemMenu(Me.Handle.ToInt32, "&About...")
    End Sub

    ''' <summary>
    ''' Event handled for About command in System menu
    ''' </summary>
    Private Sub mobjSubclassedSystemMenu_LaunchDialog() Handles mobjSubclassedSystemMenu.LaunchDialog
        Dim frmNew As New frmAbout
        frmNew.ShowDialog(Me)
    End Sub


    ''' <summary>
    ''' Folder selection through windows standard folder selection dialog box
    ''' </summary>
    Private Sub btnSelectFolder_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSelectFolder.Click
        FolderBrowserDialog1.SelectedPath = txtFolder.Text
        If FolderBrowserDialog1.ShowDialog = Windows.Forms.DialogResult.OK Then
            txtFolder.Text = FolderBrowserDialog1.SelectedPath
        End If
    End Sub

    ''' <summary>
    ''' Action OnClick Preview button
    ''' </summary>
    Private Sub btnPreview_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPreview.Click
        tsslText.Text = "Working..."
        StatusStrip1.Refresh()
        nbFile = 0
        nbRename = 0
        PopulateFileList()
        If lvPreview.Items.Count > 0 Then PrepareRename()
        tsslText.Text = nbFile.ToString & " File(s), " & nbRename.ToString & " Rename(s)"
    End Sub

    ''' <summary>
    ''' Action onClick Rename button
    ''' </summary>
    Private Sub btnRename_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnRename.Click
        tsslText.Text = "Working..."
        StatusStrip1.Refresh()
        If lvPreview.Items.Count = 0 Then PrepareRename()
        If lvPreview.Items.Count > 0 Then DoRename()
    End Sub

    ''' <summary>
    ''' Clears file list
    ''' </summary>
    Private Sub ClearPreview()
        lvPreview.Items.Clear()
        lvPreview.ListViewItemSorter = Nothing
    End Sub

    ''' <summary>
    ''' Fills file list with a list of files found.  Process like filter.
    ''' </summary>
    Sub PopulateFileList()
        ClearPreview()
        If Not My.Computer.FileSystem.DirectoryExists(txtFolder.Text) Then
            MsgBox("Invalid or inaccessible folder.", MsgBoxStyle.Exclamation)
            Exit Sub
        End If
        Analyze(txtFolder.Text, "")
        lvPreview.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)
    End Sub

    ''' <summary>
    ''' Analyzes recursively files from filesystem
    ''' </summary>
    Private Sub Analyze(ByVal sRootPath As String, ByVal sFolder As String)
        Dim s As String = sRootPath
        If sFolder <> "" Then
            If vb.Right(s, 1) <> "\" Then s = s & "\"
            s = s & sFolder
            sFolder = sFolder & "\"
        End If

        For Each sFile As String In My.Computer.FileSystem.GetFiles(s)
            Dim sBaseName As String = System.IO.Path.GetFileName(sFile)
            If txtLike.Text = "" OrElse sBaseName Like txtLike.Text Then
                lvPreview.Items.Add(sFolder & sBaseName)
                nbFile += 1
            End If
        Next

        If chkIncludeSubfolders.Checked Then
            For Each sSubFolder As String In My.Computer.FileSystem.GetDirectories(s)
                Analyze(sRootPath, sFolder & System.IO.Path.GetFileName(sSubFolder))
            Next
        End If
    End Sub

    ''' <summary>
    ''' Prepare rename operation filling the grid with old and new filenames.
    ''' Also detects some error situations
    ''' </summary>
    Sub PrepareRename()
        ' Rename for cloro

        'If txtSearch.Text = "" Then
        '    MsgBox("No search expression provided.", MsgBoxStyle.Exclamation)
        '    Exit Sub
        'End If

        Dim re As Regex = Nothing
        'If optRegEx.Checked Then
        '    Try
        '        re = New Regex(txtSearch.Text, IIf(chkCaseSignificant.Checked, 0, RegexOptions.IgnoreCase))
        '    Catch ex As Exception
        '        MsgBox("Error compiling regular expression." & vbCrLf & ex.Message, MsgBoxStyle.Exclamation)
        '        Exit Sub
        '    End Try
        'End If

        re = New Regex("^([^ ]* - )[^ ]*( - [^ ]* - [^-]*)", RegexOptions.IgnoreCase)

        ToolStripProgressBar1.Minimum = 0
        ToolStripProgressBar1.Maximum = lvPreview.Items.Count
        ToolStripProgressBar1.Value = 0
        ToolStripProgressBar1.Visible = True
        StatusStrip1.Refresh()

        Dim sOldCap1 As String = ""
        Dim iCount As Integer = 0

        Dim sTextReplace As String
        For Each lvi As ListViewItem In lvPreview.Items
            ToolStripProgressBar1.Value = ToolStripProgressBar1.Value + 1

            Dim sBaseName As String = lvi.Text
            Dim sNewName As String = sBaseName
            'If optStringReplace.Checked Then
            '    ' Simple text search
            '    Dim p, p1 As Integer
            '    p1 = 1
            '    Do
            '        p = InStr(p1, sNewName, txtSearch.Text, IIf(chkCaseSignificant.Checked, CompareMethod.Binary, CompareMethod.Text))
            '        If p <= 0 Then Exit Do
            '        sTextReplace = sGetReplacement(Mid(sNewName, p, Len(txtSearch.Text)), txtReplace.Text)
            '        sNewName = Microsoft.VisualBasic.Left(sNewName, p - 1) & sTextReplace & Mid(sNewName, p + Len(txtSearch.Text))
            '        p1 = p + Len(sTextReplace) ' - Len(txtSearch.Text)  No looping replacement
            '    Loop
            'Else
            ' Regular expression search
            Dim mac As MatchCollection
            mac = re.Matches(sBaseName)
            'For i As Integer = mac.Count - 1 To 0 Step -1
            If mac.Count = 0 Then
                MsgBox("Fichier malformé: " & sBaseName, MsgBoxStyle.Exclamation)
                sNewName = sBaseName
            Else
                Dim ma As Match = mac(0)
                'sTextReplace = sGetReplacement(ma.Value, txtReplace.Text)
                'sNewName = Microsoft.VisualBasic.Left(sNewName, ma.Index) & sTextReplace & Mid(sNewName, ma.Index + 1 + ma.Length)
                If ma.Groups(1).Captures(0).ToString = sOldCap1 Then
                    iCount = iCount + 1
                Else
                    sOldCap1 = ma.Groups(1).Captures(0).ToString
                    iCount = 1001
                End If
                sNewName = ma.Groups(1).Captures(0).ToString & String.Format("{0}", iCount).Substring(1, 3) + ma.Groups(2).Captures(0).ToString & ".jpg"
                'Next
            End If

            Dim sAction As String
            If StrComp(sBaseName, sNewName, CompareMethod.Binary) = 0 Then
                sAction = "(nothing)"
            Else
                sAction = "Rename"
                For j As Integer = 0 To lvi.Index - 1
                    If lvPreview.Items(j).SubItems(2).Text = sNewName Then
                        sAction = "No Rename (name conflict with other renamed file)"
                        Exit For
                    End If
                Next
                If My.Computer.FileSystem.DirectoryExists(txtFolder.Text & "\" & sNewName) Then
                    sAction = "No rename (name conflict with an existing directory)"
                End If
                If sNewName = "" Then
                    sAction = "No Rename (empty new name)"
                End If
            End If

            lvi.SubItems.Add(New ListViewItem.ListViewSubItem(lvi, sAction))
            lvi.SubItems.Add(New ListViewItem.ListViewSubItem(lvi, sNewName))
            If sAction = "Rename" Then
                lvi.Checked = True
                nbRename += 1
            End If
        Next

        lvPreview.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)
        ToolStripProgressBar1.Visible = False
    End Sub

    ''' <summary>
    ''' Actually rename files
    ''' </summary>
    Sub DoRename()
        Dim nbRename As Integer = 0
        Dim nbFail As Integer = 0

        ToolStripProgressBar1.Minimum = 0
        ToolStripProgressBar1.Maximum = lvPreview.Items.Count
        ToolStripProgressBar1.Value = 0
        ToolStripProgressBar1.Visible = True

        For Each lvi As ListViewItem In lvPreview.Items
            ToolStripProgressBar1.Value = ToolStripProgressBar1.Value + 1

            If lvi.Checked Then
                Dim sOldName As String = lvi.Text
                Dim sNewName As String = lvi.SubItems(2).Text

                If sNewName <> "" Then
                    Debug.Print("Rename <" & sOldName & "> to <" & sNewName & ">")

                    Try
                        'VB version complains when new name differs only by case from old name...
                        'My.Computer.FileSystem.RenameFile(txtFolder.Text & "\" & sOldName, sNewName)
                        System.IO.File.Move(txtFolder.Text & "\" & sOldName, txtFolder.Text & "\" & sNewName)
                        nbRename += 1
                    Catch ex As Exception
                        nbFail += 1
                        MsgBox("Error while renaming <" & sOldName & "> to <" & sNewName & ">" & vbCrLf & ex.Message, MsgBoxStyle.Exclamation)
                    End Try
                End If
            End If
        Next

        If nbFail = 0 Then
            If nbRename = 0 Then
                MsgBox("Nothing renamed.", MsgBoxStyle.Information)
            Else
                MsgBox(nbRename.ToString & " file(s) renamed.", MsgBoxStyle.Information)
            End If
        Else
            MsgBox(nbRename.ToString & " file(s) renamed." & vbCrLf & nbFail.ToString & " file(s) not renamed due to error(s).", MsgBoxStyle.Information)
        End If

        ToolStripProgressBar1.Visible = False
        tsslText.Text = nbRename.ToString & " file(s) renamed."
    End Sub

    ''' <summary>
    ''' Processes special characters in replacement expression to return the final replacement string
    ''' </summary>
    ''' <param name="sFound">Exact text found (not search expression)</param>
    ''' <param name="sReplaceExpression">Replace expression</param>
    ''' <returns>String to be substituted</returns>
    ''' <remarks>
    ''' ^^ = ^
    ''' ^&amp; = Searched text
    ''' ^u = Searched textm, Uppercase
    ''' ^l = Seached text, Lowercase
    ''' </remarks>
    Function sGetReplacement(ByVal sFound As String, ByVal sReplaceExpression As String)
        sReplaceExpression = Replace(sReplaceExpression, "^^", "^")
        sReplaceExpression = Replace(sReplaceExpression, "^&", sFound)
        sReplaceExpression = Replace(sReplaceExpression, "^u", UCase(sFound))
        sReplaceExpression = Replace(sReplaceExpression, "^l", LCase(sFound))
        Return sReplaceExpression
    End Function

    ''' <summary>
    ''' Action OnClick of header column - Change sort order
    ''' </summary>
    Private Sub lvPreview_ColumnClick(ByVal sender As Object, ByVal e As System.Windows.Forms.ColumnClickEventArgs) Handles lvPreview.ColumnClick
        Static iCurCol As Integer
        Static iOrder As Integer

        If lvPreview.ListViewItemSorter Is Nothing OrElse iCurCol <> e.Column Then
            iCurCol = e.Column
            iOrder = 1
        Else
            iOrder = -iOrder
        End If
        lvPreview.ListViewItemSorter = New ListViewItemComparer(e.Column, iOrder)
    End Sub

End Class


''' <summary>
''' Implements ListView column sorting
''' </summary>
Class ListViewItemComparer
    Implements IComparer

    Private col, ord As Integer

    Public Sub New()
        col = 0
    End Sub

    Public Sub New(ByVal column As Integer, ByVal order As Integer)
        col = column
        ord = order
    End Sub

    Public Function Compare(ByVal x As Object, ByVal y As Object) As Integer _
       Implements IComparer.Compare
        Return [String].Compare(CType(x, ListViewItem).SubItems(col).Text, CType(y, ListViewItem).SubItems(col).Text) * ord
    End Function
End Class
