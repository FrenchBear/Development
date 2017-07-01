VERSION 5.00
Begin VB.Form frmRenum 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Renumérotation d'une séquence de fichiers"
   ClientHeight    =   3510
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8520
   Icon            =   "frmRenum.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3510
   ScaleWidth      =   8520
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtPréfixeAprès 
      Height          =   315
      Left            =   5880
      TabIndex        =   9
      Top             =   840
      Width           =   2535
   End
   Begin VB.TextBox txtSuffixeAprès 
      Height          =   315
      Left            =   5880
      TabIndex        =   11
      Top             =   1260
      Width           =   2535
   End
   Begin VB.TextBox txtNumFinAprès 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   5880
      Locked          =   -1  'True
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   2100
      Width           =   675
   End
   Begin VB.CommandButton btnRenum 
      Caption         =   "Renumérotation"
      Default         =   -1  'True
      Height          =   435
      Left            =   60
      TabIndex        =   22
      Top             =   3000
      Width           =   1395
   End
   Begin VB.TextBox txtNumDébutAprès 
      Height          =   315
      Left            =   5880
      TabIndex        =   17
      Top             =   1680
      Width           =   675
   End
   Begin VB.TextBox txtNumFinAvant 
      Height          =   315
      Left            =   1560
      TabIndex        =   15
      Top             =   2100
      Width           =   675
   End
   Begin VB.TextBox txtNumDébutAvant 
      Height          =   315
      Left            =   1560
      TabIndex        =   13
      Top             =   1680
      Width           =   675
   End
   Begin VB.TextBox txtNbChiffres 
      Height          =   315
      Left            =   1560
      TabIndex        =   21
      Top             =   2520
      Width           =   675
   End
   Begin VB.TextBox txtSuffixeAvant 
      Height          =   315
      Left            =   1560
      TabIndex        =   6
      Top             =   1260
      Width           =   2535
   End
   Begin VB.TextBox txtDossier 
      Height          =   315
      Left            =   1560
      TabIndex        =   1
      Top             =   120
      Width           =   6855
   End
   Begin VB.TextBox txtPréfixeAvant 
      Height          =   315
      Left            =   1560
      TabIndex        =   4
      Top             =   840
      Width           =   2535
   End
   Begin VB.Label lblOpération 
      BorderStyle     =   1  'Fixed Single
      Height          =   435
      Left            =   1560
      TabIndex        =   23
      Top             =   3000
      Width           =   6855
   End
   Begin VB.Label lblAprès 
      AutoSize        =   -1  'True
      Caption         =   "Après renumérotation :"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   4380
      TabIndex        =   7
      Top             =   600
      Width           =   1935
   End
   Begin VB.Label Label13 
      AutoSize        =   -1  'True
      Caption         =   "Préfixe :"
      Height          =   195
      Left            =   4380
      TabIndex        =   8
      Top             =   900
      Width           =   570
   End
   Begin VB.Label Label12 
      AutoSize        =   -1  'True
      Caption         =   "Suffixe :"
      Height          =   195
      Left            =   4380
      TabIndex        =   10
      Top             =   1320
      Width           =   570
   End
   Begin VB.Label Label10 
      AutoSize        =   -1  'True
      Caption         =   "N° début séquence :"
      Height          =   195
      Left            =   4380
      TabIndex        =   16
      Top             =   1740
      Width           =   1470
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      Caption         =   "N° fin séquence :"
      Height          =   195
      Left            =   4380
      TabIndex        =   18
      Top             =   2160
      Width           =   1230
   End
   Begin VB.Label lblAvant 
      AutoSize        =   -1  'True
      Caption         =   "Avant renumérotation :"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   60
      TabIndex        =   2
      Top             =   600
      Width           =   1950
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "N° fin séquence :"
      Height          =   195
      Left            =   60
      TabIndex        =   14
      Top             =   2160
      Width           =   1230
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "N° début séquence :"
      Height          =   195
      Left            =   60
      TabIndex        =   12
      Top             =   1740
      Width           =   1470
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Nb chiffres :"
      Height          =   195
      Left            =   60
      TabIndex        =   20
      Top             =   2580
      Width           =   855
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Suffixe :"
      Height          =   195
      Left            =   60
      TabIndex        =   5
      Top             =   1320
      Width           =   570
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Dossier :"
      Height          =   195
      Left            =   60
      TabIndex        =   0
      Top             =   180
      Width           =   615
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Préfixe :"
      Height          =   195
      Left            =   60
      TabIndex        =   3
      Top             =   900
      Width           =   570
   End
End
Attribute VB_Name = "frmRenum"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Renumérote une séquence consécutive de fichiers
' 27/07/03 PV
'  5/08/03 PV   Bugs de calcul de num de fin de séquence
' 23/03/05 PV   Gestion d'une série avec des trous dans la numérotation


Option Explicit

Dim iNumDébutAvant As Integer, iNumFinAvant As Integer
Dim iNumDébutAprès As Integer
Dim iNbCh As Integer
Dim iDelta As Integer

Private Sub btnRenum_Click()
  If Not MajOpération Then     ' On recalcule les variables globales
    MsgBox "Saisissez les n°s de séquence avant de lancer la renumérotation.", vbExclamation
    Exit Sub
  End If
  
  On Error Resume Next
  ChDrive txtDossier
  If Err <> 0 Then
    MsgBox "Disque invalide dans le dossier (doit commencer par C: par exemple).", vbExclamation
    Exit Sub
  End If
  
  ChDir txtDossier
  If Err <> 0 Then
    MsgBox "Dossier invalide ou inexistant.", vbExclamation
    Exit Sub
  End If
  
  On Error GoTo 0
  
  If iNbCh < 2 Or iNbCh > 5 Then
    MsgBox "Nb de chiffres entre 2 et 5 SVP !", vbExclamation
    Exit Sub
  End If
  
  If iNumDébutAvant < 1 Or iNumDébutAvant > iNumFinAvant Then
    MsgBox "N° début avant renum >=1 et <=N° fin", vbExclamation
    Exit Sub
  End If
  
  If iDelta = 0 And txtPréfixeAvant.Text = txtPréfixeAprès.Text And txtSuffixeAvant.Text = txtSuffixeAprès.Text Then
    MsgBox "Rien à renuméroter (N° début avant = n° début après, préfixe avant=préfixe après, suffixe avant=suffixe après)", vbExclamation
    Exit Sub
  End If
  
  ' On vérifie que les fichiers source existent
  Dim i As Integer
  Dim sNomfic As String
  For i = iNumDébutAvant To iNumFinAvant
    sNomfic = txtPréfixeAvant.Text & Format(i, String(iNbCh, "0")) & txtSuffixeAvant.Text
    If Dir(sNomfic) = "" And (i = iNumDébutAvant Or i = iNumFinAvant) Then
      MsgBox "Fichier " & sNomfic & " de la séquence inexistant, pas de renumérotation (le premier et le dernier fichier de la séquence doivent exister).", vbExclamation
      Exit Sub
    End If
  Next
  
  ' On vérifie qu'il y a un trou avant aproprié
  For i = iNumDébutAvant + iDelta To iNumFinAvant + iDelta
    ' On ne teste qu'en dehors de la plage renumérotée
    If i < iNumDébutAvant Or i > iNumFinAvant Then
      sNomfic = txtPréfixeAprès.Text & Format(i, String(iNbCh, "0")) & txtSuffixeAprès.Text
      If Dir(sNomfic) <> "" Then
        MsgBox "Le fichier " & sNomfic & " existe et empêche la renumérotation"
        Exit Sub
      End If
    End If
  Next
  
  Dim sAncienNom As String, sNouveauNom As String
  
  ' Tout est Ok, on peut renuméroter
  Dim i2 As Integer
  If iDelta > 0 Then
    ' On renumérote en partant de la fin
    i2 = iNumFinAvant + iDelta
    For i = iNumFinAvant To iNumDébutAvant Step -1
      sAncienNom = txtPréfixeAvant.Text & Format(i, String(iNbCh, "0")) & txtSuffixeAvant.Text
      If Dir(sAncienNom) <> "" Then
        sNouveauNom = txtPréfixeAprès.Text & Format(i2, String(iNbCh, "0")) & txtSuffixeAprès.Text
        Name sAncienNom As sNouveauNom
        Debug.Print sAncienNom & " -> " & sNouveauNom
        i2 = i2 - 1
      End If
    Next
  Else
    ' On renumérote en partant du début
    i2 = iNumDébutAvant + iDelta
    For i = iNumDébutAvant To iNumFinAvant
      sAncienNom = txtPréfixeAvant.Text & Format(i, String(iNbCh, "0")) & txtSuffixeAvant.Text
      If Dir(sAncienNom) <> "" Then
        sNouveauNom = txtPréfixeAprès.Text & Format(i2, String(iNbCh, "0")) & txtSuffixeAprès.Text
        Name sAncienNom As sNouveauNom
        Debug.Print sAncienNom & " -> " & sNouveauNom
        i2 = i2 + 1
      End If
    Next
  End If
  
End Sub

Private Sub Form_Load()
  txtSuffixeAvant.Text = ".jpg"
End Sub

Private Sub txtNbChiffres_Change()
  MajOpération
End Sub

Private Sub txtNumDébutAvant_Change()
  MajOpération
End Sub

Private Sub txtNumFinAvant_Change()
  MajOpération
End Sub

Private Sub txtPréfixeAprès_Change()
  MajOpération
End Sub

Private Sub txtSuffixeAprès_Change()
  MajOpération
End Sub

Private Sub txtSuffixeAvant_Change()
  txtSuffixeAprès.Text = txtSuffixeAvant.Text
  MajOpération
End Sub

Private Sub txtPréfixeAvant_Change()
  txtPréfixeAprès.Text = txtPréfixeAvant.Text
  MajOpération
End Sub

Private Sub txtNumDébutAprès_Change()
  MajOpération
End Sub

Function MajOpération() As Boolean
  Dim iNumFinAprès As Integer
  
  txtNumFinAprès.Text = CStr(Val(txtNumFinAvant.Text) + Val(txtNumDébutAprès.Text) - Val(txtNumDébutAvant.Text))
  
  iNumDébutAvant = Val(txtNumDébutAvant.Text)     ' 80
  iNumDébutAprès = Val(txtNumDébutAprès.Text)     ' 85
  iNumFinAvant = Val(txtNumFinAvant.Text)         ' 90
  iNumFinAprès = Val(txtNumFinAprès.Text)         ' 95
  iNbCh = Val(txtNbChiffres.Text)                 ' 3
  iDelta = iNumDébutAprès - iNumDébutAvant        ' 5
  
  If txtNumDébutAvant.Text = "" Or txtNumFinAvant.Text = "" Or txtNumDébutAprès.Text = "" Then
    lblOpération.Caption = ""
    MajOpération = False
  Else
    lblOpération.Caption = "Transformation des fichiers " & txtPréfixeAvant.Text & Format(iNumDébutAvant, String(iNbCh, "0")) & txtSuffixeAvant.Text & " ... " & txtPréfixeAvant.Text & Format(iNumFinAvant, String(iNbCh, "0")) & txtSuffixeAvant.Text & "  en  " & _
      txtPréfixeAprès.Text & Format(iNumDébutAprès, String(iNbCh, "0")) & txtSuffixeAprès.Text & " ... " & txtPréfixeAprès.Text & Format(iNumFinAprès, String(iNbCh, "0")) & txtSuffixeAprès.Text
    MajOpération = True
  End If
End Function
