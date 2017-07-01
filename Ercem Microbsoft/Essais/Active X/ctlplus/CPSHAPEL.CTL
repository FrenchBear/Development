VERSION 5.00
Begin VB.UserControl ShapeLabel 
   BackStyle       =   0  'Transparent
   ClientHeight    =   1575
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2820
   ClipControls    =   0   'False
   ForwardFocus    =   -1  'True
   PropertyPages   =   "CPShapeL.ctx":0000
   ScaleHeight     =   1575
   ScaleWidth      =   2820
   Begin VB.Label lblCaption 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "L�gende"
      Height          =   195
      Left            =   840
      TabIndex        =   0
      Top             =   360
      Width           =   555
   End
   Begin VB.Shape shpBack 
      BorderStyle     =   0  'Transparent
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   735
      Left            =   600
      Shape           =   2  'Oval
      Top             =   360
      Width           =   1575
   End
End
Attribute VB_Name = "ShapeLabel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "PropPageWizardRun" ,"Yes"
Option Explicit
' Notes sur le contr�le ShapeLabel:
'
' 1) Ce code a �t� g�n�r� dans sa quasi-totalit� par
'    l'Assistant Interface de contr�les ActiveX.
'    Le code ajout� ou modifi� � la main est signal� 
'    de mani�re explicite.
' 2) Il a �t� affect� la valeur True � la propri�t� ForwardFocus 
'    de l'objet UserControl. Ainsi, le focus se comporte comme 
'    pour des contr�les Label courants.
'

Const RESIZE_AdjustX As Single = 0.07
Const RESIZE_AdjustY As Single = 0.03

' Stockage pour les valeurs de propri�t�s. (La plupart
' des valeurs de propri�t�s de le contr�le ShapeLabel sont
' stock�es dans les propri�t�s de l'objet UserControl ou
' de ses contr�les constitutifs.)
Private m_Alignment As AlignmentConstants

' D�clarations des �v�nements:
Event Click() 'MappingInfo=UserControl,UserControl,-1,Click
Attribute Click.VB_Description = "Se produit lorsque l'utilisateur appuie et rel�che un bouton de la souris sur un objet."
Event DblClick() 'MappingInfo=UserControl,UserControl,-1,DblClick
Event MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single) 'MappingInfo=UserControl,UserControl,-1,MouseDown
Attribute MouseDown.VB_Description = "Se produit lorsque l'utilisateur appuie sur le bouton de la souris lorsqu'un objet a le focus."
Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single) 'MappingInfo=UserControl,UserControl,-1,MouseMove
Attribute MouseMove.VB_Description = "Se produit lorsque l'utilisateur bouge la souris."
Event MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single) 'MappingInfo=UserControl,UserControl,-1,MouseUp
Attribute MouseUp.VB_Description = "Se produit lorsque l'utilisateur rel�che le bouton de la souris, quand un objet a le focus."

' La propri�t� BackColor a �t� r�affect�e � la main
' � la propri�t� FillColor du contr�le Shape,
' car c'est ce qui remplit la forme qui appara�t comme 
' l'arri�re-plan du contr�le ShapeLabel.
'
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Renvoie/d�finit la couleur de l'arri�re-plan utilis� pour afficher du texte et des graphiques dans un objet."
    BackColor = shpBack.FillColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
    shpBack.FillColor() = New_BackColor
    PropertyChanged "BackColor"
End Property

' La propri�t� ForeColor est affect�e � la propri�t�
' ForeColor du contr�le Label, car la propri�t�
' ForeColor du contr�le ShapeLabel doit contr�ler
' la couleur de la police. L'arri�re-plan du contr�le
' Label est de type Transparent, la propri�t�
' BackColor a donc peu d'importance.
'
' ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRE SUIVANTES!
' MappingInfo=lblCaption,lblCaption,-1,ForeColor
Public Property Get ForeColor() As OLE_COLOR
Attribute ForeColor.VB_Description = "Renvoie/d�finit la couleur du premier plan utilis� pour afficher du texte et des graphiques dans un objet."
    ForeColor = lblCaption.ForeColor
End Property

Public Property Let ForeColor(ByVal New_ForeColor As OLE_COLOR)
    lblCaption.ForeColor() = New_ForeColor
    PropertyChanged "ForeColor"
End Property

' Pour fonctionner de la m�me fa�on que les propri�t�s
' Enabled des autres contr�les, la propri�t� Enabled 
' doit pr�senter un identificateur de proc�dure correct.
' L'Assistant Interface n'effectue pas cette op�ration; 
' il faut le faire � la main.
' Utilisez la bo�te de dialogue Attributs de proc�dure,
' accessible � partir du menu Outils, pour d�finir
' l'identificateur de proc�dure avec pour valeur Enabled
' pour la propri�t� Enabled. La Liste ID de la proc�dure est 
' accessible � partir du bouton Avanc�s de la bo�te de dialogue.
' S�lectionnez Enabled dans la liste Nom pour afficher
' les attributs de la propri�t� Enabled.
'
' ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRE SUIVANTES!
' MappingInfo=UserControl,UserControl,-1,Enabled
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Renvoie/d�finit une valeur qui determine si un objet peut r�pondre aux �v�nements g�n�r�s par l'utilisateur."
Attribute Enabled.VB_UserMemId = -514
    Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
    UserControl.Enabled() = New_Enabled
    PropertyChanged "Enabled"
End Property

' ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRE SUIVANTES!
' MappingInfo=lblCaption,lblCaption,-1,Font
Public Property Get Font() As Font
Attribute Font.VB_Description = "Renvoie un objet Font."
Attribute Font.VB_UserMemId = -512
    Set Font = lblCaption.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
    Set lblCaption.Font = New_Font
    PropertyChanged "Font"
    ' Ajout manuel: le changement de police peut demander un
    'ajustement de la position du contr�le Label.
    Call UserControl_Resize
End Property

' Ajout manuel � la propri�t� d'une des constantes de BorderStyleConstants.
'
' ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRE SUIVANTES!
' MappingInfo=shpBack,shpBack,-1,BorderStyle
Public Property Get BorderStyle() As BorderStyleConstants
Attribute BorderStyle.VB_Description = "Renvoie/d�finit le style de bordure pour un objet."
    BorderStyle = shpBack.BorderStyle
End Property
Public Property Let BorderStyle(ByVal New_BorderStyle As BorderStyleConstants)
    ' Validation fournie par le contr�le Shape shpBack.
    shpBack.BorderStyle() = New_BorderStyle
    PropertyChanged "BorderStyle"
End Property

' ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRE SUIVANTES!
' MappingInfo=UserControl,UserControl,-1,Refresh
Public Sub Refresh()
Attribute Refresh.VB_Description = "Force le rafra�chissement complet d'un objet."
    UserControl.Refresh
End Sub

' Ceci est un exemple de double affectation.
' Pour que l'�v�nement Click du contr�le ShapeLabel
' agisse correctement, il doit �tre d�clench� lorsque 
' l'utilisateur clique sur l'�tiquette, et/ou
' sur le corps du contr�le. L'Assistant Interface
' ne g�re pas de code pour une double affectation.
Private Sub lblCaption_Click()
    RaiseEvent Click
End Sub
Private Sub UserControl_Click()
    RaiseEvent Click
End Sub

' Ajout manuel d'une affectation � l'�v�nement
' DblClick du contr�le Label.
Private Sub lblCaption_DblClick()
    RaiseEvent DblClick
End Sub
Private Sub UserControl_DblClick()
    RaiseEvent DblClick
End Sub

' Ajout manuel d'une affectation � l'�v�nement
' MouseDown du contr�le Label.
Private Sub lblCaption_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' Voir le commentaire dans lblCaption_MouseMove.
    RaiseEvent MouseDown(Button, Shift, _
        ScaleX(X + lblCaption.Left, vbTwips, vbContainerPosition), _
        ScaleY(Y + lblCaption.Height, vbTwips, vbContainerPosition))
End Sub
Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' Voir le commentaire dans UserConrol_MouseMove.
    RaiseEvent MouseDown(Button, Shift, _
        ScaleX(X, vbTwips, vbContainerPosition), _
        ScaleY(Y, vbTwips, vbContainerPosition))
End Sub

' Ajout manuel d'une affectation � l'�v�nement
' MouseMove du contr�le Label.
'
Private Sub lblCaption_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' La position de la souris (X, Y) doit �tre convertie
    ' en coordonn�es du conteneur. Puisque cela est li� au 
    ' contr�le Label, il doit d'abord �tre converti en 
    ' coordonn�es de l'objet UserControl, en ajoutant les valeurs 
    ' lblCaption.Top et .Left. Ces valeurs peuvent �tre ajout�es 
    ' car la valeur de la propri�t� ScaleMode de l'objet UserControl 
    ' est en Twips, la m�me unit� que pour les coordonn�es du 
    ' contr�le Label. Si ce n'est pas le cas, une autre conversion 
    ' sera demand�e.
    '
    RaiseEvent MouseMove(Button, Shift, _
        ScaleX(X + lblCaption.Left, vbTwips, vbContainerPosition), _
        ScaleY(Y + lblCaption.Height, vbTwips, vbContainerPosition))
End Sub
Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' La position de la souris (X, Y) doit �tre convertie
    ' en coordonn�es du conteneur (qui peuvent �tre exprim�es,
    ' par exemple, en pixels).
    '
    ' Nous pourrions proc�der d'une mani�re plus g�n�rale
    ' en rempla�ant vbTwips par UserControl.ScaleMode.
    ' Cela fonctionnerait toujours, m�me apr�s avoir chang�
    ' la propri�t� ScaleMode. Cependant, cela signifie deux
    ' appels de m�thodes au lieu de deux constantes.
    ' Dans le cas o� l'�v�nement MouseMove peut �tre aussi 
    ' rapide que possible, la constante vbTwips est utilis�e
    ' ici. (Bien entendu, si vous changez la propri�t� ScaleMode 
    ' au moment de l'ex�cution, vous devez utiliser
    ' UserControl.ScaleMode au lieu de vbTwips!)
    '
    RaiseEvent MouseMove(Button, Shift, _
        ScaleX(X, vbTwips, vbContainerPosition), _
        ScaleY(Y, vbTwips, vbContainerPosition))
End Sub

' Ajout manuel d'une affectation � l'�v�nement
' MouseUp du contr�le Label
'.
Private Sub lblCaption_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' Voir le commentaire dans lblCaption_MouseMove.
    RaiseEvent MouseUp(Button, Shift, _
        ScaleX(X + lblCaption.Left, vbTwips, vbContainerPosition), _
        ScaleY(Y + lblCaption.Height, vbTwips, vbContainerPosition))
End Sub
Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' Voir le commentaire dans UserControl_MouseMove.
    RaiseEvent MouseUp(Button, Shift, _
        ScaleX(X, vbTwips, vbContainerPosition), _
        ScaleY(Y, vbTwips, vbContainerPosition))
End Sub

' Ajout manuel � la propri�t� d'une des constantes AlignmentConstants.
'
' ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRE SUIVANTES!
' MappingInfo=lblCaption,lblCaption,-1,Alignment
Public Property Get Alignment() As AlignmentConstants
Attribute Alignment.VB_Description = "Renvoie/d�finit l'alignement des contr�les CheckBox ou OptionButton, ou du texte d'un contr�le."
    Alignment = m_Alignment
End Property

Public Property Let Alignment(ByVal New_Alignment As AlignmentConstants)
    ' L'alignement n'est pas stock� dans la propri�t� d'un
    ' contr�le constitutif; nous devons donc fournir notre
    ' propre code de validation.
    Select Case New_Alignment
        Case vbCenter
        Case vbLeftJustify
        Case vbRightJustify
        Case Else
            ' Valeur de propri�t� non valide.
            Err.Raise 380
    ' Si vous vous arr�tez ici lors de l'ex�cution du contr�le
    ' ShapeLabel, cliquez avec le bouton droit de la souris 
    ' dans la fen�tre Code, cliquez sur Activer dans le menu
    ' contextuel, puis sur Arr�t sur les erreurs non g�r�es.
    ' Vous pouvez alors appuyer sur F5 pour continuer l'ex�cution
    ' de l'exemple.
    End Select
    m_Alignment = New_Alignment
    PropertyChanged "Alignment"
    ' Le changement de l'alignement peut affecter les positions
    ' des contr�les constitutifs.
    Call UserControl_Resize
End Property

' Le type (OLE_COLOR) pour la propri�t� BorderColor doit �tre
' ajout� manuellement.
'
' ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRE SUIVANTES!
' MappingInfo=shpBack,shpBack,-1,BorderColor
Public Property Get BorderColor() As OLE_COLOR
Attribute BorderColor.VB_Description = "Renvoie/d�finit la couleur de la bordure d'un objet."
    BorderColor = shpBack.BorderColor
End Property

Public Property Let BorderColor(ByVal New_BorderColor As OLE_COLOR)
    shpBack.BorderColor() = New_BorderColor
    PropertyChanged "BorderColor"
End Property

' ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRE SUIVANTES!
' MappingInfo=shpBack,shpBack,-1,BorderWidth
Public Property Get BorderWidth() As Integer
Attribute BorderWidth.VB_Description = "Renvoie ou d�finit la largeur d'une bordure d'un contr�le."
    BorderWidth = shpBack.BorderWidth
End Property

Public Property Let BorderWidth(ByVal New_BorderWidth As Integer)
    shpBack.BorderWidth() = New_BorderWidth
    PropertyChanged "BorderWidth"
End Property

' ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRE SUIVANTES!
' MappingInfo=lblCaption,lblCaption,-1,Caption
Public Property Get Caption() As String
Attribute Caption.VB_Description = "Renvoie/d�finit le texte affich� dans la barre de titre ou sous l'ic�ne d'un objet."
    Caption = lblCaption.Caption
End Property

Public Property Let Caption(ByVal New_Caption As String)
    lblCaption.Caption() = New_Caption
    PropertyChanged "Caption"
    ' Ajout manuel: le changement de l�gende peut demander
    ' un ajustement de la position du contr�le Label. 
    Call UserControl_Resize
End Property

' ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRE SUIVANTES!
' MappingInfo=UserControl,UserControl,-1,hDC
Public Property Get hDC() As Long
Attribute hDC.VB_Description = "Renvoie un descripteur (� partir de Microsoft Windows) de contexte de p�riph�rique de l'objet."
    hDC = UserControl.hDC
End Property

' ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRE SUIVANTES!
' MappingInfo=UserControl,UserControl,-1,hWnd
Public Property Get hWnd() As Long
Attribute hWnd.VB_Description = "Renvoie un descripteur (� partir de Microsoft Windows) d'une fen�tre de l'objet."
    hWnd = UserControl.hWnd
End Property

' ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRE SUIVANTES!
' MappingInfo=UserControl,UserControl,-1,MouseIcon
Public Property Get MouseIcon() As Picture
Attribute MouseIcon.VB_Description = "D�finit une ic�ne de souris personnalis�e."
    Set MouseIcon = UserControl.MouseIcon
End Property

Public Property Set MouseIcon(ByVal New_MouseIcon As Picture)
    Set UserControl.MouseIcon = New_MouseIcon
    PropertyChanged "MouseIcon"
End Property

' Ajout manuel � la propri�t� d'une des constantes MousePointerConstants.
'
' ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRE SUIVANTES!
' MappingInfo=UserControl,UserControl,-1,MousePointer
Public Property Get MousePointer() As MousePointerConstants
Attribute MousePointer.VB_Description = "Renvoie/d�finit le type de pointeur de la souris affich� lorsque celui-ci est d�plac� sur les �l�ments de l'objet."
    MousePointer = UserControl.MousePointer
End Property

Public Property Let MousePointer(ByVal New_MousePointer As MousePointerConstants)
    ' Validation fournie par l'objet UserControl.
    UserControl.MousePointer() = New_MousePointer
    PropertyChanged "MousePointer"
End Property

' Ajout manuel � la propri�t� d'une des constantes de ShapeConstants.
'
' ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRE SUIVANTES!
' MappingInfo=shpBack,shpBack,-1,Shape
Public Property Get Shape() As ShapeConstants
Attribute Shape.VB_Description = "Renvoie/d�finit une valeur indiquant l'apparence d'un contr�le."
    Shape = shpBack.Shape
End Property

Public Property Let Shape(ByVal New_Shape As ShapeConstants)
    ' Validation fournie par le contr�le Shape shpBack.
    shpBack.Shape() = New_Shape
    PropertyChanged "Shape"
End Property

' Charge les valeurs de propri�t�s depuis le lieu de stockage.
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)

    shpBack.BackColor = PropBag.ReadProperty("BackColor", &H80000005)
    lblCaption.ForeColor = PropBag.ReadProperty("ForeColor", &H80000012)
    UserControl.Enabled = PropBag.ReadProperty("Enabled", True)
    Set Font = PropBag.ReadProperty("Font", Ambient.Font)
    shpBack.BorderStyle = PropBag.ReadProperty("BorderStyle", 0)
    m_Alignment = PropBag.ReadProperty("Alignment", 2)
    shpBack.BorderColor = PropBag.ReadProperty("BorderColor", -2147483640)
    shpBack.BorderWidth = PropBag.ReadProperty("BorderWidth", 1)
    lblCaption.Caption = PropBag.ReadProperty("Caption", "L�gende")
    Set MouseIcon = PropBag.ReadProperty("MouseIcon", Nothing)
    UserControl.MousePointer = PropBag.ReadProperty("MousePointer", 0)
    shpBack.Shape = PropBag.ReadProperty("Shape", 2)
End Sub

Private Sub UserControl_Resize()
    Dim sngCaptionTop As Single
    Dim sngCaptionLeft As Single
    
    ' Le contr�le Shape fournissant l'arri�re-plan
    ' d'un contr�le ShapeLabel est redimensionn�
    ' pour couvrir la totalit� du contr�le.
    shpBack.Move 0, 0, ScaleWidth, ScaleHeight
    ' Le contr�le Label affichant la l�gende du contr�le
    ' ShapeLabel est dispos� en fonction de la valeur
    ' de la propri�t� Alignment.
    Select Case Alignment
        Case vbCenter
            sngCaptionLeft = (ScaleWidth - lblCaption.Width) / 2
        Case vbLeftJustify
            sngCaptionLeft = RESIZE_AdjustX * ScaleWidth
        Case vbRightJustify
            sngCaptionLeft = ScaleWidth - lblCaption.Width - RESIZE_AdjustX * ScaleWidth
    End Select
    ' Une propri�t� VerticalAlignment fonctionnerait
    ' de mani�re semblable; elle aurait besoin de sa
    ' propre instruction Enum.
    sngCaptionTop = (ScaleHeight - lblCaption.Height) / 2 - RESIZE_AdjustY * ScaleHeight
    '
    lblCaption.Move sngCaptionLeft, sngCaptionTop
End Sub

' �crit les valeurs de propri�t�s dans l'emplacement de stockage.
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    Call PropBag.WriteProperty("BackColor", shpBack.BackColor, &H80000005)
    Call PropBag.WriteProperty("ForeColor", lblCaption.ForeColor, &H80000012)
    Call PropBag.WriteProperty("Enabled", UserControl.Enabled, True)
    Call PropBag.WriteProperty("Font", Font, Ambient.Font)
    Call PropBag.WriteProperty("BorderStyle", shpBack.BorderStyle, 0)
    Call PropBag.WriteProperty("Alignment", m_Alignment, 2)
    Call PropBag.WriteProperty("BorderColor", shpBack.BorderColor, -2147483640)
    Call PropBag.WriteProperty("BorderWidth", shpBack.BorderWidth, 1)
    Call PropBag.WriteProperty("Caption", lblCaption.Caption, "L�gende")
    Call PropBag.WriteProperty("MouseIcon", MouseIcon, Nothing)
    Call PropBag.WriteProperty("MousePointer", UserControl.MousePointer, 0)
    Call PropBag.WriteProperty("Shape", shpBack.Shape, 2)
End Sub

