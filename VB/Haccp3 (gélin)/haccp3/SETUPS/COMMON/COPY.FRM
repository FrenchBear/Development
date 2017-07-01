VERSION 4.00
Begin VB.Form frmCopy 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "#"
   ClientHeight    =   1836
   ClientLeft      =   876
   ClientTop       =   1536
   ClientWidth     =   5916
   ClipControls    =   0   'False
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   0
      weight          =   700
      size            =   7.8
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   Height          =   2208
   Icon            =   "COPY.frx":0000
   Left            =   828
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1836
   ScaleWidth      =   5916
   Top             =   1212
   Width           =   6012
   Begin VB.PictureBox picStatus 
      AutoRedraw      =   -1  'True
      ClipControls    =   0   'False
      FillColor       =   &H00FF0000&
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   400
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   384
      Left            =   168
      ScaleHeight     =   360
      ScaleWidth      =   5568
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   708
      Width           =   5592
   End
   Begin VB.CommandButton cmdExit 
      Cancel          =   -1  'True
      Caption         =   "#"
      Default         =   -1  'True
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   400
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   2085
      TabIndex        =   0
      Top             =   1275
      Width           =   1665
   End
   Begin VB.Label lblDestFile 
      Caption         =   "*"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   400
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   192
      Left            =   168
      TabIndex        =   1
      Top             =   300
      Width           =   5640
   End
   Begin VB.Label lblCopy 
      AutoSize        =   -1  'True
      Caption         =   "#"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   400
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   165
      TabIndex        =   2
      Top             =   0
      Width           =   105
   End
End
Attribute VB_Name = "frmCopy"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit
Option Compare Text

Private Sub cmdExit_Click()
    ExitSetup Me, gintRET_EXIT
End Sub

Private Sub Form_Load()
    cmdExit.Caption = ResolveResString(resBTNCANCEL)
    lblCopy.Caption = ResolveResString(resLBLDESTFILE)
    lblDestFile.Caption = gstrNULL
    
    frmCopy.Caption = gstrTitle
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    If UnloadMode <> 1 Then
        ExitSetup Me, gintRET_EXIT
        Cancel = 1
    End If
End Sub
