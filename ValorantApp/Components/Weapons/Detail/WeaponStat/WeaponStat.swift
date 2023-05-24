//
//  WeaponStat.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 8/6/23.
//

import SwiftUI

struct WeaponStat: View {
    
    // MARK: Variables
    @State private var showingFireRateInfoSheet = false
    var infoSheet: Binding<Bool>
    var statImage: WeaponStatImage
    var statImageInfoSheet: WeaponStatImage
    var statName: WeaponStatName
    var statDescription: WeaponStatDescription
    var valueIsDouble: Bool = true
    var valueName: CVarArg
    var valueHasSeconds: Bool = false
    var valuePaddingLeading: CGFloat = 5
    var isTrailingStat: Bool = true
    
    var body: some View {
        HStack {
            Button {
                infoSheet.wrappedValue = true
            } label: {
                statImage
                    .sheet(isPresented: infoSheet) {
                        ZStack {
                            VStack {
                                HStack {
                                    statImageInfoSheet
                                }
                                .padding(.top)
                                
                                HStack {
                                    statName
                                        .foregroundColor(Color("lightRed"))
                                }
                                
                                statDescription
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color("darkBlue"))
                            .cornerRadius(20)
                            .shadow(radius: 5)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.white, lineWidth: 3)
                            }
                            .padding()
                        }
                        .frame(maxHeight: .infinity)
                        .background(Color("red"))
                    }
            }
            
            if valueIsDouble {
                if let value = valueName as? Double {
                    let formattedValue = value.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", value) : String(format: "%.2f", value)
                    
                    if valueHasSeconds {
                        Text("\(formattedValue) s")
                            .font(.custom("VALORANT", size: 20))
                            .font(.title2)
                            .padding(.leading, valuePaddingLeading)
                    } else {
                        Text(formattedValue)
                            .font(.custom("VALORANT", size: 20))
                            .font(.title2)
                            .padding(.leading, valuePaddingLeading)
                    }
                }
            } else {
                if let value = valueName as? Int {
                    Text("\(value)")
                        .font(.custom("VALORANT", size: 20))
                        .font(.title2)
                        .padding(.leading, valuePaddingLeading)
                } else {
                    if let value = valueName as? String {
                        Text("\(value)")
                            .font(.custom("VALORANT", size: 18))
                            .font(.title2)
                            .padding(.leading, valuePaddingLeading)
                    }
                }
            }
            
            Spacer()
        }
        .padding(.leading)
        .padding(.top, isTrailingStat ? 10 : 0)
    }
}

struct WeaponStat_Previews: PreviewProvider {
    static var previews: some View {
        let showingFireRateInfoSheet = false
        
        let weaponStats = WeaponStats(fireRate: 12, magazineSize: 100, runSpeedMultiplier: 0.76, equipTimeSeconds: 1.25, reloadTimeSeconds: 5, firstBulletAccuracy: 0.8, shotgunPelletCount: 1, wallPenetration: "High")
        
        let shopData = ShopData(cost: 3200, category: "Heavy Weapons")
        
        let weapon = Weapon(uuid: "1", displayName: "Odin", displayIcon: "https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/displayicon.png", weaponStats: weaponStats, shopData: shopData)
        
        return WeaponStat(
            infoSheet: .constant(showingFireRateInfoSheet),
            statImage: WeaponStatImage(imageName: "fireRate", width: 45, padding: 20),
            statImageInfoSheet: WeaponStatImage(imageName: "fireRate", width: 75, padding: 5),
            statName: WeaponStatName(localizedString: "FireRateSubtitle"),
            statDescription: WeaponStatDescription(localizedString: "FireRateDescription"),
            valueName: String(format: "%.2f", weapon.weaponStats?.fireRate ?? 0.0),
            valueHasSeconds: true,
            valuePaddingLeading: 10,
            isTrailingStat: true
        )
    }
}
