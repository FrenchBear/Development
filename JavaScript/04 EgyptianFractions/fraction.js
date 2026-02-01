// Basic implementation of a fraction in JavaScript
//
// 2026-02-01 	PV

class Fraction {
constructor(num, den) {
        this.num = num;
        this.den = den;
    }

    // Static helper to find GCD
    static gcd(a, b) {
        a = Math.abs(a);
        b = Math.abs(b);
        while (b) {
            a %= b;
            [a, b] = [b, a];
        }
        return a;
    }

    // Method to return a new, simplified Fraction
    simplify() {
        const commonDivisor = Fraction.gcd(this.num, this.den);
        return new Fraction(this.num / commonDivisor, this.den / commonDivisor);
    }

    // Subtract and auto-simplify
    subtract(other) {
        const newNum = this.num * other.den - other.num * this.den;
        const newDen = this.den * other.den;
        return new Fraction(newNum, newDen).simplify();
    }

    toString() {
        return `${this.num}/${this.den}`;
    }
}
