//
//  DayPicker.swift
//  OnThisDay
//
//  Created by Simon Rofe on 15/5/2022.
//

import SwiftUI

struct DayPicker: View {
    @EnvironmentObject var appState: AppState
    @State private var month = "January"
    @State private var day = 1
    var maxDays: Int {
        switch month {
        case "February": return 29
        case "April", "June", "September", "November": return 30
        default: return 31
        }
    }

    var body: some View {
        VStack {
            Text("Select a Date")
            HStack {
                Picker("", selection: $month) {
                    ForEach(appState.englishMonthNames, id: \.self) { month in
                        Text(month)
                    }
                }
                .pickerStyle(.menu)
                Picker("", selection: $day) {
                    ForEach(1 ... maxDays, id: \.self) { day in
                        Text("\(day)")
                    }
                }
                .pickerStyle(.menu)
                .frame(maxWidth: 60)
                .padding(.trailing, 10)
            }
            // Button goes here
        }
        .padding()
    }
}

struct DayPicker_Previews: PreviewProvider {
    static var previews: some View {
        DayPicker()
            .environmentObject(AppState())
            .frame(width: 200)
    }
}
