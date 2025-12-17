import UIKit

// ----------------------------------------------------------
// CLOSURES — Definition + Basic Syntax
// ----------------------------------------------------------
//
// Closures are blocks of code that behave like functions,
// except they can be stored in variables and passed around
// as values. They allow us to pass behavior into functions.
//
// A regular function:
func addTen(_ value: Int) -> Int {
    return value + 10
}

// The same logic written as a closure:


addTen(5)          // 15


// ----------------------------------------------------------
// SYNTAX BREAKDOWN
// ----------------------------------------------------------
//
// { (value: Int) -> Int in
//      return value + 10
// }
//
// { ... }
//     The curly braces wrap the entire closure.
//
// (value: Int)
//     Parameters go inside parentheses, just like functions.
//
// -> Int
//     The return type of the closure.
//
// in
//     Separates the closure's “setup” (parameters + return type)
//     from the actual code.
//
// return value + 10
//     The body of the closure — whatever code should run.
//
// Closures let us treat code like a value,
// which makes them extremely flexible.
//

// ----------------------------------------------------------
// CLOSURE TYPES — How Swift Describes a Closure
// ----------------------------------------------------------
//
// Every closure has a TYPE, just like functions do.
// The type is written as:
//
//      (ParameterTypes) -> ReturnType
//
// Example:




// ----------------------------------------------------------
// NO PARAMETERS
// ----------------------------------------------------------
//
// When a closure takes no parameters:
//      () -> ReturnType
// ReturnType may be enclosed in parentheses



   // must use parentheses because parameters are ()



// ----------------------------------------------------------
// NO RETURN VALUE
// ----------------------------------------------------------
//
// When a closure returns nothing:
//      (ParameterTypes) -> Void
// or simply:
//      (ParameterTypes) -> ()







// ----------------------------------------------------------
// NO PARAMETERS + NO RETURN VALUE
// ----------------------------------------------------------
//
// The simplest closure type of all:
//      () -> Void
// or:
//      () -> ()



   // still requires parentheses



// ----------------------------------------------------------
// PARENTHESES — IMPORTANT NOTES
// ----------------------------------------------------------
//
// • The parentheses describe the parameter list, even if empty.
// • Calling a closure ALWAYS uses parentheses.
// • ( ) means “no parameters”, not “optional” or “ignore this”.
//
// Example contrast:

let double: (Int) -> Int = { n in n * 2 }
double(5)   // must pass an Int

let greet: () -> String = { "Hi!" }
greet()     // must include ()

// Parentheses are part of the closure’s type,
// just like they are for function calls.
//

// ----------------------------------------------------------
// CLOSURES USE CASES— Capturing Values From Scope
// ----------------------------------------------------------
//
// One of the most powerful features of closures is that they
// can “capture” variables from the surrounding scope.
//
// This means the closure *remembers* values that existed when
// it was created — even if those variables go out of scope.
//
// This is something regular functions CANNOT do in the same way.
// ----------------------------------------------------------



// EXAMPLE — Closure Capturing a Local Variable
func makeCounter() {

}





// ----------------------------------------------------------
// WHAT’S HAPPENING?
// ----------------------------------------------------------
//
// • The variable 'count' lives inside makeCounter()
// • When we RETURN the closure, Swift keeps 'count' alive
// • Each returned closure gets its OWN captured version of 'count'
//
// This is how Swift implements:
//      • timers storing state
//      • animations that track progress
//      • sequences and iterators
//      • SwiftUI view updates (very important)
//
// Closures “close over” their environment —
// that’s why they are called **closures**.
//

// ----------------------------------------------------------
// CLOSURES AS PARAMETERS — Using Swift's Built-In `filter`
// ----------------------------------------------------------
//
// Many built-in Swift functions require closures.
// A common example is `.filter`, which takes a closure that
// decides whether each element should be included.
//
// Signature:
//      filter(_ isIncluded: (Element) -> Bool)
// ----------------------------------------------------------


// Example — Using filter with a full closure
var numbers = [5, 2, 9, 1, 7]

// Filter numbers greater than 4



// sorted(by:) accepts a closure with signature:
//      (Element, Element) -> Bool
//
// Return true if the FIRST element should come before the SECOND.
//




// ----------------------------------------------------------
// CLOSURES — Inferring Type From Context
// ----------------------------------------------------------
//
// Swift can often infer a closure’s parameter types and
// return type from the surrounding context.
//
// This allows us to remove the type annotations and write
// shorter, cleaner closures.
//
// Below are examples showing how Swift gradually reduces
// the required syntax.
// ----------------------------------------------------------


numbers = [1, 4, 2, 9, 3]

let sortedA = numbers.sorted(by: { (a: Int, b: Int) -> Bool in
    return a < b
})


// ----------------------------------------------------------
// Type Inferred from `.sorted(by:)`
// ----------------------------------------------------------
//
// Since `numbers` is `[Int]`, Swift knows:
//      a and b are Int
//      return type is Bool
//
// So we can drop the types:




// ----------------------------------------------------------
// Type + Return Inferred
// ----------------------------------------------------------
//
// The closure body contains a single expression,
// so Swift infers the return value too!
//
// This lets us drop `return`:



// ----------------------------------------------------------
// Trailing Closure + Full Inference
// ----------------------------------------------------------
//
// When the closure is the last parameter,
// Swift allows “trailing-closure” syntax:




// ----------------------------------------------------------
// POINT: Context drives inference
// ----------------------------------------------------------
//
// Swift looks at:
// • the function you're passing the closure into
// • the expected parameter + return types
//
// and uses that to fill in all missing types.
//

// ----------------------------------------------------------
// CLOSURES — Shorthand Argument Names ($0, $1, …)
// ----------------------------------------------------------
//
// When Swift can infer parameter types AND names,
// you don’t need to write parameter names at all.
//
// Instead, Swift provides AUTOMATIC shorthand names:
//      $0 → first parameter
//      $1 → second parameter
//
// This is optional, but very common for short closures.
// ----------------------------------------------------------

numbers = [1, 4, 2, 9, 3]

// Full version (for comparison)
let sortedE = numbers.sorted { a, b in
    a < b
}

// Using shorthand






// ----------------------------------------------------------
// FILTER EXAMPLE — with and without shorthand
// ----------------------------------------------------------

let names = ["Alice", "Bob", "Charlie", "Derek"]


// Without shorthand — full inferred syntax
let longNamesA = names.filter({ name in
    name.count > 3
})



// With shorthand — cleaner
// ["Alice", "Charlie", "Derek"]



// ----------------------------------------------------------
// WHEN TO USE SHORTHAND
// ----------------------------------------------------------
// ✔ Great for short, simple expressions
// ✔ Very common with map, filter, reduce, sorted
// ✘ Avoid for long or complex logic — readability suffers

// ----------------------------------------------------------
// MINI-CHALLENGE — CLOSURES (Filter + Map)
// ----------------------------------------------------------
//
// Goal:
// Practice using closures as function parameters with
// filter and map.
//
// Instructions:
// 1. Create an array of integers called `scores`:
//      let scores = [75, 92, 88, 61, 45, 100]
//
// 2. Use `filter` with a **full closure** to create a new
//    array called `passing` containing only scores >= 70.
//
// 3. Use `map` with a **full closure** to create a new
//    array called `bonusPoints` by adding 5 points to each
//    score in `passing`.
//
// Note: `map` takes a closure that receives **one element
// of the array at a time** and returns a transformed value.
// The result is a **new array**. The original array stays
// the same.
//
// 4. Print both arrays: `passing` and `bonusPoints`.
//
// Extension (optional):
// 5. Rewrite both closures using shorthand argument syntax.

let scores = [75, 92, 88, 61, 45, 100]

// Step 2: Filter passing scores


// Step 3: Add 5 bonus points to each passing score




// ----------------------------------------------------------
// COMPUTED PROPERTIES AND ENUMS
// ----------------------------------------------------------
// Revisiting computed properties shows similarities to closures
// Wanted to mention that computed properties can be stored in
// in enums, forgot to mention it last lecture

enum WeatherType {
    case sunny, rainy, snowy
    
    var activity: String {
        switch self {
        case .sunny: return "Go outside"
        case .rainy: return "Read a book"
        case .snowy: return "Build a snowman"
        }
    }
}

let today = WeatherType.rainy
print(today.activity)  // Read a book

// ----------------------------------------------------------
// GENERICS — Definition
// ----------------------------------------------------------
//
// Generics allow you to write flexible, reusable code that
// works with **any type** instead of one specific type.
//
// They let functions, structs, enums, and classes operate on
// placeholder types, which are filled in when used.
//
// A generic type parameter is written in angle brackets, like
// <T>. You can think of T as: “I don’t know the type yet,
// but I will when this is used.”
//
// Example — Generic function that returns the first element:




// ----------------------------------------------------------
// GENERICS — Syntax
// ----------------------------------------------------------
//
// Generic type parameters are written in angle brackets,
// usually using capital letters like T, U, or Element.
//
// Syntax:
// struct Name<T> { ... }
//
// You can then use T inside the type just like any other type.
//
// Generics always follow the name of the struct/class/func/etc.
//
// Example — Generic Box that stores any type:



// ----------------------------------------------------------
// GENERICS — Type Constraints
// ----------------------------------------------------------
//
// Type constraints restrict what kinds of types can be used
// with a generic. You can require that a type:
//
// 1. Conforms to a protocol
// 2. Inherits from a specific superclass
//
// Syntax Examples:
// T: SomeProtocol
// T: SomeClass
//
// -----------------------------
// Protocol Constraint Example
// -----------------------------


// -----------------------------
// Superclass Constraint Example
// -----------------------------
class Animal { }
class Dog: Animal { }



// ----------------------------------------------------------
// GENERICS — Multiple Constraints
// ----------------------------------------------------------
//
// A generic type can require **more than one constraint**.
// You can combine multiple protocols using `&`.
//
// Syntax:
// T: ProtocolA & ProtocolB
//
// Note: If you include a superclass constraint, it must come
// first, followed by protocol constraints.
//
// Example — Type must be a subclass + conform to protocols:
protocol Identifiable {
    var id: String { get }
}

protocol Printable {
    func printInfo()
}

class BaseModel { }



// ----------------------------------------------------------
// MINI-CHALLENGE — GENERICS + CONSTRAINTS
// ----------------------------------------------------------
//
// Write a generic function called `allMatch` that checks
// whether *all elements* in an array are equal.
//
// Requirements:
// 1. The function must work for arrays of any type.
// 2. You must add a constraint so the elements can be
//    compared for equality.
// 3. Return true for empty arrays.
//
// Examples:
// allMatch([1, 1, 1])       → true
// allMatch(["a", "a", "b"]) → false
// allMatch([])              → true


