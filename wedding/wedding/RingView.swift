//
//  Home.swift
//  3DShoeApp (iOS)
//
//  Created by Venus on 29/08/22.
//

import SwiftUI
import SceneKit

struct RingView: View {
    
    @State public var showDetails = false
    
    @State var scene: SCNScene? = .init(named: "Engagement_9mm.scn")
    // MARK: View Properties
    @State var isVerticalLook: Bool = false
    @State var currentSize: String = "9"
    @Namespace var animation
    
    @GestureState var offset: CGFloat = 0
    var body: some View {
        VStack{
            HeaderView()
            
            // MARK: 3D Preview
            CustomSceneView(scene: $scene)
                .frame(height: 350)
                .padding(.top,-50)
                .padding(.bottom,-15)
                .zIndex(-10)
            
            CustomSeeker()
            
            ShoePropertiesView()
        }
        .padding()
    }
    
    // MARK: Shoe Properties
    @ViewBuilder
    func ShoePropertiesView()->some View{
        VStack{
            VStack(alignment: .leading, spacing: 12) {
                Text("Wedding Ring")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text("Save the Date: October 7th, 2023 ")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                Label {
                    Text("4.8")
                        .fontWeight(.semibold)
                } icon: {
                    Image(systemName: "star.fill")
                }
                .foregroundColor(Color("Gold"))
            }
            .padding(.top,30)
            .frame(maxWidth: .infinity,alignment: .leading)
            
            // MARK: Check Out Button
            HStack(alignment: .top){
                Button {
                    
                } label: {
                    VStack(spacing: 12){
                        Image("weddingappicon")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                        
                        Text("Open in Maps")
                            .fontWeight(.semibold)
                            .padding(.top,15)
                    }
                    .foregroundColor(.black)
                    .padding(18)
                    .background {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(.white)
                    }
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Venue: Acadian Trail, San Fransisco")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    Button {
                        
                    } label: {
                        Text("Click to open in Maps")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .padding(.top,10)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,20)
            }
            .padding(.top,30)
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
        
        // MARK: Now Rotate the New Child Node
        if isVerticalLook{
            scene?.rootNode.childNode(withName: "Circle", recursively: true)?.eulerAngles.x = newAngle
            scene?.rootNode.childNode(withName: "Circle_002", recursively: true)?.eulerAngles.x = newAngle
            scene?.rootNode.childNode(withName: "Plane", recursively: true)?.eulerAngles.x = newAngle
            scene?.rootNode.childNode(withName: "Round", recursively: true)?.eulerAngles.x = newAngle
            scene?.rootNode.childNode(withName: "Size", recursively: true)?.eulerAngles.x = newAngle
            scene?.rootNode.childNode(withName: "_materials", recursively: true)?.eulerAngles.x = newAngle
            
        }else{
            scene?.rootNode.childNode(withName: "Circle", recursively: true)?.eulerAngles.y = newAngle
            scene?.rootNode.childNode(withName: "Circle_002", recursively: true)?.eulerAngles.y = newAngle
            scene?.rootNode.childNode(withName: "Plane", recursively: true)?.eulerAngles.y = newAngle
            scene?.rootNode.childNode(withName: "Round", recursively: true)?.eulerAngles.y = newAngle
            scene?.rootNode.childNode(withName: "Size", recursively: true)?.eulerAngles.y = newAngle
            scene?.rootNode.childNode(withName: "_materials", recursively: true)?.eulerAngles.y = newAngle
        }
        
        if animate{
            SCNTransaction.commit()
        }
    }
    
    // MARK: Header View
    @ViewBuilder
    func HeaderView()->some View{
        HStack{
            Button {
                
            } label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 16, weight: .heavy))
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                    .background {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(.white.opacity(0.2))
                    }
            }
            
            Spacer()
            
            Button {
                withAnimation(.easeInOut){isVerticalLook.toggle()}
            } label: {
                Image(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right.fill")
                    .font(.system(size: 16, weight: .heavy))
                    .foregroundColor(.white)
                    .rotationEffect(.init(degrees: isVerticalLook ? 0 : 90))
                    .frame(width: 42, height: 42)
                    .background {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(.white.opacity(0.2))
                    }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
