Attribute VB_Name = "APPTBOOK1"
' ---------------------------------------------------------
'       Copyright ©1995-1998 APEX Software Corporation
'
' You have a royalty-free right to use, modify, reproduce,
' and distribute the True DBGrid Pro 6.0 sample application files
' (and/or any modified version) in any way you find useful,
' provided that you agree that APEX Software Corporation
' has no warranty, obligations, or liability for any sample
' application files.
' ---------------------------------------------------------

' Preferences
Type apptPrefs
    timeStart As Variant
    timeEnd As Variant
    timeIncrement As Variant
End Type

Global Prefs As apptPrefs

' Constants not included elsewhere
Global Const LTGREY = &HC0C0C0
Global Const OFF_YELLOW = &H80FFFF
Global Const LTGREEN = &H8000&

' Grid arrays
Global ApptTimes(1 To 20) As String
Global ApptInfo(5, 1 To 20) As String
Global ApptSelect(1 To 20) As Integer

Sub CenterForm(F As Form)
  ' Center the specified form within the screen
  F.Move (Screen.Width - F.Width) \ 2, (Screen.Height - F.Height) \ 2
End Sub

Sub Main()
  Prefs.timeStart = TimeValue("8:00am")
  Prefs.timeEnd = TimeValue("6:00pm")
  Prefs.timeIncrement = TimeValue("0:30")

  CenterForm ApptForm
  ApptForm.Show
End Sub


