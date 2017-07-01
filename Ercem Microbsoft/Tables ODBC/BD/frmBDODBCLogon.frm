VERSION 5.00
Begin VB.Form frmBDODBCLogon 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Connexion ODBC"
   ClientHeight    =   2445
   ClientLeft      =   2850
   ClientTop       =   1755
   ClientWidth     =   5325
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmBDODBCLogon.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2445
   ScaleWidth      =   5325
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CheckBox chkDéfaut 
      Caption         =   "&Par défaut au lancement"
      Height          =   195
      Left            =   60
      TabIndex        =   4
      Top             =   1620
      Width           =   3315
   End
   Begin VB.ComboBox cboDSNList 
      Height          =   330
      ItemData        =   "frmBDODBCLogon.frx":014A
      Left            =   2160
      List            =   "frmBDODBCLogon.frx":014C
      Sorted          =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   600
      Width           =   3120
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   2805
      TabIndex        =   6
      Top             =   2040
      Width           =   1455
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   1200
      TabIndex        =   5
      Top             =   2040
      Width           =   1455
   End
   Begin VB.Label lblDéfaut 
      Caption         =   "Cocher la case suivante pour utiliser cette source de données à chaque lancement du programme."
      Height          =   435
      Left            =   60
      TabIndex        =   3
      Top             =   1140
      Width           =   5175
   End
   Begin VB.Label lblSource 
      Caption         =   "Choisissez la base de données contenant les données auxquelles vous voulez accéder."
      Height          =   450
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   5175
   End
   Begin VB.Label lblSource2 
      AutoSize        =   -1  'True
      Caption         =   "&Source de données :"
      Height          =   210
      Left            =   60
      TabIndex        =   1
      Top             =   645
      Width           =   1965
   End
End
Attribute VB_Name = "frmBDODBCLogon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmBDODBCLogon
' Choix d'une source ODBC interactive
' La boîte de dialogue standard plante le VB6…
' 31/03/1999 PV
'  7/07/1999 PV RemplitListeSourcesODBC dans modGlobalODBC
' 30/09/1999 PV Fin
' 13/07/2000 PV Internationalisation


Option Explicit


Private sSource As String
Private sSourceDéfaut As String
Private iSauveCurseur As Integer


Public Function sChoixSource(sDéfaut As String) As String
  sSource = ""
  sSourceDéfaut = sDéfaut
  Show vbModal
  sChoixSource = sSource
  Screen.MousePointer = iSauveCurseur
End Function

Private Sub btnAnnuler_Click()
    Unload Me
End Sub

Private Sub btnOK_Click()
  If cboDSNList.ListIndex < 0 Then
    MsgBox "Vous devez choisir une source de données dans la liste.", vbExclamation, App.Title
    cboDSNList.SetFocus
    Exit Sub
  End If
  
  sSource = cboDSNList.Text
  
  If chkDéfaut = vbChecked Then
    SaveSetting App.EXEName, "Options", "SourceODBCDéfaut", sSource
  End If
  
  Unload Me
End Sub

Private Sub cboDSNList_Click()
  btnOK.Enabled = True
End Sub

Private Sub Form_Load()
  Internationalisation
  
  iSauveCurseur = Screen.MousePointer
  Screen.MousePointer = vbDefault
  RemplitListeSourcesODBC cboDSNList, sSourceDéfaut
  
  If sSourceDéfaut = "" Then btnOK.Enabled = False
  
  If GetSourceODBCDéfaut = "?" Then
    chkDéfaut.Value = vbChecked
    chkDéfaut.Enabled = False
  End If
End Sub


Public Function GetSourceODBCDéfaut() As String
  GetSourceODBCDéfaut = GetSetting(App.EXEName, "Options", "SourceODBCDéfaut", "?")
End Function

Public Sub SetSourceODBCDéfaut(sSource As String)
  SaveSetting App.EXEName, "Options", "SourceODBCDéfaut", sSource
End Sub




'========================================================
' Internationalisation

Public Sub Internationalisation()
  Caption = App.Title & " - " & sIntlLib("F:Connexion ODBC%%A:ODBC connection")
  
  SetLib lblSource, "Caption", "A:Choose data source you want to connect to from the list."
  SetLib lblSource2, "Caption", "A:Data &source :"
  SetLib lblDéfaut, "Caption", "A:Check next box to use this data source each time you lauch this program."
  SetLib chkDéfaut, "Caption", "A:&Default data source"
End Sub
