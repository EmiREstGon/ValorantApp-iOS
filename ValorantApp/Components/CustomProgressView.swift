//
//  CustomProgressView.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 8/6/23.
//

import SwiftUI

struct CustomProgressView: View {
    
    // MARK: Variable
    var color: Color
    var scale: Double = 1.5
    
    var body: some View {
        ProgressView()
            .tint(color)
            .scaleEffect(x: scale, y: scale)
    }
}

struct CustomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressView(color: Color("lightRed"), scale: 1.5)
    }
}
