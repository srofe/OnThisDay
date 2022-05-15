//
// Created by Simon Rofe on 14/5/2022.
//

import SwiftUI

struct Toolbar: CustomizableToolbarContent {
    var body: some CustomizableToolbarContent {
        ToolbarItem(
            id: "toogleSidebar",
            placement:  .navigation,
            showsByDefault: true) {
            Button {
                toggleToolbar()
            } label: {
                Label("Toggle Sidebar", systemImage: "sidebar.left")
            }
            .help("Toggle Sidebar")
        }
    }

    func toggleToolbar() {
        NSApp.keyWindow?
            .contentViewController?
            .tryToPerform(
                #selector(NSSplitViewController.toggleSidebar(_:)),
                with: nil)
    }
}
