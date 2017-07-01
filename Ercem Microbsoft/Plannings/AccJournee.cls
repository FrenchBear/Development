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
Attribute VB_Description = "Classe d'accès aux journées de planning"
' Module d'accès aux journées de planning
'  3/11/1996 PV
' 13/04/1998 PV  Infos plus complètes (heures, km, clôture)
' 11/01/1999 PV  Enumérateur NewEnum
' 21/09/2000 PV  iValidation


Option Explicit

' Cache qui ne contient que la sélection des journées qui ont été lues
Private colJournées As New Collection


' ============================================================================
' Accès manuel

Public Function count() As Long
  count = colJournées.count
End Function

Public Sub Clear()
  While colJournées.count > 1
    colJournées.Remove 1
  Wend
End Sub

' Accède à un planning de la collection
' Base 1
Public Function Item(ByVal i As Variant) As Journee
Attribute Item.VB_UserMemId = 0
  Set Item = colJournées.Item(i)
End Function

Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    'Permet d'énumérer cette collection avec la syntaxe For…Each
    Set NewEnum = colJournées.[_NewEnum]
End Property


' ============================================================================

Public Function AddJournée(dDatePlan As Date, sLettres As String, iValidation As Integer, iHeureDébut As Variant, iHeureFin As Variant, iKmDébut As Variant, iKmFin As Variant) As Journee
  Dim jNew As New Journee
  With jNew
    .dDatePlan = dDatePlan
    .sLettres = sLettres
    .iHeureDébut = iHeureDébut
    .iHeureFin = iHeureFin
    .iKmDébut = iKmDébut
    .iKmFin = iKmFin
    .iValidation = iValidation
  End With
  On Error Resume Next
  colJournées.Add jNew, sLettres & Format(dDatePlan, "ddmmyy")
  If Err Then
    Set AddJournée = Nothing
  Else
    Set AddJournée = jNew
  End If
End Function


Public Function RechercheJournee(sReq As String) As Integer
  Dim i As Integer
  Dim j As New Journee
  
  For i = 1 To colJournées.count
    colJournées.Remove 1
  Next
  
  Dim br As New Rev
  br.AddField sReq
  
  Bloquer
    tcps.Envoie "RPL5 " & br.Buffer
    
    Dim sLigne As String
    Dim iSerial As Long, sLettres As String, dDatePlan As Date
    Dim iValidation As Integer, iHeureDébut, iHeureFin, iKmDébut, iKmFin
    Dim cSystème As String
    Do
restart:
      sLigne = tcps.Reçoit
      If Left(sLigne, 2) = "->" Then Exit Do
      
      br.Buffer = sLigne
      br.GetField cSystème
      br.GetField iSerial
      If iSerial = 0 Then GoTo restart
      br.GetField sLettres
      br.GetField dDatePlan
      br.GetField iValidation
      br.GetField iHeureDébut, iHeureFin
      br.GetField iKmDébut, iKmFin

      Set j = AddJournée(dDatePlan, sLettres, iValidation, iHeureDébut, iHeureFin, iKmDébut, iKmFin)
    Loop
  Relâcher
  RechercheJournee = count()
End Function


' La journée est obligatoirement dans le cache de la sélection
Public Function LitJournée(dDate As Date, sLettres As String) As Journee
  Dim j As Journee
  For Each j In colJournées
    If j.dDatePlan = dDate And j.sLettres = sLettres Then
      Set LitJournée = j
      Exit Function
    End If
  Next
  Set LitJournée = Nothing
End Function

