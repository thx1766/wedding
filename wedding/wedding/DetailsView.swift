//
//  DetailsView.swift
//  wedding
//
//  Created by Nate Intel on 11/1/22.
//

import SwiftUI

struct DetailsView: View {
    var body: some View {
        VStack {
            VStack{
                Spacer()
                Text("Save The Date")
                Spacer()
                Text("for the wedding of")
                Spacer()
                HStack{
                    Spacer()
                    Text("Danielle")
                    Spacer()
                    Text("&")
                    Spacer()
                    Text("Nate")
                    Spacer()
                }

            }
            Spacer()
            VStack{
                Text("October 7th, 2023")
                Spacer()
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
            Spacer()
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
