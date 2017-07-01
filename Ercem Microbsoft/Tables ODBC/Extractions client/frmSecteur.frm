VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmCarrefour 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Extraction EH Carrefour 2002"
   ClientHeight    =   7740
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   7260
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmSecteur.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   516
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   484
   Tag             =   "Donn�es"
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   765
      Left            =   5940
      Picture         =   "frmSecteur.frx":014A
      ScaleHeight     =   765
      ScaleWidth      =   1215
      TabIndex        =   7
      Top             =   60
      Width           =   1215
   End
   Begin VB.ListBox lstTrace 
      Height          =   3420
      Left            =   60
      TabIndex        =   6
      Top             =   4260
      Width           =   7095
   End
   Begin VB.CommandButton btnExtraction 
      Caption         =   "Extraction"
      Default         =   -1  'True
      Height          =   375
      Left            =   60
      TabIndex        =   2
      Top             =   540
      Width           =   1875
   End
   Begin MSComctlLib.ListView lvInfoEH 
      Height          =   2475
      Left            =   60
      TabIndex        =   4
      Top             =   1440
      Width           =   7095
      _ExtentX        =   12515
      _ExtentY        =   4366
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Refdoc"
         Object.Width           =   38100
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Etat"
         Object.Width           =   10583
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Titre"
         Object.Width           =   119062
      EndProperty
   End
   Begin VB.TextBox txtRef 
      Height          =   315
      Left            =   3600
      MaxLength       =   41
      TabIndex        =   1
      Text            =   "WA141121"
      Top             =   60
      Width           =   1635
   End
   Begin VB.Label lblChamp 
      Alignment       =   2  'Center
      Caption         =   "EH�Carrefour 2002"
      Height          =   450
      Index           =   2
      Left            =   5880
      TabIndex        =   8
      Top             =   840
      Width           =   1305
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Trace :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   5
      Top             =   4020
      Width           =   645
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Documents de classe EH associ�s :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   3
      Top             =   1200
      Width           =   3315
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "R�f�rence dossier (ex: GK123456) :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   3375
   End
End
Attribute VB_Name = "frmCarrefour"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmCarrefour
' Extractions EH Carrefour 2002
' 17/12/2001 PV

Option Explicit

' variables de l'entete du fichier
Const sIdLabo As String = "4"    ' identifiant laboratoire Silliker de Carrefour
Private sDateVisite As String     ' date visite (date de l'audit)
Private sHeureVisite As String    ' heure visite (heure d'arriv�e)
Private iIdMagasin As Integer    ' identifiant magasin
Private iNoVisite As Integer        ' num�ro de la visite
Const sIntervenant As String = "" ' nom de l'auditeur
Private sglNoteGlobale As Single  ' note gloable du magasin

Private colResultatAudit As Collection        ' r�sultat de l'audit
Private colCommentaireAudit As Collection ' commentaire de l'audit
Private colCotationPoisson As Collection    '  cotation poisson

Private Sub Trace(sMsg As String)
  lstTrace.AddItem sMsg
  lstTrace.ListIndex = lstTrace.ListCount - 1
  lstTrace.Refresh
End Sub

Private Sub btnExtraction_Click()
  Dim sLettres As String
  Dim iRef As Long
  
' initialisations
  If lvInfoEH.ListItems.Count > 0 Then lvInfoEH.ListItems.Clear
  If lstTrace.ListCount > 1 Then lstTrace.Clear
  Set colResultatAudit = New Collection        ' r�sultat de l'audit
  Set colCommentaireAudit = New Collection ' commentaire de l'audit
  Set colCotationPoisson = New Collection     ' cotation poisson
  
  ' Tests simples
  If Not (UCase(txtRef.Text) Like "[A-Z][A-Z]######") Then
    MsgBox "La r�f�rence est compos�e de deux lettres suivies de six chiffres." & vbCrLf & _
      "Exemple: GK123456", vbExclamation, App.Title
    Exit Sub
  End If
  
  sLettres = UCase(Left(txtRef.Text, 2))
  iRef = Val(Mid(txtRef.Text, 3))
  
  ' On v�rifie que la prestation existe dans le planning
  Trace "V�rification de la r�f�rence dans le planning"
  Dim cPlan As New BDCurseur
  cPlan.OpenCurseur "select * from planning where pla_lettres=" & _
    sFormToSQL(sLettres, BDTypeCHAR) & " and pla_iref=" & iRef
  If cPlan.EOF Then
    MsgBox "R�f�rence non trouv�e dans le planning. " & vbNewLine & _
      "V�rifiez qu'il n'y a pas d'erreur de r�f�rence, et que vous �tes connect� � la bonne source de donn�es.", _
      vbExclamation, App.Title
    Exit Sub
  End If
  
  sDateVisite = Format$(CDate(cPlan!pla_dateplan), "dd/mm/yy")
  ' On v�rifie que la prestation correspond � un �tablissement Carrefour 2002
  Dim sEtb As String
  sEtb = cPlan!pla_etb
  
  Dim cEtb As New BDCurseur
  cEtb.OpenCurseur "select * from etablissement where etb_numetb=" & _
    sFormToSQL(sEtb, BDTypeCHAR)
  If cPlan.EOF Then
    MsgBox "Code �tablissement [" & sEtb & "] inconnu" & vbNewLine & _
      "V�rifiez dans la table etablissement.", vbExclamation, App.Title
    Exit Sub
  End If
  
  If cEtb!etb_prefixe <> "C2002" Then
    MsgBox "La prestation ne correspond pas � un �tablissement Carrefour 2002 (pr�fixe C2002)." & _
      vbCrLf & "La r�f�rence correspond � un planning du " & sDateVisite & _
      " sur l'�tablissement " & sEtb & " " & cEtb!etb_prefixe & " " & cEtb!etb_nom & "." & vbCrLf _
      & vbCrLf & "L'extaction ne peut fonctionner que sur un �tablissement Carrefour 2002.", vbExclamation, App.Title
    Exit Sub
  End If
  
  ' On r�cup�re la liste des EH dans la base de donn�es
  Trace "R�cup�ration de la liste des EH et contr�le de l'�tat"
  Dim iNbDoc As Integer
  Dim bProbl�me As Boolean
  Dim cDoc As New BDCurseur
  cDoc.OpenCurseur "select * from document where doc_lettres=" & _
    sFormToSQL(sLettres, BDTypeCHAR) & " and doc_plairef=" & iRef & " and doc_classe='EH'"
  bProbl�me = False: iNbDoc = 0
  Do Until cDoc.EOF
    Dim x As ListItem
    Set x = lvInfoEH.ListItems.Add
    x.Text = cDoc!doc_refdoc
    x.SubItems(1) = cDoc!doc_etat
    x.SubItems(2) = cDoc!doc_titre
    
    If cDoc!doc_etat < "6" Then
      MsgBox "EH " & cDoc!doc_refdoc & " � l'�tat " & cDoc!doc_etat & _
         ": extraction impossible, toutes les EH doivent �tre au minimum � l'�tat 6 " & _
         "avant de lancer l'extraction.", vbExclamation, App.Title
      x.ForeColor = vbRed
      x.ListSubItems(1).ForeColor = vbRed
      x.ListSubItems(2).ForeColor = vbRed
      bProbl�me = True
    End If
    
    iNbDoc = iNbDoc + 1
    cDoc.MoveNext
  Loop
  lvInfoEH.Refresh
  AjusteListView Me, lvInfoEH
  If bProbl�me Then Exit Sub
  
  If iNbDoc = 0 Then
    MsgBox "Aucun document trouv�, extraction interrompue.", vbExclamation, App.Title
    Exit Sub
  End If
    
  Trace "Contr�les globaux"
  ' On d�termine le secteur
  Dim sSecteur As String
  Select Case NZ(cEtb!etb_unite)
    Case 11: sSecteur = "S1"
    Case 12: sSecteur = "S2"
    Case 13: sSecteur = "S3"
    Case 24: sSecteur = "S4"
    Case 25: sSecteur = "S5"
    Case 26: sSecteur = "S6"
    Case 37: sSecteur = "S7"
    Case 38: sSecteur = "S8"
    Case 39: sSecteur = "S9"
    Case Else:
      MsgBox "Code unit� de l'�tablissement " & sEtb & " non reconnu:" & vbNewLine & _
        "l'�tablissement doit �tre associ� � un secteur de S1 � S9 dans la table �tablissement.", _
        vbExclamation, App.Title
      Exit Sub
  End Select
  
  ' Heure de visite, lue dans le planning et pas dans ehtete
  If IsNull(cPlan!pla_harrivee) Then
    MsgBox "L'heure d'arriv�e n'a pas �t� saisie dans le planning." & vbNewLine & _
      "Elle est obligatoire pour l'extraction Carrefour 2002.", vbExclamation, App.Title
    Exit Sub
  End If
  'sHeureVisite = cPlan!pla_harrivee Mod 100 & ":" & Right(Str(cPlan!pla_harrivee), 2)
  sHeureVisite = Format$(cPlan!pla_harrivee \ 100, "00") & ":" & _
                      Format$(cPlan!pla_harrivee Mod 100, "00")
  If cPlan!pla_harrivee < 600 Or cPlan!pla_harrivee > 1600 Then
    MsgBox "L'heure d'arriv�e saisie dans le planning (" & sHeureVisite & _
      ") est invalide (<6:00 ou >16:00) pour l'extraction Carrefour 2002.", vbExclamation, App.Title
    Exit Sub
  End If
  If (cPlan!pla_harrivee Mod 100) > 59 Then
    MsgBox "L'heure d'arriv�e saisie dans le planning (" & sHeureVisite & _
      ") est invalide (minutes >59) pour l'extraction Carrefour 2002.", vbExclamation, App.Title
    Exit Sub
  End If
  
  ' Identifiant magasin
  If IsNull(cEtb!etb_code) Then
    MsgBox "Le code magasin n'est pas d�fini dans la table �tablissement (etb_code)." & vbNewLine & _
      "Il est obligatoire pour l'extraction Carrefour 2002.", vbExclamation, App.Title
    Exit Sub
  End If
  If cEtb!etb_code <= 3000 Or cEtb!etb_code >= 3300 Then
    MsgBox "Le code magasin (" & cEtb!etb_code & ") est mal d�fini dans la table �tablissement (etb_code)." & vbNewLine & _
      "Il doit �tre compris entre 3000 et 3300 pour l'extraction Carrefour 2002.", vbExclamation, App.Title
    Exit Sub
  End If
  iIdMagasin = cEtb!etb_code
 
  If Not TraitementExcel(cEtb!etb_nom, sSecteur) Then Exit Sub
  
  ' Lecture des EH et des obs
  Trace "Lecture des EH et des observations"
  ' A adapter avec les grilles 2002 r�elles
  ' On lit toutes les EH en reparcourant le curseur cDoc, sauf:
  ' 1174/1 GRILLE RECAP NOTES MAGASIN CARREFOUR 2001
  ' 1175/1 AUDIT INDICE CHAINE DU FROID PFT CARREFOUR 2001 --> on laisse pour les tests
  cDoc.MoveFirst
  Do Until cDoc.EOF
    If Left(cDoc!doc_refdoc, 4) <> "1174" Then
      LitEHObs cDoc
    End If
    cDoc.MoveNext
  Loop
  
  If GenerFic(sSecteur, sLettres, iRef) Then
    MsgBox "Programme termin�, mais fichier incomplet !", vbInformation, App.Title
  Else
    MsgBox "Fichier non g�n�r� ou en anomalie (� ne pas transf�rer)", vbCritical, App.Title
  End If
  '...
End Sub

Private Sub LitEHObs(cDoc As BDCurseur)
  Dim iEh As Integer      ' n� de grille
  Dim iSce As Integer     ' n� de sc�nario
  
  ' On r�cup�re n� de grille et de sc�nario propre � partir de la r�f�rence du document
  ' Ex: refdoc 1174/1 --> grille 1174 sc�nario 1
  iEh = Val(cDoc!doc_refdoc)
  Dim ps As Integer
  ps = InStr(1, cDoc!doc_refdoc, "/")
  iSce = Val(Mid(cDoc!doc_refdoc, ps + 1))
  Debug.Assert iEh > 1000 And iEh < 1600
  Debug.Assert iSce >= 0 And iSce < 3
  
  ' 1�re partie : on lit la structure de la grille (corgri+cotation)
  Trace "Lecture de la structure de la grille Silliker " & cDoc!doc_refdoc
  Dim colCorps As New Collection
  Dim cCorps As New BDCurseur
  Dim ceh As EHCorps
  Dim iCount As Integer
  
  cCorps.OpenCurseur ("select cg_numloc, cg_serie, cot_decote, cot_options, cot_format " & _
    " from corgri, outer cotation " & _
    " where cg_numgri=" & iEh & " and cot_cgserie=cg_serie and cot_scenario=" & iSce)
  iCount = 0
  Do Until cCorps.EOF
    Set ceh = New EHCorps
    ceh.cg_numloc = cCorps!cg_numloc
    ceh.cg_serie = cCorps!cg_serie
    ceh.cot_decote = cCorps!cot_decote
    ceh.cot_options = cCorps!cot_options
    ceh.cot_format = cCorps!cot_format
    colCorps.Add ceh, "CG" & cCorps!cg_serie
    iCount = iCount + 1
    cCorps.MoveNext
  Loop
  cCorps.CloseCurseur
  Debug.Assert iCount > 0
  
  
  ' 2�me partie: on lit les donn�es de la visite
  Trace "Lecture de la visite Silliker " & cDoc!doc_lettres & cDoc!doc_plairef
  Dim cVisite As New BDCurseur
  cVisite.OpenCurseur "select ec_serie, ec_valeur, ec_decote, ec_format , ec_options, ec_systeme, ec_obs " & _
   " from ehcorps " & _
    " where ec_ref='" & cDoc!doc_lettres & cDoc!doc_plairef & "'  and ec_numgri=" & iEh
  iCount = 0
  Do Until cVisite.EOF
    Set ceh = colCorps("CG" & cVisite!ec_serie)
    ceh.ec_valeur = cVisite!ec_valeur
    ceh.ec_decote = cVisite!ec_decote
    ceh.ec_format = cVisite!ec_format
    ceh.ec_options = cVisite!ec_options
    ceh.ec_systeme = cVisite!ec_systeme
    ceh.ec_obs = cVisite!ec_obs
    ' Attention, on ne traite pas le stockage compact dans le champ ec_libst -- v�rifier qu'on ne l'utilise jamais
    ' Il est op�rationnel dans gdoc/visitec, mais inutilis� s'il n'y a pas de libell�s standard
    
    ' On en profite pour lire les obs s'il y en a
    If Not IsNull(cVisite!ec_obs) Then
'      Trace "Lecture obs " & cVisite!ec_systeme & "/" & cVisite!ec_obs
      ceh.ec_texteobs = LibObs(cVisite!ec_systeme, cVisite!ec_obs, iEh, ceh.cg_numloc)
    End If

    iCount = iCount + 1
    cVisite.MoveNext
  Loop
  cVisite.CloseCurseur
  Debug.Assert iCount > 0
  
  ' On d�termine le rayon fonction du n� de grille
  Dim iRayon As Integer
  Select Case iEh
    Case 1192: iRayon = 9   ' Tous frais tout pr�t
    Case 1175: iRayon = 99  ' Indice cha�ne du froid : Quel rayon pour Carrefour ???????
    Case Else: Stop         ' rayon inconnu !!!
  End Select
  
  ' 3�me partie: mise � jour de la collection Carrefour de ResultatAudit
  Trace "MAJ r�sultats Carrefour"
  Dim ra As R�sultatAudit
  For Each ceh In colCorps
  
    ' Cas des items "quantit�" a1, a2, b1, b2
    ' Dans ce cas, on a d�j� (en principe) converti l'enregistrement R�sultatAudit de base,
    ' il faut juste compl�ter (selon l'item quantit�...) le champ Nb_reference ou Nb_produit
    ' de l'enregistrement R�sultatAudit de base
    ' V�rifier de mani�re exhaustive que tous les items quantit� suivent ce motif (qu'il n'y a pas de 123c1 par exemple...)
    ' Ou les marquer de mani�re plus subtile, avec une option sp�ciale,
    ' ou un format sp�cial --> probablement la solution � retenir, permettant de les imprimer de
    ' mani�re sp�ciale comme le demande S.DUFORT
    If Right(ceh.cg_numloc, 2) Like "[ab][12]" Then
      ' On r�cup�re l'item "de base" qui contient d�j� le r�sultat (pour le 183a1 on r�cup�re le 183a)
      Set ra = colResultatAudit("RA" & iEh & "." & Left(ceh.cg_numloc, Len(ceh.cg_numloc) - 1))
      Assert Not (ra Is Nothing)
      ' Attention � l'ordre de lecture, qu'on ne passe pas sur l'item 183a1 avant le 183a
      ' --> traiter �a correctement...
      
      If Right(ceh.cg_numloc, 1) = "1" Then
        ra.Nb_reference = ceh.ec_valeur
      Else
        ra.Nb_produit = ceh.ec_valeur
      End If
      
    Else
      ' Cas des items 'normaux' Carrefour
      If bIsItemCarrefour(ceh.cg_numloc) Then
        Set ra = New R�sultatAudit
        ra.Id_Rayon_at = iRayon
        ra.Id_Question = ceh.cg_numloc
        Select Case ceh.ec_valeur
          Case 0: ra.Resultat = 2       ' Non vu
          Case 1: ra.Resultat = 1       ' Oui = r�sultat bon
          Case 2, 3: ra.Resultat = 0    ' Non = r�sultat non conforme
          Case Else: Stop               ' r�sultat inconnu
        End Select
        colResultatAudit.Add ra, "RA" & iEh & "." & ceh.cg_numloc
      End If
    End If
  
  Next
  
  
  ' 4�me partie: mise � jour de la collection Carrefour de CommentaireAudit
  '...
  
End Sub


' D�termine si un n� d'item doit ou non �tre transf�r� � Carrefour
' Actuellement, m�thode empirique: sont consid�r�s comme Ok les items num�riques, et les items
' num�riques suivis par une lettre de a � f...
' Gagnerait probablement � �tre plus rigoureux :
' - Tester par rapport � la liste "officielle" carrefour : permet en plus de voir si on en n'oublie pas
' - Marquer les items dans le sc�nario, avec l'option + par exemple
' - Ou sinon pointer de mani�re exhaustive tous les items de toutes les grilles pour �tre s�r de la m�thode empirique
Public Function bIsItemCarrefour(sNumIt As String) As Boolean
  If IsNumeric(sNumIt) Then
    bIsItemCarrefour = True
  Else
    bIsItemCarrefour = IsNumeric(Left(sNumIt, Len(sNumIt) - 1)) And Right(sNumIt, 1) Like "[a-f]"
  End If
End Function

' Fonction de haut niveau de lecture des observations
' R�sout les renvois vers des LS communs ou priv�s
' Ne remplace pas les � lus dans la base de donn�es
Public Function LibObs(sSyst�me As String, iNumTexte As Long, iGrille As Integer, sNumloc As String)
  Dim sObs As String
  
  ' Lit un texte d'obs dans la table obstexte, assemble les tranches de 60 caract�res
  Dim cObsTexte As New BDCurseur
  cObsTexte.OpenCurseur "select obt_indice, obt_texte from obstexte where obt_systeme='" & _
    sSyst�me & "' and obt_numtexte=" & iNumTexte & " order by obt_indice"
  Do Until cObsTexte.EOF
    sObs = sObs & cObsTexte!obt_texte & Space(60 - Len(cObsTexte!obt_texte))
    cObsTexte.MoveNext
  Loop
  cObsTexte.CloseCurseur
  sObs = Trim(sObs)
  
  ' R�solution des LS
  ' Ne fait pas les tests de bouclage, �a a �t� fait pas l'impression sous Unix
  Dim iPos As Long
  iPos = 1
  Do Until iPos > Len(sObs)
    Select Case Mid(sObs, iPos, 1)
      Case "{":   ' Champ
        Dim p1 As Long
        p1 = iPos + 1
        While IsDigit(Mid(sObs, p1, 1)): p1 = p1 + 1: Wend
        If Mid(sObs, p1, 1) = "}" And p1 - iPos > 1 Then
          ' On est tomb� sur un renvoi de LS
          Dim iLS As Long     ' No de LS
          iLS = Val(Mid(sObs, iPos + 1))
          If iLS >= 1 And iLS <= 99 Then  ' LS priv�
            iLS = iLS + iGrille * 1000000 + Val(sNumloc) * 100
          End If
          Dim sLS As String   ' Texte du LS
          sLS = LitLibStand(iLS)
          ' Substitution du LS
          sObs = Left(sObs, iPos - 1) & sLS & Mid(sObs, p1 + 1)
          ' On reprend l'analyse au d�but du libell� substitu�
        Else
          ' Champ quelconque
          iPos = p1 + 1
        End If
  
      Case Else:
        iPos = iPos + 1
    End Select
  Loop
  
End Function

Private Function IsDigit(c As String) As Boolean
  IsDigit = c >= "0" And c <= "9"
End Function


' Lit un libell� standard dans la base de donn�es (table lstexte)
' Ne lit que les LS en fran�ais
' Ne r�sout pas les renvois vers d'autres LS
' Ne remplace pas les �
Public Function LitLibStand(iNumLib As Long)
  Dim sLib As String
  Dim cLSTexte As New BDCurseur
  cLSTexte.OpenCurseur "select lst_indice, lst_texte from libstand where lst_numtexte=" & iNumLib & " and ls_langue='F' order by lst_indice"
  Do Until cLSTexte.EOF
    sLib = sLib & cLSTexte!lst_texte & Space(60 - Len(cLSTexte!lst_texte))
    cLSTexte.MoveNext
  Loop
  cLSTexte.CloseCurseur
  LitLibStand = RTrim(sLib)
End Function

Private Function TraitementExcel(sNomEtb As String, sSecteur As String) As Boolean
' lecture des infos dans classeur Excel
  
  TraitementExcel = False   ' initialisation : incorrect par d�faut
  
  Const cXlOngletPoisson As String = "POISS.QUAL"
  Const cXlOngletNotes As String = "R�capitulatif"
  
  Dim sNomMagasin As String
  Dim p1 As Integer
  Dim sPathExcel As String                    ' chemin d'acc�s � la feuille Excel
  Dim oXlClasseur As Workbook                 ' objet classeur Excel
  Dim oXlFeuillePoisson As Worksheet          ' objet feuille de calcul Excel
  Dim oXlFeuilleNotes As Worksheet            ' objet feuille de calcul Excel
  Dim oXlPlage As Range                       ' objet plage de donn�es Excel
  Dim iXlCol As Integer, iXlLig As Integer    ' colonne et ligne Excel
  Dim iNdxFeuille As Integer                  ' index d'une feuille dans un classeur Excel
  Dim sXlNomFeuille As String                 ' nom d'une feuille dans un classeur Excel
  Dim sXlRefCell As String                    ' R�f�rence de cellule Excel
  Dim sXlValCell As String                    ' Valeur de cellule Excel
  
  Dim CotPoissPlus As CotationPoisson         ' plus frais
  Dim CotPoissMoin As CotationPoisson         ' moins frais
  
  ' On v�rifie que les documents Excel sont pr�sents
  Trace "V�rification des documents Excel visite"
  p1 = InStr(1, sNomEtb, " ")
  sNomMagasin = Mid(sNomEtb, p1 + 1)
  sPathExcel = "W:\" & sSecteur & "\2002\Audit\Carrefour\Magasins\" & LCase(sNomMagasin)
  If Not bDirExists(sPathExcel) Then
    MsgBox "Impossible d'acc�der au dossier magasin [" & sPathExcel & "]" & vbNewLine & _
      "pour lire la feuille de cotation poissons. Le programme d'extraction ne peut pas continuer." & vbCrLf & vbCrLf & _
      "Si le secteur est incorrect, modifiez le code secteur dans la table �tablissement." & vbCrLf & _
      "Si le nom du dossier magasin dans [W:\" & sSecteur & "\2002\Audit\Carrefour\Magasins] est incorrect," & vbNewLine & _
      "renommez-le de fa�on � ce qu'il s'appelle exactement [" & sNomMagasin & "].", vbExclamation, App.Title
    Exit Function
  End If
  
  Trace ("Excel:V�rification du dossier du mois")
  sPathExcel = sPathExcel & "\" & Format(CDate(sDateVisite), "yymm")
  If Not bDirExists(sPathExcel) Then
    MsgBox "Impossible d'acc�der au dossier magasin du mois [" & sPathExcel & "]" & vbNewLine & _
      "pour lire la feuille de cotation poissons. Le programme d'extraction ne peut pas continuer.", vbExclamation, App.Title
    Exit Function
  End If
  
  Trace ("Excel:V�rification pr�sence feuille poisson dans le dossier du mois")
  ' La convention de nom doit �tre d�finie
  Dim sFichierPoisson As String
  sFichierPoisson = Dir(sPathExcel & "\Tableau *.xls", vbNormal)
  If sFichierPoisson = "" Then
    MsgBox "Impossible d'acc�der au fichier poisson [Tableau nnn.xls] dans le dossier magasin du mois" & vbNewLine & _
      "[" & sPathExcel & "]. Le programme d'extraction ne peut pas continuer.", vbExclamation, App.Title
    Exit Function
  End If
  
  Trace "Excel:Feuille poisson " & sFichierPoisson
  ' v�rification du contenu du classeur
  ' onglets poisson et notes
  On Error Resume Next
  Set oXlClasseur = Workbooks.Open(sPathExcel & "\" & sFichierPoisson, , True) '  en lecture seule
  If Err.Number <> 0 Then
    MsgBox "Probl�me � l'ouverture de la feuille poisson [" & sFichierPoisson & "] dans le dossier magasin du mois" & vbNewLine & _
      "[" & sPathExcel & "]. Le programme d'extraction ne peut pas continuer." & vbNewLine & vbNewLine & _
      "Erreur : " & Err.Number & " " & Err.Description, vbExclamation, App.Title
    Exit Function
  End If
  On Error GoTo 0

  Trace ("Excel:recherche feuilles notes et poissons dans le classeur")
  For iNdxFeuille = 1 To oXlClasseur.Worksheets.Count
    sXlNomFeuille = oXlClasseur.Worksheets(iNdxFeuille).Name
    If Left(sXlNomFeuille, Len(cXlOngletPoisson)) = cXlOngletPoisson Then
      If oXlFeuillePoisson Is Nothing Then Set oXlFeuillePoisson = oXlClasseur.Worksheets(sXlNomFeuille)
    ElseIf Left(sXlNomFeuille, Len(cXlOngletNotes)) = cXlOngletNotes Then
      If oXlFeuilleNotes Is Nothing Then Set oXlFeuilleNotes = oXlClasseur.Worksheets(sXlNomFeuille)
    End If
  Next iNdxFeuille
  
  If oXlFeuilleNotes Is Nothing Then
    MsgBox "Feuille des notes non trouv�e dans le fichier " & vbNewLine & _
      "[" & sPathExcel & "\" & sFichierPoisson & "]" & vbNewLine & _
      "Le nom de la feuille doit commencer par [" & cXlOngletNotes & "]", vbExclamation, App.Title
    Exit Function
  End If
  
  If oXlFeuillePoisson Is Nothing Then
    MsgBox "Feuille qualit� poisson non trouv�e dans le fichier " & vbNewLine & _
      "[" & sPathExcel & "\" & sFichierPoisson & "]" & vbNewLine & _
      "Le nom de la feuille doit commencer par [" & cXlOngletPoisson & "]", vbExclamation, App.Title
    Exit Function
  End If
  
  Trace ("Excel:contr�le feuille notes")
  iXlLig = 53: iXlCol = 2
  Set oXlPlage = oXlFeuilleNotes.Cells(iXlLig, iXlCol)
  sXlValCell = Trim(oXlPlage.Value): sXlNomFeuille = oXlFeuilleNotes.Name
  If sXlValCell <> "NOTE GLOBALE MAGASIN" Then
    MsgBox "La feuille de notes [" & sXlNomFeuille & "] du fichier " & vbNewLine & _
      "[" & sPathExcel & "\" & sFichierPoisson & "] est incorrecte." & vbNewLine & _
      "La cellule " & Chr(iXlCol + Asc("A") - 1) & iXlLig & " (L" & iXlLig & "C" & iXlCol & _
      ") ne contient pas la valeur [NOTE GLOBALE MAGASIN]", vbExclamation, App.Title
    Exit Function
  End If
  
  Trace "Excel:contr�le feuille qualit� poisson"
  iXlLig = 16: iXlCol = 1
  Set oXlPlage = oXlFeuillePoisson.Cells(iXlLig, iXlCol)
  sXlValCell = Trim(oXlPlage.Value)
  If sXlValCell <> "FR" Then
    sXlNomFeuille = oXlFeuillePoisson.Name
    MsgBox "La feuille de qualit� du poisson [" & sXlNomFeuille & "] du fichier " & vbNewLine & _
      "[" & sPathExcel & "\" & sFichierPoisson & "] est incorrecte." & vbNewLine & _
      "La cellule " & Chr(iXlCol + Asc("A") - 1) & iXlLig & " (L" & iXlLig & "C" & iXlCol & _
      ") ne contient pas la valeur [FR]", vbExclamation, App.Title
    Exit Function
  End If
  
  Trace ("Excel:Recherche note globale magasin")
  ' recherche de la note globale du magasin par rapport � la date de visite
  iXlLig = 9
  For iXlCol = 4 To 9
    Set oXlPlage = oXlFeuilleNotes.Cells(iXlLig, iXlCol)
    sXlValCell = Trim(oXlPlage.Value)
    If CDate(sXlValCell) = CDate(sDateVisite) Then Exit For
  Next iXlCol
  
  If iXlCol = 10 Then ' la date n'a pas �t� trouv�e
    MsgBox "Pas de note pour la visite du " & sDateVisite & vbNewLine & _
      "dans la feuille de notes [" & sXlNomFeuille & "] du fichier " & vbNewLine & _
      "[" & sPathExcel & "\" & sFichierPoisson & "].", vbExclamation, App.Title
    Exit Function
  Else
    Set oXlPlage = oXlFeuilleNotes.Cells(53, iXlCol)
    sglNoteGlobale = oXlPlage.Value                       ' lecture de la note globale
    Set oXlPlage = oXlFeuilleNotes.Cells(8, iXlCol)
    sXlValCell = Trim(oXlPlage.Value)
    iNoVisite = CInt(Right(sXlValCell, 1))                ' lecture du num�ro de la visite
  End If
  
  Trace ("Excel:Cotation poisson")
  For iXlLig = 18 To 32 Step 2
    Set CotPoissPlus = New CotationPoisson
    Set CotPoissMoin = New CotationPoisson
    With CotPoissPlus
      .FR = "+"
      .Esp�ces = oXlFeuillePoisson.Cells(iXlLig, 3)
      .Fournisseur = oXlFeuillePoisson.Cells(iXlLig, 4)
      .Livr = oXlFeuillePoisson.Cells(iXlLig, 5)
      .Pigm = oXlFeuillePoisson.Cells(iXlLig, 6)
      .Muc = oXlFeuillePoisson.Cells(iXlLig, 7)
      .Corn = oXlFeuillePoisson.Cells(iXlLig, 8)
      .Pupi = oXlFeuillePoisson.Cells(iXlLig, 9)
      .Couleur = oXlFeuillePoisson.Cells(iXlLig, 10)
      .Rig = oXlFeuillePoisson.Cells(iXlLig, 11)
    End With
    If CotPoissPlus.Esp�ces = "" Then Exit For
    
    With CotPoissMoin
      .FR = "-"
      .Esp�ces = oXlFeuillePoisson.Cells(iXlLig + 1, 3)
      If .Esp�ces = "" Then
        .Esp�ces = CotPoissPlus.Esp�ces
      ElseIf .Esp�ces <> CotPoissPlus.Esp�ces Then
        .Esp�ces = CotPoissPlus.Esp�ces & " " & .Esp�ces
        CotPoissPlus.Esp�ces = .Esp�ces
      End If
      .Fournisseur = oXlFeuillePoisson.Cells(iXlLig + 1, 4)
      If .Fournisseur = "" Then
        .Fournisseur = CotPoissPlus.Fournisseur
      ElseIf .Fournisseur <> CotPoissPlus.Fournisseur Then
        .Fournisseur = CotPoissPlus.Fournisseur & " " & .Fournisseur
        CotPoissPlus.Fournisseur = .Fournisseur
      End If
      .Livr = oXlFeuillePoisson.Cells(iXlLig + 1, 5)
      .Pigm = oXlFeuillePoisson.Cells(iXlLig + 1, 6)
      .Muc = oXlFeuillePoisson.Cells(iXlLig + 1, 7)
      .Corn = oXlFeuillePoisson.Cells(iXlLig + 1, 8)
      .Pupi = oXlFeuillePoisson.Cells(iXlLig + 1, 9)
      .Couleur = oXlFeuillePoisson.Cells(iXlLig + 1, 10)
      .Rig = oXlFeuillePoisson.Cells(iXlLig + 1, 11)
    End With
    
  Next iXlLig
  
  TraitementExcel = True   ' tout s'est bien d�roul�

End Function

Private Function GenerFic(sSecteur As String, sLettres As String, iRef As Long) As Boolean

  Dim sPath As String                       ' chemin d'acc�s au fichier
  Dim sFic As String                        ' nom du fichier
  Dim iRep As VbMsgBoxResult                ' r�ponse boit message
  Dim vItemColl As Variant                  ' item d'une collection
  
  Const sFrmInt As String = "#####0"        ' format d'affichage d'entier
  Const sFrmRel As String = "#####0.00####" ' format d'affichage de r�el
  Const sFrmDat As String = "dd/mm/yy"      ' format d'affichage de date
  
  GenerFic = False
  
  Trace "G�n�ration du fichier � transf�rer"
  ' V�rification de l'acc�s au dossier de stockage du fichier � transf�rer
  sPath = "W:\" & sSecteur & "\2002\Audit\Carrefour\Transfert EH"
  ' Cr�ation automatique si 'Transferts EH' inexistant
  If Not bDirExists(sPath) Then
    On Error Resume Next
    MkDir sPath
  End If
  On Error GoTo 0
  
  If Not bDirExists(sPath) Then
    MsgBox "Impossible d'acc�der au r�pertoire de stockage des fichiers � transf�rer" & vbNewLine & _
      "[" & sPath & "]" & vbNewLine & "Le programme ne peut pas continuer - " & _
      "Contactez le service informatique.", vbExclamation, App.Title
    Exit Function
  End If
  
  sFic = sPath & "\" & LCase(sLettres) & iRef & ".txt"
  If Dir(sFic, vbNormal) <> "" Then
    iRep = MsgBox("Le fichier � transf�rer '" & sFic & "' existe d�j�, voulez-vous l'�craser ?", _
      vbQuestion + vbYesNo + vbDefaultButton1, App.Title)
    If iRep = vbNo Then Exit Function
  End If
  
  ' On ouvre le fichier
  On Error Resume Next
  Open sFic For Output As #1
  If Err Then
    MsgBox "�chec � l'ouverture du fichier '" & sFic & "':" & vbCrLf & _
      "Erreur " & Err.Number & ": (" & Err.Source & ") " & Err.Description, vbExclamation, App.Title
    Exit Function
  End If
  On Error GoTo 0
 
  ' Section d'en-t�te du fichier
  Print #1, "#visite#"
  Print #1, sIdLabo; ";";                     ' identifiant laboratoire
  Print #1, sDateVisite; ";";                 ' date visite
  Print #1, sHeureVisite; ";";                ' heure visite
  Print #1, Format(iIdMagasin, sFrmInt); ";"; ' id magasin
  Print #1, Format(iNoVisite, sFrmInt); ";";  ' no visite
  Print #1, sIntervenant; ";";                ' intervenant
  Print #1, Format(sglNoteGlobale, sFrmRel)
  
  ' section r�sultat audit
  Print #1, "#audit#"
  For Each vItemColl In colResultatAudit
    With vItemColl
      Print #1, Format(.Id_Rayon_at, sFrmInt); ";";
      Print #1, .Id_Question; ";";
      Print #1, Format(.Resultat, sFrmInt); ";";
      Print #1, Format(.Nb_reference, sFrmInt); ";";
      Print #1, Format(.Nb_produit, sFrmInt)
    End With
  Next vItemColl
  
  ' section commentaire de l'audit
  Print #1, "#commentaire#"
  For Each vItemColl In colCommentaireAudit
    With vItemColl
      Print #1, Format(.Id_Rayon_at, sFrmInt); ";";
      Print #1, .Id_Question; ";";
      Print #1, Format(.Type_commentaire, sFrmInt); ";";
      Print #1, .Libelle_commentaire
    End With
  Next vItemColl
  
  ' section plan d'action
  Print #1, "#objectif#"
  
  ' section cotation poisson
  Print #1, "#poisson#"
  For Each vItemColl In colCotationPoisson
    With vItemColl
      Print #1, .FR; ";";
      Print #1, .Esp�ces; ";";
      Print #1, .Fournisseur; ";";
      Print #1, .Livr; ";";
      Print #1, Format(.Pigm, sFrmInt); ";";
      Print #1, Format(.Muc, sFrmInt); ";";
      Print #1, Format(.Corn, sFrmInt); ";";
      Print #1, Format(.Pupi, sFrmInt); ";";
      Print #1, Format(.Couleur, sFrmInt); ";";
      Print #1, Format(.Rig, sFrmInt); ";";
    End With
  Next vItemColl

  ' section notes r�capitulatives
  Print #1, "#note#"

'  Dim vTest As Variant
'  Print #1, "#test#"
'  Print #1, True; ";"; False; ";"; Now(); ";"; vTest; ";"; Format(-31, "######0"); ";"; Format(2001, "#####0"); ";"; Format(11.12, "#####0.00"); ";"
  
  Close #1

  GenerFic = True

End Function
