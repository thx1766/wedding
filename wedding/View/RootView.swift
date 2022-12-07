//
//  RootView.swift
//  wedding
//
//  Created by Venus Bhatia on 07/12/22.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab: Tabs = .Home
    
    var body: some View {
        
        VStack {
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
            
            Spacer()
            
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
