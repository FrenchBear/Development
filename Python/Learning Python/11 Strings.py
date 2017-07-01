# Strings
# Learning Python
# 2015-05-02    PV

s="Once Upon a Time"
print(s.endswith('.jpg'))
print('{0} times {1} equals {2}'.format(8,7,8*7))
print(s.split())            # ['Once', 'Upon', 'a', 'Time']
print('Yes\nNo\n\nMaybe\n'.splitlines())    # ['Yes', 'No', '', 'Maybe']
print('<'+'\ta b  '.strip()+'>')
print('"hello, world"'.strip('"'))

print('\nFind and replace')
print(s.find('Time'))       # 12
print(s.find('time'))       # -1
print(s.replace('Time','Day'))

print('\nCase')
print(s.capitalize())       # Once upon a time
print(s.lower())
print(s.upper())

print('\nJustification')
print('<'+s.center(40)+'>')
print('<'+s.ljust(40)+'>')
print('<'+s.rjust(40)+'>')

print('\nisalpha')
print('Abc'.isalpha())
print('Abc12'.isalpha())
print('Abc12!'.isalpha())

print('\nisalnum')
print('Abc'.isalnum())
print('Abc12'.isalnum())
print('Abc12!'.isalnum())

print('\nisspace')
print('Qb2'.isspace())
print(' \t'.isspace())

