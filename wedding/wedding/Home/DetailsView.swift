//
//  HomeView.swift
//  wedding
//
//  Created by Nate M1 on 11/9/22.
//

import SwiftUI

enum ringTypeEnum {
    case engagement, wedding, alternateWedding
}

struct DetailsView: View{
    var body: some View{
        
        
        VStack {
            VStack{
                Text("Save the Date")
                Text("for the wedding of")
                HStack{
                    Spacer()
                    Text("Danielle Dombro")
                    Spacer()
                    Text("&")
                    Spacer()
                    Text("Nate Schaffner")
                    Spacer()
                }
                Text("October 7th, 2023")
                HStack{
                    Spacer()
                    Text("East Windsor, NJ")
                    Spacer()
                    Text("·")
                    Spacer()
                    Text("Invitation to follow")
                    Spacer()
                }
            }
        }
    }
}
