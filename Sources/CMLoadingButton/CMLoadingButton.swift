import SwiftUI

public struct CMButtonStyle {
    public init() {
        
    }
    public var width: CGFloat = 312
    public var height: CGFloat = 54
    public var cornerRadius: CGFloat = 27
    public var backgroundColor: Color = .green
    public var loadingBackgroundColor: Color = Color.green.opacity(0.7)
    public var animation: Animation = .easeInOut
}

public enum EndAnimation {
    case normal
    case shake
}

public struct CMLoadingButton<Content: View>: View{
    @Binding var isLoading: Bool
    var style: CMButtonStyle
    let content: Content
    
    public init(isLoading: Binding<Bool>, style: CMButtonStyle, @ViewBuilder builder: () -> Content) {
        self._isLoading = isLoading
        self.style = style
        content = builder()
    }
    
    public var body: some View {
            Button(action: {
                
            }) {
                ZStack {
                    Rectangle()
                        .fill(isLoading ? style.loadingBackgroundColor : style.backgroundColor)
                        .frame(width: isLoading ? style.height : style.width, height: style.height)
                        .cornerRadius(isLoading ? style.height/2 : style.cornerRadius)
                    if isLoading {
                        if #available(iOS 14.0, *) {
                            ProgressView()
                        }
                    }
                    else {
                        Group {
                            content
                            
                        }
                    }
                    
                }
                
            }.frame(width: style.width, height: style.height)
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
