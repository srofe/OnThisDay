//
// Created by Simon Rofe on 14/5/2022.
//

import SwiftUI

struct Toolbar: CustomizableToolbarContent {
    @Binding var viewMode: ViewMode

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
        ToolbarItem(id: "viewMode") {
            Picker("View Mode", selection: $viewMode) {
                Label("Grid", systemImage: "square.grid.3x2")
                    .tag(ViewMode.grid)
                Label("Table", systemImage: "tablecells")
                    .tag(ViewMode.table)
            }
            .pickerStyle(.segmented)
            .help("Switch between Grid and Table")
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
