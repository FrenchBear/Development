' RecognizeTextEncoding
' Test for module TextFile.vb
' 2011-05-01 FPVI

Imports System.IO

Module Module1

    Sub Main()
        For Each sFilename As String In My.Computer.FileSystem.GetFiles("C:\Development\Txt Coding", FileIO.SearchOption.SearchTopLevelOnly, New String() {"*.txt"})
            Dim encoding As VTextEncoding = 0
            Dim s As String
            s = ReadTextFile(sFilename, encoding)
            Dim sBase As String = Path.GetFileName(sFilename)
            Console.WriteLine(sBase & ": " & encoding.ToString)
            Console.WriteLine(FirstLine(s))

            WriteTextFile("c:\temp\" & sBase, s, encoding)
        Next
        Console.WriteLine()
        Console.Write("(Pause)")
        Console.ReadLine()
    End Sub

    Function FirstLine(ByVal s As String)
        For i As Integer = 1 To Len(s)
            If Mid(s, i, 1) = Chr(13) Or Mid(s, i, 1) = Chr(10) Then
                Return Left(s, i - 1)
            End If
        Next
        Return s
    End Function

End Module
