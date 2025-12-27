import SwiftUI

struct PeopleView: View {
    // temporary fake data
    let samplePeople = ["Zero (you)", "Mom", "Seth"]

    var body: some View {
        NavigationStack {
            List {
                Section("People") {
                    ForEach(samplePeople, id: \.self) { person in
                        HStack {
                            Image(systemName: "person.fill")
                                .imageScale(.small)
                            Text(person)
                        }
                    }
                }
            }
            .navigationTitle("People")
            .toolbar {
                Button {
                    // later: add person
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    PeopleView()
}
