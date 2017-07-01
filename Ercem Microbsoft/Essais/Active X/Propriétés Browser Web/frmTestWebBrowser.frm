VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "SHDOCVW.DLL"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmTestWebBrowser 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Analyse des propriétés d'un WebBrowser"
   ClientHeight    =   7995
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10290
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7995
   ScaleWidth      =   10290
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnTest 
      Caption         =   "Test"
      Height          =   375
      Left            =   1560
      TabIndex        =   3
      Top             =   4020
      Width           =   1035
   End
   Begin MSComctlLib.ListView lw 
      Height          =   3435
      Left            =   120
      TabIndex        =   2
      Top             =   4500
      Width           =   10095
      _ExtentX        =   17806
      _ExtentY        =   6059
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   327682
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   2
      BeginProperty ColumnHeader(1) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Elément"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   1
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Valeur"
         Object.Width           =   6174
      EndProperty
   End
   Begin VB.CommandButton btnInfos 
      Caption         =   "Infos"
      Default         =   -1  'True
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   4020
      Width           =   1155
   End
   Begin SHDocVwCtl.WebBrowser wb 
      Height          =   3735
      Left            =   180
      TabIndex        =   1
      Top             =   180
      Width           =   9975
      ExtentX         =   17595
      ExtentY         =   6588
      ViewMode        =   1
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   -1  'True
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   ""
   End
End
Attribute VB_Name = "frmTestWebBrowser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTestWebBrowser
' Essai de toutes les propriétés d'un browser Web
' Enfin un truc qui marche !!!
' 19/11/97 PV

Option Explicit

Private Sub Add(ByVal sClé As String, ByVal sValeur As String)
  Dim itmX As ListItem
  
  Set itmX = lw.ListItems.Add
  itmX.Text = sClé
  itmX.SubItems(1) = sValeur
  
  'Print #1, sClé & vbTab & sValeur
End Sub

Private Sub btnInfos_Click()
  lw.ListItems.Clear
  'Open "c:\info.txt" For Output As #1
  
  On Error Resume Next
  
  Add "Propriétés de wb", "-------------------------------------------"
  Add "typename(wb)", TypeName(wb)
  Add "AddressBar", wb.AddressBar
  Add "wb.Application", wb.Application
  Add "typename(wb.Application)", TypeName(wb.Application)
  Add "wb.Busy", wb.Busy
  Add "wb.Container.count", wb.Container.Count
  Add "wb.DataBindings.count", wb.DataBindings.Count
  Add "wb.Document", wb.Document
  Add "wb.FullName", wb.FullName
  Add "wb.FullScreen", wb.FullScreen
  Add "wb.Height", wb.Height
  Add "wb.LocationName", wb.LocationName
  Add "wb.LocationURL", wb.LocationURL
  Add "wb.MenuBar", wb.MenuBar
  Add "wb.Object", wb.object
  Add "wb.Offline", wb.Offline
  Add "typename(wb.Parent)", TypeName(wb.Parent)
  Add "wb.Path", wb.Path
  Add "wb.ReadyState", wb.ReadyState
  Add "wb.RegisterAsBrowser", wb.RegisterAsBrowser
  Add "wb.RegisterAsDropTarget", wb.RegisterAsDropTarget
  Add "wb.Resizable", wb.Resizable
  Add "wb.Silent", wb.Silent
  Add "wb.StatusBar", wb.StatusBar
  Add "wb.StatusText", wb.StatusText
  Add "wb.TheaterMode", wb.TheaterMode
  Add "wb.ToolBar", wb.ToolBar
  Add "wb.TopLevelContainer", wb.TopLevelContainer
  Add "wb.Type", wb.Type

  
  Add "wb.Document", "-------------------------------------------"
  Add "TypeName", TypeName(wb.Document)
  Add "activeElement", wb.Document.ActiveElement
  Add "ALinkColor", wb.Document.ALinkColor
  Add "bgColor", wb.Document.bgColor
  Add "Body", wb.Document.Body
  Add "Charset", wb.Document.Charset
  Add "Cookie", wb.Document.Cookie
  Add "DefautCharset", wb.Document.DefaultCharset
  Add "Domain", wb.Document.Domain
  Add "Expando", wb.Document.Expando
  Add "fgColor", wb.Document.fgColor
  Add "lastModified", wb.Document.lastModified
  Add "linkCOlor", wb.Document.linkColor
  Add "Location", wb.Document.location
  Add "parentWindow", wb.Document.ParentWindow
  Add "readyState", wb.Document.ReadyState
  Add "referrer", wb.Document.referrer
  Add "Selection", wb.Document.selection
  Add "title", wb.Document.Title
  Add "URL", wb.Document.url
  Add "vLinkColor", wb.Document.vlinkcolor
  
  Add "all.length", wb.Document.All.length
  Add "all.tags", wb.Document.All.Tags
  Add "all(0).title", wb.Document.All(0).Title
  Add "anchors.length", wb.Document.Anchors.length
  Add "applets.length", wb.Document.Applets.length
  Add "all(1).children.length", wb.Document.All(1).Children.length
  Add "embeds.length", wb.Document.Embeds.length
  Add "forms.length", wb.Document.Forms.length
  Add "frames.length", wb.Document.Frames.length
  Add "images.length", wb.Document.Images.length
  Add "links.length", wb.Document.Links.length
  Add "plugins.length", wb.Document.Plugins.length
  Add "scripts.length", wb.Document.Scripts.length
  Add "styleSheets.length", wb.Document.StyleSheets.length

  Dim i As Integer
  For i = 0 To wb.Document.All.length - 1
    Dim sVal As String
    sVal = wb.Document.All(i).tagName
    If sVal = "A" Then sVal = sVal & ", href=" & wb.Document.All(i).href
    If sVal = "IMG" Then sVal = sVal & ", src=" & wb.Document.All(i).src
    Add "all(" & i & ").TagName", sVal
  Next
  
  Add "wb.Document.Body", "-------------------------------------------"
  Add "typename(Body)", TypeName(wb.Document.Body)
  Add "accessKey", wb.Document.Body.accessKey
  Add "aLink", wb.Document.Body.aLink
  Add "background", wb.Document.Body.background
  Add "bgColor", wb.Document.Body.bgColor
  Add "bgProperties", wb.Document.Body.bgProperties
  Add "bottomMargin", wb.Document.Body.bottomMargin
  Add "className", wb.Document.Body.className
  Add "clientHeight", wb.Document.Body.ClientHeight
  Add "clientLeft", wb.Document.Body.ClientLeft
  Add "clientTop", wb.Document.Body.ClientTop
  Add "clientWidth", wb.Document.Body.ClientWidth
  Add "document", wb.Document.Body.Document
  Add "filter", wb.Document.Body.filter
  Add "id", wb.Document.Body.id
  Add "innerHTML", wb.Document.Body.innerHTML
  Add "innerText", wb.Document.Body.innerText
  Add "isTextEdit", wb.Document.Body.isTextEdit
  Add "lang", wb.Document.Body.lang
  Add "language", wb.Document.Body.language
  Add "leftMargin", wb.Document.Body.leftMargin
  Add "link", wb.Document.Body.link
  Add "noWrap", wb.Document.Body.noWrap
  Add "offsetHeight", wb.Document.Body.offsetHeight
  Add "offsetLeft", wb.Document.Body.offsetLeft
  Add "offsetParent", wb.Document.Body.offsetParent
  Add "offsetTop", wb.Document.Body.offsetTop
  Add "offsetWidth", wb.Document.Body.offsetWidth
  Add "outerHTML", wb.Document.Body.outerHTML
  Add "outerText", wb.Document.Body.outerText
  Add "parentElement", wb.Document.Body.parentElement
  Add "parentTextEdit", wb.Document.Body.parentTextEdit
  Add "recordNumber", IIf(IsNull(wb.Document.Body.recordNumber), "NULL", wb.Document.Body.recordNumber)
  Add "rightMargin", wb.Document.Body.rightMargin
  Add "scroll", wb.Document.Body.Scroll
  Add "scrollHeight", wb.Document.Body.scrollHeight
  Add "scrollLeft", wb.Document.Body.scrollLeft
  Add "scrollTop", wb.Document.Body.scrollTop
  Add "scrollWidth", wb.Document.Body.scrollWidth
  Add "sourceIndex", wb.Document.Body.sourceIndex
  Add "style", wb.Document.Body.Style
  Add "tabIndex", wb.Document.Body.TabIndex
  Add "tagName", wb.Document.Body.tagName
  Add "text", wb.Document.Body.Text
  Add "title", wb.Document.Body.Title
  Add "topMargin", wb.Document.Body.topMargin
  Add "vLink", wb.Document.Body.vLink

  Add "wb.Document.Selection", "-------------------------------------------"
  Add "typename(Selection)", TypeName(wb.Document.selection)
  Add "type", wb.Document.selection.Type
  
  Add "wb.Document.ParentWindow", "-------------------------------------------"
  Dim w As Object
  Set w = wb.Document.ParentWindow
  Add "Typename:", TypeName(w)
  Add "clientInformation", w.clientInformation
  Add "closed", w.closed
  Add "defaultStatus", w.defaultStatus
  Add "dialogArguments", w.dialogArguments
  Add "dialogHeight", w.dialogHeight
  Add "dialogLeft", w.dialogLeft
  Add "dialogTop", w.dialogTop
  Add "dialogWidth", w.dialogWidth
  Add "document", w.Document
  Add "event", w.event
  Add "history", w.history
  Add "length", w.length
  Add "location", w.location
  Add "name", w.Name
  Add "navigator", w.Navigator
  Add "offscreenBuffering", w.offscreenBuffering
  Add "opener", w.opener
  Add "parent", w.Parent
  Add "returnValue", w.returnValue
  Add "screen", w.Screen
  Add "self", w.self
  Add "status", w.status
  Add "top", w.Top

  Add "wb.Document.ParentWindow.Navigator", "-------------------------------------------"
  Dim n As Object
  Set n = wb.Document.ParentWindow.Navigator
  Add "TypeName:", TypeName(n)
  Add "AppCodeName", n.AppCodeName
  Add "AppMinorVersion", n.AppMinorVersion
  Add "AppName", n.AppName
  Add "AppVersion", n.AppVersion
  Add "BrowserLanguage", n.BrowserLanguage
  Add "ConnectionSpeed", n.ConnectionSpeed
  Add "CookieEnabled", n.CookieEnabled
  Add "CpuClass", n.CpuClass
  Add "OnLine", n.OnLine
  Add "Platform", n.Platform
  Add "SystemLanguage", n.SystemLanguage
  Add "UserAgent", n.UserAgent
  Add "UserLanguage", n.UserLanguage
  Add "userProfile", n.userProfile

  Add "wb.Document.ParentWindow.Screen", "-------------------------------------------"
  Dim s As Object
  Set s = wb.Document.ParentWindow.Screen
  Add "TypeName:", TypeName(s)
  Add "bufferDepth", s.bufferDepth
  Add "colorDepth", s.colorDepth
  Add "Height", s.Height
  Add "updateInterval", s.updateInterval
  Add "Width", s.Width
  
  Add "wb.Document.Body.Style", "-------------------------------------------"
  Dim st As Object
  Set st = wb.Document.Body.Style
  Add "TypeName:", TypeName(st)
  Add "background", st.background
  Add "backgroundAttachment", st.backgroundAttachment
  Add "backgroundColor", st.backgroundColor
  Add "backgroundImage", st.backgroundImage
  Add "backgroundPosition", st.backgroundPosition
  Add "backgroundPositionX", st.backgroundPositionX
  Add "backgroundPositionY", st.backgroundPositionY
  Add "backgroundRepeat", st.backgroundRepeat
  Add "border", st.border
  Add "borderBottom", st.borderBottom
  Add "borderBottomColor", st.borderBottomColor
  Add "borderBottomStyle", st.borderBottomStyle
  Add "borderBottomWidth", st.borderBottomWidth
  Add "borderColor", st.BorderColor
  Add "borderLeft", st.borderLeft
  Add "borderLeftColor", st.borderLeftColor
  Add "borderLeftStyle", st.borderLeftStyle
  Add "borderLeftWidth", st.borderLeftWidth
  Add "borderRight", st.borderRight
  Add "borderRightColor", st.borderRightColor
  Add "borderRightStyle", st.borderRightStyle
  Add "borderRightWidth", st.borderRightWidth
  Add "borderStyle", st.BorderStyle
  Add "borderTop", st.borderTop
  Add "borderTopColor", st.borderTopColor
  Add "borderTopStyle", st.borderTopStyle
  Add "borderTopWidth", st.borderTopWidth
  Add "borderWidth", st.BorderWidth
  Add "clear", st.Clear
  Add "clip", st.clip
  Add "color", st.color
  Add "cssText", st.cssText
  Add "cursor", st.cursor
  Add "display", st.display
  Add "filter", st.filter
  Add "font", st.Font
  Add "fontFamily", st.fontFamily
  Add "fontSize", st.FontSize
  Add "fontStyle", st.fontStyle
  Add "fontVariant", st.fontVariant
  Add "fontWeight", st.fontWeight
  Add "height", st.Height
  Add "left", st.Left
  Add "letterSpacing", st.letterSpacing
  Add "lineHeight", st.lineHeight
  Add "listStyle", st.listStyle
  Add "listStyleImage", st.listStyleImage
  Add "listStylePosition", st.listStylePosition
  Add "listStyleType", st.listStyleType
  Add "margin", st.margin
  Add "marginBottom", st.marginBottom
  Add "marginLeft", st.marginLeft
  Add "marginRight", st.marginRight
  Add "marginTop", st.marginTop
  Add "overflow", st.overflow
  Add "paddingBottom", st.paddingBottom
  Add "paddingLeft", st.paddingLeft
  Add "paddingRight", st.paddingRight
  Add "paddingTop", st.paddingTop
  Add "pageBreakAfter", st.pageBreakAfter
  Add "pageBreakBefore", st.pageBreakBefore
  Add "pixelHeight", st.pixelHeight
  Add "pixelLeft", st.pixelLeft
  Add "pixelTop", st.pixelTop
  Add "pixelWidth", st.pixelWidth
  Add "posHeight", st.posHeight
  Add "position", st.position
  Add "posLeft", st.posLeft
  Add "posTop", st.posTop
  Add "posWidth", st.posWidth
  Add "styleFloat", st.styleFloat
  Add "textAlign", st.TextAlign
  Add "textDecoration", st.textDecoration
  Add "textDecorationBlink", st.textDecorationBlink
  Add "textDecorationLineThrough", st.textDecorationLineThrough
  Add "textDecorationNone", st.textDecorationNone
  Add "textDecorationOverline", st.textDecorationOverline
  Add "textDecorationUnderline", st.textDecorationUnderline
  Add "textIndent", st.textIndent
  Add "textTransform", st.textTransform
  Add "top", st.Top
  Add "verticalAlign", st.verticalAlign
  Add "visibility", st.visibility
  Add "width", st.Width
  Add "zIndex", st.zIndex
  
  On Error GoTo 0
  'Close #1
End Sub

Private Sub Form_Load()
  'wb.Navigate "http://www.silliker/"
  wb.Navigate "d:\Web\Index.htm"
End Sub

