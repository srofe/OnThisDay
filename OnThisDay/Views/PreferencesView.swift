//
// Created by Simon Rofe on 16/5/2022.
//

import SwiftUI

struct PreferencesView: View {
    var body: some View {
        TabView {
            ShowView()
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Show")
                }
            AppearanceView()
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

struct AppearanceView: View {
    @AppStorage("displayMode") var displayMode = DisplayMode.auto

    var body: some View {
        Picker("", selection: $displayMode) {
            Text("Light").tag(DisplayMode.light)
            Text("Dark").tag(DisplayMode.dark)
            Text("Auto").tag(DisplayMode.auto)
        }
            .pickerStyle(.radioGroup)
    }
}
