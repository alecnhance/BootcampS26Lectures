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
        Text("Hello SwiftUI")
        //Button("Tap Me") { print("Tapped") }
        //Circle().frame(width: 50, height: 50)
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
        VStack {
            Text("Top")
            HStack {
                Text("Left")
                Text("Right")
            }
            ZStack {
                Rectangle().fill(.blue).frame(width: 80, height: 80)
                Text("On top")
            }
        }
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
        ForEach(items, id: \.self) { item in
            Text(item)
        }
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
        HStack {
            Text("Left")
            Spacer()
            Text("Right")
        }
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
        .padding()
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
        VStack {
            Image(systemName: "scribble")
        }
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
        VStack {
            Image(systemName: "cloud.sun")

            Label("Is it sunny today?", systemImage: "sun.max")

            HStack {
                Button("Yep") { print("Yep!") }
                Button("Nope") { print("Nope :(") }
            }
        }
        .padding()
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
    let width = UIScreen.main.bounds.width
    let height2 = UIScreen.main.bounds.height
    var body: some View {
        VStack {
            Text("Hello")
                .font(.largeTitle)
                .foregroundStyle(.blue)
                .frame(width: 200, height: 100)
                .padding()
                .background(Color.yellow)
                .border(Color.black)
            RoundedRectangle(cornerRadius: 20)
                .stroke(.red)
                .frame(width: UIScreen.main.bounds.width * 0.2, height: height2 * 0.2)
        }
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
        VStack(alignment: .leading) {
            Text("Aligned left")
                .frame(width: 200, height: 50, alignment: .topLeading)
                .background(Color.blue.opacity(0.2))
            HStack {
                Spacer()
            }
        }
        .background(Color.red.opacity(0.2))
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
        Text("Order Matters")
            .background(Color.yellow)
            .frame(width: 200, height: 50)
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
        //Text("iOS Club").frame(maxHeight: .infinity).background(.red)
//        Text("iOS Club").frame(maxWidth: .infinity).background(.blue)
        Text("iOS Club").frame(width: 200, height: 200).background(.green)
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
        VStack {
            Text("Padding Example")
                .frame(width: 100, height: 50)
                .padding()
                .background(.blue)
            
        }.padding(.trailing, 20).background(.red)
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
        Text("Offset Example")
            .frame(width: 200, height: 200, alignment: .topLeading)
            .offset(x: 5, y: 20)
            .background(.red)
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
                .font(.title)
                .padding(.bottom, 10)
                .background(.gray)
                .foregroundStyle(.white)
            
            VStack(alignment: .leading) {
                ForEach(myRoutine, id: \.self) { item in
                    Text(item).foregroundStyle(.white)
                }
            }

            Spacer()
            Text("My Classes").foregroundStyle(.white)
            HStack {
                ForEach(myClasses, id: \.self) { cls in
                    Text(cls)
                        .foregroundStyle(.white)
                        .padding(.trailing, 20)
                        .background(.gray)
                }
            }.padding().background(.red)
            Spacer()
            Button("Tap Me") {
                print("Hi")
            }.frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.black)
    }
}

// #Preview {
//     MiniChallenge3()
// }





