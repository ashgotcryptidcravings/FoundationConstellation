import SwiftUI
import SwiftData

struct TodayView: View {
    @Query(sort: \Space.createdAt, order: .forward)
    private var spaces: [Space]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Hey, Zero.")
                    .font(.largeTitle.bold())
                
                Text(subtitleText)
                    .foregroundStyle(.secondary)
                
                Divider()
                
                if spaces.isEmpty {
                    Text("You don’t have any spaces yet.")
                        .font(.headline)
                    Text("Head to the Spaces tab to add your first room or area. That’s how your constellation starts.")
                        .foregroundStyle(.secondary)
                } else {
                    Text("Your Constellation")
                        .font(.title3.bold())
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("• \(spaces.count) active space\(spaces.count == 1 ? "" : "s")")
                        
                        if let latest = spaces.last {
                            Text("• Last added: \(latest.emoji) \(latest.name)")
                        }
                    }
                    .font(.subheadline)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Today")
        }
    }
    
    private var subtitleText: String {
        if spaces.isEmpty {
            return "Let’s start building the map of your world."
        } else {
            return "Your spaces are the stars. Today is about keeping them aligned."
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Space.self, configurations: config)
    
    let context = container.mainContext
    context.insert(Space(name: "Den", emoji: "🛋️"))
    context.insert(Space(name: "Bedroom", emoji: "🛏️"))
    
    return TodayView()
        .modelContainer(container)
}
