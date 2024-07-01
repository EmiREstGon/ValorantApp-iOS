//
//  GradientBackgroundView.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 1/7/24.
//

import SwiftUI

struct GradientBackgroundView: View {
    @State private var changeColor = false
    var primaryColor: Color = Color("lightRed")
    var secondaryColor: Color = Color("darkBlue")

    var body: some View {
        LinearGradient(gradient: Gradient(colors: changeColor ? [primaryColor, secondaryColor] : [secondaryColor, primaryColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .animation(Animation.linear(duration: 15).repeatForever(autoreverses: true), value: changeColor)
            .onAppear {
                self.changeColor.toggle()
            }
            .edgesIgnoringSafeArea(.all)
    }
}

struct GradientBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackgroundView()
    }
}
