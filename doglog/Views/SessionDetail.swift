//
//  SessionDetail.swift
//  doglog
//
//  Created by tri on 01/07/2023.
//

import SwiftUI


struct SessionDetail: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var session: ObservableSession
    @Binding var path: NavigationPath
    
    @State private var showDistractionSheet: Bool = false
    @State private var showLocationSheet: Bool = false

    var body: some View {
        List {
            Section {
                TextField("Økt", text: $session.title)
                
                NavigationLink {
                    LocationView()
                } label: {
                    HStack {
                        Text("Sted")
                        Spacer()
                        Text("\(session.location.name)")
                    }
                }
                
                DatePicker(selection: $session.date, displayedComponents: .date) {
                    Text("Dato")
                }
            }
            Section(header: Text("Mål for økten")) {
                Picker("Mål", selection: $session.goal.type) {
                    ForEach(GoalType.allCases, id: \.self) { goal in
                        Text(goal.rawValue.capitalized).tag(goal)
                    }
                }
                
                TextField("Beskrivelse", text: $session.goal.description)
                
            }
            
            Section(header: Text("Variabler")) {
                Button {
                    showDistractionSheet = true
                } label: {
                    Picker("Forstyrrelser", selection: $session.variables.distractions) {
                        Text("\(session.variables.distractions.count)").tag(session.variables.distractions.count)
                    }
                    .pickerStyle(.navigationLink)
                }
                .tint(.black)
                .sheet(isPresented: $showDistractionSheet) {
                    NavigationStack {
                        DistractionView()
//                                .environment(\.managedObjectContext, PersistenceController.previewDistraction.container.viewContext)
                            .padding()
                    }
                }
                
                LabeledContent {
                    TextField("Kommando", text: $session.variables.command)
                } label: {
                    Text("Kommando")
                }
                .multilineTextAlignment(.trailing)
                
                LabeledContent {
                    TextField("Miljø", text: $session.variables.environment)
                } label: {
                    Text("Miljø")
                }
                .multilineTextAlignment(.trailing)
                
                LabeledContent {
                    TextField("Belønning", text: $session.variables.reward)
                } label: {
                    Text("Belønning")
                }
                .multilineTextAlignment(.trailing)
                
                
                TextField("Annet", text: $session.variables.other, axis: .vertical).lineLimit(5, reservesSpace: true)
                
            }
            
            Section(header: Text("Mål for neste økt")) {
                Picker("Mål", selection: $session.nextSession.type) {
                    ForEach(GoalType.allCases, id: \.self) { goal in
                        Text(goal.rawValue.capitalized).tag(goal)
                    }
                }
                TextField("Notater", text: $session.nextSession.description, axis: .vertical).lineLimit(5, reservesSpace: true)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Lagre") {

                }
            }
        }
    }
}

struct SessionDetail_Previews: PreviewProvider {
    @State static var path = NavigationPath()
    
    static var previews: some View {
        NavigationStack {
            SessionDetail(session: ObservableSession(withSession: sessions[0]), path: $path)
        }
    }
}
