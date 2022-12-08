//
//  SettingsView.swift
//  wedding
//
//  Created by Nate M1 on 12/8/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Button{
            UserAuth.shared.logInOrOff()
        }label:{
            Text("< Logout")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
