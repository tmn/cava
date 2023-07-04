//
//  Goal.swift
//  doglog
//
//  Created by tri on 14/06/2023.
//

import Foundation


struct Goal: Hashable, Codable {
    var type: GoalType
    var description: String
}

enum GoalType: String, CaseIterable, Codable {
    case Behavioural
    case Obedience
    case Availability
    case Other
}
