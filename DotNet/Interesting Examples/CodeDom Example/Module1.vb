' From VS help: "CodeDomProvider Class"

Imports System
Imports System.CodeDom
Imports System.CodeDom.Compiler
Imports System.Collections
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Windows.Forms
Imports Microsoft.CSharp
Imports Microsoft.VisualBasic

' This example demonstrates building a Hello World program graph 
' using System.CodeDom elements. It calls code generator and
' code compiler methods to build the program using CSharp, VB, or
' JScript.  A Windows Forms interface is included. Note: Code
' must be compiled and linked with the Microsoft.JScript assembly. 
Namespace CodeDOMExample

    Class CodeDomExample
        ' Build a Hello World program graph using 
        ' System.CodeDom types.
        Public Shared Function BuildHelloWorldGraph() As CodeCompileUnit

            ' Create a new CodeCompileUnit to contain 
            ' the program graph.
            Dim compileUnit As New CodeCompileUnit()

            ' Declare a new namespace called Samples.
            Dim samples As New CodeNamespace("Samples")

            ' Add the new namespace to the compile unit.
            compileUnit.Namespaces.Add(samples)

            ' Add the new namespace import for the System namespace.
            samples.Imports.Add(New CodeNamespaceImport("System"))

            ' Declare a new type called Class1.
            Dim class1 As New CodeTypeDeclaration("Class1")

            ' Add the new type to the namespace type collection.
            samples.Types.Add(class1)

            ' Declare a new code entry point method.
            Dim start As New CodeEntryPointMethod()

            ' Create a type reference for the System.Console class.
            Dim csSystemConsoleType As New CodeTypeReferenceExpression( _
                "System.Console")

            ' Build a Console.WriteLine statement.
            Dim cs1 As New CodeMethodInvokeExpression( _
                csSystemConsoleType, "WriteLine", _
                New CodePrimitiveExpression("Hello World!"))

            ' Add the WriteLine call to the statement collection.
            start.Statements.Add(cs1)

            ' Build another Console.WriteLine statement.
            Dim cs2 As New CodeMethodInvokeExpression( _
                csSystemConsoleType, "WriteLine", _
                New CodePrimitiveExpression("Press the Enter key to continue."))

            ' Add the WriteLine call to the statement collection.
            start.Statements.Add(cs2)

            ' Build a call to System.Console.ReadLine.
            Dim csReadLine As New CodeMethodInvokeExpression( _
                csSystemConsoleType, "ReadLine")

            ' Add the ReadLine statement.
            start.Statements.Add(csReadLine)

            ' Add the code entry point method to
            ' the Members collection of the type.
            class1.Members.Add(start)

            Return compileUnit
        End Function

        Public Shared Sub GenerateCode(ByVal provider As CodeDomProvider, ByVal compileunit As CodeCompileUnit)

            ' Build the source file name with the appropriate
            ' language extension.
            Dim sourceFile As String
            If provider.FileExtension.StartsWith(".") Then
                sourceFile = "TestGraph" + provider.FileExtension
            Else
                sourceFile = "TestGraph." + provider.FileExtension
            End If

            ' Create an IndentedTextWriter, constructed with
            ' a StreamWriter to the source file.
            Dim tw As New IndentedTextWriter(New StreamWriter(sourceFile, False), "    ")
            ' Generate source code using the code generator.
            provider.GenerateCodeFromCompileUnit(compileunit, tw, New CodeGeneratorOptions())
            ' Close the output file.
            tw.Close()
        End Sub

        Public Shared Function CompileCode(ByVal provider As CodeDomProvider, _
                                           ByVal sourceFile As String, _
                                           ByVal exeFile As String) As CompilerResults

            ' Configure a CompilerParameters that links System.dll
            ' and produces the specified executable file.
            Dim referenceAssemblies As String() = {"System.dll"}
            Dim cp As New CompilerParameters(referenceAssemblies, exeFile, False)

            ' Generate an executable rather than a DLL file.
            cp.GenerateExecutable = True

            ' Invoke compilation.
            Dim cr As CompilerResults = provider.CompileAssemblyFromFile(cp, _
                sourceFile)
            ' Return the results of compilation.
            Return cr
        End Function
    End Class

End Namespace
