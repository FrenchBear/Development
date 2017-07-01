# Hangman
# Learning Python
# 2015-05-02    PV

import random

words = ['chicken', 'dragon', 'platypus', 'aarduino', 'grizzly']
lives_remaining = 14
guessed_letters=''

def play():
    word = pick_a_word()
    while True:
        guess = get_guess(word)
        if process_guess(guess, word):
            print('You win!')
            break
        if lives_remaining==0:
            print('You are hung!')
            print('The word was '+word)
            break

def pick_a_word():
    word_position = random.randint(0, len(words)-1)
    return words[word_position]

def get_guess(word):
    print_word_with_blanks(word)
    print('Lives remaining: '+str(lives_remaining))
    guess=input('Guess a letter or whole word? ')
    return guess.lower()

def process_guess(guess, word):
    if len(guess)==len(word):
        return whole_word_guess(guess, word)
    elif len(guess)==1:
        return single_letter_guess(guess, word)
    elif len(guess)==0:
        return False
    else:
        print('Invalid input!  Accepted: single letter or word of '+str(len(word))+' letters.')
        return False

def single_letter_guess(guess, word):
    global lives_remaining, guessed_letters
    if word.find(guess)==-1:
        # Incorrect
        lives_remaining -= 1
    guessed_letters += guess
    return all_letters_guessed(word)

def all_letters_guessed(word):
    for letter in word:
        if guessed_letters.find(letter)==-1:
            return False
    return True

def whole_word_guess(guess, word):
    global lives_remaining
    if guess.lower()==word.lower():
        return True
    else:
        lives_remaining -= 1
        return False

def print_word_with_blanks(word):
    display_word=''
    for letter in word:
        if guessed_letters.find(letter)>-1:
            # Found
            display_word += letter
        else:
            # Not found
            display_word += '_'
    print(display_word)
    

play()
