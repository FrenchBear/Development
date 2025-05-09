Attribute VB_Name = "Code128"
' Code128
' Module de g�n�ration d'un code barre 128
' Retourne un tableau de largeurs de 1 � 4, alternativement noir et blanches
' 19/03/97 PV

Option Explicit

Dim t128(106) As String

Private Sub InitT128()
  t128(0) = "212222"     '00
  t128(1) = "222122"     '01
  t128(2) = "222221"     '02
  t128(3) = "121223"     '03
  t128(4) = "121322"     '04
  t128(5) = "131222"     '05
  t128(6) = "122213"     '06
  t128(7) = "122312"     '07
  t128(8) = "132212"     '08
  t128(9) = "221213"     '09
  t128(10) = "221312"    '10
  t128(11) = "231212"    '11
  t128(12) = "112232"    '12
  t128(13) = "122132"    '13
  t128(14) = "122231"    '14
  t128(15) = "113222"    '15
  t128(16) = "123122"    '16
  t128(17) = "123221"    '17
  t128(18) = "223211"    '18
  t128(19) = "221132"    '19
  t128(20) = "221231"    '20
  t128(21) = "213212"    '21
  t128(22) = "223112"    '22
  t128(23) = "312131"    '23
  t128(24) = "311222"    '24
  t128(25) = "321122"    '25
  t128(26) = "321221"    '26
  t128(27) = "312212"    '27
  t128(28) = "322112"    '28
  t128(29) = "322211"    '29
  t128(30) = "212123"    '30
  t128(31) = "212321"    '31
  t128(32) = "232121"    '32
  t128(33) = "111323"    '33
  t128(34) = "131123"    '34
  t128(35) = "131321"    '35
  t128(36) = "112313"    '36
  t128(37) = "132113"    '37
  t128(38) = "132311"    '38
  t128(39) = "211313"    '39
  t128(40) = "231113"    '40
  t128(41) = "231311"    '41
  t128(42) = "112133"    '42
  t128(43) = "112331"    '43
  t128(44) = "132131"    '44
  t128(45) = "113123"    '45
  t128(46) = "113321"    '46
  t128(47) = "133121"    '47
  t128(48) = "313121"    '48
  t128(49) = "211331"    '49
  t128(50) = "231131"    '50
  t128(51) = "213113"    '51
  t128(52) = "213311"    '52
  t128(53) = "213131"    '53
  t128(54) = "311123"    '54
  t128(55) = "311321"    '55
  t128(56) = "331121"    '56
  t128(57) = "312113"    '57
  t128(58) = "312311"    '58
  t128(59) = "332111"    '59
  t128(60) = "314111"    '60
  t128(61) = "221411"    '61
  t128(62) = "431111"    '62
  t128(63) = "111224"    '63
  t128(64) = "111422"    '64
  t128(65) = "121124"    '65
  t128(66) = "121421"    '66
  t128(67) = "141122"    '67
  t128(68) = "141221"    '68
  t128(69) = "112214"    '69
  t128(70) = "112412"    '70
  t128(71) = "122114"    '71
  t128(72) = "122411"    '72
  t128(73) = "142112"    '73
  t128(74) = "142211"    '74
  t128(75) = "241211"    '75
  t128(76) = "221114"    '76
  t128(77) = "413111"    '77
  t128(78) = "241112"    '78
  t128(79) = "134111"    '79
  t128(80) = "111242"    '80
  t128(81) = "121142"    '81
  t128(82) = "121241"    '82
  t128(83) = "114212"    '83
  t128(84) = "124112"    '84
  t128(85) = "124211"    '85
  t128(86) = "411212"    '86
  t128(87) = "421112"    '87
  t128(88) = "421211"    '88
  t128(89) = "212141"    '89
  t128(90) = "214121"    '90
  t128(91) = "412121"    '91
  t128(92) = "111143"    '92
  t128(93) = "111341"    '93
  t128(94) = "131141"    '94
  t128(95) = "114113"    '95
  t128(96) = "114311"    '96
  t128(97) = "411113"    '97
  t128(98) = "411311"    '98
  t128(99) = "113141"    '99
  t128(100) = "114131"   '100 CODE B
  t128(101) = "311141"   '101 CODE A
  t128(102) = "411131"   '102 FNC1
  t128(103) = "211412"   '103 START CODE A
  t128(104) = "211214"   '104 START CODE B
  t128(105) = "211232"   '105 START CODE C
  t128(106) = "2331112"  '106 STOP
End Sub



Public Function G�n�reCode128(sCha�ne As String) As String
  If t128(0) = "" Then InitT128
  If (Len(sCha�ne) And 1) = 1 Then
    MsgBox "G�n�reCode128 ne traite que le codage d'un nombre pair de chiffres"
    G�n�reCode128 = ""
    Exit Function
  End If
  
  Dim i As Integer
  For i = 1 To Len(sCha�ne)
    If Mid(sCha�ne, i, 1) < "0" Or Mid(sCha�ne, i, 1) > "9" Then
      MsgBox "G�n�reCode128 ne traite que le codage des chiffres"
      G�n�reCode128 = ""
      Exit Function
    End If
  Next
  
  Dim iRang As Integer, iVal As Integer
  Dim sR�sultat As String
  Dim iCheckSum As Integer
  sR�sultat = t128(105) ' Code C: num�rique par tranche de 2 chiffres
  iCheckSum = 105
  For i = 1 To Len(sCha�ne) Step 2
    iVal = Val(Mid(sCha�ne, i, 2))
    sR�sultat = sR�sultat & t128(iVal)
    iRang = iRang + 1
    iCheckSum = iCheckSum + iRang * iVal
  Next
  sR�sultat = sR�sultat & t128(iCheckSum Mod 103) & t128(106)
  G�n�reCode128 = sR�sultat
End Function

