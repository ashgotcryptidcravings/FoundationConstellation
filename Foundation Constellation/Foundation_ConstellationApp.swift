import SwiftUI
import SwiftData

@main
struct Foundation_ConstellationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Item.self) // we'll swap Item for your models later
        }
    }
}
