VERSION 5.00
Begin VB.Form frmRenum 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Renum�rotation d'une s�quence de fichiers"
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
   Begin VB.TextBox txtPr�fixeApr�s 
      Height          =   315
      Left            =   5880
      TabIndex        =   9
      Top             =   840
      Width           =   2535
   End
   Begin VB.TextBox txtSuffixeApr�s 
      Height          =   315
      Left            =   5880
      TabIndex        =   11
      Top             =   1260
      Width           =   2535
   End
   Begin VB.TextBox txtNumFinApr�s 
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
      Caption         =   "Renum�rotation"
      Default         =   -1  'True
      Height          =   435
      Left            =   60
      TabIndex        =   22
      Top             =   3000
      Width           =   1395
   End
   Begin VB.TextBox txtNumD�butApr�s 
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
   Begin VB.TextBox txtNumD�butAvant 
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
   Begin VB.TextBox txtPr�fixeAvant 
      Height          =   315
      Left            =   1560
      TabIndex        =   4
      Top             =   840
      Width           =   2535
   End
   Begin VB.Label lblOp�ration 
      BorderStyle     =   1  'Fixed Single
      Height          =   435
      Left            =   1560
      TabIndex        =   23
      Top             =   3000
      Width           =   6855
   End
   Begin VB.Label lblApr�s 
      AutoSize        =   -1  'True
      Caption         =   "Apr�s renum�rotation :"
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
      Caption         =   "Pr�fixe :"
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
      Caption         =   "N� d�but s�quence :"
      Height          =   195
      Left            =   4380
      TabIndex        =   16
      Top             =   1740
      Width           =   1470
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      Caption         =   "N� fin s�quence :"
      Height          =   195
      Left            =   4380
      TabIndex        =   18
      Top             =   2160
      Width           =   1230
   End
   Begin VB.Label lblAvant 
      AutoSize        =   -1  'True
      Caption         =   "Avant renum�rotation :"
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
      Caption         =   "N� fin s�quence :"
      Height          =   195
      Left            =   60
      TabIndex        =   14
      Top             =   2160
      Width           =   1230
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "N� d�but s�quence :"
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
      Caption         =   "Pr�fixe :"
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
' Renum�rote une s�quence cons�cutive de fichiers
' 27/07/03 PV
'  5/08/03 PV   Bugs de calcul de num de fin de s�quence
' 23/03/05 PV   Gestion d'une s�rie avec des trous dans la num�rotation


Option Explicit

Dim iNumD�butAvant As Integer, iNumFinAvant As Integer
Dim iNumD�butApr�s As Integer
Dim iNbCh As Integer
Dim iDelta As Integer

Private Sub btnRenum_Click()
  If Not MajOp�ration Then     ' On recalcule les variables globales
    MsgBox "Saisissez les n�s de s�quence avant de lancer la renum�rotation.", vbExclamation
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
  
  If iNumD�butAvant < 1 Or iNumD�butAvant > iNumFinAvant Then
    MsgBox "N� d�but avant renum >=1 et <=N� fin", vbExclamation
    Exit Sub
  End If
  
  If iDelta = 0 And txtPr�fixeAvant.Text = txtPr�fixeApr�s.Text And txtSuffixeAvant.Text = txtSuffixeApr�s.Text Then
    MsgBox "Rien � renum�roter (N� d�but avant = n� d�but apr�s, pr�fixe avant=pr�fixe apr�s, suffixe avant=suffixe apr�s)", vbExclamation
    Exit Sub
  End If
  
  ' On v�rifie que les fichiers source existent
  Dim i As Integer
  Dim sNomfic As String
  For i = iNumD�butAvant To iNumFinAvant
    sNomfic = txtPr�fixeAvant.Text & Format(i, String(iNbCh, "0")) & txtSuffixeAvant.Text
    If Dir(sNomfic) = "" And (i = iNumD�butAvant Or i = iNumFinAvant) Then
      MsgBox "Fichier " & sNomfic & " de la s�quence inexistant, pas de renum�rotation (le premier et le dernier fichier de la s�quence doivent exister).", vbExclamation
      Exit Sub
    End If
  Next
  
  ' On v�rifie qu'il y a un trou avant apropri�
  For i = iNumD�butAvant + iDelta To iNumFinAvant + iDelta
    ' On ne teste qu'en dehors de la plage renum�rot�e
    If i < iNumD�butAvant Or i > iNumFinAvant Then
      sNomfic = txtPr�fixeApr�s.Text & Format(i, String(iNbCh, "0")) & txtSuffixeApr�s.Text
      If Dir(sNomfic) <> "" Then
        MsgBox "Le fichier " & sNomfic & " existe et emp�che la renum�rotation"
        Exit Sub
      End If
    End If
  Next
  
  Dim sAncienNom As String, sNouveauNom As String
  
  ' Tout est Ok, on peut renum�roter
  Dim i2 As Integer
  If iDelta > 0 Then
    ' On renum�rote en partant de la fin
    i2 = iNumFinAvant + iDelta
    For i = iNumFinAvant To iNumD�butAvant Step -1
      sAncienNom = txtPr�fixeAvant.Text & Format(i, String(iNbCh, "0")) & txtSuffixeAvant.Text
      If Dir(sAncienNom) <> "" Then
        sNouveauNom = txtPr�fixeApr�s.Text & Format(i2, String(iNbCh, "0")) & txtSuffixeApr�s.Text
        Name sAncienNom As sNouveauNom
        Debug.Print sAncienNom & " -> " & sNouveauNom
        i2 = i2 - 1
      End If
    Next
  Else
    ' On renum�rote en partant du d�but
    i2 = iNumD�butAvant + iDelta
    For i = iNumD�butAvant To iNumFinAvant
      sAncienNom = txtPr�fixeAvant.Text & Format(i, String(iNbCh, "0")) & txtSuffixeAvant.Text
      If Dir(sAncienNom) <> "" Then
        sNouveauNom = txtPr�fixeApr�s.Text & Format(i2, String(iNbCh, "0")) & txtSuffixeApr�s.Text
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
  MajOp�ration
End Sub

Private Sub txtNumD�butAvant_Change()
  MajOp�ration
End Sub

Private Sub txtNumFinAvant_Change()
  MajOp�ration
End Sub

Private Sub txtPr�fixeApr�s_Change()
  MajOp�ration
End Sub

Private Sub txtSuffixeApr�s_Change()
  MajOp�ration
End Sub

Private Sub txtSuffixeAvant_Change()
  txtSuffixeApr�s.Text = txtSuffixeAvant.Text
  MajOp�ration
End Sub

Private Sub txtPr�fixeAvant_Change()
  txtPr�fixeApr�s.Text = txtPr�fixeAvant.Text
  MajOp�ration
End Sub

Private Sub txtNumD�butApr�s_Change()
  MajOp�ration
End Sub

Function MajOp�ration() As Boolean
  Dim iNumFinApr�s As Integer
  
  txtNumFinApr�s.Text = CStr(Val(txtNumFinAvant.Text) + Val(txtNumD�butApr�s.Text) - Val(txtNumD�butAvant.Text))
  
  iNumD�butAvant = Val(txtNumD�butAvant.Text)     ' 80
  iNumD�butApr�s = Val(txtNumD�butApr�s.Text)     ' 85
  iNumFinAvant = Val(txtNumFinAvant.Text)         ' 90
  iNumFinApr�s = Val(txtNumFinApr�s.Text)         ' 95
  iNbCh = Val(txtNbChiffres.Text)                 ' 3
  iDelta = iNumD�butApr�s - iNumD�butAvant        ' 5
  
  If txtNumD�butAvant.Text = "" Or txtNumFinAvant.Text = "" Or txtNumD�butApr�s.Text = "" Then
    lblOp�ration.Caption = ""
    MajOp�ration = False
  Else
    lblOp�ration.Caption = "Transformation des fichiers " & txtPr�fixeAvant.Text & Format(iNumD�butAvant, String(iNbCh, "0")) & txtSuffixeAvant.Text & " ... " & txtPr�fixeAvant.Text & Format(iNumFinAvant, String(iNbCh, "0")) & txtSuffixeAvant.Text & "  en  " & _
      txtPr�fixeApr�s.Text & Format(iNumD�butApr�s, String(iNbCh, "0")) & txtSuffixeApr�s.Text & " ... " & txtPr�fixeApr�s.Text & Format(iNumFinApr�s, String(iNbCh, "0")) & txtSuffixeApr�s.Text
    MajOp�ration = True
  End If
End Function
