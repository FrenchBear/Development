VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "PaintEffects"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Provides methods for painting transparent images."
Option Explicit

Private m_hpalHalftone As Long  'Halftone created for default palette use

Private Type BITMAPINFOHEADER '40 bytes
        biSize As Long
        biWidth As Long
        biHeight As Long
        biPlanes As Integer
        biBitCount As Integer
        biCompression As Long
        biSizeImage As Long
        biXPelsPerMeter As Long
        biYPelsPerMeter As Long
        biClrUsed As Long
        biClrImportant As Long
End Type

Private Type RGBQUAD
        rgbBlue As Byte
        rgbGreen As Byte
        rgbRed As Byte
        rgbReserved As Byte
End Type

Private Type BITMAPINFO
        bmiHeader As BITMAPINFOHEADER
        bmiColors(1) As RGBQUAD
End Type

Private Declare Function DrawIcon Lib "user32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal hIcon As Long) As Long
Private Declare Function CreateSolidBrush Lib "GDI32" (ByVal crColor As Long) As Long
Private Declare Function BitBlt Lib "GDI32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal XSrc As Long, ByVal YSrc As Long, ByVal dwRop As Long) As Long
Private Declare Function SetBkColor Lib "GDI32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Private Declare Function CreateCompatibleDC Lib "GDI32" (ByVal hdc As Long) As Long
Private Declare Function DeleteDC Lib "GDI32" (ByVal hdc As Long) As Long
Private Declare Function ReleaseDC Lib "user32" (ByVal hWnd As Long, ByVal hdc As Long) As Integer
Private Declare Function CreateCompatibleBitmap Lib "GDI32" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Private Declare Function SelectObject Lib "GDI32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function GetDC Lib "user32" (ByVal hWnd As Long) As Long
Private Declare Function SetTextColor Lib "GDI32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Private Declare Function CreateBitmap Lib "GDI32" (ByVal nWidth As Long, ByVal nHeight As Long, ByVal nPlanes As Long, ByVal nBitCount As Long, lpBits As Any) As Long
Private Declare Function GetBkColor Lib "GDI32" (ByVal hdc As Long) As Long
Private Declare Function GetTextColor Lib "GDI32" (ByVal hdc As Long) As Long
Private Declare Function SelectPalette Lib "GDI32" (ByVal hdc As Long, ByVal hPalette As Long, ByVal bForceBackground As Long) As Long
Private Declare Function RealizePalette Lib "GDI32" (ByVal hdc As Long) As Long
Private Declare Function CreateHalftonePalette Lib "GDI32" (ByVal hdc As Long) As Long
Private Declare Function OleTranslateColor Lib "oleaut32.dll" (ByVal lOleColor As Long, ByVal lHPalette As Long, lColorRef As Long) As Long
Private Declare Function CreateDIBSection Lib "GDI32" (ByVal hdc As Long, pBitmapInfo As BITMAPINFO, ByVal un As Long, ByVal lplpVoid As Long, ByVal handle As Long, ByVal dw As Long) As Long
Private Declare Function SetDIBColorTable Lib "GDI32" (ByVal hdc As Long, ByVal un1 As Long, ByVal un2 As Long, pcRGBQuad As RGBQUAD) As Long
Private Declare Function SetMapMode Lib "GDI32" (ByVal hdc As Long, ByVal nMapMode As Long) As Long
Private Declare Function GetMapMode Lib "GDI32" (ByVal hdc As Long) As Long
Private Declare Function DrawIconEx Lib "user32" (ByVal hdc As Long, ByVal xLeft As Long, ByVal yTop As Long, ByVal hIcon As Long, ByVal cxWidth As Long, ByVal cyHeight As Long, ByVal istepIfAniCur As Long, ByVal hbrFlickerFreeDraw As Long, ByVal diFlags As Long) As Long
Private Declare Function FillRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Integer

'DrawIconEx Flags
Private Const DI_MASK = &H1
Private Const DI_IMAGE = &H2
Private Const DI_NORMAL = &H3
Private Const DI_COMPAT = &H4
Private Const DI_DEFAULTSIZE = &H8

'DIB Section constants
Private Const BI_RGB = 0&
Private Const DIB_RGB_COLORS = 0 '  color table in RGBs


'Raster Operation Codes
Private Const DSna = &H220326 '0x00220326

'VB Errors
Private Const giINVALID_PICTURE As Integer = 481

'-------------------------------------------------------------------------
'Purpose:   Draws a transparent bitmap to a DC.  The pixels of the passed
'           bitmap that match the passed mask color will not be painted
'           to the destination DC
'In:
'   [hdcDest]
'           Device context to paint the picture on
'   [xDest]
'           X coordinate of the upper left corner of the area that the
'           picture is to be painted on. (in pixels)
'   [yDest]
'           Y coordinate of the upper left corner of the area that the
'           picture is to be painted on. (in pixels)
'   [Width]
'           Width of picture area to paint in pixels.  Note: If this value
'           is outrageous (i.e.: you passed a forms ScaleWidth in twips
'           instead of the pictures' width in pixels), this procedure will
'           attempt to create bitmaps that require outrageous
'           amounts of memory.
'   [Height]
'           Height of picture area to paint in pixels.  Note: If this
'           value is outrageous (i.e.: you passed a forms ScaleHeight in
'           twips instead of the pictures' height in pixels), this
'           procedure will attempt to create bitmaps that require
'           outrageous amounts of memory.
'   [picSource]
'           Standard Picture object to be used as the image source
'   [xSrc]
'           X coordinate of the upper left corner of the area in the picture
'           to use as the source. (in pixels)
'           Ignored if picSource is an Icon.
'   [ySrc]
'           Y coordinate of the upper left corner of the area in the picture
'           to use as the source. (in pixels)
'           Ignored if picSource is an Icon.
'   [clrMask]
'           Color of pixels to be masked out
'   [hPal]
'           Handle of palette to select into the memory DC's used to create
'           the painting effect.
'           If not provided, a HalfTone palette is used.
'-------------------------------------------------------------------------
Public Sub PaintTransparentStdPic(ByVal hdcDest As Long, _
                                    ByVal xDest As Long, _
                                    ByVal yDest As Long, _
                                    ByVal Width As Long, _
                                    ByVal Height As Long, _
                                    ByVal picSource As Picture, _
                                    ByVal XSrc As Long, _
                                    ByVal YSrc As Long, _
                                    ByVal clrMask As OLE_COLOR, _
                                    Optional ByVal hPal As Long = 0)
Attribute PaintTransparentStdPic.VB_Description = "Paints an image with transparent pixels defined by the mask color.  Accepts a picture object as its image source."
    Dim hdcSrc As Long         'HDC that the source bitmap is selected into
    Dim hbmMemSrcOld As Long
    Dim hbmMemSrc As Long
    Dim udtRect As RECT
    Dim hbrMask As Long
    Dim lMaskColor As Long
    Dim hdcScreen As Long
    Dim hPalOld As Long
    'Verify that the passed picture is a Bitmap
    If picSource Is Nothing Then GoTo PaintTransparentStdPic_InvalidParam
    
    Select Case picSource.Type
        Case vbPicTypeBitmap
            hdcScreen = GetDC(0&)
            'Validate palette
            If hPal = 0 Then
                hPal = m_hpalHalftone
            End If
            'Select passed picture into an HDC
            hdcSrc = CreateCompatibleDC(hdcScreen)
            hbmMemSrcOld = SelectObject(hdcSrc, picSource.handle)
            hPalOld = SelectPalette(hdcSrc, hPal, True)
            RealizePalette hdcSrc
            'Draw the bitmap
            PaintTransparentDC hdcDest, xDest, yDest, Width, Height, hdcSrc, XSrc, YSrc, clrMask, hPal

            SelectObject hdcSrc, hbmMemSrcOld
            SelectPalette hdcSrc, hPalOld, True
            RealizePalette hdcSrc
            DeleteDC hdcSrc
            ReleaseDC 0&, hdcScreen
        Case vbPicTypeIcon
            'Create a bitmap and select it into an DC
            hdcScreen = GetDC(0&)
            'Validate palette
            If hPal = 0 Then
                hPal = m_hpalHalftone
            End If
            hdcSrc = CreateCompatibleDC(hdcScreen)
            hbmMemSrc = CreateCompatibleBitmap(hdcScreen, Width, Height)
            hbmMemSrcOld = SelectObject(hdcSrc, hbmMemSrc)
            hPalOld = SelectPalette(hdcSrc, hPal, True)
            RealizePalette hdcSrc
            'Draw Icon onto DC
            udtRect.Bottom = Height
            udtRect.Right = Width
            OleTranslateColor clrMask, 0&, lMaskColor
            hbrMask = CreateSolidBrush(lMaskColor)
            FillRect hdcSrc, udtRect, hbrMask
            DeleteObject hbrMask
            DrawIcon hdcSrc, 0, 0, picSource.handle
            'Draw Transparent image
            PaintTransparentDC hdcDest, xDest, yDest, Width, Height, hdcSrc, 0, 0, lMaskColor, hPal
            'Clean up
            DeleteObject SelectObject(hdcSrc, hbmMemSrcOld)
            SelectPalette hdcSrc, hPalOld, True
            RealizePalette hdcSrc
            DeleteDC hdcSrc
            ReleaseDC 0&, hdcScreen
        Case Else
            GoTo PaintTransparentStdPic_InvalidParam
    End Select
    Exit Sub
PaintTransparentStdPic_InvalidParam:
    'Err.Raise giINVALID_PICTURE
    Exit Sub
End Sub

Public Sub PaintTransparentDC(ByVal hdcDest As Long, _
                                    ByVal xDest As Long, _
                                    ByVal yDest As Long, _
                                    ByVal Width As Long, _
                                    ByVal Height As Long, _
                                    ByVal hdcSrc As Long, _
                                    ByVal XSrc As Long, _
                                    ByVal YSrc As Long, _
                                    ByVal clrMask As OLE_COLOR, _
                                    Optional ByVal hPal As Long = 0)
    Dim hdcMask As Long        'HDC of the created mask image
    Dim hdcColor As Long       'HDC of the created color image
    Dim hbmMask As Long        'Bitmap handle to the mask image
    Dim hbmColor As Long       'Bitmap handle to the color image
    Dim hbmColorOld As Long
    Dim hbmMaskOld As Long
    Dim hPalOld As Long
    Dim hdcScreen As Long
    Dim hdcScnBuffer As Long         'Buffer to do all work on
    Dim hbmScnBuffer As Long
    Dim hbmScnBufferOld As Long
    Dim hPalBufferOld As Long
    Dim lMaskColor As Long
    
    hdcScreen = GetDC(0&)
    'Validate palette
    If hPal = 0 Then
        hPal = m_hpalHalftone
    End If
    OleTranslateColor clrMask, hPal, lMaskColor
    
    'Create a color bitmap to server as a copy of the destination
    'Do all work on this bitmap and then copy it back over the destination
    'when it's done.
    hbmScnBuffer = CreateCompatibleBitmap(hdcScreen, Width, Height)
    'Create DC for screen buffer
    hdcScnBuffer = CreateCompatibleDC(hdcScreen)
    hbmScnBufferOld = SelectObject(hdcScnBuffer, hbmScnBuffer)
    hPalBufferOld = SelectPalette(hdcScnBuffer, hPal, True)
    RealizePalette hdcScnBuffer
    'Copy the destination to the screen buffer
    BitBlt hdcScnBuffer, 0, 0, Width, Height, hdcDest, xDest, yDest, vbSrcCopy
    
    'Create a (color) bitmap for the cover (can't use CompatibleBitmap with
    'hdcSrc, because this will create a DIB section if the original bitmap
    'is a DIB section)
    hbmColor = CreateCompatibleBitmap(hdcScreen, Width, Height)
    'Now create a monochrome bitmap for the mask
    hbmMask = CreateBitmap(Width, Height, 1, 1, ByVal 0&)
    'First, blt the source bitmap onto the cover.  We do this first
    'and then use it instead of the source bitmap
    'because the source bitmap may be
    'a DIB section, which behaves differently than a bitmap.
    '(Specifically, copying from a DIB section to a monochrome bitmap
    'does a nearest-color selection rather than painting based on the
    'backcolor and forecolor.
    hdcColor = CreateCompatibleDC(hdcScreen)
    hbmColorOld = SelectObject(hdcColor, hbmColor)
    hPalOld = SelectPalette(hdcColor, hPal, True)
    RealizePalette hdcColor
    'In case hdcSrc contains a monochrome bitmap, we must set the destination
    'foreground/background colors according to those currently set in hdcSrc
    '(because Windows will associate these colors with the two monochrome colors)
    SetBkColor hdcColor, GetBkColor(hdcSrc)
    SetTextColor hdcColor, GetTextColor(hdcSrc)
    BitBlt hdcColor, 0, 0, Width, Height, hdcSrc, XSrc, YSrc, vbSrcCopy
    'Paint the mask.  What we want is white at the transparent color
    'from the source, and black everywhere else.
    hdcMask = CreateCompatibleDC(hdcScreen)
    hbmMaskOld = SelectObject(hdcMask, hbmMask)

    'When bitblt'ing from color to monochrome, Windows sets to 1
    'all pixels that match the background color of the source DC.  All
    'other bits are set to 0.
    SetBkColor hdcColor, lMaskColor
    SetTextColor hdcColor, vbWhite
    BitBlt hdcMask, 0, 0, Width, Height, hdcColor, 0, 0, vbSrcCopy
    'Paint the rest of the cover bitmap.
    '
    'What we want here is black at the transparent color, and
    'the original colors everywhere else.  To do this, we first
    'paint the original onto the cover (which we already did), then we
    'AND the inverse of the mask onto that using the DSna ternary raster
    'operation (0x00220326 - see Win32 SDK reference, Appendix, "Raster
    'Operation Codes", "Ternary Raster Operations", or search in MSDN
    'for 00220326).  DSna [reverse polish] means "(not SRC) and DEST".
    '
    'When bitblt'ing from monochrome to color, Windows transforms all white
    'bits (1) to the background color of the destination hdc.  All black (0)
    'bits are transformed to the foreground color.
    SetTextColor hdcColor, vbBlack
    SetBkColor hdcColor, vbWhite
    BitBlt hdcColor, 0, 0, Width, Height, hdcMask, 0, 0, DSna
    'Paint the Mask to the Screen buffer
    BitBlt hdcScnBuffer, 0, 0, Width, Height, hdcMask, 0, 0, vbSrcAnd
    'Paint the Color to the Screen buffer
    BitBlt hdcScnBuffer, 0, 0, Width, Height, hdcColor, 0, 0, vbSrcPaint
    'Copy the screen buffer to the screen
    BitBlt hdcDest, xDest, yDest, Width, Height, hdcScnBuffer, 0, 0, vbSrcCopy
    'All done!
    DeleteObject SelectObject(hdcColor, hbmColorOld)
    SelectPalette hdcColor, hPalOld, True
    RealizePalette hdcColor
    DeleteDC hdcColor
    DeleteObject SelectObject(hdcScnBuffer, hbmScnBufferOld)
    SelectPalette hdcScnBuffer, hPalBufferOld, True
    RealizePalette hdcScnBuffer
    DeleteDC hdcScnBuffer
    
    DeleteObject SelectObject(hdcMask, hbmMaskOld)
    DeleteDC hdcMask
    ReleaseDC 0&, hdcScreen
End Sub

'-------------------------------------------------------------------------
'Purpose:   Draws a standard picture object to a DC
'In:
'   [hdcDest]
'           Handle of the device context to paint the picture on
'   [xDest]
'           X coordinate of the upper left corner of the area that the
'           picture is to be painted on. (in pixels)
'   [yDest]
'           Y coordinate of the upper left corner of the area that the
'           picture is to be painted on. (in pixels)
'   [Width]
'           Width of picture area to paint in pixels.  Note: If this value
'           is outrageous (i.e.: you passed a forms ScaleWidth in twips
'           instead of the pictures' width in pixels), this procedure will
'           attempt to create bitmaps that require outrageous
'           amounts of memory.
'   [Height]
'           Height of picture area to paint in pixels.  Note: If this
'           value is outrageous (i.e.: you passed a forms ScaleHeight in
'           twips instead of the pictures' height in pixels), this
'           procedure will attempt to create bitmaps that require
'           outrageous amounts of memory.
'   [picSource]
'           Standard Picture object to be used as the image source
'   [xSrc]
'           X coordinate of the upper left corner of the area in the picture
'           to use as the source. (in pixels)
'           Ignored if picSource is an Icon.
'   [ySrc]
'           Y coordinate of the upper left corner of the area in the picture
'           to use as the source. (in pixels)
'           Ignored if picSource is an Icon.
'   [hPal]
'           Handle of palette to select into the memory DC's used to create
'           the painting effect.
'           If not provided, a HalfTone palette is used.
'-------------------------------------------------------------------------
Public Sub PaintNormalStdPic(ByVal hdcDest As Long, _
                                    ByVal xDest As Long, _
                                    ByVal yDest As Long, _
                                    ByVal Width As Long, _
                                    ByVal Height As Long, _
                                    ByVal picSource As Picture, _
                                    ByVal XSrc As Long, _
                                    ByVal YSrc As Long, _
                                    Optional ByVal hPal As Long = 0)
Attribute PaintNormalStdPic.VB_Description = "Paints an image provided by a picture object to an hDC with no effects."
    Dim hdcTemp As Long
    Dim hPalOld As Long
    Dim hbmMemSrcOld As Long
    Dim hdcScreen As Long
    Dim hbmMemSrc As Long
    'Validate that a bitmap was passed in
    If picSource Is Nothing Then GoTo PaintNormalStdPic_InvalidParam
    Select Case picSource.Type
        Case vbPicTypeBitmap
            If hPal = 0 Then
                hPal = m_hpalHalftone
            End If
            hdcScreen = GetDC(0&)
            'Create a DC to select bitmap into
            hdcTemp = CreateCompatibleDC(hdcScreen)
            hPalOld = SelectPalette(hdcTemp, hPal, True)
            RealizePalette hdcTemp
            'Select bitmap into DC
            hbmMemSrcOld = SelectObject(hdcTemp, picSource.handle)
            'Copy to destination DC
            BitBlt hdcDest, xDest, yDest, Width, Height, hdcTemp, XSrc, YSrc, vbSrcCopy
            'Cleanup
            SelectObject hdcTemp, hbmMemSrcOld
            SelectPalette hdcTemp, hPalOld, True
            RealizePalette hdcTemp
            DeleteDC hdcTemp
            ReleaseDC 0&, hdcScreen
        Case vbPicTypeIcon
            'Create a bitmap and select it into an DC
            'Draw Icon onto DC
            DrawIconEx hdcDest, xDest, yDest, picSource.handle, Width, Height, 0&, 0&, DI_NORMAL
        Case Else
            GoTo PaintNormalStdPic_InvalidParam
    End Select
    Exit Sub
PaintNormalStdPic_InvalidParam:
    Err.Raise giINVALID_PICTURE
End Sub

Private Sub Class_Initialize()
    Dim hdcScreen As Long
    'Create halftone palette
    hdcScreen = GetDC(0&)
    m_hpalHalftone = CreateHalftonePalette(hdcScreen)
    ReleaseDC 0&, hdcScreen
End Sub

Private Sub Class_Terminate()
    DeleteObject m_hpalHalftone
End Sub
