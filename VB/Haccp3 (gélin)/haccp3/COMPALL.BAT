rem -------------- HACCP - installation de base

compress -r haccp.exe
move haccp.ex_ masters\haccp
compress -r haccppgm.hlp
move haccppgm.hl_ masters\haccp
compress -r haccp.hlp
move haccp.hl_ masters\haccp
compress -r textes.ini
move textes.in_ masters\haccp
compress -r logo.bmp
move logo.bm_ masters\haccp
compress -r setups\haccp\setup1.exe 
move setups\haccp\setup1.ex_ masters\haccp

rem -------------- HACMOD - installation du gestionnaire de modules

compress -r hacmod.exe
move hacmod.ex_ masters\hacmod
compress -r hacmod.hlp
move hacmod.hl_ masters\hacmod
compress -r hacmodul.ini
move hacmodul.in_ masters\hacmod
compress -r textes.ini
move textes.in_ masters\hacmod
compress -r setups\hacmod\setup1.exe 
move setups\hacmod\setup1.ex_ masters\hacmod

rem -------------- GENMOD - installation d'un module supplémentaire

compress -r genmod.exe
move genmod.ex_ masters\hacmod
compress -r genmod.hlp
move genmod.hl_ masters\hacmod
compress -r genmod.lst
move genmod.ls_ masters\hacmod
compress -r genmset.lst
move genmset.ls_ masters\hacmod
compress -r setups\instmod\setup1.exe 
copy setups\instmod\setup1.ex_ masters\instmod\$setup1.ex_
move setups\instmod\setup1.ex_ masters\instmod






