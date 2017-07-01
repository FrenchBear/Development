VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Intervention"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Implante un objet planning simple"
' Classe intervention
' Implante un objet intervention simple (table planning)
' 21/07/1996 PV
' 20/01/1997 PV Gestion de la lettre du système
' 30/01/1997 PV Fin des champs pla_flags, pla_cra, pla_eh; Ajout des champs de traçabilité BL et FP
' 10/04/1998 PV Heure arrivée+départ, type prestation, code activité, code client
' 13/04/1998 PV Planning --> Intervention. Fin des infos de clôture
' 03/06/1998 PC etb_proprio
' 18/03/1999 PV +pla_dateorigine
' 10/03/2000 PV Gestion du nombre d'huiles
' 27/03/2000 PV N° d'EH et durée
' 28/03/2000 PV Secrétariat et labo
' 21/09/2000 PV Infos de validation
' 30/09/2000 PV Avis de passage
'  1/10/2000 PV +pla_decoupage, pla_facncp, pla_facndp, pla_fact
' 16/10/2000 PV +pla_tretatdocmin, pla_tretatdocmax, pla_tretatfac
' 29/10/2000 PV +pla_fpstandard, +pla_refcom
' 27/11/2000 PV +pla_etatlabo, +pla_etatfac, +pla_labxx
'  8/12/2000 PV Propriété Etb
' 20/01/2000 PV Date d'expiration des infos
'  8/03/2001 PV -pla_facncp, -pla_facndp, -pla_fact, -pla_etatlabo mais proto inchangé
'  6/08/2001 PV +pla_tabech

Option Explicit

' Propriétés
Public pla_systeme As String
Public pla_serie As Long
Public pla_iref
Public pla_lettres As String
Public pla_dateplan As Date
Public pla_etb As String
Public pla_pers As Integer
Public pla_unite As Integer
Public pla_comment As String
Public pla_nbab
Public pla_nbeh
Public pla_nbbs
Public pla_nbli
Public pla_nbfs
Public pla_nbhu
Public pla_nbch
Public etb_prefixe As String
Public etb_nom As String
Public etb_proprio As String
Public pla_operbl
Public pla_tsbl                   ' As date, mais peut être null
Public pla_operfp
Public pla_tsfp                   ' As date, mais peut être null
Public pla_harrivee
Public pla_hdepart
Public pla_typeprest
Public pla_activite
Public pla_client As String
Public pla_dateorigine            ' Date précédente (avant mouvement)
Public pla_numeh As String        ' N° de l'EH
Public pla_dureh                  ' Durée de l'EH
Public pla_secret As String       ' Code du secrétariat assurant la saisie
Public pla_labo As String         ' Code du labo réceptionnant les échantillons
Public pla_opervalid              ' Code personne ayant validé
Public pla_datevalid              ' Date de validation
Public pla_avispassage As String  ' Avis de passage à imprimer O/N (jamais NULL)
Public pla_decoupage As String    ' Règle de découpage de l'intervention O/N (jamais NULL)
Public pla_tretatdocmin As String ' Etat minimum des 26 tranches
Public pla_tretatdocmax As String ' Etat maximum des 26 tranches
Public pla_tretatfac As String    ' Etat de facturation des 26 tranches
Public pla_fpstandard As String   ' O/N
Public pla_refcom As String       ' Référence commande client/prestation
Public pla_etatfac                ' O s'il faut transférer la prestation en fact même en l'absence de documents
Public pla_labab                  ' Nb d'échantillons au labo
Public pla_labbs
Public pla_labli
Public pla_labfs
Public pla_labhu
Public pla_labch
Public pla_tabech As String       ' Tableau des codes labo ayant enregistré les échantillons



' Gestion du cache
Public tsCache As Long            ' Nb de secondes écoulées depuis minuit au moment de la création ou de la dernière écriture dans la base de données

Private Sub Class_Initialize()
  tsCache = CLng(Timer)
End Sub


' On expire au bout de 60 secondes
Public Property Get bDonnéesExpirées() As Boolean
  bDonnéesExpirées = CLng(Timer) - tsCache > 60
End Property


' Retourne l'objet établissement associé au planning
Public Property Get Etb() As Etablissement
  Set Etb = LireEtablissement(pla_etb, False)
End Property


Public Property Get bValidé() As Boolean
  bValidé = (Not IsNull(pla_opervalid)) And (Not IsNull(pla_datevalid))
End Property


Public Property Get pla_nompers() As String
  Dim u As Utilisateur
  Set u = UtiParNuméro(pla_pers)
  If u Is Nothing Then
    pla_nompers = "Utilisateur inconnu"
  Else
    pla_nompers = u.uti_nom
  End If
End Property


Public Property Get pla_nomunite() As String
  Dim u As Unite
  Set u = UniParNuméro(pla_unite)
  If u Is Nothing Then
    pla_nomunite = "Unité inconnue"
  Else
    pla_nomunite = u.uni_code & " " & u.uni_titre
  End If
End Property



Function Copie() As Intervention
  Dim k As New Intervention
  With k
    .pla_systeme = pla_systeme
    .pla_serie = pla_serie
    .pla_iref = pla_iref
    .pla_lettres = pla_lettres
    .pla_dateplan = pla_dateplan
    .pla_etb = pla_etb
    .pla_pers = pla_pers
    .pla_unite = pla_unite
    .pla_comment = pla_comment
    .pla_nbab = pla_nbab
    .pla_nbeh = pla_nbeh
    .pla_nbbs = pla_nbbs
    .pla_nbli = pla_nbli
    .pla_nbfs = pla_nbfs
    .pla_nbhu = pla_nbhu
    .pla_nbch = pla_nbch
    .etb_prefixe = etb_prefixe
    .etb_nom = etb_nom
    .etb_proprio = etb_proprio
    .pla_tsbl = pla_tsbl
    .pla_operbl = pla_operbl
    .pla_tsfp = pla_tsfp
    .pla_operfp = pla_operfp
    .pla_harrivee = pla_harrivee
    .pla_hdepart = pla_hdepart
    .pla_typeprest = pla_typeprest
    .pla_activite = pla_activite
    .pla_client = pla_client
    .pla_dateorigine = pla_dateorigine
    .pla_numeh = pla_numeh
    .pla_dureh = pla_dureh
    .pla_secret = pla_secret
    .pla_labo = pla_labo
    .pla_opervalid = pla_opervalid
    .pla_datevalid = pla_datevalid
    .pla_avispassage = pla_avispassage
    .pla_decoupage = pla_decoupage
    .pla_tretatdocmin = pla_tretatdocmin
    .pla_tretatdocmax = pla_tretatdocmax
    .pla_tretatfac = pla_tretatfac
    .pla_fpstandard = pla_fpstandard
    .pla_refcom = pla_refcom
    .pla_etatfac = pla_etatfac
    .pla_labab = pla_labab
    .pla_labbs = pla_labbs
    .pla_labli = pla_labli
    .pla_labfs = pla_labfs
    .pla_labhu = pla_labhu
    .pla_labch = pla_labch
    .pla_tabech = pla_tabech
  End With
  Set Copie = k
End Function

