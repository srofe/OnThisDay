//
// Created by Simon Rofe on 13/5/2022.
//

import SwiftUI

struct SidebarView: View {
    @EnvironmentObject var appState: AppState
    @AppStorage("showTotals") var showTotals = true
    @Binding var selection: EventType?

    var body: some View {
        List(selection: $selection) {
            Section("TODAY") {
                ForEach(EventType.allCases, id: \.self) { type in
                    Text(type.rawValue)
                        .badge(showTotals ? appState.countFor(eventType: type) : 0)
                }
            }
        }
        .listStyle(.sidebar)
    }
}
