VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm MDIAdministration 
   BackColor       =   &H8000000C&
   Caption         =   "Gestion des tables administratives du serveur"
   ClientHeight    =   7215
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   10605
   Icon            =   "MDIAdministration.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Timer timM�dor 
      Left            =   960
      Top             =   600
   End
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10605
      _ExtentX        =   18706
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      AllowCustomize  =   0   'False
      Wrappable       =   0   'False
      Appearance      =   1
      ImageList       =   "ilAdmin"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   27
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "K"
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Utilisateurs"
            Object.ToolTipText     =   "Utilisateurs"
            Object.Tag             =   "Util"
            ImageKey        =   "imgUtilisateur"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Lettres"
            Object.ToolTipText     =   "Lettres"
            Object.Tag             =   "Let"
            ImageKey        =   "imgLettres"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Syst�mes"
            Object.ToolTipText     =   "Syst�mes"
            Object.Tag             =   "Sys"
            ImageKey        =   "imgSyst�mes"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Secr�tariats"
            Object.ToolTipText     =   "Secr�tariats"
            Object.Tag             =   "Sec"
            ImageKey        =   "imgSecr�tariat"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Trait�Par"
            Object.ToolTipText     =   "Trait� par"
            Object.Tag             =   "Trp"
            ImageKey        =   "imgTrait�Par"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Unit�s"
            Object.ToolTipText     =   "Unit�s"
            Object.Tag             =   "Uni"
            ImageKey        =   "imgUnit�"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Unit�sVentilation"
            Object.ToolTipText     =   "Unit�s de ventilation"
            Object.Tag             =   "UV"
            ImageKey        =   "imgUnit�Ventilation"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Pays"
            Object.ToolTipText     =   "Pays"
            Object.Tag             =   "Pay"
            ImageKey        =   "imgPays"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "JoursF�ri�s"
            Object.ToolTipText     =   "Jours f�ri�s"
            Object.Tag             =   "JF�r"
            ImageKey        =   "imgJourF�ri�"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Langues"
            Object.ToolTipText     =   "Langues"
            Object.Tag             =   "Lan"
            ImageKey        =   "imgLangue"
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Sites"
            Object.ToolTipText     =   "Sites"
            Object.Tag             =   "Sit"
            ImageKey        =   "imgSite"
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Rayons"
            Object.ToolTipText     =   "Rayons"
            Object.Tag             =   "Ray"
            ImageKey        =   "imgRayon"
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Proprio"
            Object.ToolTipText     =   "Codes propri�taires (marques)"
            Object.Tag             =   "Pro"
            ImageKey        =   "imgProprio"
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "SysInfo"
            Object.ToolTipText     =   "Table syst�me SysInfo"
            Object.Tag             =   "SInf"
            ImageKey        =   "imgSysInfo"
         EndProperty
         BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "LibErcem"
            Object.ToolTipText     =   "Libell�s Ercem"
            Object.Tag             =   "Lib"
            ImageKey        =   "imgErcem"
         EndProperty
         BeginProperty Button17 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Conclusions"
            Object.ToolTipText     =   "Table Conclusions"
            Object.Tag             =   "Con"
            ImageKey        =   "imgConclusions"
         EndProperty
         BeginProperty Button18 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Param�tres"
            Object.ToolTipText     =   "Table Param�tres"
            Object.Tag             =   "Par"
            ImageKey        =   "imgGerme16"
         EndProperty
         BeginProperty Button19 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "M�thodes"
            Object.ToolTipText     =   "M�thodes param�tres"
            Object.Tag             =   "M�t"
            ImageKey        =   "imgM�thode"
         EndProperty
         BeginProperty Button20 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Tables de la synchro"
            Object.Tag             =   "Syn"
            ImageKey        =   "imgSync"
            Style           =   5
            BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
               NumButtonMenus  =   4
               BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "SynchroM"
                  Text            =   "Table Synchro&Master"
               EndProperty
               BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "SynchroI"
                  Text            =   "Table Synchro&Index"
               EndProperty
               BeginProperty ButtonMenu3 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "SynchroD"
                  Text            =   "Table Syncho&Delete"
               EndProperty
               BeginProperty ButtonMenu4 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "SynchroL"
                  Text            =   "Table Syncho&Labo"
               EndProperty
            EndProperty
         EndProperty
         BeginProperty Button21 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Libell�s des rapports d'analyse"
            Object.Tag             =   "RA"
            ImageKey        =   "imgLibRA"
            Style           =   5
            BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
               NumButtonMenus  =   12
               BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "T1"
                  Text            =   "1. Secteur de pr�l�vement [7]"
               EndProperty
               BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "T2"
                  Text            =   "2. Intervention op�rateur [9]"
               EndProperty
               BeginProperty ButtonMenu3 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "T3"
                  Text            =   "3. Mode de conditionnement [16]"
               EndProperty
               BeginProperty ButtonMenu4 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "T4"
                  Text            =   "4. Niveau d'�laboration [19]"
               EndProperty
               BeginProperty ButtonMenu5 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "T5"
                  Text            =   "5. �tat de division [18]"
               EndProperty
               BeginProperty ButtonMenu6 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "T6"
                  Text            =   "6. �tat physique [8]"
               EndProperty
               BeginProperty ButtonMenu7 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "T7"
                  Text            =   "7. Technologie de fabrication [20]"
               EndProperty
               BeginProperty ButtonMenu8 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "T8"
                  Text            =   "8. Aspect de l'�chantillon [34]"
               EndProperty
               BeginProperty ButtonMenu9 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "T9"
                  Text            =   "9. Conditions de pr�l�vement [15]"
               EndProperty
               BeginProperty ButtonMenu10 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "T10"
                  Text            =   "10. Cadre de pr�l�vement [10]"
               EndProperty
               BeginProperty ButtonMenu11 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "T11"
                  Text            =   "11. Lieu de pr�l�vement [14]"
               EndProperty
               BeginProperty ButtonMenu12 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "T12"
                  Text            =   "12. Contenant [17]"
               EndProperty
            EndProperty
         EndProperty
         BeginProperty Button22 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "ZoneComm"
            Object.ToolTipText     =   "Gestion des zones commerciales"
            Object.Tag             =   "ZC"
            ImageKey        =   "imgZC"
         EndProperty
         BeginProperty Button23 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button24 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Copie"
            Object.ToolTipText     =   "Copie les donn�es dans le presse-papiers"
            Object.Tag             =   "Cop"
            ImageKey        =   "imgCopie"
         EndProperty
         BeginProperty Button25 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Impr"
            Object.ToolTipText     =   "Imprime"
            Object.Tag             =   "Imp"
            ImageKey        =   "imgImprime"
         EndProperty
         BeginProperty Button26 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Aper�u"
            Object.ToolTipText     =   "Aper�u avant impression"
            Object.Tag             =   "Ape"
            ImageKey        =   "imgAper�u"
         EndProperty
         BeginProperty Button27 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Web"
            Object.ToolTipText     =   "Affiche les informations sur le Web"
            Object.Tag             =   "Web"
            ImageKey        =   "imgIExplorer"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   1
      Top             =   6900
      Width           =   10605
      _ExtentX        =   18706
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   10292
            Key             =   "Message"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5292
            MinWidth        =   5292
            Picture         =   "MDIAdministration.frx":0442
            Key             =   "Utilisateur"
            Object.ToolTipText     =   "Utilisateur connect�"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2646
            MinWidth        =   2646
            Picture         =   "MDIAdministration.frx":0994
            Key             =   "DataSource"
            Object.ToolTipText     =   "Source de donn�es"
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComctlLib.ImageList ilAdmin 
      Left            =   180
      Top             =   540
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   39
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":0D16
            Key             =   "imgUtilisateur"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":1030
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":134A
            Key             =   "imgSyst�mes"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":1664
            Key             =   "imgUnit�"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":197E
            Key             =   "imgUnit�Ventilation"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":1C98
            Key             =   "imgPays"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":1FB2
            Key             =   "imgJourF�ri�"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":22CC
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":25E6
            Key             =   "imgCopie"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":26F8
            Key             =   "ZZimgLangue"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":2A12
            Key             =   "imgImprime"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":2B24
            Key             =   "ZZimgSites"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":2E3E
            Key             =   "ZZimgSites2"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":3158
            Key             =   "ZZimgLangue2"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":32B4
            Key             =   "ZimgSite"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":3708
            Key             =   "imgLangue"
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":3870
            Key             =   "ZZZimgSite"
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":3CC4
            Key             =   "imgSite"
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":3E20
            Key             =   "imgErcem"
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":4274
            Key             =   "imgRayon2"
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":46C8
            Key             =   "imgRayon"
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":4824
            Key             =   "imgProprio"
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":4980
            Key             =   ""
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":4AE8
            Key             =   "imgAper�u"
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":4C44
            Key             =   "imgIExplorer"
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":4DA0
            Key             =   "imgLettres"
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":4EFC
            Key             =   "imgSysInfo"
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":5350
            Key             =   "imgSM"
         EndProperty
         BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":54AC
            Key             =   "imgSI"
         EndProperty
         BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":5608
            Key             =   "imgSD"
         EndProperty
         BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":5764
            Key             =   "imgConclusions"
         EndProperty
         BeginProperty ListImage32 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":5BB8
            Key             =   "imgGerme16"
         EndProperty
         BeginProperty ListImage33 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":5D14
            Key             =   ""
         EndProperty
         BeginProperty ListImage34 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":6168
            Key             =   "imgZC"
         EndProperty
         BeginProperty ListImage35 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":62C4
            Key             =   "imgSync"
         EndProperty
         BeginProperty ListImage36 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":6420
            Key             =   "imgLibRA"
         EndProperty
         BeginProperty ListImage37 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":6874
            Key             =   "imgM�thode"
         EndProperty
         BeginProperty ListImage38 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":6CC6
            Key             =   "imgSecr�tariat"
         EndProperty
         BeginProperty ListImage39 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIAdministration.frx":7118
            Key             =   "imgTrait�Par"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuTable 
      Caption         =   "&Table"
      Begin VB.Menu cmdUtilisateurs 
         Caption         =   "&Utilisateurs�"
         Shortcut        =   ^U
      End
      Begin VB.Menu cmdLettres 
         Caption         =   "&Lettres�"
         Shortcut        =   ^L
      End
      Begin VB.Menu cmdSyst�mes 
         Caption         =   "&Syst�mes�"
      End
      Begin VB.Menu cmdSecr�tariats 
         Caption         =   "Secr�tariats�"
      End
      Begin VB.Menu cmdTrait�Par 
         Caption         =   "Trait� par�"
      End
      Begin VB.Menu cmdUnit�s 
         Caption         =   "U&nit�s�"
      End
      Begin VB.Menu cmdUnit�sVentilation 
         Caption         =   "Unit�s de &ventilation�"
      End
      Begin VB.Menu cmdPays 
         Caption         =   "&Pays�"
      End
      Begin VB.Menu cmdJoursF�ri�s 
         Caption         =   "&Jours f�ri�s�"
      End
      Begin VB.Menu cmdLangues 
         Caption         =   "L&angues�"
      End
      Begin VB.Menu cmdSites 
         Caption         =   "&Sites�"
      End
      Begin VB.Menu cmdRayons 
         Caption         =   "&Rayons�"
      End
      Begin VB.Menu cmdProprio 
         Caption         =   "Propri�taires�"
      End
      Begin VB.Menu cmdSysInfo 
         Caption         =   "S&ysInfo�"
      End
      Begin VB.Menu cmdLibErcem 
         Caption         =   "Libell�s ercem�"
      End
      Begin VB.Menu cmdConclusions 
         Caption         =   "&Conclusions"
      End
      Begin VB.Menu cmdParam�tres 
         Caption         =   "&Param�tres"
      End
      Begin VB.Menu cmdSynchro 
         Caption         =   "Synchro"
         Begin VB.Menu cmdSynchroMaster 
            Caption         =   "SynchroMaster�"
         End
         Begin VB.Menu cmdSynchroIndex 
            Caption         =   "SynchroIndex�"
         End
         Begin VB.Menu cmdSynchroDelete 
            Caption         =   "SynchroDelete�"
         End
         Begin VB.Menu cmdSynchroLabo 
            Caption         =   "SynchroLabo�"
         End
      End
      Begin VB.Menu cmdLibell�sRA 
         Caption         =   "Libell�s RA"
         Begin VB.Menu cmdTable 
            Caption         =   "&1. Secteur de pr�l�vement [7]"
            Index           =   1
         End
         Begin VB.Menu cmdTable 
            Caption         =   "&2. Intervention op�rateur [9]"
            Index           =   2
         End
         Begin VB.Menu cmdTable 
            Caption         =   "&3. Mode de conditionnement [16]"
            Index           =   3
         End
         Begin VB.Menu cmdTable 
            Caption         =   "&4. Niveau d'�laboration [19]"
            Index           =   4
         End
         Begin VB.Menu cmdTable 
            Caption         =   "&5. �tat de division [18]"
            Index           =   5
         End
         Begin VB.Menu cmdTable 
            Caption         =   "&6. �tat physique [8]"
            Index           =   6
         End
         Begin VB.Menu cmdTable 
            Caption         =   "&7. Technologie de fabrication [20]"
            Index           =   7
         End
         Begin VB.Menu cmdTable 
            Caption         =   "&8. Aspect de l'�chantillon [34]"
            Index           =   8
         End
         Begin VB.Menu cmdTable 
            Caption         =   "&9. Conditions de pr�l�vement [15]"
            Index           =   9
         End
         Begin VB.Menu cmdTable 
            Caption         =   "1&0. Cadre de pr�l�vement [10]"
            Index           =   10
         End
         Begin VB.Menu cmdTable 
            Caption         =   "11. &Lieu de pr�l�vement [14]"
            Index           =   11
         End
         Begin VB.Menu cmdTable 
            Caption         =   "12. &Contenant [17]"
            Index           =   12
         End
      End
      Begin VB.Menu cmdZoneComm 
         Caption         =   "&Zones commerciales�"
      End
      Begin VB.Menu sep9 
         Caption         =   "-"
      End
      Begin VB.Menu cmdConfiguration 
         Caption         =   "&Source de donn�es�"
      End
      Begin VB.Menu cmdUtilisateur 
         Caption         =   "&Utilisateur�"
      End
      Begin VB.Menu cmdOptions 
         Caption         =   "&Options�"
      End
      Begin VB.Menu sep0 
         Caption         =   "-"
      End
      Begin VB.Menu cmdFermer 
         Caption         =   "&Fermer"
         Visible         =   0   'False
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuEnregistrement 
      Caption         =   "&Enregistrement"
      Begin VB.Menu cmdQuery 
         Caption         =   "&Rechercher"
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu cmdFirst 
         Caption         =   "&Premier"
      End
      Begin VB.Menu cmdPrevious 
         Caption         =   "P&r�c�dent"
      End
      Begin VB.Menu cmdNext 
         Caption         =   "&Suivant"
      End
      Begin VB.Menu cmdLast 
         Caption         =   "&Dernier"
      End
      Begin VB.Menu sep3 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAdd 
         Caption         =   "&Ajouter"
      End
      Begin VB.Menu cmdChange 
         Caption         =   "&Changer"
      End
      Begin VB.Menu cmdDelete 
         Caption         =   "&Supprimer"
      End
      Begin VB.Menu sep3h 
         Caption         =   "-"
      End
      Begin VB.Menu sep3b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdCopie 
         Caption         =   "C&opier"
      End
      Begin VB.Menu sep3d 
         Caption         =   "-"
      End
      Begin VB.Menu cmdM�morise 
         Caption         =   "&M�moriser"
      End
      Begin VB.Menu sep3c 
         Caption         =   "-"
      End
      Begin VB.Menu cmdImpr 
         Caption         =   "&Imprimer"
      End
      Begin VB.Menu cmdAper�u 
         Caption         =   "Aper�u a&vant impression�"
      End
   End
   Begin VB.Menu mnuCommandes 
      Caption         =   "&Commandes"
      Begin VB.Menu cmdr�cup�re 
         Caption         =   "&R�cup�rer un enregistrement supprim�"
         Shortcut        =   ^R
      End
      Begin VB.Menu cmdHistorique 
         Caption         =   "&Historique des modifications"
         Shortcut        =   ^H
      End
   End
   Begin VB.Menu mnuFen�tre 
      Caption         =   "Fe&n�tre"
      WindowList      =   -1  'True
      Begin VB.Menu cmdWeb 
         Caption         =   "&Web"
      End
      Begin VB.Menu sep4 
         Caption         =   "-"
      End
      Begin VB.Menu cmdCascade 
         Caption         =   "&Cascade"
      End
      Begin VB.Menu cmdMosa�que 
         Caption         =   "&Mosa�que"
      End
      Begin VB.Menu cmdR�organiser 
         Caption         =   "&R�organiser les ic�nes"
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&Aide"
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A Propos de�"
      End
   End
   Begin VB.Menu mnuBarreBoutons 
      Caption         =   "(PopUp BdB)"
      Visible         =   0   'False
      Begin VB.Menu cmdBdBEtiquettes 
         Caption         =   "&Etiquettes texte"
      End
   End
End
Attribute VB_Name = "MDIAdministration"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' MDIAdministration
' Feuille MDI principale de la gestion des tables administratives
'  4/02/1998 PV
' 12/02/1998 PV Tables systeme, unite, utilisateur, �
' 12/06/1998 PV Source de donn�es modifiable
'  7/07/1998 PV Copie des donn�es dans le presse-papiers
' 15/07/1998 PV 1.1 Identification de l'utilisateur
' 16/07/1998 PV 1.2 Table langue, tra�abilit� 'idmodif' g�n�ralis�e
'  4/08/1998 PV NoPreviousInstance
' 15/08/1998 PV ChargementInitialCommun, VBLibODBC, frmMsgBoxTimer, BDActiveChamp
' 15/08/1998 PV DoActiveChamp
' 20/01/1999 PV Libell�s Ercem
' 12/03/1999 PV Chargement des pays en cache m�moire
' 24/03/1999 PV Codes proprio
' 30/03/1999 PV 1.3 Impression, Aper�u avant impression
' 19/04/1999 PV Rattrappage g�n�ral des erreurs sur delete; mode lecture seule
'  7/07/1999 PV sSourceODBCD�faut
' 12/08/1999 PV Chargement tardif des collections g�n�rales
' 27/08/1999 PV Tables synchro; m�morisation pour ttes les tables; ctrl d'existence de table
' 30/11/1999 PV Zones commerciales
'  9/08/2001 PV Chien de garde � 1 heure
'  8/11/2001 PV Secr�tariats
' 12/11/2001 PV Trait�Par
' 31/11/2001 FF Historique des modifications


Option Explicit


' Appel� � la connexion initiale, et apr�s un changement d'identit� d'utilisateur
Private Sub D�termineModeLectureSeule()
  ' Seul le Service Informatique peut modifier les tables Serveur !
  bLectureSeule = colUtilisateur("U" & iNumOp�rateur).uti_unite <> 902
End Sub


Private Sub ChargementInitial(ByVal bDemandeSource As Boolean)
  ChargementInitialCommun Me, bDemandeSource, frmBDODBCLogon.GetSourceODBCD�faut
  D�termineModeLectureSeule
End Sub

Private Sub cmdHistorique_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Historique
End Sub

Private Sub cmdOptions_Click()
  frmOptions.Show
End Sub

Private Sub cmdr�cup�re_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then Screen.ActiveForm.R�cup�re
End Sub

Private Sub cmdUtilisateur_Click()
  Dim F As Form
  For Each F In Forms
    If Not F Is MDIAdministration Then Unload F
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fen�tres document avant de changer d'utilisateur !"
    Exit Sub
  End If
  
  If frmBDLogin.iInitUtilisateur(False, True) = 0 Then
    sbStatus.Panels("Utilisateur") = sNomOp�rateur & " (" & iNumOp�rateur & ")"
    D�termineModeLectureSeule
  End If
End Sub

Private Sub cmdConfiguration_Click()
  Dim F As Form
  For Each F In Forms
    If Not F Is MDIAdministration Then Unload F
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fen�tres document avant de changer la source de donn�es !"
    Exit Sub
  End If
  
  ChargementInitial True
End Sub

Private Sub cmdCopie_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Copie
End Sub

Private Sub cmdM�morise_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.M�morise
End Sub


Private Sub cmdImpr_Click()
  On Error Resume Next
  If Left(TypeName(ActiveForm), 2) = "dr" Then    ' DataReport
    ActiveForm.PrintReport
  Else
    ActiveForm.Imprime
  End If
End Sub

Private Sub cmdAper�u_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Aper�u
End Sub



Private Sub MDIForm_Load()
  ' Internationalisation
  IntlInit

  Caption = App.Title & " - " & App.FileDescription
  NoPreviousInstance Me
  sVersionApp = App.Major & "." & App.Minor & "." & App.Revision

  ' Retouche des raccourcis menus (raccourcis que l'on ne peut pas d�finir dans l'�diteur de menus)
  cmdQuery.Caption = cmdQuery.Caption & Chr(9) & "?"
  cmdFermer.Caption = cmdFermer.Caption & Chr(9) & "Ctrl+F4"
  cmdQuitter.Caption = cmdQuitter.Caption & Chr(9) & "Alt+F4"
  cmdFirst.Caption = cmdFirst.Caption & Chr(9) & "D�but"
  cmdPrevious.Caption = cmdPrevious.Caption & Chr(9) & "-"
  cmdNext.Caption = cmdNext.Caption & Chr(9) & "+"
  cmdLast.Caption = cmdLast.Caption & Chr(9) & "Fin"
  cmdAdd.Caption = cmdAdd.Caption & Chr(9) & "A"
  cmdChange.Caption = cmdChange.Caption & Chr(9) & "C"
  cmdDelete.Caption = cmdDelete.Caption & Chr(9) & "Suppr"
  
  AjusteMenus 0
  AjusteEtiquettesBoutons tbBoutons
  
  Show
  ChargementInitial bShiftPressed
  
  ResetChienDeGarde
End Sub


Private Sub cmdLettres_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmLettres
  Else
    Set F = frmLettres
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub

Private Sub cmdUtilisateurs_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmUtilisateur
  Else
    Set F = frmUtilisateur
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub

Private Sub cmdSyst�mes_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmSyst�me
  Else
    Set F = frmSyst�me
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub


Private Sub cmdSecr�tariats_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmSecr�tariat
  Else
    Set F = frmSecr�tariat
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub


Private Sub cmdTrait�Par_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmTrait�Par
  Else
    Set F = frmTrait�Par
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub


Private Sub cmdUnit�s_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmUnit�
  Else
    Set F = frmUnit�
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub

Private Sub cmdUnit�sVentilation_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmUnit�Ventilation
  Else
    Set F = frmUnit�Ventilation
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub


Private Sub cmdPays_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmPays
  Else
    Set F = frmPays
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub


Private Sub cmdJoursF�ri�s_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmJourF�ri�
  Else
    Set F = frmJourF�ri�
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub


Private Sub cmdLangues_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmLangue
  Else
    Set F = frmLangue
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub


Private Sub cmdSites_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmSite
  Else
    Set F = frmSite
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub


Private Sub cmdRayons_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmRayon
  Else
    Set F = frmRayon
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub

Private Sub cmdProprio_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmProprio
  Else
    Set F = frmProprio
  End If
  F.Show
  
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub


Private Sub cmdSysInfo_Click()
  On Error GoTo Probl�me
  
  frmSysInfo.Show
  frmSysInfo.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub



Private Sub cmdLibErcem_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmLibErcem
  Else
    Set F = frmLibErcem
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub

Private Sub cmdConclusions_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmConclusion
  Else
    Set F = frmConclusion
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub

Private Sub cmdParam�tres_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmParam�tre
  Else
    Set F = frmParam�tre
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub

Private Sub cmdM�thodes_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmM�thode
  Else
    Set F = frmM�thode
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub

Private Sub cmdSynchroMaster_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmSynchroMaster
  Else
    Set F = frmSynchroMaster
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub

Private Sub cmdSynchroIndex_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmSynchroIndex
  Else
    Set F = frmSynchroIndex
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub

Private Sub cmdSynchroDelete_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmSynchroDelete
  Else
    Set F = frmSynchroDelete
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub

Private Sub cmdSynchroLabo_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmSynchroLabo
  Else
    Set F = frmSynchroLabo
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub


Private Sub cmdTable_Click(Index As Integer)
  On Error GoTo Probl�me
  
  If Not bShiftPressed Then
    Dim g As Form
    For Each g In Forms
      If TypeOf g Is frmLibell�sRA Then
        If g.GetRessource = Index Then
          g.ZOrder 0
          Exit Sub
        End If
      End If
    Next
  End If
  
  Dim F As frmLibell�sRA
  Set F = New frmLibell�sRA
  F.setMode Index
  AjusteMenus 0

Probl�me:
End Sub


Private Sub cmdZoneComm_Click()
  On Error GoTo Probl�me
  
  Dim F
  If bShiftPressed Then
    Set F = New frmZoneComm
  Else
    Set F = frmZoneComm
  End If
  F.Show
  F.ZOrder 0
  AjusteMenus 0

Probl�me:
End Sub



Private Sub cmdQuitter_Click()
  Unload Me
End Sub


Private Sub cmdCascade_Click()
  MDIAdministration.Arrange vbCascade
End Sub

Private Sub cmdR�organiser_Click()
  MDIAdministration.Arrange vbArrangeIcons
End Sub

Private Sub cmdMosa�que_Click()
  MDIAdministration.Arrange vbTileHorizontal
End Sub


Private Sub cmdAPropos_Click()
  frmAbout.APropos Me.Icon
End Sub


Private Sub mnuTable_Click()
  ResetChienDeGarde
End Sub


Private Sub mnuEnregistrement_Click()
  ResetChienDeGarde
  
  Dim F As Form
  Set F = ActiveForm
  cmdQuery.Enabled = F.bdS�l.ButtonEnabled("Query")

  cmdFirst.Enabled = F.bdS�l.ButtonEnabled("First")
  cmdPrevious.Enabled = F.bdS�l.ButtonEnabled("Previous")
  cmdNext.Enabled = F.bdS�l.ButtonEnabled("Next")
  cmdLast.Enabled = F.bdS�l.ButtonEnabled("Last")

  cmdAdd.Enabled = F.bdS�l.ButtonEnabled("Add")
  cmdChange.Enabled = F.bdS�l.ButtonEnabled("Change")
  cmdDelete.Enabled = F.bdS�l.ButtonEnabled("Delete")
End Sub


Public Sub AjusteMenus(ByVal iOffset As Integer)
  Dim iNbFeuillesCharg�es As Integer, F As Form
  iNbFeuillesCharg�es = iOffset
  For Each F In Forms
    If F.Tag = "Donn�es" Then iNbFeuillesCharg�es = iNbFeuillesCharg�es + 1
  Next
  
  Dim bFeuilleCharg�e As Boolean
  bFeuilleCharg�e = iNbFeuillesCharg�es > 0
  
  cmdFermer.Visible = bFeuilleCharg�e
  sep1.Visible = bFeuilleCharg�e
  mnuEnregistrement.Visible = bFeuilleCharg�e
  mnuFen�tre.Visible = bFeuilleCharg�e
  
  tbBoutons.Buttons("Copie").Enabled = bFeuilleCharg�e
  tbBoutons.Buttons("Impr").Enabled = bFeuilleCharg�e
  tbBoutons.Buttons("Aper�u").Enabled = bFeuilleCharg�e
  tbBoutons.Buttons("Web").Enabled = bFeuilleCharg�e
End Sub

Private Sub mnuFen�tre_Click()
  ResetChienDeGarde
End Sub

Private Sub mnuAide_Click()
  ResetChienDeGarde
End Sub



' ===============================================================================
' Menus sous-trait�s aux feuilles de donn�es

Private Sub cmdQuery_Click()
  ActiveForm.ActionQuery
End Sub

Private Sub cmdFirst_Click()
  ActiveForm.ActionFirst
End Sub

Private Sub cmdPrevious_Click()
  ActiveForm.ActionFirst
End Sub

Private Sub cmdNext_Click()
  ActiveForm.ActionNext
End Sub

Private Sub cmdLast_Click()
  ActiveForm.ActionLast
End Sub

Private Sub cmdAdd_Click()
  ActiveForm.ActionAdd
End Sub

Private Sub cmdChange_Click()
  ActiveForm.ActionChange
End Sub

Private Sub cmdDelete_Click()
  ActiveForm.ActionDelete
End Sub

Private Sub cmdWeb_Click()
  If Not ActiveForm Is Nothing Then ActiveForm.Fen�treWeb
End Sub

Private Sub sbStatus_PanelDblClick(ByVal Panel As MSComctlLib.Panel)
  Select Case Panel.Key
    Case "Utilisateur": cmdUtilisateur_Click
    Case "DataSource":  cmdConfiguration_Click
  End Select
End Sub

Private Sub tbBoutons_ButtonClick(ByVal Button As MSComctlLib.Button)
  tbBoutons.Refresh
  Select Case Button.Key
    Case "Utilisateurs":      cmdUtilisateurs_Click
    Case "Lettres":           cmdLettres_Click
    Case "Syst�mes":          cmdSyst�mes_Click
    Case "Secr�tariats":      cmdSecr�tariats_Click
    Case "Trait�Par":         cmdTrait�Par_Click
    Case "Unit�s":            cmdUnit�s_Click
    Case "Unit�sVentilation": cmdUnit�sVentilation_Click
    Case "Pays":              cmdPays_Click
    Case "JoursF�ri�s":       cmdJoursF�ri�s_Click
    Case "Langues":           cmdLangues_Click
    Case "Sites":             cmdSites_Click
    Case "Rayons":            cmdRayons_Click
    Case "Proprio":           cmdProprio_Click
    Case "SysInfo":           cmdSysInfo_Click
    Case "LibErcem":          cmdLibErcem_Click
    Case "Conclusions":       cmdConclusions_Click
    Case "Param�tres":        cmdParam�tres_Click
    Case "M�thodes":          cmdM�thodes_Click
    Case "ZoneComm":          cmdZoneComm_Click
    
    Case "Web":               cmdWeb_Click
    Case "Impr":              cmdImpr_Click
    Case "Aper�u":            cmdAper�u_Click
    Case "Copie":             cmdCopie_Click
    
    Case "":                  'Nop     (boutons de menus)
    
    Case Else:                Stop
  End Select
End Sub

Private Sub tbBoutons_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
  Select Case ButtonMenu.Key
    Case "SynchroM":          cmdSynchroMaster_Click
    Case "SynchroI":          cmdSynchroIndex_Click
    Case "SynchroD":          cmdSynchroDelete_Click
    Case "SynchroL":          cmdSynchroLabo_Click
    
    Case "T1":                cmdTable_Click 1
    Case "T2":                cmdTable_Click 2
    Case "T3":                cmdTable_Click 3
    Case "T4":                cmdTable_Click 4
    Case "T5":                cmdTable_Click 5
    Case "T6":                cmdTable_Click 6
    Case "T7":                cmdTable_Click 7
    Case "T8":                cmdTable_Click 8
    Case "T9":                cmdTable_Click 9
    Case "T10":               cmdTable_Click 10
    Case "T11":               cmdTable_Click 11
    Case "T12":               cmdTable_Click 12
    
    Case Else:                Stop
  End Select
End Sub

Private Sub tbBoutons_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then PopupMenu mnuBarreBoutons
End Sub

Private Sub mnuBarreBoutons_Click()
  cmdBdBEtiquettes.Checked = tbBoutons.Buttons(2).Caption <> ""
End Sub

Private Sub cmdBdBEtiquettes_Click()
  cmdBdBEtiquettes.Checked = Not cmdBdBEtiquettes.Checked
  SaveSetting App.EXEName, "Affichage", "Etiquettes", IIf(cmdBdBEtiquettes.Checked, 1, 0)
  AjusteEtiquettesBoutons tbBoutons
End Sub


' ===============================================================================
' Chien de garde

Public Sub ResetChienDeGarde()
  tM�dor = Timer
  timM�dor.Interval = 10000
End Sub

Private Sub timM�dor_Timer()
  Dim t As Single
  t = Timer - tM�dor
  If t < 0 And t > -1 Then t = 0        ' Impr�cision du timer
  If t < 0 Then t = t + 24! * 60 * 60
  If t > 60 * 60 Then
    Dim sMsg As String
    sMsg = sIntlLib("F:Programme inactif depuis plus d'une heure, sortie du programme par le chien de garde.%%" & _
                    "A:Inactive application for more than one hour, exit by watchdog.")
    frmMsgBoxTimer.MsgBoxTimer sMsg, vbOKOnly, App.Title, 15
    EmergencyExit
  End If
End Sub
