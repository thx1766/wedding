//
//  weddingApp.swift
//  wedding
//
//  Created by Nate Intel on 11/5/22.
//

import SwiftUI

@main
struct weddingApp: App {
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}

struct AuthView: View {
    
    @StateObject private var userAuth = UserAuth.shared
    
    @State var username: String = ""

    var body: some View {
        TabView{
            PrimaryNavigationView()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
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
            LocationMapView()
                .tabItem{
                    Image(systemName:"calendar")
                    Text("RSVP")
                }
            SettingsView()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
   
        .requiresAuthentication()
    }
}
