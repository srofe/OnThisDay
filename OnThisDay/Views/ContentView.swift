//
//  ContentView.swift
//  OnThisDay
//
//  Created by Simon Rofe on 12/5/2022.
//
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @State private var eventType: EventType? = .events
    @State private var searchText = ""
    var events: [Event] {
        appState.dataFor(eventType: eventType, searchText: searchText)
    }
    var windowTitle: String {
        if let eventType = eventType {
            return "On This Day - \(eventType.rawValue)"
        } else {
            return "On This Day"
        }
    }

    var body: some View {
        NavigationView {
            SidebarView(selection: $eventType)
//            GridView(gridData: events)
            TableView(tableData: events)
        }
        .frame(
            minWidth: 700,
            idealWidth: 1000,
            maxWidth: .infinity,
            minHeight: 400,
            idealHeight: 800,
            maxHeight: .infinity)
        .navigationTitle(windowTitle)
        .toolbar(id: "mainToolbar") {
            Toolbar()
        }
            .searchable(text: $searchText)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
