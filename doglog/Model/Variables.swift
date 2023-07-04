//
//  Variables.swift
//  doglog
//
//  Created by tri on 01/07/2023.
//

import Foundation

struct Variables: Hashable, Codable {
    var distractions: [Distraction]
    var command: String
    var reward: String
    var environment: String
    var other: String
}
