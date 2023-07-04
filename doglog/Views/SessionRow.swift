//
//  SessionRow.swift
//  doglog
//
//  Created by tri on 01/07/2023.
//

import SwiftUI

struct SessionRow: View {
    @ObservedObject var session: ObservableSession
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("cava.domen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .overlay {
                    RoundedRectangle(cornerRadius: 10.0).stroke(.white, lineWidth: 4)
                }
            
            HStack {
                Image("pawprint")
                    .resizable()
                    .frame(width: 22, height: 22)

                VStack(alignment: .leading) {
                    Text(session.title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    HStack {
                        Text("\(dateFormatter.string(from: session.date)) • \(session.location.name)")
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            .padding(.top, 3)
            .padding(.bottom, 10)
            .padding(.trailing)
            .padding(.leading)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .shadow(radius: 7)
        .overlay {
            RoundedRectangle(cornerRadius: 10.0).stroke(.white, lineWidth: 4)
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "d.MMMM yyyy"
    return formatter
}()

struct SessionRow_Previews: PreviewProvider {
    static var previews: some View {
        SessionRow(session: ObservableSession(withSession: sessions[0]))
//            .previewLayout(.fixed(width: 300, height: 70))
            .padding()

    }
}
