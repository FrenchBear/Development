Attribute VB_Name = "modStatus"
Option Explicit

Declare Function BitBlt Lib "GDI" (ByVal hDestDC As Integer, ByVal X As Integer, ByVal Y As Integer, ByVal nWidth As Integer, ByVal nHeight As Integer, ByVal hSrcDC As Integer, ByVal XSrc As Integer, ByVal YSrc As Integer, ByVal dwRop As Long) As Integer

Dim Position As Variant

Global fArretProgression As Integer

Sub HideStatus()

    Unload StatusDlg

End Sub

Sub ShowStatusDialog(ByVal title As String, ByVal TotalCount As Single, ByVal fShowBtnAnnuler As Integer)

Dim cr As Integer

    Load StatusDlg
    Position = 0
    StatusDlg.Caption = title
    StatusDlg.total.Tag = Format$(TotalCount)
    StatusDlg.Label1.Caption = ""
    StatusDlg.Label2.Caption = ""
    StatusDlg.btnAnnuler.Visible = fShowBtnAnnuler
    CenterInScreen StatusDlg
    StatusDlg.Top = 2 * (Screen.Height - StatusDlg.Height) / 3
    StatusDlg.Show
    cr = setwindowpos(StatusDlg.hWnd, -1, 0, 0, 0, 0, &H1 Or &H2)
    StatusDlg.MousePointer = 11
    DoEvents

End Sub

Sub UpdateStatus(ByVal Count As Single)

Const SRCCOPY = &HCC0020
Dim TotalCount As Single
Dim chPourcent As String
Dim cr As Integer

    TotalCount = Val(StatusDlg.total.Tag)
    If TotalCount = 0 Then
        TotalCount = 100000
    End If

    Position = CSng((Count / TotalCount) * 100)
    If Position > 100 Then
        Position = 100
    End If
    StatusDlg.Picture2.Cls
    StatusDlg.Picture2.Line (0, 0)-((Position * (StatusDlg.Picture2.ScaleWidth / 100)), StatusDlg.Picture2.ScaleHeight), QBColor(QBCOLOR_ROUGE_CLAIR), BF

    chPourcent = Format$(CLng(Position)) + "%"
    StatusDlg.Picture2.CurrentX = (StatusDlg.Picture2.ScaleWidth - StatusDlg.Picture2.TextWidth(chPourcent)) \ 2
    StatusDlg.Picture2.CurrentY = (StatusDlg.Picture2.ScaleHeight - StatusDlg.Picture2.TextHeight(chPourcent)) \ 2
    StatusDlg.Picture2.Print chPourcent

    cr = BitBlt(StatusDlg.Picture1.hDC, 0, 0, StatusDlg.Picture2.ScaleWidth, StatusDlg.Picture2.ScaleHeight, StatusDlg.Picture2.hDC, 0, 0, SRCCOPY)

End Sub

