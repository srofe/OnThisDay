//
//  EventView.swift
//  OnThisDay
//
//  Created by Simon Rofe on 13/5/2022.
//

import SwiftUI

struct EventView: View {
    var event: Event

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 30) {
                Label(event.year, systemImage: "calendar")
                    .font(.title)
                    .foregroundColor(.green)
                Text(event.text)
                    .font(.title3)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Related Links:")
                    ForEach(event.links) { link in
                        Link(link.title, destination: link.url)
                            .onHover { inside in
                                if inside {
                                    NSCursor.pointingHand.push()
                                } else {
                                    NSCursor.pop()
                                }
                            }
                    }
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
        .frame(width: 250)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: Event.sampleEvent)
            .previewLayout(.sizeThatFits)
    }
}
