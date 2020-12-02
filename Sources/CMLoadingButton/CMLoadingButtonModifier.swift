//
//  SwiftUIView.swift
//  
//
//  Created by 변경민 on 2020/12/02.
//

import SwiftUI

public struct CMLoadingButtonModifier: ViewModifier {
    public init() {
        
    }
    public func body(content: Content) -> some View {
        content
            
    }
}

extension CMLoadingButton {
    public func styled() -> some View {
        self.modifier(CMLoadingButtonModifier())
    }
}
