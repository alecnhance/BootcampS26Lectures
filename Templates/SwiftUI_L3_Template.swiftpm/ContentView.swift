import SwiftUI

// ==========================================================
// iOS Bootcamp — Navigation (NavigationStack, NavigationLink,
// navigationDestination, value-based navigation, NavigationPath,
// programmatic navigation, hiding back button, dismiss, TabView)
// ==========================================================
//
//
// Covered topics:
// • NavigationStack + NavigationLink (view-based)
// • Value-based navigation + navigationDestination(for:)
// • NavigationPath for programmatic control of the stack
// • Hiding the default back button + custom back actions
// • Dismiss using @Environment(\.dismiss)
// • TabView basics and keeping state per tab
// • Mini-challenges placed inline
//
// Notes:
// • NavigationStack replaced NavigationView in iOS 16+.
// • Where appropriate, examples use availability checks to remain
//   friendly to earlier SDKs when possible.
// ==========================================================


// ----------------------------------------------------------
// Basic NavigationStack + NavigationLink (view-based)
// ----------------------------------------------------------
//
// - Wrap your top-level view in NavigationStack.
// - You only need a SINGLE NavigationStack
// - Use NavigationLinks to push a view.
// - The pushed view gets a back button automatically.
// - Pressing the back button "Pops" the view off of the stack


struct MainView: View {
    let text: String = "Hello"

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Main Text")
                    .font(.largeTitle)
            }
        }
        
    }
}


// #Preview {
//     MainView()
// }

// ----------------------------------------------------------
// VIEW-BASED NAVIGATION — How It Works
// ----------------------------------------------------------
//
// This is the classic NavigationLink API:
//
//     NavigationLink("Label", destination: SomeView())
//
// • You directly provide the destination view inside the link.
// • When the link is tapped, SwiftUI pushes that view onto the
//   NavigationStack.
// • The pushed view automatically gets a back button.
// • This is the simplest and most explicit navigation style.
//
// RULES:
// • Must be inside a NavigationStack.
// • Every NavigationLink has one destination view.
// • State inside the destination persists while it’s on the stack.
//
// This method is best when each link leads to a specific,
// hard-coded view.
//
// ----------------------------------------------------------

struct ViewBasedNavExample: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Home Page").font(.largeTitle).bold()
                NavigationLink("Navigate to Profile", destination: ProfileScreen())
                NavigationLink(destination: SettingsScreen()) {
                    HStack {
                        Image(systemName: "gear")
                        Text("Navigate to settings")
                    }
                }
            }
        }
    }
}

struct ProfileScreen: View {
    var body: some View {
        VStack {
            Text("Profile View")
            NavigationLink("Custom Screen", destination:  {
                VStack {
                    Text("Destination")
                    Text("customized")
                }
            })
            NavigationLink("Settings", destination: SettingsScreen())
        }
    }
}

struct SettingsScreen: View {
    var body: some View {
        VStack {
            Text("Settings View")
        }
    }
}

// #Preview {
//     ViewBasedNavExample()
// }

// ----------------------------------------------------------
// VALUE-BASED NAVIGATION — How It Works
// ----------------------------------------------------------
//
// Instead of pushing a *View*, you push a *VALUE*:
//
//     NavigationLink(value: someValue) { Label }
//
// Then, elsewhere in the NavigationStack, you register:
//
//     .navigationDestination(for: ValueType.self) { value in
//         /* return the view for this value */
//     }
//
// WHY DO THIS?
// • Navigation logic becomes centralized.
// • NavigationLinks don't need to know how to build the destination.
// • Enables NavigationPath for programmatic navigation.
// • Great for navigating using models (e.g., Fruit, User, Post).
//
// HOW IT WORKS INTERNALLY:
// 1. A NavigationLink pushes a VALUE onto the stack.
// 2. SwiftUI looks for a matching navigationDestination(for:)
//    handler based on the value’s TYPE.
// 3. That handler receives the value and returns the destination view.
//
// Think of it like routing:
//      "If a String is pushed → show this screen"
//      "If a Fruit is pushed → show another screen"
//
// ----------------------------------------------------------

struct ValueBasedNavExample: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Value-Based Navigation").font(.largeTitle).bold()
                NavigationLink("Navigation Link 1", value: "First Link")
                NavigationLink(value: "Second link") {
                    HStack {
                        Image(systemName: "sun.max")
                        Text("Second Link")
                    }
                }
                NavigationLink("Int link", value: 10)
            }.navigationDestination(for: String.self) { value in
                VStack {
                    Text("\(value)")
                    NavigationLink("Add another String", value: "New String")
                }
            }.navigationDestination(for: Int.self) { val in
                SubView(num: val)
            }
        }
    }
}

struct SubView: View {
    var num: Int
    var body: some View {
        Text("Subview: \(num)")
    }
}



// #Preview {
//     ValueBasedNavExample()
// }

// ----------------------------------------------------------
// NAVIGATIONPATH — Dynamic, Programmatic Navigation
// ----------------------------------------------------------
//
// NavigationPath lets you control the navigation stack using VALUES.
// You can:
// • Append values to push screens
// • Remove values to pop screens
// • Reset the entire path
//
// This is essential for:
// • Deep linking
// • Multi-step flows
// • Resetting to root
// • Programmatic navigation
//
// ----------------------------------------------------------

struct PathBasicsExample: View {
    @State var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {

            VStack(spacing: 12) {
                Button("Push 'A'") { path.append("A") }
                Button("Push B")   { path.append("B") }

                Button("Pop Last") {
                    if !path.isEmpty { path.removeLast() }
                }

                Button("Reset to Root") {
                    path = NavigationPath()    // wipes stack completely
                }
            }
            .padding()
            .navigationTitle("Path Basics")

            // Register destinations for pushed values
            .navigationDestination(for: String.self) { value in
                VStack {
                    Text("String: \(value)").font(.largeTitle)
                    Button("Push 'A'") { path.append("A") }
                    Button("Push B")   { path.append("B") }
                    Button("Pop Last") {
                        if !path.isEmpty { path.removeLast() }
                    }
                    Button("Reset to Root") {
                        path = NavigationPath()    // wipes stack completely
                    }
                }
            }
        }
    }
}

// #Preview {
//     PathBasicsExample()
// }

// ----------------------------------------------------------
// DYNAMIC PATH EDITING
// ----------------------------------------------------------
//
// You can push multiple values at once (multi-step workflows):
//     path.append(contentsOf: ["A", "B", "C"])
//
// You can remove specific values by rebuilding the path:
//     path = NavigationPath(path.filter { $0 is String })
//
// You can deep link by constructing a full path:
//     path = NavigationPath(["Home", userID, "Details"])
//
// Use this when you need full programmatic control over the stack.
// ----------------------------------------------------------


// ----------------------------------------------------------
// NAVIGATION TIPS & COMMON PATTERNS
// ----------------------------------------------------------
//
// 1. Hiding the Default Back Button
// ---------------------------------
// • Any destination view can hide the automatic back button.
// • Useful when you want full control over the top bar.
//
//     .navigationBarBackButtonHidden(true)
//
// Combine this with a custom toolbar button to replace it.
//
// 2. Dismissing a View Programmatically
// -------------------------------------
// • Use @Environment(\.dismiss) to obtain a dismiss closure.
// • Calling dismiss() pops the current view from the stack.
// • This works for both navigation destinations and sheets.
//

struct NavTips_HideBackExample: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Navigate", destination: Destination())
            }
        }
    }
}

struct Destination: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text("Destination")
            Button("Dismiss") {
                dismiss()
            }
        }.navigationBarBackButtonHidden(true)

    }
}

//#Preview {
//    NavTips_HideBackExample()
//}



// 3. Toolbar Placement Patterns
// ------------------------------
// Common placements:
// • .navigationBarLeading  → left side of nav bar
// • .navigationBarTrailing → right side of nav bar
// • .bottomBar             → bottom toolbar space
//
// Toolbars are great for custom navigation controls.


struct NavTips_ToolbarExample: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Toolbar Example")
                    .font(.title)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Help") {
                        print("Help tapped")
                    }
                }
            }
            .navigationTitle("Tips")
        }
    }
}

//#Preview {
//    NavTips_ToolbarExample()
//}


// 4. General Navigation Advice
// -----------------------------
// • View-based navigation is best for simple screens.
// • Value-based is best for model-driven navigation and deep links.
// • Keep your navigationDestination handlers near the top of the stack.
// • Use NavigationPath when you need programmatic control.
// • Avoid overly complex deep link chains unless necessary.
// • Custom back buttons should stay recognizable to the user.
// • Always ensure dismiss() results in sensible user flow.
//
// ----------------------------------------------------------


// ----------------------------------------------------------
// TABVIEW — Multiple Screens With Persistent State
// ----------------------------------------------------------
//
// TabView lets your app display multiple major sections using
// a tab bar at the bottom.
//
// IMPORTANT BEHAVIOR:
// • Each tab keeps its own state while switching tabs.
// • Each tab can have its own NavigationStack.
// • Use .tabItem to assign the icon + label.
//
// COMMON USE CASES:
// • Home / Search / Profile tabs
// • Multi-section apps
// • Persistent navigation stack in each tab (iOS 16+)
//
// ----------------------------------------------------------

struct HomeTabView: View {
    @State var toggle: Bool = true
    var body: some View {
        NavigationStack {
            VStack {
                Text("Home Tab")
                if toggle {
                    Text("True")
                } else {
                    Text("False")
                }
                Button("Toggle") {
                    toggle.toggle()
                }
                NavigationLink("Navigation Link", destination: Text("Text Destination"))
            }
        }
    }
}

struct SearchTabView: View {
    var body: some View {
        VStack {
            Text("Search Tab")
        }
    }
}

struct ProfileTabView: View {
    var body: some View {
        VStack {
            Text("Profile Tab")
        }
    }
}

struct TabsDemoView: View {
    var body: some View {
        TabView {
            HomeTabView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SearchTabView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            ProfileTabView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

// #Preview {
//     TabsDemoView()
// }

// ----------------------------------------------------------
// TABVIEW TIPS
// ----------------------------------------------------------
// • Each tab can have its own NavigationStack for independent navigation.
// • Use SF Symbols for clean tab icons.
// • Don’t overload tabs — 3–5 is ideal.
// • Tabs are best for top-level destinations, not deep screens.
// ----------------------------------------------------------


// ----------------------------------------------------------
// CHALLENGE
// ----------------------------------------------------------
// 1. Create a fruit struct: Fruits have a name and a fun fact
// 2. Create ListView, which iterates over a list of Fruit, allowing
//    the user to click to navigate to the fruit's detail page
// 3. Create DetailView, the page with a fruit name and fact
// 4. Allow navigation between ContentView, ListView, and DetailView
// 5. Bonus: have your implementation support backtracking from
//    DetailView directly to content view
struct Fruit: Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
    var fact: String
}

struct ContentView: View {
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Content View").font(.largeTitle)
                NavigationLink("Go to ListView", value: "Listview")
            }.navigationDestination(for: String.self) { astr in
                switch astr {
                case "Listview": ListView(path: $path)
                default: ListView(path: $path)
                }
            }
            .navigationDestination(for: Fruit.self) { fruit in
                DetailView(path: $path, fruit: fruit)
            }
        }
  
    }
}

struct ListView: View {
    @Binding var path: NavigationPath
    let fruits = [
        Fruit(name: "Apple", fact: "Apples float in water."),
        Fruit(name: "Banana", fact: "Bananas are berries."),
        Fruit(name: "Cherry", fact: "Cherries are related to plums.")
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text("List View").font(.title)
            ForEach(fruits, id: \.id) { fruit in
                NavigationLink(value: fruit) {
                    Text("Go to \(fruit.name)'s page")
                }
            }
        }
    }
}

struct DetailView: View {
    @Binding var path: NavigationPath
    var fruit: Fruit
    var body: some View {
        VStack {
            Text("\(fruit.name)").font(.title)
            Text("\(fruit.fact)").padding()
            Button("Go to Content View") {
                path = NavigationPath()
            }
        }
    }
}

// ==========================================================
// END OF PLAYGROUND FILE
// ==========================================================

