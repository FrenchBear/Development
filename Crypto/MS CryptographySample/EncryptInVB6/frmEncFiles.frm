VERSION 5.00
Begin VB.Form frmEncFiles 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   2175
   ClientLeft      =   1560
   ClientTop       =   1845
   ClientWidth     =   5565
   Icon            =   "frmEncFiles.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2175
   ScaleWidth      =   5565
   Begin VB.TextBox txtData 
      BackColor       =   &H00FFFFC0&
      Height          =   315
      Index           =   1
      Left            =   180
      Locked          =   -1  'True
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   1095
      Width           =   4635
   End
   Begin VB.TextBox txtData 
      Height          =   315
      Index           =   0
      Left            =   180
      TabIndex        =   0
      Top             =   435
      Width           =   4635
   End
   Begin VB.CommandButton cmdChoice 
      Caption         =   "&Encrypt"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   3480
      TabIndex        =   1
      Top             =   1635
      Width           =   975
   End
   Begin VB.CommandButton cmdChoice 
      Caption         =   "&Exit"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   4560
      TabIndex        =   2
      Top             =   1635
      Width           =   975
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Name and location of encrypted file"
      Height          =   195
      Index           =   3
      Left            =   240
      TabIndex        =   5
      Top             =   855
      Width           =   2505
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Enter full path\filename for a file to encrypt"
      Height          =   195
      Index           =   2
      Left            =   240
      TabIndex        =   4
      Top             =   75
      Width           =   5010
   End
   Begin VB.Label lblMyLabel 
      BackStyle       =   0  'Transparent
      Height          =   420
      Left            =   180
      TabIndex        =   3
      Top             =   4275
      Width           =   2925
   End
End
Attribute VB_Name = "frmEncFiles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
  Private g_strFilename     As String
  Private g_strEncryptName  As String
  Private arData()          As Byte
  Private arPassword()         As Byte
Private Sub Encrypt_File()

' ---------------------------------------------------------------------------
' Define local variables
' ---------------------------------------------------------------------------
  Dim lngFileSize  As Long
  Dim hFile        As Integer
  Dim strText      As String
  Dim intCipher       As Integer
  Dim intHashType      As Integer
  Dim strPassword As String
  Dim objCryptWrap      As CryptWrap.clsCryptoAPI
' ---------------------------------------------------------------------------
' Make sure that the file exists and is not empty.
' ---------------------------------------------------------------------------
  Set objCryptWrap = New CryptWrap.clsCryptoAPI
  On Error Resume Next
  '
  lngFileSize = FileLen(g_strFilename)
  '
  If Err <> 0 Or lngFileSize = 0 Then
      MsgBox "Cannot locate: " & vbCrLf & _
             g_strFilename & vbCrLf & "or this is an empty file.", _
             vbOKOnly, "File not found"
      Clear_Variables
      Exit Sub
  End If
  '
  On Error GoTo 0     ' nullify the previous "On Error"
  '
  On Error GoTo Encrypt_File_Errors
' ---------------------------------------------------------------------------
' resize the data array to accommodate the file contents
'
' For encrypting, leave one extra element in the array to handle the last
' NULL appended to the excrypted file
' ---------------------------------------------------------------------------
  ReDim arData(lngFileSize)
' ---------------------------------------------------------------------------
' Create empty receiving files
' ---------------------------------------------------------------------------
  hFile = FreeFile  ' get first free file handle
  Open g_strEncryptName For Output As #hFile
  Close #hFile
' ---------------------------------------------------------------------------
' load the byte array with the file contents from the input file using one
' command then close file.
' ---------------------------------------------------------------------------
  Open g_strFilename For Binary Access Read As #hFile
  Get hFile, , arData
  Close #hFile
  strPassword = "hitesh"
  arPassword = objCryptWrap.StringToByteArray(strPassword)
  objCryptWrap.Password = arPassword()
  
' ---------------------------------------------------------------------------
' set up parameters prior to encryption
' ---------------------------------------------------------------------------
  objCryptWrap.InputData = arData()
  intHashType = 4 'SHA-1 hasing algorithm
  intCipher = 2   'RC2 encryption algorithm
' ---------------------------------------------------------------------------
' Encrypt the data and return in a byte array
' ---------------------------------------------------------------------------
  If objCryptWrap.Encrypt(intHashType, intCipher) Then
      arData = objCryptWrap.OutputData
  Else
      GoTo CleanUp
  End If
' ---------------------------------------------------------------------------
' Write the encrypted data into the encrypted output file
' ---------------------------------------------------------------------------
  Open g_strEncryptName For Binary Access Write As #hFile
  Put hFile, , arData
  Close #hFile
'
  MsgBox "Successful Finish!" & vbCrLf & _
         "Use a text editor to veiw the file formats.", _
         vbInformation Or vbOKOnly, "Encrypt Files"
'
CleanUp:
  On Error GoTo 0         ' nullify the previous "On Error"
  Set objCryptWrap = Nothing   ' free class from memory
  Erase arData()          ' empty the data array
  strText = String$(250, 0)
  Exit Sub
  
Encrypt_File_Errors:
' ---------------------------------------------------------------------------
' Display error message
' ---------------------------------------------------------------------------
  MsgBox "Error: " & CStr(Err.Number) & "  " & Err.Description & vbCrLf & vbCrLf & _
         "Module:  frmEncFiles" & vbCrLf & _
         "Routine:  Encrypt_File", vbExclamation Or vbOKOnly, "Encrypt File Error"
  
  Call CloseOpenFiles
  Resume CleanUp
  
End Sub
Public Function CloseOpenFiles() As Boolean
' ---------------------------------------------------------------------------
' Closes any files that were opened with an "Open" statement
' ---------------------------------------------------------------------------
  While FreeFile > 1
      Close #FreeFile - 1
  Wend
'
End Function
Private Sub Generate_FileName()
Dim intPosition As Integer
g_strFilename = Trim$(txtData(0).Text)
' ---------------------------------------------------------------------------
' look for last period in the path\filename
' ---------------------------------------------------------------------------
  intPosition = InStrRev(g_strFilename, ".", Len(g_strFilename))
  g_strEncryptName = Left$(g_strFilename, intPosition) & "enc"
  txtData(1).Text = g_strEncryptName
End Sub
Private Sub Clear_Variables()
  Erase arData()
  g_strFilename = ""
  g_strEncryptName = ""
  With frmEncFiles
       .txtData(1).Text = ""
       .txtData(2).Text = ""
  End With
End Sub
Private Sub cmdChoice_Click(Index As Integer)
Select Case Index
    Case 0  'Test encryption is clicked
        If (txtData(0).Text = "") Then
            Exit Sub
        End If
        Encrypt_File
    Case 1  'Exit is clicked
        End
End Select
End Sub
Private Sub txtData_LostFocus(Index As Integer)
  If Len(Trim$(txtData(0).Text)) > 0 Then
      Generate_FileName
  Else
      txtData(1).Text = ""
  End If
End Sub
