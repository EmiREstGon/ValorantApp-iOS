//
//  WeaponName.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 8/6/23.
//

import SwiftUI

struct WeaponName: View {
    
    // MARK: Variable
    var weapon: Weapon
    
    var body: some View {
        Text(weapon.displayName)
            .font(.custom("VALORANT", size: 30))
            .fontWeight(.bold)
            .padding(.bottom, -10)
            .foregroundColor(.white)
    }
}

//struct WeaponName_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        let weaponStats = WeaponStats(fireRate: 12, magazineSize: 100, runSpeedMultiplier: 0.76, equipTimeSeconds: 1.25, reloadTimeSeconds: 5, firstBulletAccuracy: 0.8, shotgunPelletCount: 1)
//        
//        let weapon = Weapon(uuid: "1", displayName: "Odin", category: "Heavy Weapons", displayIcon: "https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/displayicon.png", weaponStats: weaponStats)
//        
//        WeaponName(weapon: weapon)
//    }
//}
