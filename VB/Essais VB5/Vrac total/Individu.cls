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
Private msPr�nom As String
Private mD�mo As udtD�mo

Public Event ChangeDeNom(ByVal sNouveauPr�nom As String, ByVal sNouveauNom As String)
Public Event Initialize()
Public Event Terminate()


Sub Identification(sPr�nom As String, sNom As String)
  If msNom <> sNom Or msPr�nom <> sPr�nom Then RaiseEvent ChangeDeNom(sPr�nom, sNom)
  msNom = sNom
  msPr�nom = sPr�nom
End Sub

Function Nom() As String
Attribute Nom.VB_UserMemId = 0
  Nom = msNom
End Function

Function Pr�nom() As String
  Pr�nom = msPr�nom
End Function

Sub APropos()
Attribute APropos.VB_UserMemId = -552
  MsgBox "A propos de la classe Individu"
End Sub


Friend Property Get D�mo() As udtD�mo
  D�mo = mD�mo
End Property

Friend Property Let D�mo(NewD�mo As udtD�mo)
  mD�mo = NewD�mo
End Property

Friend Sub SetD�moParts(ByVal a As Integer, ByVal b As Long, ByVal c As String)
  mD�mo.intA = a
  mD�mo.lngB = b
  mD�mo.strC = c
End Sub

Public Sub ShowD�mo()
  MsgBox mD�mo.intA & vbCrLf & mD�mo.lngB & vbCrLf & mD�mo.strC
End Sub

Private Sub Class_Initialize()
  RaiseEvent Initialize
End Sub

Private Sub Class_Terminate()
  RaiseEvent Terminate
End Sub
