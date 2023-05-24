//
//  WeaponIcon.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 8/6/23.
//

import SwiftUI

struct WeaponIcon: View {
    
    // MARK: Variables
    var isCardIcon: Bool = false
    var weapon: Weapon
    
    var body: some View {
        AsyncImage(url: URL(string: weapon.displayIcon ?? "")) { image in
            image.resizable().scaledToFit().opacity(1)
                .scaleEffect(isCardIcon ? 1 : 1.35)
                .padding()
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
                .shadow(color: Color("darkRed"), radius: 2, x: 8, y: 10)
        } placeholder: {
            ProgressView()
                .tint(.white)
                .scaleEffect(x: 1.5, y: 1.5)
        }
        .frame(maxHeight: 170)
    }
}

//struct WeaponIcon_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        let weaponStats = WeaponStats(fireRate: 12, magazineSize: 100, runSpeedMultiplier: 0.76, equipTimeSeconds: 1.25, reloadTimeSeconds: 5, firstBulletAccuracy: 0.8, shotgunPelletCount: 1, wallPenetration: "High")
//        
//        let shopData = ShopData(cost: 3200, category: "Heavy Weapons")
//        
//        let weapon = Weapon(uuid: "1", displayName: "Odin", displayIcon: "https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/displayicon.png", weaponStats: weaponStats, shopData: shopData)
//        
//        WeaponIcon(weapon: weapon)
//    }
//}
