VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Rev"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Implantation VB de la bibliotèque de Représentation Externe des Valeurs"
' rev.cls
' Implantation VB de la bibliotèque de Représentation Externe des Valeurs
' Utilisée pour les applications C/S entre VB et Unix
' 05/08/96 PV Version 1.0
' 25/11/96 PV Codage correct des caractères<32 dans les chaînes
' 16/01/97 PV Fonction iGetField pour récupérer un champ avec code de retour sans planter
' 18/03/97 PV Retour -7 au iGet1Field pour NULL non supporté par la variable

Option Explicit

Private sBufferBase As String
Private iNbLigTab As Integer
Private iNbLigTabAttendues As Integer
Private colLigTab As New Collection   ' Buffer tableau

' Position courante pour le décodage
Private iPosDecodage As Integer       ' Position courante dans sBufferBase
Private iTabDecodage As Integer       ' Indice du buffer tableau en cours de décodage
Private iPosTabDecodage As Integer    ' position courante dans colLigTab(itabDecodage)

' Message d'erreur de iGetField
Private sMessageErr As String

Public pbar As Control                ' Optionnel, pour afficher la progression lors du décodage d'un tableau

Private Const sNomBib = "Bibliothèque REV/VB 1.1"
Private Const bModeDebug = False


Private Sub Add1Field(sBuffer As String, champ As Variant)
  Dim dDate As Double
  Dim i As Integer, c As String
  
  Select Case VarType(champ)
    Case vbEmpty, vbNull
      ' On ne fait rien
    
    Case vbInteger, vbLong, vbSingle, vbDouble, vbByte
      ' Représentation décimale standard. Séparateur décimal: le point
      If champ < 0 Then
        sBuffer = sBuffer + Str(champ)
      Else
        sBuffer = sBuffer + Mid(Str(champ), 2)
      End If
    
    Case vbBoolean
      If champ Then
        sBuffer = sBuffer + "V"
      Else
        sBuffer = sBuffer + "F"
      End If
      
    Case vbDate
      dDate = CDbl(champ)
      If dDate = Int(dDate) Then
        sBuffer = sBuffer + "#" + Format(Day(champ), "00") & "/" & Format(Month(champ), "00") & "/" & Format(Year(champ), "0000") + "#"
      Else
        sBuffer = sBuffer + "#" + Format(Day(champ), "00") & "/" & Format(Month(champ), "00") & "/" & Format(Year(champ), "0000") & " " & Format(Hour(champ), "00") & ":" & Format(Minute(champ), "00") & ":" & Format(Second(champ), "00") + "#"
      End If
      
    Case vbString
      sBuffer = sBuffer + """"
      For i = 1 To Len(champ)
        c = Mid(champ, i, 1)
        Select Case c
          Case Is < " "
            sBuffer = sBuffer + "^" + Chr(64 + Asc(c))
          Case """", "|", "\"
            sBuffer = sBuffer + "\" + c
          Case Else
            sBuffer = sBuffer + c
        End Select
      Next
      sBuffer = sBuffer + """"
      
    Case Is >= vbArray
      Dim d As Integer, iNbDim As Integer
      Dim sDim As String
      On Error Resume Next
      For i = 1 To 3
        d = UBound(champ, i) - LBound(champ, i) + 1
        If Err Then Exit For
        iNbDim = iNbDim + 1
        sDim = sDim + ";" + d
      Next
      On Error GoTo 0
      If iNbDim < 1 Or iNbDim > 2 Then
        MsgBox2i "CO072"
        'MsgBox "Add1Field: Seuls les tableaux à 1 ou 2 dimensions sont pris en charge.", vbCritical, sNomBib
        Stop
      End If
      sBuffer = sBuffer + "{" + iNbDim + sDim + "}"
      
      Dim sLigne As String
      If iNbDim = 1 Then
        sLigne = ""
        For i = LBound(champ, 1) To UBound(champ, 1)
          Add1Field sLigne, champ(i)
        Next
        sLigne = sLigne + "{}|"
        colLigTab.Add sLigne
        iNbLigTab = iNbLigTab + 1
      Else
        Dim j As Integer
        For i = LBound(champ, 1) To UBound(champ, 1)
          sLigne = ""
          For j = LBound(champ, 2) To UBound(champ, 2)
            Add1Field sLigne, champ(i, j)
          Next
          If i = UBound(champ, 1) Then sLigne = sLigne + "{}|"
          colLigTab.Add sLigne
          iNbLigTab = iNbLigTab + 1
        Next
      End If
      
    Case vbCurrency, vbObject, vbError, vbVariant, vbDataObject
      MsgBox "STOP.6": Stop ' Pas géré
    Case Else
      MsgBox "STOP.7": Stop
      
  End Select
  
  ' On ajoute un séparateur de champ
  sBuffer = sBuffer + "|"
End Sub

Private Function sNomType(iType As Integer) As String
  Dim s As String
  If iType >= 8192 Then
    s = "Tableau de "
    iType = iType - 8192
  End If
  
  Select Case iType
    Case vbEmpty: s = s + "Empty (variable non initialisée)"
    Case vbNull:  s = s + "Null (aucune donnée valide)"
    Case vbInteger: s = s + "Entier"
    Case vbLong: s = s + "Entier long"
    Case vbSingle: s = s + "Nombre en simple précision à virgule flottante"
    Case vbDouble: s = s + "Nombre en double précision à virgule flottante"
    Case vbCurrency: s = s + "Monnaie"
    Case vbDate: s = s + "Date"
    Case vbString: s = s + "Chaîne"
    Case vbObject: s = s + "Objet de OLE Automation"
    Case vbError: s = s + "Erreur"
    Case vbBoolean: s = s + "Booléen"
    Case vbVariant: s = s + "Variant (utilisée seulement dans des tableaux de données de type Variant)"
    Case vbDataObject: s = s + "Objet ne venant pas de OLE Automation"
    Case vbByte: s = s + "Octet"
    Case vbArray: s = s + "Tableau"
    Case Else: s = s + "Type inconnu."
  End Select
  
  sNomType = s
End Function


Private Sub Get1Tableau(v)
  Dim d1 As Integer, d2 As Integer
  Dim iNbDim As Integer, i As Integer, j As Integer
  
  If VarType(v) < 8192 Then
    MsgBox2i "CO073"
    'MsgBox "Get1Tableau: Le type de paramètre doit être un tableau.", vbCritical, sNomBib
    Stop
  End If
  
  ' On détermine les dimensions de v
  d1 = UBound(v, 1) - LBound(v, 1) + 1
  On Error Resume Next
  d2 = UBound(v, 2) - LBound(v, 2) + 1
  If Err Then
    iNbDim = 1
  Else
    iNbDim = 2
  End If
  On Error GoTo 0
  
  ' Remplissage de v() à partir de BufferTab
  If iNbDim = 1 Then
    iTabDecodage = iTabDecodage + 1   ' On analyse la chaîne suivante du buffer tableau
    iPosTabDecodage = 0
    
    For i = 1 To UBound(v, 1)
      Get1Field colLigTab(iTabDecodage), iPosTabDecodage, v(i)
    Next
  Else
    If Not pbar Is Nothing Then
      pbar.Min = 0
      pbar.Max = UBound(v, 1)
    End If
    For i = 1 To UBound(v, 1)
      If i Mod 100 = 0 Then
        DoEvents
        If Not pbar Is Nothing Then pbar.Value = i
      End If
      iTabDecodage = iTabDecodage + 1
      iPosTabDecodage = 0
      For j = 1 To UBound(v, 2)
        Get1Field colLigTab(iTabDecodage), iPosTabDecodage, v(i, j)
      Next
    Next
  End If
End Sub

' Codes de retour
'  0: Ok, fin des données, valeur de retour à NULL
'  1: Ok, 1 champ décodé
' -1: Erreur interne non traitée…
' -2: Type du champ et de la variale incompatibles
' -3: Nombre de dimensions incorrect dans un champ d'en-tête de tableau
' -4: Dimension 1 incorrecte dans un champ d'en-tête de tableau
' -5: Dimension 2 incorrecte dans un champ d'en-tête de tableau
' -6: Variable numérique incorrecte
' -7: Valeur NULL mais variable typée n'autorisant pas le null

Private Function iGet1Field(sBuffer As String, iPos As Integer, v As Variant) As Integer
  ' 1ère phase: on extrait le champ suivant
  Dim p As Integer
  p = iPos + 1
  If p > Len(sBuffer) Then
    v = vbNull
    iGet1Field = 0
    Exit Function
  End If
  
  Dim terminé As Boolean
  Do
    p = InStr(p, sBuffer, "|")
    terminé = True
    If p = 0 Then
      p = Len(sBuffer) + 1
    Else
      If p > 1 Then
        If Mid(sBuffer, p - 1, 1) = "\" Then terminé = False: p = p + 1
      End If
    End If
  Loop Until terminé
  
  Dim sVar As String, vVar
  sVar = Mid(sBuffer, iPos + 1, p - iPos - 1)
  iPos = p
  
  ' 2ème phase: on effectue les conversions de format
  Select Case Left(sVar, 1)
    Case "{"      ' Tableau
      Dim iNbDim As Integer, d1 As Integer, d2 As Integer
      iNbDim = Val(Mid(sVar, 2))
      If iNbDim < 1 Or iNbDim > 2 Then
        iGet1Field = -3
        sMessageErr = "Get1Field: Nombre de dimensions (" + iNbDim + ") incorrect."
        Exit Function
      End If
      d1 = Val(Mid(sVar, 4))
      If d1 < 1 Or d1 > 30000 Then
        iGet1Field = -4
        sMessageErr = "Get1Field: Dimension 1 (" + d1 + ") incorrecte."
        Exit Function
      End If
      If iNbDim = 2 Then
        d2 = Val(Mid(sVar, 1 + InStr(4, sVar, ";")))
        If d2 < 1 Or d2 > 30000 Then
          iGet1Field = -5
          sMessageErr = "Get1Field: Dimension 2 (" + d2 + ") incorrecte."
          Exit Function
        End If
      End If
      
      If iNbDim = 1 Then
        ReDim v(d1)
        Get1Tableau v
      Else
        ReDim v(d1, d2)
        Get1Tableau v
      End If
      Exit Function
    
    Case "#"      ' Date
      If sVar = "##" Then
        vVar = Null
      Else
        ' Les dates REV sont TOUJOURS au format #jj/mm/aaaa#
        If bDateFormatUS Then
          vVar = CDate(Mid(sVar, 5, 2) & "/" & Mid(sVar, 2, 2) & "/" & Mid(sVar, 8, Len(sVar) - 8))
        Else
          vVar = CDate(Mid(sVar, 2, Len(sVar) - 2))
        End If
      End If
    
    Case "V"      ' Booléen
      vVar = True
    Case "F"
      vVar = False
      
    Case """"  ' Chaîne
      sVar = Subst(Mid(sVar, 2, Len(sVar) - 2), "^J", vbCrLf)
      
      If InStr(sVar, "\") <> 0 Then
        Dim sVar2 As String
        Dim i As Integer
        
        sVar2 = ""
        For i = 1 To Len(sVar)
          If Mid(sVar, i, 1) = "\" Then
            i = i + 1
            sVar2 = sVar2 + Mid(sVar, i, 1)
          ElseIf Mid(sVar, i, 1) = "^" Then
            i = i + 1
            sVar2 = sVar2 + Chr(Asc(Mid(sVar, i, 1)) - 64)
          Else
            sVar2 = sVar2 + Mid(sVar, i, 1)
          End If
        Next
        vVar = sVar2
      Else
        vVar = sVar
      End If
      
    Case Else   ' Variable numérique
      If Len(sVar) = 0 Then
        vVar = Null
      Else
        sVar2 = sVar
        p = InStr(sVar, ".")
        If p <> 0 Then Mid(sVar2, p, 1) = ","
        If Not IsNumeric(sVar2) Then
          iGet1Field = -6
          sMessageErr = "Champ numérique incorrect: " + sVar
          Exit Function
        End If
        vVar = Val(sVar)
      End If
  End Select
  
  On Error Resume Next
  v = vVar
  Select Case Err
    Case 13
      sMessageErr = "iGet1Field: Erreur de conversion de type." & vbCrLf & vbCrLf & "Valeur à affecter: " & sVar
      If Len(sVar) = 0 Then sMessageErr = sMessageErr & "(Null)"
      sMessageErr = sMessageErr & vbCrLf & "Variable de type " & VarType(v) & ": " & sNomType(VarType(v))
      If Len(sVar) = 0 And VarType(v) <> vbVariant And VarType(v) <> vbString Then sMessageErr = sMessageErr & vbCrLf & vbCrLf & "Seules les variables de type String ou Variant acceptent les valeurs NULL."
      iGet1Field = -2
      Exit Function
    Case 94
      sMessageErr = "Variable de type " & VarType(v) & ": " & sNomType(VarType(v)) & " ne supportant pas la valeur NULL"
      iGet1Field = -7
      Exit Function
    Case Is <> 0
      sMessageErr = "Erreur " & Err & " (" & Err.Source & "): " & Err.Description & vbCrLf & "Valeur à affecter: " & sVar
      If Len(sVar) = 0 Then sMessageErr = sMessageErr & "(Null)"
      sMessageErr = sMessageErr & vbCrLf & "Variable de type " & VarType(v) & ": " & sNomType(VarType(v))
      iGet1Field = -1
      Exit Function
  End Select
  iGet1Field = 1
End Function


Private Sub Get1Field(sBuffer As String, iPos As Integer, v As Variant)
  Dim iStatus As Integer
  iStatus = iGet1Field(sBuffer, iPos, v)
  If iStatus < 0 Then
    MsgBox2i "CO074", iStatus, sMessageErr
    'MsgBox "Erreur " & iStatus & " au iGet1Field" & vbCrLf & sMessageErr, vbCritical, sNomBib
  End If
End Sub


Public Sub GetField(ParamArray tChamps())
  If iNbLigTab <> iNbLigTabAttendues Then
    MsgBox2i "CO075", iNbLigTab, iNbLigTabAttendues
    'MsgBox "GetField: Le nombre de lignes ajoutées au buffer tableau (" & iNbLigTab & ") ne correspond pas au nombre de lignes attendues (" & iNbLigTabAttendues & ").", vbCritical, sNomBib
    Stop
  End If
  
  Dim i As Integer
  For i = LBound(tChamps) To UBound(tChamps)
    Get1Field sBufferBase, iPosDecodage, tChamps(i)
  Next
End Sub

' Retour :
' Si 1 seul champ:
'  <0: erreur (voir iGet1Field)
'   0: lecture après la fin du buffer, retour NULL dans la variable
'   1: 1 champ décodé
' Si plusieurs champs:
'  <0: erreur (voir iGet1Field)
'   n: n champs décodés, les variables correspondant aux champs de fin non décodés sont à NULL
Public Function iGetField(ParamArray tChamps()) As Integer
  If iNbLigTab <> iNbLigTabAttendues Then
    iGetField = -7
    Exit Function
  End If
  
  Dim i As Integer, iNbChamps As Integer, iStatus As Integer
  iNbChamps = 0
  For i = LBound(tChamps) To UBound(tChamps)
    iStatus = iGet1Field(sBufferBase, iPosDecodage, tChamps(i))
    If iStatus < 0 Then
      iGetField = iStatus
      Exit Function
    End If
    iNbChamps = iNbChamps + iStatus
  Next
  iGetField = iNbChamps
End Function


Public Sub Clear()
  Dim i As Integer
  
  sBufferBase = ""
  iNbLigTab = 0
  iNbLigTabAttendues = 0
  iPosDecodage = 0
  iTabDecodage = 0
  iPosTabDecodage = 0
  For i = 1 To colLigTab.count
    colLigTab.Remove 1
  Next
End Sub

Public Property Get Buffer() As String
  If iNbLigTab = 0 Then
    Buffer = sBufferBase
  Else
    Buffer = sBufferBase + "{" + iNbLigTab + "}|"
  End If
End Property

    
Public Property Get BufferTab(i As Integer) As String
  If i < 1 Or i > iNbLigTab Then
    MsgBox2i "CO076", i, iNbLigTab
    'MsgBox "Get BufferTab: indice (" & i & ") hors limites (1 à " & iNbLigTab & ").", vbCritical, sNomBib
    Stop
  End If
  BufferTab = colLigTab(i)
End Property


Public Property Get BufferTabCount() As Integer
  BufferTabCount = iNbLigTab
End Property


Public Sub AddField(ParamArray tChamps())
  Dim i As Integer
  For i = LBound(tChamps) To UBound(tChamps)
    Add1Field sBufferBase, tChamps(i)
  Next
End Sub


Public Property Let Buffer(ByVal b As String)
  Clear
  If bModeDebug And Len(b) = 0 Then
    MsgBox2i "CO077"
    'MsgBox "Let Buffer: Un buffer vide n'est pas permis.", vbCritical, sNomBib
    Stop
  End If
  
  If Right(b, 2) = "}|" Then
    Dim p As Integer
    p = Len(b) - 2
    While Mid(b, p, 1) <> "{"
      p = p - 1
    Wend
    iNbLigTabAttendues = Val(Mid(b, p + 1))
    b = Left(b, p - 1)
  End If
  
  sBufferBase = b
End Property


Public Sub AddBufferTab(b As String)
  If iNbLigTabAttendues = 0 Then
    MsgBox2i "CO078"
    'MsgBox "AddBufferTab: Pour pouvoir définir les lignes du buffer tableau, le buffer de base doit être terminé par un champ |{nn}| où nn est le nombre de lignes du buffer tableau attendues.", vbCritical, sNomBib
    Stop
  End If
  
  If iNbLigTab = iNbLigTabAttendues Then
    MsgBox2i "CO079", iNbLigTabAttendues
    'MsgBox "AddBufferTab: Le nombre de lignes du buffer tableau attendues (" & iNbLigTabAttendues & ") a été atteint.", vbCritical, sNomBib
    Stop
  End If
  
  colLigTab.Add b
  iNbLigTab = iNbLigTab + 1
End Sub
