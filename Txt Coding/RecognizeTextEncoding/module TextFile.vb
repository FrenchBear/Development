' module TextFile
' Takes care of clean text file reading, guessing format
' 2011-04-30 FPVI   #45921

Imports System.IO
Imports System.Text

Module module_TextFile

    Public Enum VTextEncoding
        UTF8_With_BOM
        UTF16LE_With_BOM
        UTF16BE_With_BOM
        UTF8_Without_BOM
        UTF16LE_Without_BOM
        UTF16BE_Without_BOM
        ANSI
    End Enum

    Public Function ReadTextFile(ByVal sFilename As String, ByRef encoding As VTextEncoding) As String
        ' Read up to 4 bytes
        Dim tbHead As Byte() = New Byte() {0, 0, 0, 0}
        Using fs As FileStream = File.OpenRead(sFilename)
            fs.Read(tbHead, 0, If(fs.Length > 4, 4, fs.Length))

            ' Start reading position (after skipping BOM)
            Dim start As Integer = 0

            FindEncoding(tbHead, encoding, start)
            fs.Seek(start, SeekOrigin.Begin)

            Dim ee As System.Text.Encoding = System.Text.Encoding.Default
            Select Case encoding
                Case VTextEncoding.UTF8_With_BOM, VTextEncoding.UTF8_Without_BOM : ee = System.Text.Encoding.UTF8
                Case VTextEncoding.UTF16BE_With_BOM, VTextEncoding.UTF16BE_Without_BOM : ee = System.Text.Encoding.BigEndianUnicode
                Case VTextEncoding.UTF16LE_With_BOM, VTextEncoding.UTF16LE_Without_BOM : ee = System.Text.Encoding.Unicode
            End Select
            Dim ts As New StreamReader(fs, ee, True)
            Return ts.ReadToEnd
        End Using
    End Function

    Private Sub FindEncoding(ByVal tbHead As Byte(), ByRef encoding As VTextEncoding, ByRef start As Integer)
        ' First recognize most common BOMs
        If tbHead(0) = &HFF AndAlso tbHead(1) = &HFE AndAlso (tbHead(2) <> 0 Or tbHead(3) <> 0) Then
            encoding = VTextEncoding.UTF16LE_With_BOM
            start = 2
            Exit Sub
        End If

        If tbHead(0) = &HFE AndAlso tbHead(1) = &HFF AndAlso (tbHead(2) <> 0 Or tbHead(3) <> 0) Then
            encoding = VTextEncoding.UTF16BE_With_BOM
            start = 2
            Exit Sub
        End If

        If tbHead(0) = &HEF AndAlso tbHead(1) = &HBB AndAlso tbHead(2) = &HBF Then
            encoding = VTextEncoding.UTF8_With_BOM
            start = 3
            Exit Sub
        End If

        ' Then XML declarations, just a < at the beginning of the file
        If tbHead(0) = &H3C And tbHead(1) = 0 Then
            encoding = VTextEncoding.UTF16LE_Without_BOM
            start = 0
            Exit Sub
        End If

        If tbHead(0) = 0 And tbHead(1) = &H3C Then
            encoding = VTextEncoding.UTF16BE_Without_BOM
            start = 0
            Exit Sub
        End If

        If tbHead(0) = &H3C And tbHead(1) <> 0 Then
            encoding = VTextEncoding.UTF8_Without_BOM
            start = 0
            Exit Sub
        End If


        ' Then by default (we don't try to recognize UTF8 with no BOM and no XML decl)
        encoding = VTextEncoding.ANSI
        start = 0
    End Sub

    Public Sub WriteTextFile(ByVal sFilename As String, ByVal sText As String, ByVal VEncoding As VTextEncoding)
        Dim enc As Encoding = System.Text.Encoding.Default
        Select Case VEncoding
            Case VTextEncoding.UTF8_With_BOM
                enc = New UTF8Encoding(True)
            Case VTextEncoding.UTF8_Without_BOM
                enc = New UTF8Encoding(False)
            Case VTextEncoding.UTF16BE_With_BOM
                enc = New UnicodeEncoding(True, True)
            Case VTextEncoding.UTF16BE_Without_BOM
                enc = New UnicodeEncoding(True, False)
            Case VTextEncoding.UTF16LE_With_BOM
                enc = New UnicodeEncoding(False, True)
            Case VTextEncoding.UTF16LE_Without_BOM
                enc = New UnicodeEncoding(False, False)
        End Select

        Using sw = New StreamWriter(sFilename, False, enc)
            sw.Write(sText)
        End Using

    End Sub
End Module
