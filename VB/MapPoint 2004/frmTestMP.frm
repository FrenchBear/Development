VERSION 5.00
Object = "{51C0A9CA-F7B7-4F5A-96F4-43927C6FA50F}#1.0#0"; "MapPointControl.ocx"
Begin VB.Form frmTestMapPoint 
   Caption         =   "Essais d'optimisation de route avec MapPoint"
   ClientHeight    =   9615
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   15540
   LinkTopic       =   "Form1"
   ScaleHeight     =   9615
   ScaleWidth      =   15540
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lstTrace 
      Height          =   8640
      Left            =   9300
      TabIndex        =   3
      Top             =   720
      Width           =   6135
   End
   Begin VB.CommandButton btnRoute 
      Caption         =   "Route"
      Height          =   495
      Left            =   10740
      TabIndex        =   2
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton btnGrenoble 
      Caption         =   "Grenoble"
      Height          =   495
      Left            =   9360
      TabIndex        =   1
      Top             =   120
      Width           =   1215
   End
   Begin MapPointCtl.MappointControl MappointControl1 
      Height          =   9315
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   9135
      BorderStyle     =   0
      MousePointer    =   0
      Object.TabStop         =   -1  'True
      Appearance      =   1
      PaneState       =   3
      UnitsOfMeasure  =   1
   End
End
Attribute VB_Name = "frmTestMapPoint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' TestMapPoint
' Essai de pilotage de MapPoint en VB
' 26/10/03 PV

Option Explicit


Private Sub Form_Load()
  Trace "Form_Load; appel MappointControl1.NewMap geoMapEurope"
  MappointControl1.NewMap geoMapEurope
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Trace "Form_Unload"
  MappointControl1.ActiveMap.Saved = True
End Sub


Private Sub btnGrenoble_Click()
  Dim oMap As Map
  Set oMap = MappointControl1.ActiveMap
  
  oMap.AddPushpin oMap.FindResults("GRenoble, 38000")(1)
End Sub

Private Sub btnRoute_Click()
  Dim objMap As Map
  Set objMap = MappointControl1.ActiveMap

  Dim objRoute As Route
  Set objRoute = objMap.ActiveRoute
  
  AjouteWayPoint objMap, objRoute, "Grenoble, 38000"
  AjouteWayPoint objMap, objRoute, "Bourg-en-Bresse, 01000"
  AjouteWayPoint objMap, objRoute, "Chambéry, 73000"
  AjouteWayPoint objMap, objRoute, "Lyon, 69000"
  AjouteWayPoint objMap, objRoute, "Annecy, 74000"
  AjouteWayPoint objMap, objRoute, "Grenoble, 38000"
  Trace "Appel objRoute.Waypoints.Optimize"
  objRoute.Waypoints.Optimize
  Trace "Appel objRoute.Calculate"
  objRoute.Calculate
  Trace "Calcul terminé, distance = " & objRoute.Distance
End Sub

Sub AjouteWayPoint(objMap As Map, objRoute As Route, sAdresse As String)
  Trace "Ajout WayPoint '" & sAdresse & "'"
  objRoute.Waypoints.Add objMap.FindResults(sAdresse).Item(1)
End Sub



Sub Trace(sMsg As String)
  lstTrace.AddItem sMsg
  lstTrace.ListIndex = lstTrace.ListCount - 1
End Sub


Private Sub MappointControl1_AfterRedraw()
  Trace "MappointControl1_AfterRedraw"
End Sub

Private Sub MappointControl1_AfterViewChange()
  Trace "MappointControl1_AfterViewChange"
End Sub

Private Sub MappointControl1_DataMapChange(ByVal pChangedDataSet As MapPointCtl.DataSet)
  Trace "MappointControl1_DataMapChange"
End Sub

Private Sub MappointControl1_NewDataSet(ByVal pNewDataSet As MapPointCtl.DataSet)
  Trace "MappointControl1_NewDataSet"
End Sub

Private Sub MappointControl1_ReadyStateChange()
  Trace "MappointControl1_ReadyStateChange"
  Select Case MappointControl1.ReadyState
    Case READYSTATE_COMPLETE:       Trace "ReadyState = READYSTATE_COMPLETE"
    Case READYSTATE_INTERACTIVE:    Trace "ReadyState = READYSTATE_INTERACTIVE"
    Case READYSTATE_LOADED:         Trace "ReadyState = READYSTATE_LOADED"
    Case READYSTATE_LOADING:        Trace "ReadyState = READYSTATE_LOADING"
    Case READYSTATE_UNINITIALIZED:  Trace "ReadyState = READYSTATE_UNINITIALIZED"
  End Select
End Sub

Private Sub MappointControl1_RouteAfterCalculate(ByVal pRoute As MapPointCtl.Route)
  Trace "MappointControl1_RouteAfterCalculate"
End Sub

Private Sub MappointControl1_RouteAfterOptimize(ByVal pRoute As MapPointCtl.Route)
  Trace "MappointControl1_RouteAfterCalculate"
End Sub

Private Sub MappointControl1_SelectionChange(ByVal pNewSelection As Object, ByVal pOldSelection As Object)
  Trace "MappointControl1_RouteAfterCalculate"""
End Sub
