// Examples of objects creation
//
// 2026-02-02   PV

"use strict";

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
KolorObject.prototype.add = function (n) { this.count += n; };


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

// ----------
// call/apply

function Vehicle(weight, cost) {
    this.weight = weight;
    this.cost = cost;
}
function Truck(weight, cost, axles, length) {
    Vehicle.call(this, weight, cost)
    this.axles = axles;
    this.length = length;
}
var tonka = new Truck(5, 25, 3, 15);
console.log(tonka);

function OtherTruck(weight, cost, axles, length) {
    Vehicle.apply(this, [weight, cost])     // Similar to call truck, but the list can be built dynamically
    this.axles = axles;
    this.length = length;
}
var mack = new Truck(3, 15, 6, 12);
console.log(mack);

// ----------
// Objects hierarchy ≈ namespaces

var mySample = {}; // global object
// Define the namespace hierarchy
mySample.things = {};
mySample.things.helpers = {};
mySample.otherThings = {};
// Add stuff to the namespaces
mySample.things.count = 0;
mySample.things.helpers.logger = function (msg) {
    console.log(msg);
}

// Create an object, making sure it's not created twice (undefined means false)
this.mySample = this.mySample || {}

let helpers = mySample.things.helpers;
helpers.logger("Hello world");

// ----------
// Exceptions

try {
    var x = 5;
    var y = 0;
    if (y == 0) {
        throw ("Can't divide by zero")
    }
    49
    console.log(x / y);
}
catch (e) {
    console.log("Error: " + e);
}
finally {
    console.log("Finally block executed");
}

// ----------
// Promises

function getNumber(bEven) {
    return new Promise(function (fulfill, reject) {
        // perform some long running task
        setTimeout(
            function () {
                var i = Math.round((Math.random() * 100), 0);
                if ((i % 2 != 0 && bEven) ||
                    (i % 2 == 0 && !bEven)) {
                    reject(i);
                }
                else {
                    fulfill(i);
                }
            }, 500);    // Waits for 500ms
    });
}

var p = getNumber(true);
p.then(
    function (i) { console.log("Promise fulfilled, i = " + i); },
    function (i) { console.log("Promise rejected, i = " + i); }
);
console.log("Promise made...");

// Same thing, catching the error callback
p.then(function (i) { console.log("Promise fulfilled, i = " + i); })
    .catch(function (i) { console.log("Promise rejected, i = " + i); });
    