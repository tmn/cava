//
//  Session.swift
//  doglog
//
//  Created by tri on 01/07/2023.
//

import Foundation

struct Session: Hashable, Codable, Identifiable {
    var id: UUID = UUID()
    var title: String
    var date: Date
    var location: Location
    var goal: Goal
    var variables: Variables
    var nextSession: Goal
}

@dynamicMemberLookup
class ObservableSession: ObservableObject {
    @Published var session: Session
    
    init(withSession session: Session) {
        self.session = session
    }
    
    subscript<T>(dynamicMember keyPath: WritableKeyPath<Session, T>) -> T {
        get { session[keyPath: keyPath] }
        set { session[keyPath: keyPath] = newValue }
    }
}

extension ObservableSession: Hashable {
    static func == (lhs: ObservableSession, rhs: ObservableSession) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(session.id)
    }
}

