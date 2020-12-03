import SwiftUI

public struct CMLoadingButton<Content: View>: View{
    @Binding var isLoading: Bool
    var style: CMButtonStyle? = CMButtonStyle()
    let content: Content
    var action: Void
    var endAnimation: EndAnimation = .normal
    
    public init(action: @escaping () -> Void, isLoading: Binding<Bool>, endAnimation: EndAnimation, style: CMButtonStyle, @ViewBuilder builder: () -> Content) {
        self._isLoading = isLoading
        self.style = style
        self.endAnimation = endAnimation
        content = builder()
//        print(type(of: action))
    }
    
    public init(action: @escaping () -> Void, isLoading: Binding<Bool>, @ViewBuilder builder: () -> Content) {
        
        self._isLoading = isLoading
        content = builder()
//        print(type(of: action))
    }
    
    public var body: some View {
            Button(action: {
                withAnimation(.easeInOut) {
                    isLoading = true
                }
                
                // custom actions here
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
    public func ifFail(_ endAnimation: EndAnimation) {
        if(endAnimation == .normal) {
            // reverse to normal size
        }
        else if (endAnimation == .shake) {
            // reverse to normal size and shake the button
        }
    }
    public func startLoading() -> Void {
        withAnimation() {
            self.isLoading = true
        }
    }
    public func endLoading() -> Void {
        self.isLoading = false
    }
    public func toggle() -> Void {
        self.isLoading.toggle()
    }
    
}

