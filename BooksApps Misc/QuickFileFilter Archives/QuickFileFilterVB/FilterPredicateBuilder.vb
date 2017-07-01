' QuickFileFilter, FilterPredicateBuilder class
' Helper class to build a specific Predicate<object> to filter a List depending on a list of searched words and search options
'
' 2016-12-13    PV  v2.1 Full rewrite in a separate, clean class
' 2017-01-01    PV  v2.5.1 Exclusion of search words starting with -; move filter parsing from VM to here
' 2017-01-04    PV  v3, Visual Basic


Imports System.Globalization
Imports System.Text
Imports System.Text.RegularExpressions

Class FilterPredicateBuilder
    Private words As List(Of String)
    Private isAS As Boolean, isCS As Boolean, isRE As Boolean, isWW As Boolean

    Public Sub New(filter As String, isAS As Boolean, isCS As Boolean, isRE As Boolean, isWW As Boolean)
        ' Split query in separate words
        words = New List(Of String)()
        If isRE Then
            ' In Regex mode, the whole filter is considered as a single word, including spaces,
            ' and possible leading - (not part of Regex)
            Try
                Dim reTest As New Regex(filter)
                words.Add(filter)
            Catch generatedExceptionName As Exception
            End Try
        Else
            Dim wordsList As List(Of String) = ParseQuery(filter)

            ' Preprocess list of words, remove accents for case-insensitive searches and transform
            ' words in regular expressions for whole word searches
            For Each oneWord As String In wordsList
                Dim word As String = If(isAS, oneWord, RemoveDiacritics(oneWord))

                ' Special processing for WholeWords mode, transform each word in a Regex
                If isWW Then
                    If word = "-" Then
                        Continue For
                    End If

                    ' But a leading - is not part of the word but an indicator for search exclusion,
                    ' and remains ahead of the Regex so it can later be processed correctly by GetFilter
                    If word.StartsWith("-") Then
                        word = "-" + "\b" + Regex.Escape(word.Substring(1)) + "\b"
                    Else
                        word = "\b" + Regex.Escape(word) + "\b"
                    End If
                End If
                words.Add(word)
            Next
        End If

        ' Memorize options
        Me.isAS = isAS      ' Accent Sensitive
        Me.isCS = isCS      ' Case Sensitive
        Me.isRE = isRE      ' Regular Expression
        Me.isWW = isWW      ' Whole Word
    End Sub


    ' Helper that breaks white-separated words in a List<string>, but words "between quotes" are considered a single
    ' word even if they include spaces
    Private Shared Function ParseQuery(s As String) As List(Of String)
        Dim wordsList = New List(Of String)()
        Dim word = New StringBuilder()
        Dim inQuote As Boolean = False

        Dim AppendWordToList As Action = Sub()
                                             If word.Length > 0 Then
                                                 wordsList.Add(word.ToString())
                                                 word = New StringBuilder()
                                             End If
                                         End Sub

        For Each c As Char In s
            If inQuote Then
                If c = """"c Then
                    inQuote = False
                    AppendWordToList()
                Else
                    word.Append(c)
                End If
            Else
                If c = """"c Then
                    inQuote = True
                    AppendWordToList()
                ElseIf c = " "c Then
                    AppendWordToList()
                Else
                    word.Append(c)
                End If
            End If
        Next
        AppendWordToList()

        Return wordsList
    End Function


    ' Helper for Accent Insensitive comparisons, remove accents from a string
    Private Function RemoveDiacritics(text As String) As String
        ' Optimization, 1st pass just to check if there is at least 1 accent
        Dim denorm As String = text.Normalize(NormalizationForm.FormD)
        Dim accentFound As Boolean = False
        For Each ch As Char In denorm
            If CharUnicodeInfo.GetUnicodeCategory(ch) <> UnicodeCategory.NonSpacingMark Then
                accentFound = True
                Exit For
            End If
        Next
        If Not accentFound Then
            Return text
        End If

        Dim sb As New StringBuilder()
        For Each ch As Char In denorm
            If CharUnicodeInfo.GetUnicodeCategory(ch) <> UnicodeCategory.NonSpacingMark Then
                sb.Append(ch)
            Else
                accentFound = True
            End If
        Next
        Return sb.ToString().Normalize(NormalizationForm.FormC)
    End Function


    Public Function GetFilter(searched As Object) As Boolean
        Dim invertFlag As Boolean
        Dim word As String

        For Each aWord As String In words
            If aWord.StartsWith("-") Then
                word = aWord.Substring(1)
                invertFlag = True
                If word.Length = 0 Then
                    Continue For
                End If
            Else
                word = aWord
                invertFlag = False
            End If

            If isRE OrElse isWW Then
                Try
                    If isAS Then
                        If invertFlag Xor Not Regex.IsMatch(DirectCast(searched, FileNameAndSize).Name, word, If(isCS, 0, RegexOptions.IgnoreCase)) Then
                            Return False
                        End If
                    Else
                        If invertFlag Xor Not Regex.IsMatch(RemoveDiacritics(DirectCast(searched, FileNameAndSize).Name), word, If(isCS, 0, RegexOptions.IgnoreCase)) Then
                            Return False
                        End If
                    End If
                Catch generatedExceptionName As Exception
                    Return True
                End Try
            Else
                If isAS Then
                    If invertFlag Xor DirectCast(searched, FileNameAndSize).Name.IndexOf(word, If(isCS, StringComparison.CurrentCulture, StringComparison.InvariantCultureIgnoreCase)) < 0 Then
                        Return False
                    End If
                Else
                    If invertFlag Xor RemoveDiacritics(DirectCast(searched, FileNameAndSize).Name).IndexOf(word, If(isCS, StringComparison.CurrentCulture, StringComparison.InvariantCultureIgnoreCase)) < 0 Then
                        Return False
                    End If
                End If
            End If
        Next
        Return True
    End Function
End Class
