/*
    Complex Number Class and Mathematical Functions
*/

class Complex {
    constructor(re, im) {
        this.re = re;
        this.im = im;
    }

    add(other) {
        return new Complex(this.re + other.re, this.im + other.im);
    }

    sub(other) {
        return new Complex(this.re - other.re, this.im - other.im);
    }

    mul(other) {
        return new Complex(
            this.re * other.re - this.im * other.im,
            this.re * other.im + this.im * other.re
        );
    }

    div(other) {
        const denominator = other.re * other.re + other.im * other.im;
        if (denominator === 0) {
            return new Complex(NaN, NaN);
        }
        return new Complex(
            (this.re * other.re + this.im * other.im) / denominator,
            (this.im * other.re - this.re * other.im) / denominator
        );
    }

    // z^n where n is a complex number
    pow(n) {
        // Using formula: z^n = exp(n * log(z))
        const logZ = this.log();
        const product = logZ.mul(n);
        return product.exp();
    }
    
    // e^z
    exp() {
        const expRe = Math.exp(this.re);
        return new Complex(
            expRe * Math.cos(this.im),
            expRe * Math.sin(this.im)
        );
    }

    // log(z) - principal value
    log() {
        const r = Math.sqrt(this.re * this.re + this.im * this.im);
        const theta = Math.atan2(this.im, this.re);
        if (r === 0) {
            return new Complex(-Infinity, 0);
        }
        return new Complex(Math.log(r), theta);
    }
}

// Collection of functions to be plotted
const complexFunctions = {
    f_z_pow_1_5: (z) => z.pow(new Complex(1.5, 0)),
    f_1_div_z: (z) => new Complex(1, 0).div(z),
    f_z_pow_a_bi: (z, a, b) => z.pow(new Complex(a, b)),
    f_exp_z: (z) => z.exp(),
    f_log_z: (z) => z.log(),
};
