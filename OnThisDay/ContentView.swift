//
//  ContentView.swift
//  OnThisDay
//
//  Created by Simon Rofe on 12/5/2022.
//
//

import SwiftUI

struct ContentView: View {
    @State private var eventType: EventType? = .events

    var body: some View {
        NavigationView {
            SidebarView(selection: $eventType)
            Text("Fake details")
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
