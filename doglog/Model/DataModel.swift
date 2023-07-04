//
//  DataModel.swift
//  doglog
//
//  Created by tri on 01/07/2023.
//

import Foundation

var sessions: [Session] = load("sessionData.json")

//@dynamicMemberLookup
class ObservableSessions: ObservableObject {    
    @Published var sessions: [ObservableSession]
    
    init(withSessions sessions: [Session]) {
        self.sessions = sessions.map { session in
            ObservableSession(withSession: session)
        }
//        self.sessions = sessions
    }
    
//    subscript(dynamicMember member: String) -> Any {
//        return sessions
//    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
