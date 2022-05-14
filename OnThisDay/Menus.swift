//
//  Menus.swift
//  OnThisDay
//
//  Created by Simon Rofe on 14/5/2022.
//

import SwiftUI

struct Menus: Commands {
    var body: some Commands {
        SidebarCommands()
        ToolbarCommands()

        CommandGroup(before: .help) {
            Button("ZenQuotes.io web site") {
                showAPIWebSite()
            }
            .keyboardShortcut("/", modifiers: .command)
        }

        CommandMenu("Display") {}
    }

    private func showAPIWebSite() {
        let address = "https://today.zenquotes.io"
        guard let url = URL(string: address) else {
            fatalError("Invalid address")
        }
        NSWorkspace.shared.open(url)
    }
}
