//
//  WeaponStatImage.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 7/6/23.
//

import SwiftUI

struct WeaponStatImage: View {
    
    // MARK: Variables
    var imageName: String
    var width: CGFloat, padding: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: width)
            .shadow(radius: 3)
            .padding(.leading, padding)
    }
}

struct WeaponStatImage_Previews: PreviewProvider {
    static var previews: some View {
        WeaponStatImage(imageName: "fireRate", width: 75, padding: 5)
    }
}
