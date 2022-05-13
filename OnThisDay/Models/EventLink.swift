//
// Created by Simon Rofe on 13/5/2022.
//

import Foundation

struct EventLink: Decodable, Identifiable {
    let id: UUID
    let title: String
    let url: URL
}
