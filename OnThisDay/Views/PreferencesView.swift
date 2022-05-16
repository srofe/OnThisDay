//
// Created by Simon Rofe on 16/5/2022.
//

import SwiftUI

struct PreferencesView: View {
    var body: some View {
        TabView {
            Text("Tab 1 content here")
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Show")
                }
            Text("Tab 2 content here")
                .tabItem {
                    Image(systemName: "sun.min")
                    Text("Appearance")
                }
        }
            .frame(width: 200, height: 150)
    }
}
