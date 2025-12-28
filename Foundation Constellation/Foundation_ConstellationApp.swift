import SwiftUI
import SwiftData

@main
struct Foundation_ConstellationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // This is where SwiftData lives. We’re telling it:
        // "Store and sync Space objects for this app."
        .modelContainer(for: Space.self)
    }
}
