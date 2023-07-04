//
//  SessionList.swift
//  doglog
//
//  Created by tri on 01/07/2023.
//

import SwiftUI

struct SessionList: View {
    @ObservedObject var sessions: ObservableSessions
    @Binding var path: NavigationPath
    
    var body: some View {
        
        List($sessions.sessions, id: \.self) { $session in
            Button {
                path.append(session)
            } label: {
                SessionRow(session: session)
                    
            }
            .listRowSeparator(.hidden)
            
            .padding(.leading)
            .padding(.trailing)
            
        }
        .navigationTitle("Treninger")
        .listStyle(.inset)
        .padding(-16)
        
    }
}

struct SessionList_Previews: PreviewProvider {
    @State static var path = NavigationPath()
    
    static var previews: some View {
        SessionList(sessions: ObservableSessions(withSessions: sessions), path: $path)
    }
}
