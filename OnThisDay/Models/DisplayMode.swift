//
//  DisplayMode.swift
//  OnThisDay
//
//  Created by Simon Rofe on 14/5/2022.
//

import SwiftUI

enum DisplayMode: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case auto = "Auto"

    static func changeDisplayMode(to mode: DisplayMode) {
        @AppStorage("displayMode") var displayMode = DisplayMode.auto

        displayMode = mode
        switch mode {
        case .light: NSApp.appearance = NSAppearance(named: .aqua)
        case .dark: NSApp.appearance = NSAppearance(named: .darkAqua)
        case .auto: NSApp.appearance = nil
        }
    }
}
