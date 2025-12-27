import SwiftUI

struct TodayView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Hey, Zero.")
                    .font(.largeTitle.bold())

                Text("Welcome to Foundation Constellation v0.1")
                    .foregroundStyle(.secondary)

                Divider()

                Text("Today")
                    .font(.title3.bold())

                Text("Once we add data, this screen will show:")
                VStack(alignment: .leading, spacing: 6) {
                    Text("• Your ColorCore for today")
                    Text("• Rooms that need attention")
                    Text("• Any active routines")
                    Text("• Quick health / mood logs")
                }
                .font(.subheadline)

                Spacer()
            }
            .padding()
            .navigationTitle("Today")
        }
    }
}

#Preview {
    TodayView()
}
