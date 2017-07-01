Attribute VB_Name = "modDbgHelpLoader"
Option Explicit

Private Type DBGHELPLoader
    pVTable As Long
    pThisObject As IUnknown
    VTable(2) As Long
    hMod As Long
End Type

Private m_Loader As DBGHELPLoader

Public Function DBGHELPModule() As Long
    If m_Loader.hMod = 0 Then InitLoader
    DBGHELPModule = m_Loader.hMod
End Function
Public Sub FreeDBGHelpModule()
    If m_Loader.hMod Then Set m_Loader.pThisObject = Nothing
End Sub
Private Sub InitLoader()
    With m_Loader
        .hMod = LoadLibrary("DBGHELP.dll")
        .VTable(0) = FuncAddr(AddressOf QueryInterface)
        .VTable(1) = FuncAddr(AddressOf AddRef)
        .VTable(2) = FuncAddr(AddressOf Release)
        .pVTable = VarPtr(.VTable(0))
        VBoostTypes.CopyMemory .pThisObject, VarPtr(.pVTable), 4
    End With
End Sub
Private Function QueryInterface(ByVal This As Long, ByVal riid As Long, pvObj As Long) As Long
    Debug.Assert False 'QI not expected
    pvObj = 0
    QueryInterface = E_NOINTERFACE
End Function
Private Function AddRef(ByVal This As Long) As Long
    Debug.Assert False 'No need to addref
End Function
Private Function Release(This As DBGHELPLoader) As Long
    'Called when module unloads
    If This.hMod Then
        FreeLibrary This.hMod
        This.hMod = 0
    End If
End Function
Private Function FuncAddr(ByVal pfn As Long) As Long
    FuncAddr = pfn
End Function


