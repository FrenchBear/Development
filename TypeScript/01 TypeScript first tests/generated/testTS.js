"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const square_1 = require("./square");
/**
 * Stack-based implementation of L-System expander.  Returns a whole string at once.
 * @param {int} depth Recursive depth required
 * @param {string} axiom Initial axiom
 * @param {Array} rules Associative array of rules for expansion
 * @returns {string} final expansion at depth level of initial axiom according to rules
 */
function getStackExpanded(depth, axiom, rules) {
    var stack = [{ a: axiom, d: depth }];
    var top = 0;
    var res = "";
    while (top >= 0) {
        var c = stack[top--];
        if (c.d == 0)
            res += c.a;
        else {
            if (c.a in rules) {
                var r = rules[c.a];
                for (var i = r.length - 1; i >= 0; i--) {
                    stack[++top] = { "a": r[i], "d": c.d - 1 };
                }
            }
            else
                stack[++top] = { "a": c.a, "d": 0 };
        }
    }
    return res;
}
var axiom = "X";
var rules = { "X": "-YF+XFX+FY-", "Y": "+XF-YFY-FX+" };
var depth = 2;
console.log(getStackExpanded(depth, axiom, rules));
// Templated string
console.log(`3.14² = ${square_1.square(3.14)}`);
// public keyword adds a property for this parameter
class Student {
    constructor(firstName, middleInitial, lastName) {
        this.firstName = firstName;
        this.middleInitial = middleInitial;
        this.lastName = lastName;
        this.fullName = firstName + " " + middleInitial + " " + lastName;
    }
}
function greeter(person) {
    return "Hello, " + person.firstName + " " + person.lastName;
}
let user = new Student("Jane", "M.", "User");
console.log(greeter(user));
//# sourceMappingURL=testTS.js.map