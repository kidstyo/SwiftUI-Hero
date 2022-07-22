import SwiftUI

struct DetailView: View {

    @Binding var person: String
    @Binding var state: String

    var body: some View {
        let _ = Self._printChanges()
        Text("\(person) is currently \(state)")
            .padding()
    }
}

struct PrintChangeView: View {

    static let people = ["Luke", "Leia", "Han"]
    static let states = ["angry 😡", "busy 😬", "sleepy 😪"]

    @State var person: String = people.randomElement()!
    @State var state: String = states.randomElement()!

    var body: some View {
        DetailView(person: $person, state: $state)
            .onReceive(Timer.publish(every: 1,
                                     on: .main,
                                     in: .common).autoconnect()) { _ in
                person = PrintChangeView.people.randomElement()!
            }
            .onReceive(Timer.publish(every: 2,
                                    on: .main,
                                    in: .common).autoconnect()) { _ in
                state = PrintChangeView.states.randomElement()!
            }
    }
}
