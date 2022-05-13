//
// Created by Simon Rofe on 13/5/2022.
//

import SwiftUI

struct SidebarView: View {
    @Binding var selection: EventType?

    var body: some View {
        List(selection: $selection) {
            Section("TODAY") {
                ForEach(EventType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                }
            }
        }
    }
}
