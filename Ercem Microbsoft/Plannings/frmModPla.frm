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
   Begin VB.TextBox txtKmDébut 
      Height          =   315
      Left            =   1380
      TabIndex        =   6
      Tag             =   "Kilométrage au début de tournée"
      Top             =   900
      Width           =   1035
   End
   Begin VB.TextBox txtKmFin 
      Height          =   315
      Left            =   2460
      TabIndex        =   7
      Tag             =   "Kilométrage en fin de tournée"
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
   Begin Plannings.ChampHeure txtHeureDébut 
      Height          =   315
      Left            =   1380
      TabIndex        =   3
      Tag             =   "Heure de départ de l'assistant"
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
      Tag             =   "Heure de rentrée de l'assistant"
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
   Begin VB.Label lblFinTournée 
      Alignment       =   2  'Center
      Caption         =   "Fin de tournée"
      Height          =   450
      Left            =   2520
      TabIndex        =   1
      Tag             =   "324"
      Top             =   60
      Width           =   900
   End
   Begin VB.Label lblDébutTournée 
      Alignment       =   2  'Center
      Caption         =   "Début de tournée"
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
      Caption         =   "Kilométrage :"
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


Private Function bCheckHeureDébut(bMessage As Boolean)
  If txtHeureDébut.HeureSaisie = "ERR" Then
    If bMessage Then
      MsgBox2i "CO004", txtHeureDébut
      'MsgBox "Heure de début de journée invalide.", vbExclamation, sNomApp
      bCheckHeureDébut = False
      txtHeureDébut.SetFocus
      AutoSelect txtHeureDébut, True
    End If
    Exit Function
  End If

  bCheckHeureDébut = True
End Function


Private Function bCheckHeureFin(bMessage As Boolean)
  If txtHeureFin.HeureSaisie = "ERR" Then
    If bMessage Then
      MsgBox2i "CO004", txtHeureFin
      'MsgBox "Heure de fin de journée invalide.", vbExclamation, sNomApp
      txtHeureFin.SetFocus
      AutoSelect txtHeureFin, True
    End If
    bCheckHeureFin = False
    Exit Function
  End If
  
  If txtHeureDébut.HeureSaisie <> "" And txtHeureFin.HeureSaisie = "" Or txtHeureDébut.HeureSaisie = "" And txtHeureFin.HeureSaisie <> "" Then
    If bMessage Then
      MsgBox2i "PL111"
      'MsgBox "L'heure de début et l'heure de fin de journée doivent être toutes deux renseignées ou toutes deux laissées vides.", vbExclamation, sNomApp
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
  
  If txtHeureDébut.HeureSaisie > txtHeureFin.HeureSaisie Then
    If bMessage Then
      MsgBox2i "PL112"
      'MsgBox "De retour avant d'être parti ?", vbExclamation, sNomApp
      txtHeureFin.SetFocus
      AutoSelect txtHeureFin, True
    End If
    bCheckHeureFin = False
    Exit Function
  End If
  
  If txtHeureFin.HeureSaisie - txtHeureDébut.HeureSaisie < 100 Then
    If bMessage Then
      MsgBox2i "PL113"
      'MsgBox "Information: Journée de moins d'une heure. Semaine de 3,5 heure ?" & vbCrLf & "Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
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


Private Function bCheckKmDébut(bMessage As Boolean)
  If txtKmDébut = "" Then
    bCheckKmDébut = True
    Exit Function
  End If
  
  If Not bCheckNum(bMessage, txtKmDébut, 150000, "Le kilométrage en début de journée") Then
    txtKmDébut.SetFocus
    AutoSelect txtKmDébut, True
    bCheckKmDébut = False
    Exit Function
  End If

  bCheckKmDébut = True
End Function

Private Function bCheckKmFin(bMessage As Boolean)
  If txtKmDébut <> "" And txtKmFin = "" Or txtKmDébut = "" And txtKmFin <> "" Then
    If bMessage Then
      MsgBox2i "PL114"
      'MsgBox "Le kilométrage de début et de fin de journée doivent être tous deux renseignés ou tous deux laissés vides.", vbExclamation, sNomApp
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
  
  If Not bCheckNum(bMessage, txtKmFin, 150000, "Le kilométrage en fin de journée") Then
    txtKmFin.SetFocus
    AutoSelect txtKmFin, True
    bCheckKmFin = False
    Exit Function
  End If
  
  If CLng(txtKmDébut) > CLng(txtKmFin) Then
    If bMessage Then
      MsgBox2i "PL115"
      'MsgBox "Moins de kilomètres en fin de tournée qu'en début de tournée ?", vbExclamation, sNomApp
      txtKmFin.SetFocus
      AutoSelect txtKmFin, True
    End If
    bCheckKmFin = False
    Exit Function
  End If
  
  If txtKmFin - txtKmDébut > 1500 Then
    If bMessage Then
      MsgBox2i "PL116"
      'MsgBox "Information: Tournée de plus de 1500 km." & vbCrLf & "Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
    End If
  End If

  If txtKmFin - txtKmDébut < 5 Then
    If bMessage Then
      MsgBox2i "PL117"
      'MsgBox "Information: Tournée de moins de 5 km." & vbCrLf & "Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
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
  If txtHeureDébut.HeureSaisie = "" Then Exit Function
  
  For i = 1 To frmPlanning.colPlannings.count
    Set p = frmPlanning.colPlannings(i)
    If Not IsNull(p.pla_harrivee) Then
      If p.pla_harrivee < CInt(txtHeureDébut.HeureSaisie) Then
        MsgBox2i "PL118", p.pla_etb, p.etb_prefixe, p.etb_nom, strTime(p.pla_harrivee), strTime(p.pla_hdepart), strTime(CInt(txtHeureDébut.HeureSaisie))
        'MsgBox "Modification impossible, chevauchement d'heures !" & vbCrLf & vbCrLf & _
        '       "L'intervention sur l'établissement " & p.pla_etb & " " & p.etb_prefixe & " " & p.etb_nom & " de " & strTime(p.pla_harrivee) & " à " & strTime(p.pla_hdepart) & _
        '       " a commencé avant le début de la tournée à " & strTime(CInt(txtHeureDébut.HeureSaisie)) & " !", _
        '    vbExclamation, sNomApp
        bCheckChevauchement = False
        Exit Function
      End If
      If p.pla_hdepart > CInt(txtHeureFin.HeureSaisie) Then
        MsgBox2i "PL119", p.pla_etb, p.etb_prefixe, p.etb_nom, strTime(p.pla_harrivee), strTime(p.pla_hdepart), strTime(CInt(txtHeureFin.HeureSaisie))
        'MsgBox "Modification impossible, chevauchement d'heures !" & vbCrLf & vbCrLf & _
        '       "L'intervention sur l'établissement " & p.pla_etb & " " & p.etb_prefixe & " " & p.etb_nom & " de " & strTime(p.pla_harrivee) & " à " & strTime(p.pla_hdepart) & _
        '       " s'est terminée après la fin de la tournée à " & strTime(CInt(txtHeureFin.HeureSaisie)) & " !", _
        '    vbExclamation, sNomApp
        bCheckChevauchement = False
        Exit Function
      End If
    End If
  Next
  
End Function

Private Sub btnOk_Click()
  ' Contrôle
  If Not bCheckHeureDébut(True) Then Exit Sub
  If Not bCheckHeureFin(True) Then Exit Sub
  If Not bCheckKmDébut(True) Then Exit Sub
  If Not bCheckKmFin(True) Then Exit Sub
  
  If Not bCheckChevauchement Then Exit Sub
  
  ' Mise à jour de la journée
  jo.iHeureDébut = VN(txtHeureDébut.HeureSaisie)
  jo.iHeureFin = VN(txtHeureFin.HeureSaisie)
  jo.iKmDébut = VN(txtKmDébut)
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
  
  txtHeureDébut.HeureSaisie = jo.iHeureDébut
  txtHeureFin.HeureSaisie = jo.iHeureFin
  txtKmDébut = NV(jo.iKmDébut)
  txtKmFin = NV(jo.iKmFin)
  
  AutoSelect txtHeureDébut, True
End Sub


Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub

Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  If TypeOf ActiveControl Is TextBox Or TypeOf ActiveControl Is ChampHeure Then AutoSelect ActiveControl
End Sub

Private Sub txtHeureDébut_GotFocus(): GotFocus: End Sub
Private Sub txtHeureFin_GotFocus(): GotFocus: End Sub
Private Sub txtKmDébut_GotFocus(): GotFocus: End Sub
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
  SetLib txtHeureDébut, "Tag", "MPtxtHeureDébut.tag"
  SetLib txtHeureFin, "Tag", "MPtxtHeureFin.tag"
  SetLib lblKm, "Caption", "MPlblKm"
  SetLib txtKmDébut, "Tag", "MPtxtKmDébut.tag"
  SetLib txtKmFin, "Tag", "MPtxtKmFin.tag"
  SetLib lblDébutTournée, "Caption", "MPlblDébutTournée"
  SetLib lblFinTournée, "Caption", "MPlblFinTournée"
  
End Sub
