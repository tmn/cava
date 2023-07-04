//
//  LocationView.swift
//  doglog
//
//  Created by tri on 12/06/2023.
//

import SwiftUI
import MapKit

struct LocationView: View {
//    @State private var mapRegion = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12),
//        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
//    )

    @State private var searchText: String = ""
    @State private var presentSheet: Bool = true
    @State private var presentSheetDetent: PresentationDetent = .medium
    
    
    var body: some View {
        MapView()
        .sheet(isPresented: $presentSheet) {
            NavigationStack {
                VStack {
                    Spacer()
                }
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            }
            .presentationDetents([.medium, .height(100.0), .large], selection: $presentSheetDetent)
            .interactiveDismissDisabled()
            .presentationBackgroundInteraction(.enabled(upThrough: .medium))
        }

    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
