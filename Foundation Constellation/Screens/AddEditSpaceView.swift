//
//  AddEditSpaceView.swift
//  Foundation Constellation
//
//  Created by Zero on 12/27/25.
//


import SwiftUI
import SwiftData

struct AddEditSpaceView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var emoji: String = "⭐️"
    @State private var notes: String = ""
    
    // If this is non-nil, we're editing an existing space
    var space: Space?
    
    init(space: Space? = nil) {
        self.space = space
        _name = State(initialValue: space?.name ?? "")
        _emoji = State(initialValue: space?.emoji ?? "⭐️")
        _notes = State(initialValue: space?.notes ?? "")
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Basic Info") {
                    TextField("Name (Den, Bedroom…)", text: $name)
                        .textInputAutocapitalization(.words)
                    
                    TextField("Emoji (🛋️, 🧠, 🌌…)", text: $emoji)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        .frame(maxWidth: 80)
                }
                
                Section("Notes") {
                    TextField("Optional notes about this space", text: $notes, axis: .vertical)
                        .lineLimit(3...6)
                }
            }
            .navigationTitle(space == nil ? "New Space" : "Edit Space")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        save()
                    }
                    .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
    
    private func save() {
        let trimmedName = name.trimmingCharacters(in: .whitespaces)
        let trimmedEmoji = emoji.trimmingCharacters(in: .whitespaces)
        let trimmedNotes = notes.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if let space {
            // Update existing
            space.name = trimmedName
            space.emoji = trimmedEmoji.isEmpty ? "⭐️" : trimmedEmoji
            space.notes = trimmedNotes.isEmpty ? nil : trimmedNotes
        } else {
            // Create new
            let newSpace = Space(
                name: trimmedName,
                emoji: trimmedEmoji.isEmpty ? "⭐️" : trimmedEmoji,
                notes: trimmedNotes.isEmpty ? nil : trimmedNotes
            )
            modelContext.insert(newSpace)
        }
        
        do {
            try modelContext.save()
            dismiss()
        } catch {
            print("Failed to save space: \(error)")
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Space.self, configurations: config)
    
    let context = container.mainContext
    let sample = Space(name: "Den", emoji: "🛋️", notes: "Main space")
    context.insert(sample)
    
    return AddEditSpaceView(space: sample)
        .modelContainer(container)
}
