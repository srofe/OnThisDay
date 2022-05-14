//
//  OnThisDayApp.swift
//  OnThisDay
//
//  Created by Simon Rofe on 12/5/2022.
//
//

import SwiftUI

@main
struct OnThisDayApp: App {
    @AppStorage("displayMode") var displayMode = DisplayMode.auto
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .onAppear {
                    DisplayMode.changeDisplayMode(to: displayMode)
                }
                .onChange(of: displayMode) { newMode in
                    DisplayMode.changeDisplayMode(to: newMode)
                }
        }
        .commands {
            Menus()
        }
    }
}
