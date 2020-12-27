import SwiftUI

public struct CMLoadingButton<Content: View>: View{
    @Binding var isLoading: Bool
    var style: CMButtonStyle? = CMButtonStyle()
    let content: Content
    var action: () -> () = {}
    
    public init(action: @escaping () -> Void, isLoading: Binding<Bool>, style: CMButtonStyle? = nil, @ViewBuilder builder: () -> Content) {
        self._isLoading = isLoading
        self.style = style ?? CMButtonStyle()
        content = builder()
        self.action = action
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
}

