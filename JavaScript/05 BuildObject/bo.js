// Examples of objects creation
//
// 2026-02-02   PV

var myObject = {
    color: "Red",
    count: 5,
    log: function () {
        console.log("Quantity: " + this.count + ", Color: " + this.color);
    }
};
myObject.log();

var redObject = new Object();
redObject.color = "Red";
redObject.count = 7;
redObject.log = function () {
    console.log("Quantity: " + this.count + ", Color: " + this.color);
}
redObject.log();

// ----------
// Using a constructor function

function ColorObject(col, cnt) {
    this.color = col;
    this.count = cnt;
    this.log = function () {
        console.log("Quantity: " + this.count + ", Color: " + this.color);
    };
}

var greenObject = new ColorObject("Green", 6)
greenObject.log();

// Now all objects created with ColorObject will have this property
// Without prototype, we just add an attribute to ColorObject itself, it does not get propagated to new objects
// In other words, (constructor function).prototype ≈ Class
ColorObject.prototype.isAvailable = true;

var cyanObject = new ColorObject("Cyan", 1);
console.log("cyanObject.isAvailable:", cyanObject.isAvailable);

// inheritance
function SpecialColorObject(name, color, count) {
    ColorObject.call(this, color, count);
    this.name = name;
    this.describe = function () {
        console.log(this.name + ": color=" + this.color);
    };
}

// Setup the inheritance using prototypal inheritance
SpecialColorObject.prototype = new ColorObject();

var brownObject = new SpecialColorObject("Marron", "Brown", 1);
brownObject.log();
brownObject.describe();

// ----------
// Using a class

class KolorObject {
    constructor(col, cnt) {
        this.color = col;
        this.count = cnt;

        // Handle missing parameters
        if (col == undefined) { this.color = "Black"; }
        if (cnt == undefined) { this.count = 0; }
    }

    // function keyword not allowed here!
    log() {
        console.log("Quantity: " + this.count + ", Color: " + this.color);
    }
}

// Can add members to the class using prototype property
KolorObject.prototype.isAvailable = true;
KolorObject.prototype.add = function(n){this.count += n;};


var blueObject = new KolorObject("Blue", 3);
blueObject.log();

// Inheritance
class SpecialKolorObject extends KolorObject {
    constructor(name, color, count) {
        super(color, count);
        this.name = name;
        this.describe = function () {
            console.log(this.name + ": color=" + this.color);
        }
    }
};

var yellow = new SpecialKolorObject("Poussin", "Yellow", 2);
yellow.log();
yellow.describe();
