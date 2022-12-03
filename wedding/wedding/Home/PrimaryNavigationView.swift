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
            Image("savethedate")
                .resizable()
                .scaledToFit()
            ScrollView{
                VStack{
                    NavigationView{
                        VStack{
                            Text("photobooth")
                            .font(.custom("Covered", size: 23))
                           
                            PhotoView()}
                        }
                        .frame(width: 300, height: 400)
                        .navigationTitle("Images")
                    }
                    .frame(height: 500)
                    NavigationView{
                        HStack{
                            NavigationLink(destination: Wedding_Ring_View()){
                                Text("Wedding Ring")
                                    .frame(width: 200, height: 150)
                                  
                            }
                            NavigationLink(destination: Engagement_Ring_View()){
                                Text("Engagement Ring")
                                    .frame(width: 200, height: 150)
                          
                            }
                        }
                        .frame(width: 300, height: 400)
                    
                        .navigationTitle("Check out rings")
                    }
                    .frame(height: 600)
                    NavigationView{
                        VStack{
                            NavigationLink(destination: DetailsView()){
                                Text("Details")
                                    .frame(width:200, height: 150)
                                    
                            }
                        }
                        .navigationTitle("Event Info")
                    }
                    .frame(height: 500)
                    NavigationView{
                     NavigationLink(destination: SettingsView()){
                         VStack{
                             Text("Settings (Logout)").frame(width:300, height: 150);
                         }.navigationTitle("Settings")
                    }
                    }
                    .frame(height: 300)
                }
            }
        }
    }
