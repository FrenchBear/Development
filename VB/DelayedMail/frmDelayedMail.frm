VERSION 5.00
Begin VB.Form frmDelayedMail 
   Caption         =   "Delayed Mail"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtToSend 
      Height          =   2175
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Top             =   420
      Width           =   4095
   End
   Begin VB.Label lblNow 
      AutoSize        =   -1  'True
      Caption         =   "Label1"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   480
   End
End
Attribute VB_Name = "frmDelayedMail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmDelayedMail
' Bakground application that sends an email on a given date and time
' defined in a .ini file
' 20060615 FPVI
'

Option Explicit

Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

' Private .ini access
Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Private Declare Function WritePrivateProfileString Lib "kernel32.dll" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpString As String, ByVal lpFileName As String) As Long



Private Sub Form_Load()
    If App.PrevInstance Then End
    
    Dim sIniFile As String
    sIniFile = App.Path & "\DelayedMail.ini"
    If Dir(sIniFile) = "" Then
        MsgBox "Configuration file <" & sIniFile & "> not found.", vbCritical
        End
    End If
    
    Visible = True
    
    Do
        lblNow.Caption = "Now: " & Now
        
        Dim s1 As String
        s1 = sGetPrivateProfileString("", "", "?", sIniFile)
        If s1 = "?" Then
            MsgBox "Invalid file <" & sIniFile & ">.", vbCritical
            End
        End If
        
        Dim nbToSend As Integer
        txtToSend = ""
        nbToSend = 0
        Dim m
        For Each m In Split(s1, Chr(0))
            If m <> "" Then
                If CBool(sGetPrivateProfileString(m, "Sent", "0", sIniFile)) Then
                    txtToSend = txtToSend & m & ": Already sent" & vbCrLf
                ElseIf CDate(sGetPrivateProfileString(m, "SendOn", "", sIniFile)) > Now Then
                    nbToSend = nbToSend + 1
                    txtToSend = txtToSend & m & ": Send later, on " & sGetPrivateProfileString(m, "SendOn", "", sIniFile) & vbCrLf
                Else
                    txtToSend = txtToSend & m & ": Sending..."
                    SendMail sGetPrivateProfileString(m, "From", "", sIniFile), sGetPrivateProfileString(m, "To", "", sIniFile), sGetPrivateProfileString(m, "Subject", "", sIniFile), sGetPrivateProfileString(m, "Body", "", sIniFile), sGetPrivateProfileString(m, "Attachement", "", sIniFile)
                    WritePrivateProfileString m, "Sent", "1", sIniFile
                    txtToSend = txtToSend & "Sent." & vbCrLf
                End If
            End If
        Next
        
        If nbToSend = 0 Then Exit Do
        DoEvents
        Sleep 250
    Loop
    
DoIt:
    'SendMail "PierreViolent@Eurofins.com;Violent.Pierre@Wanadoo.fr", "Test message", "Ceci est un test", "C:\Devis.pdf"
    
    End
End Sub
    
    
Sub SendMail(ByVal from As String, ByVal Recipients As String, ByVal Subject As String, ByVal body As String, ByVal sAttachement As String)
    Dim myEMail As New ASPEMAILLib.MailSender, myStrings() As String, ind As Long, lastInd As Long, sAttachment As Variant, newBody As String
    myStrings = Split(Recipients, ";")
    For ind = 0 To UBound(myStrings)
        Call myEMail.AddAddress(Trim(myStrings(ind)))
    Next
    myEMail.Subject = Subject
    myEMail.IsHTML = False
    myEMail.body = Replace(body, "|", vbCrLf)
    myEMail.Host = "12.168.161.198"
    myEMail.Port = "25"
    myEMail.from = from
    myEMail.Timeout = 15000
    
    If sAttachement <> "" Then myEMail.AddAttachment sAttachement
    
    Call myEMail.Send
End Sub



Public Function sGetPrivateProfileString(ByVal sSection As String, ByVal sKey As String, ByVal sDefault As String, ByVal sIniFile As String)
    ' Find .ini file
    If Mid(sIniFile, 2, 1) <> ":" And Left(sIniFile, 1) <> "\" Then sIniFile = App.Path & "\" & sIniFile
    Dim sRet As String
    Dim lSuccess As Long
    sRet = Space(16384)
    If sSection = "" Then
        lSuccess = GetPrivateProfileString(vbNullString, vbNullString, sDefault, sRet, 16384, sIniFile)
    ElseIf sKey = "" Then
        lSuccess = GetPrivateProfileString(sSection, vbNullString, sDefault, sRet, 16384, sIniFile)
    Else
        lSuccess = GetPrivateProfileString(sSection, sKey, sDefault, sRet, 16384, sIniFile)
    End If
    If lSuccess Then
        sGetPrivateProfileString = Left(sRet, lSuccess)
    Else
        sGetPrivateProfileString = sDefault
    End If
End Function

' Writes a string in a .ini configuration file
' If sIniFile is an absolute path, use it as is, else look for .ini file using sGetEtcResourceFilename
Public Function SetPrivateProfileString(ByVal sSection As String, ByVal sKey As String, ByVal sValue As String, ByVal sIniFile As String)
    ' Find .ini file
    WritePrivateProfileString sSection, sKey, sValue, sIniFile
End Function

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    End
End Sub
