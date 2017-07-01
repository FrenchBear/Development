
Module AnalyseTexte
  Private sText As String     ' Texte à analyser
  Private iPos As Integer     ' Position courante
  
  
  Private Function Terminé() As Boolean
    Terminé = iPos > len(sText)
  End Function
  
  
  Private Sub Abort()
    err.Raise(1000)
  End Sub
  
  Private Sub Success()
    err.Raise(1001)
  End Sub
  
  
  
  Private Sub Avance(ByVal c As String)
    If mid(sText, iPos, len(c)) = c Then
      iPos += len(c)
    Else
      Abort()
    End If
  End Sub
  
  Private Sub AvanceChiffre()
    If mid(sText, iPos, 1) Like "#" Then
      iPos += 1
    Else
      Abort()
    End If
  End Sub
  
  Private Sub AvanceChiffreouAouB()
    If mid(sText, iPos, 1) Like "[AB#]" Then
      iPos += 1
    Else
      Abort()
    End If
  End Sub
  
  
  Private Function Suivant(ByVal c As String) As Boolean
    Suivant = mid(sText, iPos, len(c)) = c
  End Function
  
  Private Function SuivantChiffre() As Boolean
    SuivantChiffre = mid(sText, iPos, 1) Like "#"
  End Function
  
  
  
  
  Public Function bCtrlFournisseur2(ByVal sFour As String) As Boolean
    sText = sFour
    iPos = 1
    
    Dim iEtat As Integer = 1    ' Etat initial de l'automate
    
    Try
      
      Do
        Select Case iEtat
          Case 1          ' Début du texte
            Avance("F.")
            AvanceChiffre()
            AvanceChiffreouAouB()
            Avance(".")
            iEtat = 2
            
          Case 2          ' Immédiatement après un point
            If SuivantChiffre() Then
              AvanceChiffre()
              iEtat = 3
            ElseIf Suivant("CEE") Then
              Avance("CEE")
              iEtat = 4
            Else
              Abort()
            End If
            
          Case 3          ' Après un chiffre
            If SuivantChiffre() Then
              AvanceChiffre()
            ElseIf Suivant(".") Then
              Avance(".")
              iEtat = 2
            Else
              iEtat = 4
            End If
            
          Case 4          ' Fin de séquence
            If Suivant("-") Then
              Success()
            ElseIf Terminé() Then
              Success()
            Else
              Abort()
            End If
            
        End Select
      Loop
      
    Catch
      bCtrlFournisseur2 = err.Number = 1001
      
    End Try
    
  End Function
End Module

