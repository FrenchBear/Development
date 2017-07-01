VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmModPla 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Modification de planning"
   ClientHeight    =   1635
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5325
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmModPla.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1635
   ScaleWidth      =   5325
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtKmD�but 
      Height          =   315
      Left            =   1380
      TabIndex        =   6
      Tag             =   "Kilom�trage au d�but de tourn�e"
      Top             =   900
      Width           =   1035
   End
   Begin VB.TextBox txtKmFin 
      Height          =   315
      Left            =   2460
      TabIndex        =   7
      Tag             =   "Kilom�trage en fin de tourn�e"
      Top             =   900
      Width           =   1035
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   3900
      TabIndex        =   8
      Top             =   60
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   3900
      TabIndex        =   9
      Top             =   450
      Width           =   1350
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   3900
      TabIndex        =   10
      Top             =   900
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   11
      Top             =   1320
      Width           =   5325
      _ExtentX        =   9393
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin Plannings.ChampHeure txtHeureD�but 
      Height          =   315
      Left            =   1380
      TabIndex        =   3
      Tag             =   "Heure de d�part de l'assistant"
      Top             =   540
      Width           =   1035
      _ExtentX        =   1826
      _ExtentY        =   556
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin Plannings.ChampHeure txtHeureFin 
      Height          =   315
      Left            =   2460
      TabIndex        =   4
      Tag             =   "Heure de rentr�e de l'assistant"
      Top             =   540
      Width           =   1035
      _ExtentX        =   1826
      _ExtentY        =   556
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblFinTourn�e 
      Alignment       =   2  'Center
      Caption         =   "Fin de tourn�e"
      Height          =   450
      Left            =   2520
      TabIndex        =   1
      Tag             =   "324"
      Top             =   60
      Width           =   900
   End
   Begin VB.Label lblD�butTourn�e 
      Alignment       =   2  'Center
      Caption         =   "D�but de tourn�e"
      Height          =   450
      Left            =   1440
      TabIndex        =   0
      Tag             =   "324"
      Top             =   60
      Width           =   960
   End
   Begin VB.Label lblHeure 
      AutoSize        =   -1  'True
      Caption         =   "Heure :"
      Height          =   210
      Left            =   60
      TabIndex        =   2
      Tag             =   "324"
      Top             =   600
      Width           =   705
   End
   Begin VB.Label lblKm 
      AutoSize        =   -1  'True
      Caption         =   "Kilom�trage :"
      Height          =   210
      Left            =   60
      TabIndex        =   5
      Tag             =   "324"
      Top             =   960
      Width           =   1260
   End
End
Attribute VB_Name = "frmModPla"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmModPla
' Modification d'informations au niveau du planning
' 12/04/1998 PV
' 25/01/1999 PV  Internationalisation


Option Explicit

Private jo As Journee      ' Journee d'origine


Private Function bCheckHeureD�but(bMessage As Boolean)
  If txtHeureD�but.HeureSaisie = "ERR" Then
    If bMessage Then
      MsgBox2i "CO004", txtHeureD�but
      'MsgBox "Heure de d�but de journ�e invalide.", vbExclamation, sNomApp
      bCheckHeureD�but = False
      txtHeureD�but.SetFocus
      AutoSelect txtHeureD�but, True
    End If
    Exit Function
  End If

  bCheckHeureD�but = True
End Function


Private Function bCheckHeureFin(bMessage As Boolean)
  If txtHeureFin.HeureSaisie = "ERR" Then
    If bMessage Then
      MsgBox2i "CO004", txtHeureFin
      'MsgBox "Heure de fin de journ�e invalide.", vbExclamation, sNomApp
      txtHeureFin.SetFocus
      AutoSelect txtHeureFin, True
    End If
    bCheckHeureFin = False
    Exit Function
  End If
  
  If txtHeureD�but.HeureSaisie <> "" And txtHeureFin.HeureSaisie = "" Or txtHeureD�but.HeureSaisie = "" And txtHeureFin.HeureSaisie <> "" Then
    If bMessage Then
      MsgBox2i "PL111"
      'MsgBox "L'heure de d�but et l'heure de fin de journ�e doivent �tre toutes deux renseign�es ou toutes deux laiss�es vides.", vbExclamation, sNomApp
      txtHeureFin.SetFocus
      AutoSelect txtHeureFin, True
    End If
    bCheckHeureFin = False
    Exit Function
  End If
  
  If txtHeureFin.HeureSaisie = "" Then
    bCheckHeureFin = True
    Exit Function
  End If
  
  If txtHeureD�but.HeureSaisie > txtHeureFin.HeureSaisie Then
    If bMessage Then
      MsgBox2i "PL112"
      'MsgBox "De retour avant d'�tre parti ?", vbExclamation, sNomApp
      txtHeureFin.SetFocus
      AutoSelect txtHeureFin, True
    End If
    bCheckHeureFin = False
    Exit Function
  End If
  
  If txtHeureFin.HeureSaisie - txtHeureD�but.HeureSaisie < 100 Then
    If bMessage Then
      MsgBox2i "PL113"
      'MsgBox "Information: Journ�e de moins d'une heure. Semaine de 3,5 heure ?" & vbCrLf & "V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
    End If
  End If

  bCheckHeureFin = True
End Function


Private Function bCheckNum(bMessage As Boolean, ctl As TextBox, iMax As Long, sMsg As String) As Boolean
  If ctl = "" Then bCheckNum = True: Exit Function
  If IsNumeric(ctl) Then
    If ctl >= 0 And ctl <= iMax And ctl = Int(ctl) Then
      bCheckNum = True
      Exit Function
    End If
  End If
    
  If bMessage Then
    MsgBox2i "CO003b", ctl.Text, 1, iMax
    ctl.SetFocus
  End If
End Function


Private Function bCheckKmD�but(bMessage As Boolean)
  If txtKmD�but = "" Then
    bCheckKmD�but = True
    Exit Function
  End If
  
  If Not bCheckNum(bMessage, txtKmD�but, 150000, "Le kilom�trage en d�but de journ�e") Then
    txtKmD�but.SetFocus
    AutoSelect txtKmD�but, True
    bCheckKmD�but = False
    Exit Function
  End If

  bCheckKmD�but = True
End Function

Private Function bCheckKmFin(bMessage As Boolean)
  If txtKmD�but <> "" And txtKmFin = "" Or txtKmD�but = "" And txtKmFin <> "" Then
    If bMessage Then
      MsgBox2i "PL114"
      'MsgBox "Le kilom�trage de d�but et de fin de journ�e doivent �tre tous deux renseign�s ou tous deux laiss�s vides.", vbExclamation, sNomApp
      txtKmFin.SetFocus
      AutoSelect txtKmFin, True
    End If
    bCheckKmFin = False
    Exit Function
  End If
  
  If txtKmFin = "" Then
    bCheckKmFin = True
    Exit Function
  End If
  
  If Not bCheckNum(bMessage, txtKmFin, 150000, "Le kilom�trage en fin de journ�e") Then
    txtKmFin.SetFocus
    AutoSelect txtKmFin, True
    bCheckKmFin = False
    Exit Function
  End If
  
  If CLng(txtKmD�but) > CLng(txtKmFin) Then
    If bMessage Then
      MsgBox2i "PL115"
      'MsgBox "Moins de kilom�tres en fin de tourn�e qu'en d�but de tourn�e ?", vbExclamation, sNomApp
      txtKmFin.SetFocus
      AutoSelect txtKmFin, True
    End If
    bCheckKmFin = False
    Exit Function
  End If
  
  If txtKmFin - txtKmD�but > 1500 Then
    If bMessage Then
      MsgBox2i "PL116"
      'MsgBox "Information: Tourn�e de plus de 1500 km." & vbCrLf & "V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
    End If
  End If

  If txtKmFin - txtKmD�but < 5 Then
    If bMessage Then
      MsgBox2i "PL117"
      'MsgBox "Information: Tourn�e de moins de 5 km." & vbCrLf & "V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
    End If
  End If

  bCheckKmFin = True
End Function



Private Sub btnAide_Click()
  Aide "frmmodpla"
End Sub

Private Sub btnAnnuler_Click()
  Set jo = Nothing
  Unload Me
End Sub

Private Function bCheckChevauchement() As Boolean
  Dim p As Intervention
  Dim i As Integer
  Dim bOk As Boolean
  
  bCheckChevauchement = True
  If txtHeureD�but.HeureSaisie = "" Then Exit Function
  
  For i = 1 To frmPlanning.colPlannings.count
    Set p = frmPlanning.colPlannings(i)
    If Not IsNull(p.pla_harrivee) Then
      If p.pla_harrivee < CInt(txtHeureD�but.HeureSaisie) Then
        MsgBox2i "PL118", p.pla_etb, p.etb_prefixe, p.etb_nom, strTime(p.pla_harrivee), strTime(p.pla_hdepart), strTime(CInt(txtHeureD�but.HeureSaisie))
        'MsgBox "Modification impossible, chevauchement d'heures !" & vbCrLf & vbCrLf & _
        '       "L'intervention sur l'�tablissement " & p.pla_etb & " " & p.etb_prefixe & " " & p.etb_nom & " de " & strTime(p.pla_harrivee) & " � " & strTime(p.pla_hdepart) & _
        '       " a commenc� avant le d�but de la tourn�e � " & strTime(CInt(txtHeureD�but.HeureSaisie)) & " !", _
        '    vbExclamation, sNomApp
        bCheckChevauchement = False
        Exit Function
      End If
      If p.pla_hdepart > CInt(txtHeureFin.HeureSaisie) Then
        MsgBox2i "PL119", p.pla_etb, p.etb_prefixe, p.etb_nom, strTime(p.pla_harrivee), strTime(p.pla_hdepart), strTime(CInt(txtHeureFin.HeureSaisie))
        'MsgBox "Modification impossible, chevauchement d'heures !" & vbCrLf & vbCrLf & _
        '       "L'intervention sur l'�tablissement " & p.pla_etb & " " & p.etb_prefixe & " " & p.etb_nom & " de " & strTime(p.pla_harrivee) & " � " & strTime(p.pla_hdepart) & _
        '       " s'est termin�e apr�s la fin de la tourn�e � " & strTime(CInt(txtHeureFin.HeureSaisie)) & " !", _
        '    vbExclamation, sNomApp
        bCheckChevauchement = False
        Exit Function
      End If
    End If
  Next
  
End Function

Private Sub btnOk_Click()
  ' Contr�le
  If Not bCheckHeureD�but(True) Then Exit Sub
  If Not bCheckHeureFin(True) Then Exit Sub
  If Not bCheckKmD�but(True) Then Exit Sub
  If Not bCheckKmFin(True) Then Exit Sub
  
  If Not bCheckChevauchement Then Exit Sub
  
  ' Mise � jour de la journ�e
  jo.iHeureD�but = VN(txtHeureD�but.HeureSaisie)
  jo.iHeureFin = VN(txtHeureFin.HeureSaisie)
  jo.iKmD�but = VN(txtKmD�but)
  jo.iKmFin = VN(txtKmFin)
  
  Unload Me
End Sub

Public Function bModifierPlanning(ByRef j As Journee) As Boolean
  Set jo = j
  Show vbModal
  bModifierPlanning = Not (jo Is Nothing)
End Function

Private Sub Form_Load()
  Internationalisation
  
  txtHeureD�but.HeureSaisie = jo.iHeureD�but
  txtHeureFin.HeureSaisie = jo.iHeureFin
  txtKmD�but = NV(jo.iKmD�but)
  txtKmFin = NV(jo.iKmFin)
  
  AutoSelect txtHeureD�but, True
End Sub


Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub

Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  If TypeOf ActiveControl Is TextBox Or TypeOf ActiveControl Is ChampHeure Then AutoSelect ActiveControl
End Sub

Private Sub txtHeureD�but_GotFocus(): GotFocus: End Sub
Private Sub txtHeureFin_GotFocus(): GotFocus: End Sub
Private Sub txtKmD�but_GotFocus(): GotFocus: End Sub
Private Sub txtKmFin_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub




' ============================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "MPCaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  SetLib lblHeure, "Caption", "MPlblHeure"
  SetLib txtHeureD�but, "Tag", "MPtxtHeureD�but.tag"
  SetLib txtHeureFin, "Tag", "MPtxtHeureFin.tag"
  SetLib lblKm, "Caption", "MPlblKm"
  SetLib txtKmD�but, "Tag", "MPtxtKmD�but.tag"
  SetLib txtKmFin, "Tag", "MPtxtKmFin.tag"
  SetLib lblD�butTourn�e, "Caption", "MPlblD�butTourn�e"
  SetLib lblFinTourn�e, "Caption", "MPlblFinTourn�e"
  
End Sub
