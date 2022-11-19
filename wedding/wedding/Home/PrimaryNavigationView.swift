//
//  PrimaryNavigationView.swift
//  wedding
//
//  Created by Nate Hackintosh on 11/18/22.
//

import SwiftUI

struct PrimaryNavigationView: View {
    var body: some View {
        VStack{
            Text("Save The Date")
            ScrollView{
                VStack{
                    NavigationView{
                        VStack{
                            NavigationLink(destination: WeddingBandRingView()){
                                Text("Wedding Ring")
                                    .frame(width: 200, height: 150)
                                    .background(Color.green)
                            }
                            NavigationLink(destination: EngagementBandRingView()){
                                Text("Engagement Ring")
                                    .frame(width: 200, height: 150)
                                    .background(Color.purple)
                            }
                            

                        }
                        .frame(width: 300, height: 400)
                        .background(Color.blue)
                        .navigationTitle("View the Rings!")
                    }
                    .frame(height: 500)
                    NavigationView{
                        VStack{
                            NavigationLink(destination: DetailsView()){
                                Text("Details page")
                                    .frame(width:200, height: 150)
                                    .background(Color.red)
                            }
                        }
                        .navigationTitle("Details")
                    }
                    .frame(height: 500)
                    NavigationView{
                     NavigationLink(destination: SettingsView()){
                         VStack{
                             Text("Open Settings").frame(width:300, height: 150).background(Color.gray)
                         }.navigationTitle("Settings")
                    }
                    }.frame(height: 400)
                }
            }
        }
    }
}


struct PrimaryNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryNavigationView()
    }
}
