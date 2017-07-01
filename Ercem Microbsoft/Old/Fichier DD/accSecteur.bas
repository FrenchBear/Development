Attribute VB_Name = "accSecteur"
' accSecteur
' Accès aux informations de la table secteur
' Gestion d'un cache local en mémoire

Option Explicit

Private colSecteur As New Collection

Public Function sNomSecteur(ByVal iNumSec As Long) As String
  Dim s As Secteur
  
  Set s = LireSecteur(iNumSec, False)
  If Not s Is Nothing Then
    sNomSecteur = s.sec_nom
  Else
    sNomSecteur = "??? SECTEUR " & iNumSec & " INCONNU"
  End If
End Function


Public Function sNomSecteurDuCache(ByVal iNumSec As Long) As String
  Dim s As Secteur
  
  On Error Resume Next
  Set s = colSecteur("S" & iNumSec)
  If Err = 0 Then
    sNomSecteurDuCache = s.sec_nom
  Else
    sNomSecteurDuCache = ""
  End If
End Function


' Lit complètement un établissement
Public Function LireSecteur(iNumSec As Long, bComplet As Boolean) As Secteur

  ' On cherche d'abord dans le cache
  Dim sc As Secteur
  On Error Resume Next
  Set sc = colSecteur("S" & iNumSec)
  If Err = 0 Then                       ' On l'a trouvé dans le cache !
    If sc.bComplet Or Not bComplet Then
      Set LireSecteur = sc
      Exit Function                     ' Et c'est fini pour LireSecteur
    End If
  End If
  
  ' Pas trouvé dans le cache, on cherche dans la base
  On Error GoTo 0
  
  Dim cSec As New BDCurseur
  cSec.OpenCurseur "select sec_numsec,sec_nom from secteur where sec_numsec=" & iNumSec
  If cSec.EOF Then
    Set LireSecteur = Nothing
    Exit Function
  End If
  
  Dim sb As New Secteur
  sb.bComplet = False
  sb.sec_numsec = cSec!sec_numsec
  sb.sec_nom = cSec!sec_nom
  
  cSec.CloseCurseur
  
  ' On sauvegarde dans le cache
  colSecteur.Add sb.Copie, "S" & iNumSec
  
  Set LireSecteur = sb
End Function

