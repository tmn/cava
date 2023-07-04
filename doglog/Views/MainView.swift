//
//  Home.swift
//  doglog
//
//  Created by tri on 07/06/2023.
//

import SwiftUI
import CoreData

struct MainView: View {
    @ObservedObject private var sessions: ObservableSessions
    //    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var popoverActive: Bool = false
    
    init(sessions: ObservableSessions) {
        self.sessions = sessions
    }
    //    @FetchRequest(
    //        sortDescriptors: [NSSortDescriptor(keyPath: \Distraction.name, ascending: true)],
    //        animation: .default)
    //    private var items: FetchedResults<Distraction>
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                VStack {
                    SessionList(sessions: sessions, path: $path)
                        .navigationDestination(for: ObservableSession.self) { session in
                            SessionDetail(session: session, path: $path)
                        }
                        .padding(.top)
                }
                
                VStack {
                    Spacer()
                    Button {
                        popoverActive = true
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .bold()
                        
                    }
                    .padding(25)
                    .background(.white)
                    .clipShape(Circle())
                    .shadow(radius: 7)
                }
            }
            .popover(isPresented: $popoverActive) {
                let emtpySession = Session(
                    title: "",
                    date: .now,
                    location: Location(name: "", latitude: 0.0, longitude: 0.0, utm32: ""),
                    goal: Goal(type: .Other, description: ""),
                    variables: Variables(distractions: [], command: "", reward: "", environment: "", other: ""),
                    nextSession: Goal(type: .Obedience, description: "")
                )
                
                NavigationStack {
                    SessionDetail(session: ObservableSession(withSession: emtpySession), path: $path)
                        .navigationTitle("Ny økt")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button("Lukk") {
                                    popoverActive = false
                                }
                            }
                        }
                }
            }
        }
    }
    
    
    //    private func addItem() {
    //        withAnimation {
    //            let newItem = Item(context: viewContext)
    //            newItem.timestamp = Date()
    //
    //            do {
    //                try viewContext.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nsError = error as NSError
    //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    //            }
    //        }
    //    }
    
    //    private func deleteItems(offsets: IndexSet) {
    //        withAnimation {
    //            offsets.map { items[$0] }.forEach(viewContext.delete)
    //
    //            do {
    //                try viewContext.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nsError = error as NSError
    //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    //            }
    //        }
    //    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        
        MainView(sessions: ObservableSessions(withSessions: sessions))
        //            .environment(\.managedObjectContext, PersistenceController.previewDistraction.container.viewContext)
    }
}
