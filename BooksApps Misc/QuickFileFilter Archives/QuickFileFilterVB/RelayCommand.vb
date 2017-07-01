' RelayCommand
' Standard ViewModel helper for commanding, VB version
'
' 2016-11-28   PV

Friend Class RelayCommand(Of T) : Implements ICommand
    ReadOnly _canExecute As Predicate(Of T)
    ReadOnly _execute As Action(Of T)

    Public Sub New(execute As Action(Of T), canExecute As Predicate(Of T))
        _canExecute = canExecute
        _execute = execute
    End Sub

    ' canExecute Is optional, And by default Is assumed returning true (directly in CanExecute)
    Public Sub New(execute As Action(Of T))
        Me.New(execute, Nothing)
    End Sub

    ' From ICommand
    Public Function CanExecute(ByVal parameter As Object) As Boolean Implements ICommand.CanExecute
        Return If(_canExecute Is Nothing, True, _canExecute(CType(parameter, T)))
    End Function

    ' From ICommand
    Public Sub Execute(ByVal parameter As Object) Implements ICommand.Execute
        If _execute IsNot Nothing Then _execute(CType(parameter, T))
    End Sub


    ' The 'black magic' part: according to help, CommandManager.RequerySuggested Event occurs when the 
    ' CommandManager """detects conditions that might change the ability of a command to execute"""...
    ' Ok, it works, but exactly how does this detection works Is still a mystery to me...
    '
    ' Added info from CommandManager.InvalidateRequerySuggested Method:
    ' The CommandManager only pays attention to certain conditions in determining when the command target has changed, 
    ' such as change in keyboard focus. In situations where the CommandManager does Not sufficiently determine a change 
    ' in conditions that cause a command to Not be able to execute, InvalidateRequerySuggested can be called to force 
    ' the CommandManager to raise the RequerySuggested event. 

    ' From ICommand
    Public Custom Event CanExecuteChanged As EventHandler Implements ICommand.CanExecuteChanged
        AddHandler(ByVal value As EventHandler)
            AddHandler CommandManager.RequerySuggested, value
        End AddHandler

        RemoveHandler(ByVal value As EventHandler)
            RemoveHandler CommandManager.RequerySuggested, value
        End RemoveHandler

        RaiseEvent()
            CommandManager.InvalidateRequerySuggested()
        End RaiseEvent
    End Event

End Class
