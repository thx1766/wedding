//
//  ContentView.swift
//  wedding
//
//  Created by Nate Intel on 11/1/22.
//

import SwiftUI

struct ContentView: View {
    @State public var showDetails = false
    @State private var showingDetails = false
    @State private var textFieldString: String = ""
    var body: some View {
        if showingDetails {
            DetailsView()
        } else if showDetails{
            RingView()
        } else {
            VStack{
                Text("Save the Date!")
                Text("October 7th, 2022")
                TextField("Password", text: $textFieldString)
                Button("Sign In", action: signin)
                Button("Check Out The Ring!", action: ring)
            }
        }
    }
    
    public func signin(){
        if(textFieldString == "123"){
            showingDetails = true
        }
    }
    public func ring(){
        if(textFieldString == "123"){
            showDetails = true
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
