VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "msinet.ocx"
Begin VB.Form OnlineForm 
   Caption         =   "WebBrowser - OnLine Form"
   ClientHeight    =   7170
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9885
   LinkTopic       =   "Form1"
   ScaleHeight     =   7170
   ScaleWidth      =   9885
   StartUpPosition =   3  'Windows Default
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   360
      Top             =   6720
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Scrape Document"
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6960
      TabIndex        =   3
      Top             =   6600
      Width           =   2895
   End
   Begin VB.ComboBox Combo1 
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      ItemData        =   "OnlineForm.frx":0000
      Left            =   0
      List            =   "OnlineForm.frx":000D
      TabIndex        =   1
      Text            =   "Combo1"
      Top             =   0
      Width           =   4695
   End
   Begin SHDocVwCtl.WebBrowser WebBrowser1 
      Height          =   6015
      Left            =   0
      TabIndex        =   0
      Top             =   480
      Width           =   9855
      ExtentX         =   17383
      ExtentY         =   10610
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
   Begin VB.Label Label1 
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4920
      TabIndex        =   2
      Top             =   0
      Width           =   4695
   End
End
Attribute VB_Name = "OnlineForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
    Dim URLs(10) As String

Private Sub Combo1_Change()
    If Combo1.ListIndex > -1 Then
        Screen.MousePointer = vbHourglass
        WebBrowser1.Navigate2 (URLs(Combo1.ListIndex))
    End If
End Sub

Private Sub Combo1_Click()
    If WebBrowser1.Busy Then
        MsgBox "Can't access the document while a download operation is in progress."
        Exit Sub
    End If
    If Inet1.StillExecuting Then
        MsgBox "Internet Transfer control is busy downloading at the time."
        Exit Sub
    End If
    If Combo1.ListIndex > -1 Then
        WebBrowser1.Navigate2 (URLs(Combo1.ListIndex))
    End If
End Sub

' The Command1 button processes the current document and retrieves the
' links and images in the document
Private Sub Command1_Click()
    If WebBrowser1.Busy Then
        MsgBox "Can't access the document while a download operation is in progress."
        Exit Sub
    End If
    If Inet1.StillExecuting Then
        MsgBox "Internet Transfer control is busy downloading at the time."
        Exit Sub
    End If
    
    Dim msg As String
    If WebBrowser1.Document.links.length = 0 Then
        msg = "The document contains no links" & vbCrLf
    Else
        msg = "The document contains " & WebBrowser1.Document.links.length & " links" & vbCrLf
        msg = msg & "The first link is " & WebBrowser1.Document.links(0) & vbCrLf
        msg = msg & "and point to the document " & WebBrowser1.Document.links(0).href & vbCrLf
    End If
    If WebBrowser1.Document.images.length = 0 Then
        msg = msg & "The document contains no images" & vbCrLf
    Else
        msg = msg & "The document also contains " & WebBrowser1.Document.images.length & " images"
    End If
    MsgBox msg
    
    Dim b() As Byte
    Dim tmpFileName As String
    Dim pos As Integer
    Dim frmCaption As String
    frmCaption = Me.Caption
    Screen.MousePointer = vbHourglass
    ' The following loop goes through the elements of the Document.Images array,
    ' which are the URL of the images in the current document. It downloads
    ' each image with the INet control and stores it into a file in the
    ' c:\tempImages folder. Each image's file is named after the image's original name.
    For i = 0 To WebBrowser1.Document.images.length - 1
        Me.Caption = "Downloading image # " & i
        Inet1.Cancel
        Inet1.Protocol = icHTTP
        Inet1.URL = WebBrowser1.Document.images.Item(i).href
        b() = Inet1.OpenURL(, icByteArray)
        pos = InStrRev(WebBrowser1.Document.images.Item(i).href, "/")
        tmpFileName = Mid(WebBrowser1.Document.images.Item(i).href, pos + 1)
        Open "c:\tempImages\" & tmpFileName For Binary Access Write As #1
        Put #1, , b()
        Close #1
    Next

    Me.Caption = frmCaption
    MsgBox "Saved " & WebBrowser1.Document.images.length & " images in C:\TempImages\"
    msg = "The page contains " & WebBrowser1.Document.Forms.length & " FORM objects" & vbCrLf
    For i = 0 To WebBrowser1.Document.Forms.length - 1
        msg = msg & "   FORM NAME = " & WebBrowser1.Document.Forms(i).Name & vbCrLf
        msg = msg & "      ACTION = " & WebBrowser1.Document.Forms(i).Action & vbCrLf
        For j = 0 To WebBrowser1.Document.Forms(i).length - 1
            msg = msg & "   ELEMENT [" & WebBrowser1.Document.Forms(i).Elements(j).Name & "]};" & vbCrLf
            msg = msg & "   has a value of   [" & WebBrowser1.Document.Forms(i).Elements(j).Value & "]" & vbCrLf
        Next
    Next
    Screen.MousePointer = vbDefault
    Debug.Print msg
End Sub

Private Sub Form_Load()
    WebBrowser1.Navigate2 "about:blank"
    Combo1.Clear
    Combo1.AddItem "VB Zone"
    URLs(0) = "http://www.devx.com/vb/"
    Combo1.AddItem "DevX"
    URLs(1) = "http://www.devx.com/"
    Combo1.AddItem "VB2TheMax"
    URLs(2) = "http://www.vb2themax.com/"
    Combo1.Text = "Select a site to connect"
End Sub

Private Sub Form_Resize()
    Command1.Left = OnlineForm.Width - Command1.Width - 10 * Screen.TwipsPerPixelX
    Command1.Top = OnlineForm.Height - Command1.Height - 30 * Screen.TwipsPerPixelY
    WebBrowser1.Width = OnlineForm.Width - WebBrowser1.Left - 10 * Screen.TwipsPerPixelX
    WebBrowser1.Height = OnlineForm.Height - WebBrowser1.Top - 1.35 * Command1.Height - 24 * Screen.TwipsPerPixelY
End Sub

Private Sub Picture1_Click()

End Sub


Private Sub WebBrowser1_NavigateComplete2(ByVal pDisp As Object, URL As Variant)
    Screen.MousePointer = vbDefault
End Sub

Private Sub WebBrowser1_NavigateError(ByVal pDisp As Object, URL As Variant, Frame As Variant, StatusCode As Variant, Cancel As Boolean)
    Screen.MousePointer = vbDefault
End Sub

Private Sub WebBrowser1_StatusTextChange(ByVal Text As String)
    Label1.Caption = Text
End Sub
