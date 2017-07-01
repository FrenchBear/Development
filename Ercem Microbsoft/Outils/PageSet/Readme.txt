---------------------------------------------------------
Readme.txt file for PageSet.exe
---------------------------------------------------------

This file describes the contents of PageSet.exe, a 
self-extracting file.

PageSet.exe is a self-extracting executable file that contains a DLL file that
allows you to programmatically change the printer orientation.

This DLL is particularly useful when dealing with the Data Report, which reads
the default printer orientation prior to displaying or printing a report.
PageSet.exe allows you to programmatically change and reset your printer
orientation.

MORE INFORMATION
================

The following file is available for download from the Microsoft Software
Library:

   PageSet.exe
   (http://support.microsoft.com/download/support/mslfiles/PageSet.exe)

Release Date: Apr-13-1999

For more information about downloading files from the Microsoft Software Library,
please see the following article in the Microsoft Knowledge Base:

   Q119591 How to Obtain Microsoft Support Files from Online Services

\** 
\** PARTNER:
\** To help customers obtain these files by means other than the World Wide Web, see
\** the following article in the CROSSPRD rollup (use "S101" in WorkBench to bring
\** up this article only):
\** 
\** s101(Q119591)

   
   +---------------------------+
   | FileName           | Size | 
   +---------------------------+
   | PageSet.dll        | 1KB  | 
   +---------------------------+
   | PageSet.vbp        | 1KB  | 
   +---------------------------+
   | frmSit.frm         | 1KB  | 
   +---------------------------+
   | Orient.bas         | 8KB  | 
   +---------------------------+
   | PrinterControl.cls | 1KB  | 
   +---------------------------+
   | Readme.txt         | 1KB  | 
   +---------------------------+

On Windows NT systems, PageSet.dll requires administrative access to your printer
settings. To set this up, you will have to save the driver settings to your
local computer, which can be accomplished with the following steps:

1. Using the Add Printer wizard in Control Panel, select My Computer instead of
   Network Printer Server, and then choose Next.

2. Click the "Add Port" button.

3. Select Local Port in the drop-down list box then click New Port.

4. Type the location of the printer on the network. For example:

      \\printserver\printer (this is the exact path of your printer)

5. Select OK and continue with the rest of the setup.

Now you can incorporate the DLL into your application.


1. Use the Regsvr32.exe file to register the Pageset.dll as follows:

      regsvr32.exe <full path to dll>\pageset.dll

2. Reference the Pageset.dll in your application project.

The following code sets your paper orientation to landscape prior to printing or
showing the report.

  Paste the following code in the General Declaration section of your form:

      Dim obj As PageSet.PrinterControl

      Private Sub Command1_Click()
         On Error GoTo errorhandler:
         Set obj = New PrinterControl
         obj.ChngOrientationLandscape
         DataReport1.Show
         DataReport1.PrintReport False, rptRangeFromTo, 1, 1

         Exit Sub

      errorhandler:
          MsgBox Err.Description
          obj.ReSetOrientation
    
      End Sub

      Private Sub Form_Unload(Cancel As Integer)

         obj.ReSetOrientation 'This resets the printer to portrait.

      End Sub

NOTE: In the preceding application you are resetting the printer in the
Form_Unload event. The printer must be reset back to the default orientation. If
not, any print job sent to the network printer will be printed using the
orientation set by your program.

Disclaimer
----------

WARNING: ANY USE BY YOU OF THE CODE PROVIDED IS AT YOUR OWN RISK. Microsoft
provides this code "as is" without warranty of any kind, either express or
implied, including but not limited to the implied warranties of merchantability
and/or fitness for a particular purpose.