// Arrays in JavaScript
//
// 2026-02-03   PV

"use strict";

var arr = ["red", "green", "blue", "yellow", "orange", "purple"];

// Index go from 0 to .length-1
console.log(arr[0]);
console.log(arr.length);

// Using an out-of-bounds index just returns indefined
console.log(arr[8]);

// Replace an element by undefined, leaving a "hole" (does not shift further elements)
delete arr[3];
console.log(arr[3]);

// Creating a hole at indexes 6 and 7
arr[8] = "brown";

// Insert an element at the head and at the end
arr.unshift("white");
arr.push("black");

// returns the last element and remove it from the array
console.log(arr.pop())

// returns the first element and remove it from the array
console.log(arr.shift())

// output
console.log(arr);   // Note holes: <1 empty item> and <2 empty items>
console.log(arr.valueOf());     // ValueOf() returns a collection of values, thet's the default function
console.log(arr.toString());    // output comma-separated values
console.log(arr.join(" "));     // use a specific separator
console.log();

// Arrays concatenation
var arr1 = ["a", "b", "c"];
var arr2 = ["x", "y", "z"];
var combined = arr1.concat(arr2);       // arr1 is NOT modified. Can list more than 1 array

// Create a new array
var dup = combined.slice();             // Just a copy
var sl = combined.slice(1, 4);          // slice from..to, to excluded ['b','c','x']
var sl2 = combined.slice(-3, -1);       // = arr.slice(arr.length-3, arr.length-1);
var last3 = combined.slice(-3, arr.length); // Last 3 elements

// remove/insert elements, update underlying array (.splice returns an array containing deleted elements)
arr.splice(3, 1);                       // Delete element at index 3
console.log(arr.toString());
arr.splice(5, 2, "yellow", "perwinkle");     // Delete 2 elements at index 6 and inserts two
console.log(arr.toString());

// Sorting
arr.sort()
console.log(arr.toString());

function lengthComparer(a, b) {
    return a.length - b.length;
}
arr.sort(lengthComparer);
console.log(arr.toString());


function numericSort(a, b) {
    if (isNaN(a) || isNaN(b)) return 0; // Can't compare if not numeric
    if (a == b) return 0;
    if (a < b) return -1;
    if (a > b) return 1;
}

var numbers = [1, 2, 3];
numbers.reverse(numericSort);
console.log(numbers);
console.log();

// Searching (using strict equality ===)
var arr = ["orange", "green", "blue", "yellow", "blue", "purple"];
arr.indexOf("blue");            // return 2
arr.lastIndexOf("blue");        // returns 4
arr.indexOf("blue", 3);         // returns 4
arr.lastIndexOf("blue", -3);    // returns 2

// Search using a privided function
function isPrimary(color, index, array) {
    if (color == "red" || color == "blue" || color == "yellow") {
        return true;
    }
    return false;
}
console.log(arr.find(isPrimary));
console.log(arr.findIndex(isPrimary));

// Filtering
var subset = arr.filter(isPrimary);
console.log(subset);

// Creating a new array using a mapping function
console.log(arr.map(function (s) { return s.toUpperCase() }));

function isOdd(element, index, array) {
    if (isNaN(element)) { return false; }
    if (element % 2 != 0) { return true; }
    return false;
}
var boolArray = numbers.map(isOdd);
console.log(boolArray);

// some/every using a predicate function
console.log(numbers.some(isOdd)); // returns true
console.log(numbers.every(isOdd)); // returns false
console.log();

// Processing
function process(item, index, array) {
    console.log("[" + index + "]: " + item + ", in array ", array.toString());
}

arr.forEach(process);
console.log();

// Reduce
function sumArray(total, item, index, array) {
    return total + item;
}
var arr = [1, 3, 5, 2, 8, 1];
console.log(numbers);
var sum = arr.reduce(sumArray, 0);
console.log(sum);
var sum = arr.reduceRight(sumArray, -10);     // Reduce starting at the end, priding initial value
console.log(sum);
