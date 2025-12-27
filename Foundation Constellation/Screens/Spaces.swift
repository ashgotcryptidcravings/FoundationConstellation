import SwiftUI

struct SpacesView: View {
    // temporary fake data – later this will come from SwiftData/CloudKit
    let sampleSpaces = ["Den", "Bedroom", "Bathroom", "Kitchen"]

    var body: some View {
        NavigationStack {
            List {
                Section("Spaces") {
                    ForEach(sampleSpaces, id: \.self) { space in
                        HStack {
                            Image(systemName: "square.fill")
                                .imageScale(.small)
                            Text(space)
                        }
                    }
                }
            }
            .navigationTitle("Spaces")
            .toolbar {
                Button {
                    // later: present “Add Space” sheet
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    SpacesView()
}
