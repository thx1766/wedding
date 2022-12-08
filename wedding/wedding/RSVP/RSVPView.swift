//
//  RSVPView.swift
//  wedding
//
//  Created by Venus Bhatia on 08/12/22.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.26085,
                                                                                  longitude: -74.55831),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.01,
                                                                          longitudeDelta: 0.01))
    var body: some View {
        ZStack {
                Map(coordinateRegion: $region)
                .ignoresSafeArea()
                VStack {
                    Image("savethedate")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 110)
                        .shadow(radius: 10)
                    Spacer()
                }
            }
            .frame(height: 550, alignment: .topLeading)
        }
    }

//Button(
//  "Apple Maps",
//  action: {
//      let latitude = 40.26085
//      let longitude = -74.55831
//      let url = URL(string: "maps://?saddr=&daddr=\(40.26085),\(-74.55831)")
//      if UIApplication.shared.canOpenURL(url!) {
//            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
//  }
//)

struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}
