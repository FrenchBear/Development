VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "UnitéVentilation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gère les UnitéVentilations analytiques Ercem/LBF"
' Classe UnitéVentilation
' Gère les unités de ventilation Ercem/LBF
' 12/02/1998 PV

Option Explicit

Public uv_numuv As Integer     ' N° d'unité de ventilation
Public uv_code As String       ' Code abrégé (UOP1)
Public uv_titre As String      ' Nom complet
Public timestamp As Date


Function Copie() As UnitéVentilation
  Dim k As New UnitéVentilation
  With k
    .uv_numuv = uv_numuv
    .uv_code = uv_code
    .uv_titre = uv_titre
    .timestamp = timestamp
  End With
  Set Copie = k
End Function

