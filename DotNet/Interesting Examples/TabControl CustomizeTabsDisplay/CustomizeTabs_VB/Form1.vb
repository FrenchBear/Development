
Imports System
Imports System.Drawing
Imports System.Collections
Imports System.ComponentModel
Imports System.Windows.Forms
Imports System.Data


 

Public Class Form1
   Inherits System.Windows.Forms.Form
   Private tabControl1 As System.Windows.Forms.TabControl
   Private tabPage1 As System.Windows.Forms.TabPage
   Private tabPage2 As System.Windows.Forms.TabPage
   Private tabPage3 As System.Windows.Forms.TabPage
   
   Private components As System.ComponentModel.Container = Nothing
   
   
   Public Sub New()
       
      InitializeComponent()
      
      'set the drawmode and subscribe to the DrawItem event
      Me.tabControl1.DrawMode = System.Windows.Forms.TabDrawMode.OwnerDrawFixed
      AddHandler Me.tabControl1.DrawItem, AddressOf Me.tabControl1_DrawItem
   End Sub 'New
    
   
   
    
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub 'Dispose

#Region "Windows Form Designer generated code"

    '/ <summary>
    '/ Required method for Designer support - do not modify
    '/ the contents of this method with the code editor.
    '/ </summary>
    Private Sub InitializeComponent()
        Me.tabControl1 = New System.Windows.Forms.TabControl()
        Me.tabPage1 = New System.Windows.Forms.TabPage()
        Me.tabPage2 = New System.Windows.Forms.TabPage()
        Me.tabPage3 = New System.Windows.Forms.TabPage()
        Me.tabControl1.SuspendLayout()
        Me.SuspendLayout()
        ' 
        ' tabControl1
        ' 
        Me.tabControl1.Controls.AddRange(New System.Windows.Forms.Control() {Me.tabPage1, Me.tabPage2, Me.tabPage3})
        Me.tabControl1.Location = New System.Drawing.Point(32, 32)
        Me.tabControl1.Name = "tabControl1"
        Me.tabControl1.SelectedIndex = 0
        Me.tabControl1.Size = New System.Drawing.Size(256, 144)
        Me.tabControl1.TabIndex = 0
        ' 
        ' tabPage1
        ' 
        Me.tabPage1.Location = New System.Drawing.Point(4, 22)
        Me.tabPage1.Name = "tabPage1"
        Me.tabPage1.Size = New System.Drawing.Size(336, 206)
        Me.tabPage1.TabIndex = 0
        Me.tabPage1.Text = "tabPage1"
        ' 
        ' tabPage2
        ' 
        Me.tabPage2.Location = New System.Drawing.Point(4, 22)
        Me.tabPage2.Name = "tabPage2"
        Me.tabPage2.Size = New System.Drawing.Size(336, 206)
        Me.tabPage2.TabIndex = 1
        Me.tabPage2.Text = "tabPage2"
        ' 
        ' tabPage3
        ' 
        Me.tabPage3.Location = New System.Drawing.Point(4, 22)
        Me.tabPage3.Name = "tabPage3"
        Me.tabPage3.Size = New System.Drawing.Size(248, 118)
        Me.tabPage3.TabIndex = 2
        Me.tabPage3.Text = "tabPage3"
        ' 
        ' Form1
        ' 
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(328, 230)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.tabControl1})
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.tabControl1.ResumeLayout(False)
        Me.ResumeLayout(False)
    End Sub 'InitializeComponent 
#End Region


     


    Private Sub tabControl1_DrawItem(ByVal sender As Object, ByVal e As System.Windows.Forms.DrawItemEventArgs)
        Dim f As Font
        Dim backBrush As Brush
        Dim foreBrush As Brush

        If e.Index = Me.tabControl1.SelectedIndex Then
            f = New Font(e.Font, FontStyle.Italic Or FontStyle.Bold)
            backBrush = New System.Drawing.Drawing2D.LinearGradientBrush(e.Bounds, Color.Blue, Color.Red, System.Drawing.Drawing2D.LinearGradientMode.BackwardDiagonal)
            foreBrush = Brushes.PowderBlue
        Else
            f = e.Font
            backBrush = New SolidBrush(e.BackColor)
            foreBrush = New SolidBrush(e.ForeColor)
        End If

        Dim tabName As String = Me.tabControl1.TabPages(e.Index).Text
        Dim sf As New StringFormat()
        sf.Alignment = StringAlignment.Center
        e.Graphics.FillRectangle(backBrush, e.Bounds)
        Dim r As RectangleF = New RectangleF(e.Bounds.X, e.Bounds.Y + 4, e.Bounds.Width, e.Bounds.Height - 4)
        e.Graphics.DrawString(tabName, f, foreBrush, r, sf)

        sf.Dispose()
        If e.Index = Me.tabControl1.SelectedIndex Then
            f.Dispose()
            backBrush.Dispose()
        Else
            backBrush.Dispose()
            foreBrush.Dispose()
        End If
    End Sub 'tabControl1_DrawItem
End Class 'Form1