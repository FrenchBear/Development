VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "BDCurseur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Emballage des dynaset pour une bibliothèque de curseurs stable"
' BDCurseur
' Emballage des dynaset pour faire les conversions Informix - VB
' Implémentation basée sur RDO 2.0

' 19/01/1998 PV
' 15/08/1998 PV debug.assert sur l'état du curseur
' 23/11/1998 PV Gestion des locales de la BD
' 26/01/1999 PV Ai découvert que RDO ne supporte pas la fonction clone…
' 19/05/1999 PV Fin de la gestion OEM-ANSI
' 15/06/1999 PV Sablier pendant l'ouverture de curseur
' 16/07/1999 PV AbsolutePosition et PercentPosition: function --> property get/let (peuvent être définis)
' 23/11/1999 PV Item --> Fields (au pluriel car c'est une collection)
' 10/12/2001 PV Filtrage des caractères dans les champs strings (lors d'un let)


Option Explicit

' Vrai si l'enregistrement courant a été effacé
' Un movexxx efface cette condition (mais ne garantit pas que l'enregistrement atteint existe)
Public bEffacé As Boolean

Private rs As rdoResultset    ' Le curseur RDO



' Destructeur de secours (peut-être inutile…)
Private Sub Class_Terminate()
  If Not rs Is Nothing Then rs.Close
End Sub

' Assistance au développement
Private Sub AssertCurseurOuvert()
  If rs Is Nothing Then Err.Raise 40002, "Bibliothèque BDCurseur", "Appel interdit tant que le curseur n'est pas ouvert."
End Sub


' Fonctions/Méthodes publiques

' Ouverture/Fermeture
Public Sub OpenCurseur(ByVal sSQL As String)
Attribute OpenCurseur.VB_Description = "Ouvre le jeu curseur à partir d'une requête SQL"
  If Not (rs Is Nothing) Then Err.Raise 40002, "Bibliothèque BDCurseur", "Appel interdit tant que le curseur actuel n'est pas fermé."
  Dim oldMousePointer As Integer
  oldMousePointer = Screen.MousePointer
  Screen.MousePointer = vbHourglass
  On Error GoTo Problème
  BDcn.QueryTimeout = 30000
  Set rs = BDcn.OpenResultset(sSQL, rdOpenKeyset, rdConcurRowVer, rdExecDirect)
  Screen.MousePointer = oldMousePointer
  Exit Sub
  
Problème:
  Screen.MousePointer = oldMousePointer
  
  Err.Raise Err.Number, Err.Source, Err.Description
End Sub


Public Sub CloseCurseur()
Attribute CloseCurseur.VB_Description = "Ferme le curseur de données"
  AssertCurseurOuvert
  rs.Close
  Set rs = Nothing
End Sub


' Attention - Curseur ouvert ne signifie pas que le jeu d'enregistrements
' associé ne soit pas vide…
Public Function bCurseurOuvert() As Boolean
  bCurseurOuvert = Not (rs Is Nothing)
End Function


' Déplacements
Public Sub MoveNext()
Attribute MoveNext.VB_Description = "Posisionne le curseur sur l'enregistrement suivant"
  AssertCurseurOuvert
  rs.MoveNext
  bEffacé = False
End Sub

Public Sub MovePrevious()
Attribute MovePrevious.VB_Description = "Posisionne le curseur sur l'enregistrement précédent"
  AssertCurseurOuvert
  rs.MovePrevious
  bEffacé = False
End Sub

Public Sub MoveFirst()
Attribute MoveFirst.VB_Description = "Posisionne le curseur sur le premier enregistrement"
  AssertCurseurOuvert
  rs.MoveFirst
  bEffacé = False
End Sub

Public Sub MoveLast()
Attribute MoveLast.VB_Description = "Posisionne le curseur sur le dernier enregistrement"
  AssertCurseurOuvert
    
  ' Le déplacement peut être lent, d'où le sablier !
  Dim oldMousePointer As Integer
  oldMousePointer = Screen.MousePointer
  Screen.MousePointer = vbHourglass

  rs.MoveLast
  bEffacé = False
  
  Screen.MousePointer = oldMousePointer
End Sub

Public Sub Move(Rows As Long, Optional StartBookmark)
Attribute Move.VB_Description = "Repositionne l'enregistrement courant"
  AssertCurseurOuvert
  If IsMissing(StartBookmark) Then
    rs.Move Rows
  Else
    rs.Move Rows, StartBookmark
  End If
  bEffacé = False
End Sub


Function EOF() As Boolean
Attribute EOF.VB_Description = "Vrai si l'enregistrement courant est situé après le dernier enregistrement de données"
  AssertCurseurOuvert
  EOF = rs.EOF
End Function

Function BOF() As Boolean
Attribute BOF.VB_Description = "Vrai si l'enregistrement courant est situé avant le premier enregistrement de données"
  AssertCurseurOuvert
  BOF = rs.BOF
End Function


' Base 1, ou -1 s'il n'y a pas d'enregistrement
Public Property Get AbsolutePosition() As Long
  AssertCurseurOuvert
  AbsolutePosition = rs.AbsolutePosition
End Property

Public Property Let AbsolutePosition(lNewPos As Long)
  AssertCurseurOuvert
  rs.AbsolutePosition = lNewPos
End Property


Public Property Get PercentPosition() As Single
  AssertCurseurOuvert
  PercentPosition = rs.PercentPosition
End Property

Public Property Let PercentPosition(fNewPos As Single)
  AssertCurseurOuvert
  rs.PercentPosition = fNewPos
End Property




' Divers (Information)
Function Name() As String
Attribute Name.VB_Description = "Nom défini par l'utilisateur"
  AssertCurseurOuvert
  Name = rs.Name
End Function

Function Updatable() As Boolean
Attribute Updatable.VB_Description = "Vrai si l'enregistrement courant est modifiable"
  AssertCurseurOuvert
  Updatable = rs.Updatable
End Function

Function Bookmarkable() As Boolean
Attribute Bookmarkable.VB_Description = "Vrai si le curseur prend en charge les signets"
  AssertCurseurOuvert
  Bookmarkable = rs.Bookmarkable
End Function

Function TypeCurseur() As Integer
Attribute TypeCurseur.VB_Description = "Renvoie ou définit une valeur indiquant le type ou le type de données du curseur (constantes RDO)"
  AssertCurseurOuvert
  TypeCurseur = rs.Type
End Function

Function EditMode() As Long
Attribute EditMode.VB_Description = "Renvoie une valeur qui indique l'état de modification de l'enregistrement courant"
  AssertCurseurOuvert
  EditMode = rs.EditMode
End Function



' Accès aux champs (méthode par défaut)
Public Property Get Fields(ByVal sChamp As Variant) As Variant
Attribute Fields.VB_Description = "Accès à un champ de l'enregistrement courant"
Attribute Fields.VB_UserMemId = 0
  AssertCurseurOuvert
  On Error GoTo pb
  If rs(sChamp).Type = rdTypeCHAR Then
    If IsNull(rs(sChamp).Value) Then
      Fields = Null     ' rs(sChamp).Value
    Else
      Fields = RTrim(rs(sChamp).Value)
    End If
'  ElseIf rs(sChamp).Type = rdTypeDATE Then
'    If IsNull(rs(sChamp).Value) Then
'      Fields = Null     ' rs(sChamp).Value
'    Else
'      Fields = Format(rs(sChamp).Value, "dd/mm/yyyy")
'    End If
  Else
      Fields = rs(sChamp).Value
  End If
  Exit Property
  
pb:
  Err.Raise Err.Number, "Get Fields", "BDCurseur.GetFields: champ " & sChamp & " inexistant dans le recordset."
End Property


' Filtrage des caractères <32 et entre 127..159 pour éviter de planter la synchro
Public Property Let Fields(ByVal sChamp As Variant, ByVal vNewValue As Variant)
  AssertCurseurOuvert
  If rs(sChamp).Type = rdTypeCHAR Then
    If IsNull(vNewValue) Then
      rs(sChamp).Value = Null         ' vNewValue
    Else
      Dim i As Integer, c As Integer, sNewValue As String
      sNewValue = CStr(vNewValue)
      For i = 1 To Len(sNewValue)
        c = Asc(Mid(sNewValue, i, 1))
        If c < 32 Or (c >= 127 And c <= 159) Or c > 255 Then Mid(sNewValue, i, 1) = " "
      Next
      rs(sChamp).Value = sNewValue
    End If
  Else
  rs(sChamp).Value = vNewValue
  End If
End Property


Public Sub AddNew()
Attribute AddNew.VB_Description = "Ajoute un nouvel enregistrement"
  AssertCurseurOuvert
  rs.AddNew
End Sub

' Manipulation d'enregistrements
Public Sub Edit()
Attribute Edit.VB_Description = "Modifie les valeurs des données de l'enregistrement courant"
  AssertCurseurOuvert
  rs.Edit
End Sub

Public Sub Update()
Attribute Update.VB_Description = "Met à jour les données sur disque"
  AssertCurseurOuvert
  rs.Update
End Sub

Public Sub CancelUpdate()
Attribute CancelUpdate.VB_Description = "Annule toutes les mise à jour en attente"
  AssertCurseurOuvert
  rs.CancelUpdate
End Sub

Public Sub Delete()
Attribute Delete.VB_Description = "Supprime l'enregistrement courant"
  AssertCurseurOuvert
  rs.Delete
  bEffacé = True
End Sub
