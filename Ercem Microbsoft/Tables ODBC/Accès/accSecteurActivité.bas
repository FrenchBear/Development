Attribute VB_Name = "accSecteurActivité"
' accSecteurActivité
' Accès aux types de prestation et gestion d'un cache
'  5/05/1998 PV
' 12/08/1999 PV Chargement différé de la collection

Option Explicit

Private m_colSecteurActivité As New Collection


Public Function colSecteurActivité() As Collection
  If m_colSecteurActivité.Count = 0 Then ChargeSecteursActivité
  Set colSecteurActivité = m_colSecteurActivité
End Function

Private Sub ChargeSecteursActivité()
  Dim cSecteurActivité As New BDCurseur
  Dim s As New SecteurActivité
  
  ' En cas de changement de système, on efface la liste
  EffaceCollection m_colSecteurActivité
  
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cSecteurActivité.OpenCurseur "select sa_secteur,sa_libelle,timestamp from secteuractivite order by sa_secteur"
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de l'accès aux secteurs d'activité." & vbCrLf & vbCrLf & "Erreur " & iErr & ": " & sErr, vbCritical, App.Title
    EmergencyExit
  End If
  
  While Not cSecteurActivité.EOF
    s.sa_secteur = cSecteurActivité!sa_secteur
    s.sa_libelle = cSecteurActivité!sa_libelle
    s.timestamp = cSecteurActivité!timestamp
    m_colSecteurActivité.Add s.Copie, "S" & s.sa_secteur
    cSecteurActivité.MoveNext
  Wend
  cSecteurActivité.CloseCurseur
End Sub


Function sNomSecteurActivité(iType As Integer) As String
  On Error Resume Next
  sNomSecteurActivité = m_colSecteurActivité("S" & iType).sa_libelle
  If Err = 0 Then Exit Function
  On Error GoTo 0
  sNomSecteurActivité = ""
End Function

