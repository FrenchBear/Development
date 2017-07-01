Attribute VB_Name = "MenuMicrobSoft"
' MenuMicrobsoft.bas
' Mise à jour du menu Microb'Soft
' 31/08/1998 PV
' 18/05/1999 PV + Tables serveur
' 25/07/1999 PV - MAJ6000, -FichierDD
' 29/07/1999 PV + FTour
' 25/08/1999 PV + Tables facturation
'  8/11/1999 PV + Statistiques
' 25/11/1999 PV + Grilles
'  3/12/1999 PV - TablesDoc
' 12/01/2000 PV - LibellésCRA
' 24/02/2000 PV Conserve le racourci Programs Update pour l'Italie et UK
' 16/10/2000 PV Z: -> X:; EnlèveAttributRO dans EffaceTout (pb err 75)
' 24/10/2000 PV + GImp


Option Explicit


Private Sub EffaceTout()
  Dim Rac As String
  Rac = Dir(sMenuProgMicrobsoft & "*.lnk")
  While Rac <> ""
    If StrComp(Rac, "Programs Update.lnk") <> 0 Then    ' Spécial UK (réseau NT4)
      EnlèveAttributRO sMenuProgMicrobsoft & Rac
      EffaceFichier sMenuProgMicrobsoft & Rac
    End If
    Rac = Dir
  Wend
End Sub


Private Sub UnRaccourci(ByVal sProgramme As String, ByVal sRaccourci As String, Optional ByVal sTravail As String)
  If sTravail = "" Then sTravail = sMenuProgMicrobsoft
  CréeRaccourci sMenuProgMicrobsoft & sRaccourci, IIf(InStr(1, sProgramme, ":") = 0, sDossierMicrobsoft, "") & sProgramme, sTravail
End Sub



Public Sub MAJMenuMicrobsoft()
  Trace "Mise à jour du menu Microb'Soft…"

  ' On efface tous les raccourcis actuels
  TraceDétaillée "On efface tout"
  EffaceTout

  TraceDétaillée "On crée le répertoire"
  On Error Resume Next
  MkDir sMenuProgMicrobsoft
  On Error GoTo 0

  Select Case LangueSystème
    Case LANG_FRENCH:   UnRaccourci "X:\Utils\win32\majsoft.exe", "!MAJ Programmes.lnk"
    Case LANG_ITALIAN:  UnRaccourci "X:\Utils\win32\majsoft.exe", "!Microb'Soft Update.lnk"
    Case LANG_ENGLISH:  ' Nop, spécial UK
    Case LANG_DUTCH:    UnRaccourci "X:\Utils\win32\majsoft.exe", "!Microb'Soft Update.lnk"
    Case Else:          UnRaccourci "X:\Utils\win32\majsoft.exe", "!Microb'Soft Update.lnk"
  End Select

  UnRaccourci "ImprimeStats.exe", "Imprime stats.lnk"
  UnRaccourci "Plannings.exe", "Plannings.lnk"
  UnRaccourci "scraw.exe", "SCRAW.lnk"
  UnRaccourci "Serveur6000.exe", "Serveur 6000.lnk"
  UnRaccourci "TablesAdmin.exe", "Tables administratives.lnk"
  UnRaccourci "TablesFEU.exe", "FEU et FME.lnk"
  UnRaccourci "SaisieFSE.exe", "Saisie labo.lnk"
  UnRaccourci "TablesLabo.exe", "Tables labo.lnk"
  UnRaccourci "DocConsultants.exe", "Documents consultants.lnk"
  UnRaccourci "Projets.exe", "Projets et doc BD.lnk"
  UnRaccourci "TablesServeur.exe", "Tables serveur.lnk"
  UnRaccourci "TablesFacturation.exe", "Tables facturation.lnk"
  UnRaccourci "FTour.exe", "Fiches tournée.lnk"
  UnRaccourci "RefDoc.exe", "Références documentaires.lnk"
  UnRaccourci "Statistiques.exe", "Statistiques.lnk"
  UnRaccourci "Grilles.exe", "Grilles.lnk"
  UnRaccourci "GImp.exe", "Gestionnaire d'impression.lnk"

  UnRaccourci "X:\Microbsoft\Raccourcis.exe", "Raccourcis.lnk", "X:\Microbsoft"
End Sub

