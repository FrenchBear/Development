This sample shows how you can populate the grid in Unbound extended mode from an ADO recordset.

Note:  Users of OLEDB version should use the DataMode 0 - Bound and the DataSource property of the grid.  For example:

Dim cn As New ADODB.Connection
Dim rs As New ADODB.RecordSet

Private Sub Command1_Click()
    Dim strConnect As String
    
    ' Open a database and working recordset
    strConnect = "driver={Microsoft Access Driver (*.mdb)};DBQ=" & txtDBName.Text
    cn.Open strConnect
    
    rs.CursorType = adOpenKeyset
    rs.LockType = adLockOptimistic
    
    ' Use client cursor to enable AbsolutePosition property.
    rs.CursorLocation = adUseClient
    
    rs.Open txtSQL.Text, cn
    
    Set TDBGrid1.DataSource = rs
    TDBGrid1.ReBind    
End Sub
