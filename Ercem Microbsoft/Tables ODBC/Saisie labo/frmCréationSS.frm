VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmSuperSérie 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Séries du jour"
   ClientHeight    =   3735
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
   Icon            =   "frmCréationSS.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3735
   ScaleWidth      =   8190
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnChanger 
      Caption         =   "&Changer de supersérie"
      Height          =   375
      Left            =   60
      TabIndex        =   1
      Top             =   3300
      Width           =   2415
   End
   Begin MSComctlLib.ListView lvSéries 
      Height          =   3195
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   8055
      _ExtentX        =   14208
      _ExtentY        =   5636
      View            =   3
      LabelEdit       =   1
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Série"
         Object.Width           =   1455
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "H2"
         Object.Width           =   3969
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Technicienne"
         Object.Width           =   3969
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "SuperSérie"
         Object.Width           =   38100
      EndProperty
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "&Fermer"
      Height          =   375
      Left            =   2580
      TabIndex        =   2
      Top             =   3300
      Width           =   1455
   End
End
Attribute VB_Name = "frmSuperSérie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmSuperSérie
' Modification du rattachement d'une série à une supersérie
' 12/08/1998 PV Prototype
' 24/08/1998 PV Implantation complète
'  3/09/1998 PV Fin du mécanisme d'origine, feuille transformée en éditeur de rattachement
' 22/04/1999 PV MultiRowSelect


Option Explicit

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnChanger_Click()
  If Not lvSéries.SelectedItem Is Nothing Then
    Dim sNouvelleSS As String
    sNouvelleSS = InputBox("Nouveau n° de supersérie ?" & vbCrLf & vbCrLf & "ATTENTION - Ne pas utiliser si l'événement H3 a déjà été enregistré pour la supersérie.", app.Title, lvSéries.SelectedItem.SubItems(3))
    If sNouvelleSS = "" Then Exit Sub
    If Not bCheckNoSS(sNouvelleSS) Then Exit Sub
    
    Dim l As ListItem
    For Each l In lvSéries.ListItems
      If l.Selected Then
        l.SubItems(3) = sNouvelleSS
        RattacheSérie l.Text, sNouvelleSS
      End If
    Next
  End If
End Sub


Private Sub Form_Load()
  Show
  Screen.MousePointer = vbHourglass
  SetStatus "Recherche des séries en cours, patientez…"
  
  Dim cSer As New BDCurseur
  'cSer.OpenCurseur "select ser_numserie, ser_dh,uti_nom,ser_dh-current from c_serielabo, utilisateur where uti_numuti=ser_numtech and current-ser_dh<interval(3) hour to hour"
  cSer.OpenCurseur "select ser_numserie,ser_superserie,c_evenement.timestamp dh,uti_nom" & _
    " from c_serielabo, utilisateur, c_evenement" & _
    " where uti_numuti = ser_numtech and evt_date=today" & _
    " and evt_serielabo=ser_numserie and evt_evenement=""H2"" order by 3"
  While Not cSer.EOF
    Dim X As ListItem
    Set X = lvSéries.ListItems.Add
    X.Text = cSer!ser_numserie
    X.SubItems(1) = cSer!dh
    X.SubItems(2) = cSer!uti_nom
    X.SubItems(3) = cSer!ser_superserie
    cSer.MoveNext
  Wend
  cSer.CloseCurseur
  AjusteListView Me, lvSéries
  
  Screen.MousePointer = vbDefault
  SetStatus
End Sub


Private Sub lvSéries_DblClick()
  btnChanger_Click
End Sub
