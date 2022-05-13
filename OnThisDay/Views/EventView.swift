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
                Text(event.year)
                    .font(.title)
                Text(event.text)
                    .font(.title3)
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
