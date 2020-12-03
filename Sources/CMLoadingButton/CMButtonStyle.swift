//
//  SwiftUIView.swift
//  
//
//  Created by 변경민 on 2020/12/02.
//

import SwiftUI

public struct CMButtonStyle {
    public init() {
        
    }
    public init(w width: CGFloat? = nil, h height: CGFloat? = nil, r cornerRadius: CGFloat? = nil, bgColor: Color? = nil, loadingColor: Color? = nil, animation: Animation? = nil) {
        self.width = width ?? 312
        self.height = height ?? 54
        self.cornerRadius = cornerRadius ?? 0
        self.backgroundColor = bgColor ?? Color.green
        self.loadingBackgroundColor = loadingColor ?? Color.green.opacity(0.5)
    }
    public var width: CGFloat = 312
    public var height: CGFloat = 54
    public var cornerRadius: CGFloat = 0
    public var backgroundColor: Color = .green
    public var loadingBackgroundColor: Color = Color.green.opacity(0.5)
    public var animation: Animation = .easeInOut
}

public enum EndAnimation {
    case normal
    case shake
    case expand
}
