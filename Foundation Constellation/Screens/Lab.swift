import SwiftUI

struct LabView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Experiments") {
                    Label("ZeroOS Health Log", systemImage: "heart.text.square")
                    Label("Constellation Prototypes", systemImage: "sparkles")
                    Label("OnyxSuit / Biofeedback (future)", systemImage: "bolt.heart")
                }

                Section("Debug & Settings") {
                    Label("Data inspector (later)", systemImage: "terminal")
                    Label("CloudKit sync status", systemImage: "icloud")
                }
            }
            .navigationTitle("Lab")
        }
    }
}

#Preview {
    LabView()
}
