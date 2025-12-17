// ==========================================================
// iOS Bootcamp — Swift: Enums, Structs, Classes, Protocols
// ==========================================================
//
// This playground includes all lecture content for:
// • Enums
// • Structs
// • Classes
// • Protocols
//
// ==========================================================



// ----------------------------------------------------------
// ENUMS — What problem do they solve?
// ----------------------------------------------------------
//
// Problem:
// If we use Strings for limited-choice values like:
//
//      var weatherType: String = "sunny"
//
// We can accidentally write:
//      weatherType = "corn"
//      if weatherType == "suny" { … } // typo!
//
// Enums prevent invalid values.



// ----------------------------------------------------------
// ENUM BASICS
// ----------------------------------------------------------

enum WeatherType {
    case sunny, cloudy, rainy, windy, snowy
}

var todayWeather: WeatherType = WeatherType.sunny
//todayWeather = WeatherType.corn

//if todayWeather == WeatherType.suny {}

// ----------------------------------------------------------
// ENUM SHORTCUT
// ----------------------------------------------------------
//
// If Swift already knows the enum type:
//      var w: WeatherType = .sunny
//
// You can omit "WeatherType" before the dot.
todayWeather = .windy


// ----------------------------------------------------------
// ENUMS — ASSOCIATED VALUES
// ----------------------------------------------------------
//
// Each case can hold extra data.
//

enum DetailedWeather {
    case sunny(intensity: Int)
    case snowy(mass: Int)
    case rainy(intensity: Int)
}

// Example with associated values:
let forecast: DetailedWeather = .sunny(intensity: 5)



// ----------------------------------------------------------
// ENUMS — READING ASSOCIATED VALUES WITH SWITCH
// ----------------------------------------------------------
// Enums can have functions, and we can use a function to
// retrieve any associated values
//
// The convention is to use a switch statement to return
// values based on the case. Within switch statements,
// we use the let keyword to unpack the associated value
//
// Self refers to the current case of whatever enum instance
// was called during runtime

enum DetailedWeather2 {
    case sunny(intensity: Int)
    case snowy(mass: Int)
    case rainy(intensity: Int)
    func getValue() -> Int {
        switch self {
        case .sunny(let intensity):
            return intensity
        case .snowy(let mass):
            return mass
        case .rainy(let intensity):
            return intensity
        }
    }
}

let forecast2 = DetailedWeather2.rainy(intensity: 10)
let tempValue = forecast2.getValue()

// ----------------------------------------------------------
// ENUM CONSTANTS
// ----------------------------------------------------------
// Enums can also be used to store never-changing groups of
// values as constants.
//
// The "static" keyword allows us to retrieve values without
// initializing a case

enum SocialURL {
    static let twitter = "https://twitter.com/"
    static let insta = "https://www.instagram.com/gtiosclub"
}
let activeURL = SocialURL.insta

// ----------------------------------------------------------
// ENUM COMPUTED PROPERTIES
// ----------------------------------------------------------
// Enums can store computed properties. There will be more on
// computed properties later




// ----------------------------------------------------------
// MINI-CHALLENGE: ENUMS
// ----------------------------------------------------------
//
// 1. Create an enum "Season" with cases:
//      spring, summer, autumn, winter
//
// 2. Make a variable currentSeason initialized to summer.
//
// 3. Add associated values:
//    • spring(manyFlowersOutside: Bool)
//    • summer(iceCreamNeeded: Bool)
//    • autumn(leavesTurnedOrange: Bool)
//    • winter(isSnowing: Bool, temp: Int)
//
// 4. Add get() returning the associated value.
// ----------------------------------------------------------

enum Season {
    case spring(manyFlowersOutside: Bool)
    case summer(iceCreamNeeded: Bool)
    case autumn(leavesTurnedOrange: Bool)
    case winter(isSnowing: Bool, temp: Int)

    func get() -> Int? {
        switch self {
        case .spring(let manyFlowers):
            return manyFlowers ? 1 : 0
        case .summer(let iceCreamNeeded):
            return iceCreamNeeded ? 1 : 0
        case .autumn(let leavesTurnedOrange):
            return leavesTurnedOrange ? 1 : 0
        case .winter(let isSnowing, _):
            return isSnowing ? 1 : 0
        }
    }
}

let currentSeason = Season.summer(iceCreamNeeded: true)
currentSeason.get()



// ----------------------------------------------------------
// STRUCTS & CLASSES — What are they?
// ----------------------------------------------------------
// Classes and structs can be thought of as general purpose
// constructs for which we can assign properties and methods
//
// Both let you store related data + methods.
// But they behave very differently.
//
// Key Interview Topic:
//      Struct = VALUE type
//      Class = REFERENCE type
//
// Value types get copied whenever referenced in code, almost
// like printing out homework and handing to a friend

// Reference types pass around the same exact reference to the
// item whenever referenced, like giving someone a link to
// your google doc homework



// ----------------------------------------------------------
// STRUCTS — Definition
// ----------------------------------------------------------
// Defines attributes and actions that pertain to some real or
// abstract entity.
//
// Every struct we define is a Type.
//
// Different copies of the Type can be called "instances"
//
// Structs are "pass by value", so whenever we assign a struct
// instance to a new variable, that new variable holds a completely
// new copy
//
// We can access properties of instances with the "." operator. Dot
// operator also used to call methods of instances
//
// Specifying an initializer for Structs in swift is optional. Default
// initializers will be created


struct CatStruct {
    var name: String
    var color: String
    var age: Int
    
    func sayHi(to person: String) -> String {
        return "Hello \(person). Meow."
    }
}

let myStructCat = CatStruct(name: "Felix", color: "red", age: 10)
let copiedStructCat = myStructCat  // COPY
// Changing copiedStructCat does NOT affect myStructCat



// ----------------------------------------------------------
// STRUCTS — IMMUTABLE
// ----------------------------------------------------------
// Changing a struct value creates a *new copy*. You never
// actually edit an instance.
//

var catA = CatStruct(name: "Felix", color: "red", age: 10)
var catB = catA
catB.age = 99
// catA.age remains 10

let catC = CatStruct(name: "Tom", color: "Black", age: 40)
//catC.age = 41


// ----------------------------------------------------------
// STRUCTS — MUTATING METHODS
// ----------------------------------------------------------
// Swift doesn't allow you to manipulate properties within
// methods without marking the func as mutating (For Value types)
//
// Methods that modify properties must be marked as "mutating".
//

struct Counter {
    var value: Int = 0
    
    mutating func increment() {
        value += 1
    }
}



// ----------------------------------------------------------
// MINI-CHALLENGE — STRUCTS
// ----------------------------------------------------------
// 1. Create enum Color: red, blue, green, yellow, black, white.
// 2. Create struct Ball with:
//      diameter: Int
//      color: Color
// 3. Make myBall with diameter 10, color .blue
// 4. Copy it into aBall
// 5. Change aBall's diameter → observe difference
// ----------------------------------------------------------

enum Color {
    case red, blue, green, yellow, black, white
}

struct Ball {
    var diameter: Int
    var color: Color
}

let myBall = Ball(diameter: 10, color: .blue)
var aBall = myBall
aBall.diameter = 20
// myBall remains unchanged — value-type behavior



// ----------------------------------------------------------
// CLASSES — Definition
// ----------------------------------------------------------
// Defines attributes and actions that pertain to some real or
// abstract entity.
//
// Every class we define is a Type, similar to structs, and we
// create instances
//
// Classes are reference types.
//
// They REQUIRE initializers. Use the init method
//
// They support inheritance.
//

class CatClass {
    var name: String
    var color: String
    var age: Int
    
    init(name: String, color: String, age: Int) {
        self.name = name
        self.color = color
        self.age = age
    }
    
    func sayHi(to person: String) -> String {
        return "Hello \(person). Meow."
    }
}



let myClassCat = CatClass(name: "Felix", color: "red", age: 10)
let friendsClassCat = myClassCat   // SAME reference
friendsClassCat.age = 20
// myClassCat.age is now 20 too



// ----------------------------------------------------------
// CLASSES — INHERITANCE
// ----------------------------------------------------------

class Animal {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Lion: Animal {
    var roarVolume: Int = 10
}

let lion: Lion = Lion(name: "Steve")
print(lion.roarVolume)


// ----------------------------------------------------------
// MINI-CHALLENGE — CLASSES
// ----------------------------------------------------------
//
// 1. Create class Animal with:
//      name: String
//      aggressionLevel: Int
//      hasClaws: Bool
//
// 2. Make myPet = Animal("Fletcher", 100, true)
//
// 3. Assign neighborsPet = myPet
//      neighborsPet.aggressionLevel = 50
//
// 4. Print both
// ----------------------------------------------------------

class AnimalChallenge {
    var name: String
    var aggressionLevel: Int
    var hasClaws: Bool
    
    init(name: String, aggressionLevel: Int, hasClaws: Bool) {
        self.name = name
        self.aggressionLevel = aggressionLevel
        self.hasClaws = hasClaws
    }
}

let myPet = AnimalChallenge(name: "Fletcher", aggressionLevel: 100, hasClaws: true)
let neighborsPet = myPet
neighborsPet.aggressionLevel = 50
// myPet.aggressionLevel is also 50 — reference semantics

// ----------------------------------------------------------
// MINI-CHALLENGE — Knowledge Check
// ----------------------------------------------------------
// Answer the following questions:
// 1. Explain what a class in Swift is to an 8 year old.
// 2. Explain what a struct in Swift is to an 8 year old.
// 3. List 4 major differences between a struct and a class in Swift.
// 4. List 2 major similarities between a struct and a class in Swift.



// ----------------------------------------------------------
// PROTOCOLS — Definition
// ----------------------------------------------------------
//
// A protocol defines requirements (properties + methods + more).
// Protocols can be adapted by a class, struct, or enum
// Conforming types MUST implement them.
// Similar to Java Interfaces.
// A protocol is a contract. If a type wants to conform,
// it must implement all requirements in protocol
//
// Properties: protocols specify if properties can be gettable
// or settable with the "get" and "set" keyword in brackets
// after property
// ----------------------------------------------------------

protocol Vehicle {
    var weight: Double { get }
}

protocol Test {
    var test: String { get set }
}


// ----------------------------------------------------------
// PROTOCOL CONFORMANCE
// ----------------------------------------------------------

struct Car: Vehicle {
    var gas: Double
    var weight: Double
}

struct Plane: Vehicle {
    var altitude: Double
    var weight: Double
}

struct TestStruct: Test {
    //let test: String
    var test: String
}

// ----------------------------------------------------------
// PROTOCOLS AS TYPE
// ----------------------------------------------------------
protocol Drawable {
    var id: Int { get }
    func draw()
}

struct DrawPerson: Drawable {
    var id: Int
    func draw() {
        print("Draw Person")
    }
}

struct DrawTree: Drawable {
    var id: Int
    func draw() {
        print("Draw tree")
    }
}

var drawable: Drawable
drawable = DrawPerson(id: 2)
drawable.draw()
drawable = DrawTree(id: 20)
drawable.draw()
//drawable.id = 3

var drawTree: DrawTree = DrawTree(id: 40)
drawTree.id = 50


// ----------------------------------------------------------
// MINI-CHALLENGE — PROTOCOLS
// ----------------------------------------------------------
//
// Improve the "total area" problem:
//
// 1. Create protocol Shape with a property area: Double { get }
// 2. Create Circle + Rectangle conforming to Shape
// 3. Fill an array [Shape]
// 4. Compute total area in ONE for-loop
// ----------------------------------------------------------

protocol Shape {
    var x: Double { get }
    var y: Double { get }
    var area: Double { get }
    
    func containsPoint(x: Double, y: Double) -> Bool
}

//Struct to define a circle entity
struct Circle: Shape {
    let x: Double
    let y: Double
    let radius: Double
    
    

    var area: Double {
        return Double.pi * radius * radius
    }

    func containsPoint(x: Double, y: Double) -> Bool {
        //code
        return false;
    }
    
    
}

//Struct to define a rectangle entity
struct Rectangle: Shape {
    let x: Double
    let y: Double
    let width: Double
    let height: Double

    var area: Double {
        return width * height
    }

    func containsPoint(x: Double, y: Double) -> Bool {
        //code
        return false
    }
}

// Initialize list of circles
var circles: [Circle] = []

// Initialize list of rectangles
var rectangles: [Rectangle] = []

var shapes: [Shape] = []

//create and add circles
var circle1: Circle = Circle(x: 0, y: 0, radius: 2)
var circle2: Circle = Circle(x: 2, y: 2, radius: 3)
shapes.append(circle1)
shapes.append(circle2)

//create and add rectangles
var rect1: Rectangle = Rectangle(x: 2, y: 1, width: 3, height: 2)
var rect2: Rectangle = Rectangle(x: 2, y: 3, width: 4, height: 1)
shapes.append(rect1)
shapes.append(rect2)

var totalAreas: Double = 0
for circle in shapes {
    totalAreas += circle.area
}
//for rectangle in rectangles {
//    totalAreas += rectangle.area
//}
print(totalAreas)

// ----------------------------------------------------------
// IMPORTANT NOTE
// ----------------------------------------------------------
// We don't generally use protocols to handle heterogeneous
// arrays, that is not good practice. Protocols more commonly
// used like the drawable example
//

// ----------------------------------------------------------
// EQUATABLE
// ----------------------------------------------------------
// This is an important protocol that requires implementation
// of the special == function
struct Student: Equatable {
    let fname: String
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.fname == rhs.fname
    }
}

let student1: Student = Student(fname: "Arthur")
let student2: Student = Student(fname: "Barbara")
print(student1 == student2)

// ==========================================================
// END OF PLAYGROUND
// ==========================================================
