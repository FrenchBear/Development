VERSION 5.00
Begin VB.Form frmSlowSendString 
   Caption         =   "Form1"
   ClientHeight    =   3495
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   7500
   LinkTopic       =   "Form1"
   ScaleHeight     =   3495
   ScaleWidth      =   7500
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton SendCommand 
      Caption         =   "Send"
      Height          =   435
      Left            =   600
      TabIndex        =   0
      Top             =   360
      Width           =   915
   End
End
Attribute VB_Name = "frmSlowSendString"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Pilote le site Geneanet.org pour capturer les pages des sosa<2028
' Une session Geneanet authentifiée doit être ouuverte
' Le pilote d'impression par défaut doit être "microsoft print to PDF" dans le dossier Pages
'
' 2022-07-20    PV

Option Explicit

Const url As String = "https://gw.geneanet.org/pviolent_w?iz=2&lang=fr&m=S&n={sosa}&p="
Const folder As String = "C:\Généalogie\Pages"

Dim fso As New FileSystemObject

Private Sub SendCommand_Click()
    SendCommand.Enabled = False
    Wait 4
    
    Dim col As New Collection
    col.Add 1
    'col.Add 1018
    SendCommand.Enabled = False
    While col.Count > 0
        Dim s1 As Long
        s1 = col(1)
        Debug.Print s1
        DoEvents
        col.Remove 1
        Dim tf As folder
        Set tf = fso.GetFolder(folder)
        Dim ff As Variant, expectedStart As String, existing As String
        expectedStart = CStr(s1) & " - "
        existing = ""
        For Each ff In tf.Files
            If Left(ff.name, Len(expectedStart)) = expectedStart Then
                existing = Replace(ff.name, ".pdf", "")
                Exit For
            End If
        Next
        Dim name As String
        If existing <> "" Then
            Dim ts
            ts = Split(existing, " - ")
            name = ts(1)
        Else
            name = PrintSosa(s1)
        End If
        If name <> "Inexistant" And Left(name, 1) <> "=" And s1 < 1024 Then
            col.Add 2 * s1
            col.Add 2 * s1 + 1
        End If
Continue:
    Wend
    Debug.Print "Done."
    SendCommand.Enabled = True
End Sub
 
Private Function PrintSosa(ByVal sosa As Long) As String
    Dim s As String, i As Integer
    s = EscapeTextForSendKeys(Replace(url, "{sosa}", CStr(sosa)))
    Debug.Print s
    DoEvents

    MySendKeys "^l", True
    MySendKeys "^a", True
    MySendKeys s & "~", True
    Wait 2

    Clipboard.Clear
    MySendKeys "^a", True
    Wait 0.3
    MySendKeys "^c", True
    Wait 0.3
    
    Dim l As Variant, expectedEnd As String, name As String
    Dim reAlt As New RegExp
    reAlt.Pattern = " Sosa : ([0-9]+)$"
    expectedEnd = " Sosa : " & CStr(sosa)
    name = ""
    For Each l In Split(Clipboard.GetText, vbCrLf)
        l = Replace(l, ChrW(&HA0), "")
        'Debug.Print "«" & l & "»"
        If Right(l, Len(expectedEnd)) = expectedEnd Then
            name = Trim(Left(l, Len(l) - Len(expectedEnd)))
            Exit For
        End If
        Dim ma As MatchCollection
        Set ma = reAlt.Execute(l)
        If ma.Count > 0 Then
            If Trim(Left(l, Len(l) - Len(ma.Item(0)))) = "? ?" Then
                name = ""
            Else
                name = "=" & Replace(Replace(ma.Item(0), " ", ""), "Sosa:", "") & " - " & Trim(Left(l, Len(l) - Len(ma.Item(0))))
            End If
        End If
    Next
    If name = "" Then
        name = "Inexistant"
    Else
        name = Replace(name, "?", "X")
    End If
    MySendKeys "^p", True
    Wait 2
    MySendKeys "~", True
    Wait 2
    MySendKeys EscapeTextForSendKeys(CStr(sosa) & " - " & name), True
    Wait 1.5
    MySendKeys "%s", True
    Wait 0.5
    MySendKeys "{Enter}", True
    Wait 4
    MySendKeys "{Esc}", True
    Wait 1
    PrintSosa = name
End Function

Function EscapeTextForSendKeys(ByVal s As String) As String
    Dim special As String
    special = "+^%~()"
    Dim i As Integer
    For i = 1 To Len(special)
        s = Replace(s, Mid(special, i, 1), "{" & Mid(special, i, 1) & "}")
    Next
    EscapeTextForSendKeys = s
End Function

Sub Wait(ByVal d As Double)
    Dim t
    t = Timer
    Do
        DoEvents
    Loop Until Timer - t > d
End Sub
