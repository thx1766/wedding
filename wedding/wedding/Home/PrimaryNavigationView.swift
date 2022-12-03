//
//  PrimaryNavigationView.swift
//  wedding
//
//  Created by Nate Hackintosh on 11/18/22.
//

import SwiftUI

struct PrimaryNavigationView: View {
    var body: some View {
        ScrollView{
            VStack{
                NavigationView{
                    VStack{
                        Image(systemName: "slowmo")
                            .font(.custom("Covered", size: 23))
                        Spacer()
                        PhotoView()}
                }
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
        .overlay(
            ZStack {
                Color.clear
                    .background (.ultraThinMaterial)
                .blur (radius: 10)
                Text ("Save The Date")
                .font(.largeTitle.weight(.bold))
                .frame (maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                
            }
               
                .frame (height: 90)
                .frame(maxHeight: .infinity, alignment: .top)
        )
    }
        }
