//
//  TableView.swift
//  OnThisDay
//
//  Created by Simon Rofe on 15/5/2022.
//

import SwiftUI

struct TableView: View {
    var tableData: [Event]

    var body: some View {
        Table(tableData) {
            TableColumn("Year") { item in
                Text(item.year)
            }
            .width(min: 50, ideal: 60, max: 100)
            TableColumn("Title") { item in
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
