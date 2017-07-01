VERSION 4.00
Begin VB.Form Form1 
   Caption         =   "Test PassThrough"
   ClientHeight    =   8460
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   6645
   Height          =   8865
   Left            =   1080
   LinkTopic       =   "Form1"
   ScaleHeight     =   8460
   ScaleWidth      =   6645
   Top             =   1170
   Width           =   6765
   Begin VB.ListBox List1 
      Height          =   1815
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   2055
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

' Enter the entire Declare statement on one, single line.
'Declare Function Escape Lib "Gdi" (ByVal hdc%, ByVal nEscape%, ByVal nCount%, ByVal indata$, ByVal oudata As Any) As Integer

' 32
'Private Declare Function Escape Lib "gdi32" (ByVal hdc As Long, ByVal nEscape As Long, ByVal nCount As Long, ByVal lpInData As String, lpOutData As Any) As Long

' 16
Private Declare Function Escape Lib "GDI" (ByVal hDC As Integer, ByVal nEscape As Integer, ByVal nCount As Integer, ByVal lplnData As Any, ByVal lpOutData As Any) As Integer

Const PASSTHROUGH = 19

Const RevLandScape = "&l3O" ' PCL command to change Paper
                            ' orientation to Reverse Landscape.
Const Portrait = "&l0O"     ' PCL command to change paper
                            ' orientation to Portrait.
Const ManualFeed = "&l3H"   ' PCL command to change Paper Bin
                            ' to Manual Feed Envelope.
Const AutoFeed = "&l1H"     ' PCL command to change Paper Bin
                            ' to Paper Tray AutoFeed

Private Sub Form_Load()
     List1.AddItem "HP/PCL Reverse Landscape"
     List1.AddItem "HP/PCL Portrait"
     List1.AddItem "HP/PCL Manual Feed Envelope"
     List1.AddItem "HP/PCL Paper Tray Auto Feed"
End Sub

Private Sub List1_Click()
  Dim PCL_Escape$, result As Long
  
   Select Case List1.ListIndex
      Case 0:
         PCL_Escape$ = Chr$(27) + RevLandScape
      Case 1:
         PCL_Escape$ = Chr$(27) + Portrait
      Case 2:
         PCL_Escape$ = Chr$(27) + ManualFeed
      Case 3:
         PCL_Escape$ = Chr$(27) + AutoFeed
   End Select
 
   ' Enter the following two lines as one, single line:
   PCL_Escape$ = Chr$(Len(PCL_Escape$) Mod 256) + Chr$(Len(PCL_Escape$) \ 256) + PCL_Escape$
 
   Printer.Print ""
   result = Escape(Printer.hDC, PASSTHROUGH, 0, PCL_Escape$, 0&)
 
   Select Case result
      ' Enter each Case statement on one, single line.
      Case Is < 0: MsgBox "The PASSTHROUGH Escape is not supported by this printer driver.", 48
      Case 0: MsgBox "An error occurred sending the escape sequence.", 48
      Case Is > 0: MsgBox "Escape Successfully sent. Sending test printout to printer."
      Printer.Print "Test case of "; List1.Text
      Printer.EndDoc
   End Select

End Sub

