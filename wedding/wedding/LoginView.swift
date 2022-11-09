//
//  LoginView.swift
//  wedding
//
//  Created by Nate M1 on 11/9/22.
//

import SwiftUI

struct LoginView: View {
    @State var showingHomeView = false
    @State private var textFieldString: String = ""
    var body: some View {
        if (showingHomeView) {
            HomeView(showingHomeView: $showingHomeView, textFieldString: $textFieldString)
        }else {
            VStack{
                VStack{
                    Spacer()
                    Spacer()
                    Text("Save the Date!")
                    Spacer()
                    Text("October 7th, 2023")
                    Spacer()
                }
                VStack{
                    Spacer()
                    Spacer()
                    TextField("Event Code / Password", text: $textFieldString)
                    Spacer()
                    Button("Sign In", action: signin)
                    Spacer()
                }
            }.background(Color.red)
        }
    }
    
    
    public func signin(){
        if(textFieldString == "123"){
            showingHomeView = true
        }
    }
}
