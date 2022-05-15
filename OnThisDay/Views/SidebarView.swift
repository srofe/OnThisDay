//
// Created by Simon Rofe on 13/5/2022.
//

import SwiftUI

struct SidebarView: View {
    @EnvironmentObject var appState: AppState
    @AppStorage("showTotals") var showTotals = true
    @SceneStorage("selectedDate") var selectedDate: String?
    @Binding var selection: EventType?

    var body: some View {
        VStack {
            List(selection: $selection) {
                Section(selectedDate?.uppercased() ?? "TODAY") {
                    ForEach(EventType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                            .badge(showTotals ? appState.countFor(eventType: type, date: selectedDate) : 0)
                    }
                }
                Section("AVAILABLE DATES") {
                    ForEach(appState.sortedDates, id: \.self) { date in
                        Button {
                            selectedDate = date
                        } label: {
                            HStack {
                                Text(date)
                                Spacer()
                            }
                        }
                        .controlSize(.large)
                        .modifier(DateButtonViewModifier(selected: date == selectedDate))
                    }
                }
            }
            .listStyle(.sidebar)
            Spacer()
            DayPicker()
        }
        .frame(minWidth: 220)
    }
}

struct DateButtonViewModifier: ViewModifier {
    var selected: Bool

    func body(content: Content) -> some View {
        if selected {
            content
                .buttonStyle(.borderedProminent)
        } else {
            content
        }
    }
}
