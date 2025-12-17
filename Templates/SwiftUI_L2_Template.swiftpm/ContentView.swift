import SwiftUI


// ==========================================================
// iOS Bootcamp — Data Flow, State, Binding, Observable
// ==========================================================
//
// This playground introduces the key concepts of how data
// moves through a SwiftUI app.
//
// Covered Topics:
// • Understanding SwiftUI’s "source of truth"
// • @State — local, view-owned data
// • @Binding — passing state into subviews
// • Property wrappers and why they matter
// • Observable objects and the @Observable macro
// • @StateObject, @ObservedObject, @EnvironmentObject
// • Mini-challenges included throughout
//
// ==========================================================



// ----------------------------------------------------------
// DATA FLOW — What does it mean?
// ----------------------------------------------------------
//
// In SwiftUI, data always flows from a *source of truth*
// → into UI elements that depend on it.
//
// When the data changes, SwiftUI redraws the parts of the UI
// that depend on that data.
//
// A "source of truth" can be:
// • @State (owned by a View)
// • @Observable objects (owned by view models)
// • @EnvironmentObject (shared across the app)
// ----------------------------------------------------------

// ----------------------------------------------------------
// PROPERTY WRAPPERS
// ----------------------------------------------------------
// Anything with an "@" is called a property wrapper. It is
// a mechanism for adding additional behaviors to some variable.
// They are only usable within structs that implement the View protocol

// ----------------------------------------------------------
// @STATE — Local View State
// ----------------------------------------------------------
//
// @State variables belong *to that specific view*.
// When the value changes, SwiftUI automatically re-draws the view.
// ----------------------------------------------------------

struct StateExampleView: View {
    var count = 0

    var body: some View {
        VStack {
            Text("Count: \(count)")
            Button("Increase") {
                
            }
        }
        .padding()
    }
}

// #Preview {
//     StateExampleView()
// }

// ----------------------------------------------------------
// MINI-CHALLENGE — STATE
// ----------------------------------------------------------
// Implement the screen shown by instructor.
struct MiniChallenge1: View {
    var list: [String] = ["Strawberry", "Oatmeal", "Ginger", "Beef", "Bread"]
    var body: some View {

    }
}

//#Preview {
//    MiniChallenge1()
//}

// ----------------------------------------------------------
// SUBVIEWS — Reusable Pieces of UI
// ----------------------------------------------------------
//
// SwiftUI encourages breaking large views into small,
// reusable components (“subviews”).
//
// Reasons to use subviews:
// • Cleaner, more readable code
// • Reused UI patterns
// • Easier testing and previewing
// • Better separation of concerns
//
// RULE OF THUMB:
// If your body gets longer than 20–25 lines,
// extract a subview.
//
// ----------------------------------------------------------

struct ProfileRow: View {
    let name: String
    let role: String

    var body: some View {

    }
}

// #Preview {
//     ProfileRow(name: "Alec", role: "iOS Developer")
// }


// Example of using a subview in a parent view:
struct SubviewExample: View {
    let textSize: CGFloat = 40
    var body: some View {
        VStack(spacing: 12) {
            Text("Profiles").font(.system(size: textSize))
            Text("Description about page").font(.system(size: textSize * 0.5))
            HStack {
                VStack(alignment: .leading) {
                    Text("Alec").font(.headline)
                    Text("The Goat").font(.subheadline)
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding()
            HStack {
                VStack(alignment: .leading) {
                    Text("Rik").font(.headline)
                    Text("Second Fiddle").font(.subheadline)
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding()
            HStack {
                VStack(alignment: .leading) {
                    Text("Austion").font(.headline)
                    Text("True Mastermind").font(.subheadline)
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding()
        }
        .padding()
    }
}

// #Preview {
//     SubviewExample()
// }


// ----------------------------------------------------------
// @BINDING — Sharing State With Subviews
// ----------------------------------------------------------
//
// Bindings allow subviews to *mutate the state* owned by
// a parent view without copying it.
//
// In the subview, mark the variable with @Binding
//
// In the parent view, pass the @State variable through with
// the $ symbol
//
// Think of:
// @State = owner
// @Binding = borrower
//------------------------------------------------------------

struct CounterButtonSubview: View {
    @State var value: Int

    var body: some View {
        HStack {
            Button("-") { value -= 1 }
            Text("\(value)")
                .frame(width: 40)
            Button("+") { value += 1 }
        }
        .font(.title)
    }
}
// #Preview {
//     BindingExampleView()
// }

// Call the subview into this example
struct BindingExampleView: View {
    @State private var number = 5

    var body: some View {
        VStack {
            Text("Parent number: \(number)")
        }
        .padding()
    }
}

// #Preview {
//     BindingExampleView()
// }

// ----------------------------------------------------------
// TEXTFIELD — User Input in SwiftUI
// ----------------------------------------------------------
//
// TextFields allow users to type text into your app.
//
// TextFields are an example of a SwiftUI inherent view
// that uses binding
//
// REQUIREMENTS:
// • A TextField must be bound to a String.
//   Example: @State private var name = ""
//
// COMMON MODIFIERS:
// • .textFieldStyle(.roundedBorder)
// • .keyboardType(.numberPad / .emailAddress / etc.)
// • .submitLabel(.done)
// • .onSubmit { }
//
// ----------------------------------------------------------

struct TextFieldExampleView: View {
    @State private var username = ""
    @State private var age = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome, \(username.isEmpty ? "Guest" : username)")

            Button("Submit") {
                print("Submitted: \(username), age \(age)")
            }
        }
        .padding()
    }
}

// #Preview {
//     TextFieldExampleView()
// }



// ----------------------------------------------------------
// MINI-CHALLENGE — BINDING
// ----------------------------------------------------------
// 1. Create a view that displays 3 numbers in a VStack.
// 2. Add a "Clear" button to reset all to 0.
// 3. Create a reusable subview with + and – buttons
// 4. Add the subview under each number.
// 5. Look at the example image ----------------------------------------------------------

struct NumberAdjuster: View {
    @State var value: Int

    var body: some View {

    }
}

struct ThreeNumberChallengeView: View {
    @State private var a = 5
    @State private var b = 8
    @State private var c = 12

    var body: some View {

    }
}

// #Preview {
//     ThreeNumberChallengeView()
// }



// ----------------------------------------------------------
// @OBSERVABLE — Modern Swift Change-Tracking for Classes
// ----------------------------------------------------------
//
// @Observable automatically tracks changes to properties
// inside a class and notifies any SwiftUI views that depend
// on those properties. When the data changes, the UI updates.
//
// This replaces the older pattern:
// • Conform class to ObservableObject
// • Mark each changing property with @Published
//
// Old way:
// class MyVM: ObservableObject {
//     @Published var count = 0
// }
//
// New way (cleaner):
// @Observable class MyVM {
//     var count = 0
// }
//
// The macro automatically generates the change notifications,
// so no @Published or manual conformance is required.
// ----------------------------------------------------------

//@available(iOS 17.0, *)
class CounterViewModel {
    var count = 0

    func increment() { count += 1 }
    func decrement() { count -= 1 }
}



//@available(iOS 17.0, *)
struct ObservableExampleView: View {
    var vm = CounterViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(vm.count)")
                .font(.largeTitle)
            HStack {
                Button("-") { vm.decrement() }
                Button("+") { vm.increment() }
            }
            .font(.title)
        }
        .padding()
    }
}

// #Preview {
//     if #available(iOS 17.0, *) {
//         ObservableExampleView()
//     } else {
//         // Fallback on earlier versions
//     }
// }

// ----------------------------------------------------------
// ENVIRONMENT VALUES — Reading System Information
// ----------------------------------------------------------
//
// SwiftUI gives you access to system-level information through
// "environment values". These describe things like:
//
// • colorScheme (light or dark mode)
// • locale (user language/region)
// • size classes (compact/regular)
// • dynamic type size
//
// You read environment values with @Environment:
//
//     @Environment(\.colorScheme) var colorScheme
//
// Environment values are *injected by SwiftUI*.
// You don't create them, and you don't pass them manually.
//
// They automatically update when the system changes.
// ----------------------------------------------------------

struct ReadEnvironmentExample: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Text(colorScheme == .dark ? "Dark Mode" : "Light Mode")
            .padding()
    }
}

// #Preview {
//     ReadEnvironmentExample()
// }

// ----------------------------------------------------------
// ENVIRONMENT — Inserting & Reading Observable Classes
// ----------------------------------------------------------
//
// SwiftUI lets you place an @Observable class into the
// environment so any view in the hierarchy can access it
// without passing it through initializers.
//
// WHY USE IT?
// • Shared source of truth for the whole app
// • Cleaner than passing view models manually
// • Any view can read it and automatically update when data changes
//
// INSERTING:
//     .environment(model)
//
// READING:
//     @Environment(AppModel.self) var model
//
// Because the class is @Observable, SwiftUI will automatically
// update any dependent views when its properties change.
// ----------------------------------------------------------

import Observation

@available(iOS 17.0, *)
@Observable
class AppModel {
    var username = "Alec"
    var isLoggedIn = false
}

@available(iOS 17.0, *)
struct ObservableEnvExample: View {// reading from environment
    var model: AppModel
    var body: some View {
        VStack {
            Text("Logged in as: \(model.username)")
            Button("Log Out") {
                model.isLoggedIn = false
            }
        }
        .padding()
    }
}

// #Preview {
//     if #available(iOS 17.0, *) {
//         ObservableEnvExample()
//     } else {
//         // Fallback on earlier versions
//     }   // inserting observable model
// }




// ----------------------------------------------------------
// WHEN TO USE WHICH?
// ----------------------------------------------------------
//
// @State
// • Simple values local to a single View.
// • Never shared.
//
// @Binding
// • Pass state into subviews.
// • Two-way connection.
//
// @Observable
// • Logic/data stored in a reference type.
// • Automatically emits view updates.
//
// @Environment
// • Read data from the environment like color scheme
// • Read observable classes from the environment
//
// ----------------------------------------------------------





// ----------------------------------------------------------
// MINI-CHALLENGE — Using @Observable
// ----------------------------------------------------------
//
// Goal:
// Practice using an @Observable class to store shared data
// and update the UI when the data changes.
//
// INSTRUCTIONS:
// 1. Create an @Observable class called MoodModel with:
//        var currentMood = "Neutral"
//
// 2. In a parent view, store a MoodModel using @State.
// 3. Insert the model into the environment:
//        .environment(model)
//
// 4. Create TWO separate views:
//        • One view shows the current mood
//        • One view has buttons to change the mood
//
// 5. Both views should read the model using:
//        @Environment(MoodModel.self) var model
//
// 6. When you tap a mood button in the button view,
//    the currentMood should update *in both views* automatically.
//
// ----------------------------------------------------------

import Observation
import SwiftUI

//@available(iOS 17.0, *)
class MoodModel {
    var currentMood = "Neutral"
}

@available(iOS 17.0, *)
struct MoodDisplayView: View {

    var body: some View {

    }
}

@available(iOS 17.0, *)
struct MoodButtonsView: View {

    var body: some View {

    }
}

@available(iOS 17.0, *)
struct ObservableMiniChallenge: View {
    @State private var model = MoodModel()

    var body: some View {
        VStack(spacing: 30) {
            MoodDisplayView()
            MoodButtonsView()
        }
  // insert observable model
    }
}

//#Preview {
//    if #available(iOS 17.0, *) {
//        ObservableMiniChallenge()
//    } else {
//        // Fallback on earlier versions
//    }
//}






struct ContentView: View {
    var body: some View {
        Text("Sup chief")
    }
}
// ==========================================================
// END OF PLAYGROUND FILE
// ==========================================================
