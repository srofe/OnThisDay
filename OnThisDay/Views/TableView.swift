//
//  TableView.swift
//  OnThisDay
//
//  Created by Simon Rofe on 15/5/2022.
//

import SwiftUI

struct TableView: View {
    @State private var sortOrder = [KeyPathComparator(\Event.year)]
    var tableData: [Event]
    var sortedTableData: [Event] {
        tableData.sorted(using: sortOrder)
    }

    var body: some View {
        Table(sortedTableData, sortOrder: $sortOrder) {
            TableColumn("Year", value: \.year) { item in
                Text(item.year)
            }
            .width(min: 50, ideal: 60, max: 100)
            TableColumn("Title", value: \.text) { item in
                Text(item.text)
            }
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView(tableData: [Event.sampleEvent])
    }
}
