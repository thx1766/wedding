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
        
        
        VStack(alignment: .leading, spacing: 8.0) {
            
            Image ("Nate and Dani")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
            // .frame (width: 26.0, height: 26.0)
            //  .cornerRadius (10)
            //   .padding (9)
            //   .background (.ultraThinMaterial, in:
            //                 RoundedRectangle(cornerRadius: 16, style: // .continuous))
            // .strokeStyle(cornerRadius: 16)
            HStack{
                Text("are getting married")
                    .font(.system(size: 30))
                  //  .foregroundStyle(.linearGradient(colors:
                    //                                    [.accentColor,.orange.opacity(0.6)],
                      //                               startPoint: .center, endPoint: .bottomTrailing))
                Image(systemName: "party.popper")
                    .font(.system(size: 28))
                 //   .foregroundColor(.orange)
            }
            
            HStack{
                Text ("on October 7th, 2023".uppercased())
                Image(systemName: "calendar")}
            .foregroundColor(.accentColor)
            .font(.system(size: 20.0, weight: .bold))
            .foregroundStyle(.primary)
            HStack{
                Text("At East Windsor, New Jersey")
                Image(systemName: "mappin")}
            .foregroundColor(.accentColor)
            .font(.system(size: 20.0))
            .frame(maxWidth: .infinity, alignment: .leading)
            //    HStack{
               // Text("Head to the RSVP tab to save the date")
                   // .foregroundColor(.accentColor)
                   // .font(.system(size: 20.0))
                 //   .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.all, 20.0)
            .padding(.vertical, 10)
            .frame(height: 280.0)
            .background(.ultraThinMaterial, in:
                            RoundedRectangle(cornerRadius: 30, style: .continuous))
            .cornerRadius(30.0)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            // .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, у: 10)
            //   .strokeStyle()
            .padding(.horizontal, 20)
            .background (
                Image ("Pic6")
                //               .resizable()
                    .offset(x: 200, y: -150)
            )
            .overlay(
                
                Image ("ring")
                    .resizable()
                    .aspectRatio (contentMode: .fit)
                    .frame(height: 190)
                    .offset (x: 100, y: -150)
                
                
                //        VStack {
                //            VStack{
                //                Text("Save the Date")
                //                Text("for the wedding of")
                //                HStack{
                //                    Spacer()
                //                    Text("Danielle Dombro")
                //                    Spacer()
                //                    Text("&")
                //                    Spacer()
                //                    Text("Nate Schaffner")
                //                    Spacer()
                //                }
                //                Text("October 7th, 2023")
                //                HStack{
                //                    Spacer()
                //                    Text("East Windsor, NJ")
                //                    Spacer()
                //                    Text("·")
                //                    Spacer()
                //                    Text("Invitation to follow")
                //                    Spacer()
                //                }
                //            }
                //        }
                //    }
                //}
            )
        }}
