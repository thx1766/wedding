//
//  SettingsView.swift
//  wedding
//
//  Created by Nate M1 on 11/14/22.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    var body: some View {
        Button{
            UserAuth.shared.logInOrOff()
        } label: {
            Text("< Logout")
        }
    }
}
