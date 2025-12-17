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

var score: Int = 50
score = 75   // ok
// score = "hello"  // not allowed (type mismatch)


// ----------------------------------------------------------
// WHAT IS A CONSTANT?
// ----------------------------------------------------------

// Constants cannot be modified. This makes sure important data does
// not change by accident. They are defined by "let"

var age = 20
let birthYear = 2004
age = 23
//birthYear = 2005


// ----------------------------------------------------------
// VARIABLE DECLARATION
// ----------------------------------------------------------

// A variable/constant declaration specifies a name and data type.

// Implicit: Swift infers the type (less readable)
var implicitNum = 10

// Explicit: Type is stated clearly (better practice)
var explicitNum: Int = 10

// ----------------------------------------------------------
// PRINTING
// ----------------------------------------------------------

// You can print strings to the console for debugging purposes
print("Hello there")

/*
 TODO: Explicitly initialize a constant called myNum
 that holds an integer (Int) of value 5. Explicitly initialize a
 variable called num that holds an integer of the value 10. Initialize
 a constant called aNum that holds an integer of the value 0 implicitly.
 Print all three values to the console.
 */
let myNum: Int = 5
var num: Int = 10
let aNum = 0
print(myNum)
print(num)
print(aNum)


// ----------------------------------------------------------
// BASIC DATA TYPES
// ----------------------------------------------------------

// Int → whole numbers
// You CANNOT assign decimal values to an integer
var whole: Int = 11
//var incorrect: Int = 1.0

// String → text surrounded by quotes
var greeting: String = "hello"

// You can copy values into other variables
// Works for all types of variables, not just strings
var copy: String = greeting

// Multiline String → uses triple quotes
var longText = """
This is
a multi-line
string.
"""

// String concatenation
var fullName = "Tim" + " " + "Cook " + greeting

// String interpolation
var name = "Alec"
var intro = "Hello, \(name)!"

// String interpolation helpful for numbers especially
var ageForString: Int = 5
var numInterpolation = "Hello, I am \(num) years old"

// Double → decimal numbers
var pi: Double = 3.14159

// Formatting Decimal Numbers in Strings
var astr = String(format: "The value of pi is %.2f", pi)

// Bool → true or false
var isReady: Bool = true
var isDone: Bool = false


// ----------------------------------------------------------
// OPERATORS — MATHEMATICAL
// ----------------------------------------------------------

// Operators are symbols we can use to perform
// mathematical or logical operations

var five: Int = 5
var one: Int = 1

var sum = one + five
var difference = one - five
var product = one * five
var quotient = 20 / five
var remainder = five % one


// ----------------------------------------------------------
// OPERATORS — ASSIGNMENT
// ----------------------------------------------------------

var favoriteNumber: Int = 5
favoriteNumber = 2   // reassigning value

var os: String = "iOS"
os = "macOS"
os = "iPadOS"


// ----------------------------------------------------------
// COMPOUND ASSIGNMENT OPERATORS
// ----------------------------------------------------------

var testNum: Int = 0

num += 2   // add
num *= 2   // multiply
num /= 2   // divide
num -= 2   // subtract
num %= 2   // remainder

// ----------------------------------------------------------
// MINI-CHALLENGE 2
// ----------------------------------------------------------


// TODO: Initialize two variables, a and b, with unique
// integers. In variable c, take the sum of a and b. After each
// step, print "c is now {value of c}". using compound assignment,
// add 10 to c, multiply it by 2, then subtract by 7. In variable
// d, store the remainder of dividing c by 2.
var a = 4
var b = 7
var c = a + b

c += 10
print("c is now \(c)")

c *= 2
print("c is now \(c)")

c -= 7
print("c is now \(c)")

var d = c % 2


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

var myAge: Int = 20
var canBuyAlcohol = myAge >= 21
var cannotBuyAlcohol = myAge < 21

var user = "John Smith"
var VIP = "Tim Cook"
var userIsVIP = user == VIP

var usersDad = "Tim Cook"
var usersDadIsVIP = usersDad == VIP


// ----------------------------------------------------------
// LOGICAL OPERATORS
// ----------------------------------------------------------

// Used to evaluate predicates
// && = AND
// || = OR
// !  = NOT

var pipeIsBroken = true && false
var pipeIsWorking = !pipeIsBroken

var waterSupplyExists = true || false
var canDrinkWater = pipeIsWorking && waterSupplyExists

var shouldCallMaintenance = !pipeIsWorking && waterSupplyExists


// ----------------------------------------------------------
// Swift Introduction: Conditionals and Collections
// ----------------------------------------------------------



// ----------------------------------------------------------
// CONDITIONALS — SYNTAX
// ----------------------------------------------------------

// Conditionals execute code under certain specified conditions
// Conditions must evaluate to true or false.

var condition: Bool = true

if condition {
    print("condition is true")
} else {
    print("condition is false")
}


// ----------------------------------------------------------
// CONDITIONALS — CURLY BRACKETS
// ----------------------------------------------------------

// In Swift: the open brace MUST follow the condition.
// Code inside the braces runs only if the condition is met.
// else marks what gets executed if condition not fulfilled

if condition {
    print("true branch")
} else {
    print("false branch")
}


// ----------------------------------------------------------
// GUARD STATEMENT
// ----------------------------------------------------------

// guard runs its else block ONLY if the condition is false.
// This is kinda the opposite of an if statement
// You must exit using: return, break, continue, throw.
// guard protects programs by not proceeding

var guardCondition: Bool = true

guard guardCondition else {
    print("Pipe is broken! Won’t proceed.")
    // return, break, continue, throw
    fatalError()
}

print("Pipe is working! Proceed w/out worry.")


// ----------------------------------------------------------
// GUARD — EQUIVALENT LOGIC TO IF
// ----------------------------------------------------------

var guardCondition2 = true

if guardCondition2 {
    // do nothing
} else {
    print("Pipe is broken! Won’t proceed.")
    fatalError()
}

print("Pipe is working! Proceed w/out worry.")


// ----------------------------------------------------------
// SWITCH STATEMENTS
// ----------------------------------------------------------

// • More readable form of conditionals
// • All possible values must be handled
// • Must include a default case (for integers at least)
// • Swift executes the FIRST matching case

let day = 3

switch day {
case 1:
    print("Monday")
case 2:
    print("Tuesday")
case 3:
    print("Wednesday")
default:
    print("Other day")
}


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
if a > b {
    print(a)
} else {
    print(b)
}

// 4. Print the largest of a, b, c (requires else-if)
if a >= b && a >= c {
    print(a)
} else if b >= a && b >= c {
    print(b)
} else {
    print(c)
}

// 5. Print "iOS Club" only if a is even, else "Unlucky"
//    MUST use the % operator.
if a % 2 == 0 {
    print("iOS Club")
} else {
    print("Unlucky")
}

// 6. Using guard, check if a > b.
//    If false: print “Oops.” then call fatalError()

guard a > b else {
    print("Oops.")
    fatalError("a is not greater than b")
}

print("a is greater than b")


// ----------------------------------------------------------
// OPERATORS — TERNARY CONDITIONAL
// ----------------------------------------------------------

// Short-hand conditional assignment:
// condition ? valueIfTrue : valueIfFalse

let personAge = 20
let canDrink = personAge >= 21 ? "Yes" : "No"


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
var myArray: [String] = []
myArray = ["a", "b", "c"]
// var incorrectArr = ["a", 2]

// Other array creation methods
let defaultArray = Array(repeating: "Swift", count: 3)
let combinedArray = [1, 2] + [3, 4]


// ----------------------------------------------------------
// ARRAY FUNCTIONS
// ----------------------------------------------------------

// Arrays have inherent operations, functions, and properties
// (More on functions later)

var nums = [10, 20, 30]

// Check if an array has any elements in it
nums.isEmpty

// Access an element at an index
nums[1]

// Modify an element an an indeex
nums[1] = 99

// Append an array
nums += [200, 300]

// Get the length of an array
nums.count


// ----------------------------------------------------------
// SETS — BASICS
// ----------------------------------------------------------

// Set declaration and initialization in one step
var integerSet = Set<Int>()

// Two step
var integerSet2: Set<Int>
integerSet2 = []


// Sets are like unordered arrays that cannot have duplicates
var cuteAnimalSetA: Set<String> = ["Axolotl", "Quokka", "Armadillo"]
var cuteAnimalSetB: Set<String> = ["Armadillo", "Axolotl", "Quokka"]

cuteAnimalSetA == cuteAnimalSetB   // true because sets ignore order


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

var myDictionary: [Int : String] = [:]
myDictionary[1] = "One"
myDictionary[2] = "Two"

let values = myDictionary.values
let keys = myDictionary.keys


// ----------------------------------------------------------
// DICTIONARY OPERATIONS
// ----------------------------------------------------------

var namesOfMonths = [
    1: "January",
    2: "February",
    3: "March"
]

// Add a key value pair
namesOfMonths[4] = "April"

// Retrieve a value for a key (returns Optional<valueType>)
// More on optionals later, but this is one way to access values

guard let myMonth = namesOfMonths[1] else {
    print("Month has no value!")
    fatalError()
}

print("The name of month 1 is \(myMonth)")




// ----------------------------------------------------------
// MINI-CHALLENGE (Collections)
// ----------------------------------------------------------

// 1. Declare an array of Strings named myCandies and initialize to empty
var myCandies: [String] = []

// 2. Ask neighbor on your right for their candies and append ALL at once
let neighborsRightCandies = ["Skittles", "Twix"]
myCandies += neighborsRightCandies

// 3. Declare a Set<String> named myCandiesSet
var myCandiesSet: Set<String> = Set()

// 4. Initialize the Set with elements from myCandies
myCandiesSet = Set(myCandies)

// 5. Ask neighbor on your left for their candies and union them in
// (Hint): use the formUnion function
let neighborsLeftCandies: Set<String> = ["KitKat", "Skittles"]
myCandiesSet.formUnion(neighborsLeftCandies)

// 6. Declare and initialize a dictionary months: Int → String
var months: [Int : String] = [:]

// 7. Add first 6 months
months[1] = "January"
months[2] = "February"
months[3] = "March"
months[4] = "April"
months[5] = "May"
months[6] = "June"

// 8. Update the 2nd month to "Short Month"
months[2] = "Short Month"



// ----------------------------------------------------------
// RANGES
// ----------------------------------------------------------
// • A half-open interval goes from a lower bound UP TO but NOT including the upper bound.
// • Example: 0..<5 means 0,1,2,3,4 (NOT 5)

let halfOpenRange = 0..<5
let closedRange = 1...5   // includes 5


// ----------------------------------------------------------
// LOOPS — For-In and While
// ----------------------------------------------------------
// • Used to traverse elements in collection types
// • Two major types:
//   - For-In loops
//   - While loops

// For-in loops with arrays
let array = ["a", "b", "c"]

for element in array {
    print(element)
}

// For-in loops with ranges
for num in 0...3 {
    print(num)
}


// For-in loops with dictionaries
let dict = ["A": 1, "B": 2]

for (key, value) in dict {
    print("\(key): \(value)")
}


// While loops
var counter = 0

while counter < 3 {
    print("counter is \(counter)")
    counter += 1
}


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

func greet(name: String) -> String {
    return "Hello, \(name)"
}

func printGreeting(name: String) {
    print("Hello, \(name)")
}

func getNumber() -> Int {
    return 42
}

func doNothing() { }


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
    print(x)
}

printValue(value: 5)

func printValueNoLabel(_ x: Int) {
    print(x)
}

printValueNoLabel(5)


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
func doubleNumber(_ num: Int) -> Int {
    return num * 2
}

// Step 2: Test the function
let testValue = 7

// Step 3: Print the result
let doubled = doubleNumber(testValue)
print("The doubled number is \(doubled)")


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
let person = ("Alec", 21)
print(person.0)   // "Alec"
print(person.1)   // 21

// Tuple with labels (more readable)
let student = (name: "Alec", year: 2)
print(student.name)  // "Alec"
print(student.year)  // 2

// Tuples are often used as return values
func getCoordinates() -> (x: Int, y: Int) {
    return (3, 7)
}

let point = getCoordinates()
print("x: \(point.x), y: \(point.y)")



