# pygamekeys.py
# event.key retourne des codes en supposant un clavier qwerty
# event.dict['unicode'] retourne le vrai caractère de la touche
# 2016-06-17    PV

import pygame
from pygame.locals import *
import sys


def terminate():
    pygame.quit()
    sys.exit()

def loop():
    for event in pygame.event.get(): # event handling loop
        if event.type == QUIT:
            terminate()
        if event.type == KEYDOWN:
            carac = event.dict['unicode']
            #print(event.key, carac)
            print(event.dict)

pygame.init()
DISPLAYSURF = pygame.display.set_mode((1024, 768))

while True:
    loop()
