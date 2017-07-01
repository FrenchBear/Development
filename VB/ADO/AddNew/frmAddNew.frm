VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1740
      TabIndex        =   0
      Top             =   1320
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    AddNewX
End Sub

Public Sub AddNewX()

    'recordset and connection variables
   Dim Cnxn As ADODB.Connection
   Dim rstEmployees As ADODB.Recordset
   Dim strCnxn As String
   Dim strSQL As String
    'record variables
   Dim strID As String
   Dim strFirstName As String
   Dim strLastName As String
   Dim blnRecordAdded As Boolean

   ' Open a connection
   Set Cnxn = New ADODB.Connection
   'strCnxn = "Provider=sqloledb;Data Source=SAPHIR\NETSDK;Initial Catalog=Northwind;User Id=sa;Password=;"
   strCnxn = "DRIVER=SQL Server;SERVER=SAPHIR\NETSDK;DATABASE=Northwind;UID=sa;PWD="
   Cnxn.CursorLocation = adUseClient
   Cnxn.Open strCnxn
      
   ' Open Employees Table with a cursor that allows updates
   Set rstEmployees = New ADODB.Recordset
   'strSQL = "Employees"
   'rstEmployees.Open strSQL, strCnxn, adOpenKeyset, adLockOptimistic, adCmdTable
   
   strSQL = "select * from Employees"
   rstEmployees.Open strSQL, Cnxn, adOpenForwardOnly, adLockOptimistic
   
   
   ' Get data from the user
   strFirstName = Trim(InputBox("Enter first name:"))
   strLastName = Trim(InputBox("Enter last name:"))

   ' Proceed only if the user actually entered something
   ' for both the first and last names
   If strFirstName <> "" And strLastName <> "" Then

      rstEmployees.AddNew
        rstEmployees!FirstName = strFirstName
        rstEmployees!LastName = strLastName
      rstEmployees.Update
      blnRecordAdded = True

      ' Show the newly added data
      strID = rstEmployees!EmployeeID
      MsgBox "New record: " & rstEmployees!EmployeeID & " " & _
         rstEmployees!FirstName & " " & rstEmployees!LastName

   Else
      MsgBox "Please enter a first name and last name."
   End If
      
   ' Delete the new record because this is a demonstration
   Cnxn.Execute "DELETE FROM Employees WHERE EmployeeID = '" & strID & "'"
      
    ' clean up
   rstEmployees.Close
   Cnxn.Close
   Set rstEmployees = Nothing
   Set Cnxn = Nothing

End Sub


