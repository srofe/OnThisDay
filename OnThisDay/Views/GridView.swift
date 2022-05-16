   //
//  GridView.swift
//  OnThisDay
//
//  Created by Simon Rofe on 13/5/2022.
//

import SwiftUI

struct GridView: View {
    @AppStorage("showTotals") var showTotals = true
    var gridData: [Event]
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 250, maximum: 250), spacing: 20)]
    }

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(gridData) { event in
                        EventView(event: event)
                            .frame(height: 350, alignment: .topLeading)
                            .background()
                            .clipped()
                            .border(.secondary, width: 1)
                            .padding(.bottom, 5)
                            .shadow(color: .primary.opacity(0.3), radius: 3, x: 3, y: 3)
                    }
                }
            }
            if showTotals {
                Text("\(gridData.count) \(gridData.count == 1 ? "entry" : "entries")")
                    .padding(.bottom, 8)
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(gridData: [Event.sampleEvent])
    }
}
