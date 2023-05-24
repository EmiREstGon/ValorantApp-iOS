//
//  WeaponStatName.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 7/6/23.
//

import SwiftUI

struct WeaponStatName: View {
    
    // MARK: Variable
    var localizedString: String
    
    var body: some View {
        Text(LocalizedStringKey(localizedString))
            .font(.title)
            .fontWeight(.semibold)
            .padding(.horizontal)
    }
}

struct WeaponStatName_Previews: PreviewProvider {
    static var previews: some View {
        WeaponStatName(localizedString: "FireRateSubtitle")
    }
}
