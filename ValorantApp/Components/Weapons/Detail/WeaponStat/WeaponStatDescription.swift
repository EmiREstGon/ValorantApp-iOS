//
//  WeaponStatDescription.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 7/6/23.
//

import SwiftUI

struct WeaponStatDescription: View {
    
    // MARK: Variable
    var localizedString: String

    var body: some View {
        Text(LocalizedStringKey(localizedString))
            .font(.title2)
            .fontWeight(.none)
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 25)
            .padding(.top, 10)
            .padding(.bottom, 25)
    }
}

struct WeaponStatDescription_Previews: PreviewProvider {
    static var previews: some View {
        WeaponStatDescription(localizedString: "FireRateDescription")
    }
}
