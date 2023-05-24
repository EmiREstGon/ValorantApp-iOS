//
//  WeaponCardView.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 29/5/23.
//

import SwiftUI

struct WeaponCardComponentView: View {
    
    // MARK: Variables
    var weapon: Weapon
    
    var body: some View {
        NavigationLink(destination: WeaponDetailView(weapon: weapon)) {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        WeaponName(weapon: weapon)
                            .padding(.bottom, -30)

                        WeaponCategoryName(weapon: weapon)
                    }
                    
                    Spacer()
                }
                .padding(.leading, -30)
                .padding(.top, 50)
                .padding(.bottom, -30)
            }
            .padding(35)
            .background(
                ZStack {
                    Color("darkBlue")
                    WeaponIcon(isCardIcon: true, weapon: weapon)
                }
            )
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity, minHeight: 150)
            .cornerRadius(20)
            .padding()
            .shadow(radius: 5)
        }
    }
}

struct WeaponCardComponentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let weaponStats = WeaponStats(fireRate: 12, magazineSize: 100, runSpeedMultiplier: 0.76, equipTimeSeconds: 1.25, reloadTimeSeconds: 5, firstBulletAccuracy: 0.8, shotgunPelletCount: 1, wallPenetration: "High")
        
        let shopData = ShopData(cost: 3200, category: "Heavy Weapons")
        
        let weapon = Weapon(uuid: "1", displayName: "Odin", displayIcon: "https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/displayicon.png", weaponStats: weaponStats, shopData: shopData)
        
        WeaponCardComponentView(weapon: weapon)
    }
}
