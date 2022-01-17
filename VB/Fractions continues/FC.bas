Attribute VB_Name = "FractionContinue"
Option Explicit


Public Sub TestFC(ByVal v0 As Double)
    Dim v As Double
    Dim cd(10) As Long, nd As Integer

    v = v0
    cd(0) = Int(v)
    v = v - Int(v)
    nd = 0
    Do Until Abs(v) < 0.000001 Or nd = 10
        v = 1 / v
        nd = nd + 1
        cd(nd) = Int(v)
        v = v - Int(v)
    Loop

    Debug.Print
    Debug.Print "v =";
    Dim i As Integer
    For i = 0 To nd
        If i = 1 Then
            Debug.Print "[";
        ElseIf i > 1 Then
            Debug.Print ",";
        End If
        Debug.Print cd(i);
    Next
    Debug.Print "] ="; v0

    Dim vt As Double
    For i = nd To 0 Step -1
        If i <> nd Then vt = 1 / vt
        vt = vt + cd(i)
    Next

    Dim ft As New Fraction, j As Integer
    For j = 0 To nd
        ft.Définit 0, 1
        For i = j To 0 Step -1
            If i <> j Then ft.Inverse
            Dim g As New Fraction
            g.Définit cd(i), 1
            ft.Ajoute g
        Next
        ft.Affiche
    Next

End Sub


' Algo d'Euclide classique
Public Function PGCD(ByVal n1 As Long, ByVal n2 As Long) As Long
    Do
        If n1 < n2 Then
            Dim t As Long
            t = n1
            n1 = n2
            n2 = t
        End If

        ' Cas des fractions 0/x
        If n2 = 0 Then
            PGCD = 1
            Exit Function
        End If

        Dim m As Long
        m = n1 Mod n2
        If m = 0 Then
            PGCD = n2
            Exit Function
        End If
        n1 = m
    Loop
End Function


