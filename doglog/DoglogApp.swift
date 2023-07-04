//
//  doglogApp.swift
//  doglog
//
//  Created by tri on 06/06/2023.
//

import SwiftUI
import Supabase

@main
struct DoglogApp: App {
    let persistenceController = PersistenceController.shared
//    @EnvironmentObject var supabaseClient = SupabaseClient(supabaseURL: URL(string: "https://htqrnyfzxrbjrmdbxvsg.supabase.com")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh0cXJueWZ6eHJianJtZGJ4dnNnIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4OTA4ODA3MywiZXhwIjoyMDA0NjY0MDczfQ.FM9x78TEznffjiGvuVotRDqVT4dcs3tpZtYVAc1_Puc")

    var body: some Scene {
        WindowGroup {
            MainView(sessions: ObservableSessions(withSessions: sessions))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
