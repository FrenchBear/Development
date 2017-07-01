Attribute VB_Name = "modDiversScraw"
Attribute VB_Description = "Op�rations diverses de scraw�"
' modDiversScraw
' Op�rations diverses de scraw�
' 27/10/1997 PV
'  6/04/1998 PV  CompteAnalysesPr�vues en provenance de modConnexion
'  1/12/1998 PV  Impression dans CompteAnalysesPr�vues (Fonction COMP2)
' 26/02/1999 PV  Contr�leEtablissementM�meJour et Contr�leDDP transf�r�s depuis modConnexion
' 19/10/1999 PV  N� �tablissement char(6)
'  2/11/1999 PV    R�cup�reInfosLibRA


Option Explicit


' Ajoute chacune des lettres de sLettres � sCha�ne si elles ne sont pas d�j� pr�sentes
Public Sub AjouteLettres(ByRef sCha�ne As String, ByVal sLettres As String)
  Dim cLettre As String
  Dim i As Integer
  
  For i = 1 To Len(sLettres)
    cLettre = Mid(sLettres, i, 1)
    If InStr(sCha�ne, cLettre) = 0 Then
      sCha�ne = sCha�ne & cLettre
    End If
  Next
End Sub


' Retire � sCha�ne toutes les lettres de sLettres qui y sont pr�sentes
Public Sub RetireLettres(ByRef sCha�ne As String, ByVal sLettres As String)
  Dim cLettre As String
  Dim iPos As Integer
  Dim i As Integer
  
  For i = 1 To Len(sLettres)
    cLettre = Mid(sLettres, i, 1)
    iPos = InStr(sCha�ne, cLettre)
    If iPos > 0 Then
      sCha�ne = Left(sCha�ne, iPos - 1) & Mid(sCha�ne, iPos + 1)
    End If
  Next
End Sub



' ===============================================================================
' Compte le nombre d'analyses pr�vues pour une date donn�e et un cadre de pr�l�vement donn�
' Tous cadres de pr�l�vements si cpr=0
' Si on veut imprimer, on transmet le nom de l'imprimante

Function CompteAnalysesPr�vues(d As Date, cpr As Integer, bImpression As Boolean) As Long
  Dim sLigne As String
  Dim br As New Rev
  Dim iNb As Long

  br.AddField d, cpr, IIf(bImpression, sImprimanteLaser, "")
  Bloquer
    tcps.Envoie "COMP2 " & br.Buffer
  
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) = "->" Then GoTo suite    ' Sortie chien de garde et abandon
    br.Buffer = sLigne
    br.GetField iNb
    
    AttendSynchro
suite:
  Rel�cher
  
  CompteAnalysesPr�vues = iNb
End Function




' ===============================================================================
' V�rifie que les dates de pr�l�vement d'une r�f�rence sont homog�nes

Public Sub Contr�leDDP(ByVal sRef As String, ByVal dRef As Date)
  Dim sLigne As String
  Dim br As New Rev
  Dim sRefEch As String, dPr�l As Date
  Dim sMessage As String
  
  br.AddField sRef
  Dim iNb As Integer
  iNb = 0
  Bloquer
    tcps.Envoie "DDP " & br.Buffer
    
    Do
      sLigne = tcps.Re�oit
      If sLigne = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sRefEch, dPr�l
      
      If dPr�l <> dRef Then
        iNb = iNb + 1
        If iNb < 6 Then
          If sMessage <> "" Then sMessage = sMessage & ", "
          sMessage = sMessage & sRefEch & ": " & Format(dPr�l, "dd/mm/yyyy")
        ElseIf iNb = 6 Then
          sMessage = sMessage & ", ..."
        End If
      End If
      
    Loop
  Rel�cher
  
  If sMessage <> "" Then
    MsgBox2i "CR269", sRef, Format(dRef, "dd/mm/yyyy"), sMessage
    'MsgBox "Avertissement: Le RA " & sRef & " a �t� pr�lev� le " & Format(dRef, "dd/mm/yyyy") & ", alors que d'autres �chantillons pour cette intervention ont �t� pr�lev�s � d'autres dates :" & vbCrLf & sMessage & vbCrLf & vbCrLf & "V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
  End If
End Sub



' ===============================================================================
' V�rifie que l'�tablissement n'est pas planifi� sous une autre r�f�rence le m�me jour

Public Sub Contr�leEtablissementM�meJour(ByRef sEtb As String, ByVal dDate As Date, ByVal sRefInt As String)
  Dim sLigne As String
  Dim br As New Rev
  Dim sAutreRefInt As String
  Dim sMessage As String
  
  br.AddField sEtb
  br.AddField dDate
  br.AddField sRefInt
  Bloquer
    tcps.Envoie "PETB2 " & br.Buffer
    
    Do
      sLigne = tcps.Re�oit
      If sLigne = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sAutreRefInt
      
      If sRefInt <> sAutreRefInt Then
        If sMessage <> "" Then sMessage = sMessage & ", "
        sMessage = sMessage & sAutreRefInt
      End If
    Loop
  Rel�cher
  
  If sMessage <> "" Then
    MsgBox2i "CR270", sEtb, sNomEtablissement(sEtb), Format(dDate, "dd/mm/yyyy"), sMessage
    'MsgBox "Avertissement: Des pr�l�vements sont d�j� enregistr�s pour l'�tablissement " & iEtb & " (" & sNomEtablissement(iEtb) & ") le " & Format(dDate, "dd/mm/yyyy") & " sous d'autre(s) r�f�rence(s) d'intervention : " & vbCrLf & sMessage & vbCrLf & vbCrLf & "V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
  End If
End Sub


' ===============================================================================
' R�cup�re le n� de version de la biblio des RAs ainsi que le nombre maxi de germes

Public Sub R�cup�reInfosLibRA()
  Dim sLigne As String
  Dim br As New Rev
  
  sLigne = D�monInfo(6)
  br.Buffer = sLigne
  br.GetField VERSION_CRA, MAXLIGNERES
  
  sInfosRab = "libcra " & VERSION_CRA & ", MAXLIGNERES=" & MAXLIGNERES
End Sub

