//
//  CustomTabBar.swift
//  wedding
//
//  Created by Venus Bhatia on 07/12/22.
//

import SwiftUI

enum Tabs: Int {
    case Home = 0
    case RSVP = 1
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        
        HStack {
            
            Button {
                selectedTab = .Home
            } label: {
                
                VStack (alignment: .center, spacing: 4 ) {
                    Image(systemName: "house.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("Home")
                }
            }
            .tint(Color("accentColor"))
            
            
            Button {
                selectedTab = .RSVP
            } label: {
                
                VStack (alignment: .center, spacing: 4 ) {
                    Image(systemName: "calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("RSVP")
                }
            }
            .tint(Color("accentColor"))
            
            
        }
    }
    
    struct CustomTabBar_Previews: PreviewProvider {
        static var previews: some View {
            CustomTabBar(selectedTab: .constant(.RSVP))
        }
    }
}
