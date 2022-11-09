//
//  HomeView.swift
//  wedding
//
//  Created by Nate M1 on 11/9/22.
//

import SwiftUI

enum ringTypeEnum {
    case engagement, wedding
}

struct HomeView: View {
    @Binding var showingHomeView: Bool
    @State var showingRingView = false
    @Binding var textFieldString: String
    @State var showingWedding = false
    @State var showingEngagement = false
    
    var body: some View {
        if (showingRingView){
            if(showingWedding){
                Ring(type: ringTypeEnum.wedding)
            }else if(showingEngagement){
                Ring(type: ringTypeEnum.engagement)
            }
        }
        else{
            VStack{
                Button("< Logout", action: ShowLoginView)
                VStack {
                    VStack{
                        Spacer()
                        Text("Save The Date")
                        Spacer()
                        Text("for the wedding of")
                        Spacer()
                        HStack{
                            Spacer()
                            Text("Danielle Dombro")
                            Spacer()
                            Text("&")
                            Spacer()
                            Text("Nate Schaffner")
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
                    VStack{
                        Spacer()
                        Button("Check out the engagement ring!"){showEngagementRingFunc()}
                        Spacer()
                        Button("Check out the wedding ring!"){showWeddingRingFunc()}
                        Spacer()
                    }
                }
            }
            .background(Color.orange)
        }
    }
    func ShowLoginView(){
        showingHomeView = false
        textFieldString = ""
    }
    
    @ViewBuilder
    func Ring(type: ringTypeEnum) -> some View{
        if type == ringTypeEnum.wedding {
            WeddingBandRingView(showingRingView: $showingRingView)
        }
        else if type == ringTypeEnum.engagement {
            EngagementBandRingView(showingRingView: $showingRingView)
        }
    }
    func showWeddingRingFunc(){
        showingRingView = true
        showingWedding = true
        showingEngagement = false
    }
    func showEngagementRingFunc(){
        showingRingView = true
        showingEngagement = true
        showingWedding = false
    }
}
