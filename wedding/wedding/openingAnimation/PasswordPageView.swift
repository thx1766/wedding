import SwiftUI

struct PasswordPageView: View {
    var body: some View {
        AnimatedSplashScreen(color: "Yellow", logo: "SwiftLogo",animationTiming: 0.65) {
            // MARK: Your Home View
        } onAnimationEnd: {
            print("Animation Ended")
        }
    }
}

