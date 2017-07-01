				  README.TXT

		Release Notes for Microsoft (R) Visual Basic (TM)

				 Version 1.00

		  (C) Copyright Microsoft Corporation, 1991

This document contains release notes for version 1.00 of Microsoft Visual
Basic for Windows Version 3.0, and later.  Information in this document is
more current than that in the manuals. Information in online Help may also
be more current than that in the manuals.

Microsoft revises its languages documentation at the time of reprinting, so
some of the information in this online file may already be included in your
manuals.

Contents
===========================================================================

Part	Description
----	-----------

1	Software Installation Information

2	Notes for "Microsoft Visual Basic Programmer's Guide"

3	Notes for "Microsoft Visual Basic Language Reference"

4	Notes for Tutorial

5	Miscellaneous Notes and Tips


Part 1: Software Installation Information
===========================================================================

Before installing Visual Basic you should make backup copies of all the
distribution disks.  Do not write-protect the distribution disks you use to
install Visual Basic. If you do, Visual Basic cannot be successfully
installed.

Also ensure that the Windows directory, including drive letter, is in your
PATH. If the drive letter is not included in your PATH statement, Visual
Basic will be unable to determine where Windows resides.

SETUP.EXE is a Windows application; that is, it is run from Windows, rather
than from the DOS prompt.  SETUP.EXE will only run in Windows Standard or
Enhanced mode. It will not run in Real mode.  You can determine how Windows
is configured on your computer by choosing About from the Help menu in the
Program Manager.

To install Visual Basic, use Program Manager or File Manager to start
SETUP.EXE as you would any other Windows application.  For example, if you
are installing from A:

	1. From the Program Manager File menu, choose Run.

	2. In the Run dialog box, type A:SETUP and choose OK.

Most of the files on these disks are compressed and must be expanded before
they can be used. For Visual Basic to work properly, you must install the
files using SETUP.EXE. You cannot simply copy the files to your hard disk.


Part 2: Notes for "Microsoft Visual Basic Programmer's Guide"
===========================================================================

Page	Section\Note
----	------------

117	An Application that Adds and Deletes Menu Commands
	--------------------------------------------------
	Change the last item in the table near the bottom of the page so
	that CtlName is SepBar and Index is blank. At the bottom of the
	table add another line with a blank caption, AppName as the
	CtlName, indented once, with 1 as the Index.

	Insert a sentence immediately following the table that reads:

	Turn off the Visible property for AppName by toggling the
	Visible check box.

	Change "AppName" in the sentence following the table to "SepBar".

118	Delete the sentence that begins "Therefore, you cannot..." from the
	second paragraph on the page. Add the following line of code just
	above the End Sub for the AddApp_Click procedure:

	AppName(LMenu).Visible = -1

170	Creating a Control Array
	------------------------
	In the example code at the bottom of the page Format(I) should be
	Format$(I).


223	Displaying the GroupChoice Form
	-------------------------------
	The last sentence on the page should read:

	Then create a list box (named GroupList) large enough to hold six
	or more items.


353	Chapter 22 - Communicating with Other Applications
	--------------------------------------------------
	This chapter discusses the links that enable applications to
	exchange information through dynamic-data exchange (DDE). The
	correct names for the two kinds of DDE links are "hot link" and
	"cold link." On pages 360, 370, and 371 cold links are incorrectly
	referred to as "warm."


360	LinkTimeOut
	-----------
	The note near the bottom of the page incorrectly indicates that the
	Alt key is pressed to interrupt pending DDE operations. Actually,
	the Esc key is used to interrupt DDE operations.


364	LinkExecute
	-----------
	The example code shown will work correctly, however to be
	syntactically correct, it should appear as follows:

	Sub Form_LinkExecute (CmdStr As String, Cancel As Integer)
	    Const FALSE = 0, TRUE = Not FALSE
	    If CmdStr = "[Quit]" Then
		Cancel = FALSE
		End
	    Else
		Cancel = TRUE
	    End If
	End Sub


386	Null Pointers
	-------------
	The call to the FindWindow DLL routine near the top of the page
	should read as:

	hWndExcel% = FindWindow%(ByVal 0&, ByVal "Microsoft Excel")

	Insert the following paragraph immediately following the statement
	shown above:

	The use of ByVal when passing a string is necessary because the
	data type of that argument was declared as Any. Including ByVal
	when passing a string declared as Any causes Visual Basic to
	convert the string to the null-terminated form expected by most
	DLL routines.


386	Properties
	----------
	The Lib clause in the external function Declare statement should
	say "GDI" instead of "User."


Part 3: Notes for "Microsoft Visual Basic Language Reference"
===========================================================================

Page	Section\Note
----	------------

  9	Table 3 - Properties by Programming Task
	----------------------------------------
	In the Windows category at the bottom of the page, the property for
	"Get handle for form" should be hWnd, not hWin.


 27	AutoRedraw Property
	-------------------
	The Note should include the following paragraph:

	When you minimize a form whose AutoRedraw property is set to False
	(0), ScaleHeight and ScaleWidth are set to icon size. When
	AutoRedraw is set to True (-1), ScaleHeight and ScaleWidth remain
	the size of the restored window.


 31	BorderStyle Property
	--------------------
	In the Description section change the word "picture" to "text."

	Add the following paragraph at the end of the Remarks section:

	Because of appearance, the BorderStyle for forms with a menu can
	only be set to Sizable (2) or Fixed Single (1). Setting the
	BorderStyle property to None (0) or Fixed Double (3) forces the
	BorderStyle property to Fixed Single (1).


147	Icon Property
	-------------
	In the Description section change "read-only" to "read-write."

	Change the note to read as follows:

	For a form icon to be functional, the BorderStyle property must be
	set to either 1 (Fixed Single) or 2 (Sizable). The MinButton
	property must be set to True (-1).

	At run time, you can assign an object's Icon property to another
	object's DragIcon or Icon property. You can also assign an icon
	returned by the LoadPicture function. Doing this assigns an empty
	(null) icon, which enables you to draw on the icon at run time.


176	LinkExecute Event
	-----------------
	The default value for the Cancel% argument to the LinkExecute event
	is True (-1). This is done so that if no LinkExecute procedure is
	written, Visual Basic properly returns a negative acknowledgement
	to any application that attempts to send a string to Visual Basic
	to be executed.


188	List Property
	-------------
	The last sentence in the Description should be changed to read:

	The List property is not available at design time; it is read-only
	for drive, file, and directory list boxes and read-write for combo
	and list boxes.


285	SetData Method
	--------------
	The parentheses shown in the syntax example should be removed.


Part 4: Notes for Tutorial
===========================================================================

Tutorial Screen Conflicts
-------------------------
Some Windows programs that run in the background and automatically perform
some action on the screen may behave unpredictably when the Visual Basic
Tutorial is running. For this reason, we recommend that you turn off or
unload screen savers and background clock-type programs before running the
Tutorial.


Part 5: Miscellaneous Notes and Tips
===========================================================================

Using Frames
------------
If you plan to group controls on a form using a frame, draw your frame
first, then draw the controls in the frame. This allows you to reposition
the frame and the controls it contains as a single unit rather than having
to move each part separately.


Deleting or Renaming Controls
-----------------------------
When you delete or rename a control for which you have written event
procedures, the event procedures themselves are not deleted. All such event
procedures become general procedures with their names preserved. If you
create a new control of the same name, those general procedures will once
again become attached to that control. If you rename those general
procedures to match the name of an existing control, they too will become
attached to that control. Note that while the event procedures are
restored, the value of any properties you previously assigned to the
deleted control are lost.


Displaying Modal Forms from the Immediate Window
------------------------------------------------
Forms cannot be displayed modally using the Show method in the Immediate
window. You can, however, call a procedure from the Immediate window which
contains a Show method to display a modal form. There are no restrictions
on the display of non-modal forms.


Design-Time Dynamic Data Exchange (DDE)
---------------------------------------
If you establish a design-time DDE link (either as a client or as a server)
between another application and a Visual Basic text box, changing any
property which causes the text box to be destroyed and recreated will
terminate the link.  For example, changing a text box from single line to
multiline terminates a design-time DDE link; the Visual Basic developer
must re-establish the link if it's still needed.


Terminating DDE Links During Form_Unload
----------------------------------------
You must terminate all DDE links before you close a form that contains
any controls involved in the link.


Submenu Visibility
------------------
If you have a menu with submenu items, at least one submenu item must
always be visible, i.e., the Visible property must be set to True (-1).


Calling DLL Routines by Ordinal Number
--------------------------------------

Some DLLs export their routines by ordinal number rather than by name. To
call one of these DLL routines, you must declare it with an alias string
that includes the number sign character (#) followed by the ordinal number.
For example, to declare the routine with ordinal number 234:

    Declare Sub AnyRoutine Lib "AnyDLL" Alias "#234" (ByVal Var As Long)


Default WindowState
-------------------
Whatever WindowState (minimized, restored, or maximized) a form is when
Visual Basic goes to Run mode may become the new default WindowState. If
you want your forms to retain a specific WindowState you must either close
the form before running or explicitly set the WindowState in the Form_Load
event. However, this last technique prevents the application from being run
in a state different from the state explicitly set.


Custom Controls
---------------
You must remove all instances of a custom control from project forms before
removing the custom control file from the project.

If you're replacing or updating a custom control file with a newer version,
you should not remove (using File Remove File) the old version and then add
the new version (using File Add File). Instead, simply copy the new version
over the old version and reload the entire project.
