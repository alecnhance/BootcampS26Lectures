// ----------------------------------------------------------
// PART 1 — OPTIONALS
// ----------------------------------------------------------

// ----------------------------------------------------------
// What is nil?
// • nil = “no value”
// • Only Optional types can be nil
// • Optional types are written with a “?” (Int?, String?, etc.)
// • Think of an Optional like a "gift box":
//      - A box may contain a value OR be empty (nil).
// • Similar to None in python or null in java
// • Benefit: We only have to check for nil in optionals,
//   not every variable in the program
// ----------------------------------------------------------

var myHouse: String? = nil
var myTV: String?
myTV = nil

// ----------------------------------------------------------
// Unwrapping
// • Optionals are like a box. We have to unwrap the box
//   to know anything about the inside
// • If we unwrap and find nil, we cannot use the value
// • Unwrapping nil breaks the rules → crash
// ----------------------------------------------------------

// ----------------------------------------------------------
// Force unwrapping (!)
// • Retrieves the value inside the Optional WITHOUT checking
// • If the Optional is nil → CRASH
// • Using ! is almost always bad practice
// ----------------------------------------------------------
var forceUnwrap: Int? = 0
print(forceUnwrap!)


// MINI-CHALLENGE 1:
// 1. Force-unwrap myTV into a constant called myTVUnwrapped.
// 2. Force-unwrap myHouse into a constant called myHouseUnwrapped.
// 3. Add a comment explaining the crash for the second one.

myTV = "My TV"
let myTVUnwrapped = myTV!
print(myTVUnwrapped)

// let myHouseUnwrapped = myHouse!   // ❌ Uncommenting this WILL crash
// ERROR EXPLANATION:
// "Fatal error: Unexpectedly found nil while unwrapping an Optional value"
// Force unwrapping tries to take the value out of an empty Optional box.


// ----------------------------------------------------------
// Optionals via Conditionals
// • Take a peek inside the box by checking != nil
// • This still requires force unwrapping
// • Only operators allowed with optionals: == and !=
// ----------------------------------------------------------

var myFavNum: String? = nil
var hisFavNum: String = "7"
var ourFavNum: String

if myFavNum != nil {
    ourFavNum = myFavNum! + hisFavNum
} else {
    ourFavNum = hisFavNum
}


// ----------------------------------------------------------
// Optional Binding
// • Safely checks and unwraps at the same time
// ----------------------------------------------------------

// ----------------------------------------------------------
// Optional Binding — If Let
// • Runs only if the Optional has a value
// • Unwrapped value exists ONLY inside the if-let braces
// ----------------------------------------------------------

if let myFavNumUnwrapped = myFavNum {
    ourFavNum = myFavNumUnwrapped + hisFavNum
} else {
    ourFavNum = hisFavNum
}


myTV = "LG"

// MINI-CHALLENGE 2:
// Use optional binding on BOTH myTV and myHouse.
// 1. Print the value if it exists, else print "nil".
// 2. Then check both at once.

if let tvValue = myTV {
    print("myTV:", tvValue)
} else {
    print("nil")
}

if let houseValue = myHouse {
    print("myHouse:", houseValue)
} else {
    print("nil")
}

// Both at once
if let tv = myTV, let house = myHouse {
    print("myTV: \(tv), myHouse: \(house)")
} else {
    print("Error!")
}


// ----------------------------------------------------------
// Optional Binding — Guard Let
// • Exits early if nil is found
// • Unwrapped value persists AFTER the guard block
// ----------------------------------------------------------

var number: Int? = 1

guard let numUnwrapped = number else {
    print("Number is nil")
    fatalError()
}
var squared = numUnwrapped * numUnwrapped
print(squared)


// ----------------------------------------------------------
// Fallback via Nil-Coalescing (??)
// • Assign a default value if an Optional is nil
// • x ?? y   →  returns x if not nil, else returns y
// ----------------------------------------------------------

let value: Int? = nil
let result: Int = value ?? 10


// MINI-CHALLENGE 3:
// 1. Use guard let to unwrap myHouse, else fatalError.
// 2. Repeat for myTV.
// 3. Print unwrapped TV value.
// 4. Use nil-coalescing (??) for a fallback.

myHouse = "My House"

guard let safeHouse = myHouse else {
    print("Unavailable")
    fatalError("myHouse is nil")
}

guard let safeTV = myTV else {
    print("Unavailable")
    fatalError("myTV is nil")
}

print("myTV:", safeTV)

let realTV = myTV ?? "no TV"
print(realTV)


// ----------------------------------------------------------
// Optional Chaining
// • Allows calling methods / properties on optionals safely
// • If the optional is nil → entire expression becomes nil
// • Useful for nested structs/classes
// ----------------------------------------------------------

struct Room {
    var tvBrand: String
}

struct House {
    var livingRoom: Room?
}

var house: House? = House(livingRoom: Room(tvBrand: "Samsung"))

// Optional chaining: safely descends multiple levels
let brand1 = house?.livingRoom?.tvBrand
print(brand1 ?? "Nil")  // Optional("Samsung")

house?.livingRoom = nil
let brand2 = house?.livingRoom?.tvBrand
print(brand2 ?? "NIL")

house = nil
let brand3 = house?.livingRoom?.tvBrand
print(brand3 ?? "NIL")  // nil


// ----------------------------------------------------------
// PART 2 — COMPUTED PROPERTIES
// ----------------------------------------------------------


// ----------------------------------------------------------
// What Are Computed Properties?
// ----------------------------------------------------------
// • A computed property does NOT store a value.
// • Instead, it *computes* and returns a value every time it is accessed.
// • They look like stored properties, but under the hood they are functions.
// • Syntax:
//       var propertyName: Type {
//           get { ... }
//           set { ... }   // optional
//       }
// • Computed properties can be:
//      - Read-only  (getter only)
//      - Read-write (getter + setter)
// • You CAN add computed properties in extensions.
// • You CANNOT add stored properties in extensions.


// Read-only computed property example
struct Circle {
    var radius: Double

    var area: Double {            // read-only computed property
        Double.pi * radius * radius
    }
}

let c1 = Circle(radius: 3)
print(c1.area)



// ----------------------------------------------------------
// Getter and Setter
// ----------------------------------------------------------
// • A getter computes and returns a value.
// • A setter runs when the property is assigned a value.
// • Inside the setter, `newValue` contains the assigned value.
// • Great for creating properties that update related stored properties.


// Example: computed property with getter + setter
struct Person {
    var firstName: String
    var lastName: String

    var fullName: String {      // read-write computed property
        get {
            "\(firstName) \(lastName)"
        }
        set {
            // Split incoming full name
            let parts = newValue.split(separator: " ", maxSplits: 1)
            if parts.count == 2 {
                firstName = String(parts[0])
                lastName = String(parts[1])
            }
        }
    }
}

var p = Person(firstName: "Ada", lastName: "Lovelace")
print(p.fullName)  // getter
p.fullName = "Grace Hopper"   // setter
print(p.firstName, p.lastName)


// MINI-CHALLENGE:
// Create a Temperature struct storing celsius.
// Add a computed property fahrenheit that:
//    get: convert to F
//    set: convert back to C
// Logic: celsius * 9/5 + 32 and celsius = (Fahrenheit - 32) * 5/9

struct Temperature {
    var celsius: Double

    var fahrenheit: Double {
        get { celsius * 9/5 + 32 }
        set { celsius = (newValue - 32) * 5/9 }
    }
}

var temp = Temperature(celsius: 0)
print(temp.fahrenheit)
temp.fahrenheit = 212
print(temp.celsius)



// ----------------------------------------------------------
// Computed vs Stored Properties
// ----------------------------------------------------------
// STORED PROPERTIES:
// • Actually store a value in memory.
// • Example: var x = 10
// • Stored properties can have property observers (willSet/didSet).
// • Stored properties cannot appear in extensions.
// • Stored properties are computed only once (when assigned).

// COMPUTED PROPERTIES:
// • Do NOT store a value.
// • Recompute every time you access them.
// • Cannot use property observers (willSet/didSet).
// • Allowed in extensions.
// • Can be read-only or read-write.


// Example demonstrating the difference:
struct Heavy {
    // Stored property (NOT computed)
    var x: Int = 5

    // Computed property (re-evaluates every access)
    var doubledX: Int {
        print("Computing doubledX")
        return x * 2
    }

    // Lazy stored property (computed once on first access)
    lazy var expensiveValue: String = {
        print("Computing expensiveValue ONCE")
        return "Done"
    }()
}



// ----------------------------------------------------------
// Use Cases
// ----------------------------------------------------------
// USE CASE 1: Derived values
// • Properties like area, circumference, average, etc.
// • They depend on stored values but do not store their own value.


// USE CASE 2: Synchronizing related properties
// • Example: fullName setter updates firstName and lastName.
// • Example: fahrenheit <-> celsius conversions.


// USE CASE 3: Extensions that add convenient helpers
// • Perfect for adding computed properties because extensions
//   cannot contain stored properties.

// ----------------------------------------------------------
// PART 3 — EXTENSIONS
// ----------------------------------------------------------

// ----------------------------------------------------------
// What are Extensions?
// • Let us add new functionality to existing types
// • Can add:
//      - Methods
//      - Computed properties
//      - Initializers
//      - Protocol conformance
// • Cannot add stored properties
// ----------------------------------------------------------

// Adding methods to built-in types

extension Int {
    func squared() -> Int { self * self }
    func cubed() -> Int { self * self * self }
}

5.squared()
3.cubed()

extension String {
    var isLong: Bool { self.count > 10 }
}

print("Hello".isLong)
print("ThisIsAVeryLongString".isLong)

// ----------------------------------------------------------
// Why Extensions?
// • Cleaner code organization
// • Add helper utilities on standard types
// • Add protocol conformance in separate sections
// ----------------------------------------------------------
struct Place {
    var name: String
}

protocol Describable {
    var description: String { get }
}

extension Place: Describable {
    var description: String { "A person named \(name)" }
}

// MINI-CHALLENGE (Extensions):
// 1. Extend String → containsWhitespace() -> Bool
// 2. Extend Array  → isNotEmpty property
// 3. Create protocol ElementCountable with elementCount: Int
// 4. Extend Array to conform to ElementCountable

extension String {
    func containsWhitespace() -> Bool {
        return self.contains(" ")
    }
}

extension Array {
    var isNotEmpty: Bool { !self.isEmpty }
}

protocol ElementCountable {
    var elementCount: Int { get }
}

extension Array: ElementCountable {
    var elementCount: Int { self.count }
}

print("hello world".containsWhitespace())
print([1,2,3].isNotEmpty)
print([10,20,30].elementCount)





// ----------------------------------------------------------
// END OF FILE
// ----------------------------------------------------------
