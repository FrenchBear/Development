Attribute VB_Name = "BMLibrary"
' BookMaster General Script Library
' Always loaded in "Global" module before execution of scripts
' 2005/08/12 FPVI       First version with QUA-004 rounding functions

Option Explicit

Dim sLibVersion

Sub LibraryAbout()
    MsgBox "BookMaster General Script Library" & vbCrLf & "Version " & sLibVersion & vbCrLf & vbCrLf & "(c) Eurofins 2005", 64, "BM Library.vbs"
End Sub

Function GetOsVersionNumber()
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Determines OS by reading reg val & comparing to known values
' OS version number returned as number of type double:
'    Windows 95:    1
'    Windows 98:    2
'    Windows ME:    3
'    Windows NT4:   4
'    Windows 2k:    5
'    Windows XP:    5.1
'    Windows 2k3:   5.2
'    Windows >2k3:  >5.2
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  Dim oShell, sOStype, sOSversion
  Set oShell = CreateObject("WScript.Shell")
  On Error Resume Next
  sOStype = oShell.RegRead("HKLM\SYSTEM\CurrentControlSet\Control\ProductOptions\ProductType")
  If Err.Number <> 0 Then
    ' Hex(Err.Number)="80070002"
    ' - Could not find this key, OS must be Win9x
    Err.Clear

    sOStype = oShell.RegRead("HKLM\SOFTWARE\Microsoft\Windows" & "\CurrentVersion\VersionNumber")

    Select Case sOStype
      Case "4.00.950"
        sOSversion = 1   ' Windows 95A
      Case "4.00.1111"
        Dim sSubVersion
        sSubVersion = oShell.RegRead( _
          "HKLM\SOFTWARE\Microsoft\Windows" & _
          "\CurrentVersion\SubVersionNumber")
        Select Case sSubVersion
          Case " B"
            sOSversion = 1   ' Windows 95B
          Case " C"
       sOSversion = 1   ' Windows 95C
          Case Else
            sOSversion = 1   ' Unknown Windows 95
        End Select
      Case "4.03.1214"
        sOSversion = 1   ' Windows 95B
      Case "4.10.1998"
        sOSversion = 2   ' Windows 98
      Case "4.10.2222"
        sOSversion = 2   ' Windows 98SE
      Case "4.90.3000"
        sOSversion = 3   ' Windows Me
      Case Else
        sOSversion = 1   ' Unknown W9x/Me
    End Select
  Else   ' OS is NT based
    sOSversion = oShell.RegRead( _
      "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\CurrentVersion")
    If Err.Number <> 0 Then
      GetOsVersionNumber = "Unknown NTx"
      ' Could not determine NT version
      Exit Function  ' >>>
    End If
  End If

  ' Will only work with en-us locale
  GetOsVersionNumber = CDbl(sOSversion)
End Function


' Customized Barcode Processing
' b is an internal BookMaster object describing data of current page
' iRecNum, sAnalyteTemplateCode is currently selected cell.  If no analyte is selected, iRecNum=-1
' sBarcode is barcode value including type prefix
' sReturnValue is the value that should be entered in active cell if decoded here.  Any non-empty value will prevent further processing from BM.
' Cancel=True will prevent further barcode processing from BookMaster
Sub ProcessBarcodeInput(ByVal b, ByVal iRecNum, ByVal sAnalyteTemplateCode, ByVal sBarcode, sReturnValue, Cancel)
  If Left(sBarcode, 1) = "e" Or Left(sBarcode, 1) = "r" Then
    sReturnValue = Mid(sBarcode, 2)
    Exit Sub
  End If
End Sub


' Customized Balance data Processing
' b is an internal BookMaster object describing data of current page
' iRecNum, sAnalyteTemplateCode is currently selected cell.  If no analyte is selected, iRecNum=-1
' sBalanceInput is string received from balance
' sReturnValue is a string representing a valid weight.  Any non-empty value will prevent further processing from BM.
' Cancel=True will prevent further Balance Input processing from BookMaster
'sub ProcessBalanceInput(byval b, byval iRecNum, byval sAnalyteTemplateCode, byval sBalanceInput, sReturnValue, Cancel)
'  MsgBox "ProcessBalanceInput: " & sAnalyteTemplateCode & "(" & iRecNum & ")"
'  sReturnValue="3.14"
'end sub

'sub CommitStep(ByVal b, ByVal iSequence, Cancel)
'  MsgBox "BM Library: BeforeCommitStep " & iSequence
'end sub



' Customized Significant Digits Rounding Function
' Compatible with SOP QUA-004, a 5 after the last significant position is always rounded to the value+1
' on the last significant position
Function BMSignificantDigits(ByVal d, ByVal iDigits)
    If d = 0 Then
        BMSignificantDigits = 0
        Exit Function
    End If
    If iDigits <= 0 Then
        BMSignificantDigits = d
        Exit Function
    End If
    Dim p, s
    s = Sgn(d)
    d = Abs(d)
    p = Int(0.00000001 + Log(d) / Log(10))
    BMSignificantDigits = s * Int(0.50000001 + d / 10 ^ (p - iDigits + 1)) * 10 ^ (p - iDigits + 1)
End Function


' Customized Rounding Function
' Compatible with SOP QUA-004, a 5 after the last significant position is always rounded to the value+1
' on the last significant position
Function BMRound(ByVal dExpression, ByVal iNumDigitsAfterDecimal)
  If iNumDigitsAfterDecimal >= 0 Then
    BMRound = Round(dExpression + 0.00000001, iNumDigitsAfterDecimal)
  Else
    BMRound = Int(0.50000001 + dExpression * 10 ^ iNumDigitsAfterDecimal) / 10 ^ iNumDigitsAfterDecimal
  End If
End Function


