APEX True DBGrid Pro 6.0c Patch                                   
Build 6.0.0220 ("Green Wheat Fields")         
June 9, 1999
----------------------------------------------------------------




Congratulations!  You can now evaluate this full-featured version of True DBGrid Pro 6.0 for 30 days.  After you are completely satisfied with the product (and we are confident that you will be), you can purchase a licensed copy from APEX or from any one of our dealers.  Please visit the APEX web site at www.apexsc.com/sales for a complete dealer listing.



========
Contents
========

(1)  About this download
(2)  APEX Web Site
(3)  What's New
(4)  Changes and Bug Fixes  
(5)  Explanation of ICursor and OLE DB
(6)  *** IMPORTANT: OLE DB Bug Information ***
(7)  Samples and Tutorials
(8)  Migration
(9)  Distribution Requirements


================================================
(1) About This Download
================================================

This download provides updated versions of some files included on the original True DBGrid Pro 6.0 CD-ROM.


If you selected the 'Automatic' option during the patch Setup:
--------------------------------------------------------------

The patch has been installed over your existing True DBGrid Pro 6.0 files.  You are ready to begin using the new files.  

NOTE: The .OCX and .DLL files installed by the patch were copied to and registered in the same directory where they were placed by the original True DBGrid Pro 6.0 installation.



If you selected the 'Extract Files Only' option during Setup:
-------------------------------------------------------------

All of the updated True DBGrid Pro 6.0 files were extracted to the temporary directory you selected.  The .OCX and .DLL files extracted by the patch must be registered before you can use them.  

In order to do this, copy all .OCX, .DLL, and .DEP files extracted by the patch into the directory of your choice (the directory you placed OCX/DLL files in during the original True DBGrid Pro 6.0 installation is highly recommended).  Then, at your Command Prompt or DOS prompt, go to the directory where you just copied the files and register them using REGSVR32.EXE.  You can do this by typing the following commands at the prompt:

    regsvr32 /v tdbg6.ocx
    regsvr32 /v todg6.ocx
    regsvr32 /v todgub6.dll
    regsvr32 /v xarraydb.ocx
    regsvr32 /v tdbg6mu.dll


================================================
(2) APEX Web Site
================================================

All product updates for APEX products can be downloaded from the APEX Web Site at:

  http://www.apexsc.com/

or from our anonymous FTP server at:

  ftp://ftp.apexsc.com/


The APEX Web site at www.apexsc.com also provides a wealth of information and software downloads for True DBGrid Pro 6.0 users:

* Latest news and information about APEX products
* Free product updates, which provide you with bug fixes and new features
* Free Sample programs which provide detailed illustrations of advanced concepts
* Answers to frequently asked questions (FAQ's) about APEX products
* Trial versions and demos for APEX products
* Lists of APEX Resellers and ordering information 
* Carl and Gary's Visual Basic Home Page, a comprehensive resource for Visual Basic developers.



================================================
(3) What's New
================================================

The following list describes new features in recent releases.



Version 6.0c ("Green Whieat Fields"), Build 6.0.0220
----------------------------------------------------

Enhanced Print Features:

Added the possibility to selectively print some pages to TDBGPP.DLL.

In the preview window, there are now 2 new menu items under "File":

"Print &some pages", with the shortcut Ctrl+S, and
"Print &current page", with the shortcut Ctrl+C.

The current page is self-explanatory, print some pages opens a small modal dialog with the caption "Print some pages", and the prompt "Please enter the pages to print:" for the only plain edit field. The pages to be printed can be entered in a more or less free format, with the following rules:

- any chars except digits and '-' are ignored;
- any numbers separated by a '-' are treated as an (inclusive) range of pages;
- a '-' at the beginning assumes '1-';
- a '-' at the end assumes 'to the end';
- all other numbers are treated as single page numbers.

Sequence is not important unless in a range (i.e. a range 8-4 is empty, but "12, 1, 3-5" will print pages 1, 3, 4, 5, & 12.

The following additional values have been added to the PrintInfo_MenuConstants enum:

dbgpMenuPrintSomePages = 11  -- "print some pages" menu text
dbgpMenuPrintCurrPage = 12  -- "print current page" menu text
dbgpDlgPagesCaption = 13  -- print some pages dialog caption
dbgpDlgPagesPrompt = 14  -- print some pages dialog prompt
dbgpDlgPagesOk = 15  -- print some pages dialog 'ok' button text
dbgpDlgPagesCancel = 16  -- print some pages dialog 'cancel' button text.

Both some and current page printing from the preview *ignore* the number of copies specified in the PrintInfo (reasoning is - those things are most useful when a page has been jammed - in which case honoring number of copies doesn't make sense).

All above works even with the older versions of the grid (i.e. TDBGPP.DLL is backwards-compatible as usual), only numeric values must be used instead of the new enums.

A new runtime-only property has been also added to the PrintInfo object: RangeOfPages, which is a string with the semantics described above. It is honored *only* by PrintData, and ignored by PrintPreview.




Version 6.0b ("Rosebush In Bloom"), Build 6.0.0213
--------------------------------------------------

Outlook-Style Grouping Features (OLE DB grid only):

* This new feature mimics the column grouping behavior of Microsoft Outlook using grid splits to group columns. A tutorial has been added to demonstrate this feature.  It can be found in the \Tutorial\VB6\Oledb\Tutor25\ directory.  It uses the TDBGDemo.exe database.

* A new grid collection, GroupColumns, is provided to allow the programmer to obtain information about the current grouping order and manipulate this order programmatically.  

* Two new properties: GroupByCaption (TDBGrid property) and Group (Column property), as well as two new events: GroupColMove and GroupHeadClick, were also added to support Outlook-Style Grouping.


New Printing Features:

* Similar to Microsoft Excel, the Print DLL can now accommodate printing when the columns of grid data are too wide to fit onto one page.  Additional pages are printed for the columns that do not fit.

* Several new shortcut properties have been added to allow access to individual printer settings, rather than using the Settings property to access all properties as a single unit.  Consult the documentation for the PrintInfo object for details.

* New special symbols for printing page number data in the page headers and footers have been added.


Miscellaneous Features:

* New AnimateWindow properties have been added to the grid that allow you to control the style, direction, and duration of the animation when the TDBDropDown control, built-in combo box, or CellTips window are opened and closed.  These features are only available in Windows 98 and Windows NT 5.0 (Windows 2000).

* A new BatchUpdates property provides enhanced support for using the OLE DB grid with an ADO Recordset in batch update mode (particularly so when the grid is used in Internet Explorer).

* New AutoSize column method, which will resize a column to fit the longest *visible* record in the column.

* The XArrayDB object has a new LoadRows method which will populate the XArrayDB with data from any array in Visual Basic, such as that returned by the ADO Recordset object's GetRows method.  Generic Visual Basic arrays may also be used.



Version 6.0a ("Irises"), Build 6.0.0206
---------------------------------------

* A new property, DataView, has been added. The OLEDB version of  True DBGrid now supports the ability to display hierarchical  recordsets.  A tutorial has been added to demonstrate this feature.  It can be found in the \Tutorial\VB6\Oledb\Tutor24\ directory.  It uses the TDBGDemo.exe database.

* A new method, ExportToDelimitedFile, has been added. The OLEDB  version of True DBGrid now supports the ability to export rows  (only selected rows or all rows) to a delimited ASCII text file.

* A new column property, ConvertEmptyCell, has been added to both the OLEDB and ICursor versions of the grid. This property allows you to specify the what that is stored in the database when the column value is cleared and the cell is empty.  You may choose to either leave the empty cell as is (an empty string) or write a Null to the database.
  
 
New Export Features:

* Checkboxes have been added to the export methods.

* A new method, ExportToDelimitedFile, has been added. You can now export grid rows (all or selected) to a delimited  ASCII text file. Rows are delimited with a newline character,  and each field value can be defined with a prefix and suffix.


New Print Features:

* Print preview menu strings can now be replaced with user-specified  strings. Together with the PreviewPageOf property, the new features are primarily provided to accommodate different end-user languages. A new set of constants (MenuConstants) and two new methods (SetMenuText and GetMenuText) have been added.

* Graphics support has been added to printing (not supported for exporting). Now the print DLL prints all background and foreground bitmaps that are present in the grid. Transparent foreground bitmaps and checkboxes are also supported.

* When doing print preview, the formatted pages are now stored in a temporary file on disk, so it is possible to print preview large documents without exhausting memory.

* A new boolean property - PrintInfo.Draft has been added. Its default value is False. If True, it will cause slightly faster printing at the cost of lower output quality (e.g. draft-quality fonts and lower-resolution background images)

* Font substitution has been enabled, via two new PrintInfo methods: SubstituteFont, and GetSubstituteFont. Use these methods to specify a substitution font with the same characteristics as the unavailable font.  

* A new string property, PreviewPageOf, has been added to PrintInfo. Use this property to control the string that is displayed in the PrintPreview's page number field.

* A new shortcut, (Ctrl+P) has been added to PrintPreview, which will print the document.



================================================
(4) Changes and Bug Fixes
================================================

The following list describes changes and bug fixes that have been made to the latest release.



Version 6.0c ("Green Wheat Fields"), Build 6.0.0220
---------------------------------------------------

* A rounding error sometimes caused column widths to shrink by a small amount every time the project is run.  This has been corrected. (Bug #1181, #1420, #1425)

* In some cases, with the OLE DB version of the grid, some data cells would appear empty when printing or exporting grid data. This has been corrected. (Bug #1297, 1448)

* Several problems were fixed relating to the Values tab of the property pages. (Bug #1319)

* The NumberFormat property now works correctly for the format string "mm/dd/yyyy" when the underlying date value is empty. (Bug #1362)

* The Retrieve Fields context menu command now works correctly when the grid is bound to a Data Environment. (Bug #1375)

* If the XArrayDB was dimensioned to 0,-1,0,4 only three columns were visible in the grid (instead of five).  This has been corrected. (Bug #1377)

* Using the Clear method of the DataObject object in the OleStartDrag event now works correctly. (Bug #1378)

* The AfterUpdate and BeforeUpdate events now fire correctly when the grid is used in Internet Explorer. (Bug #1382)

* The GetBookmark method now correctly returns a NULL value when the targeted row is on/before BOF or on/after EOF. (Bug #1390)

* Resizing a merged column no longer causes a GPF. (Bug #1395)

* Previously, if editing was disallowed for certain rows in the grid by setting the Locked property of the Style object passed into the FetchCellStyle or FetchRowStyle events, the grid would still allow you to toggle/cycle the cell value by clicking on the cell.  The grid now (correctly) disallows cell edits using this technique. (Bug #1410)

* Sometimes re-dimensioning the XArrayDB object after invoking the LoadRows method would cause a GPF.  This is now fixed. (Bug #1450)

* The AddRegexCellStyle method now works properly for cells in merged columns. (Bug #1454)

* Several problems relating to multi-line mode have been corrected. (Bug #1465)

* The grid's display no longer becomes unstable in Outlook-Style Grouping mode if you drag a column header to the grouping area and then attempt to drag a cell somewhere in the grid. (Bug #1485)

* Fixed a memory leak which occurred when images are loaded into the grid using the FetchCellStyle or FetchRowStyle events. (Bug #1490)

* Executing the Refetch method on a column in a bound grid no longer gives an Automation Error.

* Fixed several problems associated with Picture-related properties in the grid's property pages.

* Some Header*, Footer*, Button*, EditMask* properties were not being properly saved when changed by the user.  This is now fixed.

* Inconsistencies in behavior between the ICursor and OLE DB grids when setting the Bookmark property have been corrected.

* In some cases, deleting the last row of the grid and issuing the ReBind method would cause the grid to blank out when the grid was bound to the Visual Basic built-in (DAO) Data Control.  This has been fixed.

* For the ICursor grid, if you change the AbsolutePosition property of the Data Control's Recordset, data will not show properly in the grid.  Fixed.

* Fixed a GPF that would occur sometimes when dragging the mouse over a selected column whose ExtendRightColumn property is True.

* The RefetchCell method now behaves correctly if the optional argument is omitted.

* The ButtonClick event now fires when you press the Spacebar while the grid's current cell is rendered as a command button (ButtonText property of the column is True).

* The OwnerDrawCell event parameters are now correct for cells in merged columns.

* Fixed several problems where the grid would exhibit strange or incorrect behavior when using or processing DBCS characters.

* Some problems with the XArrayDB Find and QuickSort methods have been fixed, several of which involve international characters.

* A problem with the TDBDropDown control not being sized correctly when the IntegralHeight property is set to True has been fixed.

* Grid column indices were previously 1-based in the OwnerDrawCell event, which is incorrect.  The event now correctly reports 0-based column indices.  This will require changes to code in the OwnerDrawCell event.  Previously, it was necessary to use (Col-1) when referencing grid columns using the supplied parameters.  Instances of (Col-1) should now be changed to simply (Col).

* Typing an invalid value into the grid's property pages in Visual C++ no longer causes an infinite series of message boxes.

* In Visual C++, if column widths were set using the property pages or through visual editing mode, the column widths would appear different if the project were subsequently loaded into a computer where the graphics resolution or small/large font settings were not the same as the original.  In order for the fix to take effect after installing the OCX on your computer, you must cause the project's resources to be re-saved.  Toggling the value of a  property on the property pages should do the trick -- then save and recompile your project.



Version 6.0b ("Rosebush In Bloom"), Build 6.0.0213
--------------------------------------------------

* Check boxes are now aligned correctly when the column alignment is set to dbgCenter.  (Bug #1089)

* AddNew now works correctly for ADODB recordsets with the LockType property set to adLockBatchOptimistic.  Make sure to set the new BatchUpdates property to True in this case.  (Bug #1090)

* When the MarqueeStyle property was set to dbgHighlightRowRaiseCell the appearance was the same as dbgHighlightRow (the cell was not raised).  This has been fixed.  (Bug #1120)

* Fixed problem where the grid did not print when attached to a Data Environment.  (Bug #1124)

* Corrected problem with printing when the VariableRowHeight property was set.  (Bug #1125)

* Corrected a problem where using the PrintPreview method with the dbgSelectedRows argument would produce a run time error in the Print DLL.  (Bug #1128)

* A GPF that occurred when maximizing the PrintPreview window (Win95, Win98 only) was fixed.  (Bug #1136)

* The FetchRowStyle event now fires correctly when the current row is changed.  (Bug #1148)

* Previously, a grid using the Hierarchical data view was editable under some conditions, when it shouldn't have been.  This has been fixed.  (Bug #1151)

* Corrected a problem where the grid would not correctly print when using the Hierarchical data view.  (Bug #1153)

* Problems associated with deleting the row of an XArray containing only a single row have been corrected.  (Bug #1158)

* Executing the Close method for the OLE DB grid no longer results in a GPF  (Bug #1159)

* A small memory leak in the OLE DB grid was fixed.  (Bug #1160)

* The NumberFormat property now works correctly for following format string: "m/d/yyyy"  (Bug #1161)

* Fixed a problem involving a project containing multiple grids when layouts are saved for all the grids.  Previously, only the last layout saved was handled correctly.  (Bug #1169)

* Corrected a problem where the built-in combo was left floating when user presses Alt+Tab to switch between applications.  (Bug #1170)

* Fixed a problem where in some cases the TDBDropDown would sometimes produce a data type mismatch error.  (Bug #1174)

* Previously, if you set the heading style font in the grid's property, pages the height of the column headers did not adjust in the grid.  this has been corrected.  (Bug #1176)

* Corrected a problem where printing the grid from an application (EXE) that uses the grid in DataMode 2 - Unbound Extended, produced a DLL error.  (Bug #1199)

* Corrected a problem with the OLE DB grid where grid bookmarks and XArrayDB row numbers were out of sync after deleting rows.  (Bug #1214)

* Fixed a problem where the PrintPreview window would sometimes show the preview page in lower right corner when you changed the page setup settings (for example to Landscape orientation) before executing the PrintPreview method.  (Bug #1217)

* The ZOrder was wrong after PrintPreview window was closed in Visual C++.  This has been corrected.  (Bug #1218)

* Empty layouts can now be removed from the layout files.  (Bug #1220)

* Corrected a problem where the BeforeInsert event was fired twice when the grid is bound to the Microsoft Remote Data Control.  (Bug #1221)

* Fixed a problem where the ComboSelect event was not firing for the Tab key if the TabAction property was set to dbgGridNavigation.  (Bug #1234)

* Data was not being correctly formatted in BeforeColUpdate event in all cases.  This has been corrected.  (Bug #1278)

* The End and Home keys now correctly trigger the BeforeRowColChange event.  (Bug #1292)

* The HTML Export facility now correctly accounts for moved columns.  (Bug #1297)

* Fixed a problem where a column would sometimes appear in black on the PrintPreview page.  (Bug #1306)

* Printing now works correctly for merged columns.  (Bug #1310)

* Fixed a problem when the ButtonHeader property is True for a column where the HeadClick Event did not fire when the mouse was moved between MouseDown and MouseUp events, but was still positioned over the header.  (Bug #1312)

* Corrected a problem where the BeforeColUpdate event fired twice when tabbing off the column and the OldValue parameter was set to a different value in code.  (Bug #1314)

* The ConvertEmptyCell now works correctly for a grid bound to a DataEnvironment.  (Bug #1318)

* Previously, if you opened a TDBDropDown control attached to a column in the grid and resized one of its columns, subsequently moving the form on the screen would cause the dropdown would stay open and at the same place.  This has been corrected.   (Bug #1335)

* Previously, if the grid was printed or exported and RepeatColumnFooters was False, the column footer would be printed at the bottom of the first page.  Now in this case, the column footer is (correctly) printed only at the bottom of the last page.   If RepeatColumnFooters is True, the column footer is still printed at the bottom of every page, as it was previously.



Version 6.0a ("Irises"), Build 6.0.0206
---------------------------------------

* The online help file now correctly documents the behavior of the Refresh and ReBind methods in Storage mode (DataMode 4). NOTE: The information in the manual IS correct as written.

* PrintInfo.BlackAndWhite property has been removed.

* Print, print preview, and export should now handle all grid styles correctly, including styles changed via Fetch...Style methods.  NOTE: During printing (or print previewing) the user fetch style events are fired from the printing thread. As a result, if a breakpoint is set by the VB developer in the VB event handler code, VB sometimes will appear to hang when this breakpoint is arrived at during printing. As a possible solution, debug methods that do not require user input can be used to debug such code (e.g., Debug.Print).

* Some specific errors are now generated by the print code instead of the generic failure.

* If column update fails because of an illegal cell value (incorrect date or number format, for example), the illegal value stays in the cell and the grid remains in edit mode. This enables the user to correct the error without having to retype the entire value. Earlier versions automatically restored the previous value on column update failure.  (Applies to both the OLE DB and ICursor versions)

* The grid will exit editing mode upon losing focus only if the focus shifts from the grid to another control on the same form. If the focus shifts from the grid to a different form or to a message box, edit mode is maintained. (Applies to both the OLEDB and ICursor versions)

* HighlightRow style no longer ignores the setting of Font.Bold.

* Column merging behavior is now correct when a text-to-picture ValueItems translation is used in the column. 

* The grid will now print when bound to a Data Environment.

* Ctrl+Tab now works correctly between multiple forms.

* A column in Split 1 will no longer disappear when you are trying to resize it.

* The grid will now print correctly when the WrapText property is set to True.

* The grid will now display correctly when the Appearance is Flat and RowDividerStyle is Inset.

* The scrollbar in the built-in combo box now works properly.

* If no item matches the text in the current grid editor cell, no item will be selected in the dropdown.

* Pressing the Tab key when dropdown is open will move the cursor to the next column.

* Selecting from the TDBDropdown or built-in combo box now marks the row as dirty.

* VariableRowHeight now sizes printed rows correctly, and no longer shrinks the rows.

* When RowDividerStyle is set to None, the row dividers are now (correctly) not printed.

* Checkboxes now align correctly.

* Grid cell data can now be properly analyzed for regular expression conditions.

* Date problems with the FormatText event and regional settings have been cleared up.

* The XArrayDB Find method now returns the correct value in Windows 98.

* Editor sizing inconsistencies have been corrected.

* The MarqueeStyle constant dbgHighlightRowRaiseCell now works properly.

* If the VariableRowHeight property is set to True and a comment field is visible on the page, excess printing no longer occurs.

* A run time error no longer occurs when closing PrintPreview with nothing selected.



================================================
(5)  Explanation of ICursor and OLE DB
================================================

There are two types of data binding formats currently available for data-bound controls and data controls, ICursor and OLE DB.  These two data binding formats are not compatible with each other.  Thus, you cannot bind an OLE DB data-bound control to an ICursor data control, or vice versa.  You must bind ICursor data-bound controls to ICursor data controls, and OLE DB data-bound controls to OLE DB data controls.  Most data-bound controls and data controls support only ICursor or OLE DB; usually not both.

ICursor is supported by the Visual Basic 5.0 and 6.0 intrinsic data controls, as well as the Microsoft Remote Data Control.  All data-bound controls that shipped with Visual Basic 5.0 support ICursor, as do many that ship with Visual Basic 6.0.  

OLE DB is a new data binding specification supported by the ADO Data Control (ADODC) that ships with Visual Basic 6.0.  Visual Basic 6.0 also ships with a number of OLE DB data-bound controls, such as the Microsoft DataGrid and DataList controls.  OLE DB controls are generally marked with (OLEDB) in the Visual Basic 6.0 component gallery for your convenience.  (If a control is not labeled with (OLEDB), you can usually assume that it supports ICursor, and not OLE DB.)

True DBGrid Pro 6.0 supports both ICursor and OLE DB data binding by supplying two OCX grid controls:

The ICursor grid (TDBG6.OCX) supports binding to ICursor data controls, such as the VB5/VB6 intrinsic data controls and the Microsoft Remote Data Control (RDC).

The OLE DB grid (TODG6.OCX) supports binding to OLE DB compliant data controls, such as the ADO Data Control (ADODC) that ships with VB6.

The ICursor and OLE DB versions of True DBGrid Pro 6.0 support the same rich set of data presentation and user interface features, differing only in the types of data controls and data sources supported.  


NOTE: Both the ICursor and OLE DB grids support the same unbound data modes, although the unbound modes of the ICursor grid (TDBG6.OCX) are more efficient than those of the OLE DB grid (TODG6.OCX), which have not yet been fully optimized.



================================================
(6)  *** IMPORTANT: OLE DB Bug Information ***
================================================

A number of bugs were detected in the Microsoft OLE DB provider for ODBC when using server-side cursors (CursorLocation = adUseServer).  Using a server-side cursor with batch updates (LockType=adLockBatchOptimistic) has shown to be especially problematic.  

Based on our findings, we STRONGLY recommend using client-side cursors (CursorLocation = adUseClient) instead of server-side cursors.  Batch updates will work properly with client-side cursors in True DBGrid Pro 6.0.

IMPORTANT NOTE: When creating an ADO Recordset at run time through Visual Basic code, the CursorLocation property will default to adUseServer.  Thus you MUST specifically set CursorLocation to adUseClient, or you will encounter problems.



================================================
(7)  Samples and Tutorials
================================================
  
About the Tutorials
-------------------

True DBGrid Pro 6.0 ships with several sets of tutorial and sample projects.  

All Visual Basic 5.0 tutorials and samples use the ICursor grid (TDBG6.OCX).

There are two sets of True DBGrid 6.0 tutorials and samples for Visual Basic 6.0, one for the ICursor grid (TDBG6.OCX), and one for the OLE DB grid (TODG6.OCX). 


Running the HTML Tutorials
--------------------------

The HTML tutorials and samples were designed for Windows NT 4.0 systems with Windows NT 4.0 Service Pack 3 (or later) and Internet Explorer 4.0 installed.  For most of the tutorials and samples, you will need the Remote Data Services data control (RDS) installed on your system.  RDS is a component of Internet Information Server (IIS) 4.0, which is installed by the Microsoft Windows NT 4.0 Option Pack.  As of the time of this writing, you may download the Option Pack from the following URL:
        
http://www.microsoft.com/NTServer/all/downloads.asp

To obtain IIS 4.0 for other operating systems, please contact Microsoft or visit their web site at:

http://www.microsoft.com/


Extra Sample Projects
---------------------

Also included with this product is a collection of extra unbound and storage mode projects compiled by the APEX support staff which have been found to be useful by our customers and beta testers.  These extra samples have been placed into the \Samples\Extra folder where you installed True DBGrid Pro 6.0.  These projects are not documented and not officially supported by APEX, although we will try to answer questions about them.

Many of these extra sample projects are very valuable and useful.  Some show how to use the grid with ADO, DAO, and RDO in unbound mode, some show how to dump Recordset or Resultset data into an XArray or XArrayDB object, and others show miscellaneous features and tips.  Most of the sample projects in the \Samples\Extra folder contain a Readme.txt file that gives a small description of the sample.

Enjoy!



================================================
(8)  Migration
================================================

A migration utility is provided for you to migrate projects created with DBGrid, True DBGrid 4.0, and True DBGrid Pro 5.0 ICursor grid controls to True DBGrid Pro 6.0 (ICursor) or True DBGrid Pro 6.0 (OLE DB).

The migration utility can also be used to migrate a True DBGrid Pro 6.0 (ICursor) project to True DBGrid Pro 6.0 (OLE DB), and vice versa.  Note however that when migrating from an ICursor control to an OLE DB control (or vice versa) will *only* replace the grid for you and modify grid code.  The migration utility does not replace the data control or migrate any data access code for you, which you must do yourself. 

Example:  If you migrate a True DBGrid Pro 5.0 project which uses the VB6 Data control to True DBGrid Pro 6.0 (OLE DB), the migration utility will change event declarations and TrueDBGrid50 to TrueOleDBGrid60 as appropriate, but the project will not work (the grid is now OLE DB, which is incompatible with the VB6 intrinsic (ICursor) data control.  You must then replace the VB6 Data control with an OLE DB data control (such as the ADO data control which ships with VB6) and replace all data control code in your project.



================================================
(9)  Distribution Requirements
================================================


The following listing contains all redistributable True DBGrid Pro 6.0 files provided by APEX:

TDBG6.OCX     (APEX True DBGrid Pro 6.0 ICursor grid)
TODG6.OCX     (APEX True DBGrid Pro 6.0 OLE DB grid)
TODGUB6.DLL   (Unbound mode support DLL for use with TODG6.OCX)
TDBGPP.DLL    (Printing and print preview support DLL)
XARRAY32.OCX  (APEX XArray Object)
XARRAYDB.OCX  (APEX XArrayDB Object)


The guidelines below will list the necessary files which must be distributed with programs that use True DBGrid Pro 6.0.  (NOTE: The guidelines below do not list Visual Basic, OLE, or Database-related run time support files which may also be required for distributing your project.)


If you are using the ICursor version of True DBGrid Pro 6.0:
------------------------------------------------------------

* You must ALWAYS distribute TDBG6.OCX.

* If you are using XArray anywhere in your project (with or without the grid), you must distribute XARRAY32.OCX.

* If you are using XArrayDB anywhere in your project (with or without the grid), you must distribute XARRAYDB.OCX.

* If you are using the grid's printing or exporting features, you must distribute TDBGPP.DLL.


If you are using the OLE DB version of True DBGrid Pro 6.0:
------------------------------------------------------------

* You must ALWAYS distribute TODG6.OCX.

* If you are using any grids in your project where the DataMode is set to 1 (Unbound), 2 (Unbound Extended), 3 (Application), or 4 (Storage Mode), you must distribute TODGUB6.DLL.

* If you are using XArray anywhere in your project (with or without the grid), you must distribute XARRAY32.OCX.

* If you are using XArrayDB anywhere in your project (with or without the grid), you must distribute XARRAYDB.OCX.

* If you are using the grid's printing or exporting features, you must distribute TDBGPP.DLL.



----------------------------------------------------------------
Thank you, 
APEX Software Corporation
