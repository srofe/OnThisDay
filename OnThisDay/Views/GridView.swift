//
//  GridView.swift
//  OnThisDay
//
//  Created by Simon Rofe on 13/5/2022.
//

import SwiftUI

struct GridView: View {
    var gridData: [Event]
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 250, maximum: 250), spacing: 20)]
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(gridData) { event in
                    EventView(event: event)
                        .frame(height: 350, alignment: .topLeading)
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(gridData: [Event.sampleEvent])
    }
}
