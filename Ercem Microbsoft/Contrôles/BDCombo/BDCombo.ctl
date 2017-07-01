VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.UserControl BDCombo 
   ClientHeight    =   2265
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3075
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   ScaleHeight     =   2265
   ScaleWidth      =   3075
   ToolboxBitmap   =   "BDCombo.ctx":0000
   Begin MSWLess.WLCombo cboBD 
      Height          =   330
      Left            =   300
      TabIndex        =   0
      Top             =   420
      Width           =   2355
      _ExtentX        =   4154
      _ExtentY        =   582
      _Version        =   393216
      ListCount       =   -21628
      BackColor       =   -2147483643
      Appearance      =   0
      List            =   "BDCombo.ctx":00FA
   End
End
Attribute VB_Name = "BDCombo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "TextEdit sp�cialis� dans la saisie d'une temp�rature"
' BDCombo
' Combo box sp�cialis�e pour une interface base de donn�es
' 23/01/1998 PV
'  2/05/1998 PV M�thodes Clear et Synchronise; Utilisation de StrComp au lieu de UCase
'  7/05/1998 PV S�parateur diff�rent de : pour faire des construct�
'  5/06/1998 PV Recherche par /cl�_partielle; propri�t� text par d�faut (enfin !!!)
'  6/07/1998 PV Expansion de cl� sur [Entr�e]
' 10/05/1999 PV M�thode additem positionne imm�diatement listindex si la valeur ajout�e � la liste �tait la valeur saisie


Option Explicit

Private Const sS�parateur = "��"

'D�clarations d'�v�nements:
Event Click() 'MappingInfo=cboBD,cboBD,-1,Click
Attribute Click.VB_Description = "Survient lorsque l'utilisateur enfonce puis rel�che un bouton de la souris sur un objet."
Event DblClick() 'MappingInfo=cboBD,cboBD,-1,DblClick
Attribute DblClick.VB_Description = "Survient lorsque l'utilisateur enfonce puis rel�che un bouton de la souris puis l'enfonce et le rel�che de nouveau sur un objet."
Event KeyDown(KeyCode As Integer, Shift As Integer) 'MappingInfo=cboBD,cboBD,-1,KeyDown
Attribute KeyDown.VB_Description = "Survient lorsque l'utilisateur enfonce une touche alors qu'un objet a le focus."
Attribute KeyDown.VB_UserMemId = -602
Event KeyPress(KeyAscii As Integer) 'MappingInfo=cboBD,cboBD,-1,KeyPress
Attribute KeyPress.VB_Description = "Survient lorsque l'utilisateur enfonce puis rel�che une touche ANSI."
Attribute KeyPress.VB_UserMemId = -603
Event KeyUp(KeyCode As Integer, Shift As Integer) 'MappingInfo=cboBD,cboBD,-1,KeyUp
Attribute KeyUp.VB_Description = "Survient lorsque l'utilisateur rel�che une touche alors qu'un objet a le focus."
Attribute KeyUp.VB_UserMemId = -604
Event Change() 'MappingInfo=cboBD,cboBD,-1,Change


' ====================================================================

Private Sub UserControl_InitProperties()
  Set cboBD.Font = UserControl.Ambient.Font
End Sub


Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  Dim Index As Integer, ListCount As Integer
  
  Set cboBD.Font = PropBag.ReadProperty("Font", Ambient.Font)
  cboBD.BackColor = PropBag.ReadProperty("BackColor", &H80000005)
  cboBD.ForeColor = PropBag.ReadProperty("ForeColor", &H80000008)
  cboBD.Enabled = PropBag.ReadProperty("Enabled", True)
  cboBD.Locked = PropBag.ReadProperty("Locked", False)
  cboBD.DataField = PropBag.ReadProperty("DataField", "")
  ListCount = PropBag.ReadProperty("ListCount", 0)
  For Index = 0 To ListCount - 1
    cboBD.List(Index) = PropBag.ReadProperty("List" & Index, "")
  Next
  cboBD.Text = PropBag.ReadProperty("Text", "")
End Sub


Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Dim Index As Integer
  
  PropBag.WriteProperty "Font", cboBD.Font, Ambient.Font
  PropBag.WriteProperty "BackColor", cboBD.BackColor, &H80000005
  PropBag.WriteProperty "ForeColor", cboBD.ForeColor, &H80000008
  PropBag.WriteProperty "Enabled", cboBD.Enabled, True
  PropBag.WriteProperty "Locked", cboBD.Locked, False
  PropBag.WriteProperty "DataField", cboBD.DataField, ""
  PropBag.WriteProperty "ListCount", cboBD.ListCount, 0
  For Index = 0 To cboBD.ListCount - 1
    PropBag.WriteProperty "List" & Index, cboBD.List(Index), ""
  Next
  PropBag.WriteProperty "Text", cboBD.Text, ""
End Sub


Private Sub UserControl_Resize()
  UserControl.Height = cboBD.Height
  cboBD.Move 0, 0, UserControl.Width
End Sub

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,Font
Public Property Get Font() As Font
Attribute Font.VB_Description = "Renvoie un objet Font."
Attribute Font.VB_UserMemId = -512
  Set Font = cboBD.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  Set cboBD.Font = New_Font
  PropertyChanged "Font"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,BackColor
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Renvoie ou d�finit la couleur d'arri�re-plan utilis�e pour afficher le texte et les graphiques d'un objet."
Attribute BackColor.VB_UserMemId = -501
  BackColor = cboBD.BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
  cboBD.BackColor() = New_BackColor
  PropertyChanged "BackColor"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,ForeColor
Public Property Get ForeColor() As OLE_COLOR
  ForeColor = cboBD.ForeColor
End Property

Public Property Let ForeColor(ByVal New_ForeColor As OLE_COLOR)
  cboBD.ForeColor() = New_ForeColor
  PropertyChanged "ForeColor"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,Style
Public Property Get Style() As Integer
Attribute Style.VB_Description = "Renvoie ou d�finit le style de la bordure d'un objet."
Attribute Style.VB_UserMemId = -504
  Style = cboBD.Style
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,Enabled
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Renvoie ou d�finit une valeur qui d�termine si un objet peut r�pondre � des �v�nements g�n�r�s par l'utilisateur."
Attribute Enabled.VB_UserMemId = -514
  Enabled = cboBD.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  cboBD.Enabled = New_Enabled
  PropertyChanged "Enabled"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,Locked
Public Property Get Locked() As Boolean
Attribute Locked.VB_Description = "D�termine si un contr�le peut �tre �dit�."
  Locked = cboBD.Locked
End Property

Public Property Let Locked(ByVal New_Locked As Boolean)
  cboBD.Locked() = New_Locked
  PropertyChanged "Locked"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,Text
Public Property Get FullText() As String
Attribute FullText.VB_Description = "Texte complet, incluant la cl�, le s�parateur, et le texte complet"
  FullText = cboBD.Text
End Property

Public Property Let FullText(ByVal New_Text As String)
  cboBD.Text() = New_Text
  PropertyChanged "FullText"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,DataField
Public Property Get DataField() As String
  DataField = cboBD.DataField
End Property

Public Property Let DataField(ByVal New_Text As String)
  cboBD.DataField = New_Text
  PropertyChanged "DataField"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,SelStart
Public Property Get SelStart() As Long
Attribute SelStart.VB_Description = "Position du d�but de la s�lection"
  SelStart = cboBD.SelStart
End Property

Public Property Let SelStart(ByVal New_SelStart As Long)
  cboBD.SelStart() = New_SelStart
  PropertyChanged "SelStart"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,SelLength
Public Property Get SelLength() As Long
Attribute SelLength.VB_Description = "Longueur de la s�lection"
  SelLength = cboBD.SelLength
End Property

Public Property Let SelLength(ByVal New_SelLength As Long)
  cboBD.SelLength() = New_SelLength
  PropertyChanged "SelLength"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,List
Public Property Get List(Index As Integer) As String
Attribute List.VB_Description = "Renvoie ou d�finit les rubriques contenues dans la partie liste d'un contr�le."
  List = cboBD.List(Index)
End Property

Public Property Let List(Index As Integer, ByVal New_List As String)
  cboBD.List(Index) = New_List
  PropertyChanged "List"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,ListCount
Public Property Get ListCount() As Integer
Attribute ListCount.VB_Description = "Renvoie ou d�finit le nombre d'�l�ments contenus dans la partie liste d'un contr�le."
  ListCount = cboBD.ListCount
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,ListIndex
Public Property Get ListIndex() As Integer
Attribute ListIndex.VB_Description = "Renvoie ou d�finit l'index de l'�l�ment actuellement s�lectionn� du contr�le."
  ListIndex = cboBD.ListIndex
End Property

Public Property Let ListIndex(ByVal New_ListIndex As Integer)
  cboBD.ListIndex() = New_ListIndex
  PropertyChanged "ListIndex"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,AddItem
Public Sub AddItem(Cl� As Variant, Libell� As String, Optional Index As Variant)
Attribute AddItem.VB_Description = "Ajoute un �l�ment � un contr�le ListBox ou ComboBox ou une ligne � un contr�le Grid."
  cboBD.AddItem Cl� & sS�parateur & Libell�, Index
  If cboBD.Text = Cl� Then    ' cboBD.Text = Cl� & sS�parateur & Libell�
    If IsMissing(Index) Then
      cboBD.ListIndex = cboBD.ListCount - 1
    Else
      cboBD.ListIndex = Index
    End If
  End If
End Sub

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,RemoveItem
Public Sub RemoveItem(Index As Integer)
Attribute RemoveItem.VB_Description = "Supprime un �l�ment d'un contr�le ListBox ou ComboBox ou une ligne d'un contr�le Grid."
  cboBD.RemoveItem Index
End Sub

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,Refresh
Public Sub Refresh()
Attribute Refresh.VB_Description = "Force un nouvel affichage complet d'un objet."
  cboBD.Refresh
End Sub

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,SelText
Public Property Get SelText() As String
Attribute SelText.VB_Description = "Renvoie ou d�finit la cha�ne contenant le texte s�lectionn� actuel."
  SelText = cboBD.SelText
End Property

Public Property Let SelText(ByVal New_SelText As String)
  cboBD.SelText() = New_SelText
  PropertyChanged "SelText"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=cboBD,cboBD,-1,Text
Public Property Get Text() As String
Attribute Text.VB_Description = "Cl� de l'enregistrement s�lectionn�"
Attribute Text.VB_UserMemId = 0
  Dim p As Integer
  p = InStr(1, cboBD.Text, sS�parateur)
  If p <= 0 Then
    Text = cboBD.Text
  Else
    Text = Left(cboBD.Text, p - 1)
  End If
End Property

Public Property Let Text(ByVal New_Value As String)
'  If New_Value = "" Then
'    If cboBD.Text <> New_Value Then
'      cboBD.Text = New_Value
'      PropertyChanged "Value"
'    End If
'    Exit Property
'  End If
  
  ' On recherche la cl� exacte (indiff�rent maj/min)
  Dim p As Integer, i As Integer
  For i = 0 To cboBD.ListCount - 1
    p = InStr(1, cboBD.List(i), sS�parateur)
    If p = 0 Then
      If StrComp(cboBD.List(i), New_Value, vbTextCompare) = 0 Then
        cboBD.ListIndex = i
        GoTo fin
      End If
    Else
      If StrComp(Trim(Left(cboBD.List(i), p - 1)), New_Value, vbTextCompare) = 0 Then
        cboBD.ListIndex = i
        GoTo fin
      End If
    End If
  Next
  
  ' Si la valeur commence par /, on fait une recherche partielle sur cl� et valeur
  If Left(New_Value, 1) = "/" Then
    For i = 0 To cboBD.ListCount - 1
      If InStr(1, cboBD.List(i), Mid(New_Value, 2), vbTextCompare) > 0 Then
        cboBD.ListIndex = i
        GoTo fin
      End If
    Next
  End If
  
  ' Pour finir, on affecte directement
  cboBD.Text = New_Value
fin:
  PropertyChanged "Value"
End Property


' =====================================================================
' Propagation des �v�nements

Private Sub cboBD_Click()
  RaiseEvent Click
End Sub

Private Sub cboBD_DblClick()
  RaiseEvent DblClick
End Sub

Private Sub cboBD_KeyDown(KeyCode As Integer, Shift As Integer)
  RaiseEvent KeyDown(KeyCode, Shift)
  If KeyCode = vbKeyReturn Then Synchronise
End Sub

Private Sub cboBD_KeyPress(KeyAscii As Integer)
  RaiseEvent KeyPress(KeyAscii)
End Sub

Private Sub cboBD_KeyUp(KeyCode As Integer, Shift As Integer)
  RaiseEvent KeyUp(KeyCode, Shift)
End Sub

Private Sub cboBD_Change()
  RaiseEvent Change
End Sub


' =====================================================================
' Outils de simplification. Exemple: Effacement de la liste

Public Sub Clear()
Attribute Clear.VB_Description = "Efface la liste"
  cboBD.Clear
End Sub

' A priori curieux, mais ex�cute le code du let et du get
' Optimise quand m�me un peu�
Public Sub Synchronise()
Attribute Synchronise.VB_Description = "Affiche l'enregistrement correspondant � la cl� saisie"
  If cboBD.ListIndex < 0 Then Text = Text
End Sub

Public Property Get S�parateur() As String
Attribute S�parateur.VB_Description = "Caract�re(s) entre la cl� et la valeur dans la liste"
  S�parateur = sS�parateur
End Property

