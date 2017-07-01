' ZipBD
' Utilitaire de compression d'un groupe de répertoires
' 2014-04-28    PV  Première version
' 2014-01-01    PV  Choix du répertoire avec un InputBox et option d'exécution à la fin
' 2014-05-04    PV  Effacement de l'attribut lecture seule et exécution systématique

Module Module1

    Sub Main()
        Dim path As String = ""
        Do
            path = InputBox("Enter root folder path?", , path)
            If path = "" Then End
            If IO.Directory.Exists(path) Then Exit Do
            MsgBox("Invalid/inexistent path", MsgBoxStyle.Exclamation)
        Loop

        Dim l As Integer = 0
        Using sw As New IO.StreamWriter("c:\temp\f1.bat", False, Text.Encoding.GetEncoding(850))
            sw.WriteLine("attrib -R """ & path & "\*.*"" /S")
            For Each s As String In IO.Directory.GetDirectories(path)
                sw.WriteLine("WinZip64 -a ""{0}.zip"" ""{0}""", s)
                l += 1
            Next
        End Using

        'Dim iRep As MsgBoxResult = MsgBox("File c:\temp\f1.bat generated with " & l.ToString & " folder(s) to compress." & vbCrLf & "Execute it now?", MsgBoxStyle.Question + vbYesNo)
        'If iRep = MsgBoxResult.Yes Then
        Process.Start("c:\temp\f1.bat")
        'End If
    End Sub

End Module
