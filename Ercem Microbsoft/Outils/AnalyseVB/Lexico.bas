Attribute VB_Name = "Lexico"
' Tokeniseur
' Découpe une ligne source en tokens
' 15/02/1998 PV
' 23/02/1998 PV Traitement de l'opérateur "paramètre nommé" :=

Option Explicit

Public sLigneSource As String
Public iNuméroLigne As Long

Private m_iOff As Integer
Private m_iNextOff As Integer
Private m_iNbToken As Integer
Private m_tToken() As Variant


' Obtient la ligne source complète suivante, et découpe en tokens
Private Sub NextLigneInterne()
  Dim s2 As String
  Dim bSuite As Boolean
  sLigneSource = ""
  
  m_iNbToken = 0
  ReDim tToken(iNbToken)
  Do
    Line Input #1, s2
    iNuméroLigne = iNuméroLigne + 1
    frmAnalyse.txtLigneEnCours = iNuméroLigne
    If iNuméroLigne Mod 10 = 0 Then
      frmAnalyse.txtLigneEnCours.Refresh
    End If
    
    Dim p As Integer, p0 As Integer
    p = 1
    
    sLigneSource = sLigneSource & s2
    s2 = Trim(s2)
    If s2 = "" Then Exit Sub ' Cas rapide de la ligne vide
    bSuite = False
    Do
      p0 = p
      Select Case Mid(s2, p, 1)
        Case " ": Stop                 ' Cas interdit…
        Case "'": GoTo FinInstruction  ' Commentaire, dernier champ
        
        Case """":                     ' Chaîne, traitement spécial
          Do
            p = p + 1
          Loop Until Mid(s2, p, 1) = Chr(34) And Mid(s2, p + 1, 1) <> Chr(34)
          ' Traîtement spécial des ressources
          ' Icon = "frmTest.frx":0000
          If Mid(s2, p + 1, 1) = ":" And Mid(s2, p + 2, 1) <> "" And Mid(s2, p + 2, 1) <> " " Then
            p = p + 1
            While Mid(s2, p + 1, 1) <> "" And Mid(s2, p + 1, 1) <> " "
              p = p + 1
            Wend
          End If
          
        Case "-":   ' Le moins est associé aux nb négatifs, mais séparé d'une expression (a=-Sin(45)) ou du -Step
          If Mid(s2, p + 1, 1) >= "0" And Mid(s2, p + 1, 1) <= "9" Then GoTo CasNormal
          
        Case ":"
          If iNbToken = 1 Then
            m_iNbToken = m_iNbToken + 1
            ReDim Preserve m_tToken(m_iNbToken)
            m_tToken(2) = m_tToken(1)
            m_tToken(1) = "_Label"      ' Pseudo-instruction
          End If
          
          ' Cas du := (paramètres nommés)
          If Mid(s2, p + 1, 1) = "=" Then p = p + 1
          
        Case "#":   ' Fichiers ou date
          Dim pSauve As Integer
          pSauve = p
          p = p + 1
          While Mid(s2, p, 1) <> "" And InStr("0123456789 :/AMP", Mid(s2, p, 1)) <> 0
            p = p + 1
          Wend
          If Mid(s2, p, 1) <> "#" Then p = pSauve   ' # fichier
                    
        Case ",", "(", ")"
          ' un token entier
          
        Case "_":
          If p <> Len(s2) Then GoTo CasNormal
          bSuite = True
        Case Else:
CasNormal:
          Do
            p = p + 1
            If p > Len(s2) Then Exit Do
          Loop Until InStr(Chr(9) & " :,;()", Mid(s2, p, 1)) <> 0
          
          p = p - 1
      End Select
  
      If bSuite Then GoTo LigneSuivante
      
      m_iNbToken = m_iNbToken + 1
      ReDim Preserve m_tToken(m_iNbToken)
      m_tToken(iNbToken) = Mid(s2, p0, p - p0 + 1)
      p = p + 1
      
      ' Découpage lexico après Then et avant et après Else
      ' Astuce: on insère un : dans les tokens, NextLigne fera la séparation
      If m_tToken(iNbToken) = "Then" Then
        m_iNbToken = m_iNbToken + 1
        ReDim Preserve m_tToken(m_iNbToken)
        m_tToken(iNbToken) = ":"
      End If

      If m_tToken(iNbToken) = "Else" Then
        m_iNbToken = m_iNbToken + 2
        ReDim Preserve m_tToken(m_iNbToken)
        m_tToken(iNbToken - 2) = ":"
        m_tToken(iNbToken - 1) = "Else"
        m_tToken(iNbToken) = ":"
      End If
      
      ' On saute les espaces pour se placer au début du prochain token
      Do
        If p > Len(s2) Then GoTo FinInstruction
        If Mid(s2, p, 1) <> " " And Mid(s2, p, 1) <> Chr(9) Then Exit Do
        p = p + 1
      Loop
    Loop
    Stop    ' Cas impossible
    
LigneSuivante:
    ' On enlève le _ de fin de ligne
    sLigneSource = Left(sLigneSource, Len(sLigneSource) - 1)
  Loop
  Stop    ' Cas impossible
  
FinInstruction:
  ' Cas du label numérique (éventuellement sans :)
  If IsNumeric(m_tToken(1)) Then
    m_iNbToken = m_iNbToken + 2
    ReDim Preserve m_tToken(m_iNbToken)
    m_tToken(2) = m_tToken(1)
    m_tToken(1) = "_Label"      ' Pseudo-instruction
    m_tToken(3) = ":"
  End If
End Sub



' ============================================================================
' Fournit la prochaîne ligne
' Ignore les lignes vides ou commentaires
' Sépare les :
Sub NextLigne()

  Do
restart:
    If m_iNextOff = 0 Then
      If EOF(1) Then
        m_iNbToken = 0
        bFinModule = True
        Exit Sub
      End If
    
      NextLigneInterne
      If m_iNbToken = 0 Then GoTo restart
      m_iNextOff = 0
    End If
    
    Dim i As Integer
    For i = 1 + m_iNextOff To UBound(m_tToken)
      If m_tToken(i) = ":" Then
        m_iNbToken = i - 1 - m_iNextOff
        m_iOff = m_iNextOff
        m_iNextOff = i
        Exit Sub
      End If
    Next
    m_iOff = m_iNextOff
    m_iNextOff = 0
    m_iNbToken = UBound(m_tToken) - m_iOff
    
    If m_iNbToken > 0 Then Exit Sub
  Loop
End Sub


' Fonctions d'accès
Public Function tToken(ByVal i As Integer) As Variant
  If m_iOff + i > UBound(m_tToken) Then
    tToken = ""
  Else
    tToken = m_tToken(m_iOff + i)
  End If
End Function

Public Function iNbToken() As Integer
  iNbToken = m_iNbToken
End Function
