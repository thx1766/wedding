//
//  HomeView.swift
//  wedding
//
//  Created by Nate M1 on 11/9/22.
//

import SwiftUI

enum ringTypeEnum {
    case engagement, wedding, alternateWedding
}
struct HomeView: View {
    var body: some View {
        NavigationView{
                VStack {
                    VStack{
                        Text("for the wedding of")
                        Spacer()
                        HStack{
                            Spacer()
                            Text("Danielle Dombro")
                            Spacer()
                            Text("&")
                            Spacer()
                            Text("Nate Schaffner")
                            Spacer()
                        }
                    }
                    VStack{
                        Text("October 7th, 2023")
                        Spacer()
                        HStack{
                            Spacer()
                            Text("East Windsor, NJ")
                            Spacer()
                            Text("·")
                            Spacer()
                            Text("Invitation to follow")
                            Spacer()
                        }
                    }
                    
                    NavigationLink(destination: EngagementBandRingView()){
                        HStack{
                            Text("Engagement Ring")
                            Image(systemName: "rotate.3d")
                        }
                    }
                    NavigationLink(destination:  WeddingBandRingView()){
                        HStack{
                            Text("Wedding Ring")
                            Image(systemName: "rotate.3d")
                        }
                    }
                    NavigationLink(destination:  AlternateWeddingBandRingView()){
                        HStack{
                            Text("Alternate Wedding Ring Rendering")
                            Image(systemName: "rotate.3d")
                        }
                    }
                    NavigationLink(destination: SettingsView()){
                        Text("Settings")
                    }
                }.navigationTitle("Save The Date")
        }
    }
}
