# ConsoleUnicode
# 2016-08-10    PV

import sys
from os import system

system('chcp 65001 >nul')
sys.stdout = open(sys.stdout.fileno(), mode='w', encoding='utf-8', buffering=1)

print('\ntest_ascii()')
sys.stdout.write("Ûnicöde")
print(sys.stdout.encoding)
sys.stdout.encoding
print('\u2500\u2500')
print(chr(0x0472))
s = "Hello\nWorld \u263A\n"
print(s)
