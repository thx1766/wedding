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
                .navigationTitle("check out our rings")
            }
            .frame(height: 500)
            NavigationView{
                VStack{
                    DetailsView()
                }
            }
            .frame(height: 500)
            NavigationView{
                SettingsView()
                   // VStack{
                   //     Text("Logout").frame(width:300, height: 150);
                   // }
                }
            .frame(height: 100)
        }
        .overlay(
            ZStack {
                Color.clear
                    .background (.ultraThinMaterial)
                .blur (radius: 10)
            Text("Save the Date")
                    .foregroundColor(.accentColor)
                    .font(.custom("Gistesy", size: 55))
                .frame (maxWidth: .infinity, alignment: .center)
                      //.padding(.leading, 20)
            }
                .frame (height: 110)
                .frame(maxHeight: .infinity, alignment: .top)
        )
    }
        }
