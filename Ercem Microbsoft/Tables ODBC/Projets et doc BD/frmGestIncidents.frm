VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmGestIncidents 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des incidents"
   ClientHeight    =   6720
   ClientLeft      =   2445
   ClientTop       =   1725
   ClientWidth     =   9690
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmGestIncidents.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   448
   ScaleMode       =   0  'User
   ScaleWidth      =   645.008
   Tag             =   "Donn�es"
   Begin VB.TextBox txtSoumParCorInf 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H8000000B&
      BorderStyle     =   0  'None
      CausesValidation=   0   'False
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "dd/MM/yyyy"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1036
         SubFormatType   =   0
      EndProperty
      ForeColor       =   &H80000002&
      Height          =   210
      Left            =   6660
      Locked          =   -1  'True
      MousePointer    =   12  'No Drop
      TabIndex        =   14
      TabStop         =   0   'False
      Text            =   "Correspondant informatique"
      Top             =   3000
      Visible         =   0   'False
      Width           =   3015
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "inc_materiel"
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "dd/MM/yyyy"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1036
         SubFormatType   =   0
      EndProperty
      Height          =   330
      Index           =   6
      Left            =   1440
      TabIndex        =   16
      TabStop         =   0   'False
      Tag             =   "Mat�riel (PC, imprimante, serveur ...) sur lequel s'est produit l'incident"
      Top             =   2520
      Width           =   3756
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "inc_application"
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "dd/MM/yyyy"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1036
         SubFormatType   =   0
      EndProperty
      Height          =   330
      Index           =   7
      Left            =   1440
      TabIndex        =   20
      Tag             =   "Application / programme concern�"
      Top             =   2880
      Width           =   3756
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*inc_echeance"
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "dd/MM/yyyy"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1036
         SubFormatType   =   3
      EndProperty
      Height          =   330
      Index           =   9
      Left            =   1440
      TabIndex        =   24
      Tag             =   "Date limite pour la r�solution de l'incident"
      Top             =   3600
      Width           =   2400
   End
   Begin VB.TextBox txtTelSignPar 
      Appearance      =   0  'Flat
      BackColor       =   &H8000000B&
      BorderStyle     =   0  'None
      CausesValidation=   0   'False
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "dd/MM/yyyy"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1036
         SubFormatType   =   0
      EndProperty
      ForeColor       =   &H80000002&
      Height          =   420
      Left            =   6660
      Locked          =   -1  'True
      MousePointer    =   12  'No Drop
      MultiLine       =   -1  'True
      TabIndex        =   18
      TabStop         =   0   'False
      ToolTipText     =   "Num�ro de t�l�phone de l'utilisateur ayant signal� l'incident"
      Top             =   2520
      Width           =   2985
   End
   Begin VB.TextBox txtSiteSignPar 
      Appearance      =   0  'Flat
      BackColor       =   &H8000000B&
      BorderStyle     =   0  'None
      CausesValidation=   0   'False
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "dd/MM/yyyy"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1036
         SubFormatType   =   0
      EndProperty
      ForeColor       =   &H80000002&
      Height          =   330
      Left            =   6660
      Locked          =   -1  'True
      MousePointer    =   12  'No Drop
      TabIndex        =   13
      TabStop         =   0   'False
      ToolTipText     =   "Site de l'utilisateur ayant signal� l'incident"
      Top             =   2160
      Width           =   2985
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "inc_modetatle"
      Height          =   330
      Index           =   11
      Left            =   6600
      TabIndex        =   31
      Tag             =   "Date et heure de derni�re modification de l'�tat"
      Top             =   4500
      Width           =   3060
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "inc_resolution"
      Height          =   750
      Index           =   13
      Left            =   1440
      MaxLength       =   250
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   33
      Tag             =   "Commentaires sur la r�solution de l'incident"
      Top             =   4860
      Width           =   8205
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*inc_soumisle"
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "dd/MM/yyyy"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1036
         SubFormatType   =   3
      EndProperty
      Height          =   330
      Index           =   4
      Left            =   6660
      TabIndex        =   9
      Tag             =   "Date et heure de l'incident"
      Top             =   1800
      Width           =   2985
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "inc_description"
      Height          =   750
      Index           =   2
      Left            =   1440
      MaxLength       =   250
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   5
      Tag             =   "Compl�ment de description / Description d�taill�e"
      Top             =   1014
      Width           =   8205
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*inc_titre"
      Height          =   330
      Index           =   1
      Left            =   2220
      MaxLength       =   60
      TabIndex        =   3
      Tag             =   "description r�sum�e de l'incident en une ligne"
      Top             =   660
      Width           =   7425
   End
   Begin VB.TextBox txtNoSerie 
      DataField       =   "*inc_serie"
      Height          =   330
      Left            =   1440
      TabIndex        =   2
      Tag             =   "N� de s�rie interne de l'incident"
      Top             =   660
      Width           =   751
   End
   Begin Projets.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   41
      Top             =   0
      Width           =   9690
      _extentx        =   17224
      _extenty        =   767
      font            =   "frmGestIncidents.frx":0442
   End
   Begin VB.TextBox txtTimeStamp 
      DataField       =   "timestamp"
      Height          =   330
      Left            =   1440
      TabIndex        =   38
      Tag             =   "Date et heure de derni�re modification de l'information"
      Top             =   6360
      Width           =   2400
   End
   Begin VB.TextBox txtOrigineModif 
      DataField       =   "inc_idmodif"
      Height          =   330
      Left            =   5940
      TabIndex        =   40
      Tag             =   "Origine de la derni�re modification"
      Top             =   6360
      Width           =   3705
   End
   Begin MSComDlg.CommonDialog cdImpr 
      Left            =   5760
      Top             =   3600
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin Projets.BDCombo bdcEtat 
      Height          =   330
      Left            =   1440
      TabIndex        =   27
      Tag             =   "Avancement du traitement de l'incident"
      Top             =   4140
      Width           =   8205
      _extentx        =   5741
      _extenty        =   582
      font            =   "frmGestIncidents.frx":046A
      datafield       =   "*inc_etat"
   End
   Begin Projets.BDCombo bdcTrait�Par 
      Height          =   330
      Left            =   1440
      TabIndex        =   29
      Tag             =   "Personne assurant le traitement de l'incident (/NomARechercher pour une recherche alpha)"
      Top             =   4500
      Width           =   4020
      _extentx        =   7091
      _extenty        =   582
      font            =   "frmGestIncidents.frx":0492
      datafield       =   "inc_traitepar"
   End
   Begin Projets.BDCombo bdcNature 
      Height          =   330
      Left            =   1440
      TabIndex        =   35
      Tag             =   "Nature de l'incident (pb informatique, pb formation, pb saisie, ...)"
      Top             =   5640
      Width           =   8205
      _extentx        =   5741
      _extenty        =   582
      font            =   "frmGestIncidents.frx":04BA
      datafield       =   "inc_nature"
   End
   Begin Projets.BDCombo bdcSoumisPar 
      Height          =   330
      Left            =   1440
      TabIndex        =   7
      Tag             =   "Code personne ayant enregistr� l'incident (/NomARechercher pour une recherche alpha)"
      Top             =   1800
      Width           =   4020
      _extentx        =   7091
      _extenty        =   582
      font            =   "frmGestIncidents.frx":04E2
      datafield       =   "*inc_soumispar"
   End
   Begin Projets.BDCombo bdcSignalePar 
      Height          =   330
      Left            =   1440
      TabIndex        =   11
      Tag             =   "Code personne ayant signal� l'incident"
      Top             =   2160
      Width           =   4020
      _extentx        =   7091
      _extenty        =   582
      font            =   "frmGestIncidents.frx":050A
      datafield       =   "*inc_signalepar"
   End
   Begin Projets.BDCombo bdcNiveau 
      Height          =   330
      Left            =   1440
      TabIndex        =   22
      Tag             =   "Niveau de gravit� de l'incident (1:peu grave-5:tr�s grave)"
      Top             =   3240
      Width           =   8205
      _extentx        =   14552
      _extenty        =   582
      font            =   "frmGestIncidents.frx":0532
      datafield       =   "*inc_niveau"
   End
   Begin VB.Label lblSignalePar 
      Caption         =   "&Signal� par :"
      Height          =   330
      Left            =   60
      TabIndex        =   10
      Top             =   2160
      Width           =   1350
   End
   Begin VB.Label lblEcheance 
      Caption         =   "&Ech�ance :"
      Height          =   330
      Left            =   60
      TabIndex        =   23
      Top             =   3600
      Width           =   1350
   End
   Begin VB.Label lblNiveau 
      Caption         =   "&Niveau :"
      Height          =   330
      Left            =   60
      TabIndex        =   21
      Top             =   3240
      Width           =   1350
   End
   Begin VB.Label lblApplication 
      Caption         =   "&Application :"
      Height          =   330
      Left            =   60
      TabIndex        =   19
      Top             =   2880
      Width           =   1350
   End
   Begin VB.Label lblMat�riel 
      Caption         =   "&Mat�riel :"
      Height          =   330
      Left            =   60
      TabIndex        =   15
      Top             =   2520
      Width           =   1350
   End
   Begin VB.Label lblSoumisLe 
      Caption         =   "Soumis le :"
      Height          =   300
      Left            =   5520
      TabIndex        =   8
      Top             =   1860
      Width           =   1110
   End
   Begin VB.Label lblSoumisPar 
      Caption         =   "Soumis par :"
      Height          =   330
      Left            =   60
      TabIndex        =   6
      Top             =   1800
      Width           =   1350
   End
   Begin VB.Label lblSite 
      Caption         =   "Site :"
      Height          =   330
      Left            =   5520
      TabIndex        =   12
      Top             =   2160
      Width           =   1110
   End
   Begin VB.Label lblT�lSignPar 
      Caption         =   "T�l. :"
      Height          =   300
      Left            =   5520
      TabIndex        =   17
      Top             =   2520
      Width           =   1110
   End
   Begin VB.Label lblNoDeSerie 
      Caption         =   "No de s�rie :"
      Height          =   330
      Left            =   60
      TabIndex        =   1
      Top             =   660
      Width           =   1350
   End
   Begin VB.Label lblDescription 
      Caption         =   "&Description :"
      Height          =   330
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   1350
   End
   Begin VB.Label lblIdentification 
      Alignment       =   2  'Center
      Caption         =   "Identification"
      Height          =   255
      Left            =   4072
      TabIndex        =   0
      Top             =   443
      Width           =   1500
   End
   Begin VB.Line Line3 
      BorderColor     =   &H80000018&
      X1              =   0
      X2              =   640.016
      Y1              =   36
      Y2              =   36
   End
   Begin VB.Label lblR�solution 
      Alignment       =   2  'Center
      Caption         =   "R�solution"
      Height          =   255
      Left            =   4185
      TabIndex        =   25
      Top             =   3930
      Width           =   1500
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000018&
      X1              =   0
      X2              =   640.016
      Y1              =   268
      Y2              =   268
   End
   Begin VB.Label lblNature 
      Caption         =   "&Nature :"
      Height          =   300
      Left            =   60
      TabIndex        =   34
      Top             =   5640
      Width           =   1350
   End
   Begin VB.Label lblTracabilit� 
      Alignment       =   2  'Center
      Caption         =   "Tra�abilit�"
      Height          =   255
      Left            =   4125
      TabIndex        =   36
      Top             =   6030
      Width           =   1500
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000018&
      X1              =   0
      X2              =   640.016
      Y1              =   410
      Y2              =   410
   End
   Begin VB.Label lblEtat 
      Caption         =   "�&tat :"
      Height          =   300
      Left            =   60
      TabIndex        =   26
      Top             =   4140
      Width           =   1350
   End
   Begin VB.Label lblTraitePar 
      Caption         =   "Trait� par :"
      Height          =   300
      Left            =   60
      TabIndex        =   28
      Top             =   4500
      Width           =   1350
   End
   Begin VB.Label lblResolution 
      Caption         =   "Description :"
      Height          =   300
      Left            =   60
      TabIndex        =   32
      Top             =   5100
      Width           =   1350
   End
   Begin VB.Label lblTimeStamp 
      Caption         =   "Timestamp :"
      Height          =   300
      Left            =   60
      TabIndex        =   37
      Top             =   6360
      Width           =   1350
   End
   Begin VB.Label lblOrigineModif 
      AutoSize        =   -1  'True
      Caption         =   "Origine :"
      Height          =   300
      Left            =   4560
      TabIndex        =   39
      Top             =   6420
      Width           =   1350
   End
   Begin VB.Label lblModifieLe 
      Caption         =   "Modifi� le :"
      Height          =   300
      Left            =   5520
      TabIndex        =   30
      Top             =   4560
      Width           =   1110
   End
End
Attribute VB_Name = "frmGestIncidents"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmGestIncidents
' Gestion des incidents (ex mini-projets)
'  4/01/1999 PV
' 15/01/1999 PV Valeurs par d�faut lors d'un ajout (soumis par, soumis le); TrimCrLf
'  1/04/1999 PV Impressions
' 22/04/1999 PV Incidents -> miniprojets; changement de l'orientation de l'imprimante
' 04/10/2001 PC miniprojet ===> gestion des incidents
' 08/11/2001 FG ajout nature 8=mauvaise utilisation ; 99 = autre
' 13/11/2001 PC �volution des contr�les des BDCombos
' 19/12/2001 PC champs no t�l, site, corrsp info + fct MajChpsExternes

Option Explicit

Private cInc As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition
Private sFinalSQL As String               ' Requ�te SQL courante
Private vEtatAncien As Variant            ' sauvegarde de l'ancien etat

Private Const cCoulFondOblig = &HC0E0FF  ' couleur de fond pour les champs obligatoires
Private Const sTable = "incident"

Private Sub SynchroniseFormulaire()
  If cInc Is Nothing Then
    EffaceFormulaire
  ElseIf cInc.BOF And cInc.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cInc.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cInc.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    MajChpsExternes
    bdS�l.NumRec = cInc.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cInc.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub

Private Sub EffaceFormulaire()
  
  Dim c As Control
  
  For Each c In colChamps
    c.Text = ""
  Next
  bdS�l.NumRec = ""
  EffSignPar  ' effacement de champs compl�mentaires
  
End Sub

Private Sub ActiveFormulaire(bEnabled As Boolean)
  Dim c As Control
  For Each c In colChamps
    BDActiveChamp c, bEnabled
  Next
End Sub

Private Sub ActiveChamp(ByVal sChamp As String, bEnabled As Boolean)
  BDActiveChamp colChamps(sChamp), bEnabled
End Sub

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
  
  ' MsgBox "Where-part: " & sWP
  
  Dim cIncQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours . . ."
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from incident where " & sWP & " order by inc_serie"
  cIncQuery.OpenCurseur sSQL
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
  If Not cInc Is Nothing Then cInc.CloseCurseur
  Set cInc = cIncQuery
  sFinalSQL = sSQL
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cInc.EOF And cInc.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a �t� s�lectionn�"
  End If
  bdS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  bdS�l.SetFocus
End Sub

' Supprime les CrLf en fin de cha�ne
Sub TrimCrLf(c As TextBox)
  Do While Len(c) > 2
    If Right(c, Len(c) - 1) = vbCrLf Then
      c = Left(c, Len(c) - 2)
    Else
      Exit Do
    End If
  Loop
End Sub

' V�rifie que les champs contiennent des valeurs l�gales
' Le contr�le des NULL et des types a d�j� �t� fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer
  Dim i As Integer
  
  Dim iValChp As Integer    ' valeur du champ
  Dim bChpRens As Boolean   ' champ renseign�
  
  bOkValeurs = False  ' les valeurs sont incorrectes au d�part
  
  ' On supprime les retours � la ligne en fin de description et de commentaires
  TrimCrLf colChamps("inc_description")
  TrimCrLf colChamps("inc_resolution")
  
' PC 15/10/2001
' ajout des controles de champs
  If iMode <> meQuery Then  ' si pas en mode interrogation. Test facultatif, fonction non appel�e en interrogation
    ' contr�le du champ inc_niveau
    bChpRens = IIf(IsNull(colChamps("inc_niveau")), False, colChamps("inc_niveau") <> "")
    If bChpRens Then  ' champ renseign�
      If Not bOkChampListe("inc_niveau") Then
        colChamps("inc_niveau").SetFocus
        Exit Function
      End If
    End If
    
    ' contr�le du champ inc_etat
    bChpRens = IIf(IsNull(colChamps("inc_etat")), False, colChamps("inc_etat") <> "")
    If bChpRens Then  ' champ renseign�
      If Not bOkChampListe("inc_etat") Then   ' valeur du champ incorrecte
        colChamps("inc_etat").SetFocus
        Exit Function
      End If
    End If
    
    ' contr�le du champ inc_nature
    bChpRens = IIf(IsNull(colChamps("inc_nature")), False, colChamps("inc_nature") <> "")
    If bChpRens Then  ' champ renseign�
      If Not bOkChampListe("inc_nature") Then  ' valeur du champ incorrecte
        colChamps("inc_nature").SetFocus
        Exit Function
      End If
    End If
    
  End If

  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True

End Function

Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cIncAdd As New BDCurseur
  cIncAdd.OpenCurseur "select * from " & sTable & " where inc_serie=0"
  cIncAdd.AddNew
  If Not bPr�pareEditAdd(cIncAdd, colColonnes, colChamps) Then cIncAdd.CloseCurseur: Exit Sub
  cIncAdd.CloseCurseur
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cInc Is Nothing Then cInc.CloseCurseur
  Set cInc = New BDCurseur
  
  ' Astuce : pour r�cup�rer un s�rial, on lit le max�
  Dim cMax As New BDCurseur, iMax As Long
  cMax.OpenCurseur "select max(inc_serie) from " & sTable
  If cMax.EOF Then iMax = 1 Else iMax = cMax(0)
  cMax.CloseCurseur
  sFinalSQL = "select * from " & sTable & " where inc_serie=" & iMax
  cInc.OpenCurseur sFinalSQL
  cInc.MoveFirst
  
  ActiveFormulaire False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  bdS�l.Emp�cheMouvements
  
  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub

Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cInc Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cInc.Edit
  If Not bPr�pareEditAdd(cInc, colColonnes, colChamps) Then Exit Sub

  ActiveFormulaire False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub

Private Sub ActionValidate()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub

Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  ActiveFormulaire False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cInc Is Nothing Then
    If Not (cInc.EOF And cInc.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub

'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  
  colChamps("inc_serie").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub

Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cInc Is Nothing
  
  If cInc.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "inc_serie", False
  ActiveChamp "inc_idmodif", False
  ActiveChamp "timestamp", False
  
  MajCoulOblig  ' mise � jour couleur de fond champs obligatoires
  
  colChamps("inc_titre").SetFocus
' PC le mardi 8/10/2001
' m�thode plus "traditionelle de mettre le focus sur un champ :
  'Me.txtTitre.SetFocus
  
  bdS�l.TabStop = False
  
  iMode = meChange
  SetMessage "Modifiez les valeurs affich�es, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub

Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  MajCoulOblig  ' mise � jour couleur de fond champs obligatoires
  ActiveChamp "inc_serie", False
  ActiveChamp "inc_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("inc_soumispar") = iNumOp�rateur
  colChamps("inc_soumisle") = Format(Now, "c")
  colChamps("inc_niveau") = 1 ' pas grave
  colChamps("inc_echeance") = sCalculeEcheanceResolution(colChamps("inc_niveau"))
  colChamps("inc_etat") = 0 ' soumis

  colChamps("inc_titre").SetFocus
  'Me.txtTitre.SetFocus
  
  bdS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub

Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cInc Is Nothing

  If cInc.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", _
      vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est d�finitif." & vbCrLf & _
    "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion + vbDefaultButton2, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cInc.Delete
  If Err Then
    AfficheErreurODBC "�chec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cInc.MoveNext
  If cInc.EOF Then
    cInc.MovePrevious
    If cInc.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  bdS�l.ActiveMouvements iMode = meNavigate
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub

'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cInc Is Nothing

  bdS�l.ButtonEnabled("First") = cInc.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cInc.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cInc.EOF
  bdS�l.ButtonEnabled("Last") = Not cInc.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cInc.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cInc.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cInc.MoveNext
  AjusteMouvements
  If cInc.EOF Then cInc.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cInc.MovePrevious
  AjusteMouvements
  If cInc.BOF Then cInc.MoveFirst
  SynchroniseFormulaire
End Sub

Private Sub bdcSignalePar_GotFocus()
  SetStatus bdcSignalePar.Tag
End Sub

Private Sub bdcSignalePar_LostFocus()
  bdcSignalePar.Synchronise
  MajChpsExternes
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
  bdS�l.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
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
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcSignalePar.AddItem u.uti_numuti, u.uti_nom
    bdcSoumisPar.AddItem u.uti_numuti, u.uti_nom
    bdcTrait�Par.AddItem u.uti_numuti, u.uti_nom
  Next
  
  bdcNiveau.AddItem 1, "dysfonctionnement mineur"
  bdcNiveau.AddItem 2, "d�faut r�p�titif (plantage r�current micro / programme)"
  bdcNiveau.AddItem 3, "anomalie bloquante (comportement anormal / inattendu d'un programme)"
  bdcNiveau.AddItem 4, "d�faillance majeure d'un programme (on ne peut plus utiliser le programme)"
  bdcNiveau.AddItem 5, "d�faillance majeure bloquant la totalit� d'un service ou d'un site"
  
  bdcEtat.AddItem 0, "Soumis"
  bdcEtat.AddItem 1, "Traitement en cours"
  bdcEtat.AddItem 2, "Trait�"
  bdcEtat.AddItem 3, "Pas/Plus de suivi"
  
  bdcNature.AddItem 1, "Informatique"
  bdcNature.AddItem 2, "Formation"
  bdcNature.AddItem 3, "Saisie"
  bdcNature.AddItem 4, "Edition"
  bdcNature.AddItem 5, "Connexion"
  bdcNature.AddItem 6, "Mat�riel"
  bdcNature.AddItem 7, "Mauvais param�trage tables g�n�rales"
  bdcNature.AddItem 8, "Mauvaise utilisation des programmes ou syst�me"
  bdcNature.AddItem 99, "Autre (pr�cisez en description)"

  ' Formulaire en mode initial
  Set cInc = Nothing
  ActiveFormulaire False
  With bdS�l
    .ActiveMouvements False
    .ActiveValidation False
    .ButtonEnabled("Query") = True
    .ButtonEnabled("Add") = True
    .SetFocus
  End With
  
  iMode = meEmpty
  SetMessage
  SetStatus
  sFinalSQL = ""

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
' SetPrinterOrientation cdlPortrait

  If Not cInc Is Nothing Then cInc.CloseCurseur
  MDIProjets.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub

'=================================================================================
Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub bdcEtat_GotFocus()
  
  SetStatus bdcEtat.Tag
  
  If iMode <> meQuery Then  ' si pas en mode interrogation
    If IsNull(colChamps("inc_etat")) Then
      vEtatAncien = -1
    ElseIf colChamps("inc_etat") = "" Then
      vEtatAncien = -1
    Else
      vEtatAncien = colChamps("inc_etat") ' sauvegarde de la valeur du champ
    End If
  End If
  
  colChamps("inc_etat").ForeColor = vbWindowText  ' couleur du texte par d�faut

End Sub

Private Sub bdcEtat_LostFocus()
  
  Dim vEtat As Variant
  Dim bEtatRenseigne As Boolean   ' champ renseign�
  
  If iMode <> meQuery Then  ' si pas en mode interrogation
    vEtat = colChamps("inc_etat")
    bEtatRenseigne = IIf(IsNull(vEtat), False, vEtat <> "")
    If bEtatRenseigne Then
      If bOkChampListe("inc_etat") Then  ' valeurs du champs ok
        If vEtatAncien <> vEtat Then  ' si changement d'�tat
          colChamps("inc_modetatle") = Format(Now, "c") ' date de modif par d�faut = date et heure du jour au format court
        End If
      End If
    End If
  End If

  bdcEtat.Synchronise
  
End Sub

Private Sub bdcNature_GotFocus()
  
  SetStatus bdcNature.Tag
  colChamps("inc_nature").ForeColor = vbWindowText  ' couleur du texte par d�faut

End Sub

Private Sub bdcNature_LostFocus()
  
  Dim bNatureRenseigne As Boolean
  
  If iMode <> meQuery Then  ' si pas en mode interrogation
    bNatureRenseigne = IIf(IsNull(colChamps("inc_nature")), False, _
      colChamps("inc_nature") <> "")
    If bNatureRenseigne Then
      bOkChampListe "inc_nature"
    End If
  End If

  bdcNature.Synchronise
  
End Sub

Private Sub bdcNiveau_GotFocus()
  
  SetStatus bdcNiveau.Tag
  colChamps("inc_niveau").ForeColor = vbWindowText  ' couleur du texte par d�faut

End Sub

Private Sub bdcNiveau_LostFocus()

  Dim iNiveau As Integer, bNiveauRenseigne As Boolean
  
  If iMode <> meQuery Then  ' si pas en mode interrogation
    bNiveauRenseigne = IIf(IsNull(colChamps("inc_niveau")), False, _
      colChamps("inc_niveau") <> "")
    If bNiveauRenseigne Then
      If bOkChampListe("inc_niveau") Then  ' contr�le des bornes
        iNiveau = CInt(colChamps("inc_niveau"))
        colChamps("inc_echeance") = sCalculeEcheanceResolution(iNiveau)
      End If
    End If
  End If

  bdcNiveau.Synchronise
  
End Sub

Private Sub bdcSoumisPar_GotFocus()
  SetStatus bdcSoumisPar.Tag
End Sub

Private Sub bdcSoumisPar_LostFocus()
  bdcSoumisPar.Synchronise
End Sub

Private Sub bdcTrait�Par_GotFocus()
  SetStatus bdcTrait�Par.Tag
End Sub

Private Sub bdcTrait�Par_LostFocus()
  bdcTrait�Par.Synchronise
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
  BDCopieS�lection cInc, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage

End Sub

'=================================================================================
' Impression

Public Sub Imprime()
  SetPrinterOrientation cdlLandscape
  BDEtat sFinalSQL, drMiniProjet, True
  SetPrinterOrientation cdlPortrait
End Sub

Public Sub Aper�u()
  SetPrinterOrientation cdlLandscape
  BDEtat sFinalSQL, drMiniProjet, False
  SetPrinterOrientation cdlPortrait
End Sub

Private Sub SetPrinterOrientation(Orientation As PrinterOrientationConstants)
  cdImpr.Orientation = Orientation
  SendKeys "{Enter}"
  cdImpr.ShowPrinter
End Sub

Private Function sCalculeEcheanceResolution(iNiveau As Integer) As String
' PC 12/10/2001
' Calcul de l'�chance en fonction du niveau d'intervention
' plus le niveau est �lev�, plus le d�lai est court
' Niveau    delai j+
'   1       8
'   2       6
'   3       4
'   4       2
'   5       0
  
  Dim iNbJours As Integer, dEcheance As Date
  
  iNbJours = (5 - iNiveau) * 2  ' calcul de l'�ch�ance en fonction du nivaue
  dEcheance = DateAdd("d", iNbJours, Now)
  sCalculeEcheanceResolution = Format(dEcheance, "ddddd")

End Function


Private Sub MajCoulOblig()
' les champs obligatoires ont une couleur de fond sp�cifique
  
  Dim c As BDColonne

  For Each c In colColonnes
    If c.bRequired Then colChamps(c.sNom).BackColor = cCoulFondOblig
  Next

End Sub

Private Function bOkChampListe(sNomChamp As String) As Boolean
' validation de la valeur d'un champ de type liste d�roulante/combo box
' PC 13/11/2001
  
  Dim i As Integer        ' compteur de boucle
  Dim sValSep As String   ' valeur du s�parateur cl�/libell�
  Dim iPosSep As Integer  ' position du s�parateur
  Dim iNbLig As Integer   ' nombre de lignes dans la liste
  Dim sTxtLig As String   ' texte de la ligne
  Dim vValCtrl As Variant ' valeur courante du champ � contr�ler

  sValSep = colChamps(sNomChamp).S�parateur
  iNbLig = colChamps(sNomChamp).ListCount - 1
  vValCtrl = colChamps(sNomChamp)
  
  bOkChampListe = False
  For i = 0 To iNbLig
    sTxtLig = colChamps(sNomChamp).List(i)
    iPosSep = InStr(sTxtLig, sValSep)
    If iPosSep = 0 Then
      If StrComp(sTxtLig, vValCtrl, vbTextCompare) = 0 Then
        bOkChampListe = True
        Exit For
      End If
    Else
      If StrComp(Trim(Left(sTxtLig, iPosSep - 1)), vValCtrl, vbTextCompare) = 0 Then
        bOkChampListe = True
        Exit For
      End If
    End If
  Next i
  
  If bOkChampListe = False Then
    colChamps(sNomChamp).ForeColor = vbRed ' couleur du texte en rouge
  Else
    colChamps(sNomChamp).ForeColor = vbWindowText ' couleur du texte par d�faut
  End If

End Function


Private Sub MajChpsExternes()
' PC 19/12/2001
' Mise � jour des champs externes � la table incidents
  
  Dim cTable As New BDCurseur
  Dim sReqSql As String, lCodErr As Long, lCodUtil As Long
  
  If bKeChiffre(bdcSignalePar.Text) Then  ' le code utilisateur ne contient que des chiffres
    sReqSql = "select uti_tel, uti_letfim,  sit_libelle, sit_tel " & _
      "from utilisateur, outer site " & _
      "where uti_site = sit_numsite and uti_numuti='" & bdcSignalePar.Text & "'"
    
    On Error Resume Next
    cTable.OpenCurseur sReqSql
    lCodErr = Err.Number
    On Error GoTo 0
    
    If lCodErr <> 0 Or cTable.EOF Then
      EffSignPar
    Else
      ' traitement num t�l
      If IsNull(cTable!uti_tel) Then     ' num t�l utilisateur non renseign�
        If IsNull(cTable!sit_tel) Then   ' on va prendre le num t�l du site
          Me.txtTelSignPar.Text = ""    ' si renseign�
        Else
          Me.txtTelSignPar.Text = cTable!sit_tel
        End If
      Else
        Me.txtTelSignPar.Text = cTable!uti_tel
      End If
      ' traitement nom site
      If IsNull(cTable!sit_libelle) Then
        Me.txtSiteSignPar.Text = ""
      Else
        Me.txtSiteSignPar = cTable!sit_libelle
      End If
      ' traitement correspondant informatique
      If IsNull(cTable!uti_letfim) Or Left(cTable!uti_letfim, 2) <> "CI" Then
        Me.txtSoumParCorInf.Visible = False
      Else
        Me.txtSoumParCorInf.Visible = True
      End If
    End If
    cTable.CloseCurseur
  Else  ' le code utilisateur ne contient pas que des chiffres
    EffSignPar
  End If

End Sub

Private Sub EffSignPar()
' effacement des champs d�pendant du champ signal� par
  Me.txtTelSignPar.Text = ""
  Me.txtSiteSignPar.Text = ""
  Me.txtSoumParCorInf.Visible = False
End Sub
