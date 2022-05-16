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

struct ShowView: View {
    @AppStorage("showBirths") var showBirths = true
    @AppStorage("showDeaths") var showDeaths = true
    @AppStorage("showTotals") var showTotals = true

    var body: some View {
        VStack(alignment: .leading) {
            Toggle("Show Births", isOn: $showBirths)
            Toggle("Show Deaths", isOn: $showDeaths)
            Toggle("Show Totals", isOn: $showTotals)
        }
    }
}
