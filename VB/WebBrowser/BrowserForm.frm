VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Begin VB.Form BrowserForm 
   Caption         =   "BrowserForm"
   ClientHeight    =   8895
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10770
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   8895
   ScaleWidth      =   10770
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      BackColor       =   &H80000004&
      Height          =   15
      Left            =   120
      MousePointer    =   7  'Size N S
      ScaleHeight     =   15
      ScaleWidth      =   4695
      TabIndex        =   3
      Top             =   9240
      Width           =   4695
   End
   Begin VB.TextBox txtDescription 
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3255
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   120
      Width           =   10575
   End
   Begin VB.CommandButton bttnRender 
      Caption         =   "R e n d e r"
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   8040
      TabIndex        =   1
      Top             =   8040
      Width           =   2655
   End
   Begin SHDocVwCtl.WebBrowser WebBrowser1 
      Height          =   4455
      Left            =   120
      TabIndex        =   0
      Top             =   3480
      Width           =   10575
      ExtentX         =   18653
      ExtentY         =   7858
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
End
Attribute VB_Name = "BrowserForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' These variables are used in the drag events of the
' Picture1 control, which acts as a splitter between the
' two panes on the form. The Picture1 control takes up
' the space between the TextBox and WebBrowser controls
' and is used to change the relative size of the two controls

Dim dragStartX As Integer
Dim dragStartY As Integer

Private Sub bttnRender_Click()
    HTMLString = "<html>"
    HTMLString = HTMLString & "<head>"
    HTMLString = HTMLString & "<meta http-equiv=" & Chr(34) & _
                "Content-Type" & Chr(34) & _
                " content=" & Chr(34) & _
                "text/html" & Chr(34) & ">"
    HTMLString = HTMLString & "</head><body BGCOLOR=lightyellow>"
    HTMLString = HTMLString & "<div align=left>"
    HTMLString = HTMLString & "<font face='Arial' size='2'>"
    '   render the HTML document entered by the user on the TextBox control
    HTMLString = HTMLString & txtDescription.Text
    
    HTMLString = HTMLString & "</font>"
    HTMLString = HTMLString & "</div>"
    HTMLString = HTMLString & "</body></html>"
    ' The following statements render the text in the HTMLString
    ' variable on the WebBrowser control
    WebBrowser1.Document.script.Document.Clear
    WebBrowser1.Document.script.Document.Write HTMLString
    WebBrowser1.Document.script.Document.Close
End Sub



Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
    ' A shortcut for the Render button on the form.
    ' The Form's KeyPreview property must be set to True
    If KeyCode = vbKeyF5 Then
        bttnRender_Click
    End If
End Sub

Private Sub Form_Load()
    ' Enter a sample HTML document on the TextBox control
    txtDescription.Text = "<center><h1>Using the WebBrowser control</h1>" & vbCrLf
    txtDescription.Text = txtDescription.Text & _
                "Enter your text here and click the Render button (or press the F5 button) "
    txtDescription.Text = txtDescription.Text & vbCrLf & _
                "to render the HTML code onto the WebBrowser control at the bottom."
    txtDescription.Text = txtDescription.Text & "<p/><p/>" & vbCrLf
    txtDescription.Text = txtDescription.Text & "<img src=""http://www.devx.com/assets/devx/3182.gif"">"
    ' Position the Picture control (the splitter) between the two panes of the form
    Picture1.Top = txtDescription.Top + txtDescription.Height + 2 * Screen.TwipsPerPixelY
    Picture1.Left = txtDescription.Left
    Picture1.Width = txtDescription.Width
    Picture1.Height = 3 * Screen.TwipsPerPixelY
    ' Fine tune the position of the WebBrowser control on the form
    WebBrowser1.Top = Picture1.Top + Picture1.Height + 1 * Screen.TwipsPerPixelY
    WebBrowser1.Width = Picture1.Width
    WebBrowser1.Navigate2 "about:blank"
End Sub

Private Sub Form_Resize()
    ' Resize and reposition the components on the form when the form is resized
    bttnRender.Left = BrowserForm.Width - bttnRender.Width - 10 * Screen.TwipsPerPixelX
    bttnRender.Top = BrowserForm.Height - bttnRender.Height - 30 * Screen.TwipsPerPixelY
    WebBrowser1.Width = BrowserForm.Width - WebBrowser1.Left - 6 * Screen.TwipsPerPixelX
    WebBrowser1.Height = BrowserForm.Height - WebBrowser1.Top - bttnRender.Height - 36 * Screen.TwipsPerPixelY
    txtDescription.Width = WebBrowser1.Width
    Picture1.Left = txtDescription.Left
    Picture1.Width = txtDescription.Width
End Sub

' The following event handlers respond to the movement of the mouse pointer
' when it's over the splitter between the two panes of the form.
' Drag the mouse vertically while holding down its left button to change
' the relative sizes of the TextBox and WebBrowser controls on the form.
Private Sub Picture1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    dragStartY = Y
End Sub

Private Sub Picture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = vbLeftButton Then
        Picture1.Top = Picture1.Top + (Y - dragStartY)
        ArrangeElements
    End If
End Sub

Private Sub ArrangeElements()
    txtDescription.Height = Picture1.Top - txtDescription.Top - 2 * Screen.TwipsPerPixelY
    Picture1.Left = txtDescription.Left
    WebBrowser1.Move WebBrowser1.Left, Picture1.Top + Picture1.Height + 1 * Screen.TwipsPerPixelY, WebBrowser1.Width, bttnRender.Top - WebBrowser1.Top - 4 * Screen.TwipsPerPixelY
End Sub

Private Sub Picture1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    dragStartY = 0
End Sub
