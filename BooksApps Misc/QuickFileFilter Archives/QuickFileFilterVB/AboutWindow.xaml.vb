Imports System.Linq
Imports System.Reflection
Imports System.Windows
Imports System.Windows.Markup
Imports System.Windows.Media.Imaging

''' <summary>
''' Interaction logic for AboutWindow.xaml
''' </summary>
Partial Public Class AboutWindow
    Inherits Window


    Public Sub New()
        InitializeComponent()

        Dim myAssembly As Assembly = System.Reflection.Assembly.GetExecutingAssembly()
        Dim aTitleAttr As AssemblyTitleAttribute = DirectCast(AssemblyTitleAttribute.GetCustomAttribute(myAssembly, GetType(AssemblyTitleAttribute)), AssemblyTitleAttribute)
        Dim aDescAttr As AssemblyDescriptionAttribute = DirectCast(AssemblyDescriptionAttribute.GetCustomAttribute(myAssembly, GetType(AssemblyDescriptionAttribute)), AssemblyDescriptionAttribute)
        Dim sAssemblyVersion As String = myAssembly.GetName().Version.ToString()
        Dim aCopyrightAttr As AssemblyCopyrightAttribute = DirectCast(AssemblyTitleAttribute.GetCustomAttribute(myAssembly, GetType(AssemblyCopyrightAttribute)), AssemblyCopyrightAttribute)

        AssemblyTitle.Text = aTitleAttr.Title
        AssemblyDescription.Text = aDescAttr.Description
        AssemblyVersion.Text = Convert.ToString("Version ") & sAssemblyVersion
        AssemblyCopyright.Text = aCopyrightAttr.Copyright
    End Sub

    Private Sub OKButton_Click(sender As Object, e As RoutedEventArgs)
        Close()
    End Sub
End Class

''' <summary>
''' Simple extension for ico, let you choose icon with specific size.
''' Usage sample: Image Stretch="None" Source="{common:Icon /ControlsTester;component/icons/custom-reports.ico, 16}"
''' Or: Image Source="{common:Icon Source={Binding IconResource},Size=16} "
''' </summary> 
Public Class IconExtension
    Inherits MarkupExtension
    Private m_source As String

    Public Property Source() As String
        Get
            Return Me.m_source
        End Get

        Set
            ' Have to make full pack URI from short form, so System.Uri can regognize it.
            Me.m_source = Convert.ToString("pack://application:,,,") & Value
        End Set
    End Property

    Public Property Size() As Integer
        Get
            Return m_Size
        End Get
        Set
            m_Size = Value
        End Set
    End Property
    Private m_Size As Integer

    Public Overrides Function ProvideValue(serviceProvider As IServiceProvider) As Object
        Dim decoder = BitmapDecoder.Create(New Uri(Me.Source), BitmapCreateOptions.DelayCreation, BitmapCacheOption.OnDemand)

        Dim result = decoder.Frames.SingleOrDefault(Function(f) f.Width = Me.Size)
        If result Is Nothing Then
            result = decoder.Frames.OrderBy(Function(f) f.Width).First()
        End If
        Return result
    End Function

    Public Sub New(source As String, size As Integer)
        Me.Source = source
        Me.Size = size
    End Sub

    Public Sub New()
    End Sub
End Class

