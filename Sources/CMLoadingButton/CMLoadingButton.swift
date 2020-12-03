import SwiftUI

public struct CMLoadingButton<Content: View>: View{
    @Binding var isLoading: Bool
    var style: CMButtonStyle? = CMButtonStyle()
    let content: Content
    var endAnimation: EndAnimation = .normal
    var action: () -> () = {}
    
    public init(action: @escaping () -> Void, isLoading: Binding<Bool>, endAnimation: EndAnimation? = nil, style: CMButtonStyle? = nil, @ViewBuilder builder: () -> Content) {
        self._isLoading = isLoading
        self.style = style ?? CMButtonStyle()
        self.endAnimation = endAnimation ?? .normal
        content = builder()
    }
    
    public var body: some View {
        Button(action: {
            if !isLoading {
                action()
            }
            isLoading = true
        }) {
            ZStack {
                Rectangle()
                    .fill(isLoading ? style!.loadingBackgroundColor : style!.backgroundColor)
                    .frame(width: isLoading ? style!.height : style!.width, height: style!.height)
                    .cornerRadius(isLoading ? style!.height/2 : style!.cornerRadius)
                    .animation(.easeInOut)
                if isLoading {
                    CircleLoadingBar(style: style!)
                }
                else {
                    VStack {
                        content.animation(.easeInOut)
                    }
                }
            }
        }.frame(width: style!.width, height: style!.height)
    }
    
    /// Start Loading
    public func startLoading() -> Void {
        withAnimation() {
            self.isLoading = true
        }
    }
    
    /// End Loading with EndAnimation(normal, shake, expand)
//    public func endLoading(with: EndAnimation) -> Void {
//        print("endLoading")
//        withAnimation {
//            self.isLoading = false
//        }
//    }
    
    public func endLoading() -> Void {
        print("endLoading")
    }
}

