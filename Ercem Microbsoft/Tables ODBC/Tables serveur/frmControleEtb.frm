VERSION 5.00
Begin VB.Form frmTransfertEtb 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Transfert des établissements en comptabilité"
   ClientHeight    =   5010
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6510
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
   ScaleHeight     =   5010
   ScaleWidth      =   6510
End
Attribute VB_Name = "frmTransfertEtb"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmContrôleEtb
' Effectue des tests généraux sur le fichier établissement
'  6/06/00 PV
'  6/12/00 PV   Transfert des adresses de facturation en priorité
' 10/04/01 PV   Transfert si etb_numetb=etb_facture
'  6/12/01 PV   Transfert d'un libellé court demande L.SURCIN


Option Explicit


Private Sub Form_Load()
  ResetChienDeGarde
  Show
  Screen.MousePointer = vbHourglass
  TestCP
  Ligne "Terminé !"
  SetStatus
  Screen.MousePointer = vbDefault
  ResetChienDeGarde
End Sub


Private Sub Ligne(sTexte As String)
  Print sTexte
  Refresh
End Sub


Private Sub TestCP()
  Dim iNbEtb As Long
  Dim iNb As Long
  
  Ligne "Contrôle des centres payeurs"
  iNbEtb = BDCurseurExpress("select count(*) from etablissement")
  Ligne iNbEtb & " établissements dans la base"
  Ligne "Patientez, l'analyse prendra plusieurs minutes !"
  
  SetStatus "Contrôle des centres payeurs à 0 / NULL"
  iNb = BDCurseurExpress("select count(*) from etablissement where etb_compta is null or etb_compta='0'")
  If iNb > 0 Then Ligne "  " & iNb & " établissement(s) sans centre payeur (0 ou vide)"
  
'  SetStatus "Extraction des centres payeurs"
'  RunSQL "create table tcp(k char(6) not null primary key);"
'  RunSQL "insert into tcp(k) select unique etb_compta as k from etablissement where etb_compta is not null and etb_compta<>'0';"
  
GoTo suite
  SetStatus "Contrôle des centres payeurs rattachés à un autre centre payeur"
  Dim c As New BDCurseur
  c.OpenCurseur "select etb_numetb from etablissement"
  Do While Not c.EOF
    Ligne "  Centre payeur transitif ETB=" & c!etb_numetb
    c.MoveNext
  Loop
  c.CloseCurseur
  
  SetStatus "Contrôle des centres payeurs incorrects"
  c.OpenCurseur "select k from tcp where k not in (select etb_numetb from etablissement)"
  Do While Not c.EOF
    Ligne "  Centre payeur incorrect CP=" & c!etb_numetb
    c.MoveNext
  Loop
  c.CloseCurseur
suite:

  SetStatus "Extraction des établissements facturés"
  Open "\\sagetse\public\cli.txt" For Output As #1
'  Open "C:\absys\Import de clients\cli.txt" For Output As #1
  'C:\absys\Import de clients
'  Open "W:\Privé\pievio\Compta\Transfert etb\cli.txt" For Output As #1
'  Open "D:\Mes documents\Compta\Transfert etb\cp.txt" For Output As #2
  c.OpenCurseur "select etb_numetb,etb_prefixe,etb_nom,etb_rue,etb_loc,etb_cpost,etb_bdist,etb_altadr,etb_altnom,etb_altrue,etb_altloc,etb_altcpost,etb_altbdist,etb_tel,etb_fax,etb_pays,etb_tva,etb_correspcompta,etb_codetva,etb_centrepayeur,etb_collectif,etb_numgrf,etb_facture from etablissement where etb_numetb=etb_facture and etb_etat is null"
  Dim iRec As Long
  Do Until c.EOF
    iRec = iRec + 1
    If iRec Mod 100 = 0 Then SetStatus "Extraction des établissements facturés " & iRec & " (" & Format(iRec / iNbEtb, "0.0%") & ")": DoEvents
    
    EcritEnregistrement 1, c
'    If Not IsNull(c!k) Then EcritEnregistrement 2, c
    
    c.MoveNext
  Loop
  c.CloseCurseur
'  Close #2
  Close #1
  Ligne iRec & " établissements transférés"
  
'  RunSQL "drop table tcp"
End Sub


Private Sub EcritEnregistrement(iFic As Integer, c As BDCurseur)
  Dim sNom, sRue, sLoc, sCPost, sBDist
  If c!etb_altadr = "O" Then
    sNom = c!etb_altnom
    sRue = c!etb_altrue
    sLoc = c!etb_altloc
    sCPost = c!etb_altcpost
    sBDist = c!etb_altbdist
  Else
    sNom = c!etb_nom
    sRue = c!etb_rue
    sLoc = c!etb_loc
    sCPost = c!etb_cpost
    sBDist = c!etb_bdist
  End If
  
  Dim sNomCourt As String, s1 As String, s2 As String
  If IsNull(c!etb_numgrf) Then
    s1 = "00000"
  Else
    s1 = c!etb_numgrf
    If Len(s1) < 5 Then s1 = String(5 - Len(s1), "0") & s1
    If Len(s1) > 5 Then s1 = Left(s1, 5)
  End If
  If IsNull(c!etb_facture) Then
    s2 = "00000"
  Else
    s2 = c!etb_facture
    If Len(s2) < 5 Then s2 = String(5 - Len(s2), "0") & s2
    If Len(s2) > 5 Then s2 = Left(s2, 5)
  End If
  sNomCourt = s1 & s2
  
  Print #iFic, F(6, c!etb_numetb); _
                F(10, nc(c!etb_numetb, c!etb_numetb)); _
                F(10, nc(c!etb_collectif, c!etb_numetb)); _
                F(30, sNom); _
                F(30, sRue); _
                F(30, sLoc); _
                F(5, sCPost); F(30, sBDist); _
                F(15, c!etb_tel); F(15, c!etb_fax); _
                F(30, c!etb_correspcompta); _
                F(12, c!etb_prefixe); _
                F(10, sNomCourt)
                
End Sub

Private Function F(iTaille As Integer, ByVal vVal As Variant) As String
  If IsNull(vVal) Then
    vVal = ""
  Else
    vVal = CStr(vVal)
  End If
  If Len(vVal) > iTaille Then
    F = Left(vVal, iTaille)
  Else
    F = vVal & Space(iTaille - Len(vVal))
  End If
End Function


Function nc(ByVal sCompte, sDéfaut As String) As String
  If IsNull(sCompte) Then sCompte = sDéfaut
  nc = Left("4110000000", 10 - Len(sCompte)) & sCompte
End Function
