VERSION 5.00
Begin VB.Form frmALire 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Résultats à lire"
   ClientHeight    =   5280
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8190
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5280
   ScaleWidth      =   8190
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnAnalyse2 
      Caption         =   "Analyse 2"
      Height          =   495
      Left            =   5700
      TabIndex        =   1
      Top             =   1440
      Width           =   1215
   End
   Begin VB.CommandButton btnAnalyse1 
      Caption         =   "Analyse 1"
      Height          =   495
      Left            =   5700
      TabIndex        =   0
      Top             =   660
      Width           =   1215
   End
End
Attribute VB_Name = "frmALire"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmALire
' Détermine les résultats à lire des étuves
' 18/04/1999 PV

Option Explicit

Private Sub btnAnalyse1_Click()
  Dim cH4H5 As New BDCurseur
  
  ' On détermine les séries
  Dim sSQL As String
  sSQL = "select ser_numserie,ser_superserie,ser_dh,weekday(ser_dh) as ser_js,evt_evenement,evt_milieu,evt_ts,evt_info1,evt_info2,evt_info3 " & _
         "from c_serielabo,c_evenement " & _
         "where evt_serielabo=ser_numserie and ser_dh between today-7 and today and evt_evenement in(""H4"", ""H5"")"
  Screen.MousePointer = vbHourglass
  Dim t, iNbRec As Integer
  t = Timer
  cH4H5.OpenCurseur sSQL
  While Not cH4H5.EOF
    iNbRec = iNbRec + 1
    If iNbRec < 10 Then
      Print cH4H5!ser_numserie, cH4H5!ser_superserie, cH4H5!ser_dh, cH4H5!ser_js, cH4H5!evt_evenement, cH4H5!evt_milieu, cH4H5!evt_ts, cH4H5!evt_info1, cH4H5!evt_info2, cH4H5!evt_info3
    End If
    cH4H5.MoveNext
  Wend
  Print "Position: "; cH4H5.AbsolutePosition
  cH4H5.CloseCurseur
  t = Timer - t
  Screen.MousePointer = vbDefault
  Print "Durée: "; t
End Sub

Private Sub btnAnalyse2_Click()
  Dim cH4 As New BDCurseur
  
  ' On détermine les séries avec H4 sans H5
  Dim sSQL As String
  sSQL = "select weekday(ser_dh) as ser_js,ser_superserie,evt_milieu,min(evt_ts) as evt_tsmin, max(evt_ts) as evt_tsmax,evt_info1,evt_info2 " & _
         "from c_serielabo,c_evenement " & _
         "where evt_serielabo=ser_numserie and ser_dh between today-7 and today and evt_evenement=""H4"" " & _
         "and ser_numserie||evt_milieu not in (select ser_numserie||evt_milieu from c_serielabo, c_evenement where evt_serielabo=ser_numserie and ser_dh between today-7 and today and evt_evenement=""H5"") " & _
         "group by 1,2,3,6,7 order by 1,2,3"

  Screen.MousePointer = vbHourglass
  Dim t, iNbRec As Integer
  t = Timer
  cH4.OpenCurseur sSQL
  While Not cH4.EOF
    iNbRec = iNbRec + 1
    If iNbRec < 10 Then
      Print cH4!ser_js, cH4!ser_superserie, cH4!evt_milieu, cH4!evt_tsmin, cH4!evt_tsmax, cH4!evt_info1, cH4!evt_info2
    End If
    cH4.MoveNext
  Wend
  Print "Position: "; iNbRec
  cH4.CloseCurseur
  t = Timer - t
  Screen.MousePointer = vbDefault
  Print "Durée: "; t
End Sub
