VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   11205
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   11925
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   747
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   795
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtEncrypted 
      Height          =   315
      Index           =   0
      Left            =   360
      TabIndex        =   1
      Text            =   "?"
      Top             =   720
      Width           =   315
   End
   Begin VB.Label lblEncrypted 
      AutoSize        =   -1  'True
      Caption         =   "???"
      BeginProperty Font 
         Name            =   "Consolas"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   120
      TabIndex        =   3
      Top             =   60
      Width           =   315
   End
   Begin VB.Label lblDecrypted 
      AutoSize        =   -1  'True
      Caption         =   "???"
      BeginProperty Font 
         Name            =   "Consolas"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   120
      TabIndex        =   2
      Top             =   300
      Width           =   315
   End
   Begin VB.Label lblClear 
      Caption         =   "A"
      Height          =   195
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   765
      Width           =   135
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Option Compare Binary

Const sOrderedByFrequence As String = "ETAOINSHRDLCUMWFGYPBVKJXQZ"
' Const sEncrypted As String = "BPMZO XS AFZHAWFC FX OSSK: ""XPH ZFOT SY XPH PSEAH MAC'X MC. APH'A FX PHK SYYMBH KECCMCL PHK BSWNFCT. M'ZZ LHX XPH WFC SY XPH PSEAH."""
' Const sSolution As String = "SCNWUA?E??RGIPDH??OY??MTFL"

Const sEncrypted As String = "FXHFMK WT OLXTDFBO LG VTLVXT HNL EYKFIDTT HYON MLA. ONTM NFUT F DYINO OL ONTYD LHB DYEYPAXLAK LVYBYLBK."

Dim subst(25) As Integer

Dim bDecrypt As Boolean

Sub CryptoExercise()
    Dim t() As Integer
    t = CompteFreq(sEncrypted)
    Dim i As Integer, iMax As Integer, nMax As Integer, j As Integer
    j = 1
    Do
        iMax = -1
        nMax = 0
        For i = 0 To 25
            If t(i) > nMax Then
                nMax = t(i)
                iMax = i
            End If
        Next
        If iMax < 0 Then Exit Do
        txtEncrypted(iMax) = Mid(sOrderedByFrequence, j, 1)
        subst(iMax) = Asc(Mid(sOrderedByFrequence, j, 1)) - 65
        t(iMax) = 0
        j = j + 1
    Loop
    bDecrypt = True
    DoDecrypt
End Sub

Private Function CompteFreq(s As String) As Integer()
    Dim t(25) As Integer
    Dim i As Integer
    For i = 1 To Len(s)
        Dim c As Integer
        c = Asc(Mid(s, i, 1))
        If c >= Asc("A") And c <= Asc("Z") Then
            t(c - Asc("A")) = t(c - Asc("A")) + 1
        End If
    Next
    CompteFreq = t
End Function

Private Sub Form_Load()
    Dim i As Integer
    For i = 1 To 25
        Load lblClear(i)
        With lblClear(i)
            .Top = lblClear(0).Top + i * 25
            .Caption = Chr(65 + i)
            .Visible = True
        End With
        Load txtEncrypted(i)
        With txtEncrypted(i)
            .Top = txtEncrypted(0).Top + i * 25
            '.Text = Chr(65 + i)
            .Visible = True
        End With
    Next
    lblEncrypted.Caption = sEncrypted
    CryptoExercise
End Sub

Private Sub txtEncrypted_Change(Index As Integer)
    If Not bDecrypt Then Exit Sub
    If Len(txtEncrypted(Index)) = 0 Then Exit Sub
    If txtEncrypted(Index) >= "a" And txtEncrypted(Index) <= "z" Then
        txtEncrypted(Index) = UCase(txtEncrypted(Index))
        Exit Sub
    End If
    Dim c As Integer, i As Integer
    c = Asc(txtEncrypted(Index)) - Asc("A")
    For i = 0 To 25
        If subst(i) = c And i <> Index Then
            bDecrypt = False
            Dim t As Integer
            t = subst(Index)
            subst(Index) = c
            subst(i) = t
            txtEncrypted(i) = Chr(65 + t)
            bDecrypt = True
            Exit For
        End If
    Next
    DoDecrypt
End Sub

Private Sub DoDecrypt()
    Dim s As String
    Dim i As Integer, c As Integer
    For i = 1 To Len(sEncrypted)
        c = Asc(Mid(sEncrypted, i, 1))
        If c >= Asc("A") And c <= Asc("Z") Then
            If Len(txtEncrypted(c - Asc("A"))) = 1 Then
                s = s & txtEncrypted(c - Asc("A"))
            Else
                s = s & "?"
            End If
        Else
            s = s & Chr(c)
        End If
    Next
    lblDecrypted.Caption = s
End Sub
