VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1740
      TabIndex        =   0
      Top             =   1320
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    Z "BIGBROTHER"
    Z "DM066AC001"
    Z "DM066AC002"
    Z "EJOHNSON"
    Z "ESDSMPWR"
    Z "HERA"
    Z "HERMES"
    Z "ITCHY"
    Z "MARS"
    Z "NEPTUNE"
    Z "US01ALUMINUM"
    Z "US01ATHOMSEN"
    Z "US01BEAVER"
    Z "US01BOLT"
    Z "US01BORON"
    Z "US01CALCIUM"
    Z "US01CARBON"
    Z "US01CKEUNING"
    Z "US01COBALT"
    Z "US01COPPER"
    Z "US01DCSA"
    Z "US01DCSC"
    Z "US01DGROSS"
    Z "US01DMCBRIDE"
    Z "US01ENZYMES"
    Z "US01FLUORINE"
    Z "US01GBRITTEN"
    Z "US01GBUTLER"
    Z "US01HELIUM"
    Z "US01ICP4300"
    Z "US01IRON"
    Z "US01JBORCHAR"
    Z "US01KHEOPS"
    Z "US01KKARSJEN"
    Z "US01KRYPTON"
    Z "US01KSHAFFER"
    Z "US01LITHIUM"
    Z "US01MAGNESIU"
    Z "US01MERCURY"
    Z "US01NEON"
    Z "US01NEUTRON"
    Z "US01NICKEL"
    Z "US01OXYGEN"
    Z "US01PEAA400"
    Z "US01PROT1"
    Z "US01PROT2"
    Z "US01PROX3C"
    Z "US01SAPHIR"
    Z "US01SILICON"
    Z "US01SILVER"
    Z "US01SODIUM"
    Z "US01SPHYNX"
    Z "US01SQLA"
    Z "US01STAR"
    Z "US01SULFUR"
    Z "US01TITANIUM"
    Z "US01TRACKING"
    Z "US01TRACKING"
    Z "US01TUNGSTEN"
    Z "US01URANIUM"
    Z "US01WRITEUP2"
    Z "US01ZINC"
    Z "ZEUS"
    
    MsgBox "Done"
End Sub

Sub Z(sComputer As String)
    On Error GoTo Pb
    Debug.Print sComputer & ": ",
    Dim objWMIService
    Dim colAdapters, objAdapter, IPAddress0, IPNetwork0
    Set objWMIService = GetObject("winmgmts:" & "!\\" & sComputer & "\root\cimv2")
    Set colAdapters = objWMIService.ExecQuery("Select * from Win32_NetworkAdapterConfiguration Where IPEnabled = True")
    Dim sDNS
    sDNS = ""
    For Each objAdapter In colAdapters
        If objAdapter.DnsServerSearchOrder(0) <> "" Then sDNS = objAdapter.DnsServerSearchOrder(0): Exit For
    Next
    Debug.Print sDNS
    Exit Sub
    
Pb:
    Debug.Print "¤"
End Sub
