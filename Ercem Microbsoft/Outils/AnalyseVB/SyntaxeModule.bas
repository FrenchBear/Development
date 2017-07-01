Attribute VB_Name = "SyntaxeModule"
' SyntaxeModule
' Suit l'état entre les lignes
' 17/02/1998 PV

Option Explicit

Enum eEtatLigne
  elInitial         ' Etat initial (VERSION)
  elPropriétés      ' Objets d'interface / Propriétés
  elAttributes      ' Section attributes
  elExterne         ' Niveau global
  elType
  elEnum
  elProcédure
End Enum

Public elEtat As eEtatLigne           ' Etat de la ligne en cours
Private elNextEtat As eEtatLigne      ' Etat après la ligne en cours

Public bFinModule As Boolean

' Suivi des niveaux d'imbrication des structures apairées
Private iNivSelect As Integer
Private iNivWith As Integer
Private iNivDo As Integer
Private iNivWhile As Integer
Private iNivBegin As Integer

Public Function sEtatLigne(ByVal e As eEtatLigne)
  Select Case e
    Case elInitial:     sEtatLigne = "Initial"
    Case elPropriétés:  sEtatLigne = "Propriétés"
    Case elAttributes:  sEtatLigne = "Attributes"
    Case elExterne:     sEtatLigne = "Externe"
    Case elType:        sEtatLigne = "Type"
    Case elEnum:        sEtatLigne = "Enum"
    Case elProcédure:   sEtatLigne = "Procédure"
    Case Else:          Stop
  End Select
End Function

Public Sub InitModule()
  bFinModule = False
  iNuméroLigne = 0
  elEtat = elInitial
  elNextEtat = elInitial
  
  iNivSelect = 0
  iNivWith = 0
  iNivDo = 0
  iNivWhile = 0
  iNivBegin = 0
End Sub

Public Sub NextLigneModule()
  elEtat = elNextEtat
  
  NextLigne
  DétermineTypeLigne
  
  ' Correction de type de ligne pour le End de fin de programme
  If tlTypeLigne = tlEnd And elEtat = elProcédure Then
    tlTypeLigne = tlStop
  End If
  
  ' Fin de la section attributes, passage en section externe
  If elEtat = elAttributes And tlTypeLigne <> tlAttribute Then
    elEtat = elExterne
  End If
  
  elNextEtat = elEtat     ' Par défaut
  Select Case tlTypeLigne
    Case tlAttribute:
      If (elEtat = elInitial) Or (elEtat = elAttributes) Then
        Assert iNivBegin = 0
        elEtat = elAttributes
        elNextEtat = elAttributes
      ElseIf elEtat = elProcédure Then     ' Attributs de procédures
        elEtat = elAttributes
        ' Etat provisoire
      End If
      
    Case tlBegin:
      Assert (elEtat = elInitial) Or (elEtat = elPropriétés)
      elEtat = elPropriétés
      elNextEtat = elPropriétés
      iNivBegin = iNivBegin + 1
      
    Case tlEnd:
      Assert iNivBegin > 0
      iNivBegin = iNivBegin - 1
      If iNivBegin = 0 Then elNextEtat = elInitial
    
    Case tlProcédure:
      Assert elEtat = elExterne
      elEtat = elProcédure
      elNextEtat = elProcédure
      
    Case tlEndSub:
      Assert elEtat = elProcédure
      Assert iNivSelect = 0
      Assert iNivWith = 0
      Assert iNivDo = 0
      Assert iNivWhile = 0
      elNextEtat = elExterne
      
    Case tlType:
      Assert elEtat = elExterne
      elEtat = elType
      elNextEtat = elType
    
    Case tlEndType:
      Assert elEtat = elType
      elNextEtat = elExterne
    
    Case tlEnum:
      Assert elEtat = elExterne
      elEtat = elEnum
      elNextEtat = elEnum
      GoTo SuiteModule      ' Pas de correction sur la 1ère ligne enum
    
    Case tlEndEnum:
      Assert elEtat = elEnum
      elNextEtat = elExterne
      GoTo SuiteModule      ' Pas de correction sur la dernière ligne enum
      
    Case tlSelect:    iNivSelect = iNivSelect + 1
    Case tlEndSelect: iNivSelect = iNivSelect - 1
    Case tlWith:      iNivWith = iNivWith + 1
    Case tlEndWith:   iNivWith = iNivWith - 1
    Case tlDo:        iNivDo = iNivDo + 1
    Case tlLoop:      iNivDo = iNivDo - 1
    Case tlWhile:     iNivWhile = iNivWhile + 1
    Case tlWend:      iNivWhile = iNivWhile - 1
  End Select
  
  ' Correction du type de ligne en milieu d'énum, ce que ne peut pas faire
  ' SyntaxeLigne…
  If elEtat = elEnum Then tlTypeLigne = tlConstEnum
  
SuiteModule:
  
End Sub
