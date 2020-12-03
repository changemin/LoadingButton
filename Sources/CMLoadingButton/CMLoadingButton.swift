import SwiftUI

public func endLoading(with: EndAnimation) -> Void {
    withAnimation {
        //isLoading = false
        // shake or not
    }
}

public struct CMLoadingButton<Content: View>: View{
    @Binding var isLoading: Bool
    var style: CMButtonStyle? = CMButtonStyle()
    let content: Content
    var endAnimation: EndAnimation = .normal
    var action: () -> () = {}
    
    public init(action: @escaping () -> Void, isLoading: Binding<Bool>, endAnimation: EndAnimation, style: CMButtonStyle, @ViewBuilder builder: () -> Content) {
        self._isLoading = isLoading
        self.style = style
        self.endAnimation = endAnimation
        content = builder()
        print(type(of: action))
    }
    
    public init(action: @escaping () -> Void, isLoading: Binding<Bool>, @ViewBuilder builder: () -> Content) {
        self._isLoading = isLoading
        content = builder()
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            withAnimation(.easeInOut) {
                isLoading = true
            }
            action()
        }) {
            ZStack {
                Rectangle()
                    .fill(isLoading ? style!.loadingBackgroundColor : style!.backgroundColor)
                    .frame(width: isLoading ? style!.height : style!.width, height: style!.height)
                    .cornerRadius(isLoading ? style!.height/2 : style!.cornerRadius)
                if isLoading {
                    if #available(iOS 14.0, *) {
                        ProgressView()
                    }
                }
                else {
                    VStack {
                        content
                        
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
    public func endLoading(with: EndAnimation) -> Void {
        withAnimation {
            self.isLoading = false
        }
    }
}

