Attribute VB_Name = "CHOIXREP"
Option Explicit

'saisie du nom d'un repertoire existant
Function ChoixRepertoireExistant(ByVal chTexte As String, ByVal chTitre As String, ByVal chDefaut As String) As String

    On Error Resume Next
    Load FormChoixRepertoire
    FormChoixRepertoire.Caption = chTitre
    FormChoixRepertoire.drive1.Drive = Left$(chDefaut, 2)
    FormChoixRepertoire.dir1.Path = suppfirstchar(chDefaut, 2)
    FormChoixRepertoire.lbltexte = chTexte
    FormChoixRepertoire.lblRepertoireChoisi = chDefaut
    FormChoixRepertoire.Show MODAL
    ChoixRepertoireExistant = FormChoixRepertoire.lblRepertoireChoisi.Caption
    Unload FormChoixRepertoire
    On Error GoTo 0
    
End Function

