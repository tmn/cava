//
//  Distractions.swift
//  doglog
//
//  Created by tri on 07/06/2023.
//

import SwiftUI

struct DistractionView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var distraction: String = ""
    @State private var distractions: [Distraction] = []
    
//    @FetchRequest(sortDescriptors: [], animation: .default)
//       private var distractionss: FetchedResults<Distraction>
    
    var body: some View {
        VStack {
            HStack {
                LabeledContent {
                    TextField("Forstyrrelse", text: $distraction)
                } label: {
                    Text("Forstyrrelse:")
                }
                
                Spacer()
                
                Button("Add") {
//                    let d = Distraction(context: viewContext)
//                    d.id = UUID()
//                    d.name = distraction
//                    
//                    do {
//                        try viewContext.save()
//                    } catch {
//                        print("Unexpected error: \(error)")
//                    }
//                    
//                    distraction = ""
                    
                }
            }
            .padding(.horizontal)
            
            Spacer()
//            List(distractionss, id: \.id) { dist in
//                VStack(alignment: .leading) {
//                    Text("Name: \(dist.name ?? "")")
//                    Text("ID: \(dist.id?.uuidString ?? "")")
//                }
//            }
        }
    }
}

struct Distractions_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DistractionView()
        }
    }
}
