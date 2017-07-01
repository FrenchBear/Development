VERSION 5.00
Object = "{8E27C92E-1264-101C-8A2F-040224009C02}#7.0#0"; "MSCAL.OCX"
Begin VB.Form frmAnniversaire 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Anniversaires dans les 15 jours"
   ClientHeight    =   4080
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4110
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAnniversaire.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4080
   ScaleWidth      =   4110
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnOk 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   1380
      TabIndex        =   1
      Top             =   3660
      Width           =   1095
   End
   Begin MSACAL.Calendar calCalendrier 
      Height          =   3255
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   4095
      _Version        =   524288
      _ExtentX        =   7223
      _ExtentY        =   5741
      _StockProps     =   1
      BackColor       =   -2147483633
      Year            =   1998
      Month           =   4
      Day             =   19
      DayLength       =   1
      MonthLength     =   2
      DayFontColor    =   0
      FirstDay        =   1
      GridCellEffect  =   1
      GridFontColor   =   10485760
      GridLinesColor  =   -2147483632
      ShowDateSelectors=   -1  'True
      ShowDays        =   -1  'True
      ShowHorizontalGrid=   -1  'True
      ShowTitle       =   -1  'True
      ShowVerticalGrid=   -1  'True
      TitleFontColor  =   10485760
      ValueIsNull     =   0   'False
      BeginProperty DayFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty GridFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty TitleFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblMessage 
      Caption         =   "Liste"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   3300
      Width           =   2025
   End
End
Attribute VB_Name = "frmAnniversaire"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Anniversaires
' Application de rappel de dates d'anniversaires
' 18/04/1998 PV Version 2, avec base Access
' 31/05/1998 PV 3.0 AutoChangeLogin, Pas d'affichage si login<>pierre
'  1/06/1998 PV 3.1 Jours fériés

Option Explicit

Const sNomApp = "Anniversaires"

Private Sub btnOk_Click()
  Unload Me
End Sub

Function Max(ByVal a As Integer, ByVal b As Integer) As Integer
  Max = IIf(a > b, a, b)
End Function

Sub Form_Load()
  If App.LogMode Then    ' Empirique, pas de gestion des utilisateurs en développement
    modAutoChangeLogin.Main
    If StrComp(sLoginActuel, "pierre", vbTextCompare) <> 0 Then
      Unload Me
      Exit Sub
    End If
  End If
  
  Dim db As Database
  Dim rs As Recordset
  Dim sMsg As String
  
  Dim sDataBasePath As String
  sDataBasePath = IIf(Command = "", App.Path & "\anniversaires.mdb", Command)
  
  On Error Resume Next
  Set db = OpenDatabase(sDataBasePath, True, True)
  If Err Then
    MsgBox "Échec lors de l'accès à la base de données '" & sDataBasePath & "'" & vbCrLf & vbCrLf & "Erreur " & Err.Number & " (" & Err.Source & "): " & Err.Description, vbCritical, sNomApp
    End
  End If
  Set rs = db.OpenRecordset("select * from Anniversaires order by 100*month(date)+day(date)")
  If Err Then
    MsgBox "Échec lors de l'accès à la table Anniversaires" & vbCrLf & vbCrLf & "Erreur " & Err.Number & " (" & Err.Source & "): " & Err.Description, vbCritical, sNomApp
    End
  End If
  On Error GoTo 0
  
  Dim d As Date   ' Prochaîne date d'anniversaire de l'événement
  While Not rs.EOF
    d = DateSerial(Year(Now), Month(rs![Date]), Day(rs![Date]))
    ' Si la date tombe avant hier dans l'année en cours,
    ' on prend dans l'année suivante
    If d < Int(Now) - 1 Then d = DateSerial(Year(Now) + 1, Month(rs![Date]), Day(rs![Date]))
    
    If rs![Type] = "M" And Year(d) <> Year(rs![Date]) Then GoTo Continue
    
    ' On ne s'occupe que des événements dans les 15 jours
    If d - Int(Now) < 15 Then
      Dim sDate As String
      Select Case d - Int(Now)
        Case -1: sDate = "Hier"
        Case 0:  sDate = "Aujourd'hui"
        Case 1:  sDate = "Demain"
        Case Else: sDate = Format(d, "d mmmm")
      End Select
        
      sMsg = sMsg & sDate & ": "
      If rs!nom <> "" Then sMsg = sMsg & rs!nom & ", "
      sMsg = sMsg & rs!Evénement
      ' On calcule le nombre d'années écoulées
      If Year(rs![Date]) <> 1900 And rs![Type] <> "M" Then
        Dim iNbAnnéesEcoulées As Integer
        iNbAnnéesEcoulées = Int((Now - rs![Date]) / 365.25 + 0.5)
        sMsg = sMsg & " [" & IIf(iNbAnnéesEcoulées = 1, "1er", iNbAnnéesEcoulées & "ème") & "]"
      End If
      sMsg = sMsg & vbCrLf
    End If
Continue:
    rs.MoveNext
  Wend
  rs.Close
  db.Close
  
  calCalendrier.Day = Day(Now)
  calCalendrier.Month = Month(Now)
  calCalendrier.Year = Year(Now)
  
  If sMsg = "" Then sMsg = "Rien à signalier dans les deux semaines." & vbCrLf
  sMsg = "Nous sommes le " & Format(Now, "dddd d mmmm yyyy.") & vbCrLf & sMsg
  lblMessage = sMsg
  lblMessage.AutoSize = True
  Dim w As Integer
  w = Max(lblMessage.Width, calCalendrier.Width)
  btnOk.Move (w - btnOk.Width) / 2, lblMessage.Top + lblMessage.Height
  calCalendrier.Left = (w - calCalendrier.Width) / 2
  frmAnniversaire.Width = w + 280
  frmAnniversaire.Height = btnOk.Top + 800
End Sub

