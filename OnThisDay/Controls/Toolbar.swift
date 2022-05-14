//
// Created by Simon Rofe on 14/5/2022.
//

import SwiftUI

struct Toolbar: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement:  .navigation) {
            Button {
                // button action
            } label: {
                Image(systemName: "sidebar.left")
            }
                    .help("Toggle Sidebar")
        }
    }
}
