import SwiftUI

// MARK: Custom View Builder
struct AnimatedSplashScreen<Content: View>: View {
    var content: Content
    // MARK: Properties
    var color: String
    var logo: String
    var barHeight: CGFloat = 60
    var animationTiming: Double = 0.65
    var onAnimationEnd: ()->()
    init(color: String,logo: String,barHeight: CGFloat = 60,animationTiming: Double = 0.65,@ViewBuilder content: @escaping ()->Content,onAnimationEnd: @escaping ()->()){
        self.content = content()
        self.onAnimationEnd = onAnimationEnd
        self.color = color
        self.logo = logo
        self.barHeight = barHeight
        self.animationTiming = animationTiming
    }
    // MARK: Animation Properties
    @State var startAnimation: Bool = false
    @State var animateContent: Bool = false
    @Namespace var animation
    
    // MARK: Controls and Callbacks
    @State var disableControls: Bool = true
    @State var password: String = ""
    var body: some View {
        VStack(spacing: 0){
            if startAnimation{
                GeometryReader{proxy in
                    let size = proxy.size
                    
                    VStack(spacing: 0){
                        ZStack(alignment: .bottom){
                            Rectangle()
                            // MARK: Optional
                                .fill(Color("Yellow"))
                                .matchedGeometryEffect(id: "SPLASHCOLOR", in: animation)
                            // MARK: Proxy is Not Returning Safe Area Values
                            
                                .background{Color(red: 255, green: 268, blue: 129)}
                            
                            Image("SplashImage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .matchedGeometryEffect(id: "SPLASHICON", in: animation)
                               }
                        .ignoresSafeArea(.container, edges: .all)
                        Text("Event Password Required").padding()
                        TextField("Code", text: $password)
                        Button(action: {
                            print("Button action")
                            UserAuth.shared.logInOrOff(passCode: password)
                        }) {
                            Text("Click to Login")
                            .padding (15.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15.0)
                                    .stroke(lineWidth: 0.5)
                                    .foregroundColor(.white)
                                    .frame (height: 55)
                                    .frame (maxWidth: .infinity)
                        )}
                        
                        content
                        // MARK: If You Don't want that space then remove bar height from height value
                        // MARK: We Need to Animate with Another State Value
                            .offset(y: animateContent ? 0 : (size.height - (safeArea().top)))
                            .disabled(disableControls)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                }
                .transition(.identity)
                
                .onAppear {
                    if !animateContent{
                        withAnimation(.easeInOut(duration: animationTiming)){
                            animateContent = true
                        }
                    }
                }
            }else{
                ZStack{
                    Rectangle()
                    // MARK: Optional
                        .fill(Color("Yellow"))
                        .matchedGeometryEffect(id: "SPLASHCOLOR", in: animation)
                    Image("SwiftIcon")
                        .matchedGeometryEffect(id: "SPLASHICON", in: animation)
                }
                .ignoresSafeArea(.container, edges: .all)
            }
        }
        .onAppear {
            if !startAnimation{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
                    withAnimation(.easeInOut(duration: animationTiming)){
                        startAnimation = true
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + (animationTiming - 0.05)){
                    disableControls = false
                    onAnimationEnd()
                }
            }
        }
    }
}

