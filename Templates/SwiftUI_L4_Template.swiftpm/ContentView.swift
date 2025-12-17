import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
    }
}

// ----------------------------------------------------------
// MVVM — Definition
// ----------------------------------------------------------
//
// MVVM (Model–View–ViewModel) is a design pattern used in
// SwiftUI to separate an app’s data, UI, and business logic.
//
// • Model      → The data your app uses
// • View       → The UI the user sees
// • ViewModel  → The logic that connects the Model to the View
//
// SwiftUI works naturally with MVVM because Views automatically
// update when the ViewModel’s observable data changes.
//

// ----------------------------------------------------------
// MVVM — Model
// ----------------------------------------------------------
//
// The Model represents the actual data.
// It contains no UI code and usually no business logic.
//
// Example:


// ----------------------------------------------------------
// MVVM — ViewModel
// ----------------------------------------------------------
//
// The ViewModel holds the logic for updating the Model and
// exposes data in a form the View can display.
// It must be a class and conform to Observable.
//
// Example:
import Observation

//@available(iOS 17.0, *)




// ----------------------------------------------------------
// MVVM — View
// ----------------------------------------------------------
//
// The View displays data coming from the ViewModel.
// It does not store the app's business logic.
// It reacts to changes published by the ViewModel.
//
// Example:
@available(iOS 17.0, *)
struct CounterView: View {
    var body: some View {

    }
}

//#Preview {
//    if #available(iOS 17.0, *) {
//        CounterView()
//    } else {
//        // Fallback on earlier versions
//    }
//}

// ----------------------------------------------------------
// MVVM — Purpose
// ----------------------------------------------------------
//
// MVVM makes SwiftUI apps easier to build, scale, and maintain
// by clearly separating responsibilities:
//
// • MODEL
//      Stores the data. No UI logic.
//
// • VIEW
//      Displays what the user sees. No business logic.
//
// • VIEWMODEL
//      Holds all app logic, updates the Model, and exposes data
//      in a way the View can easily read.
//
// WHY IT MATTERS:
//
// 1. Cleaner Code — Each part of your app has a single job.
// 2. Easier Debugging — Logic bugs stay in the ViewModel,
//    layout bugs stay in the View.
// 3. Reusability — ViewModels can be reused across multiple Views.
// 4. Automatic Updates — When the ViewModel changes, the View
//    updates instantly thanks to SwiftUI's reactive system.
//
// MVVM helps prevent “massive Views” and keeps logic organized.
// ----------------------------------------------------------


// ----------------------------------------------------------
// MINI-CHALLENGE — Build a Tiny MVVM App
// ----------------------------------------------------------
//
// GOAL:
// Create a simple SwiftUI app (Model → ViewModel → View) that
// tracks a list of tasks and allows the user to add new ones.
//
// PROBLEM DESCRIPTION:
// You are building a tiny “To-Do List” feature.
// The app needs to:
//   1. Store individual tasks
//   2. Store a list of tasks
//   3. Allow the user to type in a new task name
//   4. Add that task to the list
//
// ----------------------------------------------------------
// STEP 1 — Define the MODEL(s)
// ----------------------------------------------------------
// Think: What data does a single task need?
// Think: What data structure holds all tasks?
//
// Requirements:
//   • Create a Task model
//   • Create a container model if you feel it’s needed
//
// Hints (do NOT show types for them):
//   - A task probably needs text
//   - A list probably needs an array



//
// ----------------------------------------------------------
// STEP 2 — Define the VIEW MODEL
// ----------------------------------------------------------
// Create a ViewModel class that:
//
//   • Stores your model(s)
//   • Has a function addTask(_ name: String)
//   • Publishes changes so the View updates automatically
//
// Hints:
//   - Use @Observable
//   - Make the task list mutable
//   - The add function should append a new task

//@available(iOS 17.0, *)


// ----------------------------------------------------------
// STEP 3 — Build the VIEW
// ----------------------------------------------------------
// Create a SwiftUI View that:
//
//   • Displays a TextField for entering new tasks
//   • Has a Button that calls viewModel.addTask
//   • Shows the list of tasks on screen
//
// Requirements:
//   • Use @StateObject to create the ViewModel
//   • Use a List or VStack to show tasks
//   • The UI should update immediately when tasks are added
//

//@available(iOS 17.0, *)


//#Preview {
//    if #available(iOS 17.0, *) {
//        TaskListView()
//    } else {
//        // Fallback on earlier versions
//    }
//}

// ----------------------------------------------------------
// FINISHING GOAL
// ----------------------------------------------------------
// If your app lets you type a task name, tap “Add,” and see
// the new task appear in the list — you solved the challenge!
// ----------------------------------------------------------


// ----------------------------------------------------------
// LIST — What It Is and Why We Use It
// ----------------------------------------------------------
//
// A List is SwiftUI’s built-in, scrollable table of rows.
// It automatically handles:
//   • Vertical scrolling
//   • Row rendering + spacing
//   • Swipe actions
//   • Navigation links
//   • Dynamic data that updates automatically
//
// Lists are ideal for showing collections of items, such as
// messages, tasks, students, or settings screens.
//
// They can be customized with listStyle, .listRowSeparator, and scrollContentBackground
//
// Example:
struct FruitListView: View {
    let fruits = ["Apple", "Banana", "Orange"]

    var body: some View {
        VStack {
        }
    }
}

//#Preview {
//    FruitListView()
//}

//
// Each item becomes its own row, and List handles
// all scrolling and table behavior for you.
//
// ----------------------------------------------------------
// SMALL NOTE — How This Differs from ForEach
// ----------------------------------------------------------
// ForEach *only repeats views* and does NOT scroll.
// A List *is a scrollable container* that manages rows.
//
// You can think of List as:
//     “ForEach + scrolling + table behavior”
// ----------------------------------------------------------



// ----------------------------------------------------------
// SCROLLVIEW — What It Is and When to Use It
// ----------------------------------------------------------
//
// A ScrollView lets you make ANY content scrollable.
// Unlike List, it does NOT provide rows, separators,
// or built-in table behavior. It simply gives scrolling
// ability to whatever views you place inside it.
//
// You choose the layout (VStack, HStack, Lazy stacks, etc.).
//
// ----------------------------------------------------------
// BASIC USAGE
// ----------------------------------------------------------

struct BasicScrollExample: View {
    var body: some View {
        VStack(spacing: 20) {
            ForEach(1...30, id: \.self) { number in
                Text("Row \(number)")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

//#Preview {
//    BasicScrollExample()
//}

// ----------------------------------------------------------
// SCROLL DIRECTION
// ----------------------------------------------------------
//
// ScrollView can be vertical or horizontal.
//

struct HorizontalScroll: View {
    var body: some View {
        HStack(spacing: 30) {
            ForEach(1...10, id: \.self) { num in
                Circle()
                    .frame(width: 80, height: 80)
                    .overlay(Text("\(num)"))
            }
        }
        .padding()
    }
}

//#Preview {
//    HorizontalScroll()
//}

// ----------------------------------------------------------
// LAZY STACKS (Important for performance)
// ----------------------------------------------------------
//
// LazyVStack / LazyHStack only render what is on screen,
// making them ideal for large amounts of data.
// Regular VStack loads *everything* at once.
//

struct LazyScrollExample: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(1...1000, id: \.self) { i in
                Text("Item \(i)")
                    .padding(.vertical, 4)
            }
        }
        .padding()
    }
}

//#Preview {
//    LazyScrollExample()
//}

// ----------------------------------------------------------
// WHEN TO USE SCROLLVIEW
// ----------------------------------------------------------
//
// Use ScrollView when:
//   • You want full custom layout control
//   • You don’t need automatic row styles
//   • You need horizontal scrolling
//   • You want to build custom UIs (grids, cards, galleries)
//
// NOT ideal for:
//   • Table-like content (use List)
//   • Large data with non-lazy stacks (can cause memory issues)
//
// ----------------------------------------------------------
//
// QUICK SUMMARY:
//   ScrollView = “Make anything scrollable”
//   List       = “Table with built-in row behaviors”
//
// ----------------------------------------------------------


// ----------------------------------------------------------
// LAZY GRIDS — LazyVGrid & LazyHGrid
// ----------------------------------------------------------
//
// Lazy grids let you build efficient, wrapping layouts in SwiftUI.
// Unlike VStack/HStack, they automatically continue items onto
// new rows or columns, and they only render views when needed.
// You configure them using an array of GridItem values:
//
//   • .flexible()   → items stretch evenly
//   • .fixed(x)     → strict size
//   • .adaptive(min:) → fits as many items as possible
//
// LazyVGrid arranges items in columns (vertical scrolling).
// LazyHGrid arranges items in rows (horizontal scrolling).
//
// Below is a LazyVGrid example.
// ----------------------------------------------------------

import SwiftUI

struct SimpleGridView: View {
    let items = Array(1...12)

    //let columns = []

    var body: some View {
        ForEach(items, id: \.self) { item in
                Text("Item \(item)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(8)
        }
    }
}

// #Preview {
//     SimpleGridView()
// }


// ----------------------------------------------------------
// SHEET — Presenting a Modal View
// ----------------------------------------------------------
//
// A sheet lets you present another view modally on top of the
// current screen. It slides up from the bottom and is commonly
// used for forms, detail views, or quick actions.
//
// HOW IT WORKS:
// • You control presentation with a Bool or an optional item.
// • When the Bool becomes true, the sheet appears.
// • When the user swipes down or dismisses it, SwiftUI
//   automatically sets the Bool back to false.
//
// Sheets should be used for temporary, focused tasks.
//
// ----------------------------------------------------------

import SwiftUI

struct SheetExampleView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Main View")
                .font(.title)
        }
    }
}

struct SheetContentView: View {
    var body: some View {
        VStack(spacing: 20) {
        }
    }
}

// #Preview {
//     SheetExampleView()
// }

// ----------------------------------------------------------
// GESTURES — What They Are and How They Work
// ----------------------------------------------------------
//
// Gestures in SwiftUI let your views respond to user interaction.
// Common gestures include:
//   • TapGesture
//   • LongPressGesture
//   • DragGesture
//   • MagnificationGesture (pinch)
//   • RotationGesture
//
// All gestures follow the same pattern:
//   1. You attach a gesture modifier (like .onTapGesture)
//   2. The view listens for that interaction
//   3. SwiftUI runs your code when the gesture occurs
//
// Gestures can be added to ANY view — text, shapes, stacks,
// images — making every view interactive.
//
// Below is an example using TapGesture, the simplest gesture.
// ----------------------------------------------------------

import SwiftUI

struct GestureOverviewExample: View {

    var body: some View {
        VStack(spacing: 20) {
        }
        .padding()
    }
}

// #Preview {
//     GestureOverviewExample()
// }

// ----------------------------------------------------------
// ANIMATION — Making Views Feel Alive
// ----------------------------------------------------------
//
// SwiftUI makes animation simple by letting state changes animate
// automatically. Whenever a view depends on some @State or ViewModel
// value, and that value changes, you can animate the transition.
//
// You add animation using:
//     .animation(...)
// or
//     withAnimation { ... }
//
// SwiftUI animates properties like:
//   • position
//   • color
//   • opacity
//   • scale
//   • rotation
//   • frame changes
//
// Below is a basic example where a circle grows and shrinks.
// ----------------------------------------------------------

import SwiftUI

struct AnimationExampleView: View {
    @State private var isLarge = false

    var body: some View {
        VStack(spacing: 40) {
            Circle()
                .fill(Color.blue.opacity(0.4))
                .frame(width: isLarge ? 180 : 80,
                       height: isLarge ? 180 : 80)
                .animation(.easeInOut(duration: 0.6), value: isLarge)

            Button("Animate") {
                isLarge.toggle()
            }
        }
        .padding()
    }
}

// #Preview {
//     AnimationExampleView()
// }


struct WithAnimationTransitionExample: View {
    @State private var showBox = false

    var body: some View {
        VStack(spacing: 20) {
            Button(showBox ? "Hide Box" : "Show Box") {
                showBox.toggle()
            }

            if showBox {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.purple.opacity(0.7))
                    .frame(width: 150, height: 150)
                    .transition(.opacity) // View will slide in/out
            }
        }
        .padding()
    }
}

// #Preview {
//     WithAnimationTransitionExample()
// }

// ----------------------------------------------------------
// MINI CHALLENGE
// ----------------------------------------------------------

// Step 1 — Display the Numbers in a grid layout
// Ensure that if there are more items than fit on the screen, the user can scroll to see them.

// Step 2 — Create an add button
// Add a ZStack add button that adds a number to the list when pressed

// Step 3 — Animate the add button
// Animate the add button upon adding an element



@available(iOS 17.0, *)
struct MiniChallenge: View {
    var nums = [1, 2, 3, 4, 5]
    var body: some View {
 
    }
}

//#Preview {
//    if #available(iOS 17.0, *) {
//        MiniChallenge()
//    } else {
//        // Fallback on earlier versions
//    }
//}
