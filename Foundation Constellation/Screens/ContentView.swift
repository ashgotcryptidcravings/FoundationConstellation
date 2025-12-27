import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TodayView()
                .tabItem {
                    Label("Today", systemImage: "sun.max")
                }
            ConstellationView()
                .tabItem {
                    Label("Constellations", systemImage: "circle.hexagongrid")
                }
            SpacesView()
                .tabItem {
                    Label("Spaces", systemImage: "square.grid.2x2")
                }
            PeopleView()
                .tabItem {
                    Label("People", systemImage: "person.2")
                }
            LabView()
                .tabItem {
                    Label("Lab", systemImage: "testtube.2")
                }
        }
    }
}
