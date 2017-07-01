VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form ADODC_SR 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Micros"
   ClientHeight    =   10665
   ClientLeft      =   1095
   ClientTop       =   330
   ClientWidth     =   5775
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   10665
   ScaleWidth      =   5775
   Begin VB.PictureBox picButtons 
      Align           =   2  'Align Bottom
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   300
      Left            =   0
      ScaleHeight     =   300
      ScaleWidth      =   5775
      TabIndex        =   62
      Top             =   10035
      Width           =   5775
      Begin VB.CommandButton cmdClose 
         Caption         =   "&Close"
         Height          =   300
         Left            =   4675
         TabIndex        =   67
         Top             =   0
         Width           =   1095
      End
      Begin VB.CommandButton cmdRefresh 
         Caption         =   "&Refresh"
         Height          =   300
         Left            =   3521
         TabIndex        =   66
         Top             =   0
         Width           =   1095
      End
      Begin VB.CommandButton cmdDelete 
         Caption         =   "&Delete"
         Height          =   300
         Left            =   2367
         TabIndex        =   65
         Top             =   0
         Width           =   1095
      End
      Begin VB.CommandButton cmdUpdate 
         Caption         =   "&Update"
         Height          =   300
         Left            =   1213
         TabIndex        =   64
         Top             =   0
         Width           =   1095
      End
      Begin VB.CommandButton cmdAdd 
         Caption         =   "&Add"
         Height          =   300
         Left            =   59
         TabIndex        =   63
         Top             =   0
         Width           =   1095
      End
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Utilisateur"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   30
      Left            =   2040
      TabIndex        =   61
      Top             =   9660
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Unité"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   29
      Left            =   2040
      TabIndex        =   59
      Top             =   9340
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Type mémoire"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   28
      Left            =   2040
      TabIndex        =   57
      Top             =   9020
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Système d'exploitation"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   27
      Left            =   2040
      TabIndex        =   55
      Top             =   8700
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Souris"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   26
      Left            =   2040
      TabIndex        =   53
      Top             =   8380
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Site"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   25
      Left            =   2040
      TabIndex        =   51
      Top             =   8060
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Responsable"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   24
      Left            =   2040
      TabIndex        =   49
      Top             =   7740
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Remarques"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   23
      Left            =   2040
      TabIndex        =   47
      Top             =   7420
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Propriétaire"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   22
      Left            =   2040
      TabIndex        =   45
      Top             =   7100
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Processeur"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   21
      Left            =   2040
      TabIndex        =   43
      Top             =   6780
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Nom du système"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   20
      Left            =   2040
      TabIndex        =   41
      Top             =   6460
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "N° de série"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   19
      Left            =   2040
      TabIndex        =   39
      Top             =   6140
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Moniteur"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   18
      Left            =   2040
      TabIndex        =   37
      Top             =   5820
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Mémoire cache"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   17
      Left            =   2040
      TabIndex        =   35
      Top             =   5500
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Matériel complémentaire"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   16
      Left            =   2040
      TabIndex        =   33
      Top             =   5180
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Marque et type"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   15
      Left            =   2040
      TabIndex        =   31
      Top             =   4860
      Width           =   3375
   End
   Begin VB.CheckBox chkFields 
      DataField       =   "Maintenance"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   14
      Left            =   2040
      TabIndex        =   29
      Top             =   4540
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Equipement mémoire (Mo)"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   13
      Left            =   2040
      TabIndex        =   27
      Top             =   4220
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Disquette"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   12
      Left            =   2040
      TabIndex        =   25
      Top             =   3900
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Disque dur (Mo)"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   11
      Left            =   2040
      TabIndex        =   23
      Top             =   3580
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Date d'affectation"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   10
      Left            =   2040
      TabIndex        =   21
      Top             =   3260
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Date d'acquisition"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   9
      Left            =   2040
      TabIndex        =   19
      Top             =   2940
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Contrôleur vidéo"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   8
      Left            =   2040
      TabIndex        =   17
      Top             =   2620
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Contrôleur disque"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   7
      Left            =   2040
      TabIndex        =   15
      Top             =   2300
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Commande"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   6
      Left            =   2040
      TabIndex        =   13
      Top             =   1980
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Code amortissement"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   5
      Left            =   2040
      TabIndex        =   11
      Top             =   1660
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "CD-Rom"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   4
      Left            =   2040
      TabIndex        =   9
      Top             =   1340
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Carte réseau"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   3
      Left            =   2040
      TabIndex        =   7
      Top             =   1020
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Bus"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   2
      Left            =   2040
      TabIndex        =   5
      Top             =   700
      Width           =   3375
   End
   Begin VB.CheckBox chkFields 
      DataField       =   "Assuré"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   1
      Left            =   2040
      TabIndex        =   3
      Top             =   380
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Adresse IP"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   0
      Left            =   2040
      TabIndex        =   1
      Top             =   60
      Width           =   3375
   End
   Begin MSAdodcLib.Adodc datPrimaryRS 
      Align           =   2  'Align Bottom
      Height          =   330
      Left            =   0
      Top             =   10335
      Width           =   5775
      _ExtentX        =   10186
      _ExtentY        =   582
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   8
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   "PROVIDER=Microsoft.Jet.OLEDB.3.51;Data Source=D:\Documents PV\Access\Matériel informatique et licences.mdb;"
      OLEDBString     =   "PROVIDER=Microsoft.Jet.OLEDB.3.51;Data Source=D:\Documents PV\Access\Matériel informatique et licences.mdb;"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   $"ADODC_SR.frx":0000
      Caption         =   " "
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin VB.Label lblLabels 
      Caption         =   "Utilisateur:"
      Height          =   255
      Index           =   30
      Left            =   120
      TabIndex        =   60
      Top             =   9660
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Unité:"
      Height          =   255
      Index           =   29
      Left            =   120
      TabIndex        =   58
      Top             =   9340
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Type mémoire:"
      Height          =   255
      Index           =   28
      Left            =   120
      TabIndex        =   56
      Top             =   9020
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Système d'exploitation:"
      Height          =   255
      Index           =   27
      Left            =   120
      TabIndex        =   54
      Top             =   8700
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Souris:"
      Height          =   255
      Index           =   26
      Left            =   120
      TabIndex        =   52
      Top             =   8380
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Site:"
      Height          =   255
      Index           =   25
      Left            =   120
      TabIndex        =   50
      Top             =   8060
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Responsable:"
      Height          =   255
      Index           =   24
      Left            =   120
      TabIndex        =   48
      Top             =   7740
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Remarques:"
      Height          =   255
      Index           =   23
      Left            =   120
      TabIndex        =   46
      Top             =   7420
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Propriétaire:"
      Height          =   255
      Index           =   22
      Left            =   120
      TabIndex        =   44
      Top             =   7100
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Processeur:"
      Height          =   255
      Index           =   21
      Left            =   120
      TabIndex        =   42
      Top             =   6780
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Nom du système:"
      Height          =   255
      Index           =   20
      Left            =   120
      TabIndex        =   40
      Top             =   6460
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "N° de série:"
      Height          =   255
      Index           =   19
      Left            =   120
      TabIndex        =   38
      Top             =   6140
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Moniteur:"
      Height          =   255
      Index           =   18
      Left            =   120
      TabIndex        =   36
      Top             =   5820
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Mémoire cache:"
      Height          =   255
      Index           =   17
      Left            =   120
      TabIndex        =   34
      Top             =   5500
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Matériel complémentaire:"
      Height          =   255
      Index           =   16
      Left            =   120
      TabIndex        =   32
      Top             =   5180
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Marque et type:"
      Height          =   255
      Index           =   15
      Left            =   120
      TabIndex        =   30
      Top             =   4860
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Maintenance:"
      Height          =   255
      Index           =   14
      Left            =   120
      TabIndex        =   28
      Top             =   4540
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Equipement mémoire (Mo):"
      Height          =   255
      Index           =   13
      Left            =   120
      TabIndex        =   26
      Top             =   4220
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Disquette:"
      Height          =   255
      Index           =   12
      Left            =   120
      TabIndex        =   24
      Top             =   3900
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Disque dur (Mo):"
      Height          =   255
      Index           =   11
      Left            =   120
      TabIndex        =   22
      Top             =   3580
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Date d'affectation:"
      Height          =   255
      Index           =   10
      Left            =   120
      TabIndex        =   20
      Top             =   3260
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Date d'acquisition:"
      Height          =   255
      Index           =   9
      Left            =   120
      TabIndex        =   18
      Top             =   2940
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Contrôleur vidéo:"
      Height          =   255
      Index           =   8
      Left            =   120
      TabIndex        =   16
      Top             =   2620
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Contrôleur disque:"
      Height          =   255
      Index           =   7
      Left            =   120
      TabIndex        =   14
      Top             =   2300
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Commande:"
      Height          =   255
      Index           =   6
      Left            =   120
      TabIndex        =   12
      Top             =   1980
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Code amortissement:"
      Height          =   255
      Index           =   5
      Left            =   120
      TabIndex        =   10
      Top             =   1660
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "CD-Rom:"
      Height          =   255
      Index           =   4
      Left            =   120
      TabIndex        =   8
      Top             =   1340
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Carte réseau:"
      Height          =   255
      Index           =   3
      Left            =   120
      TabIndex        =   6
      Top             =   1020
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Bus:"
      Height          =   255
      Index           =   2
      Left            =   120
      TabIndex        =   4
      Top             =   700
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Assuré:"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Top             =   380
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Adresse IP:"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   60
      Width           =   1815
   End
End
Attribute VB_Name = "ADODC_SR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub Form_Unload(Cancel As Integer)
  Screen.MousePointer = vbDefault
End Sub

Private Sub datPrimaryRS_Error(ByVal ErrorNumber As Long, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, fCancelDisplay As Boolean)
  'This is where you would put error handling code
  'If you want to ignore errors, comment out the next line
  'If you want to trap them, add code here to handle them
  MsgBox "Data error event hit err:" & Description
End Sub

Private Sub datPrimaryRS_MoveComplete(ByVal adReason As ADODB.EventReasonEnum, ByVal pError As ADODB.Error, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
  'This will display the current record position for this recordset
  datPrimaryRS.Caption = "Record: " & CStr(datPrimaryRS.Recordset.AbsolutePosition)
End Sub

Private Sub datPrimaryRS_WillChangeRecord(ByVal adReason As ADODB.EventReasonEnum, ByVal cRecords As Long, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
  'This is where you put validation code
  'This event gets called when the following actions occur
  Dim bCancel As Boolean

  Select Case adReason
  Case adRsnAddNew
  Case adRsnClose
  Case adRsnDelete
  Case adRsnFirstChange
  Case adRsnMove
  Case adRsnRequery
  Case adRsnResynch
  Case adRsnUndoAddNew
  Case adRsnUndoDelete
  Case adRsnUndoUpdate
  Case adRsnUpdate
  End Select

  If bCancel Then adStatus = adStatusCancel
End Sub

Private Sub cmdAdd_Click()
  On Error GoTo AddErr
  datPrimaryRS.Recordset.AddNew

  Exit Sub
AddErr:
  MsgBox Err.Description
End Sub

Private Sub cmdDelete_Click()
  On Error GoTo DeleteErr
  With datPrimaryRS.Recordset
    .Delete
    .MoveNext
    If .EOF Then .MoveLast
  End With
  Exit Sub
DeleteErr:
  MsgBox Err.Description
End Sub

Private Sub cmdRefresh_Click()
  'This is only needed for multi user apps
  On Error GoTo RefreshErr
  datPrimaryRS.Refresh
  Exit Sub
RefreshErr:
  MsgBox Err.Description
End Sub

Private Sub cmdUpdate_Click()
  On Error GoTo UpdateErr

  datPrimaryRS.Recordset.UpdateBatch adAffectAll
  Exit Sub
UpdateErr:
  MsgBox Err.Description
End Sub

Private Sub cmdClose_Click()
  Unload Me
End Sub

