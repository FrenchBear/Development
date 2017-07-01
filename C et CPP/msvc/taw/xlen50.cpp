// Machine generated IDispatch wrapper class(es) created with ClassWizard

#include "stdafx.h"
#include "xlen50.h"


/////////////////////////////////////////////////////////////////////////////
// _Global properties

VARIANT _Global::GetActiveCell()
{
	VARIANT result;
	GetProperty(0x131, VT_VARIANT, (void*)&result);
	return result;
}

void _Global::SetActiveCell(const VARIANT& propVal)
{
	SetProperty(0x131, VT_VARIANT, &propVal);
}

VARIANT _Global::GetActiveChart()
{
	VARIANT result;
	GetProperty(0xb7, VT_VARIANT, (void*)&result);
	return result;
}

void _Global::SetActiveChart(const VARIANT& propVal)
{
	SetProperty(0xb7, VT_VARIANT, &propVal);
}

VARIANT _Global::GetActiveDialog()
{
	VARIANT result;
	GetProperty(0x32f, VT_VARIANT, (void*)&result);
	return result;
}

void _Global::SetActiveDialog(const VARIANT& propVal)
{
	SetProperty(0x32f, VT_VARIANT, &propVal);
}

VARIANT _Global::GetActiveMenuBar()
{
	VARIANT result;
	GetProperty(0x2f6, VT_VARIANT, (void*)&result);
	return result;
}

void _Global::SetActiveMenuBar(const VARIANT& propVal)
{
	SetProperty(0x2f6, VT_VARIANT, &propVal);
}

VARIANT _Global::GetActivePrinter()
{
	VARIANT result;
	GetProperty(0x132, VT_VARIANT, (void*)&result);
	return result;
}

void _Global::SetActivePrinter(const VARIANT& propVal)
{
	SetProperty(0x132, VT_VARIANT, &propVal);
}

VARIANT _Global::GetActiveSheet()
{
	VARIANT result;
	GetProperty(0x133, VT_VARIANT, (void*)&result);
	return result;
}

void _Global::SetActiveSheet(const VARIANT& propVal)
{
	SetProperty(0x133, VT_VARIANT, &propVal);
}

VARIANT _Global::GetActiveWindow()
{
	VARIANT result;
	GetProperty(0x2f7, VT_VARIANT, (void*)&result);
	return result;
}

void _Global::SetActiveWindow(const VARIANT& propVal)
{
	SetProperty(0x2f7, VT_VARIANT, &propVal);
}

VARIANT _Global::GetActiveWorkbook()
{
	VARIANT result;
	GetProperty(0x134, VT_VARIANT, (void*)&result);
	return result;
}

void _Global::SetActiveWorkbook(const VARIANT& propVal)
{
	SetProperty(0x134, VT_VARIANT, &propVal);
}

VARIANT _Global::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void _Global::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT _Global::GetDDEAppReturnCode()
{
	VARIANT result;
	GetProperty(0x14c, VT_VARIANT, (void*)&result);
	return result;
}

void _Global::SetDDEAppReturnCode(const VARIANT& propVal)
{
	SetProperty(0x14c, VT_VARIANT, &propVal);
}

VARIANT _Global::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void _Global::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT _Global::GetSelection()
{
	VARIANT result;
	GetProperty(0x93, VT_VARIANT, (void*)&result);
	return result;
}

void _Global::SetSelection(const VARIANT& propVal)
{
	SetProperty(0x93, VT_VARIANT, &propVal);
}

VARIANT _Global::GetThisWorkbook()
{
	VARIANT result;
	GetProperty(0x30a, VT_VARIANT, (void*)&result);
	return result;
}

void _Global::SetThisWorkbook(const VARIANT& propVal)
{
	SetProperty(0x30a, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// _Global operations

VARIANT _Global::AddIns(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x225, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT _Global::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT _Global::Calculate()
{
	VARIANT result;
	InvokeHelper(0x117, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT _Global::Cells(const VARIANT& RowIndex, const VARIANT& ColumnIndex)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xee, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&RowIndex, &ColumnIndex);
	return result;
}

VARIANT _Global::Charts(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x79, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT _Global::Columns(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xf1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT _Global::DDEExecute(const VARIANT& Channel, const VARIANT& String)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x14d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Channel, &String);
	return result;
}

VARIANT _Global::DDEInitiate(const VARIANT& App, const VARIANT& Topic)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x14e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&App, &Topic);
	return result;
}

VARIANT _Global::DDEPoke(const VARIANT& Channel, const VARIANT& Item, const VARIANT& Data)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x14f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Channel, &Item, &Data);
	return result;
}

VARIANT _Global::DDERequest(const VARIANT& Channel, const VARIANT& Item)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x150, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Channel, &Item);
	return result;
}

VARIANT _Global::DDETerminate(const VARIANT& Channel)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x151, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Channel);
	return result;
}

VARIANT _Global::DialogSheets(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x2fc, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT _Global::_Evaluate(const VARIANT& Name)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name);
	return result;
}

VARIANT _Global::Evaluate(const VARIANT& Name)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xfffffffb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name);
	return result;
}

VARIANT _Global::Excel4IntlMacroSheets(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x245, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT _Global::Excel4MacroSheets(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x243, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT _Global::ExecuteExcel4Macro(const VARIANT& String)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x15e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&String);
	return result;
}

VARIANT _Global::Intersect(const VARIANT& Arg1, const VARIANT& Arg2, const VARIANT& Arg3, const VARIANT& Arg4, const VARIANT& Arg5, const VARIANT& Arg6, const VARIANT& Arg7, const VARIANT& Arg8, const VARIANT& Arg9, const VARIANT& Arg10, 
		const VARIANT& Arg11, const VARIANT& Arg12, const VARIANT& Arg13, const VARIANT& Arg14, const VARIANT& Arg15, const VARIANT& Arg16, const VARIANT& Arg17, const VARIANT& Arg18, const VARIANT& Arg19, const VARIANT& Arg20, 
		const VARIANT& Arg21, const VARIANT& Arg22, const VARIANT& Arg23, const VARIANT& Arg24, const VARIANT& Arg25, const VARIANT& Arg26, const VARIANT& Arg27, const VARIANT& Arg28, const VARIANT& Arg29, const VARIANT& Arg30, 
		const VARIANT& Arg31)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT 
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x2fe, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Arg1, &Arg2, &Arg3, &Arg4, &Arg5, &Arg6, &Arg7, &Arg8, &Arg9, &Arg10, &Arg11, &Arg12, &Arg13, &Arg14, &Arg15, &Arg16, &Arg17, &Arg18, &Arg19, &Arg20, &Arg21, &Arg22, &Arg23, &Arg24, &Arg25, &Arg26, &Arg27, &Arg28, &Arg29, &Arg30, &Arg31);
	return result;
}

VARIANT _Global::MenuBars(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x24d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT _Global::Modules(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x246, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT _Global::Names(const VARIANT& Index, const VARIANT& IndexLocal, const VARIANT& RefersTo)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1ba, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index, &IndexLocal, &RefersTo);
	return result;
}

VARIANT _Global::Range(const VARIANT& Cell1, const VARIANT& Cell2)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xc5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Cell1, &Cell2);
	return result;
}

VARIANT _Global::Rows(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x102, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT _Global::Run(const VARIANT& Macro, const VARIANT& Arg1, const VARIANT& Arg2, const VARIANT& Arg3, const VARIANT& Arg4, const VARIANT& Arg5, const VARIANT& Arg6, const VARIANT& Arg7, const VARIANT& Arg8, const VARIANT& Arg9, 
		const VARIANT& Arg10, const VARIANT& Arg11, const VARIANT& Arg12, const VARIANT& Arg13, const VARIANT& Arg14, const VARIANT& Arg15, const VARIANT& Arg16, const VARIANT& Arg17, const VARIANT& Arg18, const VARIANT& Arg19, 
		const VARIANT& Arg20, const VARIANT& Arg21, const VARIANT& Arg22, const VARIANT& Arg23, const VARIANT& Arg24, const VARIANT& Arg25, const VARIANT& Arg26, const VARIANT& Arg27, const VARIANT& Arg28, const VARIANT& Arg29, 
		const VARIANT& Arg30)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT 
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x103, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Macro, &Arg1, &Arg2, &Arg3, &Arg4, &Arg5, &Arg6, &Arg7, &Arg8, &Arg9, &Arg10, &Arg11, &Arg12, &Arg13, &Arg14, &Arg15, &Arg16, &Arg17, &Arg18, &Arg19, &Arg20, &Arg21, &Arg22, &Arg23, &Arg24, &Arg25, &Arg26, &Arg27, &Arg28, &Arg29, &Arg30);
	return result;
}

VARIANT _Global::SendKeys(const VARIANT& Keys, const VARIANT& Wait)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x17f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Keys, &Wait);
	return result;
}

VARIANT _Global::Sheets(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1e5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT _Global::ShortcutMenus(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x308, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT _Global::Toolbars(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x228, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT _Global::Union(const VARIANT& Arg1, const VARIANT& Arg2, const VARIANT& Arg3, const VARIANT& Arg4, const VARIANT& Arg5, const VARIANT& Arg6, const VARIANT& Arg7, const VARIANT& Arg8, const VARIANT& Arg9, const VARIANT& Arg10, 
		const VARIANT& Arg11, const VARIANT& Arg12, const VARIANT& Arg13, const VARIANT& Arg14, const VARIANT& Arg15, const VARIANT& Arg16, const VARIANT& Arg17, const VARIANT& Arg18, const VARIANT& Arg19, const VARIANT& Arg20, 
		const VARIANT& Arg21, const VARIANT& Arg22, const VARIANT& Arg23, const VARIANT& Arg24, const VARIANT& Arg25, const VARIANT& Arg26, const VARIANT& Arg27, const VARIANT& Arg28, const VARIANT& Arg29, const VARIANT& Arg30, 
		const VARIANT& Arg31)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT 
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x30b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Arg1, &Arg2, &Arg3, &Arg4, &Arg5, &Arg6, &Arg7, &Arg8, &Arg9, &Arg10, &Arg11, &Arg12, &Arg13, &Arg14, &Arg15, &Arg16, &Arg17, &Arg18, &Arg19, &Arg20, &Arg21, &Arg22, &Arg23, &Arg24, &Arg25, &Arg26, &Arg27, &Arg28, &Arg29, &Arg30, &Arg31);
	return result;
}

VARIANT _Global::Windows(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1ae, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT _Global::Workbooks(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x23c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT _Global::Worksheets(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1ee, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Application properties

VARIANT Application::GetActiveCell()
{
	VARIANT result;
	GetProperty(0x131, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetActiveCell(const VARIANT& propVal)
{
	SetProperty(0x131, VT_VARIANT, &propVal);
}

VARIANT Application::GetActiveChart()
{
	VARIANT result;
	GetProperty(0xb7, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetActiveChart(const VARIANT& propVal)
{
	SetProperty(0xb7, VT_VARIANT, &propVal);
}

VARIANT Application::GetActiveDialog()
{
	VARIANT result;
	GetProperty(0x32f, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetActiveDialog(const VARIANT& propVal)
{
	SetProperty(0x32f, VT_VARIANT, &propVal);
}

VARIANT Application::GetActiveMenuBar()
{
	VARIANT result;
	GetProperty(0x2f6, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetActiveMenuBar(const VARIANT& propVal)
{
	SetProperty(0x2f6, VT_VARIANT, &propVal);
}

VARIANT Application::GetActivePrinter()
{
	VARIANT result;
	GetProperty(0x132, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetActivePrinter(const VARIANT& propVal)
{
	SetProperty(0x132, VT_VARIANT, &propVal);
}

VARIANT Application::GetActiveSheet()
{
	VARIANT result;
	GetProperty(0x133, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetActiveSheet(const VARIANT& propVal)
{
	SetProperty(0x133, VT_VARIANT, &propVal);
}

VARIANT Application::GetActiveWindow()
{
	VARIANT result;
	GetProperty(0x2f7, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetActiveWindow(const VARIANT& propVal)
{
	SetProperty(0x2f7, VT_VARIANT, &propVal);
}

VARIANT Application::GetActiveWorkbook()
{
	VARIANT result;
	GetProperty(0x134, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetActiveWorkbook(const VARIANT& propVal)
{
	SetProperty(0x134, VT_VARIANT, &propVal);
}

VARIANT Application::GetAlertBeforeOverwriting()
{
	VARIANT result;
	GetProperty(0x3a2, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetAlertBeforeOverwriting(const VARIANT& propVal)
{
	SetProperty(0x3a2, VT_VARIANT, &propVal);
}

VARIANT Application::GetAltStartupPath()
{
	VARIANT result;
	GetProperty(0x139, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetAltStartupPath(const VARIANT& propVal)
{
	SetProperty(0x139, VT_VARIANT, &propVal);
}

VARIANT Application::GetAskToUpdateLinks()
{
	VARIANT result;
	GetProperty(0x3e0, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetAskToUpdateLinks(const VARIANT& propVal)
{
	SetProperty(0x3e0, VT_VARIANT, &propVal);
}

VARIANT Application::GetBuild()
{
	VARIANT result;
	GetProperty(0x13a, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetBuild(const VARIANT& propVal)
{
	SetProperty(0x13a, VT_VARIANT, &propVal);
}

VARIANT Application::GetCalculateBeforeSave()
{
	VARIANT result;
	GetProperty(0x13b, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetCalculateBeforeSave(const VARIANT& propVal)
{
	SetProperty(0x13b, VT_VARIANT, &propVal);
}

VARIANT Application::GetCalculation()
{
	VARIANT result;
	GetProperty(0x13c, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetCalculation(const VARIANT& propVal)
{
	SetProperty(0x13c, VT_VARIANT, &propVal);
}

VARIANT Application::GetCaller()
{
	VARIANT result;
	GetProperty(0x13d, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetCaller(const VARIANT& propVal)
{
	SetProperty(0x13d, VT_VARIANT, &propVal);
}

VARIANT Application::GetCanPlaySounds()
{
	VARIANT result;
	GetProperty(0x13e, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetCanPlaySounds(const VARIANT& propVal)
{
	SetProperty(0x13e, VT_VARIANT, &propVal);
}

VARIANT Application::GetCanRecordSounds()
{
	VARIANT result;
	GetProperty(0x13f, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetCanRecordSounds(const VARIANT& propVal)
{
	SetProperty(0x13f, VT_VARIANT, &propVal);
}

VARIANT Application::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT Application::GetCellDragAndDrop()
{
	VARIANT result;
	GetProperty(0x140, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetCellDragAndDrop(const VARIANT& propVal)
{
	SetProperty(0x140, VT_VARIANT, &propVal);
}

VARIANT Application::GetClipboardFormats()
{
	VARIANT result;
	GetProperty(0x141, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetClipboardFormats(const VARIANT& propVal)
{
	SetProperty(0x141, VT_VARIANT, &propVal);
}

VARIANT Application::GetColorButtons()
{
	VARIANT result;
	GetProperty(0x16d, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetColorButtons(const VARIANT& propVal)
{
	SetProperty(0x16d, VT_VARIANT, &propVal);
}

VARIANT Application::GetCommandUnderlines()
{
	VARIANT result;
	GetProperty(0x143, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetCommandUnderlines(const VARIANT& propVal)
{
	SetProperty(0x143, VT_VARIANT, &propVal);
}

VARIANT Application::GetConstrainNumeric()
{
	VARIANT result;
	GetProperty(0x144, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetConstrainNumeric(const VARIANT& propVal)
{
	SetProperty(0x144, VT_VARIANT, &propVal);
}

VARIANT Application::GetCopyObjectsWithCells()
{
	VARIANT result;
	GetProperty(0x3df, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetCopyObjectsWithCells(const VARIANT& propVal)
{
	SetProperty(0x3df, VT_VARIANT, &propVal);
}

VARIANT Application::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Application::GetCustomListCount()
{
	VARIANT result;
	GetProperty(0x313, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetCustomListCount(const VARIANT& propVal)
{
	SetProperty(0x313, VT_VARIANT, &propVal);
}

VARIANT Application::GetCutCopyMode()
{
	VARIANT result;
	GetProperty(0x14a, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetCutCopyMode(const VARIANT& propVal)
{
	SetProperty(0x14a, VT_VARIANT, &propVal);
}

VARIANT Application::GetDataEntryMode()
{
	VARIANT result;
	GetProperty(0x14b, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetDataEntryMode(const VARIANT& propVal)
{
	SetProperty(0x14b, VT_VARIANT, &propVal);
}

VARIANT Application::GetDDEAppReturnCode()
{
	VARIANT result;
	GetProperty(0x14c, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetDDEAppReturnCode(const VARIANT& propVal)
{
	SetProperty(0x14c, VT_VARIANT, &propVal);
}

VARIANT Application::GetDefaultFilePath()
{
	VARIANT result;
	GetProperty(0x40e, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetDefaultFilePath(const VARIANT& propVal)
{
	SetProperty(0x40e, VT_VARIANT, &propVal);
}

VARIANT Application::GetDisplayAlerts()
{
	VARIANT result;
	GetProperty(0x157, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetDisplayAlerts(const VARIANT& propVal)
{
	SetProperty(0x157, VT_VARIANT, &propVal);
}

VARIANT Application::GetDisplayClipboardWindow()
{
	VARIANT result;
	GetProperty(0x142, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetDisplayClipboardWindow(const VARIANT& propVal)
{
	SetProperty(0x142, VT_VARIANT, &propVal);
}

VARIANT Application::GetDisplayExcel4Menus()
{
	VARIANT result;
	GetProperty(0x39f, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetDisplayExcel4Menus(const VARIANT& propVal)
{
	SetProperty(0x39f, VT_VARIANT, &propVal);
}

VARIANT Application::GetDisplayFormulaBar()
{
	VARIANT result;
	GetProperty(0x158, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetDisplayFormulaBar(const VARIANT& propVal)
{
	SetProperty(0x158, VT_VARIANT, &propVal);
}

VARIANT Application::GetDisplayFullScreen()
{
	VARIANT result;
	GetProperty(0x425, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetDisplayFullScreen(const VARIANT& propVal)
{
	SetProperty(0x425, VT_VARIANT, &propVal);
}

VARIANT Application::GetDisplayInfoWindow()
{
	VARIANT result;
	GetProperty(0x2fd, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetDisplayInfoWindow(const VARIANT& propVal)
{
	SetProperty(0x2fd, VT_VARIANT, &propVal);
}

VARIANT Application::GetDisplayNoteIndicator()
{
	VARIANT result;
	GetProperty(0x159, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetDisplayNoteIndicator(const VARIANT& propVal)
{
	SetProperty(0x159, VT_VARIANT, &propVal);
}

VARIANT Application::GetDisplayRecentFiles()
{
	VARIANT result;
	GetProperty(0x39e, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetDisplayRecentFiles(const VARIANT& propVal)
{
	SetProperty(0x39e, VT_VARIANT, &propVal);
}

VARIANT Application::GetDisplayScrollBars()
{
	VARIANT result;
	GetProperty(0x15a, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetDisplayScrollBars(const VARIANT& propVal)
{
	SetProperty(0x15a, VT_VARIANT, &propVal);
}

VARIANT Application::GetDisplayStatusBar()
{
	VARIANT result;
	GetProperty(0x15b, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetDisplayStatusBar(const VARIANT& propVal)
{
	SetProperty(0x15b, VT_VARIANT, &propVal);
}

VARIANT Application::GetEditDirectlyInCell()
{
	VARIANT result;
	GetProperty(0x3a1, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetEditDirectlyInCell(const VARIANT& propVal)
{
	SetProperty(0x3a1, VT_VARIANT, &propVal);
}

VARIANT Application::GetEnableCancelKey()
{
	VARIANT result;
	GetProperty(0x448, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetEnableCancelKey(const VARIANT& propVal)
{
	SetProperty(0x448, VT_VARIANT, &propVal);
}

VARIANT Application::GetEnableTipWizard()
{
	VARIANT result;
	GetProperty(0x428, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetEnableTipWizard(const VARIANT& propVal)
{
	SetProperty(0x428, VT_VARIANT, &propVal);
}

VARIANT Application::GetFileConverters()
{
	VARIANT result;
	GetProperty(0x3a3, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetFileConverters(const VARIANT& propVal)
{
	SetProperty(0x3a3, VT_VARIANT, &propVal);
}

VARIANT Application::GetFixedDecimal()
{
	VARIANT result;
	GetProperty(0x15f, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetFixedDecimal(const VARIANT& propVal)
{
	SetProperty(0x15f, VT_VARIANT, &propVal);
}

VARIANT Application::GetFixedDecimalPlaces()
{
	VARIANT result;
	GetProperty(0x160, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetFixedDecimalPlaces(const VARIANT& propVal)
{
	SetProperty(0x160, VT_VARIANT, &propVal);
}

VARIANT Application::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Application::GetIgnoreRemoteRequests()
{
	VARIANT result;
	GetProperty(0x164, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetIgnoreRemoteRequests(const VARIANT& propVal)
{
	SetProperty(0x164, VT_VARIANT, &propVal);
}

VARIANT Application::GetInteractive()
{
	VARIANT result;
	GetProperty(0x169, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetInteractive(const VARIANT& propVal)
{
	SetProperty(0x169, VT_VARIANT, &propVal);
}

VARIANT Application::GetInternational()
{
	VARIANT result;
	GetProperty(0x16a, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetInternational(const VARIANT& propVal)
{
	SetProperty(0x16a, VT_VARIANT, &propVal);
}

VARIANT Application::GetIteration()
{
	VARIANT result;
	GetProperty(0x16b, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetIteration(const VARIANT& propVal)
{
	SetProperty(0x16b, VT_VARIANT, &propVal);
}

VARIANT Application::GetLargeButtons()
{
	VARIANT result;
	GetProperty(0x16c, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetLargeButtons(const VARIANT& propVal)
{
	SetProperty(0x16c, VT_VARIANT, &propVal);
}

VARIANT Application::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Application::GetLibraryPath()
{
	VARIANT result;
	GetProperty(0x16e, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetLibraryPath(const VARIANT& propVal)
{
	SetProperty(0x16e, VT_VARIANT, &propVal);
}

VARIANT Application::GetMailSession()
{
	VARIANT result;
	GetProperty(0x3ae, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetMailSession(const VARIANT& propVal)
{
	SetProperty(0x3ae, VT_VARIANT, &propVal);
}

VARIANT Application::GetMailSystem()
{
	VARIANT result;
	GetProperty(0x3cb, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetMailSystem(const VARIANT& propVal)
{
	SetProperty(0x3cb, VT_VARIANT, &propVal);
}

VARIANT Application::GetMathCoprocessorAvailable()
{
	VARIANT result;
	GetProperty(0x16f, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetMathCoprocessorAvailable(const VARIANT& propVal)
{
	SetProperty(0x16f, VT_VARIANT, &propVal);
}

VARIANT Application::GetMaxChange()
{
	VARIANT result;
	GetProperty(0x170, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetMaxChange(const VARIANT& propVal)
{
	SetProperty(0x170, VT_VARIANT, &propVal);
}

VARIANT Application::GetMaxIterations()
{
	VARIANT result;
	GetProperty(0x171, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetMaxIterations(const VARIANT& propVal)
{
	SetProperty(0x171, VT_VARIANT, &propVal);
}

VARIANT Application::GetMemoryFree()
{
	VARIANT result;
	GetProperty(0x172, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetMemoryFree(const VARIANT& propVal)
{
	SetProperty(0x172, VT_VARIANT, &propVal);
}

VARIANT Application::GetMemoryTotal()
{
	VARIANT result;
	GetProperty(0x173, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetMemoryTotal(const VARIANT& propVal)
{
	SetProperty(0x173, VT_VARIANT, &propVal);
}

VARIANT Application::GetMemoryUsed()
{
	VARIANT result;
	GetProperty(0x174, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetMemoryUsed(const VARIANT& propVal)
{
	SetProperty(0x174, VT_VARIANT, &propVal);
}

VARIANT Application::GetMouseAvailable()
{
	VARIANT result;
	GetProperty(0x175, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetMouseAvailable(const VARIANT& propVal)
{
	SetProperty(0x175, VT_VARIANT, &propVal);
}

VARIANT Application::GetMoveAfterReturn()
{
	VARIANT result;
	GetProperty(0x176, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetMoveAfterReturn(const VARIANT& propVal)
{
	SetProperty(0x176, VT_VARIANT, &propVal);
}

VARIANT Application::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Application::GetOnCalculate()
{
	VARIANT result;
	GetProperty(0x271, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetOnCalculate(const VARIANT& propVal)
{
	SetProperty(0x271, VT_VARIANT, &propVal);
}

VARIANT Application::GetOnData()
{
	VARIANT result;
	GetProperty(0x275, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetOnData(const VARIANT& propVal)
{
	SetProperty(0x275, VT_VARIANT, &propVal);
}

VARIANT Application::GetOnDoubleClick()
{
	VARIANT result;
	GetProperty(0x274, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetOnDoubleClick(const VARIANT& propVal)
{
	SetProperty(0x274, VT_VARIANT, &propVal);
}

VARIANT Application::GetOnEntry()
{
	VARIANT result;
	GetProperty(0x273, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetOnEntry(const VARIANT& propVal)
{
	SetProperty(0x273, VT_VARIANT, &propVal);
}

VARIANT Application::GetOnSheetActivate()
{
	VARIANT result;
	GetProperty(0x407, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetOnSheetActivate(const VARIANT& propVal)
{
	SetProperty(0x407, VT_VARIANT, &propVal);
}

VARIANT Application::GetOnSheetDeactivate()
{
	VARIANT result;
	GetProperty(0x439, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetOnSheetDeactivate(const VARIANT& propVal)
{
	SetProperty(0x439, VT_VARIANT, &propVal);
}

VARIANT Application::GetOnWindow()
{
	VARIANT result;
	GetProperty(0x26f, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetOnWindow(const VARIANT& propVal)
{
	SetProperty(0x26f, VT_VARIANT, &propVal);
}

VARIANT Application::GetOperatingSystem()
{
	VARIANT result;
	GetProperty(0x177, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetOperatingSystem(const VARIANT& propVal)
{
	SetProperty(0x177, VT_VARIANT, &propVal);
}

VARIANT Application::GetOrganizationName()
{
	VARIANT result;
	GetProperty(0x178, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetOrganizationName(const VARIANT& propVal)
{
	SetProperty(0x178, VT_VARIANT, &propVal);
}

VARIANT Application::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Application::GetPath()
{
	VARIANT result;
	GetProperty(0x123, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetPath(const VARIANT& propVal)
{
	SetProperty(0x123, VT_VARIANT, &propVal);
}

VARIANT Application::GetPathSeparator()
{
	VARIANT result;
	GetProperty(0x179, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetPathSeparator(const VARIANT& propVal)
{
	SetProperty(0x179, VT_VARIANT, &propVal);
}

VARIANT Application::GetPreviousSelections()
{
	VARIANT result;
	GetProperty(0x17a, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetPreviousSelections(const VARIANT& propVal)
{
	SetProperty(0x17a, VT_VARIANT, &propVal);
}

VARIANT Application::GetPromptForSummaryInfo()
{
	VARIANT result;
	GetProperty(0x426, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetPromptForSummaryInfo(const VARIANT& propVal)
{
	SetProperty(0x426, VT_VARIANT, &propVal);
}

VARIANT Application::GetRecordRelative()
{
	VARIANT result;
	GetProperty(0x17b, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetRecordRelative(const VARIANT& propVal)
{
	SetProperty(0x17b, VT_VARIANT, &propVal);
}

VARIANT Application::GetReferenceStyle()
{
	VARIANT result;
	GetProperty(0x17c, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetReferenceStyle(const VARIANT& propVal)
{
	SetProperty(0x17c, VT_VARIANT, &propVal);
}

VARIANT Application::GetRegisteredFunctions()
{
	VARIANT result;
	GetProperty(0x307, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetRegisteredFunctions(const VARIANT& propVal)
{
	SetProperty(0x307, VT_VARIANT, &propVal);
}

VARIANT Application::GetScreenUpdating()
{
	VARIANT result;
	GetProperty(0x17e, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetScreenUpdating(const VARIANT& propVal)
{
	SetProperty(0x17e, VT_VARIANT, &propVal);
}

VARIANT Application::GetSelection()
{
	VARIANT result;
	GetProperty(0x93, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetSelection(const VARIANT& propVal)
{
	SetProperty(0x93, VT_VARIANT, &propVal);
}

VARIANT Application::GetSheetsInNewWorkbook()
{
	VARIANT result;
	GetProperty(0x3e1, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetSheetsInNewWorkbook(const VARIANT& propVal)
{
	SetProperty(0x3e1, VT_VARIANT, &propVal);
}

VARIANT Application::GetShowToolTips()
{
	VARIANT result;
	GetProperty(0x183, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetShowToolTips(const VARIANT& propVal)
{
	SetProperty(0x183, VT_VARIANT, &propVal);
}

VARIANT Application::GetStandardFont()
{
	VARIANT result;
	GetProperty(0x39c, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetStandardFont(const VARIANT& propVal)
{
	SetProperty(0x39c, VT_VARIANT, &propVal);
}

VARIANT Application::GetStandardFontSize()
{
	VARIANT result;
	GetProperty(0x39d, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetStandardFontSize(const VARIANT& propVal)
{
	SetProperty(0x39d, VT_VARIANT, &propVal);
}

VARIANT Application::GetStartupPath()
{
	VARIANT result;
	GetProperty(0x181, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetStartupPath(const VARIANT& propVal)
{
	SetProperty(0x181, VT_VARIANT, &propVal);
}

VARIANT Application::GetStatusBar()
{
	VARIANT result;
	GetProperty(0x182, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetStatusBar(const VARIANT& propVal)
{
	SetProperty(0x182, VT_VARIANT, &propVal);
}

VARIANT Application::GetThisWorkbook()
{
	VARIANT result;
	GetProperty(0x30a, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetThisWorkbook(const VARIANT& propVal)
{
	SetProperty(0x30a, VT_VARIANT, &propVal);
}

VARIANT Application::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Application::GetTransitionMenuKey()
{
	VARIANT result;
	GetProperty(0x136, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetTransitionMenuKey(const VARIANT& propVal)
{
	SetProperty(0x136, VT_VARIANT, &propVal);
}

VARIANT Application::GetTransitionMenuKeyAction()
{
	VARIANT result;
	GetProperty(0x137, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetTransitionMenuKeyAction(const VARIANT& propVal)
{
	SetProperty(0x137, VT_VARIANT, &propVal);
}

VARIANT Application::GetTransitionNavigKeys()
{
	VARIANT result;
	GetProperty(0x138, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetTransitionNavigKeys(const VARIANT& propVal)
{
	SetProperty(0x138, VT_VARIANT, &propVal);
}

VARIANT Application::GetUsableHeight()
{
	VARIANT result;
	GetProperty(0x185, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetUsableHeight(const VARIANT& propVal)
{
	SetProperty(0x185, VT_VARIANT, &propVal);
}

VARIANT Application::GetUsableWidth()
{
	VARIANT result;
	GetProperty(0x186, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetUsableWidth(const VARIANT& propVal)
{
	SetProperty(0x186, VT_VARIANT, &propVal);
}

VARIANT Application::GetUserName()
{
	VARIANT result;
	GetProperty(0x187, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetUserName(const VARIANT& propVal)
{
	SetProperty(0x187, VT_VARIANT, &propVal);
}

VARIANT Application::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT Application::GetVersion()
{
	VARIANT result;
	GetProperty(0x188, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetVersion(const VARIANT& propVal)
{
	SetProperty(0x188, VT_VARIANT, &propVal);
}

VARIANT Application::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Application::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Application::GetWindowsForPens()
{
	VARIANT result;
	GetProperty(0x18b, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetWindowsForPens(const VARIANT& propVal)
{
	SetProperty(0x18b, VT_VARIANT, &propVal);
}

VARIANT Application::GetWindowState()
{
	VARIANT result;
	GetProperty(0x18c, VT_VARIANT, (void*)&result);
	return result;
}

void Application::SetWindowState(const VARIANT& propVal)
{
	SetProperty(0x18c, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Application operations

VARIANT Application::_WSFunction(const VARIANT& Range, const VARIANT& Arg1, const VARIANT& Arg2, const VARIANT& Arg3, const VARIANT& Arg4, const VARIANT& Arg5, const VARIANT& Arg6, const VARIANT& Arg7, const VARIANT& Arg8, const VARIANT& Arg9, 
		const VARIANT& Arg10, const VARIANT& Arg11, const VARIANT& Arg12, const VARIANT& Arg13, const VARIANT& Arg14, const VARIANT& Arg15, const VARIANT& Arg16, const VARIANT& Arg17, const VARIANT& Arg18, const VARIANT& Arg19, 
		const VARIANT& Arg20, const VARIANT& Arg21, const VARIANT& Arg22, const VARIANT& Arg23, const VARIANT& Arg24, const VARIANT& Arg25, const VARIANT& Arg26, const VARIANT& Arg27, const VARIANT& Arg28, const VARIANT& Arg29, 
		const VARIANT& Arg30)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT 
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xa9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Range, &Arg1, &Arg2, &Arg3, &Arg4, &Arg5, &Arg6, &Arg7, &Arg8, &Arg9, &Arg10, &Arg11, &Arg12, &Arg13, &Arg14, &Arg15, &Arg16, &Arg17, &Arg18, &Arg19, &Arg20, &Arg21, &Arg22, &Arg23, &Arg24, &Arg25, &Arg26, &Arg27, &Arg28, &Arg29, &Arg30);
	return result;
}

VARIANT Application::Acos()
{
	VARIANT result;
	InvokeHelper(0x4063, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Acosh()
{
	VARIANT result;
	InvokeHelper(0x40e9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::ActivateMicrosoftApp(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x447, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::AddChartAutoFormat(const VARIANT& Chart, const VARIANT& Name, const VARIANT& Description)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd8, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Chart, &Name, &Description);
	return result;
}

VARIANT Application::AddCustomList(const VARIANT& ListArray, const VARIANT& ByRow)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x30c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&ListArray, &ByRow);
	return result;
}

VARIANT Application::AddIns(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x225, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::And()
{
	VARIANT result;
	InvokeHelper(0x4024, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Application_()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Asin()
{
	VARIANT result;
	InvokeHelper(0x4062, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Asinh()
{
	VARIANT result;
	InvokeHelper(0x40e8, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Atan2()
{
	VARIANT result;
	InvokeHelper(0x4061, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Atanh()
{
	VARIANT result;
	InvokeHelper(0x40ea, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::AveDev()
{
	VARIANT result;
	InvokeHelper(0x410d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Average()
{
	VARIANT result;
	InvokeHelper(0x4005, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::BetaDist()
{
	VARIANT result;
	InvokeHelper(0x410e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::BetaInv()
{
	VARIANT result;
	InvokeHelper(0x4110, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::BinomDist()
{
	VARIANT result;
	InvokeHelper(0x4111, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Calculate()
{
	VARIANT result;
	InvokeHelper(0x117, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Ceiling()
{
	VARIANT result;
	InvokeHelper(0x4120, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Cells(const VARIANT& RowIndex, const VARIANT& ColumnIndex)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xee, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&RowIndex, &ColumnIndex);
	return result;
}

VARIANT Application::CentimetersToPoints(const VARIANT& Centimeters)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x43e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Centimeters);
	return result;
}

VARIANT Application::Charts(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x79, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::CheckSpelling(const VARIANT& Word, const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Word, &CustomDictionary, &IgnoreUppercase);
	return result;
}

VARIANT Application::ChiDist()
{
	VARIANT result;
	InvokeHelper(0x4112, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::ChiInv()
{
	VARIANT result;
	InvokeHelper(0x4113, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::ChiTest()
{
	VARIANT result;
	InvokeHelper(0x4132, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Choose()
{
	VARIANT result;
	InvokeHelper(0x4064, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Clean()
{
	VARIANT result;
	InvokeHelper(0x40a2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Columns(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xf1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::Combin()
{
	VARIANT result;
	InvokeHelper(0x4114, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Confidence()
{
	VARIANT result;
	InvokeHelper(0x4115, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::ConvertFormula(const VARIANT& Formula, const VARIANT& FromReferenceStyle, const VARIANT& ToReferenceStyle, const VARIANT& ToAbsolute, const VARIANT& RelativeTo)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x145, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Formula, &FromReferenceStyle, &ToReferenceStyle, &ToAbsolute, &RelativeTo);
	return result;
}

VARIANT Application::Correl()
{
	VARIANT result;
	InvokeHelper(0x4133, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Cosh()
{
	VARIANT result;
	InvokeHelper(0x40e6, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Count()
{
	VARIANT result;
	InvokeHelper(0x4000, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::CountA()
{
	VARIANT result;
	InvokeHelper(0x40a9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::CountBlank()
{
	VARIANT result;
	InvokeHelper(0x415b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::CountIf()
{
	VARIANT result;
	InvokeHelper(0x415a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Covar()
{
	VARIANT result;
	InvokeHelper(0x4134, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::CritBinom()
{
	VARIANT result;
	InvokeHelper(0x4116, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::DAverage()
{
	VARIANT result;
	InvokeHelper(0x402a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Days360()
{
	VARIANT result;
	InvokeHelper(0x40dc, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Db()
{
	VARIANT result;
	InvokeHelper(0x40f7, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::DCount()
{
	VARIANT result;
	InvokeHelper(0x4028, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::DCountA()
{
	VARIANT result;
	InvokeHelper(0x40c7, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Ddb()
{
	VARIANT result;
	InvokeHelper(0x4090, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::DDEExecute(const VARIANT& Channel, const VARIANT& String)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x14d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Channel, &String);
	return result;
}

VARIANT Application::DDEInitiate(const VARIANT& App, const VARIANT& Topic)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x14e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&App, &Topic);
	return result;
}

VARIANT Application::DDEPoke(const VARIANT& Channel, const VARIANT& Item, const VARIANT& Data)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x14f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Channel, &Item, &Data);
	return result;
}

VARIANT Application::DDERequest(const VARIANT& Channel, const VARIANT& Item)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x150, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Channel, &Item);
	return result;
}

VARIANT Application::DDETerminate(const VARIANT& Channel)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x151, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Channel);
	return result;
}

VARIANT Application::Degrees()
{
	VARIANT result;
	InvokeHelper(0x4157, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::DeleteChartAutoFormat(const VARIANT& Name)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xd9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name);
	return result;
}

VARIANT Application::DeleteCustomList(const VARIANT& ListNum)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x30f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&ListNum);
	return result;
}

VARIANT Application::DevSq()
{
	VARIANT result;
	InvokeHelper(0x413e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::DGet()
{
	VARIANT result;
	InvokeHelper(0x40eb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Dialogs(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x2f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::DialogSheets(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x2fc, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::DMax()
{
	VARIANT result;
	InvokeHelper(0x402c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::DMin()
{
	VARIANT result;
	InvokeHelper(0x402b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Dollar()
{
	VARIANT result;
	InvokeHelper(0x400d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::DoubleClick()
{
	VARIANT result;
	InvokeHelper(0x15d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::DProduct()
{
	VARIANT result;
	InvokeHelper(0x40bd, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::DStDev()
{
	VARIANT result;
	InvokeHelper(0x402d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::DStDevP()
{
	VARIANT result;
	InvokeHelper(0x40c3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::DSum()
{
	VARIANT result;
	InvokeHelper(0x4029, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::DVar()
{
	VARIANT result;
	InvokeHelper(0x402f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::DVarP()
{
	VARIANT result;
	InvokeHelper(0x40c4, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::_Evaluate(const VARIANT& Name)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name);
	return result;
}

VARIANT Application::Evaluate(const VARIANT& Name)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xfffffffb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name);
	return result;
}

VARIANT Application::Even()
{
	VARIANT result;
	InvokeHelper(0x4117, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Excel4IntlMacroSheets(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x245, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::Excel4MacroSheets(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x243, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::ExecuteExcel4Macro(const VARIANT& String)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x15e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&String);
	return result;
}

VARIANT Application::ExponDist()
{
	VARIANT result;
	InvokeHelper(0x4118, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Fact()
{
	VARIANT result;
	InvokeHelper(0x40b8, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::FDist()
{
	VARIANT result;
	InvokeHelper(0x4119, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Find()
{
	VARIANT result;
	InvokeHelper(0x407c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::FindB()
{
	VARIANT result;
	InvokeHelper(0x40cd, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::FindFile()
{
	VARIANT result;
	InvokeHelper(0x42c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::FInv()
{
	VARIANT result;
	InvokeHelper(0x411a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Fisher()
{
	VARIANT result;
	InvokeHelper(0x411b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::FisherInv()
{
	VARIANT result;
	InvokeHelper(0x411c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Fixed()
{
	VARIANT result;
	InvokeHelper(0x400e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Floor()
{
	VARIANT result;
	InvokeHelper(0x411d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Forecast()
{
	VARIANT result;
	InvokeHelper(0x4135, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Frequency()
{
	VARIANT result;
	InvokeHelper(0x40fc, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::FTest()
{
	VARIANT result;
	InvokeHelper(0x4136, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Fv()
{
	VARIANT result;
	InvokeHelper(0x4039, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::GammaDist()
{
	VARIANT result;
	InvokeHelper(0x411e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::GammaInv()
{
	VARIANT result;
	InvokeHelper(0x411f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::GammaLn()
{
	VARIANT result;
	InvokeHelper(0x410f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::GeoMean()
{
	VARIANT result;
	InvokeHelper(0x413f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::GetCustomListContents(const VARIANT& ListNum)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x312, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&ListNum);
	return result;
}

VARIANT Application::GetCustomListNum(const VARIANT& ListArray)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x311, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&ListArray);
	return result;
}

VARIANT Application::GetOpenFilename(const VARIANT& FileFilter, const VARIANT& FilterIndex, const VARIANT& Title, const VARIANT& ButtonText)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x433, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&FileFilter, &FilterIndex, &Title, &ButtonText);
	return result;
}

VARIANT Application::GetSaveAsFilename(const VARIANT& InitialFilename, const VARIANT& FileFilter, const VARIANT& FilterIndex, const VARIANT& Title, const VARIANT& ButtonText)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x434, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&InitialFilename, &FileFilter, &FilterIndex, &Title, &ButtonText);
	return result;
}

VARIANT Application::Goto(const VARIANT& Reference, const VARIANT& Scroll)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1db, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Reference, &Scroll);
	return result;
}

VARIANT Application::Growth()
{
	VARIANT result;
	InvokeHelper(0x4034, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::HarMean()
{
	VARIANT result;
	InvokeHelper(0x4140, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Help(const VARIANT& HelpFile, const VARIANT& HelpContextID)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x162, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&HelpFile, &HelpContextID);
	return result;
}

VARIANT Application::HLookup()
{
	VARIANT result;
	InvokeHelper(0x4065, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::HypGeomDist()
{
	VARIANT result;
	InvokeHelper(0x4121, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::InchesToPoints(const VARIANT& Inches)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x43f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Inches);
	return result;
}

VARIANT Application::Index()
{
	VARIANT result;
	InvokeHelper(0x401d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::InputBox(const VARIANT& Prompt, const VARIANT& Title, const VARIANT& Default, const VARIANT& Left, const VARIANT& Top, const VARIANT& HelpFile, const VARIANT& HelpContextID, const VARIANT& Type)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x165, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Prompt, &Title, &Default, &Left, &Top, &HelpFile, &HelpContextID, &Type);
	return result;
}

VARIANT Application::Intercept()
{
	VARIANT result;
	InvokeHelper(0x4137, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Intersect(const VARIANT& Arg1, const VARIANT& Arg2, const VARIANT& Arg3, const VARIANT& Arg4, const VARIANT& Arg5, const VARIANT& Arg6, const VARIANT& Arg7, const VARIANT& Arg8, const VARIANT& Arg9, const VARIANT& Arg10, 
		const VARIANT& Arg11, const VARIANT& Arg12, const VARIANT& Arg13, const VARIANT& Arg14, const VARIANT& Arg15, const VARIANT& Arg16, const VARIANT& Arg17, const VARIANT& Arg18, const VARIANT& Arg19, const VARIANT& Arg20, 
		const VARIANT& Arg21, const VARIANT& Arg22, const VARIANT& Arg23, const VARIANT& Arg24, const VARIANT& Arg25, const VARIANT& Arg26, const VARIANT& Arg27, const VARIANT& Arg28, const VARIANT& Arg29, const VARIANT& Arg30, 
		const VARIANT& Arg31)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT 
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x2fe, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Arg1, &Arg2, &Arg3, &Arg4, &Arg5, &Arg6, &Arg7, &Arg8, &Arg9, &Arg10, &Arg11, &Arg12, &Arg13, &Arg14, &Arg15, &Arg16, &Arg17, &Arg18, &Arg19, &Arg20, &Arg21, &Arg22, &Arg23, &Arg24, &Arg25, &Arg26, &Arg27, &Arg28, &Arg29, &Arg30, &Arg31);
	return result;
}

VARIANT Application::Ipmt()
{
	VARIANT result;
	InvokeHelper(0x40a7, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Irr()
{
	VARIANT result;
	InvokeHelper(0x403e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::IsErr()
{
	VARIANT result;
	InvokeHelper(0x407e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::IsError()
{
	VARIANT result;
	InvokeHelper(0x4003, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::IsLogical()
{
	VARIANT result;
	InvokeHelper(0x40c6, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::IsNA()
{
	VARIANT result;
	InvokeHelper(0x4002, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::IsNonText()
{
	VARIANT result;
	InvokeHelper(0x40be, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::IsNumber()
{
	VARIANT result;
	InvokeHelper(0x4080, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Ispmt()
{
	VARIANT result;
	InvokeHelper(0x415e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::IsText()
{
	VARIANT result;
	InvokeHelper(0x407f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Kurt()
{
	VARIANT result;
	InvokeHelper(0x4142, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Large()
{
	VARIANT result;
	InvokeHelper(0x4145, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::LinEst()
{
	VARIANT result;
	InvokeHelper(0x4031, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Ln()
{
	VARIANT result;
	InvokeHelper(0x4016, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Log()
{
	VARIANT result;
	InvokeHelper(0x406d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Log10()
{
	VARIANT result;
	InvokeHelper(0x4017, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::LogEst()
{
	VARIANT result;
	InvokeHelper(0x4033, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::LogInv()
{
	VARIANT result;
	InvokeHelper(0x4123, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::LogNormDist()
{
	VARIANT result;
	InvokeHelper(0x4122, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Lookup()
{
	VARIANT result;
	InvokeHelper(0x401c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::MacroOptions(const VARIANT& Macro, const VARIANT& Description, const VARIANT& HasMenu, const VARIANT& MenuText, const VARIANT& HasShortcutKey, const VARIANT& ShortcutKey, const VARIANT& Category, const VARIANT& StatusBar, 
		const VARIANT& HelpContextID, const VARIANT& HelpFile)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x46f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Macro, &Description, &HasMenu, &MenuText, &HasShortcutKey, &ShortcutKey, &Category, &StatusBar, &HelpContextID, &HelpFile);
	return result;
}

VARIANT Application::MailLogoff()
{
	VARIANT result;
	InvokeHelper(0x3b1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::MailLogon(const VARIANT& Name, const VARIANT& Password, const VARIANT& DownloadNewMail)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x3af, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name, &Password, &DownloadNewMail);
	return result;
}

VARIANT Application::Match()
{
	VARIANT result;
	InvokeHelper(0x4040, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Max()
{
	VARIANT result;
	InvokeHelper(0x4007, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::MDeterm()
{
	VARIANT result;
	InvokeHelper(0x40a3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Median()
{
	VARIANT result;
	InvokeHelper(0x40e3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::MenuBars(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x24d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::Min()
{
	VARIANT result;
	InvokeHelper(0x4006, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::MInverse()
{
	VARIANT result;
	InvokeHelper(0x40a4, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::MIrr()
{
	VARIANT result;
	InvokeHelper(0x403d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::MMult()
{
	VARIANT result;
	InvokeHelper(0x40a5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Mode()
{
	VARIANT result;
	InvokeHelper(0x414a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Modules(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x246, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::Names(const VARIANT& Index, const VARIANT& IndexLocal, const VARIANT& RefersTo)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1ba, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index, &IndexLocal, &RefersTo);
	return result;
}

VARIANT Application::NegBinomDist()
{
	VARIANT result;
	InvokeHelper(0x4124, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::NextLetter()
{
	VARIANT result;
	InvokeHelper(0x3cc, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::NormDist()
{
	VARIANT result;
	InvokeHelper(0x4125, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::NormInv()
{
	VARIANT result;
	InvokeHelper(0x4127, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::NormSDist()
{
	VARIANT result;
	InvokeHelper(0x4126, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::NormSInv()
{
	VARIANT result;
	InvokeHelper(0x4128, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::NPer()
{
	VARIANT result;
	InvokeHelper(0x403a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Npv()
{
	VARIANT result;
	InvokeHelper(0x400b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Odd()
{
	VARIANT result;
	InvokeHelper(0x412a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::OnKey(const VARIANT& Key, const VARIANT& Procedure)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x272, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Key, &Procedure);
	return result;
}

VARIANT Application::OnRepeat(const VARIANT& Text, const VARIANT& Procedure)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x301, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Text, &Procedure);
	return result;
}

VARIANT Application::OnTime(const VARIANT& EarliestTime, const VARIANT& Procedure, const VARIANT& LatestTime, const VARIANT& Schedule)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x270, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&EarliestTime, &Procedure, &LatestTime, &Schedule);
	return result;
}

VARIANT Application::OnUndo(const VARIANT& Text, const VARIANT& Procedure)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x302, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Text, &Procedure);
	return result;
}

VARIANT Application::Or()
{
	VARIANT result;
	InvokeHelper(0x4025, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Pearson()
{
	VARIANT result;
	InvokeHelper(0x4138, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Percentile()
{
	VARIANT result;
	InvokeHelper(0x4148, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::PercentRank()
{
	VARIANT result;
	InvokeHelper(0x4149, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Permut()
{
	VARIANT result;
	InvokeHelper(0x412b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Pi()
{
	VARIANT result;
	InvokeHelper(0x4013, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Pmt()
{
	VARIANT result;
	InvokeHelper(0x403b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Poisson()
{
	VARIANT result;
	InvokeHelper(0x412c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Power()
{
	VARIANT result;
	InvokeHelper(0x4151, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Ppmt()
{
	VARIANT result;
	InvokeHelper(0x40a8, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Prob()
{
	VARIANT result;
	InvokeHelper(0x413d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Product()
{
	VARIANT result;
	InvokeHelper(0x40b7, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Proper()
{
	VARIANT result;
	InvokeHelper(0x4072, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Pv()
{
	VARIANT result;
	InvokeHelper(0x4038, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Quartile()
{
	VARIANT result;
	InvokeHelper(0x4147, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Quit()
{
	VARIANT result;
	InvokeHelper(0x12e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Radians()
{
	VARIANT result;
	InvokeHelper(0x4156, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Range(const VARIANT& Cell1, const VARIANT& Cell2)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xc5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Cell1, &Cell2);
	return result;
}

VARIANT Application::Rank()
{
	VARIANT result;
	InvokeHelper(0x40d8, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Rate()
{
	VARIANT result;
	InvokeHelper(0x403c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::RecordMacro(const VARIANT& BasicCode, const VARIANT& XlmCode)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x305, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&BasicCode, &XlmCode);
	return result;
}

VARIANT Application::RegisterXLL(const VARIANT& Filename)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Filename);
	return result;
}

VARIANT Application::Repeat()
{
	VARIANT result;
	InvokeHelper(0x12d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Replace()
{
	VARIANT result;
	InvokeHelper(0x4077, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::ReplaceB()
{
	VARIANT result;
	InvokeHelper(0x40cf, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Rept()
{
	VARIANT result;
	InvokeHelper(0x401e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::ResetTipWizard()
{
	VARIANT result;
	InvokeHelper(0x3a0, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Roman()
{
	VARIANT result;
	InvokeHelper(0x4162, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Round()
{
	VARIANT result;
	InvokeHelper(0x401b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::RoundDown()
{
	VARIANT result;
	InvokeHelper(0x40d5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::RoundUp()
{
	VARIANT result;
	InvokeHelper(0x40d4, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Rows(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x102, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::RSq()
{
	VARIANT result;
	InvokeHelper(0x4139, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Run(const VARIANT& Macro, const VARIANT& Arg1, const VARIANT& Arg2, const VARIANT& Arg3, const VARIANT& Arg4, const VARIANT& Arg5, const VARIANT& Arg6, const VARIANT& Arg7, const VARIANT& Arg8, const VARIANT& Arg9, 
		const VARIANT& Arg10, const VARIANT& Arg11, const VARIANT& Arg12, const VARIANT& Arg13, const VARIANT& Arg14, const VARIANT& Arg15, const VARIANT& Arg16, const VARIANT& Arg17, const VARIANT& Arg18, const VARIANT& Arg19, 
		const VARIANT& Arg20, const VARIANT& Arg21, const VARIANT& Arg22, const VARIANT& Arg23, const VARIANT& Arg24, const VARIANT& Arg25, const VARIANT& Arg26, const VARIANT& Arg27, const VARIANT& Arg28, const VARIANT& Arg29, 
		const VARIANT& Arg30)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT 
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x103, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Macro, &Arg1, &Arg2, &Arg3, &Arg4, &Arg5, &Arg6, &Arg7, &Arg8, &Arg9, &Arg10, &Arg11, &Arg12, &Arg13, &Arg14, &Arg15, &Arg16, &Arg17, &Arg18, &Arg19, &Arg20, &Arg21, &Arg22, &Arg23, &Arg24, &Arg25, &Arg26, &Arg27, &Arg28, &Arg29, &Arg30);
	return result;
}

VARIANT Application::Save(const VARIANT& Filename)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x11b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Filename);
	return result;
}

VARIANT Application::Search()
{
	VARIANT result;
	InvokeHelper(0x4052, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::SearchB()
{
	VARIANT result;
	InvokeHelper(0x40ce, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::SendKeys(const VARIANT& Keys, const VARIANT& Wait)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x17f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Keys, &Wait);
	return result;
}

VARIANT Application::SetDefaultChart(const VARIANT& FormatName)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xdb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&FormatName);
	return result;
}

VARIANT Application::Sheets(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1e5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::ShortcutMenus(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x308, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::Sinh()
{
	VARIANT result;
	InvokeHelper(0x40e5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Skew()
{
	VARIANT result;
	InvokeHelper(0x4143, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Sln()
{
	VARIANT result;
	InvokeHelper(0x408e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Slope()
{
	VARIANT result;
	InvokeHelper(0x413b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Small()
{
	VARIANT result;
	InvokeHelper(0x4146, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Standardize()
{
	VARIANT result;
	InvokeHelper(0x4129, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::StDev()
{
	VARIANT result;
	InvokeHelper(0x400c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::StDevP()
{
	VARIANT result;
	InvokeHelper(0x40c1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::StEyx()
{
	VARIANT result;
	InvokeHelper(0x413a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Substitute()
{
	VARIANT result;
	InvokeHelper(0x4078, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Subtotal()
{
	VARIANT result;
	InvokeHelper(0x4158, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Sum()
{
	VARIANT result;
	InvokeHelper(0x4004, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::SumIf()
{
	VARIANT result;
	InvokeHelper(0x4159, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::SumProduct()
{
	VARIANT result;
	InvokeHelper(0x40e4, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::SumSq()
{
	VARIANT result;
	InvokeHelper(0x4141, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::SumX2MY2()
{
	VARIANT result;
	InvokeHelper(0x4130, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::SumX2PY2()
{
	VARIANT result;
	InvokeHelper(0x4131, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::SumXMY2()
{
	VARIANT result;
	InvokeHelper(0x412f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Syd()
{
	VARIANT result;
	InvokeHelper(0x408f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Tanh()
{
	VARIANT result;
	InvokeHelper(0x40e7, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::TDist()
{
	VARIANT result;
	InvokeHelper(0x412d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Text()
{
	VARIANT result;
	InvokeHelper(0x4030, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::TInv()
{
	VARIANT result;
	InvokeHelper(0x414c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Toolbars(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x228, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::Transpose()
{
	VARIANT result;
	InvokeHelper(0x4053, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Trend()
{
	VARIANT result;
	InvokeHelper(0x4032, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Trim()
{
	VARIANT result;
	InvokeHelper(0x4076, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::TrimMean()
{
	VARIANT result;
	InvokeHelper(0x414b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::TTest()
{
	VARIANT result;
	InvokeHelper(0x413c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Undo()
{
	VARIANT result;
	InvokeHelper(0x12f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Union(const VARIANT& Arg1, const VARIANT& Arg2, const VARIANT& Arg3, const VARIANT& Arg4, const VARIANT& Arg5, const VARIANT& Arg6, const VARIANT& Arg7, const VARIANT& Arg8, const VARIANT& Arg9, const VARIANT& Arg10, 
		const VARIANT& Arg11, const VARIANT& Arg12, const VARIANT& Arg13, const VARIANT& Arg14, const VARIANT& Arg15, const VARIANT& Arg16, const VARIANT& Arg17, const VARIANT& Arg18, const VARIANT& Arg19, const VARIANT& Arg20, 
		const VARIANT& Arg21, const VARIANT& Arg22, const VARIANT& Arg23, const VARIANT& Arg24, const VARIANT& Arg25, const VARIANT& Arg26, const VARIANT& Arg27, const VARIANT& Arg28, const VARIANT& Arg29, const VARIANT& Arg30, 
		const VARIANT& Arg31)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT 
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x30b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Arg1, &Arg2, &Arg3, &Arg4, &Arg5, &Arg6, &Arg7, &Arg8, &Arg9, &Arg10, &Arg11, &Arg12, &Arg13, &Arg14, &Arg15, &Arg16, &Arg17, &Arg18, &Arg19, &Arg20, &Arg21, &Arg22, &Arg23, &Arg24, &Arg25, &Arg26, &Arg27, &Arg28, &Arg29, &Arg30, &Arg31);
	return result;
}

VARIANT Application::USDollar()
{
	VARIANT result;
	InvokeHelper(0x40cc, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Var()
{
	VARIANT result;
	InvokeHelper(0x402e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::VarP()
{
	VARIANT result;
	InvokeHelper(0x40c2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Vdb()
{
	VARIANT result;
	InvokeHelper(0x40de, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::VLookup()
{
	VARIANT result;
	InvokeHelper(0x4066, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Volatile(const VARIANT& Volatile)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x314, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Volatile);
	return result;
}

VARIANT Application::Wait(const VARIANT& Time)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x189, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Time);
	return result;
}

VARIANT Application::Weekday()
{
	VARIANT result;
	InvokeHelper(0x4046, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Weibull()
{
	VARIANT result;
	InvokeHelper(0x412e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Application::Windows(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1ae, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::Workbooks(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x23c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::Worksheets(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1ee, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Application::ZTest()
{
	VARIANT result;
	InvokeHelper(0x4144, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Style properties

VARIANT Style::GetAddIndent()
{
	VARIANT result;
	GetProperty(0x427, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetAddIndent(const VARIANT& propVal)
{
	SetProperty(0x427, VT_VARIANT, &propVal);
}

VARIANT Style::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Style::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT Style::GetFormulaHidden()
{
	VARIANT result;
	GetProperty(0x106, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetFormulaHidden(const VARIANT& propVal)
{
	SetProperty(0x106, VT_VARIANT, &propVal);
}

VARIANT Style::GetHorizontalAlignment()
{
	VARIANT result;
	GetProperty(0x88, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetHorizontalAlignment(const VARIANT& propVal)
{
	SetProperty(0x88, VT_VARIANT, &propVal);
}

VARIANT Style::GetIncludeAlignment()
{
	VARIANT result;
	GetProperty(0x19d, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetIncludeAlignment(const VARIANT& propVal)
{
	SetProperty(0x19d, VT_VARIANT, &propVal);
}

VARIANT Style::GetIncludeBorder()
{
	VARIANT result;
	GetProperty(0x19e, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetIncludeBorder(const VARIANT& propVal)
{
	SetProperty(0x19e, VT_VARIANT, &propVal);
}

VARIANT Style::GetIncludeFont()
{
	VARIANT result;
	GetProperty(0x19f, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetIncludeFont(const VARIANT& propVal)
{
	SetProperty(0x19f, VT_VARIANT, &propVal);
}

VARIANT Style::GetIncludeNumber()
{
	VARIANT result;
	GetProperty(0x1a0, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetIncludeNumber(const VARIANT& propVal)
{
	SetProperty(0x1a0, VT_VARIANT, &propVal);
}

VARIANT Style::GetIncludePatterns()
{
	VARIANT result;
	GetProperty(0x1a1, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetIncludePatterns(const VARIANT& propVal)
{
	SetProperty(0x1a1, VT_VARIANT, &propVal);
}

VARIANT Style::GetIncludeProtection()
{
	VARIANT result;
	GetProperty(0x1a2, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetIncludeProtection(const VARIANT& propVal)
{
	SetProperty(0x1a2, VT_VARIANT, &propVal);
}

VARIANT Style::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Style::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Style::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Style::GetNameLocal()
{
	VARIANT result;
	GetProperty(0x3a9, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetNameLocal(const VARIANT& propVal)
{
	SetProperty(0x3a9, VT_VARIANT, &propVal);
}

VARIANT Style::GetNumberFormat()
{
	VARIANT result;
	GetProperty(0xc1, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetNumberFormat(const VARIANT& propVal)
{
	SetProperty(0xc1, VT_VARIANT, &propVal);
}

VARIANT Style::GetNumberFormatLocal()
{
	VARIANT result;
	GetProperty(0x449, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetNumberFormatLocal(const VARIANT& propVal)
{
	SetProperty(0x449, VT_VARIANT, &propVal);
}

VARIANT Style::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT Style::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Style::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT Style::GetVerticalAlignment()
{
	VARIANT result;
	GetProperty(0x89, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetVerticalAlignment(const VARIANT& propVal)
{
	SetProperty(0x89, VT_VARIANT, &propVal);
}

VARIANT Style::GetWrapText()
{
	VARIANT result;
	GetProperty(0x114, VT_VARIANT, (void*)&result);
	return result;
}

void Style::SetWrapText(const VARIANT& propVal)
{
	SetProperty(0x114, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Style operations

VARIANT Style::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Style::Borders(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1b3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Style::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Styles properties

VARIANT Styles::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Styles::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Styles::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Styles::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Styles::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Styles::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Styles operations

VARIANT Styles::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Styles::Add(const VARIANT& Name, const VARIANT& BasedOn)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name, &BasedOn);
	return result;
}

VARIANT Styles::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Styles::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Styles::Merge(const VARIANT& Workbook)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x234, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Workbook);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Toolbar properties

VARIANT Toolbar::GetBuiltIn()
{
	VARIANT result;
	GetProperty(0x229, VT_VARIANT, (void*)&result);
	return result;
}

void Toolbar::SetBuiltIn(const VARIANT& propVal)
{
	SetProperty(0x229, VT_VARIANT, &propVal);
}

VARIANT Toolbar::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Toolbar::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Toolbar::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Toolbar::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Toolbar::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Toolbar::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Toolbar::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Toolbar::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Toolbar::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Toolbar::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Toolbar::GetPosition()
{
	VARIANT result;
	GetProperty(0x85, VT_VARIANT, (void*)&result);
	return result;
}

void Toolbar::SetPosition(const VARIANT& propVal)
{
	SetProperty(0x85, VT_VARIANT, &propVal);
}

VARIANT Toolbar::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Toolbar::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Toolbar::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Toolbar::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Toolbar::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Toolbar::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Toolbar operations

VARIANT Toolbar::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Toolbar::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Toolbar::Reset()
{
	VARIANT result;
	InvokeHelper(0x22b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Toolbar::ToolbarButtons(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x3c4, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Toolbars properties

VARIANT Toolbars::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Toolbars::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Toolbars::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Toolbars::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Toolbars::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Toolbars::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Toolbars operations

VARIANT Toolbars::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Toolbars::Add(const VARIANT& Name)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name);
	return result;
}

VARIANT Toolbars::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Toolbars::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// ToolbarButton properties

VARIANT ToolbarButton::GetBuiltIn()
{
	VARIANT result;
	GetProperty(0x229, VT_VARIANT, (void*)&result);
	return result;
}

void ToolbarButton::SetBuiltIn(const VARIANT& propVal)
{
	SetProperty(0x229, VT_VARIANT, &propVal);
}

VARIANT ToolbarButton::GetBuiltInFace()
{
	VARIANT result;
	GetProperty(0x22a, VT_VARIANT, (void*)&result);
	return result;
}

void ToolbarButton::SetBuiltInFace(const VARIANT& propVal)
{
	SetProperty(0x22a, VT_VARIANT, &propVal);
}

VARIANT ToolbarButton::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void ToolbarButton::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT ToolbarButton::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void ToolbarButton::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT ToolbarButton::GetId()
{
	VARIANT result;
	GetProperty(0x23a, VT_VARIANT, (void*)&result);
	return result;
}

void ToolbarButton::SetId(const VARIANT& propVal)
{
	SetProperty(0x23a, VT_VARIANT, &propVal);
}

VARIANT ToolbarButton::GetIsGap()
{
	VARIANT result;
	GetProperty(0x231, VT_VARIANT, (void*)&result);
	return result;
}

void ToolbarButton::SetIsGap(const VARIANT& propVal)
{
	SetProperty(0x231, VT_VARIANT, &propVal);
}

VARIANT ToolbarButton::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void ToolbarButton::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT ToolbarButton::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void ToolbarButton::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT ToolbarButton::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void ToolbarButton::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT ToolbarButton::GetPushed()
{
	VARIANT result;
	GetProperty(0x230, VT_VARIANT, (void*)&result);
	return result;
}

void ToolbarButton::SetPushed(const VARIANT& propVal)
{
	SetProperty(0x230, VT_VARIANT, &propVal);
}

VARIANT ToolbarButton::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void ToolbarButton::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// ToolbarButton operations

VARIANT ToolbarButton::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ToolbarButton::Copy(const VARIANT& Toolbar, const VARIANT& Before)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Toolbar, &Before);
	return result;
}

VARIANT ToolbarButton::CopyFace()
{
	VARIANT result;
	InvokeHelper(0x3c6, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ToolbarButton::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ToolbarButton::Edit()
{
	VARIANT result;
	InvokeHelper(0x232, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ToolbarButton::Move(const VARIANT& Toolbar, const VARIANT& Before)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x27d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Toolbar, &Before);
	return result;
}

VARIANT ToolbarButton::PasteFace()
{
	VARIANT result;
	InvokeHelper(0x3c7, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ToolbarButton::Reset()
{
	VARIANT result;
	InvokeHelper(0x22b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// ToolbarButtons properties

VARIANT ToolbarButtons::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void ToolbarButtons::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT ToolbarButtons::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void ToolbarButtons::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT ToolbarButtons::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void ToolbarButtons::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// ToolbarButtons operations

VARIANT ToolbarButtons::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ToolbarButtons::Add(const VARIANT& Button, const VARIANT& Before, const VARIANT& OnAction, const VARIANT& Pushed, const VARIANT& Enabled)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Button, &Before, &OnAction, &Pushed, &Enabled);
	return result;
}

VARIANT ToolbarButtons::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ToolbarButtons::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// AddIn properties

VARIANT AddIn::GetAuthor()
{
	VARIANT result;
	GetProperty(0x23e, VT_VARIANT, (void*)&result);
	return result;
}

void AddIn::SetAuthor(const VARIANT& propVal)
{
	SetProperty(0x23e, VT_VARIANT, &propVal);
}

VARIANT AddIn::GetComments()
{
	VARIANT result;
	GetProperty(0x23f, VT_VARIANT, (void*)&result);
	return result;
}

void AddIn::SetComments(const VARIANT& propVal)
{
	SetProperty(0x23f, VT_VARIANT, &propVal);
}

VARIANT AddIn::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void AddIn::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT AddIn::GetFullName()
{
	VARIANT result;
	GetProperty(0x121, VT_VARIANT, (void*)&result);
	return result;
}

void AddIn::SetFullName(const VARIANT& propVal)
{
	SetProperty(0x121, VT_VARIANT, &propVal);
}

VARIANT AddIn::GetInstalled()
{
	VARIANT result;
	GetProperty(0x226, VT_VARIANT, (void*)&result);
	return result;
}

void AddIn::SetInstalled(const VARIANT& propVal)
{
	SetProperty(0x226, VT_VARIANT, &propVal);
}

VARIANT AddIn::GetKeywords()
{
	VARIANT result;
	GetProperty(0x241, VT_VARIANT, (void*)&result);
	return result;
}

void AddIn::SetKeywords(const VARIANT& propVal)
{
	SetProperty(0x241, VT_VARIANT, &propVal);
}

VARIANT AddIn::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void AddIn::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT AddIn::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void AddIn::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT AddIn::GetPath()
{
	VARIANT result;
	GetProperty(0x123, VT_VARIANT, (void*)&result);
	return result;
}

void AddIn::SetPath(const VARIANT& propVal)
{
	SetProperty(0x123, VT_VARIANT, &propVal);
}

VARIANT AddIn::GetSubject()
{
	VARIANT result;
	GetProperty(0x3b9, VT_VARIANT, (void*)&result);
	return result;
}

void AddIn::SetSubject(const VARIANT& propVal)
{
	SetProperty(0x3b9, VT_VARIANT, &propVal);
}

VARIANT AddIn::GetTitle()
{
	VARIANT result;
	GetProperty(0xc7, VT_VARIANT, (void*)&result);
	return result;
}

void AddIn::SetTitle(const VARIANT& propVal)
{
	SetProperty(0xc7, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// AddIn operations

VARIANT AddIn::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// AddIns properties

VARIANT AddIns::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void AddIns::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT AddIns::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void AddIns::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT AddIns::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void AddIns::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// AddIns operations

VARIANT AddIns::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT AddIns::Add(const VARIANT& Filename, const VARIANT& CopyFile)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Filename, &CopyFile);
	return result;
}

VARIANT AddIns::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT AddIns::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Areas properties

VARIANT Areas::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Areas::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Areas::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Areas::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Areas::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Areas::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Areas operations

VARIANT Areas::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Areas::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Areas::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Range properties

VARIANT Range::GetAddIndent()
{
	VARIANT result;
	GetProperty(0x427, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetAddIndent(const VARIANT& propVal)
{
	SetProperty(0x427, VT_VARIANT, &propVal);
}

VARIANT Range::GetColumn()
{
	VARIANT result;
	GetProperty(0xf0, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetColumn(const VARIANT& propVal)
{
	SetProperty(0xf0, VT_VARIANT, &propVal);
}

VARIANT Range::GetColumnWidth()
{
	VARIANT result;
	GetProperty(0xf2, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetColumnWidth(const VARIANT& propVal)
{
	SetProperty(0xf2, VT_VARIANT, &propVal);
}

VARIANT Range::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Range::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Range::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT Range::GetFormula()
{
	VARIANT result;
	GetProperty(0x105, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetFormula(const VARIANT& propVal)
{
	SetProperty(0x105, VT_VARIANT, &propVal);
}

VARIANT Range::GetFormulaArray()
{
	VARIANT result;
	GetProperty(0x24a, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetFormulaArray(const VARIANT& propVal)
{
	SetProperty(0x24a, VT_VARIANT, &propVal);
}

VARIANT Range::GetFormulaHidden()
{
	VARIANT result;
	GetProperty(0x106, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetFormulaHidden(const VARIANT& propVal)
{
	SetProperty(0x106, VT_VARIANT, &propVal);
}

VARIANT Range::GetFormulaLocal()
{
	VARIANT result;
	GetProperty(0x107, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetFormulaLocal(const VARIANT& propVal)
{
	SetProperty(0x107, VT_VARIANT, &propVal);
}

VARIANT Range::GetFormulaR1C1()
{
	VARIANT result;
	GetProperty(0x108, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetFormulaR1C1(const VARIANT& propVal)
{
	SetProperty(0x108, VT_VARIANT, &propVal);
}

VARIANT Range::GetFormulaR1C1Local()
{
	VARIANT result;
	GetProperty(0x109, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetFormulaR1C1Local(const VARIANT& propVal)
{
	SetProperty(0x109, VT_VARIANT, &propVal);
}

VARIANT Range::GetHasArray()
{
	VARIANT result;
	GetProperty(0x10a, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetHasArray(const VARIANT& propVal)
{
	SetProperty(0x10a, VT_VARIANT, &propVal);
}

VARIANT Range::GetHasFormula()
{
	VARIANT result;
	GetProperty(0x10b, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetHasFormula(const VARIANT& propVal)
{
	SetProperty(0x10b, VT_VARIANT, &propVal);
}

VARIANT Range::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Range::GetHidden()
{
	VARIANT result;
	GetProperty(0x10c, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetHidden(const VARIANT& propVal)
{
	SetProperty(0x10c, VT_VARIANT, &propVal);
}

VARIANT Range::GetHorizontalAlignment()
{
	VARIANT result;
	GetProperty(0x88, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetHorizontalAlignment(const VARIANT& propVal)
{
	SetProperty(0x88, VT_VARIANT, &propVal);
}

VARIANT Range::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Range::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Range::GetLocationInTable()
{
	VARIANT result;
	GetProperty(0x2b3, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetLocationInTable(const VARIANT& propVal)
{
	SetProperty(0x2b3, VT_VARIANT, &propVal);
}

VARIANT Range::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Range::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Range::GetNumberFormat()
{
	VARIANT result;
	GetProperty(0xc1, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetNumberFormat(const VARIANT& propVal)
{
	SetProperty(0xc1, VT_VARIANT, &propVal);
}

VARIANT Range::GetNumberFormatLocal()
{
	VARIANT result;
	GetProperty(0x449, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetNumberFormatLocal(const VARIANT& propVal)
{
	SetProperty(0x449, VT_VARIANT, &propVal);
}

VARIANT Range::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT Range::GetOutlineLevel()
{
	VARIANT result;
	GetProperty(0x10f, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetOutlineLevel(const VARIANT& propVal)
{
	SetProperty(0x10f, VT_VARIANT, &propVal);
}

VARIANT Range::GetPageBreak()
{
	VARIANT result;
	GetProperty(0xff, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetPageBreak(const VARIANT& propVal)
{
	SetProperty(0xff, VT_VARIANT, &propVal);
}

VARIANT Range::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Range::GetPivotField()
{
	VARIANT result;
	GetProperty(0x2db, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetPivotField(const VARIANT& propVal)
{
	SetProperty(0x2db, VT_VARIANT, &propVal);
}

VARIANT Range::GetPivotItem()
{
	VARIANT result;
	GetProperty(0x2e4, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetPivotItem(const VARIANT& propVal)
{
	SetProperty(0x2e4, VT_VARIANT, &propVal);
}

VARIANT Range::GetPivotTable()
{
	VARIANT result;
	GetProperty(0x2cc, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetPivotTable(const VARIANT& propVal)
{
	SetProperty(0x2cc, VT_VARIANT, &propVal);
}

VARIANT Range::GetPrefixCharacter()
{
	VARIANT result;
	GetProperty(0x1f8, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetPrefixCharacter(const VARIANT& propVal)
{
	SetProperty(0x1f8, VT_VARIANT, &propVal);
}

VARIANT Range::GetRow()
{
	VARIANT result;
	GetProperty(0x101, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetRow(const VARIANT& propVal)
{
	SetProperty(0x101, VT_VARIANT, &propVal);
}

VARIANT Range::GetRowHeight()
{
	VARIANT result;
	GetProperty(0x110, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetRowHeight(const VARIANT& propVal)
{
	SetProperty(0x110, VT_VARIANT, &propVal);
}

VARIANT Range::GetShowDetail()
{
	VARIANT result;
	GetProperty(0x249, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetShowDetail(const VARIANT& propVal)
{
	SetProperty(0x249, VT_VARIANT, &propVal);
}

VARIANT Range::GetSoundNote()
{
	VARIANT result;
	GetProperty(0x394, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetSoundNote(const VARIANT& propVal)
{
	SetProperty(0x394, VT_VARIANT, &propVal);
}

VARIANT Range::GetStyle()
{
	VARIANT result;
	GetProperty(0x104, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetStyle(const VARIANT& propVal)
{
	SetProperty(0x104, VT_VARIANT, &propVal);
}

VARIANT Range::GetSummary()
{
	VARIANT result;
	GetProperty(0x111, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetSummary(const VARIANT& propVal)
{
	SetProperty(0x111, VT_VARIANT, &propVal);
}

VARIANT Range::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT Range::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Range::GetUseStandardHeight()
{
	VARIANT result;
	GetProperty(0x112, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetUseStandardHeight(const VARIANT& propVal)
{
	SetProperty(0x112, VT_VARIANT, &propVal);
}

VARIANT Range::GetUseStandardWidth()
{
	VARIANT result;
	GetProperty(0x113, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetUseStandardWidth(const VARIANT& propVal)
{
	SetProperty(0x113, VT_VARIANT, &propVal);
}

VARIANT Range::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT Range::GetVerticalAlignment()
{
	VARIANT result;
	GetProperty(0x89, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetVerticalAlignment(const VARIANT& propVal)
{
	SetProperty(0x89, VT_VARIANT, &propVal);
}

VARIANT Range::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Range::GetWrapText()
{
	VARIANT result;
	GetProperty(0x114, VT_VARIANT, (void*)&result);
	return result;
}

void Range::SetWrapText(const VARIANT& propVal)
{
	SetProperty(0x114, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Range operations

VARIANT Range::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::Activate()
{
	VARIANT result;
	InvokeHelper(0x130, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::Address(const VARIANT& RowAbsolute, const VARIANT& ColumnAbsolute, const VARIANT& ReferenceStyle, const VARIANT& External, const VARIANT& RelativeTo)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xec, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&RowAbsolute, &ColumnAbsolute, &ReferenceStyle, &External, &RelativeTo);
	return result;
}

VARIANT Range::AddressLocal(const VARIANT& RowAbsolute, const VARIANT& ColumnAbsolute, const VARIANT& ReferenceStyle, const VARIANT& External, const VARIANT& RelativeTo)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1b5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&RowAbsolute, &ColumnAbsolute, &ReferenceStyle, &External, &RelativeTo);
	return result;
}

VARIANT Range::AdvancedFilter(const VARIANT& Action, const VARIANT& CriteriaRange, const VARIANT& CopyToRange, const VARIANT& Unique)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x36c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Action, &CriteriaRange, &CopyToRange, &Unique);
	return result;
}

VARIANT Range::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::ApplyNames(const VARIANT& Names, const VARIANT& IgnoreRelativeAbsolute, const VARIANT& UseRowColumnNames, const VARIANT& OmitColumn, const VARIANT& OmitRow, const VARIANT& Order, const VARIANT& AppendLast)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1b9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Names, &IgnoreRelativeAbsolute, &UseRowColumnNames, &OmitColumn, &OmitRow, &Order, &AppendLast);
	return result;
}

VARIANT Range::ApplyOutlineStyles()
{
	VARIANT result;
	InvokeHelper(0x1c0, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::Areas(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x238, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Range::AutoFill(const VARIANT& Destination, const VARIANT& Type)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1c1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Destination, &Type);
	return result;
}

VARIANT Range::AutoFilter(const VARIANT& Field, const VARIANT& Criteria1, const VARIANT& Operator, const VARIANT& Criteria2)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x319, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Field, &Criteria1, &Operator, &Criteria2);
	return result;
}

VARIANT Range::AutoFit()
{
	VARIANT result;
	InvokeHelper(0xed, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::AutoFormat(const VARIANT& Format, const VARIANT& Number, const VARIANT& Font, const VARIANT& Alignment, const VARIANT& Border, const VARIANT& Pattern, const VARIANT& Width)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x72, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Format, &Number, &Font, &Alignment, &Border, &Pattern, &Width);
	return result;
}

VARIANT Range::AutoOutline()
{
	VARIANT result;
	InvokeHelper(0x40c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::BorderAround(const VARIANT& LineStyle, const VARIANT& Weight, const VARIANT& ColorIndex, const VARIANT& Color)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x42b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&LineStyle, &Weight, &ColorIndex, &Color);
	return result;
}

VARIANT Range::Borders(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1b3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Range::Calculate()
{
	VARIANT result;
	InvokeHelper(0x117, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::Cells(const VARIANT& RowIndex, const VARIANT& ColumnIndex)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xee, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&RowIndex, &ColumnIndex);
	return result;
}

VARIANT Range::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT Range::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT Range::Clear()
{
	VARIANT result;
	InvokeHelper(0x6f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::ClearContents()
{
	VARIANT result;
	InvokeHelper(0x71, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::ClearFormats()
{
	VARIANT result;
	InvokeHelper(0x70, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::ClearNotes()
{
	VARIANT result;
	InvokeHelper(0xef, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::ClearOutline()
{
	VARIANT result;
	InvokeHelper(0x40d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::ColumnDifferences(const VARIANT& Comparison)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1fe, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Comparison);
	return result;
}

VARIANT Range::Columns(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xf1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Range::Consolidate(const VARIANT& Sources, const VARIANT& Function, const VARIANT& TopRow, const VARIANT& LeftColumn, const VARIANT& CreateLinks)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1e2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Sources, &Function, &TopRow, &LeftColumn, &CreateLinks);
	return result;
}

VARIANT Range::Copy(const VARIANT& Destination)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Destination);
	return result;
}

VARIANT Range::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Range::CreateNames(const VARIANT& Top, const VARIANT& Left, const VARIANT& Bottom, const VARIANT& Right)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1c9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Top, &Left, &Bottom, &Right);
	return result;
}

VARIANT Range::CreatePublisher(const VARIANT& Edition, const VARIANT& Appearance, const VARIANT& ContainsPICT, const VARIANT& ContainsBIFF, const VARIANT& ContainsRTF, const VARIANT& ContainsVALU)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1ca, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Edition, &Appearance, &ContainsPICT, &ContainsBIFF, &ContainsRTF, &ContainsVALU);
	return result;
}

VARIANT Range::CurrentArray()
{
	VARIANT result;
	InvokeHelper(0x1f5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::CurrentRegion()
{
	VARIANT result;
	InvokeHelper(0xf3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::Cut(const VARIANT& Destination)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Destination);
	return result;
}

VARIANT Range::DataSeries(const VARIANT& Rowcol, const VARIANT& Type, const VARIANT& Date, const VARIANT& Step, const VARIANT& Stop, const VARIANT& Trend)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1d0, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Rowcol, &Type, &Date, &Step, &Stop, &Trend);
	return result;
}

VARIANT Range::Delete(const VARIANT& Shift)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Shift);
	return result;
}

VARIANT Range::Dependents()
{
	VARIANT result;
	InvokeHelper(0x21f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::DialogBox()
{
	VARIANT result;
	InvokeHelper(0xf5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::DirectDependents()
{
	VARIANT result;
	InvokeHelper(0x221, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::DirectPrecedents()
{
	VARIANT result;
	InvokeHelper(0x222, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::End(const VARIANT& Direction)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1f4, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Direction);
	return result;
}

VARIANT Range::EntireColumn()
{
	VARIANT result;
	InvokeHelper(0xf6, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::EntireRow()
{
	VARIANT result;
	InvokeHelper(0xf7, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::FillDown()
{
	VARIANT result;
	InvokeHelper(0xf8, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::FillLeft()
{
	VARIANT result;
	InvokeHelper(0xf9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::FillRight()
{
	VARIANT result;
	InvokeHelper(0xfa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::FillUp()
{
	VARIANT result;
	InvokeHelper(0xfb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::Find(const VARIANT& What, const VARIANT& After, const VARIANT& LookIn, const VARIANT& LookAt, const VARIANT& SearchOrder, const VARIANT& SearchDirection, const VARIANT& MatchCase)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x18e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&What, &After, &LookIn, &LookAt, &SearchOrder, &SearchDirection, &MatchCase);
	return result;
}

VARIANT Range::FindNext(const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x18f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&After);
	return result;
}

VARIANT Range::FindPrevious(const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x190, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&After);
	return result;
}

VARIANT Range::FunctionWizard()
{
	VARIANT result;
	InvokeHelper(0x23b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::GoalSeek(const VARIANT& Goal, const VARIANT& ChangingCell)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1d8, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Goal, &ChangingCell);
	return result;
}

VARIANT Range::Group(const VARIANT& Start, const VARIANT& End, const VARIANT& By, const VARIANT& Periods)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &End, &By, &Periods);
	return result;
}

VARIANT Range::Insert(const VARIANT& Shift)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xfc, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Shift);
	return result;
}

VARIANT Range::Item(const VARIANT& RowIndex, const VARIANT& ColumnIndex)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&RowIndex, &ColumnIndex);
	return result;
}

VARIANT Range::Justify()
{
	VARIANT result;
	InvokeHelper(0x1ef, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::ListNames()
{
	VARIANT result;
	InvokeHelper(0xfd, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::NavigateArrow(const VARIANT& TowardPrecedent, const VARIANT& ArrowNumber, const VARIANT& LinkNumber)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x408, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&TowardPrecedent, &ArrowNumber, &LinkNumber);
	return result;
}

VARIANT Range::Next()
{
	VARIANT result;
	InvokeHelper(0x1f6, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::NoteText(const VARIANT& Text, const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x467, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Text, &Start, &Length);
	return result;
}

VARIANT Range::Offset(const VARIANT& RowOffset, const VARIANT& ColumnOffset)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xfe, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&RowOffset, &ColumnOffset);
	return result;
}

VARIANT Range::Parse(const VARIANT& ParseLine, const VARIANT& Destination)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1dd, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&ParseLine, &Destination);
	return result;
}

VARIANT Range::PasteSpecial(const VARIANT& Paste, const VARIANT& Operation, const VARIANT& SkipBlanks, const VARIANT& Transpose)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x403, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Paste, &Operation, &SkipBlanks, &Transpose);
	return result;
}

VARIANT Range::Precedents()
{
	VARIANT result;
	InvokeHelper(0x220, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::Previous()
{
	VARIANT result;
	InvokeHelper(0x1f7, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::PrintOut(const VARIANT& From, const VARIANT& To, const VARIANT& Copies, const VARIANT& Preview)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x389, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&From, &To, &Copies, &Preview);
	return result;
}

VARIANT Range::PrintPreview()
{
	VARIANT result;
	InvokeHelper(0x119, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::Range_(const VARIANT& Cell1, const VARIANT& Cell2)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xc5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Cell1, &Cell2);
	return result;
}

VARIANT Range::RemoveSubtotal()
{
	VARIANT result;
	InvokeHelper(0x373, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::Replace(const VARIANT& What, const VARIANT& Replacement, const VARIANT& LookAt, const VARIANT& SearchOrder, const VARIANT& MatchCase)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xe2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&What, &Replacement, &LookAt, &SearchOrder, &MatchCase);
	return result;
}

VARIANT Range::Resize(const VARIANT& RowSize, const VARIANT& ColumnSize)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x100, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&RowSize, &ColumnSize);
	return result;
}

VARIANT Range::RowDifferences(const VARIANT& Comparison)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1ff, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Comparison);
	return result;
}

VARIANT Range::Rows(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x102, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Range::Run(const VARIANT& Arg1, const VARIANT& Arg2, const VARIANT& Arg3, const VARIANT& Arg4, const VARIANT& Arg5, const VARIANT& Arg6, const VARIANT& Arg7, const VARIANT& Arg8, const VARIANT& Arg9, const VARIANT& Arg10, 
		const VARIANT& Arg11, const VARIANT& Arg12, const VARIANT& Arg13, const VARIANT& Arg14, const VARIANT& Arg15, const VARIANT& Arg16, const VARIANT& Arg17, const VARIANT& Arg18, const VARIANT& Arg19, const VARIANT& Arg20, 
		const VARIANT& Arg21, const VARIANT& Arg22, const VARIANT& Arg23, const VARIANT& Arg24, const VARIANT& Arg25, const VARIANT& Arg26, const VARIANT& Arg27, const VARIANT& Arg28, const VARIANT& Arg29, const VARIANT& Arg30)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT 
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x103, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Arg1, &Arg2, &Arg3, &Arg4, &Arg5, &Arg6, &Arg7, &Arg8, &Arg9, &Arg10, &Arg11, &Arg12, &Arg13, &Arg14, &Arg15, &Arg16, &Arg17, &Arg18, &Arg19, &Arg20, &Arg21, &Arg22, &Arg23, &Arg24, &Arg25, &Arg26, &Arg27, &Arg28, &Arg29, &Arg30);
	return result;
}

VARIANT Range::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::Show()
{
	VARIANT result;
	InvokeHelper(0x1f0, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::ShowDependents(const VARIANT& Remove)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x36d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Remove);
	return result;
}

VARIANT Range::ShowErrors()
{
	VARIANT result;
	InvokeHelper(0x36e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::ShowPrecedents(const VARIANT& Remove)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x36f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Remove);
	return result;
}

VARIANT Range::Sort(const VARIANT& Key1, const VARIANT& Order1, const VARIANT& Key2, const VARIANT& Type, const VARIANT& Order2, const VARIANT& Key3, const VARIANT& Order3, const VARIANT& Header, const VARIANT& OrderCustom, const VARIANT& MatchCase, 
		const VARIANT& Orientation)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x370, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Key1, &Order1, &Key2, &Type, &Order2, &Key3, &Order3, &Header, &OrderCustom, &MatchCase, &Orientation);
	return result;
}

VARIANT Range::SortSpecial(const VARIANT& SortMethod, const VARIANT& Key1, const VARIANT& Order1, const VARIANT& Type, const VARIANT& Key2, const VARIANT& Order2, const VARIANT& Key3, const VARIANT& Order3, const VARIANT& Header, 
		const VARIANT& OrderCustom, const VARIANT& MatchCase, const VARIANT& Orientation)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x371, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&SortMethod, &Key1, &Order1, &Type, &Key2, &Order2, &Key3, &Order3, &Header, &OrderCustom, &MatchCase, &Orientation);
	return result;
}

VARIANT Range::SpecialCells(const VARIANT& Type, const VARIANT& Value)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x19a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Type, &Value);
	return result;
}

VARIANT Range::SubscribeTo(const VARIANT& Edition, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1e1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Edition, &Format);
	return result;
}

VARIANT Range::Subtotal(const VARIANT& GroupBy, const VARIANT& Function, const VARIANT& TotalList, const VARIANT& Replace, const VARIANT& PageBreaks, const VARIANT& SummaryBelowData)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x372, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&GroupBy, &Function, &TotalList, &Replace, &PageBreaks, &SummaryBelowData);
	return result;
}

VARIANT Range::Table(const VARIANT& RowInput, const VARIANT& ColumnInput)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&RowInput, &ColumnInput);
	return result;
}

VARIANT Range::TextToColumns(const VARIANT& Destination, const VARIANT& DataType, const VARIANT& TextQualifier, const VARIANT& ConsecutiveDelimiter, const VARIANT& Tab, const VARIANT& Semicolon, const VARIANT& Comma, const VARIANT& Space, 
		const VARIANT& Other, const VARIANT& OtherChar, const VARIANT& FieldInfo)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x410, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Destination, &DataType, &TextQualifier, &ConsecutiveDelimiter, &Tab, &Semicolon, &Comma, &Space, &Other, &OtherChar, &FieldInfo);
	return result;
}

VARIANT Range::Ungroup()
{
	VARIANT result;
	InvokeHelper(0xf4, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Range::Worksheet()
{
	VARIANT result;
	InvokeHelper(0x15c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Workbook properties

VARIANT Workbook::GetActiveChart()
{
	VARIANT result;
	GetProperty(0xb7, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetActiveChart(const VARIANT& propVal)
{
	SetProperty(0xb7, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetActiveSheet()
{
	VARIANT result;
	GetProperty(0x133, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetActiveSheet(const VARIANT& propVal)
{
	SetProperty(0x133, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetAuthor()
{
	VARIANT result;
	GetProperty(0x23e, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetAuthor(const VARIANT& propVal)
{
	SetProperty(0x23e, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetColors()
{
	VARIANT result;
	GetProperty(0x11e, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetColors(const VARIANT& propVal)
{
	SetProperty(0x11e, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetComments()
{
	VARIANT result;
	GetProperty(0x23f, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetComments(const VARIANT& propVal)
{
	SetProperty(0x23f, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetCreateBackup()
{
	VARIANT result;
	GetProperty(0x11f, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetCreateBackup(const VARIANT& propVal)
{
	SetProperty(0x11f, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetDate1904()
{
	VARIANT result;
	GetProperty(0x193, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetDate1904(const VARIANT& propVal)
{
	SetProperty(0x193, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetDisplayDrawingObjects()
{
	VARIANT result;
	GetProperty(0x194, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetDisplayDrawingObjects(const VARIANT& propVal)
{
	SetProperty(0x194, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetFileFormat()
{
	VARIANT result;
	GetProperty(0x120, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetFileFormat(const VARIANT& propVal)
{
	SetProperty(0x120, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetFullName()
{
	VARIANT result;
	GetProperty(0x121, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetFullName(const VARIANT& propVal)
{
	SetProperty(0x121, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetHasMailer()
{
	VARIANT result;
	GetProperty(0x3d0, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetHasMailer(const VARIANT& propVal)
{
	SetProperty(0x3d0, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetHasPassword()
{
	VARIANT result;
	GetProperty(0x122, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetHasPassword(const VARIANT& propVal)
{
	SetProperty(0x122, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetHasRoutingSlip()
{
	VARIANT result;
	GetProperty(0x3b6, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetHasRoutingSlip(const VARIANT& propVal)
{
	SetProperty(0x3b6, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetKeywords()
{
	VARIANT result;
	GetProperty(0x241, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetKeywords(const VARIANT& propVal)
{
	SetProperty(0x241, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetMailer()
{
	VARIANT result;
	GetProperty(0x3d3, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetMailer(const VARIANT& propVal)
{
	SetProperty(0x3d3, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetOnSheetActivate()
{
	VARIANT result;
	GetProperty(0x407, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetOnSheetActivate(const VARIANT& propVal)
{
	SetProperty(0x407, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetOnSheetDeactivate()
{
	VARIANT result;
	GetProperty(0x439, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetOnSheetDeactivate(const VARIANT& propVal)
{
	SetProperty(0x439, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetPath()
{
	VARIANT result;
	GetProperty(0x123, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetPath(const VARIANT& propVal)
{
	SetProperty(0x123, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetPrecisionAsDisplayed()
{
	VARIANT result;
	GetProperty(0x195, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetPrecisionAsDisplayed(const VARIANT& propVal)
{
	SetProperty(0x195, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetProtectStructure()
{
	VARIANT result;
	GetProperty(0x24c, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetProtectStructure(const VARIANT& propVal)
{
	SetProperty(0x24c, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetProtectWindows()
{
	VARIANT result;
	GetProperty(0x127, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetProtectWindows(const VARIANT& propVal)
{
	SetProperty(0x127, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetReadOnly()
{
	VARIANT result;
	GetProperty(0x128, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetReadOnly(const VARIANT& propVal)
{
	SetProperty(0x128, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetReadOnlyRecommended()
{
	VARIANT result;
	GetProperty(0x129, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetReadOnlyRecommended(const VARIANT& propVal)
{
	SetProperty(0x129, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetRouted()
{
	VARIANT result;
	GetProperty(0x3b7, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetRouted(const VARIANT& propVal)
{
	SetProperty(0x3b7, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetRoutingSlip()
{
	VARIANT result;
	GetProperty(0x3b5, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetRoutingSlip(const VARIANT& propVal)
{
	SetProperty(0x3b5, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetSaved()
{
	VARIANT result;
	GetProperty(0x12a, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetSaved(const VARIANT& propVal)
{
	SetProperty(0x12a, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetSaveLinkValues()
{
	VARIANT result;
	GetProperty(0x196, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetSaveLinkValues(const VARIANT& propVal)
{
	SetProperty(0x196, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetSubject()
{
	VARIANT result;
	GetProperty(0x3b9, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetSubject(const VARIANT& propVal)
{
	SetProperty(0x3b9, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetTitle()
{
	VARIANT result;
	GetProperty(0xc7, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetTitle(const VARIANT& propVal)
{
	SetProperty(0xc7, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetUpdateRemoteReferences()
{
	VARIANT result;
	GetProperty(0x19b, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetUpdateRemoteReferences(const VARIANT& propVal)
{
	SetProperty(0x19b, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetWriteReserved()
{
	VARIANT result;
	GetProperty(0x12b, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetWriteReserved(const VARIANT& propVal)
{
	SetProperty(0x12b, VT_VARIANT, &propVal);
}

VARIANT Workbook::GetWriteReservedBy()
{
	VARIANT result;
	GetProperty(0x12c, VT_VARIANT, (void*)&result);
	return result;
}

void Workbook::SetWriteReservedBy(const VARIANT& propVal)
{
	SetProperty(0x12c, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Workbook operations

VARIANT Workbook::Activate()
{
	VARIANT result;
	InvokeHelper(0x130, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Workbook::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Workbook::ChangeFileAccess(const VARIANT& Mode, const VARIANT& WritePassword, const VARIANT& Notify)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x3dd, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Mode, &WritePassword, &Notify);
	return result;
}

VARIANT Workbook::ChangeLink(const VARIANT& Name, const VARIANT& NewName, const VARIANT& Type)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x322, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name, &NewName, &Type);
	return result;
}

VARIANT Workbook::Charts(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x79, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Workbook::Close(const VARIANT& SaveChanges, const VARIANT& Filename, const VARIANT& RouteWorkbook)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x115, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&SaveChanges, &Filename, &RouteWorkbook);
	return result;
}

VARIANT Workbook::DeleteNumberFormat(const VARIANT& NumberFormat)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x18d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&NumberFormat);
	return result;
}

VARIANT Workbook::DialogSheets(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x2fc, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Workbook::Excel4IntlMacroSheets(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x245, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Workbook::Excel4MacroSheets(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x243, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Workbook::ForwardMailer()
{
	VARIANT result;
	InvokeHelper(0x3cd, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Workbook::LinkInfo(const VARIANT& Name, const VARIANT& LinkInfo, const VARIANT& Type, const VARIANT& EditionRef)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x327, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name, &LinkInfo, &Type, &EditionRef);
	return result;
}

VARIANT Workbook::LinkSources(const VARIANT& Type)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x328, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Type);
	return result;
}

VARIANT Workbook::Modules(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x246, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Workbook::Names(const VARIANT& Index, const VARIANT& IndexLocal, const VARIANT& RefersTo)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1ba, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index, &IndexLocal, &RefersTo);
	return result;
}

VARIANT Workbook::NewWindow()
{
	VARIANT result;
	InvokeHelper(0x118, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Workbook::OpenLinks(const VARIANT& Name, const VARIANT& ReadOnly, const VARIANT& Type)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x323, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name, &ReadOnly, &Type);
	return result;
}

VARIANT Workbook::PrintOut(const VARIANT& From, const VARIANT& To, const VARIANT& Copies, const VARIANT& Preview)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x389, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&From, &To, &Copies, &Preview);
	return result;
}

VARIANT Workbook::PrintPreview()
{
	VARIANT result;
	InvokeHelper(0x119, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Workbook::Protect(const VARIANT& Password, const VARIANT& Structure, const VARIANT& Windows)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x11a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Password, &Structure, &Windows);
	return result;
}

VARIANT Workbook::Reply()
{
	VARIANT result;
	InvokeHelper(0x3d1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Workbook::ReplyAll()
{
	VARIANT result;
	InvokeHelper(0x3d2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Workbook::Route()
{
	VARIANT result;
	InvokeHelper(0x3b2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Workbook::RunAutoMacros(const VARIANT& Which)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x27a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Which);
	return result;
}

VARIANT Workbook::Save()
{
	VARIANT result;
	InvokeHelper(0x11b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Workbook::SaveAs(const VARIANT& Filename, const VARIANT& FileFormat, const VARIANT& Password, const VARIANT& WriteResPassword, const VARIANT& ReadOnlyRecommended, const VARIANT& CreateBackup)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x11c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Filename, &FileFormat, &Password, &WriteResPassword, &ReadOnlyRecommended, &CreateBackup);
	return result;
}

VARIANT Workbook::SaveCopyAs(const VARIANT& Filename)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaf, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Filename);
	return result;
}

VARIANT Workbook::SendMail(const VARIANT& Recipients, const VARIANT& Subject, const VARIANT& ReturnReceipt)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x3b3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Recipients, &Subject, &ReturnReceipt);
	return result;
}

VARIANT Workbook::SendMailer(const VARIANT& FileFormat, const VARIANT& Priority)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x3d4, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&FileFormat, &Priority);
	return result;
}

VARIANT Workbook::SetLinkOnData(const VARIANT& Name, const VARIANT& Procedure)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x329, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name, &Procedure);
	return result;
}

VARIANT Workbook::Sheets(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1e5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Workbook::Styles(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1ed, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Workbook::Unprotect(const VARIANT& Password)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x11d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Password);
	return result;
}

VARIANT Workbook::UpdateFromFile()
{
	VARIANT result;
	InvokeHelper(0x3e3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Workbook::UpdateLink(const VARIANT& Name, const VARIANT& Type)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x324, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name, &Type);
	return result;
}

VARIANT Workbook::Windows(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1ae, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Workbook::Worksheets(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1ee, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Workbooks properties

VARIANT Workbooks::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Workbooks::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Workbooks::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Workbooks::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Workbooks::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Workbooks::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Workbooks operations

VARIANT Workbooks::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Workbooks::Add(const VARIANT& Template)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Template);
	return result;
}

VARIANT Workbooks::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Workbooks::Close()
{
	VARIANT result;
	InvokeHelper(0x115, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Workbooks::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Workbooks::Open(const VARIANT& Filename, const VARIANT& UpdateLinks, const VARIANT& ReadOnly, const VARIANT& Format, const VARIANT& Password, const VARIANT& WriteResPassword, const VARIANT& IgnoreReadOnlyRecommended, const VARIANT& Origin, 
		const VARIANT& Delimiter, const VARIANT& Editable, const VARIANT& Notify, const VARIANT& Converter)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x2aa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Filename, &UpdateLinks, &ReadOnly, &Format, &Password, &WriteResPassword, &IgnoreReadOnlyRecommended, &Origin, &Delimiter, &Editable, &Notify, &Converter);
	return result;
}

VARIANT Workbooks::OpenText(const VARIANT& Filename, const VARIANT& Origin, const VARIANT& StartRow, const VARIANT& DataType, const VARIANT& TextQualifier, const VARIANT& ConsecutiveDelimiter, const VARIANT& Tab, const VARIANT& Semicolon, 
		const VARIANT& Comma, const VARIANT& Space, const VARIANT& Other, const VARIANT& OtherChar, const VARIANT& FieldInfo)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x2ab, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Filename, &Origin, &StartRow, &DataType, &TextQualifier, &ConsecutiveDelimiter, &Tab, &Semicolon, &Comma, &Space, &Other, &OtherChar, &FieldInfo);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Sheets properties

VARIANT Sheets::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Sheets::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Sheets::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Sheets::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Sheets::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Sheets::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Sheets::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Sheets::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Sheets operations

VARIANT Sheets::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Sheets::Add(const VARIANT& Before, const VARIANT& After, const VARIANT& Count, const VARIANT& Type)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After, &Count, &Type);
	return result;
}

VARIANT Sheets::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Sheets::Copy(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT Sheets::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Sheets::FillAcrossSheets(const VARIANT& Range, const VARIANT& Type)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1d5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Range, &Type);
	return result;
}

VARIANT Sheets::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Sheets::Move(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x27d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT Sheets::PrintOut(const VARIANT& From, const VARIANT& To, const VARIANT& Copies, const VARIANT& Preview)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x389, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&From, &To, &Copies, &Preview);
	return result;
}

VARIANT Sheets::PrintPreview()
{
	VARIANT result;
	InvokeHelper(0x119, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Sheets::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Worksheet properties

VARIANT Worksheet::GetAutoFilterMode()
{
	VARIANT result;
	GetProperty(0x318, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetAutoFilterMode(const VARIANT& propVal)
{
	SetProperty(0x318, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetCircularReference()
{
	VARIANT result;
	GetProperty(0x42d, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetCircularReference(const VARIANT& propVal)
{
	SetProperty(0x42d, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetConsolidationFunction()
{
	VARIANT result;
	GetProperty(0x315, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetConsolidationFunction(const VARIANT& propVal)
{
	SetProperty(0x315, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetConsolidationOptions()
{
	VARIANT result;
	GetProperty(0x316, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetConsolidationOptions(const VARIANT& propVal)
{
	SetProperty(0x316, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetConsolidationSources()
{
	VARIANT result;
	GetProperty(0x317, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetConsolidationSources(const VARIANT& propVal)
{
	SetProperty(0x317, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetDisplayAutomaticPageBreaks()
{
	VARIANT result;
	GetProperty(0x283, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetDisplayAutomaticPageBreaks(const VARIANT& propVal)
{
	SetProperty(0x283, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetFilterMode()
{
	VARIANT result;
	GetProperty(0x320, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetFilterMode(const VARIANT& propVal)
{
	SetProperty(0x320, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetNext()
{
	VARIANT result;
	GetProperty(0x1f6, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetNext(const VARIANT& propVal)
{
	SetProperty(0x1f6, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetOnCalculate()
{
	VARIANT result;
	GetProperty(0x271, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetOnCalculate(const VARIANT& propVal)
{
	SetProperty(0x271, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetOnData()
{
	VARIANT result;
	GetProperty(0x275, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetOnData(const VARIANT& propVal)
{
	SetProperty(0x275, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetOnDoubleClick()
{
	VARIANT result;
	GetProperty(0x274, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetOnDoubleClick(const VARIANT& propVal)
{
	SetProperty(0x274, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetOnEntry()
{
	VARIANT result;
	GetProperty(0x273, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetOnEntry(const VARIANT& propVal)
{
	SetProperty(0x273, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetOnSheetActivate()
{
	VARIANT result;
	GetProperty(0x407, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetOnSheetActivate(const VARIANT& propVal)
{
	SetProperty(0x407, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetOnSheetDeactivate()
{
	VARIANT result;
	GetProperty(0x439, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetOnSheetDeactivate(const VARIANT& propVal)
{
	SetProperty(0x439, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetOutline()
{
	VARIANT result;
	GetProperty(0x66, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetOutline(const VARIANT& propVal)
{
	SetProperty(0x66, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetPageSetup()
{
	VARIANT result;
	GetProperty(0x3e6, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetPageSetup(const VARIANT& propVal)
{
	SetProperty(0x3e6, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetPrevious()
{
	VARIANT result;
	GetProperty(0x1f7, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetPrevious(const VARIANT& propVal)
{
	SetProperty(0x1f7, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetProtectContents()
{
	VARIANT result;
	GetProperty(0x124, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetProtectContents(const VARIANT& propVal)
{
	SetProperty(0x124, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetProtectDrawingObjects()
{
	VARIANT result;
	GetProperty(0x125, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetProtectDrawingObjects(const VARIANT& propVal)
{
	SetProperty(0x125, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetProtectScenarios()
{
	VARIANT result;
	GetProperty(0x126, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetProtectScenarios(const VARIANT& propVal)
{
	SetProperty(0x126, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetStandardHeight()
{
	VARIANT result;
	GetProperty(0x197, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetStandardHeight(const VARIANT& propVal)
{
	SetProperty(0x197, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetStandardWidth()
{
	VARIANT result;
	GetProperty(0x198, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetStandardWidth(const VARIANT& propVal)
{
	SetProperty(0x198, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetTransitionExpEval()
{
	VARIANT result;
	GetProperty(0x191, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetTransitionExpEval(const VARIANT& propVal)
{
	SetProperty(0x191, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetTransitionFormEntry()
{
	VARIANT result;
	GetProperty(0x192, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetTransitionFormEntry(const VARIANT& propVal)
{
	SetProperty(0x192, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetType()
{
	VARIANT result;
	GetProperty(0x6c, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetType(const VARIANT& propVal)
{
	SetProperty(0x6c, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetUsedRange()
{
	VARIANT result;
	GetProperty(0x19c, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetUsedRange(const VARIANT& propVal)
{
	SetProperty(0x19c, VT_VARIANT, &propVal);
}

VARIANT Worksheet::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheet::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Worksheet operations

VARIANT Worksheet::Activate()
{
	VARIANT result;
	InvokeHelper(0x130, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Worksheet::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Worksheet::Arcs(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x2f8, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::Buttons(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x22d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::Calculate()
{
	VARIANT result;
	InvokeHelper(0x117, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Worksheet::Cells(const VARIANT& RowIndex, const VARIANT& ColumnIndex)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xee, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&RowIndex, &ColumnIndex);
	return result;
}

VARIANT Worksheet::ChartObjects(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x424, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::CheckBoxes(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x338, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT Worksheet::ClearArrows()
{
	VARIANT result;
	InvokeHelper(0x3ca, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Worksheet::Columns(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xf1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::Copy(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT Worksheet::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Worksheet::DrawingObjects(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x58, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::Drawings(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x304, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::DropDowns(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x344, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::_Evaluate(const VARIANT& Name)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name);
	return result;
}

VARIANT Worksheet::Evaluate(const VARIANT& Name)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xfffffffb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name);
	return result;
}

VARIANT Worksheet::GroupBoxes(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x342, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::GroupObjects(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x459, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::Labels(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x349, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::Lines(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x2ff, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::ListBoxes(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x340, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::Move(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x27d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT Worksheet::OLEObjects(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x31f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::OptionButtons(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x33a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::Ovals(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x321, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::Paste(const VARIANT& Destination, const VARIANT& Link)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Destination, &Link);
	return result;
}

VARIANT Worksheet::PasteSpecial(const VARIANT& Format, const VARIANT& Link, const VARIANT& DisplayAsIcon, const VARIANT& IconFileName, const VARIANT& IconIndex, const VARIANT& IconLabel)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x403, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Format, &Link, &DisplayAsIcon, &IconFileName, &IconIndex, &IconLabel);
	return result;
}

VARIANT Worksheet::Pictures(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x303, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::PivotTables(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x2b2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::PivotTableWizard(const VARIANT& SourceType, const VARIANT& SourceData, const VARIANT& TableDestination, const VARIANT& TableName, const VARIANT& RowGrand, const VARIANT& ColumnGrand, const VARIANT& SaveData, 
		const VARIANT& HasAutoFormat, const VARIANT& AutoPage)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x2ac, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&SourceType, &SourceData, &TableDestination, &TableName, &RowGrand, &ColumnGrand, &SaveData, &HasAutoFormat, &AutoPage);
	return result;
}

VARIANT Worksheet::PrintOut(const VARIANT& From, const VARIANT& To, const VARIANT& Copies, const VARIANT& Preview)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x389, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&From, &To, &Copies, &Preview);
	return result;
}

VARIANT Worksheet::PrintPreview()
{
	VARIANT result;
	InvokeHelper(0x119, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Worksheet::Protect(const VARIANT& Password, const VARIANT& DrawingObjects, const VARIANT& Contents, const VARIANT& Scenarios)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x11a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Password, &DrawingObjects, &Contents, &Scenarios);
	return result;
}

VARIANT Worksheet::Range(const VARIANT& Cell1, const VARIANT& Cell2)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xc5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Cell1, &Cell2);
	return result;
}

VARIANT Worksheet::Rectangles(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x306, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::Rows(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x102, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::SaveAs(const VARIANT& Filename, const VARIANT& FileFormat, const VARIANT& Password, const VARIANT& WriteResPassword, const VARIANT& ReadOnlyRecommended, const VARIANT& CreateBackup)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x11c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Filename, &FileFormat, &Password, &WriteResPassword, &ReadOnlyRecommended, &CreateBackup);
	return result;
}

VARIANT Worksheet::Scenarios(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x38c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::ScrollBars(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x33e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Worksheet::ShowAllData()
{
	VARIANT result;
	InvokeHelper(0x31a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Worksheet::ShowDataForm()
{
	VARIANT result;
	InvokeHelper(0x199, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Worksheet::Spinners(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x346, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::TextBoxes(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x309, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheet::Unprotect(const VARIANT& Password)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x11d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Password);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Worksheets properties

VARIANT Worksheets::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheets::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Worksheets::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheets::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Worksheets::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheets::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Worksheets::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Worksheets::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Worksheets operations

VARIANT Worksheets::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Worksheets::Add(const VARIANT& Before, const VARIANT& After, const VARIANT& Count, const VARIANT& Type)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After, &Count, &Type);
	return result;
}

VARIANT Worksheets::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Worksheets::Copy(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT Worksheets::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Worksheets::FillAcrossSheets(const VARIANT& Range, const VARIANT& Type)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1d5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Range, &Type);
	return result;
}

VARIANT Worksheets::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Worksheets::Move(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x27d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT Worksheets::PrintOut(const VARIANT& From, const VARIANT& To, const VARIANT& Copies, const VARIANT& Preview)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x389, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&From, &To, &Copies, &Preview);
	return result;
}

VARIANT Worksheets::PrintPreview()
{
	VARIANT result;
	InvokeHelper(0x119, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Worksheets::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// PivotTable properties

VARIANT PivotTable::GetColumnFields()
{
	VARIANT result;
	GetProperty(0x2c9, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetColumnFields(const VARIANT& propVal)
{
	SetProperty(0x2c9, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetColumnGrand()
{
	VARIANT result;
	GetProperty(0x2b6, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetColumnGrand(const VARIANT& propVal)
{
	SetProperty(0x2b6, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetColumnRange()
{
	VARIANT result;
	GetProperty(0x2be, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetColumnRange(const VARIANT& propVal)
{
	SetProperty(0x2be, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetDataBodyRange()
{
	VARIANT result;
	GetProperty(0x2c1, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetDataBodyRange(const VARIANT& propVal)
{
	SetProperty(0x2c1, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetDataFields()
{
	VARIANT result;
	GetProperty(0x2cb, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetDataFields(const VARIANT& propVal)
{
	SetProperty(0x2cb, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetDataLabelRange()
{
	VARIANT result;
	GetProperty(0x2c0, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetDataLabelRange(const VARIANT& propVal)
{
	SetProperty(0x2c0, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetHasAutoFormat()
{
	VARIANT result;
	GetProperty(0x2b7, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetHasAutoFormat(const VARIANT& propVal)
{
	SetProperty(0x2b7, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetHiddenFields()
{
	VARIANT result;
	GetProperty(0x2c7, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetHiddenFields(const VARIANT& propVal)
{
	SetProperty(0x2c7, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetInnerDetail()
{
	VARIANT result;
	GetProperty(0x2ba, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetInnerDetail(const VARIANT& propVal)
{
	SetProperty(0x2ba, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetPageFields()
{
	VARIANT result;
	GetProperty(0x2ca, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetPageFields(const VARIANT& propVal)
{
	SetProperty(0x2ca, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetPageRange()
{
	VARIANT result;
	GetProperty(0x2bf, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetPageRange(const VARIANT& propVal)
{
	SetProperty(0x2bf, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetRefreshDate()
{
	VARIANT result;
	GetProperty(0x2b8, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetRefreshDate(const VARIANT& propVal)
{
	SetProperty(0x2b8, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetRefreshName()
{
	VARIANT result;
	GetProperty(0x2b9, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetRefreshName(const VARIANT& propVal)
{
	SetProperty(0x2b9, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetRowFields()
{
	VARIANT result;
	GetProperty(0x2c8, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetRowFields(const VARIANT& propVal)
{
	SetProperty(0x2c8, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetRowGrand()
{
	VARIANT result;
	GetProperty(0x2b5, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetRowGrand(const VARIANT& propVal)
{
	SetProperty(0x2b5, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetRowRange()
{
	VARIANT result;
	GetProperty(0x2bd, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetRowRange(const VARIANT& propVal)
{
	SetProperty(0x2bd, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetSaveData()
{
	VARIANT result;
	GetProperty(0x2b4, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetSaveData(const VARIANT& propVal)
{
	SetProperty(0x2b4, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetSourceData()
{
	VARIANT result;
	GetProperty(0x2ae, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetSourceData(const VARIANT& propVal)
{
	SetProperty(0x2ae, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetTableRange1()
{
	VARIANT result;
	GetProperty(0x2bb, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetTableRange1(const VARIANT& propVal)
{
	SetProperty(0x2bb, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetTableRange2()
{
	VARIANT result;
	GetProperty(0x2bc, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetTableRange2(const VARIANT& propVal)
{
	SetProperty(0x2bc, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT PivotTable::GetVisibleFields()
{
	VARIANT result;
	GetProperty(0x2c6, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTable::SetVisibleFields(const VARIANT& propVal)
{
	SetProperty(0x2c6, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// PivotTable operations

VARIANT PivotTable::AddFields(const VARIANT& RowFields, const VARIANT& ColumnFields, const VARIANT& PageFields, const VARIANT& AddToTable)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x2c4, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&RowFields, &ColumnFields, &PageFields, &AddToTable);
	return result;
}

VARIANT PivotTable::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT PivotTable::PivotFields(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x2ce, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT PivotTable::RefreshTable()
{
	VARIANT result;
	InvokeHelper(0x2cd, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT PivotTable::ShowPages(const VARIANT& PageField)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x2c2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&PageField);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// PivotTables properties

VARIANT PivotTables::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTables::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT PivotTables::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTables::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT PivotTables::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void PivotTables::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// PivotTables operations

VARIANT PivotTables::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT PivotTables::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT PivotTables::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// PivotField properties

VARIANT PivotField::GetBaseField()
{
	VARIANT result;
	GetProperty(0x2de, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetBaseField(const VARIANT& propVal)
{
	SetProperty(0x2de, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetBaseItem()
{
	VARIANT result;
	GetProperty(0x2df, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetBaseItem(const VARIANT& propVal)
{
	SetProperty(0x2df, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetCalculation()
{
	VARIANT result;
	GetProperty(0x13c, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetCalculation(const VARIANT& propVal)
{
	SetProperty(0x13c, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetChildField()
{
	VARIANT result;
	GetProperty(0x2e0, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetChildField(const VARIANT& propVal)
{
	SetProperty(0x2e0, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetChildItems()
{
	VARIANT result;
	GetProperty(0x2da, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetChildItems(const VARIANT& propVal)
{
	SetProperty(0x2da, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetCurrentPage()
{
	VARIANT result;
	GetProperty(0x2e2, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetCurrentPage(const VARIANT& propVal)
{
	SetProperty(0x2e2, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetDataRange()
{
	VARIANT result;
	GetProperty(0x2d0, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetDataRange(const VARIANT& propVal)
{
	SetProperty(0x2d0, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetDataType()
{
	VARIANT result;
	GetProperty(0x2d2, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetDataType(const VARIANT& propVal)
{
	SetProperty(0x2d2, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetFunction()
{
	VARIANT result;
	GetProperty(0x383, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetFunction(const VARIANT& propVal)
{
	SetProperty(0x383, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetGroupLevel()
{
	VARIANT result;
	GetProperty(0x2d3, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetGroupLevel(const VARIANT& propVal)
{
	SetProperty(0x2d3, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetHiddenItems()
{
	VARIANT result;
	GetProperty(0x2d8, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetHiddenItems(const VARIANT& propVal)
{
	SetProperty(0x2d8, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetLabelRange()
{
	VARIANT result;
	GetProperty(0x2cf, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetLabelRange(const VARIANT& propVal)
{
	SetProperty(0x2cf, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetNumberFormat()
{
	VARIANT result;
	GetProperty(0xc1, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetNumberFormat(const VARIANT& propVal)
{
	SetProperty(0xc1, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetParentField()
{
	VARIANT result;
	GetProperty(0x2dc, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetParentField(const VARIANT& propVal)
{
	SetProperty(0x2dc, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetParentItems()
{
	VARIANT result;
	GetProperty(0x2d9, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetParentItems(const VARIANT& propVal)
{
	SetProperty(0x2d9, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetPosition()
{
	VARIANT result;
	GetProperty(0x85, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetPosition(const VARIANT& propVal)
{
	SetProperty(0x85, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetSourceName()
{
	VARIANT result;
	GetProperty(0x2d1, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetSourceName(const VARIANT& propVal)
{
	SetProperty(0x2d1, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetSubtotals()
{
	VARIANT result;
	GetProperty(0x2dd, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetSubtotals(const VARIANT& propVal)
{
	SetProperty(0x2dd, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetTotalLevels()
{
	VARIANT result;
	GetProperty(0x2d4, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetTotalLevels(const VARIANT& propVal)
{
	SetProperty(0x2d4, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT PivotField::GetVisibleItems()
{
	VARIANT result;
	GetProperty(0x2d7, VT_VARIANT, (void*)&result);
	return result;
}

void PivotField::SetVisibleItems(const VARIANT& propVal)
{
	SetProperty(0x2d7, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// PivotField operations

VARIANT PivotField::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT PivotField::PivotItems(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x2e1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// PivotFields properties

VARIANT PivotFields::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void PivotFields::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT PivotFields::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void PivotFields::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT PivotFields::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void PivotFields::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// PivotFields operations

VARIANT PivotFields::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT PivotFields::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT PivotFields::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// PivotItem properties

VARIANT PivotItem::GetChildItems()
{
	VARIANT result;
	GetProperty(0x2da, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItem::SetChildItems(const VARIANT& propVal)
{
	SetProperty(0x2da, VT_VARIANT, &propVal);
}

VARIANT PivotItem::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItem::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT PivotItem::GetDataRange()
{
	VARIANT result;
	GetProperty(0x2d0, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItem::SetDataRange(const VARIANT& propVal)
{
	SetProperty(0x2d0, VT_VARIANT, &propVal);
}

VARIANT PivotItem::GetLabelRange()
{
	VARIANT result;
	GetProperty(0x2cf, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItem::SetLabelRange(const VARIANT& propVal)
{
	SetProperty(0x2cf, VT_VARIANT, &propVal);
}

VARIANT PivotItem::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItem::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT PivotItem::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItem::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT PivotItem::GetParentItem()
{
	VARIANT result;
	GetProperty(0x2e5, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItem::SetParentItem(const VARIANT& propVal)
{
	SetProperty(0x2e5, VT_VARIANT, &propVal);
}

VARIANT PivotItem::GetParentShowDetail()
{
	VARIANT result;
	GetProperty(0x2e3, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItem::SetParentShowDetail(const VARIANT& propVal)
{
	SetProperty(0x2e3, VT_VARIANT, &propVal);
}

VARIANT PivotItem::GetPosition()
{
	VARIANT result;
	GetProperty(0x85, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItem::SetPosition(const VARIANT& propVal)
{
	SetProperty(0x85, VT_VARIANT, &propVal);
}

VARIANT PivotItem::GetShowDetail()
{
	VARIANT result;
	GetProperty(0x249, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItem::SetShowDetail(const VARIANT& propVal)
{
	SetProperty(0x249, VT_VARIANT, &propVal);
}

VARIANT PivotItem::GetSourceName()
{
	VARIANT result;
	GetProperty(0x2d1, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItem::SetSourceName(const VARIANT& propVal)
{
	SetProperty(0x2d1, VT_VARIANT, &propVal);
}

VARIANT PivotItem::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItem::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT PivotItem::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItem::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// PivotItem operations

VARIANT PivotItem::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// PivotItems properties

VARIANT PivotItems::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItems::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT PivotItems::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItems::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT PivotItems::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void PivotItems::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// PivotItems operations

VARIANT PivotItems::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT PivotItems::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT PivotItems::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Scenario properties

VARIANT Scenario::GetChangingCells()
{
	VARIANT result;
	GetProperty(0x38f, VT_VARIANT, (void*)&result);
	return result;
}

void Scenario::SetChangingCells(const VARIANT& propVal)
{
	SetProperty(0x38f, VT_VARIANT, &propVal);
}

VARIANT Scenario::GetComment()
{
	VARIANT result;
	GetProperty(0x38e, VT_VARIANT, (void*)&result);
	return result;
}

void Scenario::SetComment(const VARIANT& propVal)
{
	SetProperty(0x38e, VT_VARIANT, &propVal);
}

VARIANT Scenario::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Scenario::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Scenario::GetHidden()
{
	VARIANT result;
	GetProperty(0x10c, VT_VARIANT, (void*)&result);
	return result;
}

void Scenario::SetHidden(const VARIANT& propVal)
{
	SetProperty(0x10c, VT_VARIANT, &propVal);
}

VARIANT Scenario::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Scenario::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Scenario::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Scenario::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Scenario::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Scenario::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Scenario::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Scenario::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Scenario::GetValues()
{
	VARIANT result;
	GetProperty(0xa4, VT_VARIANT, (void*)&result);
	return result;
}

void Scenario::SetValues(const VARIANT& propVal)
{
	SetProperty(0xa4, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Scenario operations

VARIANT Scenario::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Scenario::ChangeScenario(const VARIANT& ChangingCells, const VARIANT& Values)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x390, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&ChangingCells, &Values);
	return result;
}

VARIANT Scenario::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Scenario::Show()
{
	VARIANT result;
	InvokeHelper(0x1f0, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Scenarios properties

VARIANT Scenarios::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Scenarios::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Scenarios::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Scenarios::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Scenarios::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Scenarios::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Scenarios operations

VARIANT Scenarios::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Scenarios::Add(const VARIANT& Name, const VARIANT& ChangingCells, const VARIANT& Values, const VARIANT& Comment, const VARIANT& Locked, const VARIANT& Hidden)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name, &ChangingCells, &Values, &Comment, &Locked, &Hidden);
	return result;
}

VARIANT Scenarios::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Scenarios::CreateSummary(const VARIANT& ReportType, const VARIANT& ResultCells)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x391, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&ReportType, &ResultCells);
	return result;
}

VARIANT Scenarios::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Scenarios::Merge(const VARIANT& Source)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x234, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Source);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// MenuBar properties

VARIANT MenuBar::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void MenuBar::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT MenuBar::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void MenuBar::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT MenuBar::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void MenuBar::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT MenuBar::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void MenuBar::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// MenuBar operations

VARIANT MenuBar::Activate()
{
	VARIANT result;
	InvokeHelper(0x130, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT MenuBar::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT MenuBar::BuiltIn()
{
	VARIANT result;
	InvokeHelper(0x229, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT MenuBar::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT MenuBar::Menus(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x24f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT MenuBar::Reset()
{
	VARIANT result;
	InvokeHelper(0x22b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// MenuBars properties

VARIANT MenuBars::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void MenuBars::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT MenuBars::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void MenuBars::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT MenuBars::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void MenuBars::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// MenuBars operations

VARIANT MenuBars::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT MenuBars::Add(const VARIANT& Name)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name);
	return result;
}

VARIANT MenuBars::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT MenuBars::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Menu properties

VARIANT Menu::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void Menu::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT Menu::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Menu::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Menu::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Menu::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Menu::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Menu::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Menu::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Menu::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Menu operations

VARIANT Menu::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Menu::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Menu::MenuItems(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x251, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Menus properties

VARIANT Menus::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Menus::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Menus::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Menus::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Menus::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Menus::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Menus operations

VARIANT Menus::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Menus::Add(const VARIANT& Caption, const VARIANT& Before, const VARIANT& Restore)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Caption, &Before, &Restore);
	return result;
}

VARIANT Menus::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Menus::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// MenuItem properties

VARIANT MenuItem::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void MenuItem::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT MenuItem::GetChecked()
{
	VARIANT result;
	GetProperty(0x257, VT_VARIANT, (void*)&result);
	return result;
}

void MenuItem::SetChecked(const VARIANT& propVal)
{
	SetProperty(0x257, VT_VARIANT, &propVal);
}

VARIANT MenuItem::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void MenuItem::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT MenuItem::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void MenuItem::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT MenuItem::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void MenuItem::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT MenuItem::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void MenuItem::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// MenuItem operations

VARIANT MenuItem::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT MenuItem::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// MenuItems properties

VARIANT MenuItems::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void MenuItems::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT MenuItems::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void MenuItems::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT MenuItems::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void MenuItems::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// MenuItems operations

VARIANT MenuItems::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT MenuItems::Add(const VARIANT& Caption, const VARIANT& OnAction, const VARIANT& ShortcutKey, const VARIANT& Before, const VARIANT& Restore)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Caption, &OnAction, &ShortcutKey, &Before, &Restore);
	return result;
}

VARIANT MenuItems::AddMenu(const VARIANT& Caption, const VARIANT& Before, const VARIANT& Restore)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x256, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Caption, &Before, &Restore);
	return result;
}

VARIANT MenuItems::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT MenuItems::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Window properties

VARIANT Window::GetActiveCell()
{
	VARIANT result;
	GetProperty(0x131, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetActiveCell(const VARIANT& propVal)
{
	SetProperty(0x131, VT_VARIANT, &propVal);
}

VARIANT Window::GetActiveChart()
{
	VARIANT result;
	GetProperty(0xb7, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetActiveChart(const VARIANT& propVal)
{
	SetProperty(0xb7, VT_VARIANT, &propVal);
}

VARIANT Window::GetActivePane()
{
	VARIANT result;
	GetProperty(0x282, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetActivePane(const VARIANT& propVal)
{
	SetProperty(0x282, VT_VARIANT, &propVal);
}

VARIANT Window::GetActiveSheet()
{
	VARIANT result;
	GetProperty(0x133, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetActiveSheet(const VARIANT& propVal)
{
	SetProperty(0x133, VT_VARIANT, &propVal);
}

VARIANT Window::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT Window::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Window::GetDisplayFormulas()
{
	VARIANT result;
	GetProperty(0x284, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetDisplayFormulas(const VARIANT& propVal)
{
	SetProperty(0x284, VT_VARIANT, &propVal);
}

VARIANT Window::GetDisplayGridlines()
{
	VARIANT result;
	GetProperty(0x285, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetDisplayGridlines(const VARIANT& propVal)
{
	SetProperty(0x285, VT_VARIANT, &propVal);
}

VARIANT Window::GetDisplayHeadings()
{
	VARIANT result;
	GetProperty(0x286, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetDisplayHeadings(const VARIANT& propVal)
{
	SetProperty(0x286, VT_VARIANT, &propVal);
}

VARIANT Window::GetDisplayHorizontalScrollBar()
{
	VARIANT result;
	GetProperty(0x399, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetDisplayHorizontalScrollBar(const VARIANT& propVal)
{
	SetProperty(0x399, VT_VARIANT, &propVal);
}

VARIANT Window::GetDisplayOutline()
{
	VARIANT result;
	GetProperty(0x287, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetDisplayOutline(const VARIANT& propVal)
{
	SetProperty(0x287, VT_VARIANT, &propVal);
}

VARIANT Window::GetDisplayRightToLeft()
{
	VARIANT result;
	GetProperty(0x288, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetDisplayRightToLeft(const VARIANT& propVal)
{
	SetProperty(0x288, VT_VARIANT, &propVal);
}

VARIANT Window::GetDisplayVerticalScrollBar()
{
	VARIANT result;
	GetProperty(0x39a, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetDisplayVerticalScrollBar(const VARIANT& propVal)
{
	SetProperty(0x39a, VT_VARIANT, &propVal);
}

VARIANT Window::GetDisplayWorkbookTabs()
{
	VARIANT result;
	GetProperty(0x39b, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetDisplayWorkbookTabs(const VARIANT& propVal)
{
	SetProperty(0x39b, VT_VARIANT, &propVal);
}

VARIANT Window::GetDisplayZeros()
{
	VARIANT result;
	GetProperty(0x289, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetDisplayZeros(const VARIANT& propVal)
{
	SetProperty(0x289, VT_VARIANT, &propVal);
}

VARIANT Window::GetFreezePanes()
{
	VARIANT result;
	GetProperty(0x28a, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetFreezePanes(const VARIANT& propVal)
{
	SetProperty(0x28a, VT_VARIANT, &propVal);
}

VARIANT Window::GetGridlineColor()
{
	VARIANT result;
	GetProperty(0x28b, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetGridlineColor(const VARIANT& propVal)
{
	SetProperty(0x28b, VT_VARIANT, &propVal);
}

VARIANT Window::GetGridlineColorIndex()
{
	VARIANT result;
	GetProperty(0x28c, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetGridlineColorIndex(const VARIANT& propVal)
{
	SetProperty(0x28c, VT_VARIANT, &propVal);
}

VARIANT Window::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Window::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Window::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Window::GetOnWindow()
{
	VARIANT result;
	GetProperty(0x26f, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetOnWindow(const VARIANT& propVal)
{
	SetProperty(0x26f, VT_VARIANT, &propVal);
}

VARIANT Window::GetPageSetup()
{
	VARIANT result;
	GetProperty(0x3e6, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetPageSetup(const VARIANT& propVal)
{
	SetProperty(0x3e6, VT_VARIANT, &propVal);
}

VARIANT Window::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Window::GetScrollColumn()
{
	VARIANT result;
	GetProperty(0x28e, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetScrollColumn(const VARIANT& propVal)
{
	SetProperty(0x28e, VT_VARIANT, &propVal);
}

VARIANT Window::GetScrollRow()
{
	VARIANT result;
	GetProperty(0x28f, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetScrollRow(const VARIANT& propVal)
{
	SetProperty(0x28f, VT_VARIANT, &propVal);
}

VARIANT Window::GetSelection()
{
	VARIANT result;
	GetProperty(0x93, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetSelection(const VARIANT& propVal)
{
	SetProperty(0x93, VT_VARIANT, &propVal);
}

VARIANT Window::GetSplit()
{
	VARIANT result;
	GetProperty(0x291, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetSplit(const VARIANT& propVal)
{
	SetProperty(0x291, VT_VARIANT, &propVal);
}

VARIANT Window::GetSplitColumn()
{
	VARIANT result;
	GetProperty(0x292, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetSplitColumn(const VARIANT& propVal)
{
	SetProperty(0x292, VT_VARIANT, &propVal);
}

VARIANT Window::GetSplitHorizontal()
{
	VARIANT result;
	GetProperty(0x293, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetSplitHorizontal(const VARIANT& propVal)
{
	SetProperty(0x293, VT_VARIANT, &propVal);
}

VARIANT Window::GetSplitRow()
{
	VARIANT result;
	GetProperty(0x294, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetSplitRow(const VARIANT& propVal)
{
	SetProperty(0x294, VT_VARIANT, &propVal);
}

VARIANT Window::GetSplitVertical()
{
	VARIANT result;
	GetProperty(0x295, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetSplitVertical(const VARIANT& propVal)
{
	SetProperty(0x295, VT_VARIANT, &propVal);
}

VARIANT Window::GetTabRatio()
{
	VARIANT result;
	GetProperty(0x2a1, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetTabRatio(const VARIANT& propVal)
{
	SetProperty(0x2a1, VT_VARIANT, &propVal);
}

VARIANT Window::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Window::GetType()
{
	VARIANT result;
	GetProperty(0x6c, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetType(const VARIANT& propVal)
{
	SetProperty(0x6c, VT_VARIANT, &propVal);
}

VARIANT Window::GetUsableHeight()
{
	VARIANT result;
	GetProperty(0x185, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetUsableHeight(const VARIANT& propVal)
{
	SetProperty(0x185, VT_VARIANT, &propVal);
}

VARIANT Window::GetUsableWidth()
{
	VARIANT result;
	GetProperty(0x186, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetUsableWidth(const VARIANT& propVal)
{
	SetProperty(0x186, VT_VARIANT, &propVal);
}

VARIANT Window::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Window::GetVisibleRange()
{
	VARIANT result;
	GetProperty(0x45e, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetVisibleRange(const VARIANT& propVal)
{
	SetProperty(0x45e, VT_VARIANT, &propVal);
}

VARIANT Window::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Window::GetWindowNumber()
{
	VARIANT result;
	GetProperty(0x45f, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetWindowNumber(const VARIANT& propVal)
{
	SetProperty(0x45f, VT_VARIANT, &propVal);
}

VARIANT Window::GetWindowState()
{
	VARIANT result;
	GetProperty(0x18c, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetWindowState(const VARIANT& propVal)
{
	SetProperty(0x18c, VT_VARIANT, &propVal);
}

VARIANT Window::GetZoom()
{
	VARIANT result;
	GetProperty(0x297, VT_VARIANT, (void*)&result);
	return result;
}

void Window::SetZoom(const VARIANT& propVal)
{
	SetProperty(0x297, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Window operations

VARIANT Window::Activate()
{
	VARIANT result;
	InvokeHelper(0x130, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Window::ActivateNext()
{
	VARIANT result;
	InvokeHelper(0x45b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Window::ActivatePrevious()
{
	VARIANT result;
	InvokeHelper(0x45c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Window::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Window::Close(const VARIANT& SaveChanges, const VARIANT& Filename, const VARIANT& RouteWorkbook)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x115, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&SaveChanges, &Filename, &RouteWorkbook);
	return result;
}

VARIANT Window::LargeScroll(const VARIANT& Down, const VARIANT& Up, const VARIANT& ToRight, const VARIANT& ToLeft)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x223, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Down, &Up, &ToRight, &ToLeft);
	return result;
}

VARIANT Window::NewWindow()
{
	VARIANT result;
	InvokeHelper(0x118, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Window::Panes(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x28d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Window::PrintOut(const VARIANT& From, const VARIANT& To, const VARIANT& Copies, const VARIANT& Preview)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x389, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&From, &To, &Copies, &Preview);
	return result;
}

VARIANT Window::PrintPreview()
{
	VARIANT result;
	InvokeHelper(0x119, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Window::ScrollWorkbookTabs(const VARIANT& Sheets, const VARIANT& Position)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x296, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Sheets, &Position);
	return result;
}

VARIANT Window::SelectedSheets()
{
	VARIANT result;
	InvokeHelper(0x290, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Window::SetInfoDisplay(const VARIANT& Cell, const VARIANT& Formula, const VARIANT& Value, const VARIANT& Format, const VARIANT& Protection, const VARIANT& Names, const VARIANT& Precedents, const VARIANT& Dependents, const VARIANT& Note)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x413, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Cell, &Formula, &Value, &Format, &Protection, &Names, &Precedents, &Dependents, &Note);
	return result;
}

VARIANT Window::SmallScroll(const VARIANT& Down, const VARIANT& Up, const VARIANT& ToRight, const VARIANT& ToLeft)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x224, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Down, &Up, &ToRight, &ToLeft);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Windows properties

VARIANT Windows::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Windows::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Windows::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Windows::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Windows::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Windows::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Windows operations

VARIANT Windows::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Windows::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Windows::Arrange(const VARIANT& ArrangeStyle, const VARIANT& ActiveWorkbook, const VARIANT& SyncHorizontal, const VARIANT& SyncVertical)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x27e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&ArrangeStyle, &ActiveWorkbook, &SyncHorizontal, &SyncVertical);
	return result;
}

VARIANT Windows::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Pane properties

VARIANT Pane::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Pane::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Pane::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Pane::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Pane::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Pane::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Pane::GetScrollColumn()
{
	VARIANT result;
	GetProperty(0x28e, VT_VARIANT, (void*)&result);
	return result;
}

void Pane::SetScrollColumn(const VARIANT& propVal)
{
	SetProperty(0x28e, VT_VARIANT, &propVal);
}

VARIANT Pane::GetScrollRow()
{
	VARIANT result;
	GetProperty(0x28f, VT_VARIANT, (void*)&result);
	return result;
}

void Pane::SetScrollRow(const VARIANT& propVal)
{
	SetProperty(0x28f, VT_VARIANT, &propVal);
}

VARIANT Pane::GetVisibleRange()
{
	VARIANT result;
	GetProperty(0x45e, VT_VARIANT, (void*)&result);
	return result;
}

void Pane::SetVisibleRange(const VARIANT& propVal)
{
	SetProperty(0x45e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Pane operations

VARIANT Pane::Activate()
{
	VARIANT result;
	InvokeHelper(0x130, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Pane::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Pane::LargeScroll(const VARIANT& Down, const VARIANT& Up, const VARIANT& ToRight, const VARIANT& ToLeft)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x223, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Down, &Up, &ToRight, &ToLeft);
	return result;
}

VARIANT Pane::SmallScroll(const VARIANT& Down, const VARIANT& Up, const VARIANT& ToRight, const VARIANT& ToLeft)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x224, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Down, &Up, &ToRight, &ToLeft);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Panes properties

VARIANT Panes::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Panes::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Panes::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Panes::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Panes::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Panes::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Panes operations

VARIANT Panes::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Panes::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Name properties

VARIANT Name::GetCategory()
{
	VARIANT result;
	GetProperty(0x3a6, VT_VARIANT, (void*)&result);
	return result;
}

void Name::SetCategory(const VARIANT& propVal)
{
	SetProperty(0x3a6, VT_VARIANT, &propVal);
}

VARIANT Name::GetCategoryLocal()
{
	VARIANT result;
	GetProperty(0x3a7, VT_VARIANT, (void*)&result);
	return result;
}

void Name::SetCategoryLocal(const VARIANT& propVal)
{
	SetProperty(0x3a7, VT_VARIANT, &propVal);
}

VARIANT Name::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Name::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Name::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Name::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Name::GetMacroType()
{
	VARIANT result;
	GetProperty(0x3a8, VT_VARIANT, (void*)&result);
	return result;
}

void Name::SetMacroType(const VARIANT& propVal)
{
	SetProperty(0x3a8, VT_VARIANT, &propVal);
}

VARIANT Name::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Name::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Name::GetNameLocal()
{
	VARIANT result;
	GetProperty(0x3a9, VT_VARIANT, (void*)&result);
	return result;
}

void Name::SetNameLocal(const VARIANT& propVal)
{
	SetProperty(0x3a9, VT_VARIANT, &propVal);
}

VARIANT Name::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Name::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Name::GetRefersTo()
{
	VARIANT result;
	GetProperty(0x3aa, VT_VARIANT, (void*)&result);
	return result;
}

void Name::SetRefersTo(const VARIANT& propVal)
{
	SetProperty(0x3aa, VT_VARIANT, &propVal);
}

VARIANT Name::GetRefersToLocal()
{
	VARIANT result;
	GetProperty(0x3ab, VT_VARIANT, (void*)&result);
	return result;
}

void Name::SetRefersToLocal(const VARIANT& propVal)
{
	SetProperty(0x3ab, VT_VARIANT, &propVal);
}

VARIANT Name::GetRefersToR1C1()
{
	VARIANT result;
	GetProperty(0x3ac, VT_VARIANT, (void*)&result);
	return result;
}

void Name::SetRefersToR1C1(const VARIANT& propVal)
{
	SetProperty(0x3ac, VT_VARIANT, &propVal);
}

VARIANT Name::GetRefersToR1C1Local()
{
	VARIANT result;
	GetProperty(0x3ad, VT_VARIANT, (void*)&result);
	return result;
}

void Name::SetRefersToR1C1Local(const VARIANT& propVal)
{
	SetProperty(0x3ad, VT_VARIANT, &propVal);
}

VARIANT Name::GetShortcutKey()
{
	VARIANT result;
	GetProperty(0x255, VT_VARIANT, (void*)&result);
	return result;
}

void Name::SetShortcutKey(const VARIANT& propVal)
{
	SetProperty(0x255, VT_VARIANT, &propVal);
}

VARIANT Name::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void Name::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT Name::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Name::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Name operations

VARIANT Name::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Name::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Names properties

VARIANT Names::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Names::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Names::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Names::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Names::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Names::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Names operations

VARIANT Names::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Names::Add(const VARIANT& Name, const VARIANT& RefersTo, const VARIANT& Visible, const VARIANT& MacroType, const VARIANT& ShortcutKey, const VARIANT& Category, const VARIANT& NameLocal, const VARIANT& RefersToLocal, 
		const VARIANT& CategoryLocal, const VARIANT& RefersToR1C1, const VARIANT& RefersToR1C1Local)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name, &RefersTo, &Visible, &MacroType, &ShortcutKey, &Category, &NameLocal, &RefersToLocal, &CategoryLocal, &RefersToR1C1, &RefersToR1C1Local);
	return result;
}

VARIANT Names::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Names::Item(const VARIANT& Index, const VARIANT& IndexLocal, const VARIANT& RefersTo)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index, &IndexLocal, &RefersTo);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// DrawingObjects properties

VARIANT DrawingObjects::GetAccelerator()
{
	VARIANT result;
	GetProperty(0x34e, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetAccelerator(const VARIANT& propVal)
{
	SetProperty(0x34e, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetAddIndent()
{
	VARIANT result;
	GetProperty(0x427, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetAddIndent(const VARIANT& propVal)
{
	SetProperty(0x427, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetArrowHeadLength()
{
	VARIANT result;
	GetProperty(0x263, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetArrowHeadLength(const VARIANT& propVal)
{
	SetProperty(0x263, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetArrowHeadStyle()
{
	VARIANT result;
	GetProperty(0x264, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetArrowHeadStyle(const VARIANT& propVal)
{
	SetProperty(0x264, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetArrowHeadWidth()
{
	VARIANT result;
	GetProperty(0x265, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetArrowHeadWidth(const VARIANT& propVal)
{
	SetProperty(0x265, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetAutoSize()
{
	VARIANT result;
	GetProperty(0x266, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetAutoSize(const VARIANT& propVal)
{
	SetProperty(0x266, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetCancelButton()
{
	VARIANT result;
	GetProperty(0x35a, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetCancelButton(const VARIANT& propVal)
{
	SetProperty(0x35a, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetDefaultButton()
{
	VARIANT result;
	GetProperty(0x359, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetDefaultButton(const VARIANT& propVal)
{
	SetProperty(0x359, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetDismissButton()
{
	VARIANT result;
	GetProperty(0x35b, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetDismissButton(const VARIANT& propVal)
{
	SetProperty(0x35b, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetDisplay3DShading()
{
	VARIANT result;
	GetProperty(0x462, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetDisplay3DShading(const VARIANT& propVal)
{
	SetProperty(0x462, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetDisplayVerticalScrollBar()
{
	VARIANT result;
	GetProperty(0x39a, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetDisplayVerticalScrollBar(const VARIANT& propVal)
{
	SetProperty(0x39a, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetDropDownLines()
{
	VARIANT result;
	GetProperty(0x350, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetDropDownLines(const VARIANT& propVal)
{
	SetProperty(0x350, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetHelpButton()
{
	VARIANT result;
	GetProperty(0x35c, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetHelpButton(const VARIANT& propVal)
{
	SetProperty(0x35c, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetHorizontalAlignment()
{
	VARIANT result;
	GetProperty(0x88, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetHorizontalAlignment(const VARIANT& propVal)
{
	SetProperty(0x88, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetInputType()
{
	VARIANT result;
	GetProperty(0x356, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetInputType(const VARIANT& propVal)
{
	SetProperty(0x356, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetLargeChange()
{
	VARIANT result;
	GetProperty(0x34d, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetLargeChange(const VARIANT& propVal)
{
	SetProperty(0x34d, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetLinkedCell()
{
	VARIANT result;
	GetProperty(0x422, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetLinkedCell(const VARIANT& propVal)
{
	SetProperty(0x422, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetList()
{
	VARIANT result;
	GetProperty(0x35d, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetList(const VARIANT& propVal)
{
	SetProperty(0x35d, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetListFillRange()
{
	VARIANT result;
	GetProperty(0x34f, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetListFillRange(const VARIANT& propVal)
{
	SetProperty(0x34f, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetListIndex()
{
	VARIANT result;
	GetProperty(0x352, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetListIndex(const VARIANT& propVal)
{
	SetProperty(0x352, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetLockedText()
{
	VARIANT result;
	GetProperty(0x268, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetLockedText(const VARIANT& propVal)
{
	SetProperty(0x268, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetMax()
{
	VARIANT result;
	GetProperty(0x34a, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetMax(const VARIANT& propVal)
{
	SetProperty(0x34a, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetMin()
{
	VARIANT result;
	GetProperty(0x34b, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetMin(const VARIANT& propVal)
{
	SetProperty(0x34b, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetMultiLine()
{
	VARIANT result;
	GetProperty(0x357, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetMultiLine(const VARIANT& propVal)
{
	SetProperty(0x357, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetMultiSelect()
{
	VARIANT result;
	GetProperty(0x20, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetMultiSelect(const VARIANT& propVal)
{
	SetProperty(0x20, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetPhoneticAccelerator()
{
	VARIANT result;
	GetProperty(0x461, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetPhoneticAccelerator(const VARIANT& propVal)
{
	SetProperty(0x461, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetRoundedCorners()
{
	VARIANT result;
	GetProperty(0x26b, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetRoundedCorners(const VARIANT& propVal)
{
	SetProperty(0x26b, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetSelected()
{
	VARIANT result;
	GetProperty(0x463, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetSelected(const VARIANT& propVal)
{
	SetProperty(0x463, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetSmallChange()
{
	VARIANT result;
	GetProperty(0x34c, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetSmallChange(const VARIANT& propVal)
{
	SetProperty(0x34c, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetVerticalAlignment()
{
	VARIANT result;
	GetProperty(0x89, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetVerticalAlignment(const VARIANT& propVal)
{
	SetProperty(0x89, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetVertices()
{
	VARIANT result;
	GetProperty(0x26d, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetVertices(const VARIANT& propVal)
{
	SetProperty(0x26d, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT DrawingObjects::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void DrawingObjects::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// DrawingObjects operations

VARIANT DrawingObjects::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DrawingObjects::AddItem(const VARIANT& Text, const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x353, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Text, &Index);
	return result;
}

VARIANT DrawingObjects::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DrawingObjects::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DrawingObjects::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT DrawingObjects::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT DrawingObjects::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DrawingObjects::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT DrawingObjects::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DrawingObjects::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DrawingObjects::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DrawingObjects::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DrawingObjects::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DrawingObjects::LinkCombo(const VARIANT& Link)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x358, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Link);
	return result;
}

VARIANT DrawingObjects::RemoveAllItems()
{
	VARIANT result;
	InvokeHelper(0x355, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DrawingObjects::RemoveItem(const VARIANT& Index, const VARIANT& Count)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x354, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index, &Count);
	return result;
}

VARIANT DrawingObjects::Reshape(const VARIANT& Vertex, const VARIANT& Insert, const VARIANT& Left, const VARIANT& Top)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Vertex, &Insert, &Left, &Top);
	return result;
}

VARIANT DrawingObjects::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT DrawingObjects::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DrawingObjects::Ungroup()
{
	VARIANT result;
	InvokeHelper(0xf4, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// GroupObject properties

VARIANT GroupObject::GetAddIndent()
{
	VARIANT result;
	GetProperty(0x427, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetAddIndent(const VARIANT& propVal)
{
	SetProperty(0x427, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetArrowHeadLength()
{
	VARIANT result;
	GetProperty(0x263, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetArrowHeadLength(const VARIANT& propVal)
{
	SetProperty(0x263, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetArrowHeadStyle()
{
	VARIANT result;
	GetProperty(0x264, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetArrowHeadStyle(const VARIANT& propVal)
{
	SetProperty(0x264, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetArrowHeadWidth()
{
	VARIANT result;
	GetProperty(0x265, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetArrowHeadWidth(const VARIANT& propVal)
{
	SetProperty(0x265, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetAutoSize()
{
	VARIANT result;
	GetProperty(0x266, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetAutoSize(const VARIANT& propVal)
{
	SetProperty(0x266, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetHorizontalAlignment()
{
	VARIANT result;
	GetProperty(0x88, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetHorizontalAlignment(const VARIANT& propVal)
{
	SetProperty(0x88, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetRoundedCorners()
{
	VARIANT result;
	GetProperty(0x26b, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetRoundedCorners(const VARIANT& propVal)
{
	SetProperty(0x26b, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetVerticalAlignment()
{
	VARIANT result;
	GetProperty(0x89, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetVerticalAlignment(const VARIANT& propVal)
{
	SetProperty(0x89, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT GroupObject::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObject::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// GroupObject operations

VARIANT GroupObject::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObject::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObject::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT GroupObject::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObject::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT GroupObject::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObject::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObject::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObject::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT GroupObject::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObject::Ungroup()
{
	VARIANT result;
	InvokeHelper(0xf4, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// GroupObjects properties

VARIANT GroupObjects::GetAddIndent()
{
	VARIANT result;
	GetProperty(0x427, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetAddIndent(const VARIANT& propVal)
{
	SetProperty(0x427, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetArrowHeadLength()
{
	VARIANT result;
	GetProperty(0x263, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetArrowHeadLength(const VARIANT& propVal)
{
	SetProperty(0x263, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetArrowHeadStyle()
{
	VARIANT result;
	GetProperty(0x264, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetArrowHeadStyle(const VARIANT& propVal)
{
	SetProperty(0x264, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetArrowHeadWidth()
{
	VARIANT result;
	GetProperty(0x265, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetArrowHeadWidth(const VARIANT& propVal)
{
	SetProperty(0x265, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetAutoSize()
{
	VARIANT result;
	GetProperty(0x266, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetAutoSize(const VARIANT& propVal)
{
	SetProperty(0x266, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetHorizontalAlignment()
{
	VARIANT result;
	GetProperty(0x88, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetHorizontalAlignment(const VARIANT& propVal)
{
	SetProperty(0x88, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetRoundedCorners()
{
	VARIANT result;
	GetProperty(0x26b, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetRoundedCorners(const VARIANT& propVal)
{
	SetProperty(0x26b, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetVerticalAlignment()
{
	VARIANT result;
	GetProperty(0x89, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetVerticalAlignment(const VARIANT& propVal)
{
	SetProperty(0x89, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT GroupObjects::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupObjects::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// GroupObjects operations

VARIANT GroupObjects::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObjects::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObjects::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObjects::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT GroupObjects::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObjects::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT GroupObjects::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObjects::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObjects::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObjects::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObjects::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT GroupObjects::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT GroupObjects::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupObjects::Ungroup()
{
	VARIANT result;
	InvokeHelper(0xf4, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Line properties

VARIANT Line::GetArrowHeadLength()
{
	VARIANT result;
	GetProperty(0x263, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetArrowHeadLength(const VARIANT& propVal)
{
	SetProperty(0x263, VT_VARIANT, &propVal);
}

VARIANT Line::GetArrowHeadStyle()
{
	VARIANT result;
	GetProperty(0x264, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetArrowHeadStyle(const VARIANT& propVal)
{
	SetProperty(0x264, VT_VARIANT, &propVal);
}

VARIANT Line::GetArrowHeadWidth()
{
	VARIANT result;
	GetProperty(0x265, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetArrowHeadWidth(const VARIANT& propVal)
{
	SetProperty(0x265, VT_VARIANT, &propVal);
}

VARIANT Line::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Line::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT Line::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Line::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Line::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Line::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Line::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Line::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Line::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Line::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Line::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Line::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Line::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Line::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Line::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT Line::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Line::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Line::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Line::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Line operations

VARIANT Line::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Line::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Line::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Line::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Line::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Line::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Line::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Line::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Line::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Lines properties

VARIANT Lines::GetArrowHeadLength()
{
	VARIANT result;
	GetProperty(0x263, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetArrowHeadLength(const VARIANT& propVal)
{
	SetProperty(0x263, VT_VARIANT, &propVal);
}

VARIANT Lines::GetArrowHeadStyle()
{
	VARIANT result;
	GetProperty(0x264, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetArrowHeadStyle(const VARIANT& propVal)
{
	SetProperty(0x264, VT_VARIANT, &propVal);
}

VARIANT Lines::GetArrowHeadWidth()
{
	VARIANT result;
	GetProperty(0x265, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetArrowHeadWidth(const VARIANT& propVal)
{
	SetProperty(0x265, VT_VARIANT, &propVal);
}

VARIANT Lines::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Lines::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Lines::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Lines::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Lines::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Lines::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Lines::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Lines::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Lines::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Lines::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Lines::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Lines::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Lines::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Lines::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Lines::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Lines::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Lines operations

VARIANT Lines::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Lines::Add(const VARIANT& X1, const VARIANT& Y1, const VARIANT& X2, const VARIANT& Y2)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&X1, &Y1, &X2, &Y2);
	return result;
}

VARIANT Lines::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Lines::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Lines::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Lines::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Lines::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Lines::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Lines::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Lines::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Lines::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Lines::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Lines::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Rectangle properties

VARIANT Rectangle::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetRoundedCorners()
{
	VARIANT result;
	GetProperty(0x26b, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetRoundedCorners(const VARIANT& propVal)
{
	SetProperty(0x26b, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Rectangle::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangle::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Rectangle operations

VARIANT Rectangle::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Rectangle::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Rectangle::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Rectangle::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Rectangle::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Rectangle::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Rectangle::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Rectangle::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Rectangle::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Rectangles properties

VARIANT Rectangles::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetRoundedCorners()
{
	VARIANT result;
	GetProperty(0x26b, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetRoundedCorners(const VARIANT& propVal)
{
	SetProperty(0x26b, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Rectangles::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Rectangles::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Rectangles operations

VARIANT Rectangles::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Rectangles::Add(const VARIANT& Left, const VARIANT& Top, const VARIANT& Width, const VARIANT& Height)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top, &Width, &Height);
	return result;
}

VARIANT Rectangles::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Rectangles::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Rectangles::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Rectangles::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Rectangles::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Rectangles::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Rectangles::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Rectangles::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Rectangles::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Rectangles::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Rectangles::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Oval properties

VARIANT Oval::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Oval::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT Oval::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Oval::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Oval::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Oval::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Oval::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Oval::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Oval::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Oval::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Oval::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Oval::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Oval::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Oval::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Oval::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT Oval::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Oval::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT Oval::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Oval::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Oval::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Oval::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Oval operations

VARIANT Oval::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Oval::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Oval::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Oval::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Oval::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Oval::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Oval::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Oval::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Oval::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Ovals properties

VARIANT Ovals::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Ovals::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Ovals::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Ovals operations

VARIANT Ovals::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Ovals::Add(const VARIANT& Left, const VARIANT& Top, const VARIANT& Width, const VARIANT& Height)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top, &Width, &Height);
	return result;
}

VARIANT Ovals::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Ovals::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Ovals::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Ovals::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Ovals::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Ovals::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Ovals::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Ovals::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Ovals::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Ovals::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Ovals::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Arc properties

VARIANT Arc::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Arc::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT Arc::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Arc::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Arc::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Arc::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Arc::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Arc::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Arc::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Arc::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Arc::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Arc::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Arc::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Arc::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Arc::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Arc::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT Arc::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Arc::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Arc::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Arc::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Arc operations

VARIANT Arc::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Arc::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Arc::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Arc::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Arc::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Arc::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Arc::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Arc::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Arc::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Arcs properties

VARIANT Arcs::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Arcs::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Arcs::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Arcs::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Arcs::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Arcs::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Arcs::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Arcs::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Arcs::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Arcs::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Arcs::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Arcs::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Arcs::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Arcs::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Arcs::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Arcs::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Arcs::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Arcs operations

VARIANT Arcs::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Arcs::Add(const VARIANT& X1, const VARIANT& Y1, const VARIANT& X2, const VARIANT& Y2)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&X1, &Y1, &X2, &Y2);
	return result;
}

VARIANT Arcs::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Arcs::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Arcs::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Arcs::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Arcs::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Arcs::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Arcs::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Arcs::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Arcs::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Arcs::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Arcs::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// TextBox properties

VARIANT TextBox::GetAddIndent()
{
	VARIANT result;
	GetProperty(0x427, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetAddIndent(const VARIANT& propVal)
{
	SetProperty(0x427, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetAutoSize()
{
	VARIANT result;
	GetProperty(0x266, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetAutoSize(const VARIANT& propVal)
{
	SetProperty(0x266, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetFormula()
{
	VARIANT result;
	GetProperty(0x105, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetFormula(const VARIANT& propVal)
{
	SetProperty(0x105, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetHorizontalAlignment()
{
	VARIANT result;
	GetProperty(0x88, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetHorizontalAlignment(const VARIANT& propVal)
{
	SetProperty(0x88, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetLockedText()
{
	VARIANT result;
	GetProperty(0x268, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetLockedText(const VARIANT& propVal)
{
	SetProperty(0x268, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetRoundedCorners()
{
	VARIANT result;
	GetProperty(0x26b, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetRoundedCorners(const VARIANT& propVal)
{
	SetProperty(0x26b, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetVerticalAlignment()
{
	VARIANT result;
	GetProperty(0x89, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetVerticalAlignment(const VARIANT& propVal)
{
	SetProperty(0x89, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT TextBox::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void TextBox::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// TextBox operations

VARIANT TextBox::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TextBox::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TextBox::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT TextBox::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT TextBox::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TextBox::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT TextBox::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TextBox::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TextBox::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TextBox::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT TextBox::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// TextBoxes properties

VARIANT TextBoxes::GetAddIndent()
{
	VARIANT result;
	GetProperty(0x427, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetAddIndent(const VARIANT& propVal)
{
	SetProperty(0x427, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetAutoSize()
{
	VARIANT result;
	GetProperty(0x266, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetAutoSize(const VARIANT& propVal)
{
	SetProperty(0x266, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetFormula()
{
	VARIANT result;
	GetProperty(0x105, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetFormula(const VARIANT& propVal)
{
	SetProperty(0x105, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetHorizontalAlignment()
{
	VARIANT result;
	GetProperty(0x88, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetHorizontalAlignment(const VARIANT& propVal)
{
	SetProperty(0x88, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetLockedText()
{
	VARIANT result;
	GetProperty(0x268, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetLockedText(const VARIANT& propVal)
{
	SetProperty(0x268, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetRoundedCorners()
{
	VARIANT result;
	GetProperty(0x26b, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetRoundedCorners(const VARIANT& propVal)
{
	SetProperty(0x26b, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetVerticalAlignment()
{
	VARIANT result;
	GetProperty(0x89, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetVerticalAlignment(const VARIANT& propVal)
{
	SetProperty(0x89, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT TextBoxes::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void TextBoxes::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// TextBoxes operations

VARIANT TextBoxes::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TextBoxes::Add(const VARIANT& Left, const VARIANT& Top, const VARIANT& Width, const VARIANT& Height)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top, &Width, &Height);
	return result;
}

VARIANT TextBoxes::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TextBoxes::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TextBoxes::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT TextBoxes::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT TextBoxes::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TextBoxes::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT TextBoxes::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TextBoxes::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TextBoxes::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TextBoxes::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TextBoxes::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT TextBoxes::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT TextBoxes::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Picture properties

VARIANT Picture::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Picture::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT Picture::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Picture::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Picture::GetFormula()
{
	VARIANT result;
	GetProperty(0x105, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetFormula(const VARIANT& propVal)
{
	SetProperty(0x105, VT_VARIANT, &propVal);
}

VARIANT Picture::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Picture::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Picture::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Picture::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Picture::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Picture::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Picture::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Picture::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Picture::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Picture::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Picture::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT Picture::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Picture::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT Picture::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Picture::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Picture::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Picture::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Picture operations

VARIANT Picture::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Picture::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Picture::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Picture::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Picture::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Picture::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Picture::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Picture::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Picture::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Pictures properties

VARIANT Pictures::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetFormula()
{
	VARIANT result;
	GetProperty(0x105, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetFormula(const VARIANT& propVal)
{
	SetProperty(0x105, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Pictures::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Pictures::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Pictures operations

VARIANT Pictures::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Pictures::Add(const VARIANT& Left, const VARIANT& Top, const VARIANT& Width, const VARIANT& Height)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top, &Width, &Height);
	return result;
}

VARIANT Pictures::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Pictures::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Pictures::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Pictures::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Pictures::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Pictures::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Pictures::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Pictures::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Pictures::Insert(const VARIANT& Filename, const VARIANT& Converter)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xfc, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Filename, &Converter);
	return result;
}

VARIANT Pictures::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Pictures::Paste(const VARIANT& Link)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xd3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Link);
	return result;
}

VARIANT Pictures::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Pictures::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// OLEObject properties

VARIANT OLEObject::GetAutoUpdate()
{
	VARIANT result;
	GetProperty(0x418, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetAutoUpdate(const VARIANT& propVal)
{
	SetProperty(0x418, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetObject()
{
	VARIANT result;
	GetProperty(0x419, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetObject(const VARIANT& propVal)
{
	SetProperty(0x419, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetOLEType()
{
	VARIANT result;
	GetProperty(0x41e, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetOLEType(const VARIANT& propVal)
{
	SetProperty(0x41e, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT OLEObject::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObject::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// OLEObject operations

VARIANT OLEObject::Activate()
{
	VARIANT result;
	InvokeHelper(0x130, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObject::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObject::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObject::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObject::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT OLEObject::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObject::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObject::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObject::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT OLEObject::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObject::Update()
{
	VARIANT result;
	InvokeHelper(0x2a8, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObject::Verb(const VARIANT& Verb)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x25e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Verb);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// OLEObjects properties

VARIANT OLEObjects::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT OLEObjects::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void OLEObjects::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// OLEObjects operations

VARIANT OLEObjects::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObjects::Add(const VARIANT& ClassType, const VARIANT& Filename, const VARIANT& Link, const VARIANT& DisplayAsIcon, const VARIANT& IconFileName, const VARIANT& IconIndex, const VARIANT& IconLabel)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&ClassType, &Filename, &Link, &DisplayAsIcon, &IconFileName, &IconIndex, &IconLabel);
	return result;
}

VARIANT OLEObjects::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObjects::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObjects::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObjects::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT OLEObjects::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObjects::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObjects::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObjects::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OLEObjects::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT OLEObjects::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT OLEObjects::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// ChartObject properties

VARIANT ChartObject::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetChart()
{
	VARIANT result;
	GetProperty(0x7, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetChart(const VARIANT& propVal)
{
	SetProperty(0x7, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetRoundedCorners()
{
	VARIANT result;
	GetProperty(0x26b, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetRoundedCorners(const VARIANT& propVal)
{
	SetProperty(0x26b, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT ChartObject::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObject::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// ChartObject operations

VARIANT ChartObject::Activate()
{
	VARIANT result;
	InvokeHelper(0x130, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartObject::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartObject::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartObject::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartObject::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT ChartObject::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartObject::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartObject::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartObject::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT ChartObject::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// ChartObjects properties

VARIANT ChartObjects::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetRoundedCorners()
{
	VARIANT result;
	GetProperty(0x26b, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetRoundedCorners(const VARIANT& propVal)
{
	SetProperty(0x26b, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT ChartObjects::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void ChartObjects::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// ChartObjects operations

VARIANT ChartObjects::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartObjects::Add(const VARIANT& Left, const VARIANT& Top, const VARIANT& Width, const VARIANT& Height)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top, &Width, &Height);
	return result;
}

VARIANT ChartObjects::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartObjects::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartObjects::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartObjects::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT ChartObjects::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartObjects::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartObjects::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartObjects::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartObjects::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT ChartObjects::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT ChartObjects::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Drawing properties

VARIANT Drawing::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetVertices()
{
	VARIANT result;
	GetProperty(0x26d, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetVertices(const VARIANT& propVal)
{
	SetProperty(0x26d, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Drawing::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Drawing::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Drawing operations

VARIANT Drawing::AddVertex(const VARIANT& Left, const VARIANT& Top)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x259, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top);
	return result;
}

VARIANT Drawing::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Drawing::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Drawing::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Drawing::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Drawing::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Drawing::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Drawing::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Drawing::Reshape(const VARIANT& Vertex, const VARIANT& Insert, const VARIANT& Left, const VARIANT& Top)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Vertex, &Insert, &Left, &Top);
	return result;
}

VARIANT Drawing::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Drawing::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Drawings properties

VARIANT Drawings::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Drawings::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Drawings::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Drawings operations

VARIANT Drawings::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Drawings::Add(const VARIANT& X1, const VARIANT& Y1, const VARIANT& X2, const VARIANT& Y2, const VARIANT& Closed)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&X1, &Y1, &X2, &Y2, &Closed);
	return result;
}

VARIANT Drawings::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Drawings::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Drawings::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Drawings::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Drawings::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Drawings::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Drawings::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Drawings::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Drawings::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Drawings::Reshape(const VARIANT& Vertex, const VARIANT& Insert, const VARIANT& Left, const VARIANT& Top)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Vertex, &Insert, &Left, &Top);
	return result;
}

VARIANT Drawings::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Drawings::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Button properties

VARIANT Button::GetAccelerator()
{
	VARIANT result;
	GetProperty(0x34e, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetAccelerator(const VARIANT& propVal)
{
	SetProperty(0x34e, VT_VARIANT, &propVal);
}

VARIANT Button::GetAddIndent()
{
	VARIANT result;
	GetProperty(0x427, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetAddIndent(const VARIANT& propVal)
{
	SetProperty(0x427, VT_VARIANT, &propVal);
}

VARIANT Button::GetAutoSize()
{
	VARIANT result;
	GetProperty(0x266, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetAutoSize(const VARIANT& propVal)
{
	SetProperty(0x266, VT_VARIANT, &propVal);
}

VARIANT Button::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT Button::GetCancelButton()
{
	VARIANT result;
	GetProperty(0x35a, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetCancelButton(const VARIANT& propVal)
{
	SetProperty(0x35a, VT_VARIANT, &propVal);
}

VARIANT Button::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT Button::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Button::GetDefaultButton()
{
	VARIANT result;
	GetProperty(0x359, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetDefaultButton(const VARIANT& propVal)
{
	SetProperty(0x359, VT_VARIANT, &propVal);
}

VARIANT Button::GetDismissButton()
{
	VARIANT result;
	GetProperty(0x35b, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetDismissButton(const VARIANT& propVal)
{
	SetProperty(0x35b, VT_VARIANT, &propVal);
}

VARIANT Button::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Button::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT Button::GetFormula()
{
	VARIANT result;
	GetProperty(0x105, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetFormula(const VARIANT& propVal)
{
	SetProperty(0x105, VT_VARIANT, &propVal);
}

VARIANT Button::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Button::GetHelpButton()
{
	VARIANT result;
	GetProperty(0x35c, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetHelpButton(const VARIANT& propVal)
{
	SetProperty(0x35c, VT_VARIANT, &propVal);
}

VARIANT Button::GetHorizontalAlignment()
{
	VARIANT result;
	GetProperty(0x88, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetHorizontalAlignment(const VARIANT& propVal)
{
	SetProperty(0x88, VT_VARIANT, &propVal);
}

VARIANT Button::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Button::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Button::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Button::GetLockedText()
{
	VARIANT result;
	GetProperty(0x268, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetLockedText(const VARIANT& propVal)
{
	SetProperty(0x268, VT_VARIANT, &propVal);
}

VARIANT Button::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Button::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Button::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT Button::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Button::GetPhoneticAccelerator()
{
	VARIANT result;
	GetProperty(0x461, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetPhoneticAccelerator(const VARIANT& propVal)
{
	SetProperty(0x461, VT_VARIANT, &propVal);
}

VARIANT Button::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Button::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Button::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT Button::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Button::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT Button::GetVerticalAlignment()
{
	VARIANT result;
	GetProperty(0x89, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetVerticalAlignment(const VARIANT& propVal)
{
	SetProperty(0x89, VT_VARIANT, &propVal);
}

VARIANT Button::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Button::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Button::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Button::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Button operations

VARIANT Button::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Button::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Button::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT Button::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT Button::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Button::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Button::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Button::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Button::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Button::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Button::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Buttons properties

VARIANT Buttons::GetAccelerator()
{
	VARIANT result;
	GetProperty(0x34e, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetAccelerator(const VARIANT& propVal)
{
	SetProperty(0x34e, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetAddIndent()
{
	VARIANT result;
	GetProperty(0x427, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetAddIndent(const VARIANT& propVal)
{
	SetProperty(0x427, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetAutoSize()
{
	VARIANT result;
	GetProperty(0x266, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetAutoSize(const VARIANT& propVal)
{
	SetProperty(0x266, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetCancelButton()
{
	VARIANT result;
	GetProperty(0x35a, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetCancelButton(const VARIANT& propVal)
{
	SetProperty(0x35a, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetDefaultButton()
{
	VARIANT result;
	GetProperty(0x359, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetDefaultButton(const VARIANT& propVal)
{
	SetProperty(0x359, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetDismissButton()
{
	VARIANT result;
	GetProperty(0x35b, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetDismissButton(const VARIANT& propVal)
{
	SetProperty(0x35b, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetFormula()
{
	VARIANT result;
	GetProperty(0x105, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetFormula(const VARIANT& propVal)
{
	SetProperty(0x105, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetHelpButton()
{
	VARIANT result;
	GetProperty(0x35c, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetHelpButton(const VARIANT& propVal)
{
	SetProperty(0x35c, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetHorizontalAlignment()
{
	VARIANT result;
	GetProperty(0x88, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetHorizontalAlignment(const VARIANT& propVal)
{
	SetProperty(0x88, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetLockedText()
{
	VARIANT result;
	GetProperty(0x268, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetLockedText(const VARIANT& propVal)
{
	SetProperty(0x268, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetPhoneticAccelerator()
{
	VARIANT result;
	GetProperty(0x461, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetPhoneticAccelerator(const VARIANT& propVal)
{
	SetProperty(0x461, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetVerticalAlignment()
{
	VARIANT result;
	GetProperty(0x89, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetVerticalAlignment(const VARIANT& propVal)
{
	SetProperty(0x89, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Buttons::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Buttons::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Buttons operations

VARIANT Buttons::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Buttons::Add(const VARIANT& Left, const VARIANT& Top, const VARIANT& Width, const VARIANT& Height)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top, &Width, &Height);
	return result;
}

VARIANT Buttons::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Buttons::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Buttons::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT Buttons::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT Buttons::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Buttons::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Buttons::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Buttons::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Buttons::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Buttons::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Buttons::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Buttons::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Buttons::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// EditBox properties

VARIANT EditBox::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetDisplayVerticalScrollBar()
{
	VARIANT result;
	GetProperty(0x39a, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetDisplayVerticalScrollBar(const VARIANT& propVal)
{
	SetProperty(0x39a, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetInputType()
{
	VARIANT result;
	GetProperty(0x356, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetInputType(const VARIANT& propVal)
{
	SetProperty(0x356, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetLinkedObject()
{
	VARIANT result;
	GetProperty(0x35e, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetLinkedObject(const VARIANT& propVal)
{
	SetProperty(0x35e, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetMultiLine()
{
	VARIANT result;
	GetProperty(0x357, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetMultiLine(const VARIANT& propVal)
{
	SetProperty(0x357, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT EditBox::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void EditBox::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// EditBox operations

VARIANT EditBox::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT EditBox::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT EditBox::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT EditBox::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT EditBox::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT EditBox::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT EditBox::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT EditBox::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT EditBox::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT EditBox::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// EditBoxes properties

VARIANT EditBoxes::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetDisplayVerticalScrollBar()
{
	VARIANT result;
	GetProperty(0x39a, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetDisplayVerticalScrollBar(const VARIANT& propVal)
{
	SetProperty(0x39a, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetInputType()
{
	VARIANT result;
	GetProperty(0x356, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetInputType(const VARIANT& propVal)
{
	SetProperty(0x356, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetMultiLine()
{
	VARIANT result;
	GetProperty(0x357, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetMultiLine(const VARIANT& propVal)
{
	SetProperty(0x357, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT EditBoxes::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void EditBoxes::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// EditBoxes operations

VARIANT EditBoxes::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT EditBoxes::Add(const VARIANT& Left, const VARIANT& Top, const VARIANT& Width, const VARIANT& Height)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top, &Width, &Height);
	return result;
}

VARIANT EditBoxes::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT EditBoxes::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT EditBoxes::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT EditBoxes::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT EditBoxes::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT EditBoxes::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT EditBoxes::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT EditBoxes::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT EditBoxes::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT EditBoxes::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT EditBoxes::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT EditBoxes::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// CheckBox properties

VARIANT CheckBox::GetAccelerator()
{
	VARIANT result;
	GetProperty(0x34e, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetAccelerator(const VARIANT& propVal)
{
	SetProperty(0x34e, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetDisplay3DShading()
{
	VARIANT result;
	GetProperty(0x462, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetDisplay3DShading(const VARIANT& propVal)
{
	SetProperty(0x462, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetLinkedCell()
{
	VARIANT result;
	GetProperty(0x422, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetLinkedCell(const VARIANT& propVal)
{
	SetProperty(0x422, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetLockedText()
{
	VARIANT result;
	GetProperty(0x268, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetLockedText(const VARIANT& propVal)
{
	SetProperty(0x268, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetPhoneticAccelerator()
{
	VARIANT result;
	GetProperty(0x461, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetPhoneticAccelerator(const VARIANT& propVal)
{
	SetProperty(0x461, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT CheckBox::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBox::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// CheckBox operations

VARIANT CheckBox::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT CheckBox::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT CheckBox::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT CheckBox::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT CheckBox::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT CheckBox::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT CheckBox::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT CheckBox::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT CheckBox::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT CheckBox::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT CheckBox::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// CheckBoxes properties

VARIANT CheckBoxes::GetAccelerator()
{
	VARIANT result;
	GetProperty(0x34e, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetAccelerator(const VARIANT& propVal)
{
	SetProperty(0x34e, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetDisplay3DShading()
{
	VARIANT result;
	GetProperty(0x462, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetDisplay3DShading(const VARIANT& propVal)
{
	SetProperty(0x462, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetLinkedCell()
{
	VARIANT result;
	GetProperty(0x422, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetLinkedCell(const VARIANT& propVal)
{
	SetProperty(0x422, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetLockedText()
{
	VARIANT result;
	GetProperty(0x268, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetLockedText(const VARIANT& propVal)
{
	SetProperty(0x268, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetPhoneticAccelerator()
{
	VARIANT result;
	GetProperty(0x461, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetPhoneticAccelerator(const VARIANT& propVal)
{
	SetProperty(0x461, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT CheckBoxes::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void CheckBoxes::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// CheckBoxes operations

VARIANT CheckBoxes::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT CheckBoxes::Add(const VARIANT& Left, const VARIANT& Top, const VARIANT& Width, const VARIANT& Height)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top, &Width, &Height);
	return result;
}

VARIANT CheckBoxes::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT CheckBoxes::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT CheckBoxes::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT CheckBoxes::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT CheckBoxes::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT CheckBoxes::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT CheckBoxes::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT CheckBoxes::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT CheckBoxes::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT CheckBoxes::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT CheckBoxes::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT CheckBoxes::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT CheckBoxes::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// OptionButton properties

VARIANT OptionButton::GetAccelerator()
{
	VARIANT result;
	GetProperty(0x34e, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetAccelerator(const VARIANT& propVal)
{
	SetProperty(0x34e, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetDisplay3DShading()
{
	VARIANT result;
	GetProperty(0x462, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetDisplay3DShading(const VARIANT& propVal)
{
	SetProperty(0x462, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetLinkedCell()
{
	VARIANT result;
	GetProperty(0x422, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetLinkedCell(const VARIANT& propVal)
{
	SetProperty(0x422, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetLockedText()
{
	VARIANT result;
	GetProperty(0x268, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetLockedText(const VARIANT& propVal)
{
	SetProperty(0x268, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetPhoneticAccelerator()
{
	VARIANT result;
	GetProperty(0x461, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetPhoneticAccelerator(const VARIANT& propVal)
{
	SetProperty(0x461, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT OptionButton::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButton::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// OptionButton operations

VARIANT OptionButton::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OptionButton::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OptionButton::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT OptionButton::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT OptionButton::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OptionButton::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT OptionButton::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OptionButton::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OptionButton::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OptionButton::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT OptionButton::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// OptionButtons properties

VARIANT OptionButtons::GetAccelerator()
{
	VARIANT result;
	GetProperty(0x34e, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetAccelerator(const VARIANT& propVal)
{
	SetProperty(0x34e, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetDisplay3DShading()
{
	VARIANT result;
	GetProperty(0x462, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetDisplay3DShading(const VARIANT& propVal)
{
	SetProperty(0x462, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetLinkedCell()
{
	VARIANT result;
	GetProperty(0x422, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetLinkedCell(const VARIANT& propVal)
{
	SetProperty(0x422, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetLockedText()
{
	VARIANT result;
	GetProperty(0x268, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetLockedText(const VARIANT& propVal)
{
	SetProperty(0x268, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetPhoneticAccelerator()
{
	VARIANT result;
	GetProperty(0x461, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetPhoneticAccelerator(const VARIANT& propVal)
{
	SetProperty(0x461, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT OptionButtons::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void OptionButtons::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// OptionButtons operations

VARIANT OptionButtons::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OptionButtons::Add(const VARIANT& Left, const VARIANT& Top, const VARIANT& Width, const VARIANT& Height)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top, &Width, &Height);
	return result;
}

VARIANT OptionButtons::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OptionButtons::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OptionButtons::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT OptionButtons::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT OptionButtons::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OptionButtons::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT OptionButtons::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OptionButtons::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OptionButtons::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OptionButtons::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT OptionButtons::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT OptionButtons::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT OptionButtons::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Spinner properties

VARIANT Spinner::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetDisplay3DShading()
{
	VARIANT result;
	GetProperty(0x462, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetDisplay3DShading(const VARIANT& propVal)
{
	SetProperty(0x462, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetLinkedCell()
{
	VARIANT result;
	GetProperty(0x422, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetLinkedCell(const VARIANT& propVal)
{
	SetProperty(0x422, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetMax()
{
	VARIANT result;
	GetProperty(0x34a, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetMax(const VARIANT& propVal)
{
	SetProperty(0x34a, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetMin()
{
	VARIANT result;
	GetProperty(0x34b, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetMin(const VARIANT& propVal)
{
	SetProperty(0x34b, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetSmallChange()
{
	VARIANT result;
	GetProperty(0x34c, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetSmallChange(const VARIANT& propVal)
{
	SetProperty(0x34c, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Spinner::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Spinner::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Spinner operations

VARIANT Spinner::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Spinner::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Spinner::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Spinner::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Spinner::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Spinner::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Spinner::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Spinner::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Spinner::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Spinners properties

VARIANT Spinners::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetDisplay3DShading()
{
	VARIANT result;
	GetProperty(0x462, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetDisplay3DShading(const VARIANT& propVal)
{
	SetProperty(0x462, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetLinkedCell()
{
	VARIANT result;
	GetProperty(0x422, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetLinkedCell(const VARIANT& propVal)
{
	SetProperty(0x422, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetMax()
{
	VARIANT result;
	GetProperty(0x34a, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetMax(const VARIANT& propVal)
{
	SetProperty(0x34a, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetMin()
{
	VARIANT result;
	GetProperty(0x34b, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetMin(const VARIANT& propVal)
{
	SetProperty(0x34b, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetSmallChange()
{
	VARIANT result;
	GetProperty(0x34c, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetSmallChange(const VARIANT& propVal)
{
	SetProperty(0x34c, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Spinners::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Spinners::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Spinners operations

VARIANT Spinners::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Spinners::Add(const VARIANT& Left, const VARIANT& Top, const VARIANT& Width, const VARIANT& Height)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top, &Width, &Height);
	return result;
}

VARIANT Spinners::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Spinners::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Spinners::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Spinners::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Spinners::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Spinners::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Spinners::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Spinners::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Spinners::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Spinners::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Spinners::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// ScrollBar properties

VARIANT ScrollBar::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetDisplay3DShading()
{
	VARIANT result;
	GetProperty(0x462, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetDisplay3DShading(const VARIANT& propVal)
{
	SetProperty(0x462, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetLargeChange()
{
	VARIANT result;
	GetProperty(0x34d, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetLargeChange(const VARIANT& propVal)
{
	SetProperty(0x34d, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetLinkedCell()
{
	VARIANT result;
	GetProperty(0x422, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetLinkedCell(const VARIANT& propVal)
{
	SetProperty(0x422, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetMax()
{
	VARIANT result;
	GetProperty(0x34a, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetMax(const VARIANT& propVal)
{
	SetProperty(0x34a, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetMin()
{
	VARIANT result;
	GetProperty(0x34b, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetMin(const VARIANT& propVal)
{
	SetProperty(0x34b, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetSmallChange()
{
	VARIANT result;
	GetProperty(0x34c, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetSmallChange(const VARIANT& propVal)
{
	SetProperty(0x34c, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT ScrollBar::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBar::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// ScrollBar operations

VARIANT ScrollBar::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ScrollBar::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ScrollBar::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ScrollBar::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT ScrollBar::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ScrollBar::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ScrollBar::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ScrollBar::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT ScrollBar::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// ScrollBars properties

VARIANT ScrollBars::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetDisplay3DShading()
{
	VARIANT result;
	GetProperty(0x462, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetDisplay3DShading(const VARIANT& propVal)
{
	SetProperty(0x462, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetLargeChange()
{
	VARIANT result;
	GetProperty(0x34d, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetLargeChange(const VARIANT& propVal)
{
	SetProperty(0x34d, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetLinkedCell()
{
	VARIANT result;
	GetProperty(0x422, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetLinkedCell(const VARIANT& propVal)
{
	SetProperty(0x422, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetMax()
{
	VARIANT result;
	GetProperty(0x34a, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetMax(const VARIANT& propVal)
{
	SetProperty(0x34a, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetMin()
{
	VARIANT result;
	GetProperty(0x34b, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetMin(const VARIANT& propVal)
{
	SetProperty(0x34b, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetSmallChange()
{
	VARIANT result;
	GetProperty(0x34c, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetSmallChange(const VARIANT& propVal)
{
	SetProperty(0x34c, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT ScrollBars::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void ScrollBars::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// ScrollBars operations

VARIANT ScrollBars::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ScrollBars::Add(const VARIANT& Left, const VARIANT& Top, const VARIANT& Width, const VARIANT& Height)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top, &Width, &Height);
	return result;
}

VARIANT ScrollBars::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ScrollBars::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ScrollBars::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ScrollBars::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT ScrollBars::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ScrollBars::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ScrollBars::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ScrollBars::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ScrollBars::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT ScrollBars::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT ScrollBars::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// ListBox properties

VARIANT ListBox::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetDisplay3DShading()
{
	VARIANT result;
	GetProperty(0x462, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetDisplay3DShading(const VARIANT& propVal)
{
	SetProperty(0x462, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetLinkedCell()
{
	VARIANT result;
	GetProperty(0x422, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetLinkedCell(const VARIANT& propVal)
{
	SetProperty(0x422, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetLinkedObject()
{
	VARIANT result;
	GetProperty(0x35e, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetLinkedObject(const VARIANT& propVal)
{
	SetProperty(0x35e, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetList()
{
	VARIANT result;
	GetProperty(0x35d, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetList(const VARIANT& propVal)
{
	SetProperty(0x35d, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetListCount()
{
	VARIANT result;
	GetProperty(0x351, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetListCount(const VARIANT& propVal)
{
	SetProperty(0x351, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetListFillRange()
{
	VARIANT result;
	GetProperty(0x34f, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetListFillRange(const VARIANT& propVal)
{
	SetProperty(0x34f, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetListIndex()
{
	VARIANT result;
	GetProperty(0x352, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetListIndex(const VARIANT& propVal)
{
	SetProperty(0x352, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetMultiSelect()
{
	VARIANT result;
	GetProperty(0x20, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetMultiSelect(const VARIANT& propVal)
{
	SetProperty(0x20, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetSelected()
{
	VARIANT result;
	GetProperty(0x463, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetSelected(const VARIANT& propVal)
{
	SetProperty(0x463, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT ListBox::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void ListBox::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// ListBox operations

VARIANT ListBox::AddItem(const VARIANT& Text, const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x353, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Text, &Index);
	return result;
}

VARIANT ListBox::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBox::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBox::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBox::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT ListBox::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBox::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBox::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBox::RemoveAllItems()
{
	VARIANT result;
	InvokeHelper(0x355, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBox::RemoveItem(const VARIANT& Index, const VARIANT& Count)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x354, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index, &Count);
	return result;
}

VARIANT ListBox::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT ListBox::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// ListBoxes properties

VARIANT ListBoxes::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetDisplay3DShading()
{
	VARIANT result;
	GetProperty(0x462, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetDisplay3DShading(const VARIANT& propVal)
{
	SetProperty(0x462, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetLinkedCell()
{
	VARIANT result;
	GetProperty(0x422, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetLinkedCell(const VARIANT& propVal)
{
	SetProperty(0x422, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetList()
{
	VARIANT result;
	GetProperty(0x35d, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetList(const VARIANT& propVal)
{
	SetProperty(0x35d, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetListFillRange()
{
	VARIANT result;
	GetProperty(0x34f, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetListFillRange(const VARIANT& propVal)
{
	SetProperty(0x34f, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetListIndex()
{
	VARIANT result;
	GetProperty(0x352, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetListIndex(const VARIANT& propVal)
{
	SetProperty(0x352, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetMultiSelect()
{
	VARIANT result;
	GetProperty(0x20, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetMultiSelect(const VARIANT& propVal)
{
	SetProperty(0x20, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetSelected()
{
	VARIANT result;
	GetProperty(0x463, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetSelected(const VARIANT& propVal)
{
	SetProperty(0x463, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT ListBoxes::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void ListBoxes::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// ListBoxes operations

VARIANT ListBoxes::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBoxes::Add(const VARIANT& Left, const VARIANT& Top, const VARIANT& Width, const VARIANT& Height)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top, &Width, &Height);
	return result;
}

VARIANT ListBoxes::AddItem(const VARIANT& Text, const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x353, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Text, &Index);
	return result;
}

VARIANT ListBoxes::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBoxes::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBoxes::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBoxes::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT ListBoxes::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBoxes::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBoxes::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBoxes::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBoxes::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT ListBoxes::RemoveAllItems()
{
	VARIANT result;
	InvokeHelper(0x355, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ListBoxes::RemoveItem(const VARIANT& Index, const VARIANT& Count)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x354, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index, &Count);
	return result;
}

VARIANT ListBoxes::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT ListBoxes::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// GroupBox properties

VARIANT GroupBox::GetAccelerator()
{
	VARIANT result;
	GetProperty(0x34e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetAccelerator(const VARIANT& propVal)
{
	SetProperty(0x34e, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetDisplay3DShading()
{
	VARIANT result;
	GetProperty(0x462, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetDisplay3DShading(const VARIANT& propVal)
{
	SetProperty(0x462, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetLockedText()
{
	VARIANT result;
	GetProperty(0x268, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetLockedText(const VARIANT& propVal)
{
	SetProperty(0x268, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetPhoneticAccelerator()
{
	VARIANT result;
	GetProperty(0x461, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetPhoneticAccelerator(const VARIANT& propVal)
{
	SetProperty(0x461, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT GroupBox::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBox::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// GroupBox operations

VARIANT GroupBox::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupBox::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupBox::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT GroupBox::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT GroupBox::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupBox::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT GroupBox::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupBox::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupBox::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupBox::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT GroupBox::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// GroupBoxes properties

VARIANT GroupBoxes::GetAccelerator()
{
	VARIANT result;
	GetProperty(0x34e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetAccelerator(const VARIANT& propVal)
{
	SetProperty(0x34e, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetDisplay3DShading()
{
	VARIANT result;
	GetProperty(0x462, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetDisplay3DShading(const VARIANT& propVal)
{
	SetProperty(0x462, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetLockedText()
{
	VARIANT result;
	GetProperty(0x268, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetLockedText(const VARIANT& propVal)
{
	SetProperty(0x268, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetPhoneticAccelerator()
{
	VARIANT result;
	GetProperty(0x461, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetPhoneticAccelerator(const VARIANT& propVal)
{
	SetProperty(0x461, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT GroupBoxes::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void GroupBoxes::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// GroupBoxes operations

VARIANT GroupBoxes::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupBoxes::Add(const VARIANT& Left, const VARIANT& Top, const VARIANT& Width, const VARIANT& Height)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top, &Width, &Height);
	return result;
}

VARIANT GroupBoxes::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupBoxes::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupBoxes::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT GroupBoxes::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT GroupBoxes::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupBoxes::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT GroupBoxes::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupBoxes::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupBoxes::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupBoxes::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT GroupBoxes::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT GroupBoxes::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT GroupBoxes::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// DropDown properties

VARIANT DropDown::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetDisplay3DShading()
{
	VARIANT result;
	GetProperty(0x462, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetDisplay3DShading(const VARIANT& propVal)
{
	SetProperty(0x462, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetDropDownLines()
{
	VARIANT result;
	GetProperty(0x350, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetDropDownLines(const VARIANT& propVal)
{
	SetProperty(0x350, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetLinkedCell()
{
	VARIANT result;
	GetProperty(0x422, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetLinkedCell(const VARIANT& propVal)
{
	SetProperty(0x422, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetLinkedObject()
{
	VARIANT result;
	GetProperty(0x35e, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetLinkedObject(const VARIANT& propVal)
{
	SetProperty(0x35e, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetList()
{
	VARIANT result;
	GetProperty(0x35d, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetList(const VARIANT& propVal)
{
	SetProperty(0x35d, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetListCount()
{
	VARIANT result;
	GetProperty(0x351, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetListCount(const VARIANT& propVal)
{
	SetProperty(0x351, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetListFillRange()
{
	VARIANT result;
	GetProperty(0x34f, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetListFillRange(const VARIANT& propVal)
{
	SetProperty(0x34f, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetListIndex()
{
	VARIANT result;
	GetProperty(0x352, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetListIndex(const VARIANT& propVal)
{
	SetProperty(0x352, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetSelected()
{
	VARIANT result;
	GetProperty(0x463, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetSelected(const VARIANT& propVal)
{
	SetProperty(0x463, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT DropDown::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void DropDown::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// DropDown operations

VARIANT DropDown::AddItem(const VARIANT& Text, const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x353, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Text, &Index);
	return result;
}

VARIANT DropDown::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDown::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDown::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT DropDown::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDown::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT DropDown::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDown::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDown::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDown::RemoveAllItems()
{
	VARIANT result;
	InvokeHelper(0x355, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDown::RemoveItem(const VARIANT& Index, const VARIANT& Count)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x354, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index, &Count);
	return result;
}

VARIANT DropDown::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT DropDown::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// DropDowns properties

VARIANT DropDowns::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetDisplay3DShading()
{
	VARIANT result;
	GetProperty(0x462, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetDisplay3DShading(const VARIANT& propVal)
{
	SetProperty(0x462, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetDropDownLines()
{
	VARIANT result;
	GetProperty(0x350, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetDropDownLines(const VARIANT& propVal)
{
	SetProperty(0x350, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetLinkedCell()
{
	VARIANT result;
	GetProperty(0x422, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetLinkedCell(const VARIANT& propVal)
{
	SetProperty(0x422, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetList()
{
	VARIANT result;
	GetProperty(0x35d, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetList(const VARIANT& propVal)
{
	SetProperty(0x35d, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetListFillRange()
{
	VARIANT result;
	GetProperty(0x34f, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetListFillRange(const VARIANT& propVal)
{
	SetProperty(0x34f, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetListIndex()
{
	VARIANT result;
	GetProperty(0x352, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetListIndex(const VARIANT& propVal)
{
	SetProperty(0x352, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetSelected()
{
	VARIANT result;
	GetProperty(0x463, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetSelected(const VARIANT& propVal)
{
	SetProperty(0x463, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT DropDowns::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void DropDowns::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// DropDowns operations

VARIANT DropDowns::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDowns::Add(const VARIANT& Left, const VARIANT& Top, const VARIANT& Width, const VARIANT& Height, const VARIANT& Editable)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top, &Width, &Height, &Editable);
	return result;
}

VARIANT DropDowns::AddItem(const VARIANT& Text, const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x353, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Text, &Index);
	return result;
}

VARIANT DropDowns::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDowns::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDowns::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT DropDowns::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDowns::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT DropDowns::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDowns::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDowns::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDowns::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDowns::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DropDowns::RemoveAllItems()
{
	VARIANT result;
	InvokeHelper(0x355, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropDowns::RemoveItem(const VARIANT& Index, const VARIANT& Count)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x354, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index, &Count);
	return result;
}

VARIANT DropDowns::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT DropDowns::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// DialogFrame properties

VARIANT DialogFrame::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void DialogFrame::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT DialogFrame::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void DialogFrame::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT DialogFrame::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void DialogFrame::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT DialogFrame::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void DialogFrame::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT DialogFrame::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void DialogFrame::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT DialogFrame::GetLockedText()
{
	VARIANT result;
	GetProperty(0x268, VT_VARIANT, (void*)&result);
	return result;
}

void DialogFrame::SetLockedText(const VARIANT& propVal)
{
	SetProperty(0x268, VT_VARIANT, &propVal);
}

VARIANT DialogFrame::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void DialogFrame::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT DialogFrame::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void DialogFrame::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT DialogFrame::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void DialogFrame::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT DialogFrame::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void DialogFrame::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT DialogFrame::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void DialogFrame::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT DialogFrame::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void DialogFrame::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// DialogFrame operations

VARIANT DialogFrame::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DialogFrame::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT DialogFrame::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT DialogFrame::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT DialogFrame::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Label properties

VARIANT Label::GetAccelerator()
{
	VARIANT result;
	GetProperty(0x34e, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetAccelerator(const VARIANT& propVal)
{
	SetProperty(0x34e, VT_VARIANT, &propVal);
}

VARIANT Label::GetBottomRightCell()
{
	VARIANT result;
	GetProperty(0x267, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetBottomRightCell(const VARIANT& propVal)
{
	SetProperty(0x267, VT_VARIANT, &propVal);
}

VARIANT Label::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT Label::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Label::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Label::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Label::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Label::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Label::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Label::GetLockedText()
{
	VARIANT result;
	GetProperty(0x268, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetLockedText(const VARIANT& propVal)
{
	SetProperty(0x268, VT_VARIANT, &propVal);
}

VARIANT Label::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Label::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Label::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Label::GetPhoneticAccelerator()
{
	VARIANT result;
	GetProperty(0x461, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetPhoneticAccelerator(const VARIANT& propVal)
{
	SetProperty(0x461, VT_VARIANT, &propVal);
}

VARIANT Label::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Label::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Label::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT Label::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Label::GetTopLeftCell()
{
	VARIANT result;
	GetProperty(0x26c, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetTopLeftCell(const VARIANT& propVal)
{
	SetProperty(0x26c, VT_VARIANT, &propVal);
}

VARIANT Label::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Label::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Label::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Label::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Label operations

VARIANT Label::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Label::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Label::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT Label::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT Label::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Label::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Label::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Label::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Label::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Label::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Label::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Labels properties

VARIANT Labels::GetAccelerator()
{
	VARIANT result;
	GetProperty(0x34e, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetAccelerator(const VARIANT& propVal)
{
	SetProperty(0x34e, VT_VARIANT, &propVal);
}

VARIANT Labels::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT Labels::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Labels::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Labels::GetEnabled()
{
	VARIANT result;
	GetProperty(0x258, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetEnabled(const VARIANT& propVal)
{
	SetProperty(0x258, VT_VARIANT, &propVal);
}

VARIANT Labels::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Labels::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Labels::GetLocked()
{
	VARIANT result;
	GetProperty(0x10d, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetLocked(const VARIANT& propVal)
{
	SetProperty(0x10d, VT_VARIANT, &propVal);
}

VARIANT Labels::GetLockedText()
{
	VARIANT result;
	GetProperty(0x268, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetLockedText(const VARIANT& propVal)
{
	SetProperty(0x268, VT_VARIANT, &propVal);
}

VARIANT Labels::GetOnAction()
{
	VARIANT result;
	GetProperty(0x254, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetOnAction(const VARIANT& propVal)
{
	SetProperty(0x254, VT_VARIANT, &propVal);
}

VARIANT Labels::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Labels::GetPhoneticAccelerator()
{
	VARIANT result;
	GetProperty(0x461, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetPhoneticAccelerator(const VARIANT& propVal)
{
	SetProperty(0x461, VT_VARIANT, &propVal);
}

VARIANT Labels::GetPlacement()
{
	VARIANT result;
	GetProperty(0x269, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetPlacement(const VARIANT& propVal)
{
	SetProperty(0x269, VT_VARIANT, &propVal);
}

VARIANT Labels::GetPrintObject()
{
	VARIANT result;
	GetProperty(0x26a, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetPrintObject(const VARIANT& propVal)
{
	SetProperty(0x26a, VT_VARIANT, &propVal);
}

VARIANT Labels::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT Labels::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Labels::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Labels::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

VARIANT Labels::GetZOrder()
{
	VARIANT result;
	GetProperty(0x26e, VT_VARIANT, (void*)&result);
	return result;
}

void Labels::SetZOrder(const VARIANT& propVal)
{
	SetProperty(0x26e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Labels operations

VARIANT Labels::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Labels::Add(const VARIANT& Left, const VARIANT& Top, const VARIANT& Width, const VARIANT& Height)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Left, &Top, &Width, &Height);
	return result;
}

VARIANT Labels::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Labels::BringToFront()
{
	VARIANT result;
	InvokeHelper(0x25a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Labels::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT Labels::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT Labels::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Labels::CopyPicture(const VARIANT& Appearance, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format);
	return result;
}

VARIANT Labels::Cut()
{
	VARIANT result;
	InvokeHelper(0x235, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Labels::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Labels::Duplicate()
{
	VARIANT result;
	InvokeHelper(0x40f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Labels::Group()
{
	VARIANT result;
	InvokeHelper(0x2e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Labels::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Labels::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Labels::SendToBack()
{
	VARIANT result;
	InvokeHelper(0x25d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Interior properties

VARIANT Interior::GetColor()
{
	VARIANT result;
	GetProperty(0x63, VT_VARIANT, (void*)&result);
	return result;
}

void Interior::SetColor(const VARIANT& propVal)
{
	SetProperty(0x63, VT_VARIANT, &propVal);
}

VARIANT Interior::GetColorIndex()
{
	VARIANT result;
	GetProperty(0x61, VT_VARIANT, (void*)&result);
	return result;
}

void Interior::SetColorIndex(const VARIANT& propVal)
{
	SetProperty(0x61, VT_VARIANT, &propVal);
}

VARIANT Interior::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Interior::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Interior::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Interior::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Interior::GetPattern()
{
	VARIANT result;
	GetProperty(0x5f, VT_VARIANT, (void*)&result);
	return result;
}

void Interior::SetPattern(const VARIANT& propVal)
{
	SetProperty(0x5f, VT_VARIANT, &propVal);
}

VARIANT Interior::GetPatternColor()
{
	VARIANT result;
	GetProperty(0x64, VT_VARIANT, (void*)&result);
	return result;
}

void Interior::SetPatternColor(const VARIANT& propVal)
{
	SetProperty(0x64, VT_VARIANT, &propVal);
}

VARIANT Interior::GetPatternColorIndex()
{
	VARIANT result;
	GetProperty(0x62, VT_VARIANT, (void*)&result);
	return result;
}

void Interior::SetPatternColorIndex(const VARIANT& propVal)
{
	SetProperty(0x62, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Interior operations

VARIANT Interior::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// SoundNote properties

VARIANT SoundNote::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void SoundNote::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT SoundNote::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void SoundNote::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// SoundNote operations

VARIANT SoundNote::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT SoundNote::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT SoundNote::Import(const VARIANT& Filename)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x395, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Filename);
	return result;
}

VARIANT SoundNote::Play()
{
	VARIANT result;
	InvokeHelper(0x396, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT SoundNote::Record()
{
	VARIANT result;
	InvokeHelper(0x397, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Characters properties

VARIANT Characters::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void Characters::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT Characters::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Characters::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Characters::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Characters::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Characters::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void Characters::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT Characters::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Characters::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Characters::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void Characters::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Characters operations

VARIANT Characters::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Characters::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Characters::Insert(const VARIANT& String)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xfc, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&String);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Dialog properties

VARIANT Dialog::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Dialog::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Dialog::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Dialog::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Dialog operations

VARIANT Dialog::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Dialog::Show(const VARIANT& Arg1, const VARIANT& Arg2, const VARIANT& Arg3, const VARIANT& Arg4, const VARIANT& Arg5, const VARIANT& Arg6, const VARIANT& Arg7, const VARIANT& Arg8, const VARIANT& Arg9, const VARIANT& Arg10, 
		const VARIANT& Arg11, const VARIANT& Arg12, const VARIANT& Arg13, const VARIANT& Arg14, const VARIANT& Arg15, const VARIANT& Arg16, const VARIANT& Arg17, const VARIANT& Arg18, const VARIANT& Arg19, const VARIANT& Arg20, 
		const VARIANT& Arg21, const VARIANT& Arg22, const VARIANT& Arg23, const VARIANT& Arg24, const VARIANT& Arg25, const VARIANT& Arg26, const VARIANT& Arg27, const VARIANT& Arg28, const VARIANT& Arg29, const VARIANT& Arg30)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT 
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f0, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Arg1, &Arg2, &Arg3, &Arg4, &Arg5, &Arg6, &Arg7, &Arg8, &Arg9, &Arg10, &Arg11, &Arg12, &Arg13, &Arg14, &Arg15, &Arg16, &Arg17, &Arg18, &Arg19, &Arg20, &Arg21, &Arg22, &Arg23, &Arg24, &Arg25, &Arg26, &Arg27, &Arg28, &Arg29, &Arg30);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Dialogs properties

VARIANT Dialogs::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Dialogs::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Dialogs::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Dialogs::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Dialogs::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Dialogs::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Dialogs operations

VARIANT Dialogs::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Dialogs::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Outline properties

VARIANT Outline::GetAutomaticStyles()
{
	VARIANT result;
	GetProperty(0x3bf, VT_VARIANT, (void*)&result);
	return result;
}

void Outline::SetAutomaticStyles(const VARIANT& propVal)
{
	SetProperty(0x3bf, VT_VARIANT, &propVal);
}

VARIANT Outline::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Outline::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Outline::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Outline::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Outline::GetSummaryColumn()
{
	VARIANT result;
	GetProperty(0x3c1, VT_VARIANT, (void*)&result);
	return result;
}

void Outline::SetSummaryColumn(const VARIANT& propVal)
{
	SetProperty(0x3c1, VT_VARIANT, &propVal);
}

VARIANT Outline::GetSummaryRow()
{
	VARIANT result;
	GetProperty(0x386, VT_VARIANT, (void*)&result);
	return result;
}

void Outline::SetSummaryRow(const VARIANT& propVal)
{
	SetProperty(0x386, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Outline operations

VARIANT Outline::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Outline::ShowLevels(const VARIANT& RowLevels, const VARIANT& ColumnLevels)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x3c0, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&RowLevels, &ColumnLevels);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// RoutingSlip properties

VARIANT RoutingSlip::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void RoutingSlip::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT RoutingSlip::GetDelivery()
{
	VARIANT result;
	GetProperty(0x3bb, VT_VARIANT, (void*)&result);
	return result;
}

void RoutingSlip::SetDelivery(const VARIANT& propVal)
{
	SetProperty(0x3bb, VT_VARIANT, &propVal);
}

VARIANT RoutingSlip::GetMessage()
{
	VARIANT result;
	GetProperty(0x3ba, VT_VARIANT, (void*)&result);
	return result;
}

void RoutingSlip::SetMessage(const VARIANT& propVal)
{
	SetProperty(0x3ba, VT_VARIANT, &propVal);
}

VARIANT RoutingSlip::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void RoutingSlip::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT RoutingSlip::GetRecipients()
{
	VARIANT result;
	GetProperty(0x3b8, VT_VARIANT, (void*)&result);
	return result;
}

void RoutingSlip::SetRecipients(const VARIANT& propVal)
{
	SetProperty(0x3b8, VT_VARIANT, &propVal);
}

VARIANT RoutingSlip::GetReturnWhenDone()
{
	VARIANT result;
	GetProperty(0x3bc, VT_VARIANT, (void*)&result);
	return result;
}

void RoutingSlip::SetReturnWhenDone(const VARIANT& propVal)
{
	SetProperty(0x3bc, VT_VARIANT, &propVal);
}

VARIANT RoutingSlip::GetStatus()
{
	VARIANT result;
	GetProperty(0x3be, VT_VARIANT, (void*)&result);
	return result;
}

void RoutingSlip::SetStatus(const VARIANT& propVal)
{
	SetProperty(0x3be, VT_VARIANT, &propVal);
}

VARIANT RoutingSlip::GetSubject()
{
	VARIANT result;
	GetProperty(0x3b9, VT_VARIANT, (void*)&result);
	return result;
}

void RoutingSlip::SetSubject(const VARIANT& propVal)
{
	SetProperty(0x3b9, VT_VARIANT, &propVal);
}

VARIANT RoutingSlip::GetTrackStatus()
{
	VARIANT result;
	GetProperty(0x3bd, VT_VARIANT, (void*)&result);
	return result;
}

void RoutingSlip::SetTrackStatus(const VARIANT& propVal)
{
	SetProperty(0x3bd, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// RoutingSlip operations

VARIANT RoutingSlip::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT RoutingSlip::Reset()
{
	VARIANT result;
	InvokeHelper(0x22b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Module properties

VARIANT Module::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Module::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Module::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Module::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Module::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Module::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Module::GetNext()
{
	VARIANT result;
	GetProperty(0x1f6, VT_VARIANT, (void*)&result);
	return result;
}

void Module::SetNext(const VARIANT& propVal)
{
	SetProperty(0x1f6, VT_VARIANT, &propVal);
}

VARIANT Module::GetOnDoubleClick()
{
	VARIANT result;
	GetProperty(0x274, VT_VARIANT, (void*)&result);
	return result;
}

void Module::SetOnDoubleClick(const VARIANT& propVal)
{
	SetProperty(0x274, VT_VARIANT, &propVal);
}

VARIANT Module::GetOnSheetActivate()
{
	VARIANT result;
	GetProperty(0x407, VT_VARIANT, (void*)&result);
	return result;
}

void Module::SetOnSheetActivate(const VARIANT& propVal)
{
	SetProperty(0x407, VT_VARIANT, &propVal);
}

VARIANT Module::GetOnSheetDeactivate()
{
	VARIANT result;
	GetProperty(0x439, VT_VARIANT, (void*)&result);
	return result;
}

void Module::SetOnSheetDeactivate(const VARIANT& propVal)
{
	SetProperty(0x439, VT_VARIANT, &propVal);
}

VARIANT Module::GetPageSetup()
{
	VARIANT result;
	GetProperty(0x3e6, VT_VARIANT, (void*)&result);
	return result;
}

void Module::SetPageSetup(const VARIANT& propVal)
{
	SetProperty(0x3e6, VT_VARIANT, &propVal);
}

VARIANT Module::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Module::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Module::GetPrevious()
{
	VARIANT result;
	GetProperty(0x1f7, VT_VARIANT, (void*)&result);
	return result;
}

void Module::SetPrevious(const VARIANT& propVal)
{
	SetProperty(0x1f7, VT_VARIANT, &propVal);
}

VARIANT Module::GetProtectContents()
{
	VARIANT result;
	GetProperty(0x124, VT_VARIANT, (void*)&result);
	return result;
}

void Module::SetProtectContents(const VARIANT& propVal)
{
	SetProperty(0x124, VT_VARIANT, &propVal);
}

VARIANT Module::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Module::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Module operations

VARIANT Module::Activate()
{
	VARIANT result;
	InvokeHelper(0x130, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Module::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Module::Copy(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT Module::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Module::InsertFile(const VARIANT& Filename, const VARIANT& Merge)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x248, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Filename, &Merge);
	return result;
}

VARIANT Module::Move(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x27d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT Module::PrintOut(const VARIANT& From, const VARIANT& To, const VARIANT& Copies, const VARIANT& Preview)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x389, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&From, &To, &Copies, &Preview);
	return result;
}

VARIANT Module::Protect(const VARIANT& Password, const VARIANT& DrawingObjects, const VARIANT& Contents, const VARIANT& Scenarios)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x11a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Password, &DrawingObjects, &Contents, &Scenarios);
	return result;
}

VARIANT Module::SaveAs(const VARIANT& Filename, const VARIANT& FileFormat, const VARIANT& Password, const VARIANT& WriteResPassword, const VARIANT& ReadOnlyRecommended, const VARIANT& CreateBackup)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x11c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Filename, &FileFormat, &Password, &WriteResPassword, &ReadOnlyRecommended, &CreateBackup);
	return result;
}

VARIANT Module::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Module::Unprotect(const VARIANT& Password)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x11d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Password);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Modules properties

VARIANT Modules::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Modules::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Modules::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Modules::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Modules::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Modules::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Modules::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Modules::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Modules operations

VARIANT Modules::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Modules::Add(const VARIANT& Before, const VARIANT& After, const VARIANT& Count)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After, &Count);
	return result;
}

VARIANT Modules::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Modules::Copy(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT Modules::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Modules::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Modules::Move(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x27d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT Modules::PrintOut(const VARIANT& From, const VARIANT& To, const VARIANT& Copies, const VARIANT& Preview)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x389, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&From, &To, &Copies, &Preview);
	return result;
}

VARIANT Modules::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// DialogSheet properties

VARIANT DialogSheet::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT DialogSheet::GetDefaultButton()
{
	VARIANT result;
	GetProperty(0x359, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetDefaultButton(const VARIANT& propVal)
{
	SetProperty(0x359, VT_VARIANT, &propVal);
}

VARIANT DialogSheet::GetDisplayAutomaticPageBreaks()
{
	VARIANT result;
	GetProperty(0x283, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetDisplayAutomaticPageBreaks(const VARIANT& propVal)
{
	SetProperty(0x283, VT_VARIANT, &propVal);
}

VARIANT DialogSheet::GetFocus()
{
	VARIANT result;
	GetProperty(0x32e, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetFocus(const VARIANT& propVal)
{
	SetProperty(0x32e, VT_VARIANT, &propVal);
}

VARIANT DialogSheet::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT DialogSheet::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT DialogSheet::GetNext()
{
	VARIANT result;
	GetProperty(0x1f6, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetNext(const VARIANT& propVal)
{
	SetProperty(0x1f6, VT_VARIANT, &propVal);
}

VARIANT DialogSheet::GetOnDoubleClick()
{
	VARIANT result;
	GetProperty(0x274, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetOnDoubleClick(const VARIANT& propVal)
{
	SetProperty(0x274, VT_VARIANT, &propVal);
}

VARIANT DialogSheet::GetOnSheetActivate()
{
	VARIANT result;
	GetProperty(0x407, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetOnSheetActivate(const VARIANT& propVal)
{
	SetProperty(0x407, VT_VARIANT, &propVal);
}

VARIANT DialogSheet::GetOnSheetDeactivate()
{
	VARIANT result;
	GetProperty(0x439, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetOnSheetDeactivate(const VARIANT& propVal)
{
	SetProperty(0x439, VT_VARIANT, &propVal);
}

VARIANT DialogSheet::GetPageSetup()
{
	VARIANT result;
	GetProperty(0x3e6, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetPageSetup(const VARIANT& propVal)
{
	SetProperty(0x3e6, VT_VARIANT, &propVal);
}

VARIANT DialogSheet::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT DialogSheet::GetPrevious()
{
	VARIANT result;
	GetProperty(0x1f7, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetPrevious(const VARIANT& propVal)
{
	SetProperty(0x1f7, VT_VARIANT, &propVal);
}

VARIANT DialogSheet::GetProtectContents()
{
	VARIANT result;
	GetProperty(0x124, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetProtectContents(const VARIANT& propVal)
{
	SetProperty(0x124, VT_VARIANT, &propVal);
}

VARIANT DialogSheet::GetProtectDrawingObjects()
{
	VARIANT result;
	GetProperty(0x125, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetProtectDrawingObjects(const VARIANT& propVal)
{
	SetProperty(0x125, VT_VARIANT, &propVal);
}

VARIANT DialogSheet::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheet::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// DialogSheet operations

VARIANT DialogSheet::Activate()
{
	VARIANT result;
	InvokeHelper(0x130, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DialogSheet::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DialogSheet::Arcs(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x2f8, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::Buttons(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x22d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::ChartObjects(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x424, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::CheckBoxes(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x338, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT DialogSheet::Copy(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT DialogSheet::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DialogSheet::DialogFrame()
{
	VARIANT result;
	InvokeHelper(0x347, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DialogSheet::DrawingObjects(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x58, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::Drawings(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x304, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::DropDowns(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x344, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::EditBoxes(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x33c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::_Evaluate(const VARIANT& Name)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name);
	return result;
}

VARIANT DialogSheet::Evaluate(const VARIANT& Name)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xfffffffb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name);
	return result;
}

VARIANT DialogSheet::GroupBoxes(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x342, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::GroupObjects(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x459, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::Hide(const VARIANT& Cancel)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x32d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Cancel);
	return result;
}

VARIANT DialogSheet::Labels(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x349, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::Lines(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x2ff, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::ListBoxes(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x340, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::Move(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x27d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT DialogSheet::OLEObjects(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x31f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::OptionButtons(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x33a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::Ovals(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x321, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::Paste(const VARIANT& Destination, const VARIANT& Link)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Destination, &Link);
	return result;
}

VARIANT DialogSheet::PasteSpecial(const VARIANT& Format, const VARIANT& Link, const VARIANT& DisplayAsIcon, const VARIANT& IconFileName, const VARIANT& IconIndex, const VARIANT& IconLabel)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x403, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Format, &Link, &DisplayAsIcon, &IconFileName, &IconIndex, &IconLabel);
	return result;
}

VARIANT DialogSheet::Pictures(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x303, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::PrintOut(const VARIANT& From, const VARIANT& To, const VARIANT& Copies, const VARIANT& Preview)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x389, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&From, &To, &Copies, &Preview);
	return result;
}

VARIANT DialogSheet::PrintPreview()
{
	VARIANT result;
	InvokeHelper(0x119, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DialogSheet::Protect(const VARIANT& Password, const VARIANT& DrawingObjects, const VARIANT& Contents, const VARIANT& Scenarios)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x11a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Password, &DrawingObjects, &Contents, &Scenarios);
	return result;
}

VARIANT DialogSheet::Rectangles(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x306, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::SaveAs(const VARIANT& Filename, const VARIANT& FileFormat, const VARIANT& Password, const VARIANT& WriteResPassword, const VARIANT& ReadOnlyRecommended, const VARIANT& CreateBackup)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x11c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Filename, &FileFormat, &Password, &WriteResPassword, &ReadOnlyRecommended, &CreateBackup);
	return result;
}

VARIANT DialogSheet::ScrollBars(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x33e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT DialogSheet::Show()
{
	VARIANT result;
	InvokeHelper(0x1f0, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DialogSheet::Spinners(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x346, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::TextBoxes(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x309, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheet::Unprotect(const VARIANT& Password)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x11d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Password);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// DialogSheets properties

VARIANT DialogSheets::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheets::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT DialogSheets::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheets::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT DialogSheets::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheets::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT DialogSheets::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void DialogSheets::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// DialogSheets operations

VARIANT DialogSheets::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DialogSheets::Add(const VARIANT& Before, const VARIANT& After, const VARIANT& Count)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After, &Count);
	return result;
}

VARIANT DialogSheets::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DialogSheets::Copy(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT DialogSheets::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DialogSheets::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DialogSheets::Move(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x27d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT DialogSheets::PrintOut(const VARIANT& From, const VARIANT& To, const VARIANT& Copies, const VARIANT& Preview)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x389, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&From, &To, &Copies, &Preview);
	return result;
}

VARIANT DialogSheets::PrintPreview()
{
	VARIANT result;
	InvokeHelper(0x119, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DialogSheets::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// PageSetup properties

VARIANT PageSetup::GetBlackAndWhite()
{
	VARIANT result;
	GetProperty(0x3f1, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetBlackAndWhite(const VARIANT& propVal)
{
	SetProperty(0x3f1, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetBottomMargin()
{
	VARIANT result;
	GetProperty(0x3ea, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetBottomMargin(const VARIANT& propVal)
{
	SetProperty(0x3ea, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetCenterFooter()
{
	VARIANT result;
	GetProperty(0x3f2, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetCenterFooter(const VARIANT& propVal)
{
	SetProperty(0x3f2, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetCenterHeader()
{
	VARIANT result;
	GetProperty(0x3f3, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetCenterHeader(const VARIANT& propVal)
{
	SetProperty(0x3f3, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetCenterHorizontally()
{
	VARIANT result;
	GetProperty(0x3ed, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetCenterHorizontally(const VARIANT& propVal)
{
	SetProperty(0x3ed, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetCenterVertically()
{
	VARIANT result;
	GetProperty(0x3ee, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetCenterVertically(const VARIANT& propVal)
{
	SetProperty(0x3ee, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetChartSize()
{
	VARIANT result;
	GetProperty(0x3f4, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetChartSize(const VARIANT& propVal)
{
	SetProperty(0x3f4, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetDraft()
{
	VARIANT result;
	GetProperty(0x3fc, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetDraft(const VARIANT& propVal)
{
	SetProperty(0x3fc, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetFirstPageNumber()
{
	VARIANT result;
	GetProperty(0x3f0, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetFirstPageNumber(const VARIANT& propVal)
{
	SetProperty(0x3f0, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetFitToPagesTall()
{
	VARIANT result;
	GetProperty(0x3f5, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetFitToPagesTall(const VARIANT& propVal)
{
	SetProperty(0x3f5, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetFitToPagesWide()
{
	VARIANT result;
	GetProperty(0x3f6, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetFitToPagesWide(const VARIANT& propVal)
{
	SetProperty(0x3f6, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetFooterMargin()
{
	VARIANT result;
	GetProperty(0x3f7, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetFooterMargin(const VARIANT& propVal)
{
	SetProperty(0x3f7, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetHeaderMargin()
{
	VARIANT result;
	GetProperty(0x3f8, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetHeaderMargin(const VARIANT& propVal)
{
	SetProperty(0x3f8, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetLeftFooter()
{
	VARIANT result;
	GetProperty(0x3f9, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetLeftFooter(const VARIANT& propVal)
{
	SetProperty(0x3f9, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetLeftHeader()
{
	VARIANT result;
	GetProperty(0x3fa, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetLeftHeader(const VARIANT& propVal)
{
	SetProperty(0x3fa, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetLeftMargin()
{
	VARIANT result;
	GetProperty(0x3e7, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetLeftMargin(const VARIANT& propVal)
{
	SetProperty(0x3e7, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetOrder()
{
	VARIANT result;
	GetProperty(0xc0, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetOrder(const VARIANT& propVal)
{
	SetProperty(0xc0, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetPaperSize()
{
	VARIANT result;
	GetProperty(0x3ef, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetPaperSize(const VARIANT& propVal)
{
	SetProperty(0x3ef, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetPrintArea()
{
	VARIANT result;
	GetProperty(0x3fb, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetPrintArea(const VARIANT& propVal)
{
	SetProperty(0x3fb, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetPrintGridlines()
{
	VARIANT result;
	GetProperty(0x3ec, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetPrintGridlines(const VARIANT& propVal)
{
	SetProperty(0x3ec, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetPrintHeadings()
{
	VARIANT result;
	GetProperty(0x3eb, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetPrintHeadings(const VARIANT& propVal)
{
	SetProperty(0x3eb, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetPrintNotes()
{
	VARIANT result;
	GetProperty(0x3fd, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetPrintNotes(const VARIANT& propVal)
{
	SetProperty(0x3fd, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetPrintQuality()
{
	VARIANT result;
	GetProperty(0x3fe, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetPrintQuality(const VARIANT& propVal)
{
	SetProperty(0x3fe, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetPrintTitleColumns()
{
	VARIANT result;
	GetProperty(0x3ff, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetPrintTitleColumns(const VARIANT& propVal)
{
	SetProperty(0x3ff, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetPrintTitleRows()
{
	VARIANT result;
	GetProperty(0x400, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetPrintTitleRows(const VARIANT& propVal)
{
	SetProperty(0x400, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetRightFooter()
{
	VARIANT result;
	GetProperty(0x401, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetRightFooter(const VARIANT& propVal)
{
	SetProperty(0x401, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetRightHeader()
{
	VARIANT result;
	GetProperty(0x402, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetRightHeader(const VARIANT& propVal)
{
	SetProperty(0x402, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetRightMargin()
{
	VARIANT result;
	GetProperty(0x3e8, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetRightMargin(const VARIANT& propVal)
{
	SetProperty(0x3e8, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetTopMargin()
{
	VARIANT result;
	GetProperty(0x3e9, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetTopMargin(const VARIANT& propVal)
{
	SetProperty(0x3e9, VT_VARIANT, &propVal);
}

VARIANT PageSetup::GetZoom()
{
	VARIANT result;
	GetProperty(0x297, VT_VARIANT, (void*)&result);
	return result;
}

void PageSetup::SetZoom(const VARIANT& propVal)
{
	SetProperty(0x297, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// PageSetup operations

VARIANT PageSetup::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Mailer properties

VARIANT Mailer::GetBCCRecipients()
{
	VARIANT result;
	GetProperty(0x3d7, VT_VARIANT, (void*)&result);
	return result;
}

void Mailer::SetBCCRecipients(const VARIANT& propVal)
{
	SetProperty(0x3d7, VT_VARIANT, &propVal);
}

VARIANT Mailer::GetCCRecipients()
{
	VARIANT result;
	GetProperty(0x3d6, VT_VARIANT, (void*)&result);
	return result;
}

void Mailer::SetCCRecipients(const VARIANT& propVal)
{
	SetProperty(0x3d6, VT_VARIANT, &propVal);
}

VARIANT Mailer::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Mailer::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Mailer::GetEnclosures()
{
	VARIANT result;
	GetProperty(0x3d8, VT_VARIANT, (void*)&result);
	return result;
}

void Mailer::SetEnclosures(const VARIANT& propVal)
{
	SetProperty(0x3d8, VT_VARIANT, &propVal);
}

VARIANT Mailer::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Mailer::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Mailer::GetReceived()
{
	VARIANT result;
	GetProperty(0x3da, VT_VARIANT, (void*)&result);
	return result;
}

void Mailer::SetReceived(const VARIANT& propVal)
{
	SetProperty(0x3da, VT_VARIANT, &propVal);
}

VARIANT Mailer::GetSendDateTime()
{
	VARIANT result;
	GetProperty(0x3db, VT_VARIANT, (void*)&result);
	return result;
}

void Mailer::SetSendDateTime(const VARIANT& propVal)
{
	SetProperty(0x3db, VT_VARIANT, &propVal);
}

VARIANT Mailer::GetSender()
{
	VARIANT result;
	GetProperty(0x3dc, VT_VARIANT, (void*)&result);
	return result;
}

void Mailer::SetSender(const VARIANT& propVal)
{
	SetProperty(0x3dc, VT_VARIANT, &propVal);
}

VARIANT Mailer::GetSubject()
{
	VARIANT result;
	GetProperty(0x3b9, VT_VARIANT, (void*)&result);
	return result;
}

void Mailer::SetSubject(const VARIANT& propVal)
{
	SetProperty(0x3b9, VT_VARIANT, &propVal);
}

VARIANT Mailer::GetToRecipients()
{
	VARIANT result;
	GetProperty(0x3d5, VT_VARIANT, (void*)&result);
	return result;
}

void Mailer::SetToRecipients(const VARIANT& propVal)
{
	SetProperty(0x3d5, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Mailer operations

VARIANT Mailer::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Font properties

VARIANT Font::GetBackground()
{
	VARIANT result;
	GetProperty(0xb4, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetBackground(const VARIANT& propVal)
{
	SetProperty(0xb4, VT_VARIANT, &propVal);
}

VARIANT Font::GetBold()
{
	VARIANT result;
	GetProperty(0x60, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetBold(const VARIANT& propVal)
{
	SetProperty(0x60, VT_VARIANT, &propVal);
}

VARIANT Font::GetColor()
{
	VARIANT result;
	GetProperty(0x63, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetColor(const VARIANT& propVal)
{
	SetProperty(0x63, VT_VARIANT, &propVal);
}

VARIANT Font::GetColorIndex()
{
	VARIANT result;
	GetProperty(0x61, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetColorIndex(const VARIANT& propVal)
{
	SetProperty(0x61, VT_VARIANT, &propVal);
}

VARIANT Font::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Font::GetFontStyle()
{
	VARIANT result;
	GetProperty(0xb1, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetFontStyle(const VARIANT& propVal)
{
	SetProperty(0xb1, VT_VARIANT, &propVal);
}

VARIANT Font::GetItalic()
{
	VARIANT result;
	GetProperty(0x65, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetItalic(const VARIANT& propVal)
{
	SetProperty(0x65, VT_VARIANT, &propVal);
}

VARIANT Font::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Font::GetOutlineFont()
{
	VARIANT result;
	GetProperty(0xdd, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetOutlineFont(const VARIANT& propVal)
{
	SetProperty(0xdd, VT_VARIANT, &propVal);
}

VARIANT Font::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Font::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT Font::GetSize()
{
	VARIANT result;
	GetProperty(0x68, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetSize(const VARIANT& propVal)
{
	SetProperty(0x68, VT_VARIANT, &propVal);
}

VARIANT Font::GetStrikethrough()
{
	VARIANT result;
	GetProperty(0x69, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetStrikethrough(const VARIANT& propVal)
{
	SetProperty(0x69, VT_VARIANT, &propVal);
}

VARIANT Font::GetSubscript()
{
	VARIANT result;
	GetProperty(0xb3, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetSubscript(const VARIANT& propVal)
{
	SetProperty(0xb3, VT_VARIANT, &propVal);
}

VARIANT Font::GetSuperscript()
{
	VARIANT result;
	GetProperty(0xb2, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetSuperscript(const VARIANT& propVal)
{
	SetProperty(0xb2, VT_VARIANT, &propVal);
}

VARIANT Font::GetUnderline()
{
	VARIANT result;
	GetProperty(0x6a, VT_VARIANT, (void*)&result);
	return result;
}

void Font::SetUnderline(const VARIANT& propVal)
{
	SetProperty(0x6a, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Font operations

VARIANT Font::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Border properties

VARIANT Border::GetColor()
{
	VARIANT result;
	GetProperty(0x63, VT_VARIANT, (void*)&result);
	return result;
}

void Border::SetColor(const VARIANT& propVal)
{
	SetProperty(0x63, VT_VARIANT, &propVal);
}

VARIANT Border::GetColorIndex()
{
	VARIANT result;
	GetProperty(0x61, VT_VARIANT, (void*)&result);
	return result;
}

void Border::SetColorIndex(const VARIANT& propVal)
{
	SetProperty(0x61, VT_VARIANT, &propVal);
}

VARIANT Border::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Border::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Border::GetLineStyle()
{
	VARIANT result;
	GetProperty(0x77, VT_VARIANT, (void*)&result);
	return result;
}

void Border::SetLineStyle(const VARIANT& propVal)
{
	SetProperty(0x77, VT_VARIANT, &propVal);
}

VARIANT Border::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Border::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Border::GetWeight()
{
	VARIANT result;
	GetProperty(0x78, VT_VARIANT, (void*)&result);
	return result;
}

void Border::SetWeight(const VARIANT& propVal)
{
	SetProperty(0x78, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Border operations

VARIANT Border::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Borders properties

VARIANT Borders::GetColor()
{
	VARIANT result;
	GetProperty(0x63, VT_VARIANT, (void*)&result);
	return result;
}

void Borders::SetColor(const VARIANT& propVal)
{
	SetProperty(0x63, VT_VARIANT, &propVal);
}

VARIANT Borders::GetColorIndex()
{
	VARIANT result;
	GetProperty(0x61, VT_VARIANT, (void*)&result);
	return result;
}

void Borders::SetColorIndex(const VARIANT& propVal)
{
	SetProperty(0x61, VT_VARIANT, &propVal);
}

VARIANT Borders::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Borders::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Borders::GetLineStyle()
{
	VARIANT result;
	GetProperty(0x77, VT_VARIANT, (void*)&result);
	return result;
}

void Borders::SetLineStyle(const VARIANT& propVal)
{
	SetProperty(0x77, VT_VARIANT, &propVal);
}

VARIANT Borders::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Borders::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Borders::GetValue()
{
	VARIANT result;
	GetProperty(0x6, VT_VARIANT, (void*)&result);
	return result;
}

void Borders::SetValue(const VARIANT& propVal)
{
	SetProperty(0x6, VT_VARIANT, &propVal);
}

VARIANT Borders::GetWeight()
{
	VARIANT result;
	GetProperty(0x78, VT_VARIANT, (void*)&result);
	return result;
}

void Borders::SetWeight(const VARIANT& propVal)
{
	SetProperty(0x78, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Borders operations

VARIANT Borders::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Borders::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Borders::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Corners properties

VARIANT Corners::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Corners::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Corners::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Corners::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Corners::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Corners::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Corners operations

VARIANT Corners::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Corners::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// SeriesLines properties

VARIANT SeriesLines::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void SeriesLines::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT SeriesLines::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void SeriesLines::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT SeriesLines::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void SeriesLines::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT SeriesLines::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void SeriesLines::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// SeriesLines operations

VARIANT SeriesLines::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT SeriesLines::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT SeriesLines::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// HiLoLines properties

VARIANT HiLoLines::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void HiLoLines::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT HiLoLines::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void HiLoLines::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT HiLoLines::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void HiLoLines::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT HiLoLines::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void HiLoLines::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// HiLoLines operations

VARIANT HiLoLines::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT HiLoLines::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT HiLoLines::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Gridlines properties

VARIANT Gridlines::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Gridlines::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Gridlines::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Gridlines::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Gridlines::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Gridlines::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Gridlines::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Gridlines::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Gridlines operations

VARIANT Gridlines::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Gridlines::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Gridlines::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// DropLines properties

VARIANT DropLines::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void DropLines::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT DropLines::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void DropLines::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT DropLines::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void DropLines::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT DropLines::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void DropLines::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// DropLines operations

VARIANT DropLines::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropLines::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DropLines::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// ErrorBars properties

VARIANT ErrorBars::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void ErrorBars::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT ErrorBars::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void ErrorBars::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT ErrorBars::GetEndStyle()
{
	VARIANT result;
	GetProperty(0x464, VT_VARIANT, (void*)&result);
	return result;
}

void ErrorBars::SetEndStyle(const VARIANT& propVal)
{
	SetProperty(0x464, VT_VARIANT, &propVal);
}

VARIANT ErrorBars::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void ErrorBars::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT ErrorBars::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void ErrorBars::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// ErrorBars operations

VARIANT ErrorBars::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ErrorBars::ClearFormats()
{
	VARIANT result;
	InvokeHelper(0x70, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ErrorBars::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ErrorBars::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// UpBars properties

VARIANT UpBars::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void UpBars::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT UpBars::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void UpBars::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT UpBars::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void UpBars::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT UpBars::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void UpBars::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT UpBars::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void UpBars::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// UpBars operations

VARIANT UpBars::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT UpBars::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT UpBars::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// DownBars properties

VARIANT DownBars::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void DownBars::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT DownBars::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void DownBars::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT DownBars::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void DownBars::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT DownBars::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void DownBars::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT DownBars::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void DownBars::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// DownBars operations

VARIANT DownBars::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DownBars::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DownBars::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// ChartTitle properties

VARIANT ChartTitle::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void ChartTitle::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT ChartTitle::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void ChartTitle::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT ChartTitle::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void ChartTitle::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT ChartTitle::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void ChartTitle::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT ChartTitle::GetHorizontalAlignment()
{
	VARIANT result;
	GetProperty(0x88, VT_VARIANT, (void*)&result);
	return result;
}

void ChartTitle::SetHorizontalAlignment(const VARIANT& propVal)
{
	SetProperty(0x88, VT_VARIANT, &propVal);
}

VARIANT ChartTitle::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void ChartTitle::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT ChartTitle::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void ChartTitle::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT ChartTitle::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void ChartTitle::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT ChartTitle::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void ChartTitle::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT ChartTitle::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void ChartTitle::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT ChartTitle::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void ChartTitle::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT ChartTitle::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void ChartTitle::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT ChartTitle::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void ChartTitle::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT ChartTitle::GetVerticalAlignment()
{
	VARIANT result;
	GetProperty(0x89, VT_VARIANT, (void*)&result);
	return result;
}

void ChartTitle::SetVerticalAlignment(const VARIANT& propVal)
{
	SetProperty(0x89, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// ChartTitle operations

VARIANT ChartTitle::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartTitle::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT ChartTitle::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartTitle::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// AxisTitle properties

VARIANT AxisTitle::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void AxisTitle::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT AxisTitle::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void AxisTitle::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT AxisTitle::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void AxisTitle::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT AxisTitle::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void AxisTitle::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT AxisTitle::GetHorizontalAlignment()
{
	VARIANT result;
	GetProperty(0x88, VT_VARIANT, (void*)&result);
	return result;
}

void AxisTitle::SetHorizontalAlignment(const VARIANT& propVal)
{
	SetProperty(0x88, VT_VARIANT, &propVal);
}

VARIANT AxisTitle::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void AxisTitle::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT AxisTitle::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void AxisTitle::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT AxisTitle::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void AxisTitle::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT AxisTitle::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void AxisTitle::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT AxisTitle::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void AxisTitle::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT AxisTitle::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void AxisTitle::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT AxisTitle::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void AxisTitle::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT AxisTitle::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void AxisTitle::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT AxisTitle::GetVerticalAlignment()
{
	VARIANT result;
	GetProperty(0x89, VT_VARIANT, (void*)&result);
	return result;
}

void AxisTitle::SetVerticalAlignment(const VARIANT& propVal)
{
	SetProperty(0x89, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// AxisTitle operations

VARIANT AxisTitle::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT AxisTitle::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT AxisTitle::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT AxisTitle::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Floor properties

VARIANT Floor::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Floor::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Floor::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Floor::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Floor::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Floor::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Floor::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Floor::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Floor::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Floor::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Floor operations

VARIANT Floor::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Floor::ClearFormats()
{
	VARIANT result;
	InvokeHelper(0x70, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Floor::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Walls properties

VARIANT Walls::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Walls::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Walls::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Walls::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Walls::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Walls::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Walls::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Walls::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Walls::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Walls::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Walls operations

VARIANT Walls::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Walls::ClearFormats()
{
	VARIANT result;
	InvokeHelper(0x70, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Walls::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// PlotArea properties

VARIANT PlotArea::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void PlotArea::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT PlotArea::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void PlotArea::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT PlotArea::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void PlotArea::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT PlotArea::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void PlotArea::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT PlotArea::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void PlotArea::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT PlotArea::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void PlotArea::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT PlotArea::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void PlotArea::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT PlotArea::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void PlotArea::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT PlotArea::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void PlotArea::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT PlotArea::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void PlotArea::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// PlotArea operations

VARIANT PlotArea::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT PlotArea::ClearFormats()
{
	VARIANT result;
	InvokeHelper(0x70, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT PlotArea::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// ChartArea properties

VARIANT ChartArea::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void ChartArea::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT ChartArea::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void ChartArea::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT ChartArea::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void ChartArea::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT ChartArea::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void ChartArea::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT ChartArea::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void ChartArea::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT ChartArea::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void ChartArea::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT ChartArea::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void ChartArea::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT ChartArea::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void ChartArea::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT ChartArea::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void ChartArea::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT ChartArea::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void ChartArea::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT ChartArea::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void ChartArea::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// ChartArea operations

VARIANT ChartArea::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartArea::Clear()
{
	VARIANT result;
	InvokeHelper(0x6f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartArea::ClearContents()
{
	VARIANT result;
	InvokeHelper(0x71, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartArea::ClearFormats()
{
	VARIANT result;
	InvokeHelper(0x70, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartArea::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartArea::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Legend properties

VARIANT Legend::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Legend::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Legend::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Legend::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Legend::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void Legend::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT Legend::GetHeight()
{
	VARIANT result;
	GetProperty(0x7b, VT_VARIANT, (void*)&result);
	return result;
}

void Legend::SetHeight(const VARIANT& propVal)
{
	SetProperty(0x7b, VT_VARIANT, &propVal);
}

VARIANT Legend::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Legend::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Legend::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void Legend::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT Legend::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Legend::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Legend::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Legend::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Legend::GetPosition()
{
	VARIANT result;
	GetProperty(0x85, VT_VARIANT, (void*)&result);
	return result;
}

void Legend::SetPosition(const VARIANT& propVal)
{
	SetProperty(0x85, VT_VARIANT, &propVal);
}

VARIANT Legend::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void Legend::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT Legend::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void Legend::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT Legend::GetWidth()
{
	VARIANT result;
	GetProperty(0x7a, VT_VARIANT, (void*)&result);
	return result;
}

void Legend::SetWidth(const VARIANT& propVal)
{
	SetProperty(0x7a, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Legend operations

VARIANT Legend::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Legend::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Legend::LegendEntries(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xad, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Legend::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// TickLabels properties

VARIANT TickLabels::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void TickLabels::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT TickLabels::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void TickLabels::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT TickLabels::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void TickLabels::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT TickLabels::GetNumberFormat()
{
	VARIANT result;
	GetProperty(0xc1, VT_VARIANT, (void*)&result);
	return result;
}

void TickLabels::SetNumberFormat(const VARIANT& propVal)
{
	SetProperty(0xc1, VT_VARIANT, &propVal);
}

VARIANT TickLabels::GetNumberFormatLinked()
{
	VARIANT result;
	GetProperty(0xc2, VT_VARIANT, (void*)&result);
	return result;
}

void TickLabels::SetNumberFormatLinked(const VARIANT& propVal)
{
	SetProperty(0xc2, VT_VARIANT, &propVal);
}

VARIANT TickLabels::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void TickLabels::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT TickLabels::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void TickLabels::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// TickLabels operations

VARIANT TickLabels::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TickLabels::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT TickLabels::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Chart properties

VARIANT Chart::GetArea3DGroup()
{
	VARIANT result;
	GetProperty(0x11, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetArea3DGroup(const VARIANT& propVal)
{
	SetProperty(0x11, VT_VARIANT, &propVal);
}

VARIANT Chart::GetAutoScaling()
{
	VARIANT result;
	GetProperty(0x6b, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetAutoScaling(const VARIANT& propVal)
{
	SetProperty(0x6b, VT_VARIANT, &propVal);
}

VARIANT Chart::GetBar3DGroup()
{
	VARIANT result;
	GetProperty(0x12, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetBar3DGroup(const VARIANT& propVal)
{
	SetProperty(0x12, VT_VARIANT, &propVal);
}

VARIANT Chart::GetChartArea()
{
	VARIANT result;
	GetProperty(0x50, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetChartArea(const VARIANT& propVal)
{
	SetProperty(0x50, VT_VARIANT, &propVal);
}

VARIANT Chart::GetChartTitle()
{
	VARIANT result;
	GetProperty(0x51, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetChartTitle(const VARIANT& propVal)
{
	SetProperty(0x51, VT_VARIANT, &propVal);
}

VARIANT Chart::GetColumn3DGroup()
{
	VARIANT result;
	GetProperty(0x13, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetColumn3DGroup(const VARIANT& propVal)
{
	SetProperty(0x13, VT_VARIANT, &propVal);
}

VARIANT Chart::GetCorners()
{
	VARIANT result;
	GetProperty(0x4f, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetCorners(const VARIANT& propVal)
{
	SetProperty(0x4f, VT_VARIANT, &propVal);
}

VARIANT Chart::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Chart::GetDepthPercent()
{
	VARIANT result;
	GetProperty(0x30, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetDepthPercent(const VARIANT& propVal)
{
	SetProperty(0x30, VT_VARIANT, &propVal);
}

VARIANT Chart::GetDisplayBlanksAs()
{
	VARIANT result;
	GetProperty(0x5d, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetDisplayBlanksAs(const VARIANT& propVal)
{
	SetProperty(0x5d, VT_VARIANT, &propVal);
}

VARIANT Chart::GetElevation()
{
	VARIANT result;
	GetProperty(0x31, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetElevation(const VARIANT& propVal)
{
	SetProperty(0x31, VT_VARIANT, &propVal);
}

VARIANT Chart::GetFloor()
{
	VARIANT result;
	GetProperty(0x53, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetFloor(const VARIANT& propVal)
{
	SetProperty(0x53, VT_VARIANT, &propVal);
}

VARIANT Chart::GetGapDepth()
{
	VARIANT result;
	GetProperty(0x32, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetGapDepth(const VARIANT& propVal)
{
	SetProperty(0x32, VT_VARIANT, &propVal);
}

VARIANT Chart::GetHasAxis()
{
	VARIANT result;
	GetProperty(0x34, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetHasAxis(const VARIANT& propVal)
{
	SetProperty(0x34, VT_VARIANT, &propVal);
}

VARIANT Chart::GetHasLegend()
{
	VARIANT result;
	GetProperty(0x35, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetHasLegend(const VARIANT& propVal)
{
	SetProperty(0x35, VT_VARIANT, &propVal);
}

VARIANT Chart::GetHasTitle()
{
	VARIANT result;
	GetProperty(0x36, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetHasTitle(const VARIANT& propVal)
{
	SetProperty(0x36, VT_VARIANT, &propVal);
}

VARIANT Chart::GetHeightPercent()
{
	VARIANT result;
	GetProperty(0x37, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetHeightPercent(const VARIANT& propVal)
{
	SetProperty(0x37, VT_VARIANT, &propVal);
}

VARIANT Chart::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Chart::GetLegend()
{
	VARIANT result;
	GetProperty(0x54, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetLegend(const VARIANT& propVal)
{
	SetProperty(0x54, VT_VARIANT, &propVal);
}

VARIANT Chart::GetLine3DGroup()
{
	VARIANT result;
	GetProperty(0x14, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetLine3DGroup(const VARIANT& propVal)
{
	SetProperty(0x14, VT_VARIANT, &propVal);
}

VARIANT Chart::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Chart::GetNext()
{
	VARIANT result;
	GetProperty(0x1f6, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetNext(const VARIANT& propVal)
{
	SetProperty(0x1f6, VT_VARIANT, &propVal);
}

VARIANT Chart::GetOnDoubleClick()
{
	VARIANT result;
	GetProperty(0x274, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetOnDoubleClick(const VARIANT& propVal)
{
	SetProperty(0x274, VT_VARIANT, &propVal);
}

VARIANT Chart::GetOnSheetActivate()
{
	VARIANT result;
	GetProperty(0x407, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetOnSheetActivate(const VARIANT& propVal)
{
	SetProperty(0x407, VT_VARIANT, &propVal);
}

VARIANT Chart::GetOnSheetDeactivate()
{
	VARIANT result;
	GetProperty(0x439, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetOnSheetDeactivate(const VARIANT& propVal)
{
	SetProperty(0x439, VT_VARIANT, &propVal);
}

VARIANT Chart::GetPageSetup()
{
	VARIANT result;
	GetProperty(0x3e6, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetPageSetup(const VARIANT& propVal)
{
	SetProperty(0x3e6, VT_VARIANT, &propVal);
}

VARIANT Chart::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Chart::GetPerspective()
{
	VARIANT result;
	GetProperty(0x39, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetPerspective(const VARIANT& propVal)
{
	SetProperty(0x39, VT_VARIANT, &propVal);
}

VARIANT Chart::GetPie3DGroup()
{
	VARIANT result;
	GetProperty(0x15, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetPie3DGroup(const VARIANT& propVal)
{
	SetProperty(0x15, VT_VARIANT, &propVal);
}

VARIANT Chart::GetPlotArea()
{
	VARIANT result;
	GetProperty(0x55, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetPlotArea(const VARIANT& propVal)
{
	SetProperty(0x55, VT_VARIANT, &propVal);
}

VARIANT Chart::GetPlotVisibleOnly()
{
	VARIANT result;
	GetProperty(0x5c, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetPlotVisibleOnly(const VARIANT& propVal)
{
	SetProperty(0x5c, VT_VARIANT, &propVal);
}

VARIANT Chart::GetPrevious()
{
	VARIANT result;
	GetProperty(0x1f7, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetPrevious(const VARIANT& propVal)
{
	SetProperty(0x1f7, VT_VARIANT, &propVal);
}

VARIANT Chart::GetProtectContents()
{
	VARIANT result;
	GetProperty(0x124, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetProtectContents(const VARIANT& propVal)
{
	SetProperty(0x124, VT_VARIANT, &propVal);
}

VARIANT Chart::GetProtectDrawingObjects()
{
	VARIANT result;
	GetProperty(0x125, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetProtectDrawingObjects(const VARIANT& propVal)
{
	SetProperty(0x125, VT_VARIANT, &propVal);
}

VARIANT Chart::GetRightAngleAxes()
{
	VARIANT result;
	GetProperty(0x3a, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetRightAngleAxes(const VARIANT& propVal)
{
	SetProperty(0x3a, VT_VARIANT, &propVal);
}

VARIANT Chart::GetRotation()
{
	VARIANT result;
	GetProperty(0x3b, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetRotation(const VARIANT& propVal)
{
	SetProperty(0x3b, VT_VARIANT, &propVal);
}

VARIANT Chart::GetSizeWithWindow()
{
	VARIANT result;
	GetProperty(0x5e, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetSizeWithWindow(const VARIANT& propVal)
{
	SetProperty(0x5e, VT_VARIANT, &propVal);
}

VARIANT Chart::GetSubType()
{
	VARIANT result;
	GetProperty(0x6d, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetSubType(const VARIANT& propVal)
{
	SetProperty(0x6d, VT_VARIANT, &propVal);
}

VARIANT Chart::GetSurfaceGroup()
{
	VARIANT result;
	GetProperty(0x16, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetSurfaceGroup(const VARIANT& propVal)
{
	SetProperty(0x16, VT_VARIANT, &propVal);
}

VARIANT Chart::GetType()
{
	VARIANT result;
	GetProperty(0x6c, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetType(const VARIANT& propVal)
{
	SetProperty(0x6c, VT_VARIANT, &propVal);
}

VARIANT Chart::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

VARIANT Chart::GetWalls()
{
	VARIANT result;
	GetProperty(0x56, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetWalls(const VARIANT& propVal)
{
	SetProperty(0x56, VT_VARIANT, &propVal);
}

VARIANT Chart::GetWallsAndGridlines2D()
{
	VARIANT result;
	GetProperty(0xd2, VT_VARIANT, (void*)&result);
	return result;
}

void Chart::SetWallsAndGridlines2D(const VARIANT& propVal)
{
	SetProperty(0xd2, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Chart operations

VARIANT Chart::Activate()
{
	VARIANT result;
	InvokeHelper(0x130, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Chart::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Chart::ApplyDataLabels(const VARIANT& Type, const VARIANT& LegendKey)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x97, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Type, &LegendKey);
	return result;
}

VARIANT Chart::Arcs(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x2f8, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::AreaGroups(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::AutoFormat(const VARIANT& Gallery, const VARIANT& Format)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x72, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Gallery, &Format);
	return result;
}

VARIANT Chart::Axes(const VARIANT& Type, const VARIANT& AxisGroup)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x17, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Type, &AxisGroup);
	return result;
}

VARIANT Chart::BarGroups(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::Buttons(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x22d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::ChartGroups(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x8, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::ChartObjects(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x424, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::ChartWizard(const VARIANT& Source, const VARIANT& Gallery, const VARIANT& Format, const VARIANT& PlotBy, const VARIANT& CategoryLabels, const VARIANT& SeriesLabels, const VARIANT& HasLegend, const VARIANT& Title, 
		const VARIANT& CategoryTitle, const VARIANT& ValueTitle, const VARIANT& ExtraTitle)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xc4, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Source, &Gallery, &Format, &PlotBy, &CategoryLabels, &SeriesLabels, &HasLegend, &Title, &CategoryTitle, &ValueTitle, &ExtraTitle);
	return result;
}

VARIANT Chart::CheckBoxes(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x338, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::CheckSpelling(const VARIANT& CustomDictionary, const VARIANT& IgnoreUppercase, const VARIANT& AlwaysSuggest)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1f9, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&CustomDictionary, &IgnoreUppercase, &AlwaysSuggest);
	return result;
}

VARIANT Chart::ColumnGroups(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::Copy(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT Chart::CopyPicture(const VARIANT& Appearance, const VARIANT& Format, const VARIANT& Size)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Appearance, &Format, &Size);
	return result;
}

VARIANT Chart::CreatePublisher(const VARIANT& Edition, const VARIANT& Appearance, const VARIANT& Size, const VARIANT& ContainsPICT, const VARIANT& ContainsBIFF, const VARIANT& ContainsRTF, const VARIANT& ContainsVALU)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x1ca, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Edition, &Appearance, &Size, &ContainsPICT, &ContainsBIFF, &ContainsRTF, &ContainsVALU);
	return result;
}

VARIANT Chart::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Chart::Deselect()
{
	VARIANT result;
	InvokeHelper(0x460, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Chart::DoughnutGroups(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xe, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::DrawingObjects(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x58, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::Drawings(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x304, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::DropDowns(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x344, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::_Evaluate(const VARIANT& Name)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x1, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name);
	return result;
}

VARIANT Chart::Evaluate(const VARIANT& Name)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xfffffffb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Name);
	return result;
}

VARIANT Chart::GroupBoxes(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x342, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::GroupObjects(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x459, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::Labels(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x349, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::LineGroups(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xc, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::Lines(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x2ff, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::ListBoxes(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x340, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::Move(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x27d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT Chart::OLEObjects(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x31f, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::OptionButtons(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x33a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::Ovals(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x321, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::Paste(const VARIANT& Type)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xd3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Type);
	return result;
}

VARIANT Chart::Pictures(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x303, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::PieGroups(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xd, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::PrintOut(const VARIANT& From, const VARIANT& To, const VARIANT& Copies, const VARIANT& Preview)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x389, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&From, &To, &Copies, &Preview);
	return result;
}

VARIANT Chart::PrintPreview()
{
	VARIANT result;
	InvokeHelper(0x119, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Chart::Protect(const VARIANT& Password, const VARIANT& DrawingObjects, const VARIANT& Contents, const VARIANT& Scenarios)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x11a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Password, &DrawingObjects, &Contents, &Scenarios);
	return result;
}

VARIANT Chart::RadarGroups(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xf, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::Rectangles(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x306, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::SaveAs(const VARIANT& Filename, const VARIANT& FileFormat, const VARIANT& Password, const VARIANT& WriteResPassword, const VARIANT& ReadOnlyRecommended, const VARIANT& CreateBackup)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x11c, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Filename, &FileFormat, &Password, &WriteResPassword, &ReadOnlyRecommended, &CreateBackup);
	return result;
}

VARIANT Chart::ScrollBars(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x33e, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}

VARIANT Chart::SeriesCollection(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x44, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::Spinners(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x346, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::TextBoxes(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x309, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Chart::Unprotect(const VARIANT& Password)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x11d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Password);
	return result;
}

VARIANT Chart::XYGroups(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x10, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Charts properties

VARIANT Charts::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Charts::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Charts::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Charts::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Charts::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Charts::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Charts::GetVisible()
{
	VARIANT result;
	GetProperty(0x22e, VT_VARIANT, (void*)&result);
	return result;
}

void Charts::SetVisible(const VARIANT& propVal)
{
	SetProperty(0x22e, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Charts operations

VARIANT Charts::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Charts::Add(const VARIANT& Before, const VARIANT& After, const VARIANT& Count)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After, &Count);
	return result;
}

VARIANT Charts::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Charts::Copy(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT Charts::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Charts::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Charts::Move(const VARIANT& Before, const VARIANT& After)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x27d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Before, &After);
	return result;
}

VARIANT Charts::PrintOut(const VARIANT& From, const VARIANT& To, const VARIANT& Copies, const VARIANT& Preview)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x389, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&From, &To, &Copies, &Preview);
	return result;
}

VARIANT Charts::PrintPreview()
{
	VARIANT result;
	InvokeHelper(0x119, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Charts::Select(const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Replace);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// ChartGroup properties

VARIANT ChartGroup::GetAxisGroup()
{
	VARIANT result;
	GetProperty(0x2f, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetAxisGroup(const VARIANT& propVal)
{
	SetProperty(0x2f, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetDoughnutHoleSize()
{
	VARIANT result;
	GetProperty(0x466, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetDoughnutHoleSize(const VARIANT& propVal)
{
	SetProperty(0x466, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetDownBars()
{
	VARIANT result;
	GetProperty(0x8d, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetDownBars(const VARIANT& propVal)
{
	SetProperty(0x8d, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetDropLines()
{
	VARIANT result;
	GetProperty(0x8e, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetDropLines(const VARIANT& propVal)
{
	SetProperty(0x8e, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetFirstSliceAngle()
{
	VARIANT result;
	GetProperty(0x3f, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetFirstSliceAngle(const VARIANT& propVal)
{
	SetProperty(0x3f, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetGapWidth()
{
	VARIANT result;
	GetProperty(0x33, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetGapWidth(const VARIANT& propVal)
{
	SetProperty(0x33, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetHasDropLines()
{
	VARIANT result;
	GetProperty(0x3d, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetHasDropLines(const VARIANT& propVal)
{
	SetProperty(0x3d, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetHasHiLoLines()
{
	VARIANT result;
	GetProperty(0x3e, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetHasHiLoLines(const VARIANT& propVal)
{
	SetProperty(0x3e, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetHasRadarAxisLabels()
{
	VARIANT result;
	GetProperty(0x40, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetHasRadarAxisLabels(const VARIANT& propVal)
{
	SetProperty(0x40, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetHasSeriesLines()
{
	VARIANT result;
	GetProperty(0x41, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetHasSeriesLines(const VARIANT& propVal)
{
	SetProperty(0x41, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetHasUpDownBars()
{
	VARIANT result;
	GetProperty(0x42, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetHasUpDownBars(const VARIANT& propVal)
{
	SetProperty(0x42, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetHiLoLines()
{
	VARIANT result;
	GetProperty(0x8f, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetHiLoLines(const VARIANT& propVal)
{
	SetProperty(0x8f, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetOverlap()
{
	VARIANT result;
	GetProperty(0x38, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetOverlap(const VARIANT& propVal)
{
	SetProperty(0x38, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetRadarAxisLabels()
{
	VARIANT result;
	GetProperty(0x90, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetRadarAxisLabels(const VARIANT& propVal)
{
	SetProperty(0x90, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetSeriesLines()
{
	VARIANT result;
	GetProperty(0x91, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetSeriesLines(const VARIANT& propVal)
{
	SetProperty(0x91, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetSubType()
{
	VARIANT result;
	GetProperty(0x6d, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetSubType(const VARIANT& propVal)
{
	SetProperty(0x6d, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetType()
{
	VARIANT result;
	GetProperty(0x6c, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetType(const VARIANT& propVal)
{
	SetProperty(0x6c, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetUpBars()
{
	VARIANT result;
	GetProperty(0x8c, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetUpBars(const VARIANT& propVal)
{
	SetProperty(0x8c, VT_VARIANT, &propVal);
}

VARIANT ChartGroup::GetVaryByCategories()
{
	VARIANT result;
	GetProperty(0x3c, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroup::SetVaryByCategories(const VARIANT& propVal)
{
	SetProperty(0x3c, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// ChartGroup operations

VARIANT ChartGroup::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartGroup::SeriesCollection(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x44, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// ChartGroups properties

VARIANT ChartGroups::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroups::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT ChartGroups::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroups::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT ChartGroups::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void ChartGroups::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// ChartGroups operations

VARIANT ChartGroups::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartGroups::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT ChartGroups::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Axis properties

VARIANT Axis::GetAxisBetweenCategories()
{
	VARIANT result;
	GetProperty(0x2d, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetAxisBetweenCategories(const VARIANT& propVal)
{
	SetProperty(0x2d, VT_VARIANT, &propVal);
}

VARIANT Axis::GetAxisGroup()
{
	VARIANT result;
	GetProperty(0x2f, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetAxisGroup(const VARIANT& propVal)
{
	SetProperty(0x2f, VT_VARIANT, &propVal);
}

VARIANT Axis::GetAxisTitle()
{
	VARIANT result;
	GetProperty(0x52, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetAxisTitle(const VARIANT& propVal)
{
	SetProperty(0x52, VT_VARIANT, &propVal);
}

VARIANT Axis::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Axis::GetCategoryNames()
{
	VARIANT result;
	GetProperty(0x9c, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetCategoryNames(const VARIANT& propVal)
{
	SetProperty(0x9c, VT_VARIANT, &propVal);
}

VARIANT Axis::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Axis::GetCrosses()
{
	VARIANT result;
	GetProperty(0x2a, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetCrosses(const VARIANT& propVal)
{
	SetProperty(0x2a, VT_VARIANT, &propVal);
}

VARIANT Axis::GetCrossesAt()
{
	VARIANT result;
	GetProperty(0x2b, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetCrossesAt(const VARIANT& propVal)
{
	SetProperty(0x2b, VT_VARIANT, &propVal);
}

VARIANT Axis::GetHasMajorGridlines()
{
	VARIANT result;
	GetProperty(0x18, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetHasMajorGridlines(const VARIANT& propVal)
{
	SetProperty(0x18, VT_VARIANT, &propVal);
}

VARIANT Axis::GetHasMinorGridlines()
{
	VARIANT result;
	GetProperty(0x19, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetHasMinorGridlines(const VARIANT& propVal)
{
	SetProperty(0x19, VT_VARIANT, &propVal);
}

VARIANT Axis::GetHasTitle()
{
	VARIANT result;
	GetProperty(0x36, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetHasTitle(const VARIANT& propVal)
{
	SetProperty(0x36, VT_VARIANT, &propVal);
}

VARIANT Axis::GetMajorGridlines()
{
	VARIANT result;
	GetProperty(0x59, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetMajorGridlines(const VARIANT& propVal)
{
	SetProperty(0x59, VT_VARIANT, &propVal);
}

VARIANT Axis::GetMajorTickMark()
{
	VARIANT result;
	GetProperty(0x1a, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetMajorTickMark(const VARIANT& propVal)
{
	SetProperty(0x1a, VT_VARIANT, &propVal);
}

VARIANT Axis::GetMajorUnit()
{
	VARIANT result;
	GetProperty(0x25, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetMajorUnit(const VARIANT& propVal)
{
	SetProperty(0x25, VT_VARIANT, &propVal);
}

VARIANT Axis::GetMajorUnitIsAuto()
{
	VARIANT result;
	GetProperty(0x26, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetMajorUnitIsAuto(const VARIANT& propVal)
{
	SetProperty(0x26, VT_VARIANT, &propVal);
}

VARIANT Axis::GetMaximumScale()
{
	VARIANT result;
	GetProperty(0x23, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetMaximumScale(const VARIANT& propVal)
{
	SetProperty(0x23, VT_VARIANT, &propVal);
}

VARIANT Axis::GetMaximumScaleIsAuto()
{
	VARIANT result;
	GetProperty(0x24, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetMaximumScaleIsAuto(const VARIANT& propVal)
{
	SetProperty(0x24, VT_VARIANT, &propVal);
}

VARIANT Axis::GetMinimumScale()
{
	VARIANT result;
	GetProperty(0x21, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetMinimumScale(const VARIANT& propVal)
{
	SetProperty(0x21, VT_VARIANT, &propVal);
}

VARIANT Axis::GetMinimumScaleIsAuto()
{
	VARIANT result;
	GetProperty(0x22, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetMinimumScaleIsAuto(const VARIANT& propVal)
{
	SetProperty(0x22, VT_VARIANT, &propVal);
}

VARIANT Axis::GetMinorGridlines()
{
	VARIANT result;
	GetProperty(0x5a, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetMinorGridlines(const VARIANT& propVal)
{
	SetProperty(0x5a, VT_VARIANT, &propVal);
}

VARIANT Axis::GetMinorTickMark()
{
	VARIANT result;
	GetProperty(0x1b, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetMinorTickMark(const VARIANT& propVal)
{
	SetProperty(0x1b, VT_VARIANT, &propVal);
}

VARIANT Axis::GetMinorUnit()
{
	VARIANT result;
	GetProperty(0x27, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetMinorUnit(const VARIANT& propVal)
{
	SetProperty(0x27, VT_VARIANT, &propVal);
}

VARIANT Axis::GetMinorUnitIsAuto()
{
	VARIANT result;
	GetProperty(0x28, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetMinorUnitIsAuto(const VARIANT& propVal)
{
	SetProperty(0x28, VT_VARIANT, &propVal);
}

VARIANT Axis::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Axis::GetReversePlotOrder()
{
	VARIANT result;
	GetProperty(0x2c, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetReversePlotOrder(const VARIANT& propVal)
{
	SetProperty(0x2c, VT_VARIANT, &propVal);
}

VARIANT Axis::GetScaleType()
{
	VARIANT result;
	GetProperty(0x29, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetScaleType(const VARIANT& propVal)
{
	SetProperty(0x29, VT_VARIANT, &propVal);
}

VARIANT Axis::GetTickLabelPosition()
{
	VARIANT result;
	GetProperty(0x1c, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetTickLabelPosition(const VARIANT& propVal)
{
	SetProperty(0x1c, VT_VARIANT, &propVal);
}

VARIANT Axis::GetTickLabels()
{
	VARIANT result;
	GetProperty(0x5b, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetTickLabels(const VARIANT& propVal)
{
	SetProperty(0x5b, VT_VARIANT, &propVal);
}

VARIANT Axis::GetTickLabelSpacing()
{
	VARIANT result;
	GetProperty(0x1d, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetTickLabelSpacing(const VARIANT& propVal)
{
	SetProperty(0x1d, VT_VARIANT, &propVal);
}

VARIANT Axis::GetTickMarkSpacing()
{
	VARIANT result;
	GetProperty(0x1f, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetTickMarkSpacing(const VARIANT& propVal)
{
	SetProperty(0x1f, VT_VARIANT, &propVal);
}

VARIANT Axis::GetType()
{
	VARIANT result;
	GetProperty(0x6c, VT_VARIANT, (void*)&result);
	return result;
}

void Axis::SetType(const VARIANT& propVal)
{
	SetProperty(0x6c, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Axis operations

VARIANT Axis::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Axis::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Axis::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Axes properties

VARIANT Axes::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Axes::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Axes::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Axes::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Axes::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Axes::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Axes operations

VARIANT Axes::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Axes::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Axes::Item(const VARIANT& Type, const VARIANT& AxisGroup)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Type, &AxisGroup);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// DataLabel properties

VARIANT DataLabel::GetAutoText()
{
	VARIANT result;
	GetProperty(0x87, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetAutoText(const VARIANT& propVal)
{
	SetProperty(0x87, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetHorizontalAlignment()
{
	VARIANT result;
	GetProperty(0x88, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetHorizontalAlignment(const VARIANT& propVal)
{
	SetProperty(0x88, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetNumberFormat()
{
	VARIANT result;
	GetProperty(0xc1, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetNumberFormat(const VARIANT& propVal)
{
	SetProperty(0xc1, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetNumberFormatLinked()
{
	VARIANT result;
	GetProperty(0xc2, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetNumberFormatLinked(const VARIANT& propVal)
{
	SetProperty(0xc2, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetShowLegendKey()
{
	VARIANT result;
	GetProperty(0xab, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetShowLegendKey(const VARIANT& propVal)
{
	SetProperty(0xab, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetType()
{
	VARIANT result;
	GetProperty(0x6c, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetType(const VARIANT& propVal)
{
	SetProperty(0x6c, VT_VARIANT, &propVal);
}

VARIANT DataLabel::GetVerticalAlignment()
{
	VARIANT result;
	GetProperty(0x89, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabel::SetVerticalAlignment(const VARIANT& propVal)
{
	SetProperty(0x89, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// DataLabel operations

VARIANT DataLabel::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DataLabel::Characters(const VARIANT& Start, const VARIANT& Length)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x25b, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Start, &Length);
	return result;
}

VARIANT DataLabel::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DataLabel::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// DataLabels properties

VARIANT DataLabels::GetAutoText()
{
	VARIANT result;
	GetProperty(0x87, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetAutoText(const VARIANT& propVal)
{
	SetProperty(0x87, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetCaption()
{
	VARIANT result;
	GetProperty(0x8b, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetCaption(const VARIANT& propVal)
{
	SetProperty(0x8b, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetHorizontalAlignment()
{
	VARIANT result;
	GetProperty(0x88, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetHorizontalAlignment(const VARIANT& propVal)
{
	SetProperty(0x88, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetLeft()
{
	VARIANT result;
	GetProperty(0x7f, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetLeft(const VARIANT& propVal)
{
	SetProperty(0x7f, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetNumberFormat()
{
	VARIANT result;
	GetProperty(0xc1, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetNumberFormat(const VARIANT& propVal)
{
	SetProperty(0xc1, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetNumberFormatLinked()
{
	VARIANT result;
	GetProperty(0xc2, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetNumberFormatLinked(const VARIANT& propVal)
{
	SetProperty(0xc2, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetOrientation()
{
	VARIANT result;
	GetProperty(0x86, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetOrientation(const VARIANT& propVal)
{
	SetProperty(0x86, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetShadow()
{
	VARIANT result;
	GetProperty(0x67, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetShadow(const VARIANT& propVal)
{
	SetProperty(0x67, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetShowLegendKey()
{
	VARIANT result;
	GetProperty(0xab, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetShowLegendKey(const VARIANT& propVal)
{
	SetProperty(0xab, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetText()
{
	VARIANT result;
	GetProperty(0x8a, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetText(const VARIANT& propVal)
{
	SetProperty(0x8a, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetTop()
{
	VARIANT result;
	GetProperty(0x7e, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetTop(const VARIANT& propVal)
{
	SetProperty(0x7e, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetType()
{
	VARIANT result;
	GetProperty(0x6c, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetType(const VARIANT& propVal)
{
	SetProperty(0x6c, VT_VARIANT, &propVal);
}

VARIANT DataLabels::GetVerticalAlignment()
{
	VARIANT result;
	GetProperty(0x89, VT_VARIANT, (void*)&result);
	return result;
}

void DataLabels::SetVerticalAlignment(const VARIANT& propVal)
{
	SetProperty(0x89, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// DataLabels operations

VARIANT DataLabels::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DataLabels::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DataLabels::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT DataLabels::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT DataLabels::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Point properties

VARIANT Point::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Point::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Point::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Point::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Point::GetDataLabel()
{
	VARIANT result;
	GetProperty(0x9e, VT_VARIANT, (void*)&result);
	return result;
}

void Point::SetDataLabel(const VARIANT& propVal)
{
	SetProperty(0x9e, VT_VARIANT, &propVal);
}

VARIANT Point::GetExplosion()
{
	VARIANT result;
	GetProperty(0xb6, VT_VARIANT, (void*)&result);
	return result;
}

void Point::SetExplosion(const VARIANT& propVal)
{
	SetProperty(0xb6, VT_VARIANT, &propVal);
}

VARIANT Point::GetHasDataLabel()
{
	VARIANT result;
	GetProperty(0x4d, VT_VARIANT, (void*)&result);
	return result;
}

void Point::SetHasDataLabel(const VARIANT& propVal)
{
	SetProperty(0x4d, VT_VARIANT, &propVal);
}

VARIANT Point::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Point::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Point::GetInvertIfNegative()
{
	VARIANT result;
	GetProperty(0x84, VT_VARIANT, (void*)&result);
	return result;
}

void Point::SetInvertIfNegative(const VARIANT& propVal)
{
	SetProperty(0x84, VT_VARIANT, &propVal);
}

VARIANT Point::GetMarkerBackgroundColor()
{
	VARIANT result;
	GetProperty(0x49, VT_VARIANT, (void*)&result);
	return result;
}

void Point::SetMarkerBackgroundColor(const VARIANT& propVal)
{
	SetProperty(0x49, VT_VARIANT, &propVal);
}

VARIANT Point::GetMarkerBackgroundColorIndex()
{
	VARIANT result;
	GetProperty(0x4a, VT_VARIANT, (void*)&result);
	return result;
}

void Point::SetMarkerBackgroundColorIndex(const VARIANT& propVal)
{
	SetProperty(0x4a, VT_VARIANT, &propVal);
}

VARIANT Point::GetMarkerForegroundColor()
{
	VARIANT result;
	GetProperty(0x4b, VT_VARIANT, (void*)&result);
	return result;
}

void Point::SetMarkerForegroundColor(const VARIANT& propVal)
{
	SetProperty(0x4b, VT_VARIANT, &propVal);
}

VARIANT Point::GetMarkerForegroundColorIndex()
{
	VARIANT result;
	GetProperty(0x4c, VT_VARIANT, (void*)&result);
	return result;
}

void Point::SetMarkerForegroundColorIndex(const VARIANT& propVal)
{
	SetProperty(0x4c, VT_VARIANT, &propVal);
}

VARIANT Point::GetMarkerStyle()
{
	VARIANT result;
	GetProperty(0x48, VT_VARIANT, (void*)&result);
	return result;
}

void Point::SetMarkerStyle(const VARIANT& propVal)
{
	SetProperty(0x48, VT_VARIANT, &propVal);
}

VARIANT Point::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Point::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Point::GetPictureType()
{
	VARIANT result;
	GetProperty(0xa1, VT_VARIANT, (void*)&result);
	return result;
}

void Point::SetPictureType(const VARIANT& propVal)
{
	SetProperty(0xa1, VT_VARIANT, &propVal);
}

VARIANT Point::GetPictureUnit()
{
	VARIANT result;
	GetProperty(0xa2, VT_VARIANT, (void*)&result);
	return result;
}

void Point::SetPictureUnit(const VARIANT& propVal)
{
	SetProperty(0xa2, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Point operations

VARIANT Point::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Point::ApplyDataLabels(const VARIANT& Type, const VARIANT& LegendKey)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x97, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Type, &LegendKey);
	return result;
}

VARIANT Point::ClearFormats()
{
	VARIANT result;
	InvokeHelper(0x70, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Point::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Point::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Point::Paste()
{
	VARIANT result;
	InvokeHelper(0xd3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Point::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Points properties

VARIANT Points::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Points::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Points::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Points::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Points::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Points::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Points operations

VARIANT Points::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Points::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Points::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Series properties

VARIANT Series::GetAxisGroup()
{
	VARIANT result;
	GetProperty(0x2f, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetAxisGroup(const VARIANT& propVal)
{
	SetProperty(0x2f, VT_VARIANT, &propVal);
}

VARIANT Series::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Series::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Series::GetErrorBars()
{
	VARIANT result;
	GetProperty(0x9f, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetErrorBars(const VARIANT& propVal)
{
	SetProperty(0x9f, VT_VARIANT, &propVal);
}

VARIANT Series::GetExplosion()
{
	VARIANT result;
	GetProperty(0xb6, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetExplosion(const VARIANT& propVal)
{
	SetProperty(0xb6, VT_VARIANT, &propVal);
}

VARIANT Series::GetFormula()
{
	VARIANT result;
	GetProperty(0x105, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetFormula(const VARIANT& propVal)
{
	SetProperty(0x105, VT_VARIANT, &propVal);
}

VARIANT Series::GetFormulaLocal()
{
	VARIANT result;
	GetProperty(0x107, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetFormulaLocal(const VARIANT& propVal)
{
	SetProperty(0x107, VT_VARIANT, &propVal);
}

VARIANT Series::GetFormulaR1C1()
{
	VARIANT result;
	GetProperty(0x108, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetFormulaR1C1(const VARIANT& propVal)
{
	SetProperty(0x108, VT_VARIANT, &propVal);
}

VARIANT Series::GetFormulaR1C1Local()
{
	VARIANT result;
	GetProperty(0x109, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetFormulaR1C1Local(const VARIANT& propVal)
{
	SetProperty(0x109, VT_VARIANT, &propVal);
}

VARIANT Series::GetHasDataLabels()
{
	VARIANT result;
	GetProperty(0x4e, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetHasDataLabels(const VARIANT& propVal)
{
	SetProperty(0x4e, VT_VARIANT, &propVal);
}

VARIANT Series::GetHasErrorBars()
{
	VARIANT result;
	GetProperty(0xa0, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetHasErrorBars(const VARIANT& propVal)
{
	SetProperty(0xa0, VT_VARIANT, &propVal);
}

VARIANT Series::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT Series::GetInvertIfNegative()
{
	VARIANT result;
	GetProperty(0x84, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetInvertIfNegative(const VARIANT& propVal)
{
	SetProperty(0x84, VT_VARIANT, &propVal);
}

VARIANT Series::GetMarkerBackgroundColor()
{
	VARIANT result;
	GetProperty(0x49, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetMarkerBackgroundColor(const VARIANT& propVal)
{
	SetProperty(0x49, VT_VARIANT, &propVal);
}

VARIANT Series::GetMarkerBackgroundColorIndex()
{
	VARIANT result;
	GetProperty(0x4a, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetMarkerBackgroundColorIndex(const VARIANT& propVal)
{
	SetProperty(0x4a, VT_VARIANT, &propVal);
}

VARIANT Series::GetMarkerForegroundColor()
{
	VARIANT result;
	GetProperty(0x4b, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetMarkerForegroundColor(const VARIANT& propVal)
{
	SetProperty(0x4b, VT_VARIANT, &propVal);
}

VARIANT Series::GetMarkerForegroundColorIndex()
{
	VARIANT result;
	GetProperty(0x4c, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetMarkerForegroundColorIndex(const VARIANT& propVal)
{
	SetProperty(0x4c, VT_VARIANT, &propVal);
}

VARIANT Series::GetMarkerStyle()
{
	VARIANT result;
	GetProperty(0x48, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetMarkerStyle(const VARIANT& propVal)
{
	SetProperty(0x48, VT_VARIANT, &propVal);
}

VARIANT Series::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Series::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Series::GetPictureType()
{
	VARIANT result;
	GetProperty(0xa1, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetPictureType(const VARIANT& propVal)
{
	SetProperty(0xa1, VT_VARIANT, &propVal);
}

VARIANT Series::GetPictureUnit()
{
	VARIANT result;
	GetProperty(0xa2, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetPictureUnit(const VARIANT& propVal)
{
	SetProperty(0xa2, VT_VARIANT, &propVal);
}

VARIANT Series::GetPlotOrder()
{
	VARIANT result;
	GetProperty(0xe4, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetPlotOrder(const VARIANT& propVal)
{
	SetProperty(0xe4, VT_VARIANT, &propVal);
}

VARIANT Series::GetSmooth()
{
	VARIANT result;
	GetProperty(0xa3, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetSmooth(const VARIANT& propVal)
{
	SetProperty(0xa3, VT_VARIANT, &propVal);
}

VARIANT Series::GetType()
{
	VARIANT result;
	GetProperty(0x6c, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetType(const VARIANT& propVal)
{
	SetProperty(0x6c, VT_VARIANT, &propVal);
}

VARIANT Series::GetValues()
{
	VARIANT result;
	GetProperty(0xa4, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetValues(const VARIANT& propVal)
{
	SetProperty(0xa4, VT_VARIANT, &propVal);
}

VARIANT Series::GetXValues()
{
	VARIANT result;
	GetProperty(0x457, VT_VARIANT, (void*)&result);
	return result;
}

void Series::SetXValues(const VARIANT& propVal)
{
	SetProperty(0x457, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Series operations

VARIANT Series::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Series::ApplyDataLabels(const VARIANT& Type, const VARIANT& LegendKey)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x97, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Type, &LegendKey);
	return result;
}

VARIANT Series::ClearFormats()
{
	VARIANT result;
	InvokeHelper(0x70, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Series::Copy()
{
	VARIANT result;
	InvokeHelper(0x227, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Series::DataLabels(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x9d, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Series::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Series::ErrorBar(const VARIANT& Direction, const VARIANT& Include, const VARIANT& Type, const VARIANT& Amount, const VARIANT& MinusValues)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x98, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Direction, &Include, &Type, &Amount, &MinusValues);
	return result;
}

VARIANT Series::Paste()
{
	VARIANT result;
	InvokeHelper(0xd3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Series::Points(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x46, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT Series::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Series::Trendlines(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x9a, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// SeriesCollection properties

VARIANT SeriesCollection::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void SeriesCollection::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT SeriesCollection::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void SeriesCollection::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT SeriesCollection::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void SeriesCollection::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// SeriesCollection operations

VARIANT SeriesCollection::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT SeriesCollection::Add(const VARIANT& Source, const VARIANT& Rowcol, const VARIANT& SeriesLabels, const VARIANT& CategoryLabels, const VARIANT& Replace)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Source, &Rowcol, &SeriesLabels, &CategoryLabels, &Replace);
	return result;
}

VARIANT SeriesCollection::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT SeriesCollection::Extend(const VARIANT& Source, const VARIANT& Rowcol, const VARIANT& CategoryLabels)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xe3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Source, &Rowcol, &CategoryLabels);
	return result;
}

VARIANT SeriesCollection::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}

VARIANT SeriesCollection::Paste(const VARIANT& Rowcol, const VARIANT& SeriesLabels, const VARIANT& CategoryLabels, const VARIANT& Replace, const VARIANT& NewSeries)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xd3, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Rowcol, &SeriesLabels, &CategoryLabels, &Replace, &NewSeries);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// LegendEntry properties

VARIANT LegendEntry::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void LegendEntry::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT LegendEntry::GetFont()
{
	VARIANT result;
	GetProperty(0x92, VT_VARIANT, (void*)&result);
	return result;
}

void LegendEntry::SetFont(const VARIANT& propVal)
{
	SetProperty(0x92, VT_VARIANT, &propVal);
}

VARIANT LegendEntry::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void LegendEntry::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT LegendEntry::GetLegendKey()
{
	VARIANT result;
	GetProperty(0xae, VT_VARIANT, (void*)&result);
	return result;
}

void LegendEntry::SetLegendKey(const VARIANT& propVal)
{
	SetProperty(0xae, VT_VARIANT, &propVal);
}

VARIANT LegendEntry::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void LegendEntry::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// LegendEntry operations

VARIANT LegendEntry::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT LegendEntry::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT LegendEntry::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// LegendEntries properties

VARIANT LegendEntries::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void LegendEntries::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT LegendEntries::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void LegendEntries::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT LegendEntries::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void LegendEntries::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// LegendEntries operations

VARIANT LegendEntries::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT LegendEntries::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT LegendEntries::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// LegendKey properties

VARIANT LegendKey::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void LegendKey::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT LegendKey::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void LegendKey::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT LegendKey::GetInterior()
{
	VARIANT result;
	GetProperty(0x81, VT_VARIANT, (void*)&result);
	return result;
}

void LegendKey::SetInterior(const VARIANT& propVal)
{
	SetProperty(0x81, VT_VARIANT, &propVal);
}

VARIANT LegendKey::GetInvertIfNegative()
{
	VARIANT result;
	GetProperty(0x84, VT_VARIANT, (void*)&result);
	return result;
}

void LegendKey::SetInvertIfNegative(const VARIANT& propVal)
{
	SetProperty(0x84, VT_VARIANT, &propVal);
}

VARIANT LegendKey::GetMarkerBackgroundColor()
{
	VARIANT result;
	GetProperty(0x49, VT_VARIANT, (void*)&result);
	return result;
}

void LegendKey::SetMarkerBackgroundColor(const VARIANT& propVal)
{
	SetProperty(0x49, VT_VARIANT, &propVal);
}

VARIANT LegendKey::GetMarkerBackgroundColorIndex()
{
	VARIANT result;
	GetProperty(0x4a, VT_VARIANT, (void*)&result);
	return result;
}

void LegendKey::SetMarkerBackgroundColorIndex(const VARIANT& propVal)
{
	SetProperty(0x4a, VT_VARIANT, &propVal);
}

VARIANT LegendKey::GetMarkerForegroundColor()
{
	VARIANT result;
	GetProperty(0x4b, VT_VARIANT, (void*)&result);
	return result;
}

void LegendKey::SetMarkerForegroundColor(const VARIANT& propVal)
{
	SetProperty(0x4b, VT_VARIANT, &propVal);
}

VARIANT LegendKey::GetMarkerForegroundColorIndex()
{
	VARIANT result;
	GetProperty(0x4c, VT_VARIANT, (void*)&result);
	return result;
}

void LegendKey::SetMarkerForegroundColorIndex(const VARIANT& propVal)
{
	SetProperty(0x4c, VT_VARIANT, &propVal);
}

VARIANT LegendKey::GetMarkerStyle()
{
	VARIANT result;
	GetProperty(0x48, VT_VARIANT, (void*)&result);
	return result;
}

void LegendKey::SetMarkerStyle(const VARIANT& propVal)
{
	SetProperty(0x48, VT_VARIANT, &propVal);
}

VARIANT LegendKey::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void LegendKey::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT LegendKey::GetSmooth()
{
	VARIANT result;
	GetProperty(0xa3, VT_VARIANT, (void*)&result);
	return result;
}

void LegendKey::SetSmooth(const VARIANT& propVal)
{
	SetProperty(0xa3, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// LegendKey operations

VARIANT LegendKey::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT LegendKey::ClearFormats()
{
	VARIANT result;
	InvokeHelper(0x70, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT LegendKey::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT LegendKey::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Trendline properties

VARIANT Trendline::GetBackward()
{
	VARIANT result;
	GetProperty(0xb9, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetBackward(const VARIANT& propVal)
{
	SetProperty(0xb9, VT_VARIANT, &propVal);
}

VARIANT Trendline::GetBorder()
{
	VARIANT result;
	GetProperty(0x80, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetBorder(const VARIANT& propVal)
{
	SetProperty(0x80, VT_VARIANT, &propVal);
}

VARIANT Trendline::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Trendline::GetDataLabel()
{
	VARIANT result;
	GetProperty(0x9e, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetDataLabel(const VARIANT& propVal)
{
	SetProperty(0x9e, VT_VARIANT, &propVal);
}

VARIANT Trendline::GetDisplayEquation()
{
	VARIANT result;
	GetProperty(0xbe, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetDisplayEquation(const VARIANT& propVal)
{
	SetProperty(0xbe, VT_VARIANT, &propVal);
}

VARIANT Trendline::GetDisplayRSquared()
{
	VARIANT result;
	GetProperty(0xbd, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetDisplayRSquared(const VARIANT& propVal)
{
	SetProperty(0xbd, VT_VARIANT, &propVal);
}

VARIANT Trendline::GetForward()
{
	VARIANT result;
	GetProperty(0xbf, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetForward(const VARIANT& propVal)
{
	SetProperty(0xbf, VT_VARIANT, &propVal);
}

VARIANT Trendline::GetIndex()
{
	VARIANT result;
	GetProperty(0x1e6, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetIndex(const VARIANT& propVal)
{
	SetProperty(0x1e6, VT_VARIANT, &propVal);
}

VARIANT Trendline::GetIntercept()
{
	VARIANT result;
	GetProperty(0xba, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetIntercept(const VARIANT& propVal)
{
	SetProperty(0xba, VT_VARIANT, &propVal);
}

VARIANT Trendline::GetInterceptIsAuto()
{
	VARIANT result;
	GetProperty(0xbb, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetInterceptIsAuto(const VARIANT& propVal)
{
	SetProperty(0xbb, VT_VARIANT, &propVal);
}

VARIANT Trendline::GetName()
{
	VARIANT result;
	GetProperty(0x6e, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetName(const VARIANT& propVal)
{
	SetProperty(0x6e, VT_VARIANT, &propVal);
}

VARIANT Trendline::GetNameIsAuto()
{
	VARIANT result;
	GetProperty(0xbc, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetNameIsAuto(const VARIANT& propVal)
{
	SetProperty(0xbc, VT_VARIANT, &propVal);
}

VARIANT Trendline::GetOrder()
{
	VARIANT result;
	GetProperty(0xc0, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetOrder(const VARIANT& propVal)
{
	SetProperty(0xc0, VT_VARIANT, &propVal);
}

VARIANT Trendline::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

VARIANT Trendline::GetPeriod()
{
	VARIANT result;
	GetProperty(0xb8, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetPeriod(const VARIANT& propVal)
{
	SetProperty(0xb8, VT_VARIANT, &propVal);
}

VARIANT Trendline::GetType()
{
	VARIANT result;
	GetProperty(0x6c, VT_VARIANT, (void*)&result);
	return result;
}

void Trendline::SetType(const VARIANT& propVal)
{
	SetProperty(0x6c, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Trendline operations

VARIANT Trendline::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Trendline::ClearFormats()
{
	VARIANT result;
	InvokeHelper(0x70, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Trendline::Delete()
{
	VARIANT result;
	InvokeHelper(0x75, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Trendline::Select()
{
	VARIANT result;
	InvokeHelper(0xeb, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// Trendlines properties

VARIANT Trendlines::GetCount()
{
	VARIANT result;
	GetProperty(0x76, VT_VARIANT, (void*)&result);
	return result;
}

void Trendlines::SetCount(const VARIANT& propVal)
{
	SetProperty(0x76, VT_VARIANT, &propVal);
}

VARIANT Trendlines::GetCreator()
{
	VARIANT result;
	GetProperty(0x95, VT_VARIANT, (void*)&result);
	return result;
}

void Trendlines::SetCreator(const VARIANT& propVal)
{
	SetProperty(0x95, VT_VARIANT, &propVal);
}

VARIANT Trendlines::GetParent()
{
	VARIANT result;
	GetProperty(0x96, VT_VARIANT, (void*)&result);
	return result;
}

void Trendlines::SetParent(const VARIANT& propVal)
{
	SetProperty(0x96, VT_VARIANT, &propVal);
}

/////////////////////////////////////////////////////////////////////////////
// Trendlines operations

VARIANT Trendlines::_NewEnum()
{
	VARIANT result;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Trendlines::Add(const VARIANT& Type, const VARIANT& Order, const VARIANT& Period, const VARIANT& Forward, const VARIANT& Backward, const VARIANT& Intercept, const VARIANT& DisplayEquation, const VARIANT& DisplayRSquared, const VARIANT& Name)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0xb5, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Type, &Order, &Period, &Forward, &Backward, &Intercept, &DisplayEquation, &DisplayRSquared, &Name);
	return result;
}

VARIANT Trendlines::Application()
{
	VARIANT result;
	InvokeHelper(0x94, DISPATCH_METHOD, VT_VARIANT, (void*)&result, NULL);
	return result;
}

VARIANT Trendlines::Item(const VARIANT& Index)
{
	VARIANT result;
	static BYTE BASED_CODE parms[] =
		VTS_VARIANT;
	InvokeHelper(0xaa, DISPATCH_METHOD, VT_VARIANT, (void*)&result, parms,
		&Index);
	return result;
}
