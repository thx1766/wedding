////
////  LoginView.swift
////  wedding
////
////  Created by Nate M1 on 11/9/22.
////

import SwiftUI

struct LoginView: View {
@State var password: String = ""
var body: some View {
    VStack{}
//    VStack {
//        VStack{
//            Spacer()
//            Spacer()
//            Text("Save the Date!")
//            Spacer()
//            Text("October 7th, 2023")
//            Spacer()
//        }.background(Color.teal)
//            Text("Event Password Required").padding()
//            TextField("Code", text: $password)
//            Button {
//                UserAuth.shared.logInOrOff(passCode: password)
//            } label: {
//                Text("Log In")
//            }
//        }.background(Color.purple)
    }
}

class UserAuth: ObservableObject {
    static let shared = UserAuth()
    @Published private(set) var isLoggedIn = false
    
    func logInOrOff(passCode: String = "Test"){
        if passCode == "" {
            isLoggedIn = true
        } else{
            isLoggedIn = false
        }
            
    }
}

extension View {
    @ViewBuilder
    func requiresAuthentication() -> some View {
        if UserAuth.shared.isLoggedIn {
            //self
            self
        }else{
            //LoginView()
            PasswordPageView()
        }
    }
}
