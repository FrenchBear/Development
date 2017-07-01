[
    dllname("dummy")  
]
module constants {

    // Clipboard Formats

    const LPSTR CFSTR_SHELLIDLIST         = "Shell IDList Array";
    const LPSTR CFSTR_SHELLIDLISTOFFSET   = "Shell Object Offsets";
    const LPSTR CFSTR_NETRESOURCES        = "Net Resource";
    const LPSTR CFSTR_FILEDESCRIPTORA     = "FileGroupDescriptor";
    const LPSTR CFSTR_FILEDESCRIPTORW     = "FileGroupDescriptorW";
    const LPSTR CFSTR_FILECONTENTS        = "FileContents";
    const LPSTR CFSTR_FILENAMEA           = "FileName";
    const LPSTR CFSTR_FILENAMEW           = "FileNameW";
    const LPSTR CFSTR_PRINTERGROUP        = "PrinterFriendlyName";
    const LPSTR CFSTR_FILENAMEMAPA        = "FileNameMap";
    const LPSTR CFSTR_FILENAMEMAPW        = "FileNameMapW";
    const LPSTR CFSTR_SHELLURL            = "UniformResourceLocator";
    const LPSTR CFSTR_INETURLA            = "UniformResourceLocator";
    const LPSTR CFSTR_INETURLW            = "UniformResourceLocatorW";
    const LPSTR CFSTR_PREFERREDDROPEFFECT = "Preferred DropEffect";
    const LPSTR CFSTR_PERFORMEDDROPEFFECT = "Performed DropEffect";
    const LPSTR CFSTR_PASTESUCCEEDED      = "Paste Succeeded";
    const LPSTR CFSTR_INDRAGLOOP          = "InShellDragLoop";
    const LPSTR CFSTR_DRAGCONTEXT         = "DragContext";
    const LPSTR CFSTR_MOUNTEDVOLUME       = "MountedVolume";
    const LPSTR CFSTR_PERSISTEDDATAOBJECT = "PersistedDataObject";
    const LPSTR CFSTR_TARGETCLSID         = "TargetCLSID";   // HGLOBAL with a CLSID of the drop target
    const LPSTR CFSTR_LOGICALPERFORMEDDROPEFFECT = "Logical Performed DropEffect";
    const LPSTR CFSTR_OutlookExpressMessages = "Outlook Express Messages";
    const LPSTR CFSTR_HYPERLINK           = "Hyperlink";

    // Mime types
    const LPSTR CFSTR_MIME_NULL = 0;
    const LPSTR CFSTR_MIME_TEXT         = "text/plain";
    const LPSTR CFSTR_MIME_RICHTEXT     = "text/richtext";
    const LPSTR CFSTR_MIME_X_BITMAP     = "image/x-xbitmap";
    const LPSTR CFSTR_MIME_POSTSCRIPT   = "application/postscript";
    const LPSTR CFSTR_MIME_AIFF         = "audio/aiff";
    const LPSTR CFSTR_MIME_BASICAUDIO   = "audio/basic";
    const LPSTR CFSTR_MIME_WAV          = "audio/wav";
    const LPSTR CFSTR_MIME_X_WAV        = "audio/x-wav";
    const LPSTR CFSTR_MIME_GIF          = "image/gif";
    const LPSTR CFSTR_MIME_PJPEG        = "image/pjpeg";
    const LPSTR CFSTR_MIME_JPEG         = "image/jpeg";
    const LPSTR CFSTR_MIME_TIFF         = "image/tiff";
    const LPSTR CFSTR_MIME_X_PNG        = "image/x-png";
    const LPSTR CFSTR_MIME_BMP          = "image/bmp";
    const LPSTR CFSTR_MIME_X_ART        = "image/x-jg";
    const LPSTR CFSTR_MIME_X_EMF        = "image/x-emf";
    const LPSTR CFSTR_MIME_X_WMF        = "image/x-wmf";
    const LPSTR CFSTR_MIME_AVI          = "video/avi";
    const LPSTR CFSTR_MIME_MPEG         = "video/mpeg";
    const LPSTR CFSTR_MIME_FRACTALS     = "application/fractals";
    const LPSTR CFSTR_MIME_RAWDATA      = "application/octet-stream";
    const LPSTR CFSTR_MIME_RAWDATASTRM  = "application/octet-stream";
    const LPSTR CFSTR_MIME_PDF          = "application/pdf";
    const LPSTR CFSTR_MIME_HTA          = "application/hta";
    const LPSTR CFSTR_MIME_X_AIFF       = "audio/x-aiff";
    const LPSTR CFSTR_MIME_X_REALAUDIO  = "audio/x-pn-realaudio";
    const LPSTR CFSTR_MIME_XBM          = "image/xbm";
    const LPSTR CFSTR_MIME_QUICKTIME    = "video/quicktime";
    const LPSTR CFSTR_MIME_X_MSVIDEO    = "video/x-msvideo";
    const LPSTR CFSTR_MIME_X_SGI_MOVIE  = "video/x-sgi-movie";
    const LPSTR CFSTR_MIME_HTML         = "text/html";
    const LPSTR CFSTR_MIME_XML          = "text/xml";
    
    const short CF_HDROP = 15;

    const LONG DVASPECT_SHORTNAME = 2; // use for CF_HDROP to get short name version of file paths
    const LONG DVASPECT_COPY      = 3; // use to indicate format is a "Copy" of the data (FILECONTENTS, FILEDESCRIPTOR, etc)
    const LONG DVASPECT_LINK      = 4; // use to indicate format is a "Shortcut" to the data (FILECONTENTS, FILEDESCRIPTOR, etc)

    // Command group IDs
    const LPSTR CGIDSTR_EditStateCommands     = "{3050f4b6-98b5-11cf-bb82-00aa00bdce0b}";
    const LPSTR CGIDSTR_DocHostCommandHandler = "{f38bc242-b950-11d1-8918-00c04fc2c836}";
    const LPSTR CGIDSTR_DeskBand              = "{EB0FE172-1A3A-11D0-89B3-00A0C90A90AC}";
    const LPSTR CGIDSTR_Explorer              = "{000214D0-0000-0000-C000-000000000046}";
    const LPSTR CGIDSTR_ShellDocView          = "{000214D1-0000-0000-C000-000000000046}";
    const LPSTR CGIDSTR_ShellServiceObject    = "{000214D2-0000-0000-C000-000000000046}";
    const LPSTR CGIDSTR_ExplorerBarDoc        = "{000214D3-0000-0000-C000-000000000046}";
    const LPSTR CGIDSTR_IDeskBand             = "{EB0FE172-1A3A-11D0-89B3-00A0C90A90AC}";
    const LPSTR CGIDSTR_ShortCut              = "{93a68750-951a-11d1-946f-000000000000}";
    const LPSTR CGIDSTR_HTML                  = "{DE4BA900-59CA-11CF-9592-444553540000}";

    // Interface IDs
    const LPSTR IIDSTR_IUnknown                 = "{00000000-0000-0000-C000-000000000046}";
    const LPSTR IIDSTR_IDispatch                = "{00020400-0000-0000-C000-000000000046}";
    const LPSTR IIDSTR_IConnectionPoint         = "{B196B286-BAB4-101A-B69C-00AA00341D07}";
    const LPSTR IIDSTR_IConnectionPointContainer= "{B196B284-BAB4-101A-B69C-00AA00341D07}";
    const LPSTR IIDSTR_IOleClientSite           = "{00000118-0000-0000-C000-000000000046}";
    const LPSTR IIDSTR_IDocHostShowUI           = "{C4D244B0-D43E-11CF-893B-00AA00BDCE1A}";
    const LPSTR IIDSTR_IDocHostUIHandler        = "{BD3F23C0-D43E-11CF-893B-00AA00BDCE1A}";
    const LPSTR IIDSTR_IServiceProvider         = "{6D5140C1-7436-11CE-8034-00AA006009FA}";
    const LPSTR IIDSTR_IWebBrowserApp           = "{0002DF05-0000-0000-C000-000000000046}";
    const LPSTR IIDSTR_IInternetSecurityManager = "{79eac9ee-baf9-11ce-8c82-00aa004ba90b}";
    const LPSTR IIDSTR_StandardFont             = "{7EBDAAE0-8120-11CF-899F-00AA00688B10}";
    const LPSTR IIDSTR_StandardColor            = "{7EBDAAE1-8120-11CF-899F-00AA00688B10}";
    const LPSTR IIDSTR_StandardPicture          = "{7EBDAAE2-8120-11CF-899F-00AA00688B10}";    
    const LPSTR IIDSTR_IPicture                 = "{7BF80980-BF32-101A-8BBB-00AA00300CAB}";
    const LPSTR IIDSTR_IPictureDisp             = "{7BF80981-BF32-101A-8BBB-00AA00300CAB}";
    const LPSTR IIDSTR_IFont                    = "{BEF6E002-A874-101A-8BBA-00AA00300CAB}";
    const LPSTR IIDSTR_IFontDisp                = "{BEF6E003-A874-101A-8BBA-00AA00300CAB}";
    const LPSTR IIDSTR_IQueryAssociations       = "{c46ca590-3c3f-11d2-bee6-0000f805ca57}";
    const LPSTR IIDSTR_IContextMenu             = "{000214E4-0000-0000-C000-000000000046}";
    const LPSTR IIDSTR_IContextMenu2            = "{000214F4-0000-0000-C000-000000000046}";
    const LPSTR IIDSTR_IQueryInfo               = "{000214E7-0000-0000-C000-000000000046}";
    const LPSTR IIDSTR_IExtractIconA            = "{000214EB-0000-0000-C000-000000000046}";
    const LPSTR IIDSTR_IExtractIconW            = "{000214FA-0000-0000-C000-000000000046}";
    const LPSTR IIDSTR_IShellFolder             = "{000214E6-0000-0000-C000-000000000046}";
    const LPSTR IIDSTR_IShellView               = "{000214E3-0000-0000-C000-000000000046}";
    const LPSTR IIDSTR_IShellView2              = "{88E39E80-3578-11CF-AE69-08002B2E1262}";
    const LPSTR IIDSTR_IRedbookDiscMaster       = "{E3BC42CD-4E5C-11D3-9144-00104BA11C5E)}";
    const LPSTR IIDSTR_IJolietDiscMaster        = "{E3BC42CE-4E5C-11D3-9144-00104BA11C5E}";

    // CLSIDs
    const LPSTR CLSIDSTR_InternetSecurityManager = "{7B8A2D94-0AC9-11D1-896C-00C04FB6BFC4}";
    const LPSTR CLSIDSTR_InternetZoneManager     = "{7B8A2D95-0AC9-11D1-896C-00C04FB6BFC4}";
    const LPSTR CLSIDSTR_QueryAssociations       = "{c46ca590-3c3f-11d2-bee6-0000f805ca57}";
    const LPSTR CLSIDSTR_ShellDesktop            = "{00021400-0000-0000-C000-000000000046}";
    const LPSTR CLSIDSTR_ShellLink               = "{00021401-0000-0000-C000-000000000046}";
    const LPSTR CLSIDSTR_NetworkPlaces           = "{208D2C60-3AEA-1069-A2D7-08002B30309D}";
    const LPSTR CLSIDSTR_NetworkDomain           = "{46e06680-4bf0-11d1-83ee-00a0c90dc849}";
    const LPSTR CLSIDSTR_NetworkServer           = "{c0542a90-4bf0-11d1-83ee-00a0c90dc849}";
    const LPSTR CLSIDSTR_NetworkShare            = "{54a754c0-4bf1-11d1-83ee-00a0c90dc849}";
    const LPSTR CLSIDSTR_MyComputer              = "{20D04FE0-3AEA-1069-A2D8-08002B30309D}";
    const LPSTR CLSIDSTR_Internet                = "{871C5380-42A0-1069-A2EA-08002B30309D}";
    const LPSTR CLSIDSTR_ShellFSFolder           = "{F3364BA0-65B9-11CE-A9BA-00AA004AE837}";
    const LPSTR CLSIDSTR_RecycleBin              = "{645FF040-5081-101B-9F08-00AA002F954E}";
    const LPSTR CLSIDSTR_ControlPanel            = "{21EC2020-3AEA-1069-A2DD-08002B30309D}";
    const LPSTR CLSIDSTR_Printers                = "{2227A280-3AEA-1069-A2DE-08002B30309D}";
    const LPSTR CLSIDSTR_MyDocuments             = "{450D8FBA-AD25-11D0-98A8-0800361B1103}";

    // Category IDs
    [helpstring("Embeddable Objects")]
    const LPSTR CATIDSTR_Insertable          = "{40FC6ED3-2438-11CF-A3DB-080036F12502}";
    [helpstring("Controls")]
    const LPSTR CATIDSTR_Control             = "{40fc6ed4-2438-11cf-a3db-080036f12502}";
    [helpstring("Automation Objects")]
    const LPSTR CATIDSTR_Programmable        = "{40FC6ED5-2438-11CF-A3DB-080036F12502}";
    [helpstring("Document Objects")]
    const LPSTR CATIDSTR_DocObject           = "{40fc6ed8-2438-11cf-a3db-080036f12502}";
    [helpstring("Printable Objects")]
    const LPSTR CATIDSTR_Printable           = "{40fc6ed9-2438-11cf-a3db-080036f12502}";
    [helpstring("Active Scripting Engine With Authoring")]
    const LPSTR CATIDSTR_ActiveScriptAuthor  = "{0AEE2A92-BCBB-11D0-8C72-00C04FC2B085}";
    [helpstring("Active Scripting Engine With Parsing")]
    const LPSTR CATIDSTR_ActiveScriptParse   = "{F0B7A1A2-9847-11cf-8F20-00805F2CD064}";
    [helpstring("Active Scripting Engine")]
    const LPSTR CATIDSTR_ActiveScript        = "{F0B7A1A1-9847-11cf-8F20-00805F2CD064}";
    [helpstring("Active Scripting Engine With Encoding")]
    const LPSTR CATIDSTR_ActiveScriptEncode  = "{F0B7A1A3-9847-11cf-8F20-00805F2CD064}";
    [helpstring("Controls that are safely scriptable")]
    const LPSTR CATIDSTR_SafeForScripting    = "{7DD95801-9882-11CF-9FA9-00AA006C42C4}";
    [helpstring("Controls safely initializable from persistent data")]
    const LPSTR CATIDSTR_SafeForInitializing = "{7DD95802-9882-11CF-9FA9-00AA006C42C4}";
    const LPSTR CATIDSTR_BrowsableShellExt   = "{00021490-0000-0000-C000-000000000046}";
    const LPSTR CATIDSTR_BrowseInPlace       = "{00021491-0000-0000-C000-000000000046}";
    [helpstring("Desktop Bands")]
    const LPSTR CATIDSTR_DeskBand            = "{00021492-0000-0000-C000-000000000046}";
    [helpstring("Internet Explorer Browser Band")]
    const LPSTR CATIDSTR_InfoBand            = "{00021493-0000-0000-C000-000000000046}";
    [helpstring("Internet Explorer Communication Band")]
    const LPSTR CATIDSTR_CommBand            = "{00021494-0000-0000-C000-000000000046}";

/*
		const LPSTR CATIDSTR_RequiresDataPathHost = "";
		const LPSTR CATIDSTR_PersistsToMoniker = "";
		const LPSTR CATIDSTR_PersistsToStorage = "";
		const LPSTR CATIDSTR_PersistsToStreamInit = "";
		const LPSTR CATIDSTR_PersistsToStream = "";
		const LPSTR CATIDSTR_PersistsToMemory = "";
		const LPSTR CATIDSTR_PersistsToFile = "";
		const LPSTR CATIDSTR_PersistsToPropertyBag = "";
		const LPSTR CATIDSTR_InternetAware = "";
		const LPSTR CATIDSTR_DesignTimeUIActivatableControl = "";
		const LPSTR CATIDSTR_IsShortcut = "{}";
		const LPSTR CATIDSTR_NeverShowExt = "{}";
*/

    // Property Set names
    const LPSTR DocumentSummaryInformation = "\005DocumentSummaryInformation";
    const LPSTR SummaryInformation         = "\005SummaryInformation";

    // Format IDs
    const LPSTR FMTIDSTR_SummaryInformation    = "{F29F85E0-4FF9-1068-AB91-08002B27B3D9}";
    const LPSTR FMTIDSTR_DocSummaryInformation = "{D5CDD502-2E9C-101B-9397-08002B2CF9AE}";
    const LPSTR FMTIDSTR_UserProperties        = "{D5CDD505-2E9C-101B-9397-08002B2CF9AE}";
    const LPSTR FMTIDSTR_Intshcut              = "{000214A0-0000-0000-C000-000000000046}";
    const LPSTR FMTIDSTR_InternetSite          = "{000214A1-0000-0000-C000-000000000046}";

    // Service IDs
    const LPSTR SIDSTR_SEditCommandTarget = "{3050f4b5-98b5-11cf-bb82-00aa00bdce0b}";
    const LPSTR SIDSTR_SHTMLEditHost      = "{3050f6a0-98b5-11cf-bb82-00aa00bdce0b}";
    const LPSTR SIDSTR_SHTMLEditServices  = "{3050f7f9-98b5-11cf-bb82-00aa00bdce0b}";
    const LPSTR SIDSTR_SWebBrowserApp     = "{0002DF05-0000-0000-C000-000000000046}";
    const LPSTR SIDSTR_SInternetExplorer  = "{0002DF05-0000-0000-C000-000000000046}";
    const LPSTR SIDSTR_SFolderView        = "{cde725b0-ccc9-4519-917e-325d72fab4ce}";
    const LPSTR SIDSTR_SProfferService    = "{cb728b20-f786-11ce-92ad-00aa00a74cd0}";
    const LPSTR SIDSTR_WebWizardHost      = "{0e6b3f66-98d1-48c0-a222-fbde74e2fbc5}";
    const LPSTR SIDSTR_PublishingWizard   = "{6b33163c-76a5-4b6c-bf21-45de9cd503a1}";
    const LPSTR SIDSTR_SProgressUI        = "{F8383852-FCD3-11d1-A6B9-006097DF5BD4}";
    const LPSTR SIDSTR_SHlinkFrame        = "{79eac9c5-baf9-11ce-8c82-00aa004ba90b}";
    const LPSTR SIDSTR_ShellFolderViewCB  = "{2047E320-F2A9-11CE-AE65-08002B2E1262}";
    const LPSTR SIDSTR_LinkSite           = "{000214F9-0000-0000-C000-000000000046}";
    const LPSTR SIDSTR_SShellBrowser      = "{000214E2-0000-0000-C000-000000000046}";
    const LPSTR SIDSTR_SShellDesktop      = "{00021400-0000-0000-C000-000000000046}";
    const LPSTR SIDSTR_SUrlHistory        = "{3C374A40-BAE4-11CF-BF7D-00AA006946EE}";
    const LPSTR SIDSTR_STopLevelBrowser   = "{4C96BE40-915C-11CF-99D3-00AA004AE837}";

}
