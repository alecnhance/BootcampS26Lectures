import UIKit

// ----------------------------------------------------------
// Swift Introduction: Variables, Types, and Operators
// ----------------------------------------------------------

// Swift is Apple’s modern language—safer and more concise than Objective-C.
// It is protocol-oriented, but supports OOP and functional programming.

// ----------------------------------------------------------
// WHAT IS A VARIABLE?
// ----------------------------------------------------------

// A variable is a named storage location whose value can change,
// but the type cannot.





// ----------------------------------------------------------
// WHAT IS A CONSTANT?
// ----------------------------------------------------------

// Constants cannot be modified. This makes sure important data does
// not change by accident. They are defined by "let"




// ----------------------------------------------------------
// VARIABLE DECLARATION
// ----------------------------------------------------------

// A variable/constant declaration specifies a name and data type.

// Implicit: Swift infers the type (less readable)


// Explicit: Type is stated clearly (better practice)

//var explicit2: String = 10 (not oK)

// ----------------------------------------------------------
// PRINTING
// ----------------------------------------------------------

// You can print strings to the console for debugging purposes


// ----------------------------------------------------------
// MINI-CHALLENGE 1
// ----------------------------------------------------------
/*
 TODO: Explicitly initialize a constant called myNum
 that holds an integer (Int) of value 5. Explicitly initialize a
 variable called num that holds an integer of the value 10. Initialize
 a constant called aNum that holds an integer of the value 0 implicitly.
 Print all three values to the console.
 */



// ----------------------------------------------------------
// BASIC DATA TYPES
// ----------------------------------------------------------

// Int → whole numbers
// You CANNOT assign decimal values to an integer


// String → text surrounded by quotes


// You can copy values into other variables
// Works for all types of variables, not just strings


// Multiline String → uses triple quotes


// String concatenation


// String interpolation


// String interpolation helpful for numbers especially
// var astr6 = astr + 10 + astr2 incorrect


// Double → decimal numbers


// Formatting Decimal Numbers in Strings


// Bool → true or false



// ----------------------------------------------------------
// OPERATORS — MATHEMATICAL
// ----------------------------------------------------------

// Operators are symbols we can use to perform
// mathematical or logical operations

var five: Int = 5
var one: Int = 1

var sum = one + five
var difference = five - one
var product = five * one
var quotient = 20 / five
var remainder = five % one


// ----------------------------------------------------------
// OPERATORS — ASSIGNMENT
// ----------------------------------------------------------









// ----------------------------------------------------------
// COMPOUND ASSIGNMENT OPERATORS
// ----------------------------------------------------------

var testNum: Int = 0




// ----------------------------------------------------------
// MINI-CHALLENGE 2
// ----------------------------------------------------------


// TODO: Initialize two variables, a and b, with unique
// integers. In variable c, take the sum of a and b. After each
// step, print "c is now {value of c}". using compound assignment,
// add 10 to c, multiply it by 2, then subtract by 7. In variable
// d, store the remainder of dividing c by 2.



// ----------------------------------------------------------
// COMPARISON OPERATORS
// ----------------------------------------------------------

// These always evaluate to Bool (true/false)

1 == 1
1 != 2
3 > 1
2 < 5
4 >= 4
6 <= 10




// ----------------------------------------------------------
// LOGICAL OPERATORS
// ----------------------------------------------------------

// Used to evaluate predicates
// && = AND
// || = OR
// !  = NOT




// ----------------------------------------------------------
// Swift Introduction: Conditionals and Collections
// ----------------------------------------------------------



// ----------------------------------------------------------
// CONDITIONALS — SYNTAX
// ----------------------------------------------------------

// Conditionals execute code under certain specified conditions
// Conditions must evaluate to true or false.

var condition: Bool = true




// ----------------------------------------------------------
// CONDITIONALS — CURLY BRACKETS
// ----------------------------------------------------------

// In Swift: the open brace MUST follow the condition.
// Code inside the braces runs only if the condition is met.
// else marks what gets executed if condition not fulfilled





// ----------------------------------------------------------
// GUARD STATEMENT
// ----------------------------------------------------------

// guard runs its else block ONLY if the condition is false.
// This is kinda the opposite of an if statement
// You must exit using: return, break, continue, throw.
// guard protects programs by not proceeding

var guardCondition: Bool = true







// ----------------------------------------------------------
// GUARD — EQUIVALENT LOGIC TO IF
// ----------------------------------------------------------

var guardCondition2 = true




// ----------------------------------------------------------
// SWITCH STATEMENTS
// ----------------------------------------------------------

// • More readable form of conditionals
// • All possible values must be handled
// • Must include a default case (for integers at least)
// • Swift executes the FIRST matching case

let day = 3





// ----------------------------------------------------------
// MINI-CHALLENGE (Conditionals)
// ----------------------------------------------------------
// 1. You should already have integers a, b, c, d in your playground.
//    (For clarity we define them here.)
// var a = 4
// var b = 7
// var c = 10
// var d = 3

// 2. Compare these numbers using conditionals.

// 3. Print the larger value between a and b


// 4. Print the largest of a, b, c (requires else-if)


// 5. Print "iOS Club" only if a is even, else "Unlucky"
//    MUST use the % operator.


// 6. Using guard, check if a > b.
//    If false: print “Oops.” then call fatalError()
//guard a > b else {
//    print("oops")
//    fatalError()
//}



// ----------------------------------------------------------
// OPERATORS — TERNARY CONDITIONAL
// ----------------------------------------------------------

// Short-hand conditional assignment:
// condition ? valueIfTrue : valueIfFalse

let personAge = 20




// ----------------------------------------------------------
// COLLECTION TYPES
// ----------------------------------------------------------

// • Arrays — ordered values
// • Sets — unordered, unique values
// • Dictionaries — key/value associations


// ----------------------------------------------------------
// ARRAYS — BASICS
// ----------------------------------------------------------

// Arrays store homogeneous types!
// Arrays in swift are 0-indexed


// var incorrectArr = ["a", 2]

// Other array creation methods



// ----------------------------------------------------------
// ARRAY FUNCTIONS
// ----------------------------------------------------------

// Arrays have inherent operations, functions, and properties
// (More on functions later)

var nums = [10, 20, 30]

// Check if an array has any elements in it


// Access an element at an index


// Modify an element an an indeex


// Append an array


// Get the length of an array



// ----------------------------------------------------------
// SETS — BASICS
// ----------------------------------------------------------

// Set declaration and initialization in one step


// Two step



// Sets are like unordered arrays that cannot have duplicates
var cuteAnimalSetA: Set<String> = ["Axolotl", "Quokka", "Armadillo"]
var cuteAnimalSetB: Set<String> = ["Armadillo", "Axolotl", "Quokka"]




// ----------------------------------------------------------
// SET FUNCTIONS
// ----------------------------------------------------------

// Common set functions include union, intersection, subtraction,
// and symmetric difference.
let unionSet = cuteAnimalSetA.union(cuteAnimalSetB)
let intersection = cuteAnimalSetA.intersection(cuteAnimalSetB)
let subtracting = cuteAnimalSetA.subtracting(["Axolotl"])
let symmetric = cuteAnimalSetA.symmetricDifference(["Giraffe"])

// Other set functions inform about relationships between sets
// like subsets, supersets, and disjointedness
cuteAnimalSetA.isSubset(of: cuteAnimalSetB)
cuteAnimalSetA.isSuperset(of: cuteAnimalSetB)
cuteAnimalSetA.isDisjoint(with: ["Tiger", "Lion"])


// ----------------------------------------------------------
// DICTIONARIES — BASICS
// ----------------------------------------------------------

// Dictionaries store homogeneous types for keys and values,
// but keys and values do not have to be the same type.
// You can interpret dictionaries as a function of values
// mapped to keys




// ----------------------------------------------------------
// DICTIONARY OPERATIONS
// ----------------------------------------------------------

var namesOfMonths = [
    1: "January",
    2: "February",
    3: "March"
]

// Add a key value pair


// Retrieve a value for a key (returns Optional<valueType>)
// More on optionals later, but this is one way to access values






// ----------------------------------------------------------
// MINI-CHALLENGE (Collections)
// ----------------------------------------------------------

// 1. Declare an array of Strings named myCandies and initialize to empty


// 2. Ask neighbor on your right for their candies and append ALL at once


// 3. Declare a Set<String> named myCandiesSet


// 4. Initialize the Set with elements from myCandies


// 5. Declare and initialize a dictionary months: Int → String


// 6. Add first 3 months

 
// 7. Update the 2nd month to "Short Month"


// ----------------------------------------------------------
// Swift: Ranges and Functions
// iOS Bootcamp: Async 3
// ----------------------------------------------------------


// ----------------------------------------------------------
// RANGES
// ----------------------------------------------------------
// • A half-open interval goes from a lower bound UP TO but NOT including the upper bound.
// • Example: 0..<5 means 0,1,2,3,4 (NOT 5)




// ----------------------------------------------------------
// LOOPS — For-In and While
// ----------------------------------------------------------
// • Used to traverse elements in collection types
// • Two major types:
//   - For-In loops
//   - While loops

// For-in loops with arrays
let array = ["a", "b", "c"]



// For-in loops with ranges



// For-in loops with dictionaries
let dict = ["A": 1, "B": 2]




// While loops
var counter = 0




// ----------------------------------------------------------
// FUNCTIONS — Overview
// ----------------------------------------------------------
// • Functions are self-contained chunks of code that perform a specific task.
// • Functions can:
//
//   1. Take args + return something:
//      func name(paramName: Type) -> ReturnType { body }
//
//   2. Take args + return nothing:
//      func name(paramName: Type) { body }
//
//   3. Take no args + return something:
//      func name() -> ReturnType { body }
//
//   4. Take no args + return nothing:
//      func name() { body }

// Examples:


// ----------------------------------------------------------
// ARGUMENT LABEL vs PARAMETER NAME
// ----------------------------------------------------------
// • Parameter name = used INSIDE the function
// • Argument label = used when CALLING the function
//
//   func myFunc(label paramName: Type) {
//       print(paramName)
//   }
//
//   myFunc(label: 10)
//
// • Omitting argument label with underscore:
//   func myFunc(_ paramName: Type)
//   myFunc(10)
//
// • If no separate label is given, Swift uses the same name for both.

func printValue(value x: Int) {

}




func printValueNoLabel(_ x: Int) {
  
}




// ----------------------------------------------------------
// MINI-CHALLENGE — Functions (Simplified Version)
// ----------------------------------------------------------
//
// Write a function called doubleNumber that does the following:
//
// 1. Takes in ONE Int as a parameter
// 2. Returns that number doubled
// 3. Create a test number and call the function
// 4. Print the result using string interpolation
//
// Example:
// If the function receives 5, it should return 10.
//

// Step 1: Define the function


// Step 2: Test the function


// Step 3: Print the result



// ----------------------------------------------------------
// TUPLES
// ----------------------------------------------------------
//
// Tuples let you group multiple values together into a single value.
// They are lightweight and great for returning multiple things from a function.
//
// Examples:
//
// • A tuple can store different types
// • You can access values by index or by name
//

// Tuple without labels


// Tuple with labels (more readable)


// Tuples are often used as return values
func getCoordinates() {

}





