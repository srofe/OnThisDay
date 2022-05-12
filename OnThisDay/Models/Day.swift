//
// Created by Simon Rofe on 13/5/2022.
//

import Foundation

struct Day: Decodable {
    let date: String
    let data: [String:[Event]]

    var events: [Event] { data[EventType.events.rawvalue] ?? [] }
    var births: [Event] { data[EventType.births.rawvalue] ?? [] }
    var deaths: [Event] { data[EventType.deaths.rawvalue] ?? [] }

    var displayDate: String {
        date.replacingOccurrences(of: "_", with: " ")
    }
}
