//
//  WeaponsList.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 8/6/23.
//

import SwiftUI

struct WeaponsList: View {
    
    // MARK: Variables
    @State private var weapons: [Weapon] = []
    @State private var isLoading = false
    @State private var hasError = false
    private let valorantService = ValorantService()
    private var totalWeapons: Int {
        weapons.count
    }
    
    // MARK: Get all Weapons info to weapons: [Weapon]
    func getAllWeapons() {
        isLoading = true
        
        valorantService.getAllWeapons() { result in
            DispatchQueue.main.async {
                isLoading = false
                
                switch result {
                    case .success(let weapons):
                        self.weapons = weapons
                    case .failure(let error):
                    hasError = true
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: -12) {
                SectionTitleView(title: "WeaponsTitle")
                
                ForEach(weapons, id: \.uuid) { weapon in
                    WeaponCardComponentView(weapon: weapon)
                }
                
                SectionTotalView(title: "TotalWeaponsSubtitle", total: totalWeapons)
                
                SectionLogoView()
            }
        }
        .scrollIndicators(.hidden)
        .onAppear() {
            if weapons.isEmpty {
                getAllWeapons()
            }
        }
    }
}

//struct WeaponsList_Previews: PreviewProvider {
//    static var previews: some View {
//        WeaponsList()
//    }
//}
