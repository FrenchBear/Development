VERSION 5.00
Begin VB.Form frmCP 
   Caption         =   "Pages de code"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnSetLocaleSysDef 
      Caption         =   "SetLocale SysDef"
      Height          =   495
      Left            =   3120
      TabIndex        =   3
      Top             =   2400
      Width           =   1215
   End
   Begin VB.CommandButton btnSetLocalePo 
      Caption         =   "SetLocale Po"
      Height          =   495
      Left            =   3120
      TabIndex        =   2
      Top             =   1740
      Width           =   1215
   End
   Begin VB.CommandButton btnSetLocaleFr 
      Caption         =   "SetLocale Fr"
      Height          =   495
      Left            =   3120
      TabIndex        =   1
      Top             =   1080
      Width           =   1215
   End
   Begin VB.CommandButton cmdAfficheInfos 
      Caption         =   "Affiche Infos"
      Height          =   495
      Left            =   3120
      TabIndex        =   0
      Top             =   420
      Width           =   1215
   End
End
Attribute VB_Name = "frmCP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub cmdAfficheInfos_Click()
  Print "Pages de code"
  Print "OEM CP: "; GetOEMCP
  Print "ANSI CP: "; GetACP
  Print
  
  Dim lcid As Long
  lcid = GetThreadLocale
  Print "Thread locale: "; lcid
  Print "  Lang Id: "; LANGIDFROMLCID(lcid)
  Print "  Sort Id: "; SORTIDFROMLCID(lcid)
  Print "  Sort version: "; SORTVERSIONFROMLCID(lcid)
End Sub

Private Sub btnSetLocaleFr_Click()
  SetLocale MAKELCID(MAKELANGID(LANG_FRENCH, SUBLANG_FRENCH), SORT_DEFAULT)
End Sub

Private Sub btnSetLocalePo_Click()
  SetLocale MAKELCID(MAKELANGID(LANG_POLISH, SUBLANG_DEFAULT), SORT_DEFAULT)
End Sub

Private Sub btnSetLocaleSysDef_Click()
  SetLocale LOCALE_SYSTEM_DEFAULT
End Sub


Private Sub SetLocale(lcid As Long)
  Print
  Dim iRet As Long, iErr As Long
  iRet = SetThreadLocale(lcid)
  iErr = GetLastError
  Print "SetThreadLocale("; lcid; ") -> "; iRet
  If iRet = 0 Then Print "  GetLastError: "; iErr
  
  Print "Thread locale: "; GetThreadLocale
End Sub

