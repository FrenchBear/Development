VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "AccJournee"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Classe d'acc�s aux journ�es de planning"
' Module d'acc�s aux journ�es de planning
'  3/11/1996 PV
' 13/04/1998 PV  Infos plus compl�tes (heures, km, cl�ture)
' 11/01/1999 PV  Enum�rateur NewEnum
' 21/09/2000 PV  iValidation


Option Explicit

' Cache qui ne contient que la s�lection des journ�es qui ont �t� lues
Private colJourn�es As New Collection


' ============================================================================
' Acc�s manuel

Public Function count() As Long
  count = colJourn�es.count
End Function

Public Sub Clear()
  While colJourn�es.count > 1
    colJourn�es.Remove 1
  Wend
End Sub

' Acc�de � un planning de la collection
' Base 1
Public Function Item(ByVal i As Variant) As Journee
Attribute Item.VB_UserMemId = 0
  Set Item = colJourn�es.Item(i)
End Function

Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    'Permet d'�num�rer cette collection avec la syntaxe For�Each
    Set NewEnum = colJourn�es.[_NewEnum]
End Property


' ============================================================================

Public Function AddJourn�e(dDatePlan As Date, sLettres As String, iValidation As Integer, iHeureD�but As Variant, iHeureFin As Variant, iKmD�but As Variant, iKmFin As Variant) As Journee
  Dim jNew As New Journee
  With jNew
    .dDatePlan = dDatePlan
    .sLettres = sLettres
    .iHeureD�but = iHeureD�but
    .iHeureFin = iHeureFin
    .iKmD�but = iKmD�but
    .iKmFin = iKmFin
    .iValidation = iValidation
  End With
  On Error Resume Next
  colJourn�es.Add jNew, sLettres & Format(dDatePlan, "ddmmyy")
  If Err Then
    Set AddJourn�e = Nothing
  Else
    Set AddJourn�e = jNew
  End If
End Function


Public Function RechercheJournee(sReq As String) As Integer
  Dim i As Integer
  Dim j As New Journee
  
  For i = 1 To colJourn�es.count
    colJourn�es.Remove 1
  Next
  
  Dim br As New Rev
  br.AddField sReq
  
  Bloquer
    tcps.Envoie "RPL5 " & br.Buffer
    
    Dim sLigne As String
    Dim iSerial As Long, sLettres As String, dDatePlan As Date
    Dim iValidation As Integer, iHeureD�but, iHeureFin, iKmD�but, iKmFin
    Dim cSyst�me As String
    Do
restart:
      sLigne = tcps.Re�oit
      If Left(sLigne, 2) = "->" Then Exit Do
      
      br.Buffer = sLigne
      br.GetField cSyst�me
      br.GetField iSerial
      If iSerial = 0 Then GoTo restart
      br.GetField sLettres
      br.GetField dDatePlan
      br.GetField iValidation
      br.GetField iHeureD�but, iHeureFin
      br.GetField iKmD�but, iKmFin

      Set j = AddJourn�e(dDatePlan, sLettres, iValidation, iHeureD�but, iHeureFin, iKmD�but, iKmFin)
    Loop
  Rel�cher
  RechercheJournee = count()
End Function


' La journ�e est obligatoirement dans le cache de la s�lection
Public Function LitJourn�e(dDate As Date, sLettres As String) As Journee
  Dim j As Journee
  For Each j In colJourn�es
    If j.dDatePlan = dDate And j.sLettres = sLettres Then
      Set LitJourn�e = j
      Exit Function
    End If
  Next
  Set LitJourn�e = Nothing
End Function

