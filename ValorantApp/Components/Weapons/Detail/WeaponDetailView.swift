//
//  WeaponDetailView.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 31/5/23.
//

import SwiftUI

struct WeaponDetailView: View {
    
    // MARK: Variables
    @State private var showingFireRateInfoSheet = false
    @State private var showingMagazineSizeInfoSheet = false
    @State private var showingRunSpeedInfoSheet = false
    @State private var showingEquipTimeInfoSheet = false
    @State private var showingReloadTimeInfoSheet = false
    @State private var showingFirstBulletInfoSheet = false
    @State private var showingShotgunPelletInfoSheet = false
    @State private var showingWallPenetrationInfoSheet = false
    var weapon: Weapon
    
    var body: some View {
        VStack {
            ScrollView {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    WeaponIcon(weapon: weapon)
                        .padding(.top)
                        .padding(.horizontal)
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        WeaponStatsTitle()
                            .padding(.leading)
                            .padding(.top, 10)
                        
                        Spacer()
                    }
                    .padding(.leading)
                    .padding(.top)
                    
                    HStack {
                        WeaponStat(
                            infoSheet: $showingFireRateInfoSheet,
                            statImage: WeaponStatImage(imageName: "fireRate", width: 45, padding: 20),
                            statImageInfoSheet: WeaponStatImage(imageName: "fireRate", width: 75, padding: 5),
                            statName: WeaponStatName(localizedString: "FireRateSubtitle"),
                            statDescription: WeaponStatDescription(localizedString: "FireRateDescription"),
                            valueName: weapon.weaponStats?.fireRate ?? 0.0,
                            isTrailingStat: false
                        )
                        
                        WeaponStat(
                            infoSheet: $showingMagazineSizeInfoSheet,
                            statImage: WeaponStatImage(imageName: "magazineSize", width: 35, padding: 10),
                            statImageInfoSheet: WeaponStatImage(imageName: "magazineSize", width: 65, padding: 5),
                            statName: WeaponStatName(localizedString: "MagazineSizeSubtitle"),
                            statDescription: WeaponStatDescription(localizedString: "MagazineSizeDescription"),
                            valueIsDouble: false,
                            valueName: weapon.weaponStats?.magazineSize ?? 0,
                            valuePaddingLeading: 15
                        )
                    }
                    
                    HStack {
                        WeaponStat(
                            infoSheet: $showingReloadTimeInfoSheet,
                            statImage: WeaponStatImage(imageName: "reloadTime", width: 40, padding: 20),
                            statImageInfoSheet: WeaponStatImage(imageName: "reloadTime", width: 65, padding: 5),
                            statName: WeaponStatName(localizedString: "ReloadTimeSubtitle"),
                            statDescription: WeaponStatDescription(localizedString: "ReloadTimeDescription"),
                            valueName: weapon.weaponStats?.reloadTimeSeconds ?? 0.0,
                            valueHasSeconds: true,
                            valuePaddingLeading: 10
                        )
                        
                        WeaponStat(
                            infoSheet: $showingEquipTimeInfoSheet,
                            statImage: WeaponStatImage(imageName: "equipTime", width: 40, padding: 10),
                            statImageInfoSheet: WeaponStatImage(imageName: "equipTime", width: 65, padding: 5),
                            statName: WeaponStatName(localizedString: "EquipTimeSubtitle"),
                            statDescription: WeaponStatDescription(localizedString: "EquipTimeDescription"),
                            valueName: weapon.weaponStats?.equipTimeSeconds ?? 0.0,
                            valueHasSeconds: true,
                            valuePaddingLeading: 10
                        )
                    }
                    
                    HStack {
                        WeaponStat(
                            infoSheet: $showingRunSpeedInfoSheet,
                            statImage: WeaponStatImage(imageName: "runSpeed", width: 40, padding: 20),
                            statImageInfoSheet: WeaponStatImage(imageName: "runSpeed", width: 65, padding: 5),
                            statName: WeaponStatName(localizedString: "RunSpeedSubtitle"),
                            statDescription: WeaponStatDescription(localizedString: "RunSpeedDescription"),
                            valueName: weapon.weaponStats?.runSpeedMultiplier ?? 0.0,
                            valuePaddingLeading: 10
                        )
                        
                        WeaponStat(
                            infoSheet: $showingFirstBulletInfoSheet,
                            statImage: WeaponStatImage(imageName: "firstBullet", width: 40, padding: 10),
                            statImageInfoSheet: WeaponStatImage(imageName: "firstBullet", width: 65, padding: 5),
                            statName: WeaponStatName(localizedString: "FirstBulletSubtitle"),
                            statDescription: WeaponStatDescription(localizedString: "FirstBulletDescription"),
                            valueName: weapon.weaponStats?.firstBulletAccuracy ?? 0.0,
                            valuePaddingLeading: 10
                        )
                    }
                    
                    HStack {
                        WeaponStat(
                            infoSheet: $showingShotgunPelletInfoSheet,
                            statImage: WeaponStatImage(imageName: "shotgunPellet", width: 40, padding: 20),
                            statImageInfoSheet: WeaponStatImage(imageName: "shotgunPellet", width: 65, padding: 0),
                            statName: WeaponStatName(localizedString: "ShotgunPelletSubtitle"),
                            statDescription: WeaponStatDescription(localizedString: "ShotgunPelletDescription"),
                            valueIsDouble: false,
                            valueName: weapon.weaponStats?.shotgunPelletCount ?? 0,
                            valuePaddingLeading: 10
                        )
                        
                        WeaponStat(
                            infoSheet: $showingWallPenetrationInfoSheet,
                            statImage: WeaponStatImage(imageName: "wallPenetration", width: 35, padding: 12.5),
                            statImageInfoSheet: WeaponStatImage(imageName: "wallPenetration", width: 60, padding: 0),
                            statName: WeaponStatName(localizedString: "WallPenetrationSubtitle"),
                            statDescription: WeaponStatDescription(localizedString: "WallPenetrationDescription"),
                            valueIsDouble: false,
                            valueName: weapon.weaponStats?.wallPenetration.extractValue() ?? "Not especified",
                            valuePaddingLeading: 10
                        )
                    }
                    
                    .padding(.bottom, 10)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
                .background(Color("red"))
                .cornerRadius(20)
                .padding()
                .shadow(radius: 5)
            }
            .fontWeight(.semibold)
        }
        .navigationBarTitle(weapon.displayName)
        .background(Color("darkBlue")).opacity(0.975)
    }
}

extension String {
    func extractValue() -> String {
        let components = self.components(separatedBy: "::")
        if components.count > 1 {
            return components[1]
        }
        return self
    }
}

//struct WeaponDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        let weaponStats = WeaponStats(fireRate: 12, magazineSize: 100, runSpeedMultiplier: 0.76, equipTimeSeconds: 1.25, reloadTimeSeconds: 5, firstBulletAccuracy: 0.8, shotgunPelletCount: 1, wallPenetration: "High")
//
//        let shopData = ShopData(cost: 3200, category: "Heavy Weapons")
//
//        let weapon = Weapon(uuid: "1", displayName: "Odin", displayIcon: "https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/displayicon.png", weaponStats: weaponStats, shopData: shopData)
//
//        WeaponDetailView(weapon: weapon)
//    }
//}
