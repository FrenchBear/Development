Option Strict On
Option Explicit On 
'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.ComponentModel
Imports System.ComponentModel.Design
Imports System.ComponentModel.Design.Serialization
'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

Namespace Painting
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Enumerations"

	'Enumerations
	Public Enum EdgeStyles
		Bumped
		Etched
		Flat
		Inset
		InsetSoft
		Raised
		RaisedSoft
	End Enum

	'Enumerations
	Public Enum GradientModes
		DiagonalForward = 2
		DiagonalBackward = 3
		Horizontal = 0
		Vertical = 1
	End Enum

	Public Enum ImageAlignments
		Left
		Top
		Right
		Bottom
		Center
	End Enum

	Public Enum ImageModes
		Normal
		Stretched
		Tiled
	End Enum

	Public Enum TextAlignments
		AlignLeft = 0
		AlignCenter = 1
		AlignRight = 2
	End Enum

#End Region
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>


	'PaintEx EventArgs
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	Public Class PaintExEventArgs : Inherits PaintEventArgs
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
		Public Handled As Boolean

		'Initialize the Class
		Public Sub New(ByVal g As Graphics, ByVal ClipRectangle As Rectangle)
			MyBase.New(g, ClipRectangle)
		End Sub
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	End Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>


	'Grafix Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	Public Class Grafix
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Shared Methods"

		'Function to Calculate a Color
		Shared Function CalculateColor(ByVal ForeColor As Color, ByVal BackColor As Color, ByVal Alpha As Integer) As Color
			Dim fR, fG, fB As Byte
			Dim bR, bG, bB As Byte
			Dim Red, Blue, Green As Byte

			ForeColor = Color.FromArgb(255, ForeColor)
			BackColor = Color.FromArgb(255, BackColor)
			fR = ForeColor.R : fG = ForeColor.G : fB = ForeColor.B
			bR = BackColor.R : bG = BackColor.G : bB = BackColor.B

			Red = CType(((fR * Alpha) / 255) + (bR * ((255 - Alpha) / 255)), Byte)
			Green = CType(((fG * Alpha) / 255) + (bG * ((255 - Alpha) / 255)), Byte)
			Blue = CType(((fB * Alpha) / 255) + (bB * ((255 - Alpha) / 255)), Byte)
			Return Color.FromArgb(255, Red, Green, Blue)
		End Function

		'Function to Calculate the Text Size
		Shared Function CalculateTextSize(ByVal g As Graphics, ByVal Text As String, ByVal Font As Font) As Size
			Dim nSize As SizeF = g.MeasureString(Text, Font)
			Return New Size(CInt(nSize.Width), CInt(nSize.Height))
		End Function

		'Routine to Draw the Column Header's Up Arrow Glyph
		Shared Sub DrawArrowDown(ByVal g As Graphics, ByVal ArrowRect As Rectangle)
			Dim xBottom As Integer = CInt(ArrowRect.Left + (ArrowRect.Width / 2))
			Dim xLeft As Integer = (xBottom - 6), yLeft As Integer = CInt((ArrowRect.Height - 6) / 2)
			Dim xRight As Integer = (xBottom + 6), yRight As Integer = yLeft
			Dim yBottom As Integer = (yRight + 6)

			g.DrawLine(New Pen(SystemColors.ControlDarkDark), xLeft, yLeft, xBottom, yBottom)
			g.DrawLine(New Pen(Color.White), xRight, yRight, xBottom, yBottom)
			g.DrawLine(New Pen(Color.White), xLeft, yLeft, xRight, yRight)
			ArrowRect = Nothing
		End Sub

		'Routine to Draw the Column Header's Up Arrow Glyph
		Shared Sub DrawArrowUp(ByVal g As Graphics, ByVal ArrowRect As Rectangle)
			Dim xTop As Integer = CInt(ArrowRect.Left + (ArrowRect.Width / 2)), yTop As Integer = CInt((ArrowRect.Height - 6) / 2)
			Dim xLeft As Integer = (xTop - 6), yLeft As Integer = (yTop + 6)
			Dim xRight As Integer = (xTop + 6), yRight As Integer = (yTop + 6)

			g.DrawLine(New Pen(SystemColors.ControlDarkDark), xLeft, yLeft, xTop, yTop)
			g.DrawLine(New Pen(Color.White), xRight, yRight, xTop, yTop)
			g.DrawLine(New Pen(Color.White), xLeft, yLeft, xRight, yRight)
			ArrowRect = Nothing
		End Sub

		'Draw an Edge
		Shared Sub DrawEdge(ByVal g As Graphics, ByVal DrawRect As Rectangle, ByVal EdgeStyle As EdgeStyles)
			Call DrawEdge(g, DrawRect.Left, DrawRect.Top, DrawRect.Width, DrawRect.Height, EdgeStyle)
		End Sub

		'Draw an Edge
		Shared Sub DrawEdge(ByVal g As Graphics, ByVal DrawRect As RectangleF, ByVal EdgeStyle As EdgeStyles)
			Call DrawEdge(g, CInt(DrawRect.Left), CInt(DrawRect.Top), CInt(DrawRect.Width), CInt(DrawRect.Height), EdgeStyle)
		End Sub

		'Draw an Edge
		Shared Sub DrawEdge(ByVal g As Graphics, ByVal x As Integer, ByVal y As Integer, ByVal Width As Integer, ByVal Height As Integer, ByVal EdgeStyle As EdgeStyles)
			Dim DrawRect As New Rectangle(x, y, Width, Height)
			Dim nStyle As System.Windows.Forms.Border3DStyle

			Try
				Select Case EdgeStyle
					Case EdgeStyles.Bumped : nStyle = Border3DStyle.Bump
					Case EdgeStyles.Etched : nStyle = Border3DStyle.Etched
					Case EdgeStyles.Flat : nStyle = Border3DStyle.Flat
					Case EdgeStyles.Inset : nStyle = Border3DStyle.Sunken
					Case EdgeStyles.InsetSoft : nStyle = (Border3DStyle.RaisedInner Or Border3DStyle.SunkenOuter) And Border3DStyle.Flat
					Case EdgeStyles.Raised : nStyle = Border3DStyle.Raised
					Case EdgeStyles.RaisedSoft : nStyle = (Border3DStyle.RaisedInner Or Border3DStyle.SunkenOuter And Border3DStyle.Adjust)
				End Select
				ControlPaint.DrawBorder3D(g, DrawRect, nStyle)
			Catch
				Call [Global].ErrorMessage("Drawing.DrawEdge")
			Finally
				DrawRect = Nothing
			End Try
		End Sub

		'Draw a Gradient
		Shared Sub DrawGradient(ByVal g As Graphics, ByVal x As Integer, ByVal y As Integer, ByVal Width As Integer, ByVal Height As Integer, ByVal ColorStart As Color, ByVal ColorEnd As Color, ByVal Mode As GradientModes)
			Call DrawGradient(g, New Rectangle(x, y, Width, Height), ColorStart, ColorEnd, Mode)
		End Sub

		'Draw a Gradient
		Shared Sub DrawGradient(ByVal g As Graphics, ByVal DrawRect As Rectangle, ByVal ColorStart As Color, ByVal ColorEnd As Color, ByVal Mode As GradientModes)
			'Determine if there is a Valid Rectangle
			If (DrawRect.Height <= 0) OrElse (DrawRect.Height <= 0) Then Return

			Dim hBrush As New LinearGradientBrush(DrawRect, ColorStart, ColorEnd, CType(Mode, LinearGradientMode))
			g.FillRectangle(hBrush, DrawRect)
			hBrush.Dispose() : hBrush = Nothing
		End Sub

		'Function to Draw Text
		Shared Sub DrawText(ByVal g As Graphics, ByVal DrawRect As Rectangle, ByVal Text As String, ByVal Font As Font, ByVal ForeColor As Color, Optional ByVal Format As System.Drawing.StringFormat = Nothing)
			Dim hBrush As New SolidBrush(ForeColor)

			Try
				g.DrawString(Text, Font, hBrush, RectangleF.op_Implicit(DrawRect), Format)
			Catch
				Call [Global].ErrorMessage("TextDrawing")
			Finally
				'Clean Up
				hBrush.Dispose() : hBrush = Nothing
				DrawRect = Nothing
			End Try
		End Sub

		'Function to Draw Text
		Shared Sub DrawText(ByVal g As Graphics, ByVal DrawRect As Rectangle, ByVal Text As String, ByVal Font As Font, ByVal Brush As Brush, Optional ByVal Format As System.Drawing.StringFormat = Nothing)
			Try
				g.DrawString(Text, Font, Brush, RectangleF.op_Implicit(DrawRect), Format)
			Catch
				Call [Global].ErrorMessage("TextDrawing")
			End Try
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	End Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>


	'Advanced Color Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
	Public Class ColorHLS
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Declarations"

		'Variables
		Private _Red, _Green, _Blue As Byte
		Private _Hue, _Lum, _Sat As Double

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Properties"

		'Property for the Blue Color
		Public Property Blue() As Byte
			Get
				Return _Blue
			End Get
			Set(ByVal Value As Byte)
				If (_Blue.Equals(Value)) Then Exit Property
				_Blue = Value
				Call Me.ConvertToHLS()
			End Set
		End Property

		'Property for the Color
		Public Property Color() As Color
			Get
				Return Color.FromArgb(_Red, _Green, _Blue)
			End Get
			Set(ByVal Value As Color)
				_Red = Value.R
				_Green = Value.G
				_Blue = Value.B
				Call Me.ConvertToHLS()
			End Set
		End Property

		'Property for the Green Color
		Public Property Green() As Byte
			Get
				Return _Green
			End Get
			Set(ByVal Value As Byte)
				If (_Green.Equals(Value)) Then Exit Property
				_Green = Value
				Call Me.ConvertToHLS()
			End Set
		End Property

		'Property for the Hue
		Public Property Hue() As Double
			Get
				Return _Hue
			End Get
			Set(ByVal Value As Double)
				If (_Hue.Equals(Value)) Then Exit Property
				If ((Value < 0.0F) Or (Value > 360.0F)) Then Throw New ArgumentOutOfRangeException("Hue", "Hue must be between 0.0 and 360.0")

				_Hue = Value
				Call Me.ConvertToRGB()
			End Set
		End Property

		'Property for the Luminance
		Public Property Luminance() As Double
			Get
				Return _Lum
			End Get
			Set(ByVal Value As Double)
				If (_Lum.Equals(Value)) Then Exit Property
				If ((Value < 0.0F) Or (Value > 1.0F)) Then Throw New ArgumentOutOfRangeException("Luminance", "Luminance must be between 0.0 and 1.0")

				_Lum = Value
				Call Me.ConvertToRGB()
			End Set
		End Property

		'Property for the Red Color
		Public Property Red() As Byte
			Get
				Return _Red
			End Get
			Set(ByVal Value As Byte)
				If (_Red.Equals(Value)) Then Exit Property
				_Red = Value
				Call Me.ConvertToHLS()
			End Set
		End Property

		'Property for the Saturation
		Public Property Saturation() As Double
			Get
				Return _Sat
			End Get
			Set(ByVal Value As Double)
				If (_Sat.Equals(Value)) Then Exit Property
				If ((Value < 0.0F) OrElse (Value > 1.0F)) Then Throw New ArgumentOutOfRangeException("Saturation", "Saturation must be between 0.0 and 1.0")

				_Sat = Value
				Call Me.ConvertToRGB()
			End Set
		End Property

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Methods"

		'Routine to Calculate HLS
		Private Sub ConvertToHLS()
			Dim valMin As Byte = Math.Min(_Red, Math.Min(_Green, _Blue))
			Dim valMax As Byte = Math.Max(_Red, Math.Max(_Green, _Blue))
			Dim Difference As Double = (valMax * 1.0 - valMin * 1.0)
			Dim Sum As Double = (valMax * 1.0 + valMin * 1.0)
			Dim RNorm As Double = ((valMax - _Red) / Difference)
			Dim GNorm As Double = ((valMax - _Green) / Difference)
			Dim BNorm As Double = ((valMax - _Blue) / Difference)

			_Lum = (Sum / 510.0F)
			If (valMax = valMin) Then
				_Sat = 0.0F
				_Hue = 0.0F
			Else
				If (_Lum <= 0.5F) Then _Sat = (Difference / Sum) Else _Sat = (Difference / (510.0F - Sum))
				If (_Red = valMax) Then _Hue = 60.0F * (6.0F + BNorm - GNorm)
				If (_Green = valMax) Then _Hue = 60.0F * (2.0F + RNorm - BNorm)
				If (_Blue = valMax) Then _Hue = 60.0F * (4.0F + GNorm - RNorm)
				If (_Hue > 360.0F) Then _Hue -= 360.0F
			End If
		End Sub

		'Routine to Convert ot RGB
		Private Sub ConvertToRGB()
			Dim rm1 As Double
			Dim rm2 As Double

			If (_Sat = 0.0) Then
				_Red = CByte(_Lum * 255.0F)
				_Green = _Red
				_Blue = _Red
			Else
				If (_Lum <= 0.5F) Then
					rm2 = (_Lum + (_Lum * _Sat))
				Else
					rm2 = (_Lum + _Sat - (_Lum * _Sat))
				End If
				rm1 = 2.0F * _Lum - rm2
				_Red = Me.CalculateRGB(rm1, rm2, _Hue + 120.0F)
				_Green = Me.CalculateRGB(rm1, rm2, _Hue)
				_Blue = Me.CalculateRGB(rm1, rm2, _Hue - 120.0F)
			End If
		End Sub

		'Function to Calculate the RGB Value
		Private Function CalculateRGB(ByVal rm1 As Double, ByVal rm2 As Double, ByVal rh As Double) As Byte
			If (rh > 360.0F) Then
				rh -= 360.0F
			ElseIf (rh < 0.0F) Then
				rh += 360.0F
			End If

			If (rh < 60.0F) Then
				rm1 = rm1 + (rm2 - rm1) * rh / 60.0F
			ElseIf (rh < 180.0F) Then
				rm1 = rm2
			ElseIf (rh < 240.0F) Then
				rm1 = rm1 + (rm2 - rm1) * (240.0F - rh) / 60.0F
			End If

			Return CByte(rm1 * 255)
		End Function

		'Routine to Darken the Color by a Value
		Public Sub DarkenColor(ByVal DarkenBy As Double)
			_Lum *= DarkenBy
			Call Me.ConvertToRGB()
		End Sub

		'Routine to Lighten the Color
		Public Sub LightenColor(ByVal LightenBy As Double)
			_Lum *= (1.0F + LightenBy)
			If (_Lum > 1.0F) Then _Lum = 1.0F
			Call Me.ConvertToRGB()
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
#Region "Constructors / Destructors"

		'Initialize the Class
		Public Sub New()
		End Sub

		'Initialize the Class with RGB
		Public Sub New(ByVal Red As Byte, ByVal Green As Byte, ByVal Blue As Byte)
			_Red = Red
			_Blue = Blue
			_Green = Green
		End Sub

		'Initialize with HLS
		Public Sub New(ByVal Hue As Double, ByVal Luminance As Double, ByVal Saturation As Double)
			If ((Saturation < 0.0F) OrElse (Saturation > 1.0F)) Then Throw New ArgumentOutOfRangeException("Saturation", "Saturation must be between 0.0 and 1.0")
			If ((Hue < 0.0F) OrElse (Hue > 360.0F)) Then Throw New ArgumentOutOfRangeException("Hue", "Hue must be between 0.0 and 360.0")
			If ((Luminance < 0.0F) OrElse (Luminance > 1.0F)) Then Throw New ArgumentOutOfRangeException("Luminance", "Luminance must be between 0.0 and 1.0")

			_Hue = Hue
			_Lum = Luminance
			_Sat = Saturation
			Call Me.ConvertToRGB()
		End Sub

		'Initialize the Class with a Color
		Public Sub New(ByVal Color As Color)
			_Red = Color.R
			_Green = Color.G
			_Blue = Color.B
			Call Me.ConvertToHLS()
		End Sub

#End Region
		'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>

	End Class
	'<<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>><<o>>
End Namespace