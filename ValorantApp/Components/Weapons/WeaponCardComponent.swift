//
//  WeaponCardView.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 29/5/23.
//

import SwiftUI

struct WeaponCardComponentView: View {
    
    // MARK: Variables
    @EnvironmentObject var data: UserData
    @State var isFavorite: Bool = false
    var weapon: Weapon
    
    var body: some View {
        NavigationLink(destination: WeaponDetailView(weapon: weapon)) {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        HStack {
                            WeaponCategoryName(weapon: weapon)
                            
                            Spacer()
                        }
                        
                        HStack {
                            WeaponName(weapon: weapon)
                            
                            Spacer()
                        }
                    }
                    .padding(.leading, -5)
                    .frame(height: 123)
                }
            }
            .padding(25)
            .background(
                ZStack {
                    Color("darkBlue")
                    WeaponIcon(isCardIcon: true, weapon: weapon)
                }
            )
            .overlay(
                heartButton(weaponId: weapon.uuid, isFavorite: isFavorite, onFavoritePressed: data.onFavoriteWeaponPressed)
                , alignment: .topTrailing)
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity, minHeight: 150)
            .cornerRadius(20)
            .padding()
            .shadow(radius: 5)
        }
        .onReceive(data.$favoriteWeapons) { favoriteWeapons in
            isFavorite = favoriteWeapons.contains{ id in
                weapon.uuid == id
            }
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
