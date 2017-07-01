VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Begin VB.Form Form1 
   Caption         =   "MSForms2 Controls"
   ClientHeight    =   1920
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4860
   LinkTopic       =   "Form1"
   ScaleHeight     =   128
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   324
   StartUpPosition =   3  'Windows Default
   Begin MSForms.CheckBox CheckBox4 
      Height          =   720
      Left            =   240
      TabIndex        =   4
      Top             =   600
      Width           =   4395
      BackColor       =   -2147483633
      ForeColor       =   -2147483630
      DisplayStyle    =   4
      Size            =   "7752;1270"
      MultiSelect     =   1
      Value           =   "0"
      Caption         =   "xx"
      FontName        =   "Arial Unicode MS"
      FontHeight      =   195
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin MSForms.CheckBox CheckBox3 
      Height          =   315
      Left            =   2220
      TabIndex        =   3
      Top             =   300
      Width           =   975
      BackColor       =   -2147483633
      ForeColor       =   -2147483630
      DisplayStyle    =   4
      Size            =   "1720;556"
      Value           =   "2"
      Caption         =   "null"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin MSForms.CheckBox CheckBox2 
      Height          =   315
      Left            =   1260
      TabIndex        =   2
      Top             =   300
      Width           =   975
      BackColor       =   -2147483633
      ForeColor       =   -2147483630
      DisplayStyle    =   4
      Size            =   "1720;556"
      MultiSelect     =   1
      Value           =   "1"
      Caption         =   "True"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin MSForms.ComboBox cboOperators 
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   1320
      Width           =   3795
      DisplayStyle    =   7
      Size            =   "6694;661"
      ListWidth       =   14111
      BoundColumn     =   2
      ColumnCount     =   5
      ListRows        =   20
      cColumnInfo     =   5
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial Unicode MS"
      FontHeight      =   195
      FontCharSet     =   0
      FontPitchAndFamily=   2
      Object.Width           =   "35;2116;564;3527;7055"
   End
   Begin MSForms.CheckBox CheckBox1 
      Height          =   315
      Left            =   240
      TabIndex        =   0
      Top             =   300
      Width           =   975
      BackColor       =   -2147483633
      ForeColor       =   -2147483630
      DisplayStyle    =   4
      Size            =   "1720;556"
      MultiSelect     =   1
      Value           =   "0"
      Caption         =   "False"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim conEurodat50 As ADODB.Connection

Private Sub Form_Load()
    InitBD
    FillCboOperators
    CheckBox4.Caption = sUnicode(67, 104, 101, 99, 107, 98, 111, 120, 32, 8882, 32, 99, 97, 112, 116, 105, 111, 110, 32, 8883, 32, 8649, 8648, 8650, 8647, 32, 9601, 9602, 9603, 9604, 9605, 9606, 9607, 9608, 32, 9728, 9729, 9730, 32, 9760, 32, 10004, 10006, 32, 10152, 32, -3)
End Sub

Function sUnicode(ParamArray t()) As String
    Dim s As String, v As Variant
    For Each v In t()
        s = s & ChrW(v)
    Next
    sUnicode = s
End Function

Sub InitBD()
    Dim PWD As String, DSN As String
    
    DSN = "Eurodat505Alfortville"
    PWD = "madeinchina"
    
    Set conEurodat50 = New ADODB.Connection
    conEurodat50.Open "DRIVER=SQL Server;SERVER=" + RegistryGetSetting("HKLM\Software\ODBC\ODBC.INI\" + DSN, "Server") + ";DATABASE=" + RegistryGetSetting("HKLM\Software\ODBC\ODBC.INI\" + DSN, "Database") + ";UID=" + RegistryGetSetting("HKLM\Software\ODBC\ODBC.INI\" + DSN, "LastUser") + ";PWD=" + PWD + ""
    conEurodat50.CursorLocation = adUseClient
End Sub

Sub FillCboOperators()
    Dim rsOperators As ADODB.Recordset
    Set rsOperators = New ADODB.Recordset
    Dim sRequest As String
    
    sRequest = "select OperatorCode,OperatorName,email,cellphone from Operators where operatorname is not null and email<>'' and isDeleted=0 and isNotInUse=0 order by OperatorCode"
    rsOperators.Open sRequest, conEurodat50, adOpenForwardOnly, adLockOptimistic
    
    While Not rsOperators.EOF
        cboOperators.AddItem rsOperators!OperatorCode & ": " & NV(rsOperators!OperatorName)
        cboOperators.List(cboOperators.ListCount - 1, 1) = NV(rsOperators!OperatorCode)
        If NV(rsOperators!cellphone) <> "" Then cboOperators.List(cboOperators.ListCount - 1, 2) = ChrW(&H260E)
        cboOperators.List(cboOperators.ListCount - 1, 3) = NV(rsOperators!OperatorName)
        cboOperators.List(cboOperators.ListCount - 1, 4) = NV(rsOperators!email)
        
        rsOperators.MoveNext
    Wend
    rsOperators.Close
End Sub

