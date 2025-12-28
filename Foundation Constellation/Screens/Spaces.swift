import SwiftUI
import SwiftData

struct SpacesView: View {
    @Environment(\.modelContext) private var modelContext
    
    // Live query for all spaces, oldest first
    @Query(sort: \Space.createdAt, order: .forward)
    private var spaces: [Space]
    
    @State private var showingAddSpace = false
    @State private var spaceToEdit: Space?

    var body: some View {
        NavigationStack {
            Group {
                if spaces.isEmpty {
                    VStack(spacing: 16) {
                        Text("No spaces yet")
                            .font(.title2.bold())
                        Text("Add your first room, zone, or area to start building your constellation.")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        Section("Spaces") {
                            ForEach(spaces) { space in
                                Button {
                                    spaceToEdit = space
                                    showingAddSpace = true
                                } label: {
                                    HStack(spacing: 12) {
                                        Text(space.emoji)
                                            .font(.title2)
                                            .frame(width: 32, height: 32)
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(space.name)
                                                .font(.headline)
                                            if let notes = space.notes, !notes.isEmpty {
                                                Text(notes)
                                                    .font(.subheadline)
                                                    .foregroundStyle(.secondary)
                                                    .lineLimit(1)
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Text(space.createdAt, style: .date)
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                                .buttonStyle(.plain)
                            }
                            .onDelete(perform: deleteSpaces)
                        }
                    }
                }
            }
            .navigationTitle("Spaces")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        spaceToEdit = nil
                        showingAddSpace = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("Add Space")
                }
            }
            .sheet(isPresented: $showingAddSpace) {
                AddEditSpaceView(space: spaceToEdit)
                    .presentationDetents([.medium, .large])
            }
        }
    }
    
    private func deleteSpaces(at offsets: IndexSet) {
        for index in offsets {
            let space = spaces[index]
            modelContext.delete(space)
        }
        
        do {
            try modelContext.save()
        } catch {
            // For now we’ll just print; later we can add nicer error UI
            print("Failed to delete space: \(error)")
        }
    }
}

#Preview {
    // Simple in-memory container for previews
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Space.self, configurations: config)
    
    let context = container.mainContext
    context.insert(Space(name: "Den", emoji: "🛋️", notes: "Main hangout"))
    context.insert(Space(name: "Bathroom", emoji: "🚿"))
    
    return SpacesView()
        .modelContainer(container)
}
