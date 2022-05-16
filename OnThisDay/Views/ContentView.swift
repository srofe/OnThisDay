//
//  ContentView.swift
//  OnThisDay
//
//  Created by Simon Rofe on 12/5/2022.
//
//

import SwiftUI

enum ViewMode: Int {
    case grid
    case table
}

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @SceneStorage("eventType") var eventType: EventType?
    @SceneStorage("searchText") var searchText = ""
    @SceneStorage("viewMode") var viewMode: ViewMode = .grid
    @SceneStorage("selectedDate") var selectedDate: String?
    var events: [Event] {
        appState.dataFor(eventType: eventType, date: selectedDate, searchText: searchText)
    }
    var windowTitle: String {
        var title = "On This Day"

        if let eventType = eventType {
            title += " - \(eventType.rawValue)"
        }
        if let selcteddate = selectedDate {
            title += " - \(selcteddate)"
        } else {
            title += " - Today"
        }

        return title
    }

    var body: some View {
        NavigationView {
            SidebarView(selection: $eventType)
            if viewMode == .grid {
                GridView(gridData: events)
            } else {
                TableView(tableData: events)
            }
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
            Toolbar(viewMode: $viewMode)
        }
        .searchable(text: $searchText)
        .onAppear {
            if eventType == nil {
                eventType = .events
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
