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
        PrimaryNavigationView().requiresAuthentication()
    }
}

