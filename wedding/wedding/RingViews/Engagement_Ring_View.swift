//
//  Engagement_Ring_View.swift
//  wedding
//
//  Created by user232646 on 11/26/22.
//

import Foundation
//
//  EngagementBandRingView.swift
//  wedding
//
//  Created by Nate on Nov 9th 2022
//

import SwiftUI
import SceneKit

struct Engagement_Ring_View: View {
    //@Binding var showingRingView: Bool
    //@State public var showEngagementRingDetails = false
    @State var scene: SCNScene? = .init(named: "Engagement_Ring.scn")
    // MARK: View Properties
    //@State var isVerticalLook: Bool = false
    //@State var currentSize: String = "9"
    @Namespace var animation
    @GestureState var offset: CGFloat = 0
    var body: some View {
        VStack{
            VStack{
                Spacer()
                CustomSceneView(scene: $scene)
                    .frame(height: 350)
                    .zIndex(-10)
                CustomSeeker()
                Spacer()
            }
            .padding()
        }
    }
    
    // MARK: Custom Seeker
    @ViewBuilder
    func CustomSeeker()->some View{
        GeometryReader{_ in
            Rectangle()
                .trim(from: 0, to: 0.474)
                .stroke(.linearGradient(colors: [
                    .clear,
                    .clear,
                    .white.opacity(0.2),
                    .white.opacity(0.6),
                    .white,
                    .white.opacity(0.6),
                    .white.opacity(0.2),
                    .clear,
                    .clear
                ], startPoint: .leading, endPoint: .trailing),style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, miterLimit: 1, dash: [3], dashPhase: 1))
                .offset(x: offset)
                .overlay {
                    // MARK: Seeker View
                    HStack(spacing: 3){
                        Image(systemName: "arrowtriangle.left.fill")
                            .font(.caption)
                        Image(systemName: "arrowtriangle.right.fill")
                            .font(.caption)
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal,7)
                    .padding(.vertical,10)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.white)
                    }
                    .offset(y: -12)
                    .offset(x: offset)
                    .gesture(
                        DragGesture()
                            .updating($offset, body: { value, out, _ in
                                // Reducing The Size of the Knob
                                // Assuming the Total Size will be 40
                                // So Reducing 40/2 -> 20
                                out = value.location.x - 20
                            })
                    )
                }
        }
        .frame(height: 20)
        .onChange(of: offset, perform: { newValue in
            rotateObject(animate: offset == .zero)
        })
        .animation(.easeInOut(duration: 0.4), value: offset == .zero)
    }
    
    // MARK: Rotating 3D Object Programatically
    func rotateObject(animate: Bool = false){
        // The Rotation is more or like same as 3D Rotation in SwiftUI
        // Y Will Be Used for Horizontal Rotataion
        // And Vice Versa for X
        if animate{
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.4
        }
        let newAngle = Float((offset * .pi) / 180)
        //rotate in x and y axes together
        scene?.rootNode.childNode(withName: "Camera", recursively: true)?.eulerAngles.x = newAngle
        scene?.rootNode.childNode(withName: "Camera", recursively: true)?.eulerAngles.y = newAngle
        if animate{
            SCNTransaction.commit()
        }
    }
}
