This sample populates the grid with the RDO Resultset in Unbound extended mode.

Note:  The resultset is opened with the property en.CursorDriver = rdUseOdbc.  This may degrade performance when the resultset is big.  However this is the only way how you can enable the AbsolutePosition property.  If your resultset is big and you don't care about the vertical scroll bar set it to rdUseServer.
