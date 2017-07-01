Attribute VB_Name = "accSecteurActivit�"
' accSecteurActivit�
' Acc�s aux types de prestation et gestion d'un cache
'  5/05/1998 PV
' 12/08/1999 PV Chargement diff�r� de la collection

Option Explicit

Private m_colSecteurActivit� As New Collection


Public Function colSecteurActivit�() As Collection
  If m_colSecteurActivit�.Count = 0 Then ChargeSecteursActivit�
  Set colSecteurActivit� = m_colSecteurActivit�
End Function

Private Sub ChargeSecteursActivit�()
  Dim cSecteurActivit� As New BDCurseur
  Dim s As New SecteurActivit�
  
  ' En cas de changement de syst�me, on efface la liste
  EffaceCollection m_colSecteurActivit�
  
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cSecteurActivit�.OpenCurseur "select sa_secteur,sa_libelle,timestamp from secteuractivite order by sa_secteur"
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "�chec lors de l'acc�s aux secteurs d'activit�." & vbCrLf & vbCrLf & "Erreur " & iErr & ": " & sErr, vbCritical, App.Title
    EmergencyExit
  End If
  
  While Not cSecteurActivit�.EOF
    s.sa_secteur = cSecteurActivit�!sa_secteur
    s.sa_libelle = cSecteurActivit�!sa_libelle
    s.timestamp = cSecteurActivit�!timestamp
    m_colSecteurActivit�.Add s.Copie, "S" & s.sa_secteur
    cSecteurActivit�.MoveNext
  Wend
  cSecteurActivit�.CloseCurseur
End Sub


Function sNomSecteurActivit�(iType As Integer) As String
  On Error Resume Next
  sNomSecteurActivit� = m_colSecteurActivit�("S" & iType).sa_libelle
  If Err = 0 Then Exit Function
  On Error GoTo 0
  sNomSecteurActivit� = ""
End Function

