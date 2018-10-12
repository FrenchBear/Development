// guessing_game
// Learning rust
// 2018-10-12	PV

extern crate rand;

use std::io;
use rand::Rng;

fn main() {
    println!("Guess the number!");

    let secret_number = rand::thread_rng().gen_range(1, 101);
    println!("Secret number: {}", secret_number);

    println!("Please input your guess");
    let mut guess = String::new();
    io::stdin().read_line(&mut guess).expect("Failed to read line");
    println!("You guessed: {}", guess);
}
