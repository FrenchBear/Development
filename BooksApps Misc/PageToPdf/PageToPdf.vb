' PageToPdf
' Assemble des pages de PDF dans un fichier unique
' 2014-05-07    PV  Première version
' 2015-06-28    PV  Détection de noms de dossiers non normalisés
' 2015-07-16    PV  Détection de noms de fichiers non normalisés; Caractère & dans le nom de fichier PDF
' 2015-07-22    PV  Renormalise les noms de dossiers au lieu d'affichier un message et de terminer
' 2015-07-23    PV  Renormalise les noms de fichiers


Imports System.IO
Imports System.Console


Module PageToPdf

    Sub Main()
        Dim path As String
        path = "C:\Temp\BD_A_Convertir"

        WriteLine($"PageToPdf {path}" & vbCrLf)

        Dim l As Integer = 0
        Using sw As New IO.StreamWriter("c:\temp\f1.bat", False, Text.Encoding.GetEncoding(850))
            sw.WriteLine("C:")
            For Each s As String In IO.Directory.GetDirectories(path, "*.*", IO.SearchOption.AllDirectories)
                Dim sFolder As String

                If Not s.IsNormalized() Then
                    WriteLine("Non-normalized folder name " & s & " --> Renormalize")
                    Dim sRenormalized = s.Normalize()
                    Directory.Move(s, sRenormalized)
                    sFolder = sRenormalized
                Else
                    sFolder = s
                End If

                If InStr(IO.Path.GetFileName(sFolder), "&") > 0 Then
                    MsgBox("Character & in folder name " & sFolder, vbCritical)
                    End
                End If

                WriteLine(sFolder)

                Dim files() As String = IO.Directory.GetFiles(sFolder, "*.pdf")
                If files.Count > 0 Then
                    For Each f As String In files
                        If Not f.IsNormalized() Then
                            WriteLine("Non-normalized file name " & f & " --> Renormalize")
                            Dim sRenormalized = f.Normalize()
                            File.Move(f, sRenormalized)
                        End If
                    Next

                    sw.WriteLine("cd " & sFolder)
                    sw.WriteLine("pdftk *.pdf output ""..\" & IO.Path.GetFileName(sFolder) & ".pdf""")
                    l += 1
                End If
            Next
            sw.WriteLine("cd c:\temp")
        End Using

        Dim iRep As MsgBoxResult = MsgBox("File c:\temp\f1.bat generated with " & l.ToString & " folder(s) to compress." & vbCrLf & "Execute it now?", MsgBoxStyle.Question + vbYesNo)
        If iRep = MsgBoxResult.Yes Then
            Process.Start("c:\temp\f1.bat")
        End If
    End Sub

End Module
