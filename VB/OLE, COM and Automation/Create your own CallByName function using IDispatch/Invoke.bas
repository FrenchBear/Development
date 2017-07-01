Attribute VB_Name = "mdlDispInvoke"
'---------------------------------------------------------------------------------------
'
' Create you own CallByName function
'
' mdlDispInvoke (Invoke.bas)
'
'---------------------------------------------------------------------------------------
'
' Author: Eduardo A. Morcillo
' E-Mail: emorcillo@mvps.org
' Web Page: http://www.mvps.org/emorcillo
'
' Distribution: You can freely use this code in your own applications but you
'               can't publish this code in a web site, online service, or any
'               other media, without my express permission.
'
' Usage: at your own risk.
'
' Tested on:
'            * Windows XP Pro SP1
'            * VB6 SP5
'
' History:
'          02/28/2000 - This code was released
'
'---------------------------------------------------------------------------------------
Option Explicit

Enum InvokeCall
   PropGet = INVOKE_PROPERTYGET
   PropLet = INVOKE_PROPERTYPUT
   PropSet = INVOKE_PROPERTYPUTREF
   Method = INVOKE_FUNC
End Enum

'---------------------------------------------------------------------------------------
' Procedure : Invoke
' Purpose   : Calls an object function/property by name or DISPID
'             taking the parameters as ParamArray.
'---------------------------------------------------------------------------------------
'
Public Function Invoke( _
   Object As Object, _
   ByVal Name As Variant, _
   ByVal CallType As InvokeCall, _
   ParamArray Args() As Variant) As Variant

Dim lDISPID As Long
Dim tDISPPARAMS As olelib.DISPPARAMS
Dim avParams() As Variant
Dim lNamedParam As Long
Dim lIdx As Long
Dim lParamCount As Long
    
   ' Get the DISPID
   lDISPID = GetDISPID(Object, Name)
        
   If Not IsMissing(Args) Then
            
      ' Get parameters count
      lParamCount = UBound(Args) - LBound(Args)
   
      ReDim avParams(0 To lParamCount)
   
      ' Copy the array in reverse order
      For lIdx = 0 To lParamCount
         VariantCopy avParams(lParamCount - lIdx), Args(lIdx)
      Next
      
      With tDISPPARAMS
         .cArgs = lParamCount + 1
         .rgPointerToVariantArray = VarPtr(avParams(0))
      End With
      
      If CallType = INVOKE_PROPERTYPUT Or _
         CallType = INVOKE_PROPERTYPUTREF Then
            
         lNamedParam = DISPID_PROPERTYPUT
         
         With tDISPPARAMS
            .cNamedArgs = 1
            .rgPointerToLONGNamedArgs = VarPtr(lNamedParam)
         End With
         
      End If
   
   End If
   
   CallInvoke Object, lDISPID, CallType, tDISPPARAMS, Invoke
    
End Function

'---------------------------------------------------------------------------------------
' Procedure : GetDISPID
' Purpose   : Returns the DISPID of a member
'---------------------------------------------------------------------------------------
'
Private Function GetDISPID( _
   ByVal Object As olelib.IDispatch, _
   Name As Variant) As Long

' NULL interface ID
Dim IID_NULL As olelib.UUID
   
   If IsNumeric(Name) Then
   
      ' Return the value
      GetDISPID = CLng(Name)
      
   Else
   
      ' Get the DISPID using the name
      Object.GetIDsOfNames IID_NULL, CStr(Name), 1, 0, GetDISPID
      
   End If
End Function

'---------------------------------------------------------------------------------------
' Procedure : CallInvoke
' Purpose   : Calls the Invoke method of IDispatch
'---------------------------------------------------------------------------------------
'
Private Sub CallInvoke( _
   ByVal Object As olelib.IDispatch, _
   ByVal DISPID As Long, _
   ByVal CallType As Long, _
   Params As olelib.DISPPARAMS, _
   Result As Variant)

' NULL interface ID
Dim IID_NULL As olelib.UUID

' Exception Error info
Dim tEXCEPINFO As olelib.EXCEPINFO

' Argument that produced the error
Dim lArgErr As Long

' Call result
Dim lResult As Long

   ' Invoke method/property
   lResult = Object.Invoke(DISPID, IID_NULL, 0, _
                           CallType, Params, _
                           VarPtr(Result), _
                           tEXCEPINFO, lArgErr)
   
   If lResult <> 0 Then
   
      ' There was an error
      
      ' If the error is DISP_E_EXCEPTION
      ' we can get the error description
      ' from the EXCEPINFO structure.
      If lResult = DISP_E_EXCEPTION Then
                
         With tEXCEPINFO
         
            ' Raise the error using
            ' the EXCEPINFO data
            Err.Raise .wCode, .Source, .Description, .HelpFile, .dwHelpContext
            
         End With
            
      Else
                
         ' Raise the error using the HRESULT
         Err.Raise lResult
            
      End If
                
   End If
   
End Sub
