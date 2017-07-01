' General eLIMS Launchpad Library Script
' Always loaded in "Library" module before execution of custome-made scripts in menu

sLibVersion = "1.0"

public sub LibAbout()
    MsgBox "General eLIMS Launchpad Library Script" & vbCrLf & "Version " & sLibVersion & vbcrlf & vbcrlf & "(c) Eurofins 2004", 64, "ScriptLibrary.vbs"
end sub

