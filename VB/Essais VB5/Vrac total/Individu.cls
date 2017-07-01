VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Individu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private msNom As String
Private msPrénom As String
Private mDémo As udtDémo

Public Event ChangeDeNom(ByVal sNouveauPrénom As String, ByVal sNouveauNom As String)
Public Event Initialize()
Public Event Terminate()


Sub Identification(sPrénom As String, sNom As String)
  If msNom <> sNom Or msPrénom <> sPrénom Then RaiseEvent ChangeDeNom(sPrénom, sNom)
  msNom = sNom
  msPrénom = sPrénom
End Sub

Function Nom() As String
Attribute Nom.VB_UserMemId = 0
  Nom = msNom
End Function

Function Prénom() As String
  Prénom = msPrénom
End Function

Sub APropos()
Attribute APropos.VB_UserMemId = -552
  MsgBox "A propos de la classe Individu"
End Sub


Friend Property Get Démo() As udtDémo
  Démo = mDémo
End Property

Friend Property Let Démo(NewDémo As udtDémo)
  mDémo = NewDémo
End Property

Friend Sub SetDémoParts(ByVal a As Integer, ByVal b As Long, ByVal c As String)
  mDémo.intA = a
  mDémo.lngB = b
  mDémo.strC = c
End Sub

Public Sub ShowDémo()
  MsgBox mDémo.intA & vbCrLf & mDémo.lngB & vbCrLf & mDémo.strC
End Sub

Private Sub Class_Initialize()
  RaiseEvent Initialize
End Sub

Private Sub Class_Terminate()
  RaiseEvent Terminate
End Sub
