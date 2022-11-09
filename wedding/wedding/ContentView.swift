//
//  ContentView.swift
//  wedding
//
//  Created by Nate Intel on 11/1/22.
//

import SwiftUI

struct ContentView: View {
    @State public var showEngagementRingDetails = false
    @State public var showWeddingRingDetails = false
    @State private var showingDetails = false
    @State private var textFieldString: String = ""
    var body: some View {
        if showingDetails {
            DetailsView()
        } else if showEngagementRingDetails{
            EngagementBandRingView()
        } else if showWeddingRingDetails{
            WeddingBandRingView()
        }else {
            VStack{
                Text("Save the Date!")
                Text("October 7th, 2022")
                TextField("Password", text: $textFieldString)
                Button("Sign In", action: signin)
                Button("Check out the engagement ring!", action: engagementRing)
                Button("Check out the wedding ring!", action: weddingRing)
            }
        }
    }
    
    public func signin(){
        if(textFieldString == "123"){
            showingDetails = true
        }
    }
    public func engagementRing(){
        if(textFieldString == "123"){
            showEngagementRingDetails = true
        }
    }
    public func weddingRing(){
        if(textFieldString == "123"){
            showWeddingRingDetails = true
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
