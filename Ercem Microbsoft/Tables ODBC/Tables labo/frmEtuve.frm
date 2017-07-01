VERSION 5.00
Begin VB.Form frmEtuve 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des �tuves"
   ClientHeight    =   4815
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8415
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmEtuve.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   321
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   561
   Tag             =   "Donn�es"
   Begin VB.TextBox txtChamp 
      DataField       =   "etu_dureeinc"
      Height          =   315
      Index           =   18
      Left            =   5400
      MaxLength       =   3
      TabIndex        =   32
      Tag             =   "Dur�e d'incubation dans cette �tuve (NUMERIQUE)"
      Top             =   3360
      Width           =   495
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etu_deltadureeinc"
      Height          =   315
      Index           =   17
      Left            =   6420
      MaxLength       =   2
      TabIndex        =   33
      Tag             =   "Tol�rance de la dur�e d'incubation dans cette �tuve (NUMERIQUE)"
      Top             =   3360
      Width           =   495
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etu_equipement"
      Height          =   315
      Index           =   16
      Left            =   5400
      MaxLength       =   10
      TabIndex        =   17
      Tag             =   "Equipement particulier de l'�tuve"
      Top             =   2280
      Width           =   1515
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etu_ssmax"
      Height          =   315
      Index           =   15
      Left            =   6420
      MaxLength       =   2
      TabIndex        =   27
      Tag             =   "N� de la derni�re supers�rie rang�e dans l'�tuve"
      Top             =   3000
      Width           =   495
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etu_ssmin"
      Height          =   315
      Index           =   13
      Left            =   5400
      MaxLength       =   2
      TabIndex        =   25
      Tag             =   "N� de la premi�re supers�rie rang�e dans l'�tuve"
      Top             =   3000
      Width           =   495
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etu_mam"
      Height          =   315
      Index           =   12
      Left            =   5400
      MaxLength       =   4
      TabIndex        =   21
      Tag             =   "Matin (M) ou apr�s-midi (AM)"
      Top             =   2640
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etu_jour"
      Height          =   315
      Index           =   11
      Left            =   1740
      MaxLength       =   7
      TabIndex        =   23
      Tag             =   "Jours de la semaine o� l'�tuve est utilis�e (lundi=1, �)"
      Top             =   3000
      Width           =   1575
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etu_type"
      Height          =   315
      Index           =   9
      Left            =   1740
      MaxLength       =   2
      TabIndex        =   19
      Tag             =   "Type de l'�tuve (R ou NR)"
      Top             =   2640
      Width           =   495
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etu_temps"
      Height          =   315
      Index           =   8
      Left            =   1740
      MaxLength       =   15
      TabIndex        =   29
      Tag             =   "Dur�e d'incubation dans cette �tuve (TEXTE LIBRE)"
      Top             =   3360
      Width           =   1875
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*etu_temp"
      Height          =   315
      Index           =   7
      Left            =   1740
      MaxLength       =   10
      TabIndex        =   15
      Tag             =   "Temp�rature de l'�tuve"
      Top             =   2280
      Width           =   1215
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*etu_germe"
      Height          =   315
      Index           =   6
      Left            =   1740
      MaxLength       =   30
      TabIndex        =   11
      Tag             =   "Germe stock� dans l'�tuve (texte libre)"
      Top             =   1560
      Width           =   3735
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*etu_capacite"
      Height          =   315
      Index           =   5
      Left            =   5400
      MaxLength       =   5
      TabIndex        =   9
      Tag             =   "Capacit� de l'�tuve"
      Top             =   1200
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*etu_marque"
      Height          =   315
      Index           =   4
      Left            =   1740
      MaxLength       =   15
      TabIndex        =   7
      Tag             =   "Marque de l'�tuve"
      Top             =   1200
      Width           =   1695
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etu_idmodif"
      Height          =   315
      Index           =   10
      Left            =   1740
      TabIndex        =   37
      Tag             =   "Origine de la modification"
      Top             =   4080
      Width           =   3750
   End
   Begin TablesLabo.BDCombo bdcMilieu 
      Height          =   330
      Left            =   1740
      TabIndex        =   13
      Tag             =   "Milieu stock� dans l'�tuve"
      Top             =   1920
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   582
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DataField       =   "etu_milieu"
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*etu_reference"
      Height          =   315
      Index           =   3
      Left            =   5400
      MaxLength       =   15
      TabIndex        =   5
      Tag             =   "R�f�rence de l'�tuve"
      Top             =   840
      Width           =   1875
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   1740
      TabIndex        =   39
      Tag             =   "Date+heure de derni�re modification de l'information"
      Top             =   4440
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etu_remarques"
      Height          =   315
      Index           =   2
      Left            =   1740
      TabIndex        =   35
      Tag             =   "Commentaire libre"
      Top             =   3720
      Width           =   5535
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*etu_numero"
      Height          =   315
      Index           =   1
      Left            =   1740
      TabIndex        =   3
      Tag             =   "N� de l'�tuve"
      Top             =   840
      Width           =   495
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*etu_serial"
      Height          =   315
      Index           =   0
      Left            =   1740
      TabIndex        =   1
      Tag             =   "N� interne de l'enregistrement dans la base de donn�es"
      Top             =   480
      Width           =   1035
   End
   Begin TablesLabo.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   40
      Top             =   0
      Width           =   8415
      _ExtentX        =   14843
      _ExtentY        =   767
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
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "DI :"
      Height          =   210
      Index           =   20
      Left            =   4320
      TabIndex        =   31
      Top             =   3420
      Width           =   345
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "h"
      Height          =   210
      Index           =   19
      Left            =   7020
      TabIndex        =   42
      Top             =   3420
      Width           =   120
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "h �"
      Height          =   210
      Index           =   18
      Left            =   6000
      TabIndex        =   41
      Top             =   3420
      Width           =   315
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "�"
      BeginProperty Font 
         Name            =   "Wingdings"
         Size            =   15.75
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   3900
      TabIndex        =   30
      Top             =   3360
      Width           =   330
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "�quipement :"
      Height          =   210
      Index           =   17
      Left            =   3840
      TabIndex        =   16
      Top             =   2340
      Width           =   1260
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "� :"
      Height          =   210
      Index           =   16
      Left            =   6120
      TabIndex        =   26
      Top             =   3060
      Width           =   255
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Supers�ries :"
      Height          =   210
      Index           =   15
      Left            =   3840
      TabIndex        =   24
      Top             =   3060
      Width           =   1260
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "M / AM :"
      Height          =   210
      Index           =   12
      Left            =   3840
      TabIndex        =   20
      Top             =   2700
      Width           =   750
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Jours :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   22
      Top             =   3060
      Width           =   630
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Type :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   18
      Top             =   2700
      Width           =   585
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Temps d'incub. :"
      Height          =   210
      Index           =   9
      Left            =   60
      TabIndex        =   28
      Top             =   3420
      Width           =   1530
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Germe :"
      Height          =   210
      Index           =   8
      Left            =   60
      TabIndex        =   10
      Top             =   1620
      Width           =   750
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Capacit� :"
      Height          =   210
      Index           =   7
      Left            =   3840
      TabIndex        =   8
      Top             =   1260
      Width           =   960
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Marque :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   6
      Top             =   1260
      Width           =   840
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   36
      Top             =   4140
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Temp�rature :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   14
      Top             =   2340
      Width           =   1350
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Milieu :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   12
      Top             =   1980
      Width           =   660
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "R�f�rence :"
      Height          =   210
      Index           =   3
      Left            =   3840
      TabIndex        =   4
      Top             =   900
      Width           =   1080
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   38
      Top             =   4500
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Remarques :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   34
      Top             =   3780
      Width           =   1200
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "N� �tuve :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   975
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Serial :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   660
   End
End
Attribute VB_Name = "frmEtuve"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmEtuve
' Feuille de gestion des �tuves
' 16/04/1999 PV
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des d�structions et des cr�ations

Option Explicit

Private cEtu As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire
Private sFinalWP As String                ' Where-part de la requ�te SQL courante
Private colChange As New Collection       ' Trace des modifications
Private cold�truit As New Collection      ' Trace de l'enregistrement qui va �tre d�truit
Private colCr�� As New Collection         ' Trace de la cr�ation de l'enregistrement

Private Const sTable = "etuve"


'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim sWP As String
  Dim t As Control
  For Each t In colChamps
    If Not t.Locked And t.Text <> "" Then
      Dim sFinal As String, sMsg As String
      If Not bQueryToWP(t.DataField, t.Text, colColonnes(t.DataField).iType, sFinal, sMsg) Then
        MsgBox "Erreur dans la requ�te !" & vbCrLf & sMsg, vbExclamation, App.Title
        t.SetFocus
        Exit Sub
      End If
      If sWP <> "" Then sWP = sWP & " and "
      sWP = sWP & "(" & sFinal & ")"
    End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cEtuQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cEtuQuery.OpenCurseur "select * from etuve where " & sWP & " order by etu_numero,etu_milieu"
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "�chec lors de la requ�te" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    ActiveFormulaire True
    SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture �ventuelle du curseur en cours
  If Not cEtu Is Nothing Then cEtu.CloseCurseur
  Set cEtu = cEtuQuery
  sFinalWP = sWP
  
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  BDS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cEtu.EOF And cEtu.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a �t� s�lectionn�"
  End If
  BDS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  BDS�l.SetFocus
End Sub


' V�rifie que les champs contiennent des valeurs l�gales
' Le contr�le des NULL et des types a d�j� �t� fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer
  
  bOkValeurs = False
  
  If bdcMilieu <> "" Then
    bdcMilieu.Synchronise
    If bdcMilieu.ListIndex < 0 Then
      MsgBox "Milieu inconnu !", vbExclamation, App.Title
      bdcMilieu.SetFocus
      Exit Function
    End If
  End If
  
  
  Dim sJours As String, p As Integer, i As Integer
  sJours = colChamps("etu_jour")
  For i = 1 To 6
    p = InStr(sJours, Format(i))
    If p > 0 Then sJours = Left(sJours, p - 1) & Mid(sJours, p + 1)
  Next
  If sJours <> "" Then
    MsgBox "Liste des jours incorrecte !" & vbCrLf & "Ce champ doir contenir au plus une fois les chiffres de 1 (lundi) � 6 (samedi), sans espace ni autre caract�re.", vbExclamation, App.Title
    colChamps("etu_jour").SetFocus
    Exit Function
  End If
  
  
  Dim vMin, vMax
  vMin = colChamps("etu_ssmin")
  vMax = colChamps("etu_ssmax")
  If (vMin = "" And vMax <> "") Or (vMin <> "" And vMax = "") Then
    MsgBox "Les n�s minimum et maximum de supers�rie doivent �tre vies tous les deux ou remplis tous les deux.", vbExclamation, App.Title
    colChamps("etu_ssmin").SetFocus
    Exit Function
  End If
  
  If IsNumeric(vMin) And IsNumeric(vMax) Then
    vMin = CDbl(vMin)
    vMax = CDbl(vMax)
    If vMin <> Int(vMin) Or vMin < 1 Or vMin > 30 Then
      MsgBox "N� de supers�rie minimum incorrect (doit �tre compris entre 1 et 30).", vbExclamation, App.Title
      colChamps("etu_ssmin").SetFocus
      Exit Function
    End If
    If vMax <> Int(vMax) Or vMax < 1 Or vMax > 30 Then
      MsgBox "N� de supers�rie maximum incorrect (doit �tre compris entre 1 et 30).", vbExclamation, App.Title
      colChamps("etu_ssmax").SetFocus
      Exit Function
    End If
    If vMax < vMin Then
      MsgBox "Le N�de supers�rie maximum ne peut pas �tre inf�rieur au n� de supers�rie minimum.", vbExclamation, App.Title
      colChamps("etu_ssmin").SetFocus
      Exit Function
    End If
  End If
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  Dim cEtuAdd As New BDCurseur
  cEtuAdd.OpenCurseur "select * from etuve where etu_serial=0"
  cEtuAdd.AddNew
  If Not bPr�pareEditAdd(cEtuAdd, colColonnes, colChamps) Then cEtuAdd.CloseCurseur: Exit Sub
  cEtuAdd.CloseCurseur
  
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cEtu Is Nothing Then cEtu.CloseCurseur
  Set cEtu = New BDCurseur
  
  ' Triche: pour r�cup�rer un s�rial, on lit le max�
  Dim cMax As New BDCurseur, iMax As Long
  cMax.OpenCurseur "select max(etu_serial) from etuve"
  If cMax.EOF Then iMax = 1 Else iMax = cMax(0)
  cMax.CloseCurseur
  sFinalWP = "etu_serial=" & iMax
  cEtu.OpenCurseur "select * from etuve where " & sFinalWP
  cEtu.MoveFirst

    
  ' On m�morise toutes les valeurs saisie par l'utilisateur
  EffaceCollection colCr��
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colCr��.Add ValeurContr�le(C), C.DataField
    End If
  Next
  
  ' Si on est en train d'ajouter un enregistrement, on recence ds l'historique la valeur des diff�rents param�tres
  If iMode = meAdd Then
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        ' On enregistre uniquement si les champs ne sont pas vides
        If ValeurContr�le(C) <> "" Then
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colCr��(C.DataField)
        End If
      End If
    Next
    ' On enregistre dans le journal la trace de la cr�ation
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("etu_serial"), "cr��", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  
  BDS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDS�l.ActiveMouvements True
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  BDS�l.Emp�cheMouvements
  
  SetMessage
  SetStatus
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cEtu Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cEtu.Edit
  If Not bPr�pareEditAdd(cEtu, colColonnes, colChamps) Then Exit Sub
  
  ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a �t� chang�
  If iMode = meChange Then
    Dim C As Control
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        If colChange(C.DataField) <> ValeurContr�le(C) Then  ' Modifi� !
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colChange(C.DataField) & "->" & ValeurContr�le(C)
        End If
      End If
    Next
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("etu_serial"), "chang�", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  
  BDS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDS�l.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub



Private Sub ActionValidate()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:   ValidateAdd
    Case meQuery: ValidateQuery
  End Select
End Sub





Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  ActiveFormulaire False
  BDS�l.ActiveValidation False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cEtu Is Nothing Then
    If Not (cEtu.EOF And cEtu.BOF) Then
      iMode = meNavigate
    End If
  End If
  BDS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub


'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  BDS�l.ButtonEnabled("Query") = False
  BDS�l.ButtonEnabled("Add") = False
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  
  colChamps("etu_serial").SetFocus
  BDS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cEtu Is Nothing
  
  If cEtu.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  BDS�l.ButtonEnabled("Query") = False
  BDS�l.ButtonEnabled("Add") = False
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "etu_serial", False
  ActiveChamp "etu_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("etu_numero").SetFocus
  AutoSelect colChamps("etu_numero"), True
  BDS�l.TabStop = False
  
  iMode = meChange
  
  ' On m�morise les valeurs avant le changement
  EffaceCollection colChange
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colChange.Add ValeurContr�le(C), C.DataField
    End If
  Next
  
  SetMessage "Modifiez les valeurs affich�es, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  BDS�l.ButtonEnabled("Query") = False
  BDS�l.ButtonEnabled("Add") = False
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  ActiveChamp "etu_serial", False
  ActiveChamp "etu_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("etu_numero").SetFocus
  BDS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cEtu Is Nothing

  If cEtu.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est d�finitif." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  ' M�morisation de la trace de l'enregistrement qui va �tre d�truit
  EffaceCollection cold�truit
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      cold�truit.Add ValeurContr�le(C), C.DataField
    End If
  Next
  
  ' Tri des donn�es � conserver et placement ds la variable Smsgtrace
  Dim sMsgTrace As String
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContr�le(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & cold�truit(C.DataField)
         End If
      End If
  Next
  
  ' On r�pertorie l'enregistrement dans le journal avant la destructiuon definitive
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("etu_serial"), "d�truit", sMsgTrace
  End If
  
  On Error Resume Next
  cEtu.Delete
  If Err Then
    AfficheErreurODBC "�chec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cEtu.MoveNext
  If cEtu.EOF Then
    cEtu.MovePrevious
    If cEtu.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  BDS�l.ActiveMouvements iMode = meNavigate
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cEtu Is Nothing

  BDS�l.ButtonEnabled("First") = cEtu.AbsolutePosition <> 1
  BDS�l.ButtonEnabled("Previous") = cEtu.AbsolutePosition <> 1
  BDS�l.ButtonEnabled("Next") = Not cEtu.EOF
  BDS�l.ButtonEnabled("Last") = Not cEtu.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cEtu.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
  cEtu.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cEtu.MoveNext
  AjusteMouvements
  If cEtu.EOF Then cEtu.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cEtu.MovePrevious
  AjusteMouvements
  If cEtu.BOF Then cEtu.MoveFirst
  SynchroniseFormulaire
End Sub


'=================================================================================
' Actions du s�lecteur

Private Sub bdS�l_ActionAdd():      ActionAdd:      End Sub
Private Sub bdS�l_ActionCancel():   ActionCancel:   End Sub
Private Sub bdS�l_ActionChange():   ActionChange:   End Sub
Private Sub bdS�l_ActionDelete():   ActionDelete:   End Sub
Private Sub bdS�l_ActionFirst():    ActionFirst:    End Sub
Private Sub bdS�l_ActionLast():     ActionLast:     End Sub
Private Sub bdS�l_ActionNext():     ActionNext:     End Sub
Private Sub bdS�l_ActionPrevious(): ActionPrevious: End Sub
Private Sub bdS�l_ActionQuery():    ActionQuery:    End Sub
Private Sub bdS�l_ActionValidate(): ActionValidate: End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  BDS�l.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then BDS�l.KeyPress KeyAscii
End Sub
' Menu de commandes contextuel
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then    ' Bouton droit
    PopupMenu MDILabo.mnuCommandes
  End If
End Sub

' Champs en majuscules
Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "etu_mam" Then ToMaj txtChamp(Index)
  If txtChamp(Index).DataField = "etu_type" Then ToMaj txtChamp(Index)
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  Show
  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  
  ' Chargement des combos
  Dim cMil As New BDCurseur, sLibell� As String
  cMil.OpenCurseur "select mil_indice,mil_abrege,mil_libelle from milieu order by mil_indice"
  While Not cMil.EOF
    sLibell� = cMil!mil_libelle
    If cMil!mil_libelle <> cMil!mil_abrege Then sLibell� = sLibell� & " (" & cMil!mil_abrege & ")"
    bdcMilieu.AddItem cMil!mil_indice, sLibell�
    cMil.MoveNext
  Wend
  cMil.CloseCurseur
  
  ' Formulaire en mode initial
  Set cEtu = Nothing
  ActiveFormulaire False
  BDS�l.LectureSeule = bLectureSeule
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  BDS�l.SetFocus
  
  SetMessage
  SetStatus
  sFinalWP = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'op�ration en cours avant de fermer la fen�tre !", vbCritical, App.Title
    If Not bShiftPressed Then
      Cancel = True
      Exit Sub
    End If
  End If

  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cEtu Is Nothing Then cEtu.CloseCurseur
  MDILabo.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cEtu Is Nothing Then
    EffaceFormulaire
  ElseIf cEtu.BOF And cEtu.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cEtu.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cEtu.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    BDS�l.NumRec = cEtu.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cEtu.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


Private Sub EffaceFormulaire()
  Dim C As Control
  For Each C In colChamps
    C.Text = ""
  Next
  BDS�l.NumRec = ""
End Sub


Private Sub ActiveFormulaire(bEnabled As Boolean)
  Dim C As Control
  For Each C In colChamps
    BDActiveChamp C, bEnabled
  Next
End Sub


Private Sub ActiveChamp(ByVal sChamp As String, bEnabled As Boolean)
  BDActiveChamp colChamps(sChamp), bEnabled
End Sub


'=================================================================================
' Ligne d'aide

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub bdS�l_GotFocus()
  SetStatus
End Sub

Private Sub bdcMilieu_GotFocus()
  SetStatus bdcMilieu.Tag
End Sub

Private Sub bdcMilieu_LostFocus()
  bdcMilieu.Synchronise
End Sub


'=================================================================================
' Acc�s au Web

Public Sub Fen�treWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=" & sTable
End Sub


'=================================================================================
' Copie des donn�es dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours�"
  BDCopieS�lection cEtu, colChamps, BDS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub



'=================================================================================
' Impression

Public Sub Imprime()
  Etat True
End Sub

Public Sub Aper�u()
  On Error GoTo 0
  Etat False
End Sub

Private Sub Etat(ByVal bImpression As Boolean)
  Dim sSQL As String, sSQLT�te As String, sSQLCorps As String
  sSQLT�te = "select unique etu_numero,etu_reference,etu_marque,etu_capacite from etuve where " & sFinalWP
  sSQLCorps = "select * from etuve,outer milieu where " & sFinalWP & " and mil_indice=etu_milieu"
  sSQL = "SHAPE {" & sSQLT�te & "} AS T�te APPEND ({" & sSQLCorps & "} AS Corps RELATE 'etu_numero' TO 'etu_numero') AS Corps"

  BDEtat sSQL, drEtuve, bImpression
End Sub

'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("etu_serial") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub


