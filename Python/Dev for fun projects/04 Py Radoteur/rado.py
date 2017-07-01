# rado.py - Radoteur Python
# Algorithm to generate random names similar to the ones from a provided list
# All pairs of characters in generated names must be present in the original list
#
# 2015-05-11    PV
# 2015-05-13    PV      File version and eliminate duplicates

import random


# Dictionary of strings indexed by a character representing all characters that follow the one of the index
dic = { }


# Provides a list of names (returns a list of strings with names separated by spaces or CR or LF)
def get_names():
    # Read from a file
    if False:
        file = 'Prénoms UTF-8.txt'
        f = open(file, encoding='utf8')     # Note that this doesn't remove utf8 BOM, so the file has no BOM
        names = f.readlines()
        f.close()
    # Direct constant
    else:
        names = [ u'Juliette sophie brigitte géraldine valérie adèle delphine jacqueline yvette julie madeleine justine caroline fabienne maude audrey rosine odile joséphine anne mauricette alice colette suzanne barbara christine viviane marthe honorine hélène fanny sarah renée geneviève clémentine anémone amélie irène marianne sandra virginie karine myriam claudine mariette bernadette laurence rosalie chloé louise sylviane élisabeth blandine frédérique francoise annie catherine christiane rose clotilde annaick gisèle nathalie sonia ella armelle élise vanessa lucette francine christelle magali céline estelle eugénie amandine sylvie liliane claire denise marielle patricia marie élodie lucienne émilie simone monique mathilde andrée béatrice henriette solange arielle emma thérèse judith émeline deborah léonie inès angèle murielle ségolène nadège corinne isabelle emmanuelle noémie véronique lucie pauline carole jeanne clémence adeline bénédicte luce diane marguerite gwendoline cécile aude laure agnès gaëlle charlotte stéphanie agathe édith sabine ingrid florence edwige éléonore sandrine sibrine gwénaelle eulalie lydie martine paulette aurélie' ]

    return names

# Remove_accents, simple version using string.translate()
def lower_no_accent(to_translate):
    tabin =  u'àâäéèêëîïôöûüÿ'
    tabout = u'aaaeeeeiioouuy'
    tabin = [ord(char) for char in tabin]
    translate_table = dict(zip(tabin, tabout))
    return to_translate.lower().translate(translate_table)

# Add a pair of characters to the global dictionary
def add_pair(c1, c2):
    global dic
    if c1!=' ' and (c1<'a' or c1>'z'):
        c1 = '_'
    if c2!=' ' and (c2<'a' or c2>'z'):
        c2 = '_'

    if c1 in dic:
        dic[c1] = dic[c1] + c2
    else:
        dic[c1] = c2

        
def random_word():
    while True:
        # First character is a random one from the list of space followers
        lc = s = dic[' '][random.randint(0,len(dic[' '])-1)]
        while True:
            # Don't want too long names
            if len(s)>20:
                return s
            c = dic[lc][random.randint(0,len(dic[lc])-1)]
            if c==' ':
                break
            s += c
            lc = c
        # If word generated is too short, we ignore it and generate another word
        if len(s)>4:
            return s


# 1st part, string analysis
for line in get_names():
  for name in lower_no_accent(line).split():
    last_char = ' '
    for c in name:
        add_pair(last_char, c)
        last_char = c
    add_pair(last_char, ' ')

# Trace
print(dic.keys())
for key in sorted(dic.keys()):
    print(key+' -> '+dic[key])


# Generate 20 words, eliminating duplicates
random.seed(123)
already_generated = []
for i in range(20):
    while True:
        name = random_word()
        if not name in already_generated:
            print(name)
            already_generated.append(name)
            break
