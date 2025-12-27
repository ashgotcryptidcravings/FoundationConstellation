import SwiftUI

struct ConstellationView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Foundation Constellation")
                    .font(.largeTitle.bold())

                Text("This will become the visual map of your rooms, people, routines, and logs.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)

                RoundedRectangle(cornerRadius: 24)
                    .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [4, 6]))
                    .frame(height: 200)
                    .overlay {
                        VStack(spacing: 8) {
                            Text("Constellation Map")
                                .font(.headline)
                            Text("Coming soon: nodes, links, glowing stars.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                    }

                Spacer()
            }
            .padding()
            .navigationTitle("Constellation")
        }
    }
}

#Preview {
    ConstellationView()
}
