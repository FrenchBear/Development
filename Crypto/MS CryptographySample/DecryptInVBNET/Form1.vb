Imports System.IO
Imports System.Security.Cryptography
Imports System.Text
Public Class Form1
    Inherits System.Windows.Forms.Form
    '
    Private Const CSPNAME As String = "Microsoft Base Cryptographic Provider v1.0"
    Private Const PASSWORD As String = "hitesh"
    Private strFileName As String
    Private strDecryptFileName As String
    '
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
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox2 As System.Windows.Forms.TextBox
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents Button2 As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.TextBox1 = New System.Windows.Forms.TextBox
        Me.TextBox2 = New System.Windows.Forms.TextBox
        Me.Button1 = New System.Windows.Forms.Button
        Me.Button2 = New System.Windows.Forms.Button
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.SuspendLayout()
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(8, 40)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(272, 20)
        Me.TextBox1.TabIndex = 0
        Me.TextBox1.Text = ""
        '
        'TextBox2
        '
        Me.TextBox2.BackColor = System.Drawing.Color.PaleTurquoise
        Me.TextBox2.Location = New System.Drawing.Point(8, 104)
        Me.TextBox2.Name = "TextBox2"
        Me.TextBox2.ReadOnly = True
        Me.TextBox2.Size = New System.Drawing.Size(272, 20)
        Me.TextBox2.TabIndex = 1
        Me.TextBox2.Text = ""
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(120, 136)
        Me.Button1.Name = "Button1"
        Me.Button1.TabIndex = 2
        Me.Button1.Text = "&Decrypt"
        '
        'Button2
        '
        Me.Button2.Location = New System.Drawing.Point(208, 136)
        Me.Button2.Name = "Button2"
        Me.Button2.TabIndex = 3
        Me.Button2.Text = "&Exit"
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(16, 8)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(272, 20)
        Me.Label1.TabIndex = 4
        Me.Label1.Text = "Enter full path\filename for a file to  decrypt"
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(16, 72)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(448, 20)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "Name and location of decrypted file"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 166)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.Button2)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.TextBox2)
        Me.Controls.Add(Me.TextBox1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim lngFileSize As Integer
        Dim hFile As Short
        Dim strText As String
        
        Dim arData() As Byte
        '
        '---------read the file and initialize the encryptedmessage byte array---------------
        '
        hFile = FreeFile()
        lngFileSize = FileLen(strFileName)
        Erase arData
        ReDim arData(lngFileSize - 1)
        '
        '---- Load the byte array with the file contents from the encrypted file using--------
        '---------------------- one command then close the file.------------------------------
        '
        Try
            FileOpen(hFile, strFileName, OpenMode.Binary, OpenAccess.Read)
            FileGet(hFile, arData)
            FileClose(hFile)
        Catch
            FileClose(hFile)
            MsgBox("Error occured while decrypting the file")
            Exit Sub
        End Try
        '
        '----------------------------Decryption code starts-----------------------------------
        '
        Try
            Dim cspParams As CspParameters = New CspParameters(1, CSPNAME)
            Dim deriveBytes As PasswordDeriveBytes = New PasswordDeriveBytes(PASSWORD, Nothing, "SHA-1", 1, cspParams)
            Dim rgbIV(7) As Byte
            Dim key() As Byte = deriveBytes.CryptDeriveKey("RC2", "SHA1", 0, rgbIV)
            Dim provider As RC2CryptoServiceProvider = New RC2CryptoServiceProvider
            '
            provider.Key = key
            provider.IV = rgbIV
            '
            Dim transform As ICryptoTransform = provider.CreateDecryptor()
            '
            Dim decyptedBlob() As Byte = transform.TransformFinalBlock(arData, 0, arData.Length - 1)
            '
            Dim SWr As StreamWriter
            '
            Try
                SWr = New StreamWriter(strDecryptFileName)
                SWr.WriteLine(Encoding.ASCII.GetString(decyptedBlob))
                SWr.Close()
            Catch
                SWr.Close()
                MsgBox("Error occured while decrypting the file")
                Exit Sub
            End Try
            '
        Catch
            MsgBox("Error occured while decrypting the file")
            Exit Sub
        End Try
        '
        MsgBox("Successfully decrypted the file!")
        '
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        End
    End Sub

    Private Sub TextBox1_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles TextBox1.LostFocus
        strFileName = TextBox1.Text
        strDecryptFileName = Mid(strFileName, 1, InStr(strFileName, ".")) & "dec"
        TextBox2.Text = strDecryptFileName
    End Sub
End Class
