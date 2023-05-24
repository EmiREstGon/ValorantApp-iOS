//
//  WeaponStatsTitle.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 7/6/23.
//

import SwiftUI

struct WeaponStatsTitle: View {
    var body: some View {
        Text(LocalizedStringKey("StatsTitle"))
            .font(.custom("VALORANT", size: 28))
            .font(.title)
            .fontWeight(.semibold)
    }
}

struct WeaponStatsTitle_Previews: PreviewProvider {
    static var previews: some View {
        WeaponStatsTitle()
    }
}
