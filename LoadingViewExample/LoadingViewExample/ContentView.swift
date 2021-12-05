//
//  ContentView.swift
//  LoadingViewExample
//
//  Created by Juraj Macák on 03/12/2021.
//

import SwiftUI
import LoadingButton

struct ContentView: View {

    @State private var name: String = ""

    @State private var isLoading: Bool = false
    @FocusState private var isFocus: Bool

    private var style: LoadingButtonStyle {
        return .init(width: 200, height: 40, cornerRadius: 20, backgroundColor: .blue, loadingColor: .blue, strokeWidth: 1, strokeColor: .white)
    }

    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                .textContentType(.name)
                .focused($isFocus)

            LoadingButton(action: {
                isFocus = false

                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {self.isLoading = false
                }
            }, isLoading: $isLoading, style: style) {
                Text("Log in")
            }
            .foregroundColor(.white)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
