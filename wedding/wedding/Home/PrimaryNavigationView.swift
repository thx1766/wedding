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
                            NavigationLink(destination: PhotoView()){
                                Text("Engagement Photos")
                                    .frame(width: 200, height: 150)
                                    .background(Color.cyan)
                            }
                        }
                        .frame(width: 300, height: 400)
                        .background(Color.orange)
                        .navigationTitle("Images!")
                    }
                    .frame(height: 500)
                    NavigationView{
                        VStack{
                            NavigationLink(destination: Wedding_Ring_View()){
                                Text("Wedding Ring")
                                    .frame(width: 200, height: 150)
                                    .background(Color.green)
                            }
                            NavigationLink(destination: Engagement_Ring_View()){
                                Text("Engagement Ring")
                                    .frame(width: 200, height: 150)
                                    .background(Color.purple)
                            }
                        }
                        .frame(width: 300, height: 400)
                        .background(Color.blue)
                        .navigationTitle("Hardware!")
                    }
                    .frame(height: 600)
                    NavigationView{
                        VStack{
                            NavigationLink(destination: DetailsView()){
                                Text("Details")
                                    .frame(width:200, height: 150)
                                    .background(Color.red)
                            }
                        }
                        .navigationTitle("Event Info!")
                    }
                    .frame(height: 500)
                    NavigationView{
                     NavigationLink(destination: SettingsView()){
                         VStack{
                             Text("Settings (Logout)").frame(width:300, height: 150).background(Color.gray)
                         }.navigationTitle("Settings")
                    }
                    }
                    .frame(height: 300)
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
