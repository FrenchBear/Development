VERSION 4.00
Begin VB.Form FormChildModel 
   Appearance      =   0  'Flat
   Caption         =   "Form1"
   ClientHeight    =   6465
   ClientLeft      =   735
   ClientTop       =   390
   ClientWidth     =   8130
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   1
      weight          =   700
      size            =   8.25
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Height          =   6870
   Icon            =   "HACCHILD.frx":0000
   Left            =   675
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   6465
   ScaleWidth      =   8130
   Top             =   45
   Width           =   8250
   Begin VB.PictureBox picFleche 
      Height          =   375
      Left            =   7260
      Picture         =   "HACCHILD.frx":030A
      ScaleHeight     =   315
      ScaleWidth      =   375
      TabIndex        =   133
      Top             =   1380
      Visible         =   0   'False
      Width           =   435
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   6405
      Left            =   0
      TabIndex        =   46
      Top             =   0
      Width           =   6975
      _version        =   65536
      _extentx        =   12303
      _extenty        =   11298
      _stockprops     =   15
      caption         =   "Tab 5"
      BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
         name            =   "Arial Narrow"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      tabsperrow      =   7
      tab             =   5
      taborientation  =   1
      tabs            =   7
      style           =   1
      tabmaxwidth     =   0
      tabheight       =   706
      tab(0).controlcount=   1
      tab(0).controlenabled=   0   'False
      tab(0).control(0)=   "Panel(0)"
      tab(1).controlcount=   1
      tab(1).controlenabled=   0   'False
      tab(1).control(0)=   "Panel(1)"
      tab(2).controlcount=   1
      tab(2).controlenabled=   0   'False
      tab(2).control(0)=   "Panel(2)"
      tab(3).controlcount=   1
      tab(3).controlenabled=   0   'False
      tab(3).control(0)=   "Panel(3)"
      tab(4).controlcount=   1
      tab(4).controlenabled=   0   'False
      tab(4).control(0)=   "Panel(4)"
      tab(5).controlcount=   1
      tab(5).controlenabled=   -1  'True
      tab(5).control(0)=   "Panel(5)"
      tab(6).controlcount=   1
      tab(6).controlenabled=   0   'False
      tab(6).control(0)=   "Panel(6)"
      Begin Threed.SSPanel Panel 
         Height          =   5805
         Index           =   6
         Left            =   -74940
         TabIndex        =   68
         Top             =   60
         Width           =   6735
         _version        =   65536
         _extentx        =   11880
         _extenty        =   10239
         _stockprops     =   15
         bevelouter      =   0
         alignment       =   1
         Begin VB.TextBox A_txtDonnee 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Index           =   6
            Left            =   3630
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   123
            Top             =   4560
            Width           =   2115
         End
         Begin VB.ListBox A_lstDonnees 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   6
            ItemData        =   "HACCHILD.frx":04F8
            Left            =   1200
            List            =   "HACCHILD.frx":04FA
            TabIndex        =   122
            Top             =   4560
            Width           =   2355
         End
         Begin VB.TextBox A_txtDonnee 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Index           =   5
            Left            =   3630
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   118
            Top             =   4080
            Width           =   2115
         End
         Begin VB.ListBox A_lstDonnees 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   5
            ItemData        =   "HACCHILD.frx":04FC
            Left            =   1200
            List            =   "HACCHILD.frx":04FE
            TabIndex        =   117
            Top             =   4080
            Width           =   2355
         End
         Begin VB.TextBox A_txtDonnee 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Index           =   4
            Left            =   3630
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   113
            Top             =   3600
            Width           =   2115
         End
         Begin VB.ListBox A_lstDonnees 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   4
            ItemData        =   "HACCHILD.frx":0500
            Left            =   1200
            List            =   "HACCHILD.frx":0502
            TabIndex        =   112
            Top             =   3600
            Width           =   2355
         End
         Begin VB.TextBox A_txtDonnee 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Index           =   3
            Left            =   3630
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   108
            Top             =   3120
            Width           =   2115
         End
         Begin VB.ListBox A_lstDonnees 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   3
            ItemData        =   "HACCHILD.frx":0504
            Left            =   1200
            List            =   "HACCHILD.frx":0506
            TabIndex        =   107
            Top             =   3120
            Width           =   2355
         End
         Begin VB.TextBox A_txtDonnee 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Index           =   2
            Left            =   3630
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   103
            Top             =   2640
            Width           =   2115
         End
         Begin VB.ListBox A_lstDonnees 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   2
            ItemData        =   "HACCHILD.frx":0508
            Left            =   1200
            List            =   "HACCHILD.frx":050A
            TabIndex        =   102
            Top             =   2640
            Width           =   2355
         End
         Begin VB.TextBox A_txtDonnee 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Index           =   1
            Left            =   3630
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   98
            Top             =   2160
            Width           =   2115
         End
         Begin VB.ListBox A_lstDonnees 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   1
            ItemData        =   "HACCHILD.frx":050C
            Left            =   1200
            List            =   "HACCHILD.frx":050E
            TabIndex        =   97
            Top             =   2160
            Width           =   2355
         End
         Begin VB.ComboBox lstSujetsDangers 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Index           =   1
            Left            =   1200
            Style           =   2  'Dropdown List
            TabIndex        =   94
            Top             =   1020
            Width           =   4695
         End
         Begin VB.ListBox A_lstDonnees 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   0
            ItemData        =   "HACCHILD.frx":0510
            Left            =   1200
            List            =   "HACCHILD.frx":0512
            TabIndex        =   90
            Top             =   1335
            Width           =   2355
         End
         Begin VB.TextBox A_txtDonnee 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Index           =   0
            Left            =   3630
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   89
            Top             =   1335
            Width           =   2115
         End
         Begin VB.ComboBox lstEtapes 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Index           =   1
            Left            =   1200
            Style           =   2  'Dropdown List
            TabIndex        =   84
            Top             =   390
            Width           =   4695
         End
         Begin VB.ComboBox lstSujets 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Index           =   1
            Left            =   1200
            Style           =   2  'Dropdown List
            TabIndex        =   83
            Top             =   705
            Width           =   4695
         End
         Begin VB.PictureBox Picture1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   480
            Index           =   6
            Left            =   15
            Picture         =   "HACCHILD.frx":0514
            ScaleHeight     =   480
            ScaleWidth      =   480
            TabIndex        =   78
            TabStop         =   0   'False
            Top             =   -30
            Width           =   480
         End
         Begin Threed.SSPanel A_lblNomNiveau 
            Height          =   255
            Index           =   0
            Left            =   60
            TabIndex        =   91
            Top             =   1335
            Width           =   1095
            _version        =   65536
            _extentx        =   1931
            _extenty        =   450
            _stockprops     =   15
            backcolor       =   12632256
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            bevelouter      =   0
            outline         =   -1  'True
         End
         Begin Threed.SSPanel A_lblNomNiveau 
            Height          =   255
            Index           =   1
            Left            =   60
            TabIndex        =   99
            Top             =   2160
            Width           =   1095
            _version        =   65536
            _extentx        =   1931
            _extenty        =   450
            _stockprops     =   15
            backcolor       =   12632256
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            bevelouter      =   0
            outline         =   -1  'True
         End
         Begin Threed.SSPanel A_lblNomNiveau 
            Height          =   255
            Index           =   2
            Left            =   60
            TabIndex        =   104
            Top             =   2640
            Width           =   1095
            _version        =   65536
            _extentx        =   1931
            _extenty        =   450
            _stockprops     =   15
            backcolor       =   12632256
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            bevelouter      =   0
            outline         =   -1  'True
         End
         Begin Threed.SSPanel A_lblNomNiveau 
            Height          =   255
            Index           =   3
            Left            =   60
            TabIndex        =   109
            Top             =   3120
            Width           =   1095
            _version        =   65536
            _extentx        =   1931
            _extenty        =   450
            _stockprops     =   15
            backcolor       =   12632256
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            bevelouter      =   0
            outline         =   -1  'True
         End
         Begin Threed.SSPanel A_lblNomNiveau 
            Height          =   255
            Index           =   4
            Left            =   60
            TabIndex        =   114
            Top             =   3600
            Width           =   1095
            _version        =   65536
            _extentx        =   1931
            _extenty        =   450
            _stockprops     =   15
            backcolor       =   12632256
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            bevelouter      =   0
            outline         =   -1  'True
         End
         Begin Threed.SSPanel A_lblNomNiveau 
            Height          =   255
            Index           =   5
            Left            =   60
            TabIndex        =   119
            Top             =   4080
            Width           =   1095
            _version        =   65536
            _extentx        =   1931
            _extenty        =   450
            _stockprops     =   15
            backcolor       =   12632256
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            bevelouter      =   0
            outline         =   -1  'True
         End
         Begin Threed.SSPanel A_lblNomNiveau 
            Height          =   255
            Index           =   6
            Left            =   60
            TabIndex        =   124
            Top             =   4560
            Width           =   1095
            _version        =   65536
            _extentx        =   1931
            _extenty        =   450
            _stockprops     =   15
            backcolor       =   12632256
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            bevelouter      =   0
            outline         =   -1  'True
         End
         Begin VB.Line A_Line 
            BorderColor     =   &H00404040&
            BorderWidth     =   2
            Index           =   6
            X1              =   180
            X2              =   180
            Y1              =   4320
            Y2              =   4560
         End
         Begin VB.Line A_Line 
            BorderColor     =   &H00404040&
            BorderWidth     =   2
            Index           =   5
            X1              =   180
            X2              =   180
            Y1              =   3840
            Y2              =   4080
         End
         Begin VB.Line A_Line 
            BorderColor     =   &H00404040&
            BorderWidth     =   2
            Index           =   4
            X1              =   180
            X2              =   180
            Y1              =   3360
            Y2              =   3600
         End
         Begin VB.Line A_Line 
            BorderColor     =   &H00404040&
            BorderWidth     =   2
            Index           =   3
            X1              =   180
            X2              =   180
            Y1              =   2940
            Y2              =   3180
         End
         Begin VB.Line A_Line 
            BorderColor     =   &H00404040&
            BorderWidth     =   2
            Index           =   2
            X1              =   180
            X2              =   180
            Y1              =   2400
            Y2              =   2640
         End
         Begin VB.Line A_Line 
            BorderColor     =   &H00404040&
            BorderWidth     =   2
            Index           =   1
            X1              =   180
            X2              =   180
            Y1              =   1920
            Y2              =   2160
         End
         Begin Threed.SSCommand A_btnAjouterDonnee 
            Height          =   270
            Index           =   6
            Left            =   5760
            TabIndex        =   126
            Top             =   4560
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "+"
            outline         =   0   'False
         End
         Begin Threed.SSCommand A_btnDocuments 
            Height          =   270
            Index           =   6
            Left            =   5760
            TabIndex        =   125
            Top             =   4740
            Visible         =   0   'False
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "è"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "Wingdings"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin Threed.SSCommand A_btnAjouterDonnee 
            Height          =   270
            Index           =   5
            Left            =   5760
            TabIndex        =   121
            Top             =   4080
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "+"
            outline         =   0   'False
         End
         Begin Threed.SSCommand A_btnDocuments 
            Height          =   270
            Index           =   5
            Left            =   5760
            TabIndex        =   120
            Top             =   4260
            Visible         =   0   'False
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "è"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "Wingdings"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin Threed.SSCommand A_btnAjouterDonnee 
            Height          =   270
            Index           =   4
            Left            =   5760
            TabIndex        =   116
            Top             =   3600
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "+"
            outline         =   0   'False
         End
         Begin Threed.SSCommand A_btnDocuments 
            Height          =   270
            Index           =   4
            Left            =   5760
            TabIndex        =   115
            Top             =   3780
            Visible         =   0   'False
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "è"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "Wingdings"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin Threed.SSCommand A_btnAjouterDonnee 
            Height          =   270
            Index           =   3
            Left            =   5760
            TabIndex        =   111
            Top             =   3120
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "+"
            outline         =   0   'False
         End
         Begin Threed.SSCommand A_btnDocuments 
            Height          =   270
            Index           =   3
            Left            =   5760
            TabIndex        =   110
            Top             =   3300
            Visible         =   0   'False
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "è"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "Wingdings"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin Threed.SSCommand A_btnAjouterDonnee 
            Height          =   270
            Index           =   2
            Left            =   5760
            TabIndex        =   106
            Top             =   2640
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "+"
            outline         =   0   'False
         End
         Begin Threed.SSCommand A_btnDocuments 
            Height          =   270
            Index           =   2
            Left            =   5760
            TabIndex        =   105
            Top             =   2820
            Visible         =   0   'False
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "è"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "Wingdings"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin Threed.SSCommand A_btnAjouterDonnee 
            Height          =   270
            Index           =   1
            Left            =   5760
            TabIndex        =   101
            Top             =   2160
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "+"
            outline         =   0   'False
         End
         Begin Threed.SSCommand A_btnDocuments 
            Height          =   270
            Index           =   1
            Left            =   5760
            TabIndex        =   100
            Top             =   2340
            Visible         =   0   'False
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "è"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "Wingdings"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin Threed.SSCommand btnCommentaireDanger 
            Height          =   270
            Index           =   1
            Left            =   5880
            TabIndex        =   96
            Top             =   1020
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "C"
            outline         =   0   'False
         End
         Begin VB.Label LabelDanger 
            Caption         =   "Danger :"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Index           =   1
            Left            =   60
            TabIndex        =   95
            Top             =   1050
            Width           =   1155
         End
         Begin Threed.SSCommand A_btnDocuments 
            Height          =   270
            Index           =   0
            Left            =   5760
            TabIndex        =   93
            Top             =   1515
            Visible         =   0   'False
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "è"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "Wingdings"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin Threed.SSCommand A_btnAjouterDonnee 
            Height          =   270
            Index           =   0
            Left            =   5760
            TabIndex        =   92
            Top             =   1335
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "+"
            outline         =   0   'False
         End
         Begin VB.Line LineSep 
            Index           =   6
            X1              =   60
            X2              =   6180
            Y1              =   375
            Y2              =   375
         End
         Begin VB.Label LabelEtape 
            Caption         =   "Etape :"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   1
            Left            =   60
            TabIndex        =   88
            Top             =   435
            Width           =   1155
         End
         Begin VB.Label LabelSujet 
            Caption         =   "Sujet :"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   1
            Left            =   60
            TabIndex        =   87
            Top             =   750
            Width           =   1155
         End
         Begin Threed.SSCommand btnCommentaireEtape 
            Height          =   270
            Index           =   1
            Left            =   5880
            TabIndex        =   86
            Top             =   390
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "C"
            outline         =   0   'False
         End
         Begin Threed.SSCommand btnCommentaireSujet 
            Height          =   270
            Index           =   1
            Left            =   5880
            TabIndex        =   85
            Top             =   705
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "C"
            outline         =   0   'False
         End
         Begin VB.Label lblCommentaire 
            BackStyle       =   0  'Transparent
            Caption         =   "Label1 sdfgsdf gsdfg sdfg sdfg sdfg sdfg "
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   435
            Index           =   6
            Left            =   540
            TabIndex        =   79
            Top             =   -15
            Width           =   5655
         End
      End
      Begin Threed.SSPanel Panel 
         Height          =   5850
         Index           =   4
         Left            =   -74940
         TabIndex        =   67
         Top             =   60
         Width           =   6735
         _version        =   65536
         _extentx        =   11880
         _extenty        =   10319
         _stockprops     =   15
         bevelouter      =   0
         alignment       =   1
         Begin VB.TextBox D_txtDonnee 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   705
            Index           =   5
            Left            =   3630
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   59
            Top             =   5250
            Width           =   2115
         End
         Begin VB.ListBox D_lstDonnees 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   645
            Index           =   5
            ItemData        =   "HACCHILD.frx":0D56
            Left            =   1200
            List            =   "HACCHILD.frx":0D58
            TabIndex        =   58
            Top             =   5250
            Width           =   2355
         End
         Begin VB.ListBox D_lstDonnees 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   645
            Index           =   4
            ItemData        =   "HACCHILD.frx":0D5A
            Left            =   1200
            List            =   "HACCHILD.frx":0D5C
            TabIndex        =   53
            Top             =   4470
            Width           =   2355
         End
         Begin VB.TextBox D_txtDonnee 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   705
            Index           =   4
            Left            =   3630
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   54
            Top             =   4470
            Width           =   2115
         End
         Begin VB.ListBox D_lstDonnees 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   645
            Index           =   3
            ItemData        =   "HACCHILD.frx":0D5E
            Left            =   1200
            List            =   "HACCHILD.frx":0D60
            TabIndex        =   48
            Top             =   3690
            Width           =   2355
         End
         Begin VB.TextBox D_txtDonnee 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   705
            Index           =   3
            Left            =   3630
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   49
            Top             =   3690
            Width           =   2115
         End
         Begin VB.ListBox D_lstDonnees 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   645
            Index           =   2
            ItemData        =   "HACCHILD.frx":0D62
            Left            =   1200
            List            =   "HACCHILD.frx":0D64
            TabIndex        =   42
            Top             =   2910
            Width           =   2355
         End
         Begin VB.TextBox D_txtDonnee 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   705
            Index           =   2
            Left            =   3630
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   43
            Top             =   2910
            Width           =   2115
         End
         Begin VB.ListBox D_lstDonnees 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   645
            Index           =   1
            ItemData        =   "HACCHILD.frx":0D66
            Left            =   1200
            List            =   "HACCHILD.frx":0D68
            TabIndex        =   37
            Top             =   2130
            Width           =   2355
         End
         Begin VB.TextBox D_txtDonnee 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   705
            Index           =   1
            Left            =   3630
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   38
            Top             =   2130
            Width           =   2115
         End
         Begin VB.ComboBox lstSujets 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Index           =   0
            Left            =   1200
            Style           =   2  'Dropdown List
            TabIndex        =   29
            Top             =   960
            Width           =   4575
         End
         Begin VB.ComboBox lstEtapes 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Index           =   0
            Left            =   1200
            Style           =   2  'Dropdown List
            TabIndex        =   26
            Top             =   600
            Width           =   4575
         End
         Begin VB.TextBox D_txtDonnee 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   705
            Index           =   0
            Left            =   3630
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   33
            Top             =   1320
            Width           =   2115
         End
         Begin VB.ListBox D_lstDonnees 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   645
            Index           =   0
            ItemData        =   "HACCHILD.frx":0D6A
            Left            =   1200
            List            =   "HACCHILD.frx":0D6C
            TabIndex        =   32
            Top             =   1320
            Width           =   2355
         End
         Begin VB.PictureBox Picture1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   480
            Index           =   4
            Left            =   60
            Picture         =   "HACCHILD.frx":0D6E
            ScaleHeight     =   480
            ScaleWidth      =   480
            TabIndex        =   76
            TabStop         =   0   'False
            Top             =   0
            Width           =   480
         End
         Begin Threed.SSPanel D_lblNomNiveau 
            Height          =   390
            Index           =   0
            Left            =   60
            TabIndex        =   31
            Top             =   1320
            Width           =   1095
            _version        =   65536
            _extentx        =   1931
            _extenty        =   688
            _stockprops     =   15
            backcolor       =   12632256
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            bevelouter      =   0
            outline         =   -1  'True
         End
         Begin Threed.SSPanel D_lblNomNiveau 
            Height          =   390
            Index           =   1
            Left            =   60
            TabIndex        =   36
            Top             =   2100
            Width           =   1095
            _version        =   65536
            _extentx        =   1931
            _extenty        =   688
            _stockprops     =   15
            backcolor       =   12632256
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            bevelouter      =   0
            outline         =   -1  'True
         End
         Begin Threed.SSPanel D_lblNomNiveau 
            Height          =   390
            Index           =   2
            Left            =   60
            TabIndex        =   41
            Top             =   2880
            Width           =   1095
            _version        =   65536
            _extentx        =   1931
            _extenty        =   688
            _stockprops     =   15
            backcolor       =   12632256
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            bevelouter      =   0
            outline         =   -1  'True
         End
         Begin Threed.SSPanel D_lblNomNiveau 
            Height          =   390
            Index           =   3
            Left            =   60
            TabIndex        =   47
            Top             =   3660
            Width           =   1095
            _version        =   65536
            _extentx        =   1931
            _extenty        =   688
            _stockprops     =   15
            backcolor       =   12632256
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            bevelouter      =   0
            outline         =   -1  'True
         End
         Begin Threed.SSPanel D_lblNomNiveau 
            Height          =   390
            Index           =   4
            Left            =   60
            TabIndex        =   52
            Top             =   4440
            Width           =   1095
            _version        =   65536
            _extentx        =   1931
            _extenty        =   688
            _stockprops     =   15
            backcolor       =   12632256
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            bevelouter      =   0
            outline         =   -1  'True
         End
         Begin Threed.SSPanel D_lblNomNiveau 
            Height          =   390
            Index           =   5
            Left            =   60
            TabIndex        =   57
            Top             =   5220
            Width           =   1095
            _version        =   65536
            _extentx        =   1931
            _extenty        =   688
            _stockprops     =   15
            backcolor       =   12632256
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            bevelouter      =   0
            outline         =   -1  'True
         End
         Begin VB.Line D_Line 
            BorderColor     =   &H00404040&
            BorderWidth     =   2
            Index           =   5
            X1              =   120
            X2              =   120
            Y1              =   4800
            Y2              =   5280
         End
         Begin Threed.SSCommand D_btnAjouterDonnee 
            Height          =   270
            Index           =   5
            Left            =   5760
            TabIndex        =   60
            Top             =   5220
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "+"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin Threed.SSCommand D_btnDocuments 
            Height          =   270
            Index           =   5
            Left            =   5760
            TabIndex        =   61
            Top             =   5580
            Visible         =   0   'False
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "è"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "Wingdings"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin VB.Line LineSep 
            Index           =   4
            X1              =   60
            X2              =   6300
            Y1              =   495
            Y2              =   495
         End
         Begin Threed.SSCommand btnCommentaireSujet 
            Height          =   270
            Index           =   0
            Left            =   5760
            TabIndex        =   30
            Top             =   960
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "C"
            outline         =   0   'False
         End
         Begin Threed.SSCommand btnCommentaireEtape 
            Height          =   270
            Index           =   0
            Left            =   5760
            TabIndex        =   27
            Top             =   600
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "C"
            outline         =   0   'False
         End
         Begin Threed.SSCommand D_btnDocuments 
            Height          =   270
            Index           =   4
            Left            =   5760
            TabIndex        =   56
            Top             =   4800
            Visible         =   0   'False
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "è"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "Wingdings"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin Threed.SSCommand D_btnAjouterDonnee 
            Height          =   270
            Index           =   4
            Left            =   5760
            TabIndex        =   55
            Top             =   4440
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "+"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin VB.Line D_Line 
            BorderColor     =   &H00404040&
            BorderWidth     =   2
            Index           =   4
            X1              =   120
            X2              =   120
            Y1              =   4200
            Y2              =   4680
         End
         Begin Threed.SSCommand D_btnDocuments 
            Height          =   270
            Index           =   3
            Left            =   5760
            TabIndex        =   51
            Top             =   4020
            Visible         =   0   'False
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "è"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "Wingdings"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin Threed.SSCommand D_btnAjouterDonnee 
            Height          =   270
            Index           =   3
            Left            =   5760
            TabIndex        =   50
            Top             =   3660
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "+"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin VB.Line D_Line 
            BorderColor     =   &H00404040&
            BorderWidth     =   2
            Index           =   3
            X1              =   120
            X2              =   120
            Y1              =   3360
            Y2              =   3840
         End
         Begin Threed.SSCommand D_btnDocuments 
            Height          =   270
            Index           =   2
            Left            =   5760
            TabIndex        =   45
            Top             =   3240
            Visible         =   0   'False
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "è"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "Wingdings"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin Threed.SSCommand D_btnAjouterDonnee 
            Height          =   270
            Index           =   2
            Left            =   5760
            TabIndex        =   44
            Top             =   2880
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "+"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin VB.Line D_Line 
            BorderColor     =   &H00404040&
            BorderWidth     =   2
            Index           =   2
            X1              =   120
            X2              =   120
            Y1              =   2520
            Y2              =   3000
         End
         Begin Threed.SSCommand D_btnDocuments 
            Height          =   270
            Index           =   1
            Left            =   5760
            TabIndex        =   40
            Top             =   2460
            Visible         =   0   'False
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "è"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "Wingdings"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin Threed.SSCommand D_btnAjouterDonnee 
            Height          =   270
            Index           =   1
            Left            =   5760
            TabIndex        =   39
            Top             =   2100
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "+"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin VB.Line D_Line 
            BorderColor     =   &H00404040&
            BorderWidth     =   2
            Index           =   1
            X1              =   120
            X2              =   120
            Y1              =   1680
            Y2              =   2160
         End
         Begin VB.Label LabelSujet 
            Caption         =   "Sujet :"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   0
            Left            =   480
            TabIndex        =   28
            Top             =   1020
            Width           =   615
         End
         Begin VB.Label LabelEtape 
            Caption         =   "Etape :"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   0
            Left            =   480
            TabIndex        =   25
            Top             =   660
            Width           =   615
         End
         Begin Threed.SSCommand D_btnAjouterDonnee 
            Height          =   270
            Index           =   0
            Left            =   5760
            TabIndex        =   34
            Top             =   1320
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "+"
            outline         =   0   'False
         End
         Begin Threed.SSCommand D_btnDocuments 
            Height          =   270
            Index           =   0
            Left            =   5760
            TabIndex        =   35
            Top             =   1800
            Visible         =   0   'False
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "è"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "Wingdings"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin VB.Label lblCommentaire 
            Caption         =   $"HACCHILD.frx":15B0
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   435
            Index           =   4
            Left            =   600
            TabIndex        =   77
            Top             =   0
            Width           =   6135
         End
      End
      Begin Threed.SSPanel Panel 
         Height          =   5700
         Index           =   3
         Left            =   -74940
         TabIndex        =   66
         Top             =   60
         Width           =   6765
         _version        =   65536
         _extentx        =   11933
         _extenty        =   10054
         _stockprops     =   15
         bevelouter      =   0
         alignment       =   1
         Begin VB.ListBox E_lstDonnees 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   1230
            Index           =   0
            ItemData        =   "HACCHILD.frx":15F6
            Left            =   1080
            List            =   "HACCHILD.frx":15F8
            TabIndex        =   16
            Top             =   600
            Width           =   2595
         End
         Begin VB.TextBox E_txtDonnee 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   1245
            Index           =   0
            Left            =   3750
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   17
            Top             =   600
            Width           =   2115
         End
         Begin VB.ListBox E_lstDonnees 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   1230
            Index           =   1
            ItemData        =   "HACCHILD.frx":15FA
            Left            =   1080
            List            =   "HACCHILD.frx":15FC
            TabIndex        =   21
            Top             =   2310
            Width           =   2595
         End
         Begin VB.TextBox E_txtDonnee 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   1245
            Index           =   1
            Left            =   3750
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   22
            Top             =   2310
            Width           =   2115
         End
         Begin VB.PictureBox Picture1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   480
            Index           =   3
            Left            =   60
            Picture         =   "HACCHILD.frx":15FE
            ScaleHeight     =   480
            ScaleWidth      =   480
            TabIndex        =   74
            TabStop         =   0   'False
            Top             =   0
            Width           =   480
         End
         Begin Threed.SSPanel E_lblNomNiveau 
            Height          =   750
            Index           =   1
            Left            =   60
            TabIndex        =   20
            Top             =   2280
            Width           =   975
            _version        =   65536
            _extentx        =   1720
            _extenty        =   1323
            _stockprops     =   15
            backcolor       =   12632256
            bevelouter      =   0
            outline         =   -1  'True
         End
         Begin Threed.SSPanel E_lblNomNiveau 
            Height          =   750
            Index           =   0
            Left            =   60
            TabIndex        =   15
            Top             =   600
            Width           =   975
            _version        =   65536
            _extentx        =   1720
            _extenty        =   1323
            _stockprops     =   15
            backcolor       =   12632256
            bevelouter      =   0
            outline         =   -1  'True
         End
         Begin VB.Line LineSep 
            Index           =   3
            X1              =   60
            X2              =   6985
            Y1              =   510
            Y2              =   510
         End
         Begin Threed.SSCommand E_btnDocuments 
            Height          =   270
            Index           =   1
            Left            =   5910
            TabIndex        =   24
            Top             =   2805
            Visible         =   0   'False
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "è"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "Wingdings"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin Threed.SSCommand E_btnAjouterDonnee 
            Height          =   270
            Index           =   1
            Left            =   5910
            TabIndex        =   23
            Top             =   2325
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "+"
            outline         =   0   'False
         End
         Begin Threed.SSCommand E_btnDocuments 
            Height          =   270
            Index           =   0
            Left            =   5925
            TabIndex        =   19
            Top             =   1080
            Visible         =   0   'False
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "è"
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "Wingdings"
               charset         =   1
               weight          =   700
               size            =   9
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            outline         =   0   'False
         End
         Begin Threed.SSCommand E_btnAjouterDonnee 
            Height          =   270
            Index           =   0
            Left            =   5925
            TabIndex        =   18
            Top             =   600
            Width           =   375
            _version        =   65536
            _extentx        =   661
            _extenty        =   476
            _stockprops     =   78
            caption         =   "+"
            outline         =   0   'False
         End
         Begin VB.Line E_Line 
            BorderColor     =   &H00404040&
            BorderWidth     =   2
            Index           =   1
            X1              =   120
            X2              =   120
            Y1              =   1680
            Y2              =   2160
         End
         Begin VB.Label lblCommentaire 
            Caption         =   "Label1"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   435
            Index           =   3
            Left            =   600
            TabIndex        =   75
            Top             =   0
            Width           =   4935
         End
      End
      Begin Threed.SSPanel Panel 
         Height          =   5775
         Index           =   2
         Left            =   -74940
         TabIndex        =   65
         Top             =   60
         Width           =   6735
         _version        =   65536
         _extentx        =   11880
         _extenty        =   10186
         _stockprops     =   15
         bevelouter      =   0
         alignment       =   1
         Begin VB.CommandButton btnSupprimerDocumentation 
            Caption         =   "S&upprimer"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3420
            TabIndex        =   142
            Top             =   5340
            Width           =   1635
         End
         Begin VB.CommandButton btnInsérerDocumentation 
            Caption         =   "In&sérer"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1740
            TabIndex        =   141
            Top             =   5340
            Width           =   1635
         End
         Begin VB.CommandButton btnAjouterDocumentation 
            Caption         =   "Aj&outer/Modifier"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   60
            TabIndex        =   140
            Top             =   5340
            Width           =   1635
         End
         Begin VB.PictureBox Picture1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   480
            Index           =   2
            Left            =   60
            Picture         =   "HACCHILD.frx":1E40
            ScaleHeight     =   480
            ScaleWidth      =   480
            TabIndex        =   72
            TabStop         =   0   'False
            Top             =   0
            Width           =   480
         End
         Begin FPSpread.vaSpread SpreadDocumentation 
            Height          =   3735
            Left            =   60
            TabIndex        =   14
            Top             =   600
            Width           =   6435
            _version        =   131077
            _extentx        =   11351
            _extenty        =   6588
            _stockprops     =   64
            allowdragdrop   =   -1  'True
            allowmultiblocks=   -1  'True
            allowuserformulas=   -1  'True
            colheaderdisplay=   0
            displayrowheaders=   0   'False
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            maxcols         =   4
            maxrows         =   1
            processtab      =   -1  'True
            scrollbarextmode=   -1  'True
            scrollbarshowmax=   0   'False
            spreaddesigner  =   "HACCHILD.frx":2682
            unittype        =   2
            userresize      =   1
            visiblecols     =   3
            visiblerows     =   1
         End
         Begin VB.Line LineSep 
            Index           =   2
            X1              =   60
            X2              =   6300
            Y1              =   495
            Y2              =   495
         End
         Begin VB.Label lblCommentaire 
            Caption         =   "Label1"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   435
            Index           =   2
            Left            =   600
            TabIndex        =   73
            Top             =   0
            Width           =   4935
         End
      End
      Begin Threed.SSPanel Panel 
         Height          =   5835
         Index           =   1
         Left            =   -74940
         TabIndex        =   63
         Top             =   60
         Width           =   6735
         _version        =   65536
         _extentx        =   11880
         _extenty        =   10292
         _stockprops     =   15
         bevelouter      =   0
         alignment       =   1
         Begin VB.PictureBox Picture1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   480
            Index           =   1
            Left            =   60
            Picture         =   "HACCHILD.frx":28FB
            ScaleHeight     =   480
            ScaleWidth      =   480
            TabIndex        =   69
            TabStop         =   0   'False
            Top             =   0
            Width           =   480
         End
         Begin FPSpread.vaSpread SpreadEquipe 
            Height          =   2685
            Left            =   60
            TabIndex        =   13
            Top             =   720
            Width           =   6525
            _version        =   131077
            _extentx        =   11509
            _extenty        =   4736
            _stockprops     =   64
            colsfrozen      =   1
            displayrowheaders=   0   'False
            editenteraction =   4
            editmodereplace =   -1  'True
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            maxcols         =   2
            maxrows         =   150
            processtab      =   -1  'True
            scrollbarextmode=   -1  'True
            scrollbarshowmax=   0   'False
            spreaddesigner  =   "HACCHILD.frx":313D
            unittype        =   2
            userresize      =   1
            visiblecols     =   1
            visiblerows     =   150
         End
         Begin VB.Line LineSep 
            Index           =   1
            X1              =   60
            X2              =   6180
            Y1              =   495
            Y2              =   495
         End
         Begin VB.Label Label7 
            Caption         =   "L'équipe HACCP est constituée de:"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   60
            TabIndex        =   12
            Top             =   495
            Width           =   4815
         End
         Begin VB.Label lblCommentaire 
            Caption         =   "Label1"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   435
            Index           =   1
            Left            =   600
            TabIndex        =   64
            Top             =   0
            Width           =   6015
         End
      End
      Begin Threed.SSPanel Panel 
         Height          =   5850
         Index           =   0
         Left            =   -74940
         TabIndex        =   62
         Top             =   60
         Width           =   6735
         _version        =   65536
         _extentx        =   11880
         _extenty        =   10319
         _stockprops     =   15
         bevelouter      =   0
         alignment       =   1
         Begin VB.TextBox txtTitre 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Left            =   1080
            TabIndex        =   1
            Top             =   600
            Width           =   4995
         End
         Begin VB.TextBox txtRéférence 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Left            =   1080
            TabIndex        =   5
            Top             =   1530
            Width           =   4095
         End
         Begin VB.TextBox txtAuteur 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Left            =   1080
            TabIndex        =   3
            Top             =   1110
            Width           =   4095
         End
         Begin VB.TextBox txtCommentaire 
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   1515
            Left            =   1080
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   11
            Top             =   2580
            Width           =   5535
         End
         Begin VB.PictureBox Picture1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   480
            Index           =   0
            Left            =   60
            Picture         =   "HACCHILD.frx":32F0
            ScaleHeight     =   480
            ScaleWidth      =   480
            TabIndex        =   70
            TabStop         =   0   'False
            Top             =   0
            Width           =   480
         End
         Begin VB.Line LineSep 
            Index           =   0
            X1              =   60
            X2              =   6240
            Y1              =   495
            Y2              =   495
         End
         Begin VB.Label Label3 
            Caption         =   "Référen&ce:"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   60
            TabIndex        =   4
            Top             =   1575
            Width           =   1215
         End
         Begin VB.Label Label2 
            Caption         =   "A&uteurs:"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   60
            TabIndex        =   2
            Top             =   1170
            Width           =   1215
         End
         Begin VB.Label Label1 
            Caption         =   "&Titre:"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   60
            TabIndex        =   0
            Top             =   600
            Width           =   1215
         End
         Begin VB.Label Label6 
            Caption         =   "C&ommentaire:"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   60
            TabIndex        =   10
            Top             =   2595
            Width           =   1050
         End
         Begin VB.Label lblDateModification 
            Caption         =   "xx/xx/xx"
            Enabled         =   0   'False
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   2880
            TabIndex        =   9
            Top             =   2250
            Width           =   2775
         End
         Begin VB.Label lblDateCréation 
            Caption         =   "xx/xx/xx"
            Enabled         =   0   'False
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   2880
            TabIndex        =   7
            Top             =   2010
            Width           =   2775
         End
         Begin VB.Label Label5 
            Caption         =   "Date de dernier enregistrement:"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   60
            TabIndex        =   8
            Top             =   2250
            Width           =   2775
         End
         Begin VB.Label Label4 
            Caption         =   "Date de création:"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   60
            TabIndex        =   6
            Top             =   2010
            Width           =   2775
         End
         Begin VB.Label lblCommentaire 
            Caption         =   "Label1"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   435
            Index           =   0
            Left            =   600
            TabIndex        =   71
            Top             =   0
            Width           =   6015
         End
      End
      Begin Threed.SSPanel Panel 
         Height          =   5775
         Index           =   5
         Left            =   60
         TabIndex        =   80
         Top             =   60
         Width           =   6735
         _version        =   65536
         _extentx        =   11880
         _extenty        =   10186
         _stockprops     =   15
         bevelouter      =   0
         alignment       =   1
         Begin VB.PictureBox Picture1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   480
            Index           =   5
            Left            =   60
            Picture         =   "HACCHILD.frx":3B32
            ScaleHeight     =   480
            ScaleWidth      =   480
            TabIndex        =   81
            TabStop         =   0   'False
            Top             =   0
            Width           =   480
         End
         Begin Threed.SSPanel PanelDangers 
            Height          =   2385
            Left            =   60
            TabIndex        =   127
            Top             =   570
            Width           =   6345
            _version        =   65536
            _extentx        =   11192
            _extenty        =   4207
            _stockprops     =   15
            bevelouter      =   0
            Begin VB.CommandButton btnSupprimerDanger 
               Caption         =   "Supprimer"
               BeginProperty Font 
                  name            =   "MS Sans Serif"
                  charset         =   1
                  weight          =   400
                  size            =   8.25
                  underline       =   0   'False
                  italic          =   0   'False
                  strikethrough   =   0   'False
               EndProperty
               Height          =   300
               Left            =   2760
               TabIndex        =   136
               Top             =   1890
               Width           =   1095
            End
            Begin VB.CommandButton btnInsérerDanger 
               Caption         =   "Insérer"
               BeginProperty Font 
                  name            =   "MS Sans Serif"
                  charset         =   1
                  weight          =   400
                  size            =   8.25
                  underline       =   0   'False
                  italic          =   0   'False
                  strikethrough   =   0   'False
               EndProperty
               Height          =   300
               Left            =   1560
               TabIndex        =   135
               Top             =   1890
               Width           =   1095
            End
            Begin VB.CommandButton btnAjouterDanger 
               Caption         =   "Ajouter/Modifier"
               BeginProperty Font 
                  name            =   "MS Sans Serif"
                  charset         =   1
                  weight          =   400
                  size            =   8.25
                  underline       =   0   'False
                  italic          =   0   'False
                  strikethrough   =   0   'False
               EndProperty
               Height          =   300
               Left            =   0
               TabIndex        =   134
               Top             =   1890
               Width           =   1455
            End
            Begin VB.Line Line1 
               BorderStyle     =   3  'Dot
               BorderWidth     =   2
               X1              =   0
               X2              =   6180
               Y1              =   2280
               Y2              =   2280
            End
            Begin FPSpread.vaSpread SpreadDangers 
               Height          =   1635
               Left            =   0
               TabIndex        =   128
               Top             =   225
               Width           =   6200
               _version        =   131077
               _extentx        =   10927
               _extenty        =   2884
               _stockprops     =   64
               colheaderdisplay=   0
               colsfrozen      =   1
               displayrowheaders=   0   'False
               BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
                  name            =   "MS Sans Serif"
                  charset         =   1
                  weight          =   400
                  size            =   8.25
                  underline       =   0   'False
                  italic          =   0   'False
                  strikethrough   =   0   'False
               EndProperty
               maxcols         =   5
               maxrows         =   1
               processtab      =   -1  'True
               scrollbarextmode=   -1  'True
               scrollbarshowmax=   0   'False
               spreaddesigner  =   "HACCHILD.frx":4374
               unittype        =   2
               userresize      =   1
               visiblecols     =   1
               visiblerows     =   1
            End
            Begin VB.Label lblTitreDangers 
               Caption         =   "Evaluation de la &pertinence"
               BeginProperty Font 
                  name            =   "MS Sans Serif"
                  charset         =   1
                  weight          =   400
                  size            =   8.25
                  underline       =   0   'False
                  italic          =   0   'False
                  strikethrough   =   0   'False
               EndProperty
               Height          =   240
               Left            =   -15
               TabIndex        =   129
               Top             =   0
               Width           =   6450
            End
         End
         Begin Threed.SSPanel PanelSujetsDangers 
            Height          =   2520
            Left            =   60
            TabIndex        =   130
            Top             =   2910
            Width           =   6495
            _version        =   65536
            _extentx        =   11456
            _extenty        =   4445
            _stockprops     =   15
            bevelouter      =   0
            Begin VB.CommandButton btnSupprimerSujetDanger 
               Caption         =   "Supprimer"
               BeginProperty Font 
                  name            =   "MS Sans Serif"
                  charset         =   1
                  weight          =   400
                  size            =   8.25
                  underline       =   0   'False
                  italic          =   0   'False
                  strikethrough   =   0   'False
               EndProperty
               Height          =   300
               Left            =   2760
               TabIndex        =   139
               Top             =   1920
               Width           =   1095
            End
            Begin VB.CommandButton btnInsérerSujetDanger 
               Caption         =   "Insérer"
               BeginProperty Font 
                  name            =   "MS Sans Serif"
                  charset         =   1
                  weight          =   400
                  size            =   8.25
                  underline       =   0   'False
                  italic          =   0   'False
                  strikethrough   =   0   'False
               EndProperty
               Height          =   300
               Left            =   1560
               TabIndex        =   138
               Top             =   1920
               Width           =   1095
            End
            Begin VB.CommandButton btnAjouterSujetDanger 
               Caption         =   "Ajouter/Modifier"
               BeginProperty Font 
                  name            =   "MS Sans Serif"
                  charset         =   1
                  weight          =   400
                  size            =   8.25
                  underline       =   0   'False
                  italic          =   0   'False
                  strikethrough   =   0   'False
               EndProperty
               Height          =   300
               Left            =   0
               TabIndex        =   137
               Top             =   1920
               Width           =   1455
            End
            Begin FPSpread.vaSpread SpreadSujetsDangers 
               Height          =   1635
               Left            =   0
               TabIndex        =   131
               Top             =   255
               Width           =   6435
               _version        =   131077
               _extentx        =   11351
               _extenty        =   2884
               _stockprops     =   64
               allowdragdrop   =   -1  'True
               allowmultiblocks=   -1  'True
               allowuserformulas=   -1  'True
               colheaderdisplay=   0
               colsfrozen      =   1
               displayrowheaders=   0   'False
               BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
                  name            =   "MS Sans Serif"
                  charset         =   1
                  weight          =   400
                  size            =   8.25
                  underline       =   0   'False
                  italic          =   0   'False
                  strikethrough   =   0   'False
               EndProperty
               maxcols         =   9
               maxrows         =   1
               processtab      =   -1  'True
               scrollbarextmode=   -1  'True
               scrollbarshowmax=   0   'False
               spreaddesigner  =   "HACCHILD.frx":4631
               unittype        =   2
               visiblecols     =   9
               visiblerows     =   1
            End
            Begin VB.Label lblTitreSujetDanger 
               Caption         =   "Evaluation de la &criticité"
               BeginProperty Font 
                  name            =   "MS Sans Serif"
                  charset         =   1
                  weight          =   400
                  size            =   8.25
                  underline       =   0   'False
                  italic          =   0   'False
                  strikethrough   =   0   'False
               EndProperty
               Height          =   240
               Left            =   0
               TabIndex        =   132
               Top             =   30
               Width           =   6435
            End
         End
         Begin VB.Line LineSep 
            Index           =   5
            X1              =   60
            X2              =   6270
            Y1              =   495
            Y2              =   495
         End
         Begin VB.Label lblCommentaire 
            Caption         =   "Label1"
            BeginProperty Font 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   435
            Index           =   5
            Left            =   600
            TabIndex        =   82
            Top             =   0
            Width           =   4935
         End
      End
   End
End
Attribute VB_Name = "FormChildModel"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'projet associé à la feuille (référence à un objet de la collection Projets)
Public Projet As Projet
Public CléProjet As String

'niveaux de la première donnée modifiable dans les onglets Etapes et Sujets,
'Dispositions actuelles et Arbre HACCP
Const PREMIER_NIVEAU_ETAPES_ET_SUJETS = 1
Const PREMIER_NIVEAU_DISPOSITIONS = 5
Const PREMIER_NIVEAU_ARBRE_HACCP = 4

'index maximum des contrôles de niveau de données dans les onglets
'comportant des arbres
Const INDEX_MAX_ETAPES_ET_SUJETS = 1
Const INDEX_MAX_DISPOSITIONS = 5
Const INDEX_MAX_ARBRE_HACCP = 6

Dim ctls(0 To 6) As Control

'chaine d'identification d'une Donnée HACCP dans le clipboard
Const IDENTIFICATION_CLIPBOARD = "Donnée HACCP"

Private Function ArbreIncomplet(ByVal Element As Donnee, ByVal Niveau As Integer, Message As String)

Dim i As Integer
Dim cr As Integer
Dim chMessageOut As String

    If Niveau = NIVEAU_ENREGISTREMENT Then
        ArbreIncomplet = False
        Exit Function
    End If

    If Element.EnfantsCount = 0 Then
        ArbreIncomplet = True
        'Message = chMessageOut
        Exit Function
    End If
    For i = 1 To Element.EnfantsCount
        chMessageOut = Message & Module.Niveau(Niveau + 1) & " '" & Element.Enfant(i).Titre & "'" & vbCrLf
        cr = ArbreIncomplet(Element.Enfant(i), Niveau + 1, chMessageOut)
        If cr Then
            ArbreIncomplet = True
            Message = chMessageOut
            Exit Function
        End If
    Next
    ArbreIncomplet = False

End Function

Public Sub ContrôlerCohérence()

Dim i As Integer
Dim j As Integer
Dim k As Integer
Dim m As Integer
Dim n As Integer
Dim Niveau As Integer
Dim p As Integer
Dim Etape As Donnee
Dim Sujet As Donnee
Dim SujetDanger As SujetDanger
Dim PointAMaitriser As Donnee
Dim MesurePréventive As Donnee
Dim Donnée As Donnee
Dim bTrouvéPointAMaitriserCritique As Integer
Dim bTrouvéMesurePréventiveCritique As Integer
Dim bTrouvéSujetDangerAvecAnalyseCriticité As Integer
Dim chMessage As String
Dim chFinMessage As String

    HourGlass "Show"

    'contrôle des points suivants:
    '- un danger non pertinent ou de pertinence non évaluée ne doit pas avoir de sujets/danger
    '- danger critique sans au moins un point à maitriser critique
    '- point à maitriser critique sans au moins une mesure préventive critique
    '- mesure préventive critique pour un point à maitriser non critique
    '- point à maitriser critique rattaché à un danger non critique
    '- mesure préventive critique avec arborescence incomplète
    For i = 1 To Projet.EtapesCount
        Set Etape = Projet.Etape(i)
        For j = 1 To Etape.EnfantsCount
            Set Sujet = Etape.Enfant(j)
            For k = 1 To Projet.SujetsDangersCount
                Set SujetDanger = Projet.SujetDanger(k)
                If Not SujetDanger.Effacé And SujetDanger.Sujet = Sujet.id Then
                    'un danger non pertinent ou de pertinence non évaluée ne doit pas avoir de sujets/danger
                    If Projet.Danger(SujetDanger.Danger).Pertinence <> "OUI" Then
                        chMessage = Module.Niveau(NIVEAU_ETAPE) & " '" & Etape.Titre & "'" & vbCrLf
                        chMessage = chMessage & Module.Niveau(NIVEAU_SUJET) & " '" & Sujet.Titre & "'" & vbCrLf
                        chMessage = chMessage & Module.Niveau(NIVEAU_SUJET_DANGER) & " '" & SujetDanger.Nom & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")'" & CrLf2
                        chMessage = chMessage & InsereChaine(InsereChaine(GetChaineCrLf("M29"), Module.Niveau(NIVEAU_SUJET_DANGER)), SujetDanger.Nom & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")'")
                        MsgBoxOkHelp chMessage, MB_ICONEXCLAMATION, "Contrôle de cohérence", FichierAideProgramme, 80, FichierAideHACCP, 80
                        HourGlass "hide"
                        Exit Sub
                    End If
                    If SujetDanger.Criticité = "OUI" Then
                        'danger critique sans au moins un point à maitriser critique
                        bTrouvéPointAMaitriserCritique = False
                        For m = 1 To SujetDanger.EnfantsCount
                            Set PointAMaitriser = SujetDanger.Enfant(m)
                            If PointAMaitriser.Criticité = "OUI" Then
                                'point à maitriser critique sans au moins une mesure préventive critique
                                bTrouvéMesurePréventiveCritique = False
                                For n = 1 To PointAMaitriser.EnfantsCount
                                    Set MesurePréventive = PointAMaitriser.Enfant(n)
                                    If MesurePréventive.Criticité = "OUI" Then
                                        Niveau = NIVEAU_MESURE_PREVENTIVE
                                        chFinMessage = ""
                                        If ArbreIncomplet(MesurePréventive, Niveau, chFinMessage) Then
                                            chMessage = Module.Niveau(NIVEAU_ETAPE) & " '" & Etape.Titre & "'" & vbCrLf
                                            chMessage = chMessage & Module.Niveau(NIVEAU_SUJET) & " '" & Sujet.Titre & "'" & vbCrLf
                                            chMessage = chMessage & Module.Niveau(NIVEAU_SUJET_DANGER) & " '" & SujetDanger.Nom & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")'" & vbCrLf
                                            chMessage = chMessage & Module.Niveau(NIVEAU_POINT_A_MAITRISER) & " '" & PointAMaitriser.Titre & "'" & vbCrLf
                                            chMessage = chMessage & Module.Niveau(NIVEAU_MESURE_PREVENTIVE) & " '" & MesurePréventive.Titre & "'" & vbCrLf
                                            chMessage = chMessage & chFinMessage & vbCrLf
                                            chMessage = chMessage & InsereChaine(InsereChaine(GetChaineCrLf("M10"), Module.Niveau(NIVEAU_MESURE_PREVENTIVE)), MesurePréventive.Titre)
                                            MsgBoxOkHelp chMessage, MB_ICONEXCLAMATION, "Contrôle de cohérence", FichierAideProgramme, 80, FichierAideHACCP, 80
                                            HourGlass "hide"
                                            Exit Sub
                                        End If
                                        bTrouvéMesurePréventiveCritique = True
                                        'Exit For
                                    End If
                                Next
                                If Not bTrouvéMesurePréventiveCritique Then
                                    chMessage = Module.Niveau(NIVEAU_ETAPE) & " '" & Etape.Titre & "'" & vbCrLf
                                    chMessage = chMessage & Module.Niveau(NIVEAU_SUJET) & " '" & Sujet.Titre & "'" & vbCrLf
                                    chMessage = chMessage & Module.Niveau(NIVEAU_SUJET_DANGER) & " '" & SujetDanger.Nom & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")'" & vbCrLf
                                    chMessage = chMessage & Module.Niveau(NIVEAU_POINT_A_MAITRISER) & " '" & PointAMaitriser.Titre & "'" & CrLf2
                                    chMessage = chMessage & InsereChaine(InsereChaine(InsereChaine(GetChaineCrLf("M8"), Module.Niveau(NIVEAU_POINT_A_MAITRISER)), PointAMaitriser.Titre), Module.Niveau(NIVEAU_MESURE_PREVENTIVE))
                                    MsgBoxOkHelp chMessage, MB_ICONEXCLAMATION, "Contrôle de cohérence", FichierAideProgramme, 80, FichierAideHACCP, 80
                                    HourGlass "hide"
                                    Exit Sub
                                End If
                                bTrouvéPointAMaitriserCritique = True
                            Else
                                'mesure préventive critique pour un point à maitriser non critique
                                bTrouvéMesurePréventiveCritique = False
                                For n = 1 To PointAMaitriser.EnfantsCount
                                    If PointAMaitriser.Enfant(n).Criticité = "OUI" Then
                                        bTrouvéMesurePréventiveCritique = True
                                        Exit For
                                    End If
                                Next
                                If bTrouvéMesurePréventiveCritique Then
                                    chMessage = Module.Niveau(NIVEAU_ETAPE) & " '" & Etape.Titre & "'" & vbCrLf
                                    chMessage = chMessage & Module.Niveau(NIVEAU_SUJET) & " '" & Sujet.Titre & "'" & vbCrLf
                                    chMessage = chMessage & Module.Niveau(NIVEAU_SUJET_DANGER) & " '" & SujetDanger.Nom & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")'" & vbCrLf
                                    chMessage = chMessage & Module.Niveau(NIVEAU_POINT_A_MAITRISER) & " '" & PointAMaitriser.Titre & "'" & CrLf2
                                    chMessage = chMessage & InsereChaine(InsereChaine(InsereChaine(InsereChaine(GetChaineCrLf("M9"), Module.Niveau(NIVEAU_MESURE_PREVENTIVE)), PointAMaitriser.Enfant(n).Titre), Module.Niveau(NIVEAU_POINT_A_MAITRISER)), PointAMaitriser.Titre)
                                    MsgBoxOkHelp chMessage, MB_ICONEXCLAMATION, "Contrôle de cohérence", FichierAideProgramme, 80, FichierAideHACCP, 80
                                    HourGlass "hide"
                                    Exit Sub
                                End If
                            End If
                        Next
                        If Not bTrouvéPointAMaitriserCritique Then
                            chMessage = Module.Niveau(NIVEAU_ETAPE) & " '" & Etape.Titre & "'" & vbCrLf
                            chMessage = chMessage & Module.Niveau(NIVEAU_SUJET) & " '" & Sujet.Titre & "'" & vbCrLf
                            chMessage = chMessage & Module.Niveau(NIVEAU_SUJET_DANGER) & " '" & SujetDanger.Nom & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")'" & CrLf2
                            chMessage = chMessage & InsereChaine(InsereChaine(InsereChaine(GetChaineCrLf("M8"), Module.Niveau(NIVEAU_SUJET_DANGER)), SujetDanger.Nom & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")'"), Module.Niveau(NIVEAU_POINT_A_MAITRISER))
                            MsgBoxOkHelp chMessage, MB_ICONEXCLAMATION, "Contrôle de cohérence", FichierAideProgramme, 80, FichierAideHACCP, 80
                            HourGlass "hide"
                            Exit Sub
                        End If
                    Else
                        'point à maitriser critique rattaché à un danger non critique
                        bTrouvéPointAMaitriserCritique = False
                        For m = 1 To SujetDanger.EnfantsCount
                            Set PointAMaitriser = SujetDanger.Enfant(m)
                            If PointAMaitriser.Criticité = "OUI" Then
                                bTrouvéPointAMaitriserCritique = True
                                Exit For
                            Else
                                'mesure préventive critique pour un point à maitriser non critique
                                bTrouvéMesurePréventiveCritique = False
                                For n = 1 To PointAMaitriser.EnfantsCount
                                    If PointAMaitriser.Enfant(n).Criticité = "OUI" Then
                                        bTrouvéMesurePréventiveCritique = True
                                        Exit For
                                    End If
                                Next
                                If bTrouvéMesurePréventiveCritique Then
                                    chMessage = Module.Niveau(NIVEAU_ETAPE) & " '" & Etape.Titre & "'" & vbCrLf
                                    chMessage = chMessage & Module.Niveau(NIVEAU_SUJET) & " '" & Sujet.Titre & "'" & vbCrLf
                                    chMessage = chMessage & Module.Niveau(NIVEAU_SUJET_DANGER) & " '" & SujetDanger.Nom & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")'" & vbCrLf
                                    chMessage = chMessage & Module.Niveau(NIVEAU_POINT_A_MAITRISER) & " '" & PointAMaitriser.Titre & "'" & CrLf2
                                    chMessage = chMessage & InsereChaine(InsereChaine(InsereChaine(InsereChaine(GetChaineCrLf("M9"), Module.Niveau(NIVEAU_MESURE_PREVENTIVE)), PointAMaitriser.Enfant(n).Titre), Module.Niveau(NIVEAU_POINT_A_MAITRISER)), PointAMaitriser.Titre)
                                    MsgBoxOkHelp chMessage, MB_ICONEXCLAMATION, "Contrôle de cohérence", FichierAideProgramme, 80, FichierAideHACCP, 80
                                    HourGlass "hide"
                                    Exit Sub
                                End If
                            End If
                        Next
                        If bTrouvéPointAMaitriserCritique Then
                            chMessage = Module.Niveau(NIVEAU_ETAPE) & " '" & Etape.Titre & "'" & vbCrLf
                            chMessage = chMessage & Module.Niveau(NIVEAU_SUJET) & " '" & Sujet.Titre & "'" & vbCrLf
                            chMessage = chMessage & Module.Niveau(NIVEAU_SUJET_DANGER) & " '" & SujetDanger.Nom & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")'" & CrLf2
                            chMessage = chMessage & InsereChaine(InsereChaine(InsereChaine(InsereChaine(GetChaineCrLf("M9"), Module.Niveau(NIVEAU_POINT_A_MAITRISER)), SujetDanger.Enfant(m).Titre), Module.Niveau(NIVEAU_SUJET_DANGER)), SujetDanger.Nom & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")'")
                            MsgBoxOkHelp chMessage, MB_ICONEXCLAMATION, "Contrôle de cohérence", FichierAideProgramme, 80, FichierAideHACCP, 80
                            HourGlass "hide"
                            Exit Sub
                        End If
                    End If
                End If
            Next
        Next
    Next
    
    'recherche les sujet/dangers sans analyse de criticité à aucune étape issus de
    'dangers pertinents
    For i = 1 To Projet.SujetsDangersCount
        If Not Projet.SujetDanger(i).Effacé And Projet.SujetDanger(i).Criticité = "" And Projet.Danger(Projet.SujetDanger(i).Danger).Pertinence = "OUI" Then
            chMessage = Module.Niveau(NIVEAU_ETAPE) & " '" & Projet.Etape(Projet.SujetDanger(i).Etape).Titre & "'" & vbCrLf
            chMessage = chMessage & Module.Niveau(NIVEAU_SUJET) & " '" & Projet.Etape(Projet.SujetDanger(i).Etape).Enfant(Projet.SujetDanger(i).Sujet).Titre & "'" & vbCrLf
            chMessage = chMessage & "Nature '" & Projet.Danger(Projet.SujetDanger(i).Danger).Nature & "'" & vbCrLf
            chMessage = chMessage & "Spécificité '" & Projet.Danger(Projet.SujetDanger(i).Danger).Spécificité & "'" & CrLf2
            chMessage = chMessage & InsereChaine(InsereChaine(GetChaineCrLf("M11"), Module.Niveau(NIVEAU_SUJET_DANGER)), Projet.SujetDanger(i).Nom & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")")
            MsgBoxOkHelp chMessage, MB_ICONEXCLAMATION, "Contrôle de cohérence", FichierAideProgramme, 80, FichierAideHACCP, 80
            HourGlass "hide"
            Exit Sub
        End If
    Next
    
    
    HourGlass "hide"
    MsgBox InsereChaine(GetChaineCrLf("M4"), IIf(Projet.Titre = "", Tag, Projet.Titre)), MB_ICONINFORMATION, "Contrôle de cohérence", FichierAideProgramme, 80

End Sub




Private Function DonnéeDansClipboard(ByVal IndexAff As Integer, ByVal Index As Integer) As Integer

Dim Niveau As Integer
Dim Affichage
Dim chTexte As String

    DonnéeDansClipboard = False
    If Clipboard.GetFormat(vbCFText) Then
        'la donnée du clipboard est du texte ascii
        chTexte = Clipboard.GetText(vbCFText)
        If Left$(chTexte, Len(IDENTIFICATION_CLIPBOARD)) = IDENTIFICATION_CLIPBOARD Then
            'la donnée du clipboard est une donnée HACCP
            Affichage = GetItemDansChaineSep(GetItemDansChaineSep(chTexte, 1, vbCrLf), 2, Sep)
            Niveau = GetItemDansChaineSep(GetItemDansChaineSep(chTexte, 1, vbCrLf), 3, Sep)
            If Niveau = Index And Niveau >= Projet.NiveauMaxiCopie Then
                'le niveau de collage est inférieur au niveau de copie autorisé
                DonnéeDansClipboard = True
            End If
        End If
    End If

End Function

Sub FocusMémo(ByVal indextab As Integer)

    On Error Resume Next
    ctls(indextab).SetFocus
    On Error GoTo 0
    
End Sub

Private Function GetParentDansExistant(ByVal Niveau As Integer, ByVal Etape As Donnee, ByVal Sujet As Donnee) As Donnee

Dim Donnée As Object
Dim i As Integer
Dim Titre As String
Dim j As Integer
Dim n As Integer
Dim bTrouvé As Integer

    Set GetParentDansExistant = Nothing
    
#If 0 Then
    'cas où l'étape n'est pas dans les dispositions en place
    n = Projet.EtapesCount
    Titre = UCase$(Etape.Titre)
    bTrouvé = False
    For i = 1 To n
        If Titre = UCase$(Projet.EtapeTitre(i)) Then
            bTrouvé = True
            Exit For
        End If
    Next
    If Not bTrouvée Then
        Exit Function
    End If

    'cas où le sujet n'est pas dans les dispositions en place
    n = Projet.EtapesCount
    Titre = UCase$(Etape.Titre)
    bTrouvé = False
    For i = 1 To n
        If Titre = UCase$(Projet.EtapeTitre(i)) Then
            bTrouvé = True
            Exit For
        End If
    Next
    If Not bTrouvée Then
        Exit Function
    End If
#End If


    'met dans Donnée la donnée parent de la donnée cliquée
    Set Donnée = Sujet
    For i = 1 To Niveau - PREMIER_NIVEAU_DISPOSITIONS
        Titre = UCase$(A_lstDonnees(i))
        For j = 1 To Donnée.EnfantsCount
            If UCase$(Donnée.EnfantTitre(j)) = Titre Then
                Set Donnée = Donnée.Enfant(Donnée.EnfantId(j))
                Exit For
            End If
        Next
        If j > Donnée.EnfantsCount Then
            Exit Function
        End If
    Next
    Set GetParentDansExistant = Donnée

End Function

Sub KeyDownTextBox(ctl As Control, ByVal KeyCode As Integer, ByVal Element As String)

    Select Case KeyCode
        Case KEY_DEL
            'automatique
            If ctl.Tag <> "" Then
                ProgAnnulationFrappeTextBox Tag, ctl, ctl.Text, Element
                'marque le champ comme 'modifié' (pour le Undo)
                ctl.Tag = "1"
            Else
                ProgAnnulationDeleteTextBox Tag, ctl, ctl.Text, Element
                ctl.Tag = "1"
            End If
        Case KEY_CUT
            'appel de keydowntextbox pour exécution immédiate (sans DoEvents)
            KeyDownTextBox ctl, KEY_COPY, Element
            'sendkeys parceque VB effectue le delete
            SendKeys STRING_SENDKEYS_DELETE
        Case KEY_COPY
            If ctl.SelLength > 0 Then
                Clipboard.SetText Mid$(ctl.Text, ctl.SelStart + 1, ctl.SelLength), vbCFText
            End If
        Case KEY_PASTE
            Dim ch As String
            ch = Clipboard.GetText(vbCFText)
            On Error Resume Next
            While ch <> ""
                If Left$(ch, 1) = vbCr Then
                    SendKeys "{ENTER}"
                    ch = suppfirstchar(ch, 2)
                Else
                    SendKeys Left$(ch, 1)
                    ch = suppfirstchar(ch, 1)
                End If
            Wend
    End Select
    CouperCopierCollerEffacer Projet.Modifiable, ctl.SelLength > 0, ctl.SelLength > 0, Clipboard.GetFormat(vbCFText), ctl.SelLength > 0
    
End Sub

Sub MémoFocus(ctl As Control, ByVal indextab As Integer)

    Set ctls(indextab) = ctl
    
End Sub

Public Sub RefreshBoutonsDangers()

    SpreadDangers.Col = 1
    SpreadDangers.Row = SpreadDangers.ActiveRow
    SpreadSujetsDangers.Col = 1
    SpreadSujetsDangers.Row = SpreadSujetsDangers.ActiveRow
    
    btnAjouterDanger.Caption = "&Ajouter/Modifier" 'IIf(SpreadDangers.Text = "", "&Ajouter", "&Modifier")
    btnAjouterDanger.Enabled = Projet.Modifiable
    btnInsérerDanger.Enabled = Projet.Modifiable
    btnSupprimerDanger.Enabled = SpreadDangers.MaxRows > 1 And Projet.Modifiable
    
    btnAjouterSujetDanger.Caption = "&Ajouter/Modifier" 'IIf(SpreadSujetsDangers.Text = "", "&Ajouter", "&Modifier")
    btnAjouterSujetDanger.Enabled = Projet.DangersCount > 0 And SpreadDangers.Text <> "" And Projet.Modifiable
    btnInsérerSujetDanger.Enabled = btnAjouterSujetDanger.Enabled
    btnSupprimerSujetDanger.Enabled = SpreadSujetsDangers.MaxRows > 1 And Projet.Modifiable
    
End Sub

Public Sub RefreshBoutonsDocumentation()

    btnAjouterDocumentation.Enabled = Projet.Modifiable
    btnInsérerDocumentation.Enabled = Projet.Modifiable
    btnSupprimerDocumentation.Enabled = SpreadDocumentation.MaxRows > 1 And Projet.Modifiable
    
End Sub


Sub RefreshDangers()

Dim i As Integer
Dim j As Integer
Dim n As Integer
Dim Row As Integer

    With SpreadDangers
        Row = .ActiveRow
        .MaxRows = Projet.DangersCount + 1
        .Row = 1
        .Row2 = .MaxRows
        .Col = 1
        .Col2 = .MaxCols - 1
        .BlockMode = True
        .Action = SS_ACTION_CLEAR_TEXT
        .BlockMode = False
        .Col = 1
        n = Projet.DangersCount
        For i = 1 To n
            .Row = i
            .Col = 1
            .Text = Projet.Danger(i).id
            .Col = 2
            .Text = Projet.Danger(i).Nature
            .Col = 3
            .Text = Projet.Danger(i).Spécificité
            .Col = 4
            .Text = Projet.Danger(i).Pertinence
            .Col = 5
            .Lock = Projet.Danger(i).DocumentsCount = 0
            .Text = IIf(Projet.Danger(i).DocumentsCount = 0, "", "1")
            If .Lock Then
                .TypeButtonPicture = LoadPicture("")
                .TypeButtonPictureDown = LoadPicture("")
            Else
                .TypeButtonPicture = picFleche.Picture
                .TypeButtonPictureDown = picFleche.Picture
            End If
        Next
        'refresh du spread des sujets/dangers du dangers
        .Row = Row
        .Col = 1
        'If .Text = "" Then
        '    .Row = 1
        '    .Action = SS_ACTION_ACTIVE_CELL
        'End If
        RefreshSujetsDangers .Text
    End With
    RefreshBoutonsDangers
    
End Sub

Sub RefreshParamètres()
    txtTitre = Projet.Titre
    txtAuteur = Projet.Auteur
    txtRéférence = Projet.Référence
    txtCommentaire = Projet.Commentaire
    lblDateModification.Caption = Projet.DateModification
    lblDateCréation.Caption = Projet.DateCréation
End Sub


Sub RefreshSujetsDangers(ByVal idDanger As String)

Dim i As Integer
Dim j As Integer
Dim k As Integer
Dim n As Integer
Dim SujetDanger As SujetDanger
Dim Etape As Donnee
Dim Sujet As Donnee
Dim Danger As Danger
    
    With SpreadSujetsDangers
        .MaxRows = Projet.SujetsDangersCount + 1
        .Row = 1
        .Row2 = .MaxRows
        .Col = 1
        .Col2 = .MaxCols - 1
        .BlockMode = True
        .Action = SS_ACTION_CLEAR_TEXT
        .BlockMode = False
        .Col = 1
        k = Projet.SujetsDangersCount
        n = 0
        For i = 1 To k
            Set SujetDanger = Projet.SujetDanger(i)
            If Not SujetDanger.Effacé Then
                Set Danger = Projet.Danger(SujetDanger.Danger)
                If idDanger = Danger.id Then
                    On Error Resume Next
                    Set Etape = Projet.Etape(SujetDanger.Etape)
                    If Err Then
                        If Err = 5 Then
                            GoTo fin_for
                        End If
                    End If
                    Set Sujet = Etape.Enfant(SujetDanger.Sujet)
                    If Err Then
                        If Err = 5 Then
                            GoTo fin_for
                        End If
                    End If
                    n = n + 1
                    .Row = n
                    .Col = 1
                    .Text = SujetDanger.id
                    .Col = 2
                    .Text = Etape.Titre
                    .Col = 3
                    .Text = Sujet.Titre
                    .Col = 4
                    .Text = Danger.Nature
                    .Col = 5
                    .Text = Danger.Spécificité
                    .Col = 6
                    .Text = SujetDanger.Nom
                    .Col = 7
                    .Text = SujetDanger.Commentaire
                    .Col = 8
                    .Text = SujetDanger.Criticité
                    .Col = 9
                    .Lock = SujetDanger.DocumentsCount = 0
                    .Text = IIf(SujetDanger.DocumentsCount = 0, "", "1")
                    If .Lock Then
                        .TypeButtonPicture = LoadPicture("")
                        .TypeButtonPictureDown = LoadPicture("")
                    Else
                        .TypeButtonPicture = picFleche.Picture
                        .TypeButtonPictureDown = picFleche.Picture
                    End If
fin_for:
                End If
            End If
            On Error GoTo 0
        Next
        'diminue le nombre de lignes au nombre de sujet/danger du danger concerné
        .MaxRows = n + 1
    End With
    
End Sub


Public Sub RefreshDispositionsActuelles()

    RefreshListeEtapes lstEtapes(INDEX_AFF_DISPOSITIONS)
    RefreshBoutonsDispositionsActuelles
    
End Sub


Public Sub RefreshArbreHACCP()

    RefreshListeEtapes lstEtapes(INDEX_AFF_ARBRE)
    RefreshBoutonsArbreHACCP
    
End Sub


Sub ResizeArbreEtapesSujets(ByVal IndexMin As Integer, ByVal IndexMax As Integer, ctlPanel As Control)

Dim nbNiveaux As Integer
Dim HauteurNiveau As Integer
Dim i As Integer
Dim Y As Integer
Dim LargeurNiveau As Integer

    nbNiveaux = IndexMax - IndexMin + 1
    HauteurNiveau = (ctlPanel.Height - E_lblNomNiveau(IndexMin).Top) / nbNiveaux
    LargeurNiveau = (ctlPanel.Width - E_lstDonnees(i).Left - (E_btnAjouterDonnee(i).Width + gap2)) / 2
    For i = IndexMin To IndexMax
        Y = E_lblNomNiveau(0).Top + (i - IndexMin) * HauteurNiveau
        'height
        E_lstDonnees(i).Height = maxi(0, HauteurNiveau - gap)
        E_txtDonnee(i).Height = maxi(0, E_lstDonnees(i).Height)
        E_lblNomNiveau(i).Height = maxi(0, E_lstDonnees(i).Height / 10 * 9)
        'E_btnAjouterDonnee(i).Height = 615, (E_txtDonnee(i).Height - gap) / 2)
        'E_btnDocuments(i).Height = 615
        'top
        E_lblNomNiveau(i).Top = Y
        E_lstDonnees(i).Top = Y
        E_txtDonnee(i).Top = Y
        E_btnAjouterDonnee(i).Top = Y
        'E_btnDocuments(i).Top = E_btnAjouterDonnee(i).Top + E_btnAjouterDonnee(i).Height + gap
        'width
        E_lstDonnees(i).Width = maxi(0, LargeurNiveau - gap)
        E_txtDonnee(i).Width = maxi(0, LargeurNiveau - gap)
        E_lblNomNiveau(i).Width = E_lblNomNiveau(IndexMin).Width - (i - IndexMin) * gap
        'left
        E_txtDonnee(i).Left = maxi(E_lstDonnees(i).Left + LargeurNiveau, E_lstDonnees(i).Left)
        E_btnAjouterDonnee(i).Left = maxi(E_txtDonnee(i).Left + LargeurNiveau, E_txtDonnee(i).Left)
        E_btnDocuments(i).Left = maxi(E_btnAjouterDonnee(i).Left, E_txtDonnee(i).Left)
        E_lblNomNiveau(i).Left = (i - IndexMin) * gap
        're-height
        E_btnAjouterDonnee(i).Height = mini(270, (E_txtDonnee(i).Height) / 2)
        E_btnDocuments(i).Height = mini(270, (E_txtDonnee(i).Height) / 2)
        're-top
        E_btnDocuments(i).Top = E_btnAjouterDonnee(i).Top + E_btnAjouterDonnee(i).Height - gap * (E_txtDonnee(i).Height > 2 * E_btnDocuments(i).Height + gap)
        'lignes
        If i > IndexMin Then
            E_Line(i).X1 = E_lblNomNiveau(i).Left
            E_Line(i).Y1 = E_lblNomNiveau(i - 1).Top + E_lblNomNiveau(i - 1).Height
            E_Line(i).X2 = E_Line(i).X1
            E_Line(i).Y2 = E_lblNomNiveau(i).Top
        End If
    Next
    

End Sub

Sub ResizeArbreDispositions(ByVal IndexMin As Integer, ByVal IndexMax As Integer, ctlPanel As Control)

Dim nbNiveaux As Integer
Dim HauteurNiveau As Integer
Dim i As Integer
Dim Y As Integer
Dim LargeurNiveau As Integer

    nbNiveaux = IndexMax - IndexMin + 1
    HauteurNiveau = (ctlPanel.Height - D_lblNomNiveau(IndexMin).Top) / nbNiveaux
    LargeurNiveau = (ctlPanel.Width - D_lstDonnees(i).Left - (D_btnAjouterDonnee(i).Width + gap)) / 2
    For i = IndexMin To IndexMax
        Y = D_lblNomNiveau(0).Top + (i - IndexMin) * HauteurNiveau
        'height
        D_lstDonnees(i).Height = maxi(0, HauteurNiveau - gap)
        D_txtDonnee(i).Height = maxi(0, D_lstDonnees(i).Height)
        D_lblNomNiveau(i).Height = maxi(0, D_lstDonnees(i).Height / 10 * 9)
        'D_btnAjouterDonnee(i).Height = 615, (D_txtDonnee(i).Height - gap) / 2)
        'D_btnDocuments(i).Height = 615
        'top
        D_lblNomNiveau(i).Top = Y
        D_lstDonnees(i).Top = Y
        D_txtDonnee(i).Top = Y
        D_btnAjouterDonnee(i).Top = Y
        'D_btnDocuments(i).Top = D_btnAjouterDonnee(i).Top + D_btnAjouterDonnee(i).Height + gap
        'width
        D_lstDonnees(i).Width = maxi(0, LargeurNiveau - gap)
        D_txtDonnee(i).Width = maxi(0, LargeurNiveau - gap)
        D_lblNomNiveau(i).Width = D_lblNomNiveau(IndexMin).Width - (i - IndexMin) * gap
        'left
        D_txtDonnee(i).Left = maxi(D_lstDonnees(i).Left + LargeurNiveau, D_lstDonnees(i).Left)
        D_btnAjouterDonnee(i).Left = maxi(D_txtDonnee(i).Left + LargeurNiveau, D_txtDonnee(i).Left)
        D_btnDocuments(i).Left = maxi(D_btnAjouterDonnee(i).Left, D_txtDonnee(i).Left)
        D_lblNomNiveau(i).Left = (i - IndexMin) * gap
        're-height
        D_btnAjouterDonnee(i).Height = mini(270, (D_txtDonnee(i).Height) / 2)
        D_btnDocuments(i).Height = mini(270, (D_txtDonnee(i).Height) / 2)
        're-top
        D_btnDocuments(i).Top = D_btnAjouterDonnee(i).Top + D_btnAjouterDonnee(i).Height - gap * (D_txtDonnee(i).Height > 2 * D_btnDocuments(i).Height + gap)
        'lignes
        If i > IndexMin Then
            D_Line(i).X1 = D_lblNomNiveau(i).Left
            D_Line(i).Y1 = D_lblNomNiveau(i - 1).Top + D_lblNomNiveau(i - 1).Height
            D_Line(i).X2 = D_Line(i).X1
            D_Line(i).Y2 = D_lblNomNiveau(i).Top
        End If
    Next
    

End Sub


Sub ResizeArbreHACCP(ByVal IndexMin As Integer, ByVal IndexMax As Integer, ctlPanel As Control)

Dim nbNiveaux As Integer
Dim HauteurNiveau As Integer
Dim i As Integer
Dim Y As Integer
Dim LargeurNiveau As Integer

    nbNiveaux = IndexMax - IndexMin + 1
    HauteurNiveau = (ctlPanel.Height - A_lblNomNiveau(IndexMin).Top) / nbNiveaux
    LargeurNiveau = (ctlPanel.Width - A_lstDonnees(i).Left - (A_btnAjouterDonnee(i).Width + gap)) / 2
    For i = IndexMin To IndexMax
        Y = A_lblNomNiveau(0).Top + (i - IndexMin) * HauteurNiveau
        'height
        A_lstDonnees(i).Height = maxi(0, HauteurNiveau)
        A_txtDonnee(i).Height = maxi(0, A_lstDonnees(i).Height)
        A_lblNomNiveau(i).Height = maxi(0, A_lstDonnees(i).Height / 10 * 9)
        'A_btnAjouterDonnee(i).Height = 615, (A_txtDonnee(i).Height - gap) / 2)
        'A_btnDocuments(i).Height = 615
        'top
        A_lblNomNiveau(i).Top = Y
        A_lstDonnees(i).Top = Y
        A_txtDonnee(i).Top = Y
        A_btnAjouterDonnee(i).Top = Y
        'A_btnDocuments(i).Top = A_btnAjouterDonnee(i).Top + A_btnAjouterDonnee(i).Height + gap
        'width
        A_lstDonnees(i).Width = maxi(0, LargeurNiveau - gap)
        A_txtDonnee(i).Width = maxi(0, LargeurNiveau - gap)
        A_lblNomNiveau(i).Width = A_lblNomNiveau(IndexMin).Width - (i - IndexMin) * gap
        'left
        A_txtDonnee(i).Left = maxi(A_lstDonnees(i).Left + LargeurNiveau, A_lstDonnees(i).Left)
        A_btnAjouterDonnee(i).Left = maxi(A_txtDonnee(i).Left + LargeurNiveau, A_txtDonnee(i).Left)
        If A_btnAjouterDonnee(i).Left < 7000 Then
'            MsgBox "left du bouton <6000"
        End If
        A_btnDocuments(i).Left = maxi(A_btnAjouterDonnee(i).Left, A_txtDonnee(i).Left)
        A_lblNomNiveau(i).Left = (i - IndexMin) * gap
        're-height
        A_btnAjouterDonnee(i).Height = mini(270, (A_txtDonnee(i).Height) / 2)
        A_btnDocuments(i).Height = mini(270, (A_txtDonnee(i).Height) / 2)
        're-top
        A_btnDocuments(i).Top = A_btnAjouterDonnee(i).Top + A_btnAjouterDonnee(i).Height - gap * (A_txtDonnee(i).Height > 2 * A_btnDocuments(i).Height + gap)
        'lignes
        If i > IndexMin Then
            A_Line(i).X1 = A_lblNomNiveau(i).Left
            A_Line(i).Y1 = A_lblNomNiveau(i - 1).Top + A_lblNomNiveau(i - 1).Height
            A_Line(i).X2 = A_Line(i).X1
            A_Line(i).Y2 = A_lblNomNiveau(i).Top
        End If
    Next
    

End Sub


Public Function SujetDangerEnCours() As SujetDanger

Dim idSujetDanger As Long

    idSujetDanger = lstSujetsDangers(INDEX_AFF_ARBRE).ItemData(lstSujetsDangers(INDEX_AFF_ARBRE).ListIndex)
    Set SujetDangerEnCours = Projet.SujetDanger("D" & idSujetDanger)
    
End Function

Private Sub TransfertDocumentationDansProjet()

Dim Fichier As String
Dim i As Integer

    Projet.DocumentsClear
    With SpreadDocumentation
        For i = 1 To .MaxRows
            .Row = i
            .Col = 1
            Fichier = Trim$(.Text)
            If Fichier <> "" Then
                .Col = 3
                Projet.AddDocument Fichier, .Text
            End If
        Next
    End With
    
End Sub

Private Sub TransfertDangersDansProjet()

Dim i As Integer
Dim Dangers As New Collection 'collection de type Dangers
Dim Danger As Danger

    'on reconstruit une collection de dangers en prenant les informations contenues
    'dans le SpreadDangers et les documents associés à chaque danger dans la collection
    'de dangers du projet
    With SpreadDangers
        For i = 1 To .MaxRows
            .Row = i
            .Col = 1
            If .Text <> "" Then
                Set Danger = New Danger
                Danger.id = .Text
                .Col = 2
                Danger.Nature = .Text
                .Col = 3
                Danger.Spécificité = .Text
                .Col = 4
                Danger.Pertinence = .Text
                Set Danger.colDocuments = Projet.Danger(Danger.id).colDocuments
                Dangers.Add Danger, Danger.id
            End If
        Next
    End With
    'nouvelle collection de dangers associée au projet
    Set Projet.colDangers = Nothing
    Set Projet.colDangers = Dangers
    
End Sub



Private Sub TransfertEquipeDansProjet()

Dim Nom As String
Dim i As Integer

    Projet.PersonnesClear
    For i = 1 To SpreadEquipe.MaxRows
        SpreadEquipe.Row = i
        SpreadEquipe.Col = 1
        Nom = Trim$(SpreadEquipe.Text)
        If Nom <> "" Then
            SpreadEquipe.Col = 2
            Projet.AddPersonne Nom, SpreadEquipe.Text
        End If
    Next

End Sub





Private Sub A_btnAjouterDonnee_Click(Index As Integer)

Dim dNew As New Donnee
Dim Donnée As Object 'objet Donnee ou SujetDanger selon l'index d'affichage
Dim i As Integer
Dim IndexAff As Integer
Dim Assistance As Integer
Dim EvaluerCriticité As Integer
Dim ParentDansExistant As Donnee
Dim NewIndex As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    HourGlass "show"
    
    IndexAff = INDEX_AFF_ARBRE

    'nouvelle donnée
    dNew.id = "E" & Projet.NewId
    
    'options pour la fenêtre d'ajout de donnée
    GetAssistanceCriticitéArbreHACCP Index + PREMIER_NIVEAU_ARBRE_HACCP, Assistance, EvaluerCriticité
    If Assistance And ASSISTANCE_EXISTANT Then
    'recherche la donnée de niveau supérieur dans les dispositions actuelles
        Set ParentDansExistant = GetParentDansExistant(Index + PREMIER_NIVEAU_ARBRE_HACCP, EtapeEnCours(IndexAff), SujetEnCours(IndexAff))
    End If
    
    'affichage fenêtre d'ajout de donnée
    If formAjoutDonnée.AjouterDonnée(Element:=dNew, chCaption:="Ajout - " & A_lblNomNiveau(Index).Caption, Niveau:=Index + PREMIER_NIVEAU_ARBRE_HACCP, Affichage:=IndexAff, Assistance:=Assistance, EvaluerCriticité:=EvaluerCriticité, ParentDansExistant:=ParentDansExistant, SujetAide:=70 + Index) Then
        'met dans Donnée la donnée parent de la donnée cliquée
        Set Donnée = SujetDangerEnCours()
        For i = 0 To Index - 1
            Set Donnée = Donnée.Enfant("E" & A_lstDonnees(i).ItemData(A_lstDonnees(i).ListIndex))
        Next
        'mémorise l'id de la donnée ajoutée pour annulation d'ajout
        ProgAnnulationAjoutDonnée Tag, dNew, Donnée, Module.Niveau(Index + PREMIER_NIVEAU_ARBRE_HACCP), INDEX_AFF_ARBRE
        'Donnée représente le parent de la nouvelle donnée
        If A_lstDonnees(i).ListIndex = -1 Then
            'nouvelle donnée ajoutée en fin de liste
            Projet.AddArbreHACCP Donnée, dNew
            NewIndex = 0
        Else
            'nouvelle donnée ajoutée après la donnée en cours
            Projet.AddArbreHACCP Donnée, dNew, "E" & A_lstDonnees(i).ItemData(A_lstDonnees(i).ListIndex)
            NewIndex = A_lstDonnees(i).ListIndex + 1
        End If
        'refresh de l'onglet dans cette fenêtre et dans toutes celles du même projet
        RefreshArbreHACCPProjet Tag
        'se positionne sur la donnée ajoutée
        A_lstDonnees(Index).ListIndex = NewIndex
        'refresh des boutons de cet onglet dans toutes les fenêtres ouvertes sur le
        'même projet
        RefreshBoutonsArbreHACCPProjet Tag
    End If
    MetAJourMenus
    A_lstDonnees(Index).SetFocus
    HourGlass "hide"

    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub A_btnAjouterDonnee_GotFocus(Index As Integer)
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub A_btnAjouterDonnee_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour ajouter un élément dans la liste de ce niveau"
End Sub

Private Sub A_btnDocuments_Click(Index As Integer)

    AfficherMenuDocuments Me, DonnéeCliquée(INDEX_AFF_ARBRE, Index), Projet.RépertoireDocuments
    A_lstDonnees(Index).SetFocus
    
End Sub

Private Sub A_btnDocuments_GotFocus(Index As Integer)
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub A_btnDocuments_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour afficher la liste des documents associés à l'élément sélectionné"
End Sub

Private Sub A_lstDonnees_Click(Index As Integer)

Dim Donnée As Donnee
Dim IndexAff As Integer
Dim i As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    HourGlass "show"
    IndexAff = INDEX_AFF_ARBRE
    
    'commentaire de la donnée cliquée
    Set Donnée = DonnéeCliquée(IndexAff, Index)
    A_txtDonnee(Index).Text = Donnée.Commentaire
    
    If Index < INDEX_MAX_ARBRE_HACCP Then
        'enfants de la donnée cliquée
        Dim IndexEnfant As Integer
        Dim idDonnée As Long
        
        IndexEnfant = Index + 1
        If A_lstDonnees(IndexEnfant).ListIndex <> -1 Then
            'mémorise la donnée sélectionnée pour le restituer ensuite
            idDonnée = A_lstDonnees(IndexEnfant).ItemData(A_lstDonnees(IndexEnfant).ListIndex)
        End If
        A_lstDonnees(IndexEnfant).clear
        For i = 1 To Donnée.EnfantsCount
            A_lstDonnees(IndexEnfant).AddItem IIf(Donnée.Enfant(i).Criticité = "OUI", Chr$(169) & " ", "") & Donnée.Enfant(i).Titre
            A_lstDonnees(IndexEnfant).ItemData(A_lstDonnees(IndexEnfant).NewIndex) = suppfirstchar(Donnée.Enfant(i).id, 1)
        Next
        If A_lstDonnees(IndexEnfant).ListCount > 0 Then
            'déclenche l'affichage de la suite de l'arbre
            If idDonnée <> -1 Then
                'se repositionne sur l'élément précédemment sélectionné
                i = PositionDataDansListe(A_lstDonnees(IndexEnfant), idDonnée)
                If i <> -1 Then
                    A_lstDonnees(IndexEnfant).ListIndex = i
                Else
                    A_lstDonnees(IndexEnfant).ListIndex = 0
                End If
            Else
                A_lstDonnees(IndexEnfant).ListIndex = 0
            End If
        Else
            A_txtDonnee(IndexEnfant).Text = ""
        End If
    End If
    RefreshBoutonsArbreHACCP
    'menu edition
    CouperCopierCollerEffacer Projet.Modifiable, True, True, DonnéeDansClipboard(IndexAff, Index + PREMIER_NIVEAU_ARBRE_HACCP), True
    HourGlass "hide"

    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub A_lstDonnees_DblClick(Index As Integer)

Dim Donnée As Donnee
Dim IndexAff As Integer
Dim i As Integer
Dim Assistance As Integer
Dim EvaluerCriticité As Integer
Dim ParentDansExistant As Donnee

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    If Projet.NonModifiable Then
        'seulement si projet modifiable
        Exit Sub
    End If

    HourGlass "show"
    IndexAff = INDEX_AFF_ARBRE
    Set Donnée = DonnéeCliquée(IndexAff, Index)

    'options pour la fenêtre d'ajout de donnée
    GetAssistanceCriticitéArbreHACCP Index + PREMIER_NIVEAU_ARBRE_HACCP, Assistance, EvaluerCriticité
    If Assistance And ASSISTANCE_EXISTANT Then
    'recherche la donnée de niveau supérieur dans les dispositions actuelles
        Set ParentDansExistant = GetParentDansExistant(Index + PREMIER_NIVEAU_ARBRE_HACCP, EtapeEnCours(IndexAff), SujetEnCours(IndexAff))
    End If
    
    'fenêtre d'ajout/modification
    If formAjoutDonnée.ModifierDonnée(Element:=Donnée, chCaption:="Modification - " & A_lblNomNiveau(Index).Caption, Niveau:=Index + PREMIER_NIVEAU_ARBRE_HACCP, Affichage:=INDEX_AFF_ARBRE, Assistance:=Assistance, EvaluerCriticité:=EvaluerCriticité, ParentDansExistant:=ParentDansExistant, SujetAide:=70 + Index) Then
        'le titre ou le commentaire d'une donnée a changé
        'refresh de l'onglet dans toutes les fenêtres du même projet
        RefreshArbreHACCPProjet Tag
        'refresh des boutons de l'onglet dans toutes les fenêtres du même projet
        RefreshBoutonsArbreHACCPProjet Tag
    End If
    MetAJourMenus
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub


Private Sub A_lstDonnees_GotFocus(Index As Integer)
    A_lblNomNiveau(Index).BackColor = QBColor(QBCOLOR_CYAN_CLAIR)
    'menu edition
    CouperCopierCollerEffacer Projet.Modifiable, True, True, DonnéeDansClipboard(INDEX_AFF_ARBRE, Index + PREMIER_NIVEAU_ARBRE_HACCP), True
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab
End Sub

Private Sub A_lstDonnees_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)

Dim chMessage As String
Dim cr As Integer
Dim IndexAff As Integer
Dim i As Integer
Dim Donnée As Object    'de classe SujetDanger ou Donnee dans le parcours de l'arbre
Dim DonnéeASupprimer As Donnee
Dim NewIndex As Integer
Dim BeforeKey As Variant
    
    'gestion d'erreur inattendue
    On Error GoTo err_inattendue
    
    IndexAff = INDEX_AFF_ARBRE
    Select Case KeyCode
        Case KEY_DEL
            'suppression
            If Projet.NonModifiable Then
                'seulement si projet modifiable
                Exit Sub
            End If
            If A_lstDonnees(Index).ListIndex <> -1 Then
                chMessage = GetChaineCrLf("M1")
                cr = MsgBox(chMessage, MB_ICONQUESTION Or MB_YESNO, NomApplication)
                If cr = IDYES Then
                    'donnée à supprimer
                    Set DonnéeASupprimer = DonnéeCliquée(IndexAff, Index)
                    'met dans Donnée la donnée parent de la donnée à supprimer
                    Set Donnée = SujetDangerEnCours()
                    For i = 0 To Index - 1
                        Set Donnée = Donnée.Enfant("E" & A_lstDonnees(i).ItemData(A_lstDonnees(i).ListIndex))
                    Next
                    'mémorise pour annulation éventuelle
                    If A_lstDonnees(Index).ListIndex < A_lstDonnees(Index).ListCount - 1 Then
                        BeforeKey = "E" & A_lstDonnees(Index).ItemData(A_lstDonnees(Index).ListIndex + 1)
                    Else
                        BeforeKey = ""
                    End If
                    ProgAnnulationDeleteDonnée Tag, DonnéeASupprimer, Donnée, Module.Niveau(Index + PREMIER_NIVEAU_ARBRE_HACCP), IndexAff, BeforeKey
                    'suppression de la donnée
                    Donnée.colEnfants.Remove DonnéeASupprimer.id
                    'refresh de l'onglet dans toutes les fenêtres du même projet
                    RefreshArbreHACCPProjet Tag
                    RefreshBoutonsArbreHACCPProjet Tag
                    Projet.EstModifié
                End If
            End If
        Case KEY_CUT
            If Projet.NonModifiable Then
                'seulement si projet modifiable
                Exit Sub
            End If
            A_lstDonnees_KeyDown Index, KEY_COPY, Shift
            A_lstDonnees_KeyDown Index, KEY_DEL, Shift
            A_lstDonnees_GotFocus Index
        Case KEY_COPY
            If A_lstDonnees(Index).ListIndex <> -1 Then
                'donnée à copier
                HourGlass "show"
                Set Donnée = DonnéeCliquée(IndexAff, Index)
                Donnée.CopyToClipboard IndexAff, Index + PREMIER_NIVEAU_ARBRE_HACCP, IDENTIFICATION_CLIPBOARD
                A_lstDonnees(Index).SetFocus
                A_lstDonnees_Click (Index)
                HourGlass "hide"
            End If
        Case KEY_PASTE
            'coller
            If Projet.NonModifiable Then
                'seulement si projet modifiable
                Exit Sub
            End If
            If DonnéeDansClipboard(IndexAff, Index + PREMIER_NIVEAU_ARBRE_HACCP) Then
                'si pas de sujet/danger
                If lstSujetsDangers(INDEX_AFF_ARBRE).ListIndex = -1 Then
                    Exit Sub
                End If
                'met dans Donnée la donnée parent de la donnée cliquée
                HourGlass "show"
                Set Donnée = SujetDangerEnCours()
                For i = 0 To Index - 1
                    If A_lstDonnees(i).ListIndex <> -1 Then
                        Set Donnée = Donnée.Enfant("E" & A_lstDonnees(i).ItemData(A_lstDonnees(i).ListIndex))
                    Else
                        HourGlass "hide"
                        Exit Sub
                    End If
                Next
                'remplit une donnée avec le clipboard
                Dim NewDonnée As New Donnee
                NewDonnée.PasteFromClipboard Projet, IndexAff, Index
                'mémorise pour annulation éventuelle
                ProgAnnulationAjoutDonnée Tag, NewDonnée, Donnée, Module.Niveau(Index + PREMIER_NIVEAU_ARBRE_HACCP), INDEX_AFF_ARBRE
                'ajoute la donnée dans l'arbre
                If A_lstDonnees(Index).ListIndex = -1 Then
                    Donnée.AddEnfant NewDonnée
                    NewIndex = 0
                Else
                    Donnée.AddEnfant NewDonnée, "E" & A_lstDonnees(Index).ItemData(A_lstDonnees(Index).ListIndex)
                    NewIndex = A_lstDonnees(Index).ListIndex + 1
                End If
                'refresh de l'onglet dans toutes les fenêtres du même projet
                RefreshArbreHACCPProjet Tag
                'et positionnement sur la donnée collée
                A_lstDonnees(Index).ListIndex = NewIndex
                RefreshBoutonsArbreHACCPProjet Tag
                Projet.EstModifié
                HourGlass "hide"
            End If
    End Select

    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub A_lstDonnees_KeyPress(Index As Integer, keyascii As Integer)
    If keyascii = 43 And A_btnAjouterDonnee(Index).Visible Then
        A_btnAjouterDonnee(Index).Value = True
    End If
End Sub

Private Sub A_lstDonnees_LostFocus(Index As Integer)
    A_lblNomNiveau(Index).BackColor = QBColor(QBCOLOR_GRIS)
End Sub

Private Sub A_lstDonnees_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Liste des éléments de niveau indiqué à gauche"
End Sub

Private Sub A_txtDonnee_GotFocus(Index As Integer)
    
    'gestion d'erreur inattendue
    On Error GoTo err_inattendue
    
    'menu edition
    CouperCopierCollerEffacer Projet.Modifiable, True, True, True, True
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub A_txtDonnee_KeyPress(Index As Integer, keyascii As Integer)
    keyascii = 0
End Sub


Private Sub A_txtDonnee_LostFocus(Index As Integer)
    'menu edition
    CouperCopierCollerEffacer Projet.Modifiable, False, False, False, False
End Sub


Private Sub A_txtDonnee_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Description de l'élément sélectionné dans la liste à gauche"
End Sub

Private Sub btnAjouterDanger_Click()

Dim idDanger As String
Dim Danger As New Danger

Dim NouveauDanger As Integer
Dim bAjoutsEffectués As Integer
Dim bModif As Integer

Dim KeyBefore As String

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    HourGlass "show"
    'appui sur le bouton d'ajout/modification de danger
    With SpreadDangers
        .Row = .ActiveRow
        .Col = 1
        idDanger = .Text
        'nouveau danger si la ligne courante est vide (première colonne vide)
        NouveauDanger = (idDanger = "")
        If Not NouveauDanger Then
            'danger à modifier
            Set Danger = Projet.Danger(idDanger)
        Else
            'nouveau danger
            Danger.id = "D" & Projet.NewId
            'danger suivant dans la liste
            KeyBefore = ""
            If .ActiveRow < .MaxRows Then
                Dim oldRow As Integer
                oldRow = .Row
                .Row = .ActiveRow + 1
                KeyBefore = .Text   'clé du danger suivant
                .Row = oldRow
            End If
        End If
        bAjoutsEffectués = False
        bModif = False
        If FormAjoutDanger.AjouterDanger(Projet, Danger, SpreadDangers, "Pertinence '" & Module.Niveau(3) & "'", NouveauDanger, KeyBefore, bAjoutsEffectués) Then
            'sortie par OK
            'affiche le danger dans le spread
            .Col = 1
            .Text = Danger.id
            .Col = 2
            .Text = Danger.Nature
            .Col = 3
            .Text = Danger.Spécificité
            .Col = 4
            .Text = Danger.Pertinence
            .Col = 5
            .Lock = Danger.DocumentsCount = 0
            .Text = Danger.id
            If .Lock Then
                .TypeButtonPicture = LoadPicture("")
                .TypeButtonPictureDown = LoadPicture("")
            Else
                .TypeButtonPicture = picFleche.Picture
                .TypeButtonPictureDown = picFleche.Picture
            End If
            If NouveauDanger Then
                'mémorise le danger ajouté
                ProgAnnulationAjoutDanger Tag, Danger, Module.Niveau(NIVEAU_SUJET_DANGER)
                'un danger de plus dans le projet
                If KeyBefore = "" Then
                    'à la fin de la liste
                    Projet.AddDanger Danger
                Else
                    'inséré
                    Projet.AddDanger Danger, KeyBefore
                End If
                'toujours une ligne vierge dans le tableau
                .Col = 1
                .Row = .MaxRows
                If .Text <> "" Then
                    .MaxRows = .MaxRows + 1
                End If
                'se positionne sur ligne suivante
                .Row = .ActiveRow + 1
                .Col = .ActiveCol
                .Action = SS_ACTION_ACTIVE_CELL
            End If
            bModif = True
        End If
        If bAjoutsEffectués Or bModif Then
            'reconstruit la collection des dangers du projet
            'pour insérer les dangers ajoutés
            'en chaine depuis la fenêtre d'ajout de dangers
            'dans l'ordre d'affichage
            'ou tenir compte de la modification d'un danger
            'TransfertDangersDansProjet 'à vérifier que c'est bien nécessaire
            
            'refresh de la liste des dangers et sujets/dangers
            RefreshDangersProjet Tag
            'refresh arbre haccp
            RefreshArbreHACCPProjet Tag
        End If
        MetAJourMenus
    End With
    RefreshBoutonsDangers
    HourGlass "hide"

    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub btnAjouterDanger_GotFocus()
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub

Private Sub btnAjouterDanger_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour ajouter un danger au projet HACCP"
End Sub

Private Sub btnAjouterDocumentation_Click()

Dim chTitre As String
Dim chFichier As String
Dim NouveauDocument As Integer
Dim bAjoutsEffectués As Integer
Dim bModif As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    HourGlass "show"
    'appui sur le bouton d'ajout/modification de document
    With SpreadDocumentation
        .Row = .ActiveRow
        .Col = 1
        chFichier = .Text
        'nouveau document si la ligne courante est vide
        NouveauDocument = (chFichier = "")
        .Col = 3
        chTitre = .Text
        bAjoutsEffectués = False
        bModif = False
        If ChoixDocument("Document associé au projet", SpreadDocumentation, chFichier, chTitre, bAjoutsEffectués) Then
            'mémorise la documentation pour annulation
            ProgAnnulationSaisieDocumentation Tag, Projet.Documentation.Copy
            'sortie par OK
            'affiche le document dans le spread
            .Col = 1
            .Text = chFichier
            .Col = 2
            .Text = GetFichierSansChemin(chFichier)
            .Col = 3
            .Text = chTitre
            If NouveauDocument Then
                'une documentation de plus dans le projet
                Projet.AddDocument chFichier, chTitre
                'toujours une ligne vierge dans le tableau
                .Col = 1
                .Row = .MaxRows
                If .Text <> "" Then
                    .MaxRows = .MaxRows + 1
                End If
                'se positionne sur ligne vierge
                .Row = .MaxRows
                .Col = .ActiveCol
                .Action = SS_ACTION_ACTIVE_CELL
            End If
            bModif = True
        End If
        If bAjoutsEffectués Or bModif Then
            'reconstruit la collection de documentation du projet
            'pour insérer les documentations ajoutées
            'en chaine depuis la fenêtre de choix de documents
            'soient dans l'ordre dans la collection de documents
            TransfertDocumentationDansProjet
            RefreshDocumentationProjet Tag
        End If

    End With
    MetAJourMenus
    HourGlass "hide"

    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub btnAjouterDocumentation_GotFocus()
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub btnAjouterDocumentation_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour ajouter ou modifier un document du projet HACCP"
End Sub

Private Sub btnAjouterSujetDanger_Click()

Dim idSujetDanger As String
Dim SujetDanger As New SujetDanger
Dim idDanger As String
Dim Danger As New Danger

Dim NouveauSujetDanger As Integer
Dim bAjoutsEffectués As Integer
Dim bModif As Integer

Dim KeyBefore As String

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    HourGlass "show"
    'appui sur le bouton d'ajout/modification de sujet/danger
    If btnAjouterSujetDanger.Enabled Then
        With SpreadDangers
            .Row = .ActiveRow
            .Col = 1
            idDanger = .Text
        End With
        If idDanger <> "" Then
            Set Danger = Projet.Danger(idDanger)
        Else
            HourGlass "Hide"
            Exit Sub
        End If
        With SpreadSujetsDangers
            .Row = .ActiveRow
            .Col = 1
            idSujetDanger = .Text
            'nouveau Sujet/Danger si la ligne courante est vide (première colonne vide)
            NouveauSujetDanger = (idSujetDanger = "")
            If Not NouveauSujetDanger Then
                'Sujet/danger à modifier
                Set SujetDanger = Projet.SujetDanger(idSujetDanger)
            Else
                'nouveau sujet/danger
                SujetDanger.id = "D" & Projet.NewId
                SujetDanger.Danger = idDanger
                KeyBefore = ""
                If .ActiveRow < .MaxRows Then
                    Dim oldRow As Integer
                    oldRow = .Row
                    .Row = .ActiveRow + 1
                    KeyBefore = .Text   'clé du danger suivant
                    .Row = oldRow
                End If
            End If
            bAjoutsEffectués = False
            bModif = False
            If FormAjoutSujetDanger.AjouterSujetDanger(Projet, SujetDanger, SpreadSujetsDangers, "Criticité d'un " & Module.Niveau(3), NouveauSujetDanger, KeyBefore, bAjoutsEffectués) Then
                'sortie par OK
                'affiche le sujet/danger dans le spread
                Dim Etape As Donnee
                Dim Sujet As Donnee
                Set Etape = Projet.Etape(SujetDanger.Etape)
                Set Sujet = Etape.Enfant(SujetDanger.Sujet)
                Set Danger = Projet.Danger(SujetDanger.Danger)
                If idDanger = Danger.id Then
                    .Col = 1
                    .Text = SujetDanger.id
                    .Col = 2
                    .Text = Etape.Titre
                    .Col = 3
                    .Text = Sujet.Titre
                    .Col = 4
                    .Text = Danger.Nature
                    .Col = 5
                    .Text = Danger.Spécificité
                    .Col = 6
                    .Text = SujetDanger.Nom
                    .Col = 7
                    .Text = SujetDanger.Commentaire
                    .Col = 8
                    .Text = SujetDanger.Criticité
                    .Col = 9
                    .Lock = SujetDanger.DocumentsCount = 0
                    .Text = SujetDanger.id
                    If .Lock Then
                        .TypeButtonPicture = LoadPicture("")
                        .TypeButtonPictureDown = LoadPicture("")
                    Else
                        .TypeButtonPicture = picFleche.Picture
                        .TypeButtonPictureDown = picFleche.Picture
                    End If
                End If
                If NouveauSujetDanger Then
                    'mémorise le sujet/danger ajouté
                    ProgAnnulationAjoutSujetDanger Tag, SujetDanger, "étape de danger"
                    'un sujet/danger de plus dans le projet
                    If KeyBefore = "" Then
                        'à la fin de la liste
                        Projet.AddSujetDanger SujetDanger
                    Else
                        'inséré
                        Projet.AddSujetDanger SujetDanger, KeyBefore
                    End If
                    If idDanger = Danger.id Then
                        'toujours une ligne vierge dans le tableau
                        .Col = 1
                        .Row = .MaxRows
                        If .Text <> "" Then
                            .MaxRows = .MaxRows + 1
                        End If
                        'se positionne sur ligne suivante
                        .Row = .ActiveRow + 1
                        .Col = .ActiveCol
                        .Action = SS_ACTION_ACTIVE_CELL
                    End If
                End If
                bModif = True
            End If
            If bAjoutsEffectués Or bModif Then
                'refresh de la liste des sujets/dangers de l'onglet
                RefreshSujetsDangersProjet Tag, idDanger
                'refresh de la liste des sujets/dangers de l'onglet Arbre HACCP quelque soient
                'les étapes et les sujets des sujet/dangers ajoutés ou modifiés (contrairement au
                'cas des sujets ajoutés dans l'onglet Etapes et SUjets qui sont ajoutés un par un, ici,
                'les sujets/dangers peuvent être ajoutés en série et donc peuvent toucher plusieurs
                'étapes et sujets différents, donc on refresh toutes les listes de sujets/dangers des
                'onglets Arbre HACCP de toutes les fenêtres ouvertes sur le projet
                RefreshListeSujetsDangersProjet lstSujetsDangers(INDEX_AFF_ARBRE), Tag, INDEX_AFF_ARBRE
                'refresh arbre haccp
                RefreshArbreHACCPProjet Tag
            End If
    
        End With
    End If
    RefreshBoutonsDangers
    MetAJourMenus
    HourGlass "hide"

    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub btnAjouterSujetDanger_GotFocus()
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub btnAjouterSujetDanger_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour associer un danger à une étape du projet HACCP"
End Sub

Private Sub btnCommentaireDanger_Click(Index As Integer)
    AfficherCommentaire SujetDangerEnCours(), Module.Niveau(NIVEAU_SUJET_DANGER)
End Sub

Private Sub btnCommentaireDanger_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour voir la description l'élément sélectionné à gauche"
End Sub


Private Sub btnCommentaireEtape_Click(Index As Integer)

    AfficherCommentaire EtapeEnCours(Index), Module.Niveau(NIVEAU_ETAPE)
    
End Sub

Private Sub btnCommentaireEtape_GotFocus(Index As Integer)
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub btnCommentaireEtape_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour voir la description l'élément sélectionné à gauche"
End Sub

Private Sub btnCommentaireSujet_Click(Index As Integer)

    AfficherCommentaire SujetEnCours(Index), Module.Niveau(NIVEAU_SUJET)

End Sub


Private Sub btnCommentaireSujet_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour voir la description l'élément sélectionné à gauche"
End Sub


'fonction publique pour pouvoir l'appeler depuis le fenêtre d'ajout d'un Danger
Public Sub btnInsérerDanger_Click()

    SpreadDangers.MaxRows = SpreadDangers.MaxRows + 1
    SpreadInsereLigneBlanche SpreadDangers, picFleche
    SpreadDangers_Click SpreadDangers.ActiveCol, SpreadDangers.ActiveRow
    RefreshBoutonsDangers
    
End Sub

Private Sub btnInsérerDanger_GotFocus()
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub btnInsérerDanger_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour insérer une ligne vierge afin d'ajouter un danger au projet HACCP"
End Sub

Private Sub btnInsérerDocumentation_Click()

    SpreadDocumentation.MaxRows = SpreadDocumentation.MaxRows + 1
    SpreadInsereLigneBlanche SpreadDocumentation, picFleche
    RefreshBoutonsDocumentation
    
End Sub


Private Sub btnInsérerDocumentation_GotFocus()
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub btnInsérerDocumentation_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour insérer une ligne vierge pour un nouveau document dans le projet HACCP"
End Sub

'fonction publique pour pouvoir l'appeler depuis le fenêtre d'ajout d'un SujetDanger
Public Sub btnInsérerSujetDanger_Click()

    SpreadSujetsDangers.MaxRows = SpreadSujetsDangers.MaxRows + 1
    SpreadInsereLigneBlanche SpreadSujetsDangers, picFleche
    RefreshBoutonsDangers
    
End Sub

Private Sub btnInsérerSujetDanger_GotFocus()
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub btnInsérerSujetDanger_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour insérer une ligne vierge afin d'associer un danger à une étape du projet HACCP"
End Sub

Private Sub btnSupprimerDanger_Click()

Dim idDanger As String
Dim Danger As Danger
Dim cr As Integer
Dim i As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    With SpreadDangers
        .Row = .ActiveRow
        .Col = 1
        idDanger = .Text
        If idDanger <> "" Then
            Set Danger = Projet.Danger(idDanger)
            cr = MsgBox("Suppression " & Module.Niveau(3) & " nature '" & Danger.Nature & "' spécificité '" & Danger.Spécificité & "':" & CrLf2 & "Attention, cette suppression entraîne l'effacement des données de niveau inférieur dans l'analyse HACCP" & CrLf2 & "Voulez-vous continuer ?", MB_ICONQUESTION Or MB_YESNO, NomApplication)
            If cr = IDYES Then
                'marque comme effacé les sujets/dangers du danger
                For i = Projet.SujetsDangersCount To 1 Step -1
                    If Projet.SujetDanger(i).Danger = Danger.id Then
                        Projet.SujetDanger(i).Effacé = True
                    End If
                Next
                'mémorise le danger effacé pour annulation
                ProgAnnulationDeleteDanger Tag, Danger, Module.Niveau(NIVEAU_SUJET_DANGER), .Row
                'efface le danger du projet
                Projet.DeleteDanger idDanger
                'refresh de la liste des dangers et sujets/dangers
                RefreshDangersProjet Tag
                'refresh arbre haccp
                RefreshArbreHACCPProjet Tag
            End If
        Else
            If .MaxRows > 1 And .ActiveRow <> .MaxRows Then
                SpreadOteLigne SpreadDangers, picFleche
                .MaxRows = .MaxRows - 1
            End If
        End If
    End With
    SpreadDangers_Click SpreadDangers.ActiveCol, SpreadDangers.ActiveRow
    RefreshBoutonsDangers
    MetAJourMenus
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub btnSupprimerDanger_GotFocus()
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub btnSupprimerDanger_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour supprimer un danger du projet HACCP"
End Sub

Private Sub btnSupprimerDocumentation_Click()

Dim cr As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    If SpreadDocumentation.MaxRows > 1 Then
        With SpreadDocumentation
            .Row = .ActiveRow
            .Col = 1
            cr = -IDYES
            If .Text = "" And .Row = .MaxRows Then
                Exit Sub
            End If
            If .Text <> "" Then
                cr = MsgBox(InsereChaine(GetChaineCrLf("M0"), .Text), MB_ICONQUESTION Or MB_YESNO, NomApplication)
            End If
            If Abs(cr) = IDYES Then
                'mémorise la documentation pour annulation
                ProgAnnulationSaisieDocumentation Tag, Projet.Documentation.Copy
                'une ligne de moins
                SpreadOteLigne SpreadDocumentation, picFleche
                SpreadDocumentation.MaxRows = SpreadDocumentation.MaxRows - 1
                If cr = IDYES Then
                    'seulement si la ligne supprimée n'était pas vide
                    TransfertDocumentationDansProjet
                    RefreshDocumentationProjet Tag
                End If
            End If
        End With
    End If
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub


Private Sub btnSupprimerDocumentation_GotFocus()
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub btnSupprimerDocumentation_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour oter le document sélectionné dans la liste"
End Sub

Private Sub btnSupprimerSujetDanger_Click()

Dim idSujetDanger As String
Dim SujetDanger As SujetDanger
Dim cr As Integer
Dim chEtape As String
Dim chSujet As String
Dim i As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    With SpreadSujetsDangers
        .Row = .ActiveRow
        .Col = 1
        idSujetDanger = .Text
        If idSujetDanger <> "" Then
            Set SujetDanger = Projet.SujetDanger(idSujetDanger)
            chEtape = Projet.EtapeTitre(SujetDanger.Etape)
            chSujet = Projet.Etape(SujetDanger.Etape).Enfant(SujetDanger.Sujet).Titre
            cr = MsgBox("Suppression " & Module.Niveau(3) & " nature '" & Projet.Danger(SujetDanger.Danger).Nature & "' spécificité '" & Projet.Danger(SujetDanger.Danger).Spécificité & "' " & Module.Niveau(NIVEAU_ETAPE) & " '" & chEtape & "' " & Module.Niveau(NIVEAU_SUJET) & " '" & chSujet & "' :" & CrLf2 & "Attention, cette suppression entraîne l'effacement des données de niveau inférieur dans l'analyse HACCP" & CrLf2 & "Voulez-vous continuer ?", MB_ICONQUESTION Or MB_YESNO, NomApplication)
            If cr = IDYES Then
                'mémorise le sujet/danger effacé
                ProgAnnulationDeleteSujetDanger Tag, SujetDanger, "étape de danger", .Row
                'efface le sujet/danger du projet (avec l'arboresence HACCP associée)
                Projet.DeleteSujetDanger idSujetDanger
                'refresh de la liste des dangers et sujets/dangers
                RefreshSujetsDangersProjet Tag, SujetDanger.Danger
                'refresh arbre haccp
                RefreshArbreHACCPProjet Tag
            End If
        Else
            If .MaxRows > 1 And .ActiveRow <> .MaxRows Then
                SpreadOteLigne SpreadSujetsDangers, picFleche
                .MaxRows = .MaxRows - 1
            End If
        End If
    End With
    RefreshBoutonsDangers
    MetAJourMenus
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub btnSupprimerSujetDanger_GotFocus()
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub btnSupprimerSujetDanger_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour supprimer un danger d'une étape du projet HACCP"
End Sub


Private Sub D_btnAjouterDonnee_Click(Index As Integer)

Dim dNew As New Donnee
Dim Donnée As Donnee
Dim i As Integer
Dim IndexAff As Integer
Dim NewIndex As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    HourGlass "show"
    
    IndexAff = INDEX_AFF_DISPOSITIONS

    'nouvelle donnée
    dNew.id = "E" & Projet.NewId
    If formAjoutDonnée.AjouterDonnée(Element:=dNew, chCaption:="Ajout - " & D_lblNomNiveau(Index).Caption, Niveau:=Index + PREMIER_NIVEAU_DISPOSITIONS, Affichage:=IndexAff, Assistance:=ASSISTANCE_SUGGESTIONS, EvaluerCriticité:=False, ParentDansExistant:=Nothing, SujetAide:=50 + Index) Then
        'met dans Donnée la donnée parent de la donnée cliquée
        Set Donnée = SujetEnCours(IndexAff)
        For i = 0 To Index - 1
            Set Donnée = Donnée.Enfant("E" & D_lstDonnees(i).ItemData(D_lstDonnees(i).ListIndex))
        Next
        'mémorise l'id de la donnée ajoutée pour annulation d'ajout
        ProgAnnulationAjoutDonnée Tag, dNew, Donnée, Module.Niveau(Index + PREMIER_NIVEAU_DISPOSITIONS), INDEX_AFF_DISPOSITIONS
        'Donnée représente le parent de la nouvelle donnée
        If D_lstDonnees(i).ListIndex = -1 Then
            'nouvelle donnée ajoutée en fin de liste
            Projet.AddDispositionEnPlace Donnée, dNew
            NewIndex = 0
        Else
            'nouvelle donnée ajoutée après la donnée en cours
            Projet.AddDispositionEnPlace Donnée, dNew, "E" & D_lstDonnees(i).ItemData(D_lstDonnees(i).ListIndex)
            NewIndex = D_lstDonnees(i).ListIndex + 1
        End If
        'refresh de l'onglet dans cette fenêtre et dans toutes celles du même projet
        RefreshDispositionsActuellesProjet Tag
        'se positionne sur la donnée ajoutée
        D_lstDonnees(Index).ListIndex = NewIndex
        'refresh des boutons de cet onglet dans toutes les fenêtres ouvertes sur le
        'même projet
        RefreshBoutonsDispositionsActuellesProjet Tag
        MetAJourMenus
    End If
    D_lstDonnees(Index).SetFocus
    HourGlass "hide"

    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub D_btnAjouterDonnee_GotFocus(Index As Integer)
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub D_btnAjouterDonnee_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour ajouter un élément dans la liste de ce niveau"
End Sub

Private Sub D_btnDocuments_Click(Index As Integer)

    AfficherMenuDocuments Me, DonnéeCliquée(INDEX_AFF_DISPOSITIONS, Index), Projet.RépertoireDocuments
    D_lstDonnees(Index).SetFocus
    
End Sub

Private Sub D_btnDocuments_GotFocus(Index As Integer)
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub D_btnDocuments_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour afficher la liste des documents associés à l'élément sélectionné"
End Sub

Private Sub D_lstDonnees_Click(Index As Integer)

Dim Donnée As Donnee
Dim IndexAff As Integer
Dim i As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    HourGlass "show"
    IndexAff = INDEX_AFF_DISPOSITIONS
    
    'commentaire de la donnée cliquée
    Set Donnée = DonnéeCliquée(IndexAff, Index)
    D_txtDonnee(Index).Text = Donnée.Commentaire
    
    If Index < INDEX_MAX_DISPOSITIONS Then
        'enfants de la donnée cliquée
        Dim IndexEnfant As Integer
        Dim idDonnée As Long
        
        IndexEnfant = Index + 1
        If D_lstDonnees(IndexEnfant).ListIndex <> -1 Then
            'mémorise la donnée sélectionnée pour le restituer ensuite
            idDonnée = D_lstDonnees(IndexEnfant).ItemData(D_lstDonnees(IndexEnfant).ListIndex)
        End If
        D_lstDonnees(IndexEnfant).clear
        For i = 1 To Donnée.EnfantsCount
            D_lstDonnees(IndexEnfant).AddItem Donnée.Enfant(i).Titre
            D_lstDonnees(IndexEnfant).ItemData(D_lstDonnees(IndexEnfant).NewIndex) = suppfirstchar(Donnée.Enfant(i).id, 1)
        Next
        If D_lstDonnees(IndexEnfant).ListCount > 0 Then
            'déclenche l'affichage de la suite de l'arbre
            If idDonnée <> -1 Then
                'se repositionne sur l'élément précédemment sélectionné
                i = PositionDataDansListe(D_lstDonnees(IndexEnfant), idDonnée)
                If i <> -1 Then
                    D_lstDonnees(IndexEnfant).ListIndex = i
                Else
                    D_lstDonnees(IndexEnfant).ListIndex = 0
                End If
            Else
                D_lstDonnees(IndexEnfant).ListIndex = 0
            End If
        Else
            D_txtDonnee(IndexEnfant).Text = ""
        End If
    End If
    RefreshBoutonsDispositionsActuelles
    'menu edition
    CouperCopierCollerEffacer Projet.Modifiable, True, True, DonnéeDansClipboard(IndexAff, Index + PREMIER_NIVEAU_DISPOSITIONS), True
    MetAJourMenus
    HourGlass "hide"
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub D_lstDonnees_DblClick(Index As Integer)

Dim Donnée As Donnee
Dim IndexAff As Integer
Dim i As Integer

    If Projet.NonModifiable Then
        Exit Sub
    End If

    HourGlass "show"
    IndexAff = INDEX_AFF_DISPOSITIONS
    Set Donnée = DonnéeCliquée(IndexAff, Index)

    'fenêtre d'ajout/modification
    If formAjoutDonnée.ModifierDonnée(Element:=Donnée, chCaption:="Modification - " & D_lblNomNiveau(Index).Caption, Niveau:=Index + PREMIER_NIVEAU_DISPOSITIONS, Affichage:=INDEX_AFF_DISPOSITIONS, Assistance:=ASSISTANCE_SUGGESTIONS, EvaluerCriticité:=False, ParentDansExistant:=Nothing, SujetAide:=50 + Index) Then
        'le titre ou le commentaire d'une donnée a changé
        'refresh de l'onglet dans toutes les fenêtres du même projet
        RefreshDispositionsActuellesProjet Tag
        'refresh des boutons de l'onglet dans toutes les fenêtres du même projet
        RefreshBoutonsDispositionsActuellesProjet Tag
        MetAJourMenus
    End If
    
End Sub


Private Sub D_lstDonnees_GotFocus(Index As Integer)
    D_lblNomNiveau(Index).BackColor = QBColor(QBCOLOR_CYAN_CLAIR)
    'menu edition
    CouperCopierCollerEffacer Projet.Modifiable, True, True, DonnéeDansClipboard(INDEX_AFF_DISPOSITIONS, Index + PREMIER_NIVEAU_DISPOSITIONS), True
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab
End Sub

Private Sub D_lstDonnees_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)

Dim chMessage As String
Dim cr As Integer
Dim IndexAff As Integer
Dim i As Integer
Dim Donnée As Donnee
Dim DonnéeASupprimer As Donnee
Dim NewIndex As Integer
Dim BeforeKey As Variant

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue
    
    Select Case KeyCode
        Case KEY_DEL
            'suppresion
            If Projet.NonModifiable Then
                'seulement si projet modifiable
                Exit Sub
            End If
            If D_lstDonnees(Index).ListIndex <> -1 Then
                IndexAff = INDEX_AFF_DISPOSITIONS
                chMessage = GetChaineCrLf("M1")
                cr = MsgBox(chMessage, MB_ICONQUESTION Or MB_YESNO, NomApplication)
                If cr = IDYES Then
                    'donnée à supprimer
                    Set DonnéeASupprimer = DonnéeCliquée(IndexAff, Index)
                    'met dans Donnée la donnée parent de la donnée à supprimer
                    Set Donnée = SujetEnCours(IndexAff)
                    For i = 0 To Index - 1
                        Set Donnée = Donnée.Enfant("E" & D_lstDonnees(i).ItemData(D_lstDonnees(i).ListIndex))
                    Next
                    'mémorise pour annulation éventuelle
                    If D_lstDonnees(Index).ListIndex < D_lstDonnees(Index).ListCount - 1 Then
                        BeforeKey = "E" & D_lstDonnees(Index).ItemData(D_lstDonnees(Index).ListIndex + 1)
                    Else
                        BeforeKey = ""
                    End If
                    ProgAnnulationDeleteDonnée Tag, DonnéeASupprimer, Donnée, Module.Niveau(Index + PREMIER_NIVEAU_DISPOSITIONS), IndexAff, BeforeKey
                    'suppression de la donnée
                    Donnée.colEnfants.Remove DonnéeASupprimer.id
                    'refresh de l'onglet dans toutes les fenêtres du même projet
                    RefreshDispositionsActuellesProjet Tag
                    RefreshBoutonsDispositionsActuelles
                    Projet.EstModifié
                End If
            End If
        Case KEY_CUT
            'couper
            If Projet.NonModifiable Then
                'seulement si projet modifiable
                Exit Sub
            End If
            D_lstDonnees_KeyDown Index, KEY_COPY, Shift
            D_lstDonnees_KeyDown Index, KEY_DEL, Shift
            D_lstDonnees_GotFocus Index
        Case KEY_COPY
            'donnée à copier
            If D_lstDonnees(Index).ListIndex <> -1 Then
                HourGlass "show"
                Set Donnée = DonnéeCliquée(IndexAff, Index)
                Donnée.CopyToClipboard IndexAff, Index + PREMIER_NIVEAU_DISPOSITIONS, IDENTIFICATION_CLIPBOARD
                D_lstDonnees(Index).SetFocus
                D_lstDonnees_Click (Index)
                D_lstDonnees(Index).SetFocus
                HourGlass "hide"
            End If
        Case KEY_PASTE
            'coller
            If Projet.NonModifiable Then
                'seulement si projet modifiable
                Exit Sub
            End If
            If DonnéeDansClipboard(IndexAff, Index + PREMIER_NIVEAU_DISPOSITIONS) Then
                HourGlass "show"
                'met dans Donnée la donnée parent de la donnée cliquée
                Set Donnée = SujetEnCours(INDEX_AFF_DISPOSITIONS)
                For i = 0 To Index - 1
                    Set Donnée = Donnée.Enfant("E" & D_lstDonnees(i).ItemData(D_lstDonnees(i).ListIndex))
                Next
                'remplit une donnée avec le clipboard
                Dim NewDonnée As New Donnee
                NewDonnée.PasteFromClipboard Projet, IndexAff, Index
                'mémorise pour annulation éventuelle
                ProgAnnulationAjoutDonnée Tag, NewDonnée, Donnée, Module.Niveau(Index + PREMIER_NIVEAU_DISPOSITIONS), INDEX_AFF_DISPOSITIONS
                'ajoute la donnée dans les dispositions en place
                If D_lstDonnees(Index).ListIndex = -1 Then
                    'à la fin de le liste
                    Donnée.AddEnfant NewDonnée
                    NewIndex = 0
                Else
                    'après la donnée en cours
                    Donnée.AddEnfant NewDonnée, "E" & D_lstDonnees(Index).ItemData(D_lstDonnees(Index).ListIndex)
                    NewIndex = D_lstDonnees(Index).ListIndex + 1
                End If
                'refresh de l'onglet dans toutes les fenêtres du même projet
                RefreshDispositionsActuellesProjet Tag
                'et positionnement sur la donnée collée
                D_lstDonnees(Index).ListIndex = NewIndex
                RefreshBoutonsDispositionsActuellesProjet Tag
                Projet.EstModifié
                HourGlass "hide"
            End If
    End Select
    
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub D_lstDonnees_KeyPress(Index As Integer, keyascii As Integer)
    If keyascii = 43 And D_btnAjouterDonnee(Index).Visible Then
        D_btnAjouterDonnee(Index).Value = True
    End If
End Sub

Private Sub D_lstDonnees_LostFocus(Index As Integer)
    D_lblNomNiveau(Index).BackColor = QBColor(QBCOLOR_GRIS)
End Sub


Private Sub D_lstDonnees_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Liste des éléments de niveau indiqué à gauche"
End Sub

Private Sub D_txtDonnee_GotFocus(Index As Integer)
    'menu edition
    CouperCopierCollerEffacer Projet.Modifiable, True, True, True, True
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab
End Sub

Private Sub D_txtDonnee_KeyPress(Index As Integer, keyascii As Integer)
    keyascii = 0
End Sub


Private Sub D_txtDonnee_LostFocus(Index As Integer)
    'menu edition
    CouperCopierCollerEffacer Projet.Modifiable, False, False, False, False
End Sub


Private Sub D_txtDonnee_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Description de l'élément sélectionné dans la liste à gauche"
End Sub

Private Sub E_btnAjouterDonnee_Click(Index As Integer)

Dim dNew As New Donnee
Dim Etape As Donnee
Dim Sujet As Donnee
Dim NewIndex As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    'nombre maximum d'étapes atteint
    If Not bLicenceOk And E_lstDonnees(Index).ListCount = NB_MAX_ETAPES_EVALUATION Then
        ErreurUserBox GetChaineCrLf("M14"), MB_ICONSTOP
        Exit Sub
    End If

    HourGlass "show"

    'nouvelle donnée
    dNew.id = "E" & Projet.NewId
    If formAjoutDonnée.AjouterDonnée(Element:=dNew, chCaption:="Ajout - " & E_lblNomNiveau(Index).Caption, Niveau:=Index + PREMIER_NIVEAU_ETAPES_ET_SUJETS, Affichage:=0, Assistance:=ASSISTANCE_SUGGESTIONS, EvaluerCriticité:=False, ParentDansExistant:=Nothing, SujetAide:=40 + Index) Then
        Select Case Index
            Case 0
                'mémorise l'id de la donnée ajoutée pour annulation d'ajout
                ProgAnnulationAjoutEtape Tag, dNew, Module.Niveau(NIVEAU_ETAPE)
                'une étape de plus
                If E_lstDonnees(Index).ListIndex = -1 Then
                    'ajoutée en fin de liste
                    Projet.AddEtape dNew
                    NewIndex = 0
                Else
                    'ajoutée après l'élément courant
                    Set Etape = EtapeEnCours(INDEX_AFF_ETAPES_ET_SUJETS)
                    Projet.AddEtape dNew, AfterKey:=Etape.id
                    NewIndex = E_lstDonnees(Index).ListIndex + 1
                End If
                'refresh de la liste des étapes de cet onglet (dans toutes les fenêtres
                'du même projet)
                RefreshListeEtapesProjet E_lstDonnees(Index), Tag, Index
                'refresh de la liste des étapes dans les autres onglets (dans toutes les
                'fenêtres du même projet)
                RefreshListeEtapesProjet lstEtapes(INDEX_AFF_DISPOSITIONS), Tag, INDEX_AFF_DISPOSITIONS
                RefreshListeEtapesProjet lstEtapes(INDEX_AFF_ARBRE), Tag, INDEX_AFF_ARBRE
            Case 1
                Set Etape = EtapeEnCours(INDEX_AFF_ETAPES_ET_SUJETS)
                'mémorise l'id de la donnée ajoutée pour annulation d'ajout
                ProgAnnulationAjoutDonnée Tag, dNew, Etape, Module.Niveau(NIVEAU_SUJET), INDEX_AFF_ETAPES_ET_SUJETS
                'un sujet de plus
                If E_lstDonnees(Index).ListIndex = -1 Then
                    'ajouté en fin de liste
                    Projet.AddSujet Etape, dNew
                    NewIndex = 0
                Else
                    'ajouté après l'élément courant
                    Set Sujet = SujetEnCours(INDEX_AFF_ETAPES_ET_SUJETS)
                    Projet.AddSujet Etape, dNew, Sujet.id
                    NewIndex = E_lstDonnees(Index).ListIndex + 1
                End If
                'refresh de la liste des sujets de cet onglet (dans toutes les fenêtres du même projet)
                RefreshListeSujetsProjet E_lstDonnees(Index), Etape, Tag, Index, INDEX_AFF_ETAPES_ET_SUJETS
                'refresh de la liste des sujets dans les autres onglets (dans toutes les fenêtres du même projet)
                RefreshListeSujetsProjet lstSujets(INDEX_AFF_DISPOSITIONS), Etape, Tag, INDEX_AFF_DISPOSITIONS, INDEX_AFF_DISPOSITIONS
                RefreshListeSujetsProjet lstSujets(INDEX_AFF_ARBRE), Etape, Tag, INDEX_AFF_ARBRE, INDEX_AFF_ARBRE
        End Select
        'se positionne sur l'étape ou le sujet ajouté
        E_lstDonnees(Index).ListIndex = NewIndex
        RefreshBoutonsEtapesSujetsProjet Tag
        'refresh des boutons d'accès aux commentaires des deux autres onglets
        RefreshBoutonsDispositionsActuellesProjet Tag
        RefreshBoutonsArbreHACCPProjet Tag
        MetAJourMenus
    
    End If
    E_lstDonnees(Index).SetFocus
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub


Private Sub E_btnAjouterDonnee_GotFocus(Index As Integer)
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub E_btnAjouterDonnee_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour ajouter un élément dans la liste de ce niveau"
End Sub

Private Sub E_btnDocuments_Click(Index As Integer)
        
    AfficherMenuDocuments Me, DonnéeCliquée(INDEX_AFF_ETAPES_ET_SUJETS, Index), Projet.RépertoireDocuments
    E_lstDonnees(Index).SetFocus
    
End Sub

Private Sub E_btnDocuments_GotFocus(Index As Integer)
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub E_btnDocuments_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour afficher la liste des documents associés à l'élément sélectionné"
End Sub

Private Sub E_lstDonnees_Click(Index As Integer)

Dim Donnée As Donnee
Dim IndexAff As Integer
Dim i As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    IndexAff = INDEX_AFF_ETAPES_ET_SUJETS
    
    'commentaire de la donnée cliquée
    Set Donnée = DonnéeCliquée(IndexAff, Index)
    E_txtDonnee(Index).Text = Donnée.Commentaire
    
    If Index < 1 Then
        'enfants de la donnée cliquée
        Dim IndexEnfant As Integer
        IndexEnfant = Index + 1
        E_lstDonnees(IndexEnfant).clear
        For i = 1 To Donnée.EnfantsCount
            E_lstDonnees(IndexEnfant).AddItem Donnée.Enfant(i).Titre
            E_lstDonnees(IndexEnfant).ItemData(E_lstDonnees(IndexEnfant).NewIndex) = suppfirstchar(Donnée.Enfant(i).id, 1)
        Next
        If E_lstDonnees(IndexEnfant).ListCount > 0 Then
            E_lstDonnees(IndexEnfant).ListIndex = 0
        Else
            E_txtDonnee(IndexEnfant).Text = ""
        End If
    End If
    'menu edition
    CouperCopierCollerEffacer Projet.Modifiable, False, False, False, True
    RefreshBoutonsEtapesSujets
    MetAJourMenus

    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub E_lstDonnees_DblClick(Index As Integer)

Dim Donnée As Donnee
Dim i As Integer
Dim Etape As Donnee

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    If Projet.NonModifiable Then
        Exit Sub
    End If
    
    HourGlass "show"

    'met dans Donnée la donnée à modifier
    Set Donnée = Projet.Etape("E" & E_lstDonnees(0).ItemData(E_lstDonnees(0).ListIndex))
    For i = 1 To Index
        Set Donnée = Donnée.Enfant("E" & E_lstDonnees(i).ItemData(E_lstDonnees(i).ListIndex))
    Next
    
    'fenêtre d'ajout/modification
    If formAjoutDonnée.ModifierDonnée(Element:=Donnée, chCaption:="Modification - " & E_lblNomNiveau(Index).Caption, Niveau:=Index + PREMIER_NIVEAU_ETAPES_ET_SUJETS, Affichage:=INDEX_AFF_ETAPES_ET_SUJETS, Assistance:=ASSISTANCE_SUGGESTIONS, EvaluerCriticité:=False, ParentDansExistant:=Nothing, SujetAide:=40 + Index) Then
        'le titre ou le commentaire de l'étape a changé
        Select Case Index
            Case 0
                'refresh de la liste des étapes de cet onglet (dans toutes les fenêtres
                'du même projet)
                RefreshListeEtapesProjet E_lstDonnees(Index), Tag, Index
                'refresh de la liste des étapes dans les autres onglets (dans toutes les
                'fenêtres du même projet)
                RefreshListeEtapesProjet lstEtapes(INDEX_AFF_DISPOSITIONS), Tag, INDEX_AFF_DISPOSITIONS
                RefreshListeEtapesProjet lstEtapes(INDEX_AFF_ARBRE), Tag, INDEX_AFF_ARBRE
                'refresh de la liste des dangers et sujets/dangers
                RefreshDangersProjet Tag
            Case 1
                'refresh de la liste des sujets de cet onglet (dans toutes les fenêtres du même projet)
                Set Etape = EtapeEnCours(INDEX_AFF_ETAPES_ET_SUJETS)
                RefreshListeSujetsProjet E_lstDonnees(Index), Etape, Tag, Index, INDEX_AFF_ETAPES_ET_SUJETS
                'refresh de la liste des sujets dans les autres onglets (dans toutes les fenêtres du même projet)
                RefreshListeSujetsProjet lstSujets(INDEX_AFF_DISPOSITIONS), Etape, Tag, INDEX_AFF_DISPOSITIONS, INDEX_AFF_DISPOSITIONS
                RefreshListeSujetsProjet lstSujets(INDEX_AFF_ARBRE), Etape, Tag, INDEX_AFF_ARBRE, INDEX_AFF_ARBRE
                'refresh de la liste des dangers et sujets/dangers
                RefreshDangersProjet Tag
        End Select
        'refresh des boutons de l'onglet de toute les fenêtres du même projet
        RefreshBoutonsEtapesSujetsProjet Tag
        'refresh des boutons d'accès aux commentaires des deux autres onglets
        RefreshBoutonsDispositionsActuellesProjet Tag
        RefreshBoutonsArbreHACCPProjet Tag
        MetAJourMenus
    End If

    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub


Private Sub E_lstDonnees_GotFocus(Index As Integer)
    E_lblNomNiveau(Index).BackColor = QBColor(QBCOLOR_CYAN_CLAIR)
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab
End Sub

Private Sub E_lstDonnees_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)

Dim chMessage As String
Dim cr As Integer
Dim Etape As Donnee
Dim Sujet As Donnee
Dim Donnée As Donnee
Dim i As Integer
Dim BeforeKey As Variant
                                
    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    Select Case KeyCode
        Case KEY_DEL
            'suppression
            If Projet.NonModifiable Then
                'interdite quand le projet n'est pas modifiable
                Exit Sub
            End If
            If E_lstDonnees(Index).ListIndex <> -1 Then
                chMessage = InsereChaine(InsereChaine(InsereChaine(InsereChaine(GetChaineCrLf("M2"), Module.Niveau(Index + 1)), E_lstDonnees(Index)), Module.AffichageTitre(5)), Module.AffichageTitre(6))
                cr = MsgBox(chMessage, MB_ICONQUESTION Or MB_YESNO, NomApplication)
                If cr = IDYES Then
                    Set Etape = EtapeEnCours(INDEX_AFF_ETAPES_ET_SUJETS)
                    Select Case Index
                        Case 0
                            'suppression de l'étape (et des sujets, sujets/dangers et arbre des dispositions en place avec)
                            If E_lstDonnees(Index).ListIndex < E_lstDonnees(Index).ListCount - 1 Then
                                BeforeKey = "E" & E_lstDonnees(Index).ItemData(E_lstDonnees(Index).ListIndex + 1)
                            Else
                                BeforeKey = ""
                            End If
                            SupprimerEtape Etape, BeforeKey
                            'refresh des listes d'étapes et de sujets dans l'onglet
                            RefreshEtapesEtSujetsProjet Tag
                            'refresh des dangers et sujets/dangers
                            RefreshDangers
                            'refresh des listes et sujets dans les autres onglets 'Dispositions' et 'Arbre HACCP'
                            RefreshDispositionsActuellesProjet Tag
                            RefreshArbreHACCPProjet Tag
                        Case 1
                            'suppression du sujet (et des sujets/danger associés, et de l'arbre des dispositions en place)
                            Set Sujet = SujetEnCours(INDEX_AFF_ETAPES_ET_SUJETS)
                            If E_lstDonnees(Index).ListIndex < E_lstDonnees(Index).ListCount - 1 Then
                                BeforeKey = "E" & E_lstDonnees(Index).ItemData(E_lstDonnees(Index).ListIndex + 1)
                            Else
                                BeforeKey = ""
                            End If
                            SupprimerSujet Etape, Sujet, BeforeKey
                            'refresh de la liste de sujet dans l'onglet de toutes les fenêtres du même projet
                            RefreshListeSujetsProjet E_lstDonnees(Index), Etape, Tag, Index, INDEX_AFF_ETAPES_ET_SUJETS
                            'refresh des dangers et sujets/dangers
                            RefreshDangersProjet Tag
                            'refresh des listes et sujets dans les autres onglets 'Dispositions' et 'Arbre HACCP'
                            RefreshDispositionsActuellesProjet Tag
                            RefreshArbreHACCPProjet Tag
                    End Select
                    RefreshBoutonsEtapesSujets
                    Projet.EstModifié
                End If
            End If
        Case KEY_CUT
            'copie et suppression
            If Projet.NonModifiable Then
                'interdite quand le projet n'est pas modifiable
                Exit Sub
            End If
        Case KEY_COPY
            'donnée à copier
            If E_lstDonnees(Index).ListIndex <> -1 Then
                HourGlass "show"
                Set Donnée = DonnéeCliquée(INDEX_AFF_ETAPES_ET_SUJETS, Index)
                Donnée.CopyToClipboard INDEX_AFF_ETAPES_ET_SUJETS, Index + PREMIER_NIVEAU_ETAPES_ET_SUJETS, IDENTIFICATION_CLIPBOARD
                HourGlass "hide"
            End If
        Case KEY_PASTE
            If Projet.NonModifiable Then
                'seulement si projet modifiable
                Exit Sub
            End If
    End Select
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub


Private Sub E_lstDonnees_KeyPress(Index As Integer, keyascii As Integer)
    If keyascii = 43 And E_btnAjouterDonnee(Index).Visible Then
        E_btnAjouterDonnee(Index).Value = True
    End If
End Sub

Private Sub E_lstDonnees_LostFocus(Index As Integer)
    E_lblNomNiveau(Index).BackColor = QBColor(QBCOLOR_GRIS)
End Sub

Private Sub E_lstDonnees_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Liste des éléments de niveau indiqué à gauche"
End Sub

Private Sub E_txtDonnee_GotFocus(Index As Integer)
    'menu edition
    CouperCopierCollerEffacer Projet.Modifiable, True, True, True, True
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab
End Sub

Private Sub E_txtDonnee_KeyPress(Index As Integer, keyascii As Integer)
    keyascii = 0
End Sub


Private Sub E_txtDonnee_LostFocus(Index As Integer)
    'menu edition
    CouperCopierCollerEffacer Projet.Modifiable, False, False, False, False
End Sub

Private Sub E_txtDonnee_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Description de l'élément sélectionné dans la liste à gauche"
End Sub

Private Sub Form_Activate()

Dim i As Integer

    ActionLimitée = True
    FormMain.btnFenetre(SSTab1.Tab).Value = True
    For i = 0 To Module.AffichagesCount - 1
        FormMain.MnuAffichage(i).Checked = False
    Next
    FormMain.MnuAffichage(SSTab1.Tab).Checked = True
    ActionLimitée = False

    MetAJourMenus

End Sub


Private Sub Form_Load()

Dim i As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    'positionne la fenêtre
    Left = (Forms.Count - 2) * 330
    Top = Left
    Width = FormMain.ScaleWidth - Left
    Height = FormMain.ScaleHeight - Top
        
    'marque la fenêtre avec la clé du projet qu'elle contient
    Tag = CléProjet

    'hauteur des onglets
    SSTab1.TabHeight = IIf(bAfficherOnglets, 300, 1)

    'initialisations de la fenêtre relatives au module
    For i = 0 To Module.AffichagesCount - 1
        SSTab1.Tab = i
        SSTab1.TabCaption(i) = " " & Module.AffichageTitre(i + 1) & " "
        lblCommentaire(i).Caption = RestoreChaineCrLF(Module.AffichageCommentaire(i + 1))
    Next
    For i = 0 To INDEX_MAX_ETAPES_ET_SUJETS
        E_lblNomNiveau(i).Caption = Module.NiveauAvecBlanc(i + PREMIER_NIVEAU_ETAPES_ET_SUJETS)
    Next
    For i = 0 To INDEX_MAX_DISPOSITIONS
        D_lblNomNiveau(i).Caption = Module.NiveauAvecBlanc(i + PREMIER_NIVEAU_DISPOSITIONS)
    Next
    For i = 0 To INDEX_MAX_ARBRE_HACCP
        A_lblNomNiveau(i).Caption = Module.NiveauAvecBlanc(i + PREMIER_NIVEAU_ARBRE_HACCP)
    Next
    LabelEtape(0).Caption = Module.Niveau(NIVEAU_ETAPE) & " :"
    LabelEtape(1).Caption = LabelEtape(0).Caption
    LabelSujet(0).Caption = Module.Niveau(NIVEAU_SUJET) & " :"
    LabelSujet(1).Caption = LabelSujet(0).Caption
    LabelDanger(1).Caption = Module.Niveau(3) & " :"
    
    'initialisation du spread de SujetsDangers
    With SpreadSujetsDangers
        .Row = 0
        .Col = 2
        .Text = Module.Niveau(NIVEAU_ETAPE)
        .Col = 3
        .Text = Module.Niveau(NIVEAU_SUJET)
        .Col = 6
        .Text = "Type"
    End With
    'initialisation du spread documentation
    With SpreadDocumentation
        .Col = 1
        .ColHidden = True
    End With
    'initialisation du spread équipe
    With SpreadEquipe
    End With

    'objet projet associé à la feuille
    Set Projet = Projets(Tag)
        
    'une fenêtre de plus ouverte sur le projet
    Projet.AjouterFenêtre
    
    'affiche les données du Projet
    TransfertProjetDansOnglets
    SSTab1.Tab = Projet.IndexAffichage
    ChangeTitreFenetre
            
    'le projet est marqué non modifié malgré les changements effectués dans cette initialisation
    Projet.NonModifié
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Sub TransfertProjetDansOnglets()

    'onglet Paramètres
    With Projet
        txtTitre.Text = .Titre
        txtAuteur.Text = .Auteur
        txtRéférence.Text = .Référence
        lblDateCréation.Caption = .DateCréation
        lblDateModification.Caption = .DateModification
        txtCommentaire.Text = .Commentaire
    End With

    'onglet équipe
    RefreshEquipe
    
    'onglet documentation
    RefreshDocumentation

    'onglet Etapes et sujets
    RefreshEtapesEtSujets
    
    'onglet Dispositions en place
    RefreshDispositionsActuelles
    
    'onglet Dangers
    RefreshDangers
    
    'onglet Arbre HACCP
    RefreshArbreHACCP
    
End Sub


Public Sub RefreshEquipe()

Dim i As Integer
Dim j As Integer
Dim n As Integer

    With SpreadEquipe
        .Row = 1
        .Row2 = .MaxRows
        .Col = 1
        .Col2 = .MaxCols
        .BlockMode = True
        .Action = SS_ACTION_CLEAR_TEXT
        .BlockMode = False
        .Col = 1
    End With
    n = Projet.PersonnesCount
    For i = 1 To n
        With SpreadEquipe
            .Row = i
            .Col = 1
            .Text = Projet.PersonneNom(i)
            .Col = 2
            .Text = Projet.PersonneFonction(i)
        End With
    Next
    
End Sub



Public Sub RefreshDocumentation()

Dim i As Integer
Dim j As Integer
Dim n As Integer

    With SpreadDocumentation
        .MaxRows = Projet.DocumentsCount + 1
        .Row = 1
        .Row2 = .MaxRows
        .Col = 1
        .Col2 = .MaxCols - 1
        .BlockMode = True
        .Action = SS_ACTION_CLEAR_TEXT
        .BlockMode = False
        .Col = 1
        n = Projet.DocumentsCount
        .Row = 1
        .Col = 4
        .TypeButtonPicture = LoadPicture("")
        .TypeButtonPictureDown = LoadPicture("")
        For i = 1 To n
            .Row = i
            .Col = 1
            .Text = Projet.DocumentFichier(i)
            .Col = 2
            .Text = GetFichierSansChemin(Projet.DocumentFichier(i))
            .Col = 3
            .Text = Projet.DocumentTitre(i)
            .Col = 4
            .Lock = Projet.DocumentsCount = 0
            If .Lock Then
                .TypeButtonPicture = LoadPicture("")
                .TypeButtonPictureDown = LoadPicture("")
            Else
                .TypeButtonPicture = picFleche.Picture
                .TypeButtonPictureDown = picFleche.Picture
            End If
        Next
        .Col = 4
        While i <= .MaxRows
            .Row = i
            .Lock = True
            .TypeButtonPicture = LoadPicture("")
            .TypeButtonPictureDown = LoadPicture("")
            i = i + 1
        Wend
    End With
    RefreshBoutonsDocumentation
    
End Sub



Private Sub ChangeTitreFenetre()

Dim Numero As String

    Numero = GetItemDansChaineSep(Caption, 2, ":")
    If Numero <> "" Then
        If Projet.FichierProjet <> "" Then
            Caption = UCase$(GetFichierSansChemin(Projet.FichierProjet)) & " (" & txtTitre.Text & ") - " & Trim$(SSTab1.TabCaption(SSTab1.Tab)) & ":" & Numero
        Else
            Caption = UCase$(Tag) & " (" & txtTitre.Text & ") - " & Trim$(SSTab1.TabCaption(SSTab1.Tab)) & ":" & Numero
        End If
    Else
        If Projet.FichierProjet <> "" Then
            Caption = UCase$(GetFichierSansChemin(Projet.FichierProjet)) & " (" & txtTitre.Text & ") - " & Trim$(SSTab1.TabCaption(SSTab1.Tab))
        Else
            Caption = UCase$(Tag) & " (" & txtTitre.Text & ") - " & Trim$(SSTab1.TabCaption(SSTab1.Tab))
        End If
    End If
End Sub

Public Sub MnuFichierAffichageClick(ByVal indextab As Integer)

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    ActionLimitée = True
    Dim i As Integer
    For i = 0 To Module.AffichagesCount - 1
        FormMain.btnFenetre(i).Value = False
        FormMain.MnuAffichage(i).Checked = False
    Next
    FormMain.btnFenetre(indextab).Value = True
    FormMain.MnuAffichage(indextab).Checked = True
    SSTab1.Tab = indextab
    ActionLimitée = False
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub


Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

Dim chMessage As String
Dim FileName As String
Dim Reponse As Integer

    If Projet.Modifié And Projet.NbFenêtres = 1 Then

        chMessage = InsereChaine(GetChaineCrLf("M3"), IIf(Projet.Titre = "", Tag, "'" & Projet.Titre & "'"))
        Reponse = MsgBox(chMessage, MB_ICONQUESTION Or MB_YESNOCANCEL, NomApplication)
        Select Case Reponse
            Case IDYES
                Cancel = Not MnuFichierEnregistrerClick()
            Case IDNO
            Case IDCANCEL
                Cancel = True
        End Select

    End If
    
End Sub

Private Sub Form_Resize()

    If WindowState <> 1 Then
        SSTabResize
    End If
    
End Sub

Public Function MnuFichierEnregistrerClick() As Integer

Dim FileName As String
Dim cr As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    If Projet.FichierProjet = "" Then
        ' Le fichier n'a pas encore été enregistré. Fournit le nom de fichier, puis appelle
        ' la procédure d'enregistrement.
        If Not bLicenceOk Then
            FileName = "demo.hac"
        End If
        FileName = GetFilename(FormMain.CMDialog1, FileName)
    Else
        ' La légende contient le nom du fichier ouvert.
        FileName = Projet.FichierProjet
    End If
    ' Appelle la procédure d'enregistrement. Si la zone Nom de fichier
    ' est vide, l'utilisateur a sélectionné Annuler dans la boîte de
    ' dialogue Enregistrer sous. Sinon, enregistre le fichier.
    If FileName <> "" Then
        If Not bLicenceOk Then
            If UCase$(FileName) <> UCase$(RepertoireApplication & "\demo.hac") Then
                cr = MsgBox(InsereChaine(GetChaineCrLf("M15"), UCase$(RepertoireApplication & "\demo.hac")), MB_ICONQUESTION Or MB_YESNO, NomApplication)
                If cr = IDYES Then
                    FileName = UCase$(RepertoireApplication & "\demo.hac")
                Else
                    Exit Function
                End If
            End If
        End If
        HourGlass "show"
        If Projet.RépertoireDocuments = "" Then
            Projet.RépertoireDocuments = GetCheminSansFichier(FileName)
        End If
        'sauvegarde
        Projet.Erreur = 0
        Projet.SaveBack FormMain.DwStorage1, FileName
        If Projet.Erreur = 0 Then
            'refresh date de modification
            RefreshParamètresProjet Tag
            'liste des derniers fichiers ouverts
            MRUListe.PutFirst FileName
            ChangeTitreFenetre
            MetAJourMenus
            HourGlass "hide"
        Else
            ErreurUserBox InsereChaine(GetChaineCrLf("M26"), FileName), MB_ICONSTOP
        End If
        HourGlass "hide"
    End If
    MnuFichierEnregistrerClick = FileName <> ""
    
    Exit Function

err_inattendue:
    GestionErreurInattendue
    
End Function

Public Sub MnuFichierEnregistrerSousClick()

Dim SaveFileName As String
Dim DefaultName As String
Dim cr As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    DefaultName = Projet.FichierProjet
    If Projet.FichierProjet = "" Then
        ' Le fichier n'a pas encore été enregistré. Fournit le nom de fichier, puis appelle
        ' la procédure d'enregistrement.
        If Not bLicenceOk Then
            SaveFileName = "demo.hac"
        Else
            SaveFileName = GetFilename(FormMain.CMDialog1, "SansNom.hac")
        End If
        If SaveFileName <> "" Then
            If Not bLicenceOk Then
                If UCase$(SaveFileName) <> UCase$(RepertoireApplication & "\demo.hac") Then
                    cr = MsgBox(InsereChaine(GetChaineCrLf("M15"), UCase$(RepertoireApplication & "\demo.hac")), MB_ICONQUESTION Or MB_YESNO, NomApplication)
                    If cr = IDYES Then
                        SaveFileName = UCase$(RepertoireApplication & "\demo.hac")
                    Else
                        Exit Sub
                    End If
                End If
            End If
            'sauvegarde
            Projet.Erreur = 0
            Projet.SaveBack FormMain.DwStorage1, SaveFileName
            If Projet.Erreur = 0 Then
                'refresh date de modification
                RefreshParamètresProjet Tag
                'liste des derniers fichiers ouverts
                MRUListe.PutFirst SaveFileName
            Else
                ErreurUserBox InsereChaine(GetChaineCrLf("M26"), SaveFileName), MB_ICONSTOP
            End If
        End If
    Else
        ' La légende contient le nom du fichier ouvert.
        If Not bLicenceOk Then
            SaveFileName = "demo.hac"
        Else
            SaveFileName = GetFilename(FormMain.CMDialog1, DefaultName)
        End If
        If SaveFileName <> "" Then
            'mode d'évaluation: sauvegarder sous demo.hac
            If Not bLicenceOk Then
                If UCase$(SaveFileName) <> UCase$(RepertoireApplication & "\demo.hac") Then
                    cr = MsgBox(InsereChaine(GetChaineCrLf("M15"), UCase$(RepertoireApplication & "\demo.hac")), MB_ICONQUESTION Or MB_YESNO, NomApplication)
                    If cr = IDYES Then
                        SaveFileName = UCase$(RepertoireApplication & "\demo.hac")
                    Else
                        Exit Sub
                    End If
                End If
            End If
            'sauvegarde
            Projet.SaveBack FormMain.DwStorage1, SaveFileName
            'refresh date de modification
            RefreshParamètresProjet Tag
            'liste des derniers fichiers ouverts
            MRUListe.PutFirst SaveFileName
            ChangeTitreFenetre
        End If
    End If

    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub


Private Sub Form_Unload(Cancel As Integer)
    
Dim CléProjet As String

    HourGlass "show"
    
    'une fenêtre de moins ouverte sur le projet
    Projets(Tag).OterFenêtre
    
    'ote le projet de la collection si c'est la dernière fenêtre
    'ouverte sur ce projet
    If Projets(Tag).NbFenêtres = 0 Then
        Projets.Remove Tag
    End If

    If Projets.Count = 0 Then
        'menus réduits quand il n'y a plus de projet
        MetAJourMenus bMenusRéduits:=True
    Else
        CléProjet = Tag
        Tag = ""
        NumeroteFenetresProjet CléProjet
    End If
    
    'prépare une action MetAJourMenus après la fermeture de la fenêtre
    FormMain.TimerAction.Tag = "MetAJourMenus"
    FormMain.TimerAction.Enabled = True
    
    HourGlass "hide"
    
End Sub


Private Sub lblDateCréation_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Date à laquelle le projet HACCP a été créé"
End Sub


Private Sub lblDateModification_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Date de la dernière modification du projet HACCP"
End Sub


Private Sub lstEtapes_Click(IndexAff As Integer)

Dim idEtape As Long
Dim Etape As Donnee

    idEtape = lstEtapes(IndexAff).ItemData(lstEtapes(IndexAff).ListIndex)
    Set Etape = Projet.Etape("E" & idEtape)
    'sujets et dangers
    RefreshListeSujets lstSujets(IndexAff), Etape
    Select Case IndexAff
        Case INDEX_AFF_DISPOSITIONS
            RefreshBoutonsDispositionsActuelles
        Case INDEX_AFF_ARBRE
            RefreshBoutonsArbreHACCP
    End Select

End Sub


Private Sub lstEtapes_GotFocus(Index As Integer)
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub lstSujets_Click(IndexAff As Integer)

Dim idEtape As Long
Dim idSujet As Long
Dim Etape As Donnee
Dim Sujet As Donnee
Dim i As Integer

    'étape
    idEtape = lstEtapes(IndexAff).ItemData(lstEtapes(IndexAff).ListIndex)
    Set Etape = Projet.Etape("E" & idEtape)
    'sujet
    idSujet = lstSujets(IndexAff).ItemData(lstSujets(IndexAff).ListIndex)
    Set Sujet = Etape.Enfant("E" & idSujet)
    
    Select Case IndexAff
        Case INDEX_AFF_DISPOSITIONS
            'mesures préventives
            Dim idMesure As Long
            If D_lstDonnees(0).ListIndex <> -1 Then
                'mémorise la mesure préventive sélectionnée pour le restituer ensuite
                idMesure = D_lstDonnees(0).ItemData(D_lstDonnees(0).ListIndex)
            End If
            D_lstDonnees(0).clear
            For i = 1 To Sujet.EnfantsCount
                D_lstDonnees(0).AddItem Sujet.Enfant(i).Titre
                D_lstDonnees(0).ItemData(D_lstDonnees(0).NewIndex) = suppfirstchar(Sujet.Enfant(i).id, 1)
            Next
            If D_lstDonnees(0).ListCount > 0 Then
                If idMesure <> -1 Then
                    'se repositionne sur l'élément précédemment sélectionné
                    i = PositionDataDansListe(D_lstDonnees(0), idMesure)
                    If i <> -1 Then
                        D_lstDonnees(0).ListIndex = i
                    Else
                        D_lstDonnees(0).ListIndex = 0
                    End If
                Else
                    D_lstDonnees(0).ListIndex = 0
                End If
            Else
                D_txtDonnee(0).Text = ""
            End If
            RefreshBoutonsDispositionsActuelles
        Case INDEX_AFF_ARBRE
            'liste des sujet/dangers
            RefreshListeSujetsDangers lstSujetsDangers(INDEX_AFF_ARBRE), Etape, Sujet
            RefreshBoutonsArbreHACCP
    End Select
    
    
End Sub


Private Sub lstSujets_GotFocus(Index As Integer)
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub lstSujetsDangers_Click(IndexAff As Integer)

Dim idEtape As Long
Dim idSujet As Long
Dim idSujetDanger As Long
Dim Etape As Donnee
Dim Sujet As Donnee
Dim SujetDanger As SujetDanger
Dim i As Integer

    'étape
    idEtape = lstEtapes(IndexAff).ItemData(lstEtapes(IndexAff).ListIndex)
    Set Etape = Projet.Etape("E" & idEtape)
    'sujet
    idSujet = lstSujets(IndexAff).ItemData(lstSujets(IndexAff).ListIndex)
    Set Sujet = Etape.Enfant("E" & idSujet)
    'sujet/Danger
    idSujetDanger = lstSujetsDangers(IndexAff).ItemData(lstSujetsDangers(IndexAff).ListIndex)
    Set SujetDanger = Projet.SujetDanger("D" & idSujetDanger)
    
    'mesures préventives
    Dim idPointAMaitriser As Long
    If A_lstDonnees(0).ListIndex <> -1 Then
        'mémorise le point à maitriser sélectionné pour le restituer ensuite
        idPointAMaitriser = A_lstDonnees(0).ItemData(A_lstDonnees(0).ListIndex)
    End If
    A_lstDonnees(0).clear
    For i = 1 To SujetDanger.EnfantsCount
        A_lstDonnees(0).AddItem IIf(SujetDanger.Enfant(i).Criticité = "OUI", Chr$(169) & " ", "") & SujetDanger.Enfant(i).Titre
        A_lstDonnees(0).ItemData(A_lstDonnees(0).NewIndex) = suppfirstchar(SujetDanger.Enfant(i).id, 1)
    Next
    If A_lstDonnees(0).ListCount > 0 Then
        If idPointAMaitriser <> -1 Then
            'se repositionne sur l'élément précédemment sélectionné
            i = PositionDataDansListe(A_lstDonnees(0), idPointAMaitriser)
            If i <> -1 Then
                A_lstDonnees(0).ListIndex = i
            Else
                A_lstDonnees(0).ListIndex = 0
            End If
        Else
            A_lstDonnees(0).ListIndex = 0
        End If
    Else
        A_txtDonnee(0).Text = ""
    End If
    RefreshBoutonsArbreHACCP

End Sub


Private Sub lstSujetsDangers_GotFocus(Index As Integer)
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub Panel_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


Private Sub SpreadDangers_ButtonClicked(ByVal Col As Long, ByVal Row As Long, ByVal ButtonDown As Long)

    With SpreadDangers
        If Col = 5 Then
            .Row = .ActiveRow
            .Col = 1
            If .Text <> "" Then
                AfficherMenuDocuments Me, Projet.Danger(.Text), Projet.RépertoireDocuments
            End If
        End If
    End With
    
End Sub

Private Sub SpreadDangers_Click(ByVal Col As Long, ByVal Row As Long)

    With SpreadDangers
        .Row = Row
        .Col = 1
        RefreshSujetsDangers .Text
        If Col = 5 Then
            .Row = .ActiveRow
            .Col = 1
            If .Text <> "" Then
                AfficherMenuDocuments Me, Projet.Danger(.Text), Projet.RépertoireDocuments
            End If
        End If
    End With
    RefreshBoutonsDangers

End Sub

Private Sub SpreadDangers_DblClick(ByVal Col As Long, ByVal Row As Long)

    If Col < 5 Then
        btnAjouterDanger_Click
    End If
        
End Sub

Private Sub SpreadDangers_GotFocus()
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab
    CouperCopierCollerEffacer Projet.Modifiable, False, False, False, True
End Sub

Private Sub SpreadDangers_KeyDown(KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case KEY_DEL
            btnSupprimerDanger_Click
    End Select
End Sub

Private Sub SpreadDangers_KeyPress(keyascii As Integer)

    If keyascii = Asc(" ") Then
        With SpreadDangers
            If .ActiveCol = 5 Then
                .Row = .ActiveRow
                .Col = 1
                If .Text <> "" Then
                    AfficherMenuDocuments Me, Projet.Danger(.Text), Projet.RépertoireDocuments
                End If
            End If
        End With
    End If
            

End Sub

Private Sub SpreadDangers_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Liste des dangers du projet HACCP"
End Sub



Private Sub SpreadDocumentation_ButtonClicked(ByVal Col As Long, ByVal Row As Long, ByVal ButtonDown As Long)

    If Col = 4 Then
        With SpreadDocumentation
            .Row = Row
            .Col = 1
            OuvrirDocument .Text, Projet.RépertoireDocuments
        End With
    End If

End Sub

Private Sub SpreadDocumentation_Click(ByVal Col As Long, ByVal Row As Long)

    With SpreadDocumentation
        If Col = 4 Then
            .Col = Col
            .Row = Row
            If .Lock = False Then
                .Col = 1
                OuvrirDocument .Text, Projet.RépertoireDocuments
            End If
        End If
    End With

End Sub


Private Sub SpreadDocumentation_DblClick(ByVal Col As Long, ByVal Row As Long)

    If Col <> 4 Then
        If Projet.Modifiable Then
            btnAjouterDocumentation_Click
        End If
    Else
        SpreadDocumentation_ButtonClicked Col, Row, 0
    End If

End Sub

Private Sub SpreadDocumentation_GotFocus()
    SpreadDocumentation.Tag = ""
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab
End Sub


Private Sub SpreadDocumentation_KeyDown(KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case KEY_DEL
            btnSupprimerDocumentation_Click
    End Select

End Sub


Private Sub SpreadDocumentation_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Fichiers documents constituant la documentation du projet HACCP"
End Sub

Private Sub SpreadEquipe_EditMode(ByVal Col As Long, ByVal Row As Long, ByVal Mode As Integer, ByVal ChangeMade As Boolean)

    If Mode = 1 Then
        With SpreadEquipe
            .Col = Col
            .Row = Row
            .Tag = .Text
        End With
        Exit Sub
    End If

    If Mode = 0 And ChangeMade Then
        ProgAnnulationSaisieSpread Tag, Projet.Equipe.Copy
        TransfertEquipeDansProjet
        RefreshEquipeProjet Tag
        MetAJourMenus
    End If

End Sub


Private Sub SpreadEquipe_GotFocus()
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub


Private Sub SpreadEquipe_KeyPress(keyascii As Integer)
    
    If Projet.NonModifiable Then
        keyascii = 0
        Exit Sub
    End If
    If Not Projet.Modifié Then
        Projet.EstModifié
        MetAJourMenus
    End If

End Sub




Private Sub SpreadEquipe_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Nom et fonction de chaque personne affectée au projet HACCP"
End Sub

Private Sub SpreadSujetsDangers_ButtonClicked(ByVal Col As Long, ByVal Row As Long, ByVal ButtonDown As Long)

Dim idSujetDanger As String

    With SpreadSujetsDangers
        If Col = 9 Then
            .Row = .ActiveRow
            .Col = 1
            idSujetDanger = .Text
            If idSujetDanger <> "" Then
                AfficherMenuDocuments Me, Projet.SujetDanger(idSujetDanger), Projet.RépertoireDocuments
            End If
        End If
    End With

End Sub

Private Sub SpreadSujetsDangers_Click(ByVal Col As Long, ByVal Row As Long)

Dim idSujetDanger As String

    With SpreadSujetsDangers
        If Col = 9 Then
            .Row = .ActiveRow
            .Col = 1
            idSujetDanger = .Text
            If idSujetDanger <> "" Then
                AfficherMenuDocuments Me, Projet.SujetDanger(idSujetDanger), Projet.RépertoireDocuments
            End If
        Else
            RefreshBoutonsDangers
        End If
    End With
    
End Sub

Private Sub SpreadSujetsDangers_DblClick(ByVal Col As Long, ByVal Row As Long)

    If Col <> 8 Then
        If Col <> 9 Then
            btnAjouterSujetDanger_Click
        End If
    Else
        'questionnaire de criticité du danger
        Dim idSujetDanger As String
        Dim SujetDanger As SujetDanger
        Dim idDanger As String
        Dim chTitre As String
        Dim TempQuestCriticité As QuestCriticite
        Dim Criticité As String
        
        'danger en cours
        SpreadDangers.Col = 1
        SpreadDangers.Row = SpreadDangers.ActiveRow
        idDanger = SpreadDangers.Text
        If idDanger <> "" Then
            If Projet.Danger(idDanger).Pertinence <> "" Then
            With SpreadSujetsDangers
                .Row = Row
                .Col = 1
                idSujetDanger = .Text
                If idSujetDanger <> "" Then
                    Set SujetDanger = Projet.SujetDanger(idSujetDanger)
                    chTitre = Module.Niveau(NIVEAU_ETAPE) & " " & Projet.Etape(SujetDanger.Etape).Titre & ", " & _
                              Module.Niveau(NIVEAU_SUJET) & " " & Projet.Etape(SujetDanger.Etape).Enfant(SujetDanger.Sujet).Titre & _
                              ", Nature " & Projet.Danger(SujetDanger.Danger).Nature & _
                              ", Spécificité " & Projet.Danger(SujetDanger.Danger).Spécificité & _
                              ", Type " & SujetDanger.Nom
                    'on travaille sur une copie
                    Set TempQuestCriticité = SujetDanger.QuestCriticité.Copy
                    Criticité = SujetDanger.Criticité
                    If FormQuestCriticité.ExécuterQuestionnaireCriticité(1, chTitre, "Evaluation de la criticité du " & Module.Niveau(3), TempQuestCriticité, Criticité) Then
                        'mémorise le sujet/danger modifié
                        ProgAnnulationModifSujetDanger FormMain.ActiveForm.Tag, SujetDanger, "étape de danger"
                        'SujetDanger à modifier
                        SujetDanger.Criticité = Criticité
                        Set SujetDanger.QuestCriticité = TempQuestCriticité
                        Projet.EstModifié
                        'mise à jour du spread
                        .Col = 9
                        .Text = SujetDanger.Criticité
                        'refresh de l'onglet dans toutes les fenêtres liées au même projet
                        RefreshSujetsDangersProjet Tag, idDanger
                        'refresh de la liste des sujets/dangers de l'onglet arbre HACCP dans toutes les fenêtres associées au projet
                        RefreshListeSujetsDangersProjet lstSujetsDangers(INDEX_AFF_ARBRE), Tag, INDEX_AFF_ARBRE
                        MetAJourMenus
                    End If
                End If
            End With
            End If
        End If
    End If
    
End Sub

Private Sub SpreadSujetsDangers_GotFocus()
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab

End Sub

Private Sub SpreadSujetsDangers_KeyDown(KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case KEY_DEL
            btnSupprimerSujetDanger_Click
    End Select
End Sub

Private Sub SpreadSujetsDangers_KeyPress(keyascii As Integer)

    If keyascii = Asc(" ") Then
        With SpreadSujetsDangers
            If .ActiveCol = 9 Then
                Dim idSujetDanger As String
                .Row = .ActiveRow
                .Col = 1
                idSujetDanger = .Text
                If idSujetDanger <> "" Then
                    AfficherMenuDocuments Me, Projet.SujetDanger(idSujetDanger), Projet.RépertoireDocuments
                End If
            End If
        End With
    End If

End Sub

Private Sub SpreadSujetsDangers_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Liste des étapes auxquelles sont associées les dangers du projet HACCP"
End Sub

Private Sub SSTab1_Click(PreviousTab As Integer)

    MnuFichierAffichageClick SSTab1.Tab
    Panel(PreviousTab).Visible = False
    Panel(SSTab1.Tab).Visible = True
    SSTabResize
    ChangeTitreFenetre
    FocusMémo SSTab1.Tab
    Projet.IndexAffichage = SSTab1.Tab
    
End Sub


Public Sub SSTabResize()

Dim t As Integer
Dim w1 As Integer

    t = SSTab1.Tab

    'change la taille du SSTab
    SSTab1.Visible = False
    SSTab1.Width = ScaleWidth
    SSTab1.Height = ScaleHeight
        
    'change la tailles des controles dans les onglets
    Panel(t).Left = gap
    Panel(t).Top = gap
    Panel(t).Height = maxi(0, SSTab1.Height - SSTab1.TabHeight - 8 * Screen.TwipsPerPixelY)
    Panel(t).Width = maxi(0, SSTab1.Width - 2 * gap)
    ControleContreDroite lblCommentaire(t), Panel(t)
    ControleContreDroite LineSep(t), Panel(t)
    Select Case t
        Case 0
            ControleContreBas txtCommentaire, Panel(t)
            ControleContreDroite txtCommentaire, Panel(t)
            ControleContreDroite txtRéférence, Panel(t)
            ControleContreDroite txtAuteur, Panel(t)
            ControleContreDroite txtTitre, Panel(t)
        Case 1
            ControleContreBas SpreadEquipe, Panel(t)
            ControleContreDroite SpreadEquipe, Panel(t)
            SpreadEquipe.ColWidth(1) = (SpreadEquipe.Width - 285) / 3
            SpreadEquipe.ColWidth(2) = (SpreadEquipe.Width - 285) * 2 / 3
        Case 2
            SpreadDocumentation.Height = maxi(0, Panel(t).Height - 2 * gap - btnAjouterDocumentation.Height - SpreadDocumentation.Top)
            w1 = SpreadDocumentation.Width - SpreadDocumentation.ColWidth(4)
            ControleContreDroite SpreadDocumentation, Panel(t)
            SpreadDocumentation.ColWidth(2) = SpreadDocumentation.ColWidth(2) / w1 * (SpreadDocumentation.Width - SpreadDocumentation.ColWidth(4))
            SpreadDocumentation.ColWidth(3) = SpreadDocumentation.ColWidth(3) / w1 * (SpreadDocumentation.Width - SpreadDocumentation.ColWidth(4))
            btnAjouterDocumentation.Top = maxi(SpreadDocumentation.Top + SpreadDocumentation.Height + gap, Panel(t).Height - btnAjouterDocumentation.Height - gap)
            btnInsérerDocumentation.Top = btnAjouterDocumentation.Top
            btnSupprimerDocumentation.Top = btnAjouterDocumentation.Top
        Case 3
            ResizeArbreEtapesSujets 0, INDEX_MAX_ETAPES_ET_SUJETS, Panel(t)
        Case 4
            ResizeArbreDispositions 0, INDEX_MAX_DISPOSITIONS, Panel(t)
            btnCommentaireEtape(INDEX_AFF_DISPOSITIONS).Left = Panel(t).Width - gap - btnCommentaireEtape(INDEX_AFF_DISPOSITIONS).Width
            btnCommentaireSujet(INDEX_AFF_DISPOSITIONS).Left = Panel(t).Width - gap - btnCommentaireSujet(INDEX_AFF_DISPOSITIONS).Width
            lstEtapes(INDEX_AFF_DISPOSITIONS).Width = maxi(0, btnCommentaireEtape(INDEX_AFF_DISPOSITIONS).Left - gap - lstEtapes(INDEX_AFF_DISPOSITIONS).Left)
            lstSujets(INDEX_AFF_DISPOSITIONS).Width = maxi(0, btnCommentaireSujet(INDEX_AFF_DISPOSITIONS).Left - gap - lstSujets(INDEX_AFF_DISPOSITIONS).Left)
        Case 5
            w1 = SpreadDangers.Width - SpreadDangers.ColWidth(5)
            ControleContreDroite PanelDangers, Panel(t)
            ControleContreDroite SpreadDangers, PanelDangers
            PanelDangers.Height = maxi(0, (Panel(t).Height - PanelDangers.Top) / 2)
            SpreadDangers.Height = maxi(0, PanelDangers.Height - 2 * gap - btnAjouterDanger.Height - SpreadDangers.Top)
            SpreadDangers.ColWidth(1) = 0
            SpreadDangers.ColWidth(2) = SpreadDangers.ColWidth(2) / w1 * (SpreadDangers.Width - SpreadDangers.ColWidth(5))
            SpreadDangers.ColWidth(3) = SpreadDangers.ColWidth(3) / w1 * (SpreadDangers.Width - SpreadDangers.ColWidth(5))
            SpreadDangers.ColWidth(4) = SpreadDangers.ColWidth(4) / w1 * (SpreadDangers.Width - SpreadDangers.ColWidth(5))
            btnAjouterDanger.Top = maxi(SpreadDangers.Top + SpreadDangers.Height + gap, PanelDangers.Height - btnAjouterDanger.Height - gap)
            btnInsérerDanger.Top = btnAjouterDanger.Top
            btnSupprimerDanger.Top = btnAjouterDanger.Top
            Line1.Y1 = btnSupprimerDanger.Top + btnSupprimerDanger.Height + Screen.TwipsPerPixelY * 4
            Line1.Y2 = Line1.Y1
            Line1.X2 = PanelDangers.Width
            
            w1 = SpreadSujetsDangers.Width - SpreadSujetsDangers.ColWidth(9)
            ControleContreDroite PanelSujetsDangers, Panel(t)
            ControleContreDroite SpreadSujetsDangers, PanelSujetsDangers
            PanelSujetsDangers.Height = PanelDangers.Height
            PanelSujetsDangers.Top = PanelDangers.Top + PanelDangers.Height
            SpreadSujetsDangers.Height = maxi(0, PanelSujetsDangers.Height - 2 * gap - btnAjouterSujetDanger.Height - SpreadSujetsDangers.Top)
            SpreadSujetsDangers.ColWidth(1) = 0
            Dim Largeur As Integer
            Dim i As Integer
            Largeur = (SpreadSujetsDangers.Width - 285) / 5
            For i = 2 To 8
                Select Case i
                    Case 2, 3
                        SpreadSujetsDangers.ColWidth(i) = SpreadSujetsDangers.ColWidth(i) / w1 * (SpreadSujetsDangers.Width - SpreadSujetsDangers.ColWidth(9))
                    Case 4, 5
                        'cache les colonnes nature et spécificité car le tableau contient
                        'les sujets/dangers pour le même couple
                        SpreadSujetsDangers.ColWidth(i) = 0
                    Case 6, 7
                        SpreadSujetsDangers.ColWidth(i) = SpreadSujetsDangers.ColWidth(i) / w1 * (SpreadSujetsDangers.Width - SpreadSujetsDangers.ColWidth(9))
                    Case 8
                        SpreadSujetsDangers.ColWidth(8) = SpreadSujetsDangers.ColWidth(8) / w1 * (SpreadSujetsDangers.Width - SpreadSujetsDangers.ColWidth(9))
                End Select
            Next
            btnAjouterSujetDanger.Top = maxi(SpreadSujetsDangers.Top + SpreadSujetsDangers.Height + gap, PanelSujetsDangers.Height - btnAjouterSujetDanger.Height - gap)
            btnInsérerSujetDanger.Top = btnAjouterSujetDanger.Top
            btnSupprimerSujetDanger.Top = btnAjouterSujetDanger.Top
        Case 6
            ResizeArbreHACCP 0, INDEX_MAX_ARBRE_HACCP, Panel(t)
            btnCommentaireEtape(INDEX_AFF_ARBRE).Left = Panel(t).Width - gap - btnCommentaireEtape(INDEX_AFF_ARBRE).Width
            btnCommentaireSujet(INDEX_AFF_ARBRE).Left = Panel(t).Width - gap - btnCommentaireSujet(INDEX_AFF_ARBRE).Width
            btnCommentaireDanger(INDEX_AFF_ARBRE).Left = Panel(t).Width - gap - btnCommentaireDanger(INDEX_AFF_ARBRE).Width
            lstEtapes(INDEX_AFF_ARBRE).Width = maxi(0, btnCommentaireEtape(INDEX_AFF_ARBRE).Left - gap - lstEtapes(INDEX_AFF_ARBRE).Left)
            lstSujets(INDEX_AFF_ARBRE).Width = maxi(0, btnCommentaireSujet(INDEX_AFF_ARBRE).Left - gap - lstSujets(INDEX_AFF_ARBRE).Left)
            lstSujetsDangers(INDEX_AFF_ARBRE).Width = maxi(0, btnCommentaireDanger(INDEX_AFF_ARBRE).Left - gap - lstSujetsDangers(INDEX_AFF_ARBRE).Left)
    End Select
    
    SSTab1.Tab = t
    SSTab1.Visible = True
    SSTab1.Left = 0
    SSTab1.Top = 0
End Sub


Private Sub SSTab1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub

Private Sub txtAuteur_GotFocus()
    'sélectionne toute la zone sauf quand le focus revient de la barre d'outils
    If Not ctls(SSTab1.Tab) Is ActiveControl Then
        SelectionneZoneTexte ActiveControl, 16 * 5 + 5
    End If
    'champ non modifié
    ActiveControl.Tag = ""
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab
    'menu édition
    On Error Resume Next
    CouperCopierCollerEffacer Projet.Modifiable, ActiveControl.SelLength > 0, ActiveControl.SelLength > 0, Clipboard.GetFormat(vbCFText), ActiveControl.SelLength > 0
    On Error GoTo 0
End Sub

Private Sub txtAuteur_KeyDown(KeyCode As Integer, Shift As Integer)
    KeyDownTextBox txtAuteur, KeyCode, "auteur"
End Sub

Private Sub txtAuteur_KeyPress(keyascii As Integer)
    If Projet.NonModifiable Then
        keyascii = 0
        Exit Sub
    End If
    If keyascii = 27 And ActiveControl.Tag <> "" Then
        ExécuterAnnulation
        ActiveControl.SelStart = Len(ActiveControl)
    End If
    If ActiveControl.Tag = "" And keyascii <> 27 Then
        ProgAnnulationFrappeTextBox Tag, ActiveControl, ActiveControl.Text, "auteur"
        ActiveControl.Tag = "1"
    End If
    If Not Projet.Modifié Then
        Projet.EstModifié
        MetAJourMenus
    End If
End Sub

Private Sub txtAuteur_LostFocus()

    If txtAuteur.Tag <> "" Then
        Projet.Auteur = txtAuteur.Text
        RefreshFenetresProjet "auteur", Tag
    End If
    
End Sub

Private Sub txtAuteur_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If txtAuteur.Text = "" And Projet.Modifiable Then
        LigneEtat "Entrez ici votre nom en temps qu'auteur du projet HACCP"
    Else
        LigneEtat "Nom de la personne qui a créé ce projet HACCP"
    End If
End Sub

Private Sub txtCommentaire_GotFocus()
    'sélectionne toute la zone sauf quand le focus revient de la barre d'outils
    If Not ctls(SSTab1.Tab) Is ActiveControl Then
        SelectionneZoneTexte ActiveControl, 16 * 4 + 15
    End If
    'champ non modifié
    ActiveControl.Tag = ""
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab
    'menu édition
    On Error Resume Next
    CouperCopierCollerEffacer Projet.Modifiable, ActiveControl.SelLength > 0, ActiveControl.SelLength > 0, Clipboard.GetFormat(vbCFText), ActiveControl.SelLength > 0
    On Error GoTo 0
End Sub

Private Sub txtCommentaire_KeyDown(KeyCode As Integer, Shift As Integer)
    KeyDownTextBox txtCommentaire, KeyCode, "commentaire"
End Sub


Private Sub txtCommentaire_KeyPress(keyascii As Integer)
    If Projet.NonModifiable Then
        keyascii = 0
        Exit Sub
    End If
    If keyascii = 27 And ActiveControl.Tag <> "" Then
        ExécuterAnnulation
        ActiveControl.SelStart = Len(ActiveControl)
    End If
    If ActiveControl.Tag = "" And keyascii <> 27 Then
        ProgAnnulationFrappeTextBox Tag, ActiveControl, ActiveControl.Text, "commentaire"
        ActiveControl.Tag = "1"
    End If
    If Not Projet.Modifié Then
        Projet.EstModifié
        MetAJourMenus
    End If
End Sub

Private Sub txtCommentaire_LostFocus()

    If txtCommentaire.Tag <> "" Then
        Projet.Commentaire = txtCommentaire.Text
        RefreshFenetresProjet "commentaire", Tag
    End If
    
End Sub



Private Sub txtCommentaire_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If txtCommentaire.Text = "" And Projet.Modifiable Then
        LigneEtat "Entrez ici une brève description du projet HACCP (texte libre)"
    Else
        LigneEtat "Commentaire associé au projet HACCP"
    End If
End Sub

Private Sub txtRéférence_GotFocus()
    'sélectionne toute la zone sauf quand le focus revient de la barre d'outils
    If Not ctls(SSTab1.Tab) Is ActiveControl Then
        SelectionneZoneTexte ActiveControl, 16 * 4 + 3
    End If
    'champ non modifié
    ActiveControl.Tag = ""
    'mémorise controle avec focus
    MémoFocus Me.ActiveControl, SSTab1.Tab
    'menu édition
    On Error Resume Next
    CouperCopierCollerEffacer Projet.Modifiable, ActiveControl.SelLength > 0, ActiveControl.SelLength > 0, Clipboard.GetFormat(vbCFText), ActiveControl.SelLength > 0
    On Error GoTo 0
End Sub

Private Sub txtRéférence_KeyDown(KeyCode As Integer, Shift As Integer)
    KeyDownTextBox txtRéférence, KeyCode, "reference"
End Sub


Private Sub txtRéférence_KeyPress(keyascii As Integer)
    If Projet.NonModifiable Then
        keyascii = 0
        Exit Sub
    End If
    If keyascii = 27 And ActiveControl.Tag <> "" Then
        ExécuterAnnulation
        ActiveControl.SelStart = Len(ActiveControl)
    End If
    If ActiveControl.Tag = "" And keyascii <> 27 Then
        ProgAnnulationFrappeTextBox Tag, ActiveControl, ActiveControl.Text, "reference"
        ActiveControl.Tag = "1"
    End If
    If Not Projet.Modifié Then
        Projet.EstModifié
        MetAJourMenus
    End If
End Sub


Private Sub txtRéférence_LostFocus()
    
    If txtRéférence.Tag <> "" Then
        Projet.Référence = txtRéférence.Text
        RefreshFenetresProjet "reference", Tag
    End If

End Sub


Private Sub txtRéférence_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If txtRéférence.Text = "" And Projet.Modifiable Then
        LigneEtat "Entrez ici la référence du projet HACCP (texte libre)"
    Else
        LigneEtat "Référence du projet HACCP"
    End If
End Sub

Private Sub txtTitre_Change()

    'change le titre de la fenêtre
    ChangeTitreFenetre

End Sub

Private Sub txtTitre_GotFocus()
    'sélectionne toute la zone sauf quand le focus revient de la barre d'outils
    If Not ctls(SSTab1.Tab) Is ActiveControl Then
        SelectionneZoneTexte ActiveControl, 16 * 5 + 4
    End If
    'champ non modifié
    ActiveControl.Tag = ""
    'mémorise controle avec focus
    MémoFocus ActiveControl, SSTab1.Tab
    'menu édition
    On Error Resume Next
    CouperCopierCollerEffacer Projet.Modifiable, ActiveControl.SelLength > 0, ActiveControl.SelLength > 0, Clipboard.GetFormat(vbCFText), ActiveControl.SelLength > 0
    On Error GoTo 0
End Sub

Private Sub txtTitre_KeyDown(KeyCode As Integer, Shift As Integer)
    KeyDownTextBox txtTitre, KeyCode, "titre"
End Sub

Private Sub txtTitre_KeyPress(keyascii As Integer)

    If Projet.NonModifiable Then
        keyascii = 0
        Exit Sub
    End If
    If keyascii = 27 And ActiveControl.Tag <> "" Then
        ExécuterAnnulation
        ActiveControl.SelStart = Len(ActiveControl)
    End If
    If ActiveControl.Tag = "" And keyascii <> 27 Then
        ProgAnnulationFrappeTextBox Tag, ActiveControl, ActiveControl.Text, "titre"
        ActiveControl.Tag = "1"
    End If
    If Not Projet.Modifié Then
        Projet.EstModifié
        MetAJourMenus
    End If
    
End Sub

Private Sub txtTitre_LostFocus()

    If txtTitre.Tag <> "" Then
        Projet.Titre = txtTitre.Text
        RefreshFenetresProjet "titre", Tag
    End If
    
End Sub


Public Sub RefreshBoutonsEtapesSujets()

Dim i As Integer

    'vidage des listes à vider
    For i = 0 To INDEX_MAX_ETAPES_ET_SUJETS
        If E_lstDonnees(i).ListIndex = -1 Then
            If i < INDEX_MAX_ETAPES_ET_SUJETS Then
                E_lstDonnees(i + 1).clear
                E_txtDonnee(i + 1).Text = ""
            End If
            E_txtDonnee(i).Text = ""
        End If
    Next
    
    'boutons d'accès aux documents associés visibles s'il y a des documents associés
    E_btnDocuments(0).Visible = False
    If E_lstDonnees(0).ListIndex <> -1 Then
        If EtapeEnCours(INDEX_AFF_ETAPES_ET_SUJETS).DocumentsCount > 0 Then
            E_btnDocuments(0).Visible = True
        End If
    End If
    E_btnDocuments(1).Visible = False
    If E_lstDonnees(1).ListIndex <> -1 Then
        If SujetEnCours(INDEX_AFF_ETAPES_ET_SUJETS).DocumentsCount > 0 Then
            E_btnDocuments(1).Visible = True
        End If
    End If
        
    'bouton d'ajout d'étape et de sujet
    E_btnAjouterDonnee(0).Visible = Projet.Modifiable
    E_btnAjouterDonnee(1).Visible = (E_lstDonnees(0).ListIndex <> -1) And Projet.Modifiable

End Sub


Public Sub RefreshListeEtapes(ctl As Control)

Dim i As Integer
Dim n As Integer
Dim idEtape As Integer

    n = Projet.EtapesCount
    idEtape = -1
    If ctl.ListIndex <> -1 Then
        'mémorise l'étape sélectionnée pour la restituer ensuite
        idEtape = ctl.ItemData(ctl.ListIndex)
    End If
    'remplit la liste avec les titres des étapes
    ctl.clear
    For i = 1 To n
        ctl.AddItem Projet.EtapeTitre(i)
        ctl.ItemData(ctl.NewIndex) = suppfirstchar(Projet.EtapeId(i), 1)
    Next
    If ctl.ListCount > 0 Then
        If idEtape <> -1 Then
            'se repositionne sur l'élément précédemment sélectionné
            i = PositionDataDansListe(ctl, idEtape)
            If i <> -1 Then
                ctl.ListIndex = i
            Else
                ctl.ListIndex = 0
            End If
        Else
            ctl.ListIndex = 0
        End If
    End If

End Sub
Public Sub RefreshListeSujets(ctl As Control, ByVal Etape As Donnee)
    
Dim i As Integer
Dim n As Integer
Dim idSujet As Integer

    n = Etape.EnfantsCount
    idSujet = -1
    If ctl.ListIndex <> -1 Then
        'mémorise le sujet sélectionné pour le restituer ensuite
        idSujet = ctl.ItemData(ctl.ListIndex)
    End If
    'remplit la liste avec les titres des sujets
    ctl.clear
    For i = 1 To n
        ctl.AddItem Etape.EnfantTitre(i)
        ctl.ItemData(ctl.NewIndex) = suppfirstchar(Etape.EnfantId(i), 1)
    Next
    If ctl.ListCount > 0 Then
        If idSujet <> -1 Then
            'se repositionne sur l'élément précédemment sélectionné
            i = PositionDataDansListe(ctl, idSujet)
            If i <> -1 Then
                ctl.ListIndex = i
            Else
                ctl.ListIndex = 0
            End If
        Else
            ctl.ListIndex = 0
        End If
    End If

End Sub


Public Sub RefreshListeSujetsDangers(ctl As Control, ByVal Etape As Donnee, ByVal Sujet As Donnee)
    
Dim i As Integer
Dim n As Integer
Dim idSujetDanger As Integer
Dim SujetDanger As SujetDanger

    idSujetDanger = -1
    If ctl.ListIndex <> -1 Then
        'mémorise le sujet/danger sélectionné pour le restituer ensuite
        idSujetDanger = ctl.ItemData(ctl.ListIndex)
    End If
    'remplit la liste avec les noms des sujets/dangers
    ctl.clear
    n = Projet.SujetsDangersCount
    For i = 1 To n
        Set SujetDanger = Projet.SujetDanger(i)
        'seuls les sujet/danger dont la criticité a été évaluée
        'et ceux non effacés (et gardés en cas d'annulation de suppression)
        'sont mise dans la liste (§ 7.6 du cahier des charges, bas page 22)
        If Not SujetDanger.Effacé And SujetDanger.Sujet = Sujet.id And SujetDanger.Criticité <> "" Then
            ctl.AddItem IIf(SujetDanger.Criticité = "OUI", Chr$(169) & " ", "") & SujetDanger.Nom & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")"
            ctl.ItemData(ctl.NewIndex) = suppfirstchar(SujetDanger.id, 1)
        End If
    Next
    If ctl.ListCount > 0 Then
        If idSujetDanger <> -1 Then
            'se repositionne sur l'élément précédemment sélectionné
            i = PositionDataDansListe(ctl, idSujetDanger)
            If i <> -1 Then
                ctl.ListIndex = i
            Else
                ctl.ListIndex = 0
            End If
        Else
            ctl.ListIndex = 0
        End If
    End If

End Sub



Public Sub RefreshEtapesEtSujets()
    
    RefreshListeEtapes E_lstDonnees(0)
    RefreshBoutonsEtapesSujets
    
End Sub

Public Sub RefreshBoutonsDispositionsActuelles()

Dim i As Integer

    'vidage des listes
    If lstEtapes(INDEX_AFF_DISPOSITIONS).ListIndex = -1 Then
        lstSujets(INDEX_AFF_DISPOSITIONS).clear
    End If
    If lstSujets(INDEX_AFF_DISPOSITIONS).ListIndex = -1 Then
        D_lstDonnees(0).clear
        D_txtDonnee(0).Text = ""
    End If
    For i = 0 To INDEX_MAX_DISPOSITIONS
        If D_lstDonnees(i).ListIndex = -1 Then
            If i < INDEX_MAX_DISPOSITIONS Then
                D_lstDonnees(i + 1).clear
                D_txtDonnee(i + 1).Text = ""
            End If
            D_txtDonnee(i).Text = ""
        End If
    Next
    If lstSujets(INDEX_AFF_DISPOSITIONS).ListIndex = -1 Then
        D_lstDonnees(0).clear
        D_txtDonnee(0).Text = ""
    End If

    'boutons de commentaire
    btnCommentaireEtape(INDEX_AFF_DISPOSITIONS).Visible = EtapeAvecCommentaire(INDEX_AFF_DISPOSITIONS)
    btnCommentaireSujet(INDEX_AFF_DISPOSITIONS).Visible = SujetAvecCommentaire(INDEX_AFF_DISPOSITIONS)
    
    'boutons d'ajouts de données
    D_btnAjouterDonnee(0).Visible = lstSujets(0).ListIndex <> -1 And Projet.Modifiable
    For i = 0 To INDEX_MAX_DISPOSITIONS
        If i > 0 Then
            D_btnAjouterDonnee(i).Visible = (D_lstDonnees(i - 1).ListIndex <> -1) And Projet.Modifiable
            D_btnAjouterDonnee(i).Left = D_btnAjouterDonnee(i - 1).Left
            D_btnAjouterDonnee(i).Top = D_lstDonnees(i).Top
        End If
        'bouton d'accès aux documents associés
        D_btnDocuments(i).Visible = False
        If D_lstDonnees(i).ListIndex <> -1 Then
            If DonnéeCliquée(INDEX_AFF_DISPOSITIONS, i).DocumentsCount > 0 Then
                D_btnDocuments(i).Visible = True
                D_btnDocuments(i).Left = D_btnAjouterDonnee(i).Left
                D_btnDocuments(i).Top = D_btnAjouterDonnee(i).Top + D_btnAjouterDonnee(i).Height - gap * (D_txtDonnee(i).Height > 2 * D_btnDocuments(i).Height + gap)
            End If
        End If
    Next
    

End Sub

'renvoie le sujet sélectionné dans l'onglet d'affichage passé en paramètre
Public Function SujetEnCours(ByVal Affichage As Integer) As Donnee

Dim Etape As Donnee
Dim idSujet As Long
Dim idEtape As Long

    Set Etape = EtapeEnCours(Affichage)
    Select Case Affichage
        Case INDEX_AFF_ETAPES_ET_SUJETS
            idSujet = E_lstDonnees(1).ItemData(E_lstDonnees(1).ListIndex)
        Case INDEX_AFF_DISPOSITIONS, INDEX_AFF_ARBRE
            idSujet = lstSujets(Affichage).ItemData(lstSujets(Affichage).ListIndex)
    End Select
    Set SujetEnCours = Etape.Enfant("E" & idSujet)

End Function
'renvoie l'étape sélectionnée dans l'onglet d'affichage passé en paramètre
Public Function EtapeEnCours(ByVal Affichage As Integer) As Donnee

Dim idEtape As Long

    Select Case Affichage
        Case INDEX_AFF_ETAPES_ET_SUJETS
            idEtape = E_lstDonnees(0).ItemData(E_lstDonnees(0).ListIndex)
            Set EtapeEnCours = Projet.Etape("E" & idEtape)
        Case INDEX_AFF_DISPOSITIONS, INDEX_AFF_ARBRE
            idEtape = lstEtapes(Affichage).ItemData(lstEtapes(Affichage).ListIndex)
            Set EtapeEnCours = Projet.Etape("E" & idEtape)
    End Select

End Function


Private Function DonnéeCliquée(ByVal Affichage As Integer, ByVal Index As Integer) As Object

Dim Donnée As Object    'de classe Donnee ou SujetDanger selon l'affichage
Dim i As Integer

    'la donnée de départ est différente dans les dispositions et dans l'arbre HACCP
    Select Case Affichage
        Case INDEX_AFF_ETAPES_ET_SUJETS
            Set Donnée = Projet.Etape("E" & E_lstDonnees(0).ItemData(E_lstDonnees(0).ListIndex))
            'descend l'arbre des etapes et sujets pour mettre dans Donnée la donnée cliquée
            For i = 1 To Index
                Set Donnée = Donnée.Enfant("E" & E_lstDonnees(i).ItemData(E_lstDonnees(i).ListIndex))
            Next
        Case INDEX_AFF_DISPOSITIONS
            Set Donnée = SujetEnCours(Affichage)
            'descend l'arbre des dispositions en place pour mettre dans Donnée la donnée cliquée
            For i = 0 To Index
                Set Donnée = Donnée.Enfant("E" & D_lstDonnees(i).ItemData(D_lstDonnees(i).ListIndex))
            Next
        Case INDEX_AFF_ARBRE
            Set Donnée = SujetDangerEnCours
            'descend l'arbre pour mettre dans Donnée la donnée cliquée
            For i = 0 To Index
                Set Donnée = Donnée.Enfant("E" & A_lstDonnees(i).ItemData(A_lstDonnees(i).ListIndex))
            Next
    End Select
    Set DonnéeCliquée = Donnée

End Function

Public Sub RefreshBoutonsArbreHACCP()

Dim i As Integer

    'vidage des listes
    If lstEtapes(INDEX_AFF_ARBRE).ListIndex = -1 Then
        lstSujets(INDEX_AFF_ARBRE).clear
    End If
    If lstSujets(INDEX_AFF_ARBRE).ListIndex = -1 Then
        lstSujetsDangers(INDEX_AFF_ARBRE).clear
    End If
    If lstSujetsDangers(INDEX_AFF_ARBRE).ListIndex = -1 Then
        A_lstDonnees(0).clear
        A_txtDonnee(0).Text = ""
    End If
    For i = 0 To INDEX_MAX_ARBRE_HACCP
        If A_lstDonnees(i).ListIndex = -1 Then
            If i < INDEX_MAX_ARBRE_HACCP Then
                A_lstDonnees(i + 1).clear
                A_txtDonnee(i + 1).Text = ""
            End If
            A_txtDonnee(i).Text = ""
        End If
    Next
    If lstSujets(INDEX_AFF_ARBRE).ListIndex = -1 Then
        A_lstDonnees(0).clear
        A_txtDonnee(0).Text = ""
    End If

    'boutons de commentaire
    btnCommentaireEtape(INDEX_AFF_ARBRE).Visible = EtapeAvecCommentaire(INDEX_AFF_ARBRE)
    btnCommentaireSujet(INDEX_AFF_ARBRE).Visible = SujetAvecCommentaire(INDEX_AFF_ARBRE)
    btnCommentaireDanger(INDEX_AFF_ARBRE).Visible = SujetDangerAvecCommentaire(INDEX_AFF_ARBRE)
    
    'boutons d'ajout et de documents associés
    A_btnAjouterDonnee(0).Visible = lstSujetsDangers(INDEX_AFF_ARBRE).ListIndex <> -1 And Projet.Modifiable
    For i = 0 To INDEX_MAX_ARBRE_HACCP
        If i > 0 Then
            A_btnAjouterDonnee(i).Visible = (A_lstDonnees(i - 1).ListIndex <> -1) And Projet.Modifiable
            A_btnAjouterDonnee(i).Left = A_btnAjouterDonnee(i - 1).Left
            A_btnAjouterDonnee(i).Top = A_lstDonnees(i).Top
        End If
        A_btnDocuments(i).Visible = False
        If A_lstDonnees(i).ListIndex <> -1 Then
            If DonnéeCliquée(INDEX_AFF_ARBRE, i).DocumentsCount > 0 Then
                A_btnDocuments(i).Visible = True
                A_btnDocuments(i).Left = A_btnAjouterDonnee(i).Left
                A_btnDocuments(i).Top = A_btnAjouterDonnee(i).Top + A_btnAjouterDonnee(i).Height - gap * (A_txtDonnee(i).Height > 2 * A_btnDocuments(i).Height + gap)
            End If
        End If
    Next

End Sub

Private Sub AfficherCommentaire(ByVal Donnée As Object, ByVal Titre As String)

    MsgBox Titre & " '" & Donnée.Titre & "':" & CrLf2 & Donnée.Commentaire, MB_ICONINFORMATION, "Commentaire "

End Sub

Private Function EtapeAvecCommentaire(ByVal Affichage As Integer) As Integer

    EtapeAvecCommentaire = False
    If lstEtapes(Affichage).ListIndex <> -1 Then
        If EtapeEnCours(Affichage).Commentaire <> "" Then
            EtapeAvecCommentaire = True
        End If
    End If
    
End Function
Private Function SujetDangerAvecCommentaire(ByVal Affichage As Integer) As Integer

    SujetDangerAvecCommentaire = False
    If lstSujetsDangers(Affichage).ListIndex <> -1 Then
        If SujetDangerEnCours().Commentaire <> "" Then
            SujetDangerAvecCommentaire = True
        End If
    End If
    
End Function


Private Function SujetAvecCommentaire(ByVal Affichage As Integer) As Integer

    SujetAvecCommentaire = False
    If lstSujets(Affichage).ListIndex <> -1 Then
        If SujetEnCours(Affichage).Commentaire <> "" Then
            SujetAvecCommentaire = True
        End If
    End If
    
End Function



Private Sub SupprimerEtape(ByVal Etape As Donnee, ByVal BeforeKey As Variant)

    'mémorise le sujet effacé
    ProgAnnulationDeleteEtape Tag, Etape, Module.Niveau(NIVEAU_ETAPE), BeforeKey

    'les sujets/dangers liés aux sujets de l'étape sont marqué effacé en attendant
    'une éventuelle annulation de suppression
    Dim Sujet As Donnee
    For Each Sujet In Etape.colEnfants
        Dim SujetDanger As SujetDanger
        For Each SujetDanger In Projet.colSujetsDangers
            If SujetDanger.Sujet = Sujet.id Then
                SujetDanger.Effacé = True
            End If
        Next
    Next
    
    'suppression de l'étape du projet
    'ceci provoque la suppression des sujets de l'étape et des dispositions en place
    'relatives à l'étape
    Projet.DeleteEtape Etape.id

End Sub

Private Sub SupprimerSujet(ByVal Etape As Donnee, ByVal Sujet As Donnee, ByVal BeforeKey As Variant)

    'mémorise le sujet effacé
    ProgAnnulationDeleteSujet Tag, Etape, Sujet, Module.Niveau(NIVEAU_SUJET), BeforeKey
        
    'les sujets/dangers liés au sujet marqué effacé en attendant une éventuelle
    'annulation de suppression
    Dim SujetDanger As SujetDanger
    For Each SujetDanger In Projet.colSujetsDangers
        If SujetDanger.Sujet = Sujet.id Then
            SujetDanger.Effacé = True
        End If
    Next
                
    'suppression de ce sujet de l'étape
    'ceci provoque la suppression des éléments des dispositions en place
    'associés à ce sujet
    Projet.Etape(Etape.id).colEnfants.Remove Sujet.id

End Sub

Private Sub GetAssistanceCriticitéArbreHACCP(ByVal Niveau As Integer, ByRef Assistance As Integer, ByRef EvaluerCriticité As Integer)

    'paramètres d'assistance et de criticité de la fenêtre d'ajout de donnée
    Select Case Niveau
        Case NIVEAU_POINT_A_MAITRISER
            Assistance = ASSISTANCE_SUGGESTIONS
            EvaluerCriticité = True
        Case NIVEAU_MESURE_PREVENTIVE
            Assistance = ASSISTANCE_SUGGESTIONS Or ASSISTANCE_EXISTANT
            EvaluerCriticité = True
        Case NIVEAU_VALEUR_CIBLE
            Assistance = ASSISTANCE_SUGGESTIONS Or ASSISTANCE_EXISTANT
            EvaluerCriticité = False
        Case NIVEAU_ELEMENT_SURVEILLANCE, NIVEAU_ACTION_CORRECTIVE, NIVEAU_VERIFICATION, NIVEAU_ENREGISTREMENT
            Assistance = ASSISTANCE_SUGGESTIONS Or ASSISTANCE_EXISTANT
            EvaluerCriticité = False
    End Select

End Sub

Private Sub txtTitre_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If txtTitre.Text = "" And Projet.Modifiable Then
        LigneEtat "Entrez ici le titre du projet (français courant)"
    Else
        LigneEtat "Titre du projet HACCP"
    End If
End Sub


