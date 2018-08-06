import { square } from "./square";

interface AxiomDepth {
    a: string;
    d: number;
}

/**
 * Stack-based implementation of L-System expander.  Returns a whole string at once.
 * @param {int} depth Recursive depth required
 * @param {string} axiom Initial axiom
 * @param {Array} rules Associative array of rules for expansion
 * @returns {string} final expansion at depth level of initial axiom according to rules
 */
function getStackExpanded(depth: number, axiom: string, rules: { [index: string]: string }): string {
    var stack: AxiomDepth[] = [{ a: axiom, d: depth }];
    var top: number = 0;
    var res: string = "";
    while (top >= 0) {
        var c: AxiomDepth = stack[top--];
        if (c.d == 0)
            res += c.a;
        else {
            if (c.a in rules) {
                var r: string = rules[c.a];
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

var axiom: string = "X";
var rules: { [index: string]: string } = { "X": "-YF+XFX+FY-", "Y": "+XF-YFY-FX+" };
var depth: number = 2;
console.log(getStackExpanded(depth, axiom, rules));


// Templated string
console.log(`3.14² = ${square(3.14)}`);



// public keyword adds a property for this parameter
class Student {
    fullName: string;
    constructor(public firstName: string, public middleInitial: string, public lastName: string) {
        this.fullName = firstName + " " + middleInitial + " " + lastName;
    }
}

interface Person {
    firstName: string;
    lastName: string;
}

function greeter(person: Person) {
    return "Hello, " + person.firstName + " " + person.lastName;
}

let user = new Student("Jane", "M.", "User");
console.log(greeter(user));
