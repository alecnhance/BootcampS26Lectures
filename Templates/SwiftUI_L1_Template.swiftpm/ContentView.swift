import SwiftUI

// ----------------------------------------------------------
// SWIFTUI BOOTCAMP – VIEWS + VIEW MODIFIERS
// App Playground Version
// ----------------------------------------------------------






// ----------------------------------------------------------
// WHAT IS A VIEW? (THEORY)
// ----------------------------------------------------------
//
// • A View is a protocol with one required property:
//      var body: some View
//
// • body can ONLY return views (Text, Button, VStack, etc)
//

struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}

//#Preview {
//    ContentView()
//}

// ----------------------------------------------------------
// WHAT IS A VIEW? (PRACTICE)
// ----------------------------------------------------------
//
// Basic views:
// • Text("Hello")
// • Button("Tap Me")
// • Image("myImageName")
// • Shapes: Circle(), Rectangle()
//
// Hold option and click a view to see documentation!
//


struct BasicViewsExample: View {
    var body: some View {

    }
}

// #Preview {
//     BasicViewsExample()
// }



// ----------------------------------------------------------
// STACKS – VStack, HStack, ZStack
// ----------------------------------------------------------
//
// • VStack → vertical arrangement
// • HStack → horizontal arrangement
// • ZStack → overlapping layers (z-axis)
// • Stacks occupy exactly the space of its children subviews
//

struct StackExample: View {
    var body: some View {

    }
}

// #Preview {
//     StackExample()
// }



// ----------------------------------------------------------
// FOR EACH (SwiftUI version)
// ----------------------------------------------------------
// • View struct
// • Iterates over an array of items and creates a view for each item in loop
// • Requires identifiable elements:
//   – Use \.self for simple types like String
//   – Or make a struct Identifiable
// • Syntax: ForEach(arrayName, id: \.self) paramName in { code }
//

struct ForEachExample: View {
    let items = ["A", "B", "C"]

    var body: some View {

    }
}

// #Preview {
//     ForEachExample()
// }



// ----------------------------------------------------------
// SPACER – occupies remaining space
// ----------------------------------------------------------
//
// • Spacer() pushes views apart
// • Can be used to keep view proportions the same on all devices
//

struct SpacerExample: View {
    var body: some View {

    }
}

// #Preview {
//     SpacerExample()
// }



// ----------------------------------------------------------
// MINI-CHALLENGE #1 – ROUTINE VIEW
// ----------------------------------------------------------
//
// Directions:
// 1. Initialize these global constants:
//
//    let myRoutine = ["Wake up", "Brush Teeth", "Shower", "Breakfast", "Go to class"]
//    let myClasses = ["CS1331", "ECON2110", "CS2110"]
//
// 2. Build a view using stacks, ForEach, and basic views
// 3. Add a button that prints "Hi"
//

let myRoutine: [String] = ["Wake up", "Brush Teeth", "Shower", "Breakfast", "Go to class"]
let myClasses: [String] = ["CS1331", "ECON2110", "CS2110"]

struct MiniChallenge1: View {
    var body: some View {

    }
}

// #Preview {
//     MiniChallenge1()
// }



// ----------------------------------------------------------
// SF SYMBOLS
// ----------------------------------------------------------
//
// • Apple icon system
// • Can access SF Symbols via the mac app or through Xcode library (Top Bar -> View -> Show Library
// • Use Image(systemName: "cloud.sun")
// • Or Label("text", systemImage: "symbol")
//

struct SFView: View {
    var body: some View {

    }
}

//#Preview {
//    SFView()
//}

// ----------------------------------------------------------
// MINI-CHALLENGE #2 – IMAGE + LABEL + BUTTONS
// ----------------------------------------------------------
//
// • Create a VStack with:
//   – A cloud image
//   – A Label with "Is it sunny today?" text and a corresponding image
//   – Two buttons side by side:
//         • “Yep” → prints "Yep!"
//         • “Nope” → prints "Nope :("
//

struct MiniChallenge2: View {
    var body: some View {

    }
}

// #Preview {
//     MiniChallenge2()
// }



// ----------------------------------------------------------
// VIEW MODIFIERS – WHAT ARE THEY?
// ----------------------------------------------------------
//
// • Methods that modify views (e.g., .font(), .padding(), .frame())
// • Order matters (modifiers are cumulative)
//



// ----------------------------------------------------------
// COMMON VIEW MODIFIERS
// ----------------------------------------------------------
//
// .frame(width:height:alignment:)
// .padding(.top, 20)
// .background(Color.blue)
// .font(.largeTitle)
// .foregroundStyle(Color.red)
// .border(Color.gray)
// .overlay(Rectangle())
// .fill(Color.red), .stroke(Color.blue)
//

struct ModifiersExample: View {
    var body: some View {

    }
}

// #Preview {
//     ModifiersExample()
// }



// ----------------------------------------------------------
// ALIGNMENT AND FRAME
// ----------------------------------------------------------
// Frame is the space taken by a view element. We can customize the frame with the .frame view modifier
// frame alignment: alignment *INSIDE the frame*
// stack alignment: alignment of subviews relative to container
//

struct AlignmentExample: View {
    var body: some View {

    }
}

// #Preview {
//     AlignmentExample()
// }



// ----------------------------------------------------------
// VIEW MODIFIERS – ORDER MATTERS
// ----------------------------------------------------------
//
// • background before frame ≠ background after frame
//

struct ModifierOrderExample: View {
    var body: some View {

    }
}

// #Preview {
//     ModifierOrderExample()
// }

// ----------------------------------------------------------
// Frame Examples
// ----------------------------------------------------------
// You can set maximum frames with either maxWidth or maxHeight argument labels with the .infinity value.
// You set pixel frame sizes with just the width or height argument labels

struct FrameExamples: View {
    var body: some View {

    }
}

//#Preview {
//    FrameExamples()
//}

// ----------------------------------------------------------
// Padding
// ----------------------------------------------------------
// Padding is really important for the aesthetics of the application.
// It inserts space into the frame of elements
// You can add padding to specific sides with the .top, .bottom, .trailing, .leading, .horizontal, and .vertical modifiers

struct PaddingExample: View {
    var body: some View {

    }
}

//#Preview {
//    PaddingExample()
//}


// ----------------------------------------------------------
// OFFSET
// ----------------------------------------------------------
//
// • Moves the view relative to its frame
// • Does NOT resize or change layout space
//

struct OffsetExample: View {
    var body: some View {

    }
}

// #Preview {
//     OffsetExample()
// }



// ----------------------------------------------------------
// MINI-CHALLENGE #3 – APPLY MODIFIERS
// ----------------------------------------------------------
//
// Directions:
// 1. Go back to your previous challenge view
// 2. Apply view modifiers to make it look like the example
//

struct MiniChallenge3: View {
    var body: some View {
        VStack {
            Spacer()
            Text("My Routine")

            

            ForEach(myRoutine, id: \.self) { item in
                Text(item)
            }

            Spacer()
            Text("My Classes")
            HStack {
                ForEach(myClasses, id: \.self) { cls in
                    Text(cls)
                }
            }
            Spacer()
            Button("Tap Me") {
                print("Hi")
            }
            Spacer()
        }
    }
}

 #Preview {
     MiniChallenge3()
 }





