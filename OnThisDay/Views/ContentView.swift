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
    var events: [Event] {
        appState.dataFor(eventType: eventType)
    }

    var body: some View {
        NavigationView {
            SidebarView(selection: $eventType)
            GridView(gridData: events)
        }
        .frame(
            minWidth: 700,
            idealWidth: 1000,
            maxWidth: .infinity,
            minHeight: 400,
            idealHeight: 800,
            maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
