//
//  TableView.swift
//  OnThisDay
//
//  Created by Simon Rofe on 15/5/2022.
//

import SwiftUI

struct TableView: View {
    @AppStorage("showTotals") var showTotals = true
    @State private var sortOrder = [KeyPathComparator(\Event.year)]
    @State private var selectedEventID: UUID?
    var tableData: [Event]
    var sortedTableData: [Event] {
        tableData.sorted(using: sortOrder)
    }
    var selectedEvent: Event? {
        guard let selectedEventID = selectedEventID else { return nil }
        let event = tableData.first { event in
            event.id == selectedEventID
        }
        return event
    }

    var body: some View {
        VStack {
            HStack {
                Table(sortedTableData, selection: $selectedEventID, sortOrder: $sortOrder) {
                    TableColumn("Year", value: \.year) { item in
                        Text(item.year)
                    }
                    .width(min: 50, ideal: 60, max: 100)
                    TableColumn("Title", value: \.text) { item in
                        Text(item.text)
                    }
                }
                if let selectedEvent = selectedEvent {
                    EventView(event: selectedEvent)
                        .frame(width: 250)
                } else {
                    Text("Select an event for more details...")
                        .font(.title)
                        .padding()
                        .frame(width: 250)
                }
            }
        }
        if showTotals {
            Text("\(sortedTableData.count) \(sortedTableData.count == 1 ? "entry" : "entries")")
                .padding(.bottom, 8)
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView(tableData: [Event.sampleEvent])
    }
}
