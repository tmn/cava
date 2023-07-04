//
//  Location.swift
//  doglog
//
//  Created by tri on 01/07/2023.
//

import Foundation

struct Location: Hashable, Codable {
    var name: String
    var latitude: Double
    var longitude: Double
    var utm32: String
}
