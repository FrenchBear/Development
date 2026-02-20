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

// Collection (map) of functions to be plotted
const complexFunctions = {
    f_z_pow_1_5: {
        func: (z) => z.pow(new Complex(1.5, 0)),
        usesA: false,
        usesB: false
    },
    f_1_div_z: {
        func: (z) => new Complex(1, 0).div(z),
        usesA: false,
        usesB: false
    },
    f_z_pow_a_bi: {
        func: (z, a, b) => z.pow(new Complex(a, b)),
        usesA: true,
        usesB: true
    },
    f_a_times_z_pow_b: {
        func: (z, a, b) => new Complex(a, 0).mul(z.pow(new Complex(b, 0))),
        usesA: true,
        usesB: true
    },
    f_a_times_exp_z: {
        func: (z, a) => new Complex(a, 0).mul(z.exp()),
        usesA: true,
        usesB: false
    },
    f_log_z: {
        func: (z) => z.log(),
        usesA: false,
        usesB: false
    },
};
