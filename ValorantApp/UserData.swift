//
//  UserData.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 31/5/23.
//

import Foundation

class UserData: ObservableObject {
    
    // MARK: Variables
    @Published var favoriteAgents: [String]
    @Published var favoriteWeapons: [String]
    
    // MARK: Favorites init
    init() {
        let initFavorites = UserDefaults.standard.stringArray(forKey: "favoritesAgents") ?? []
        favoriteAgents = initFavorites
        
        let initFavoriteWeapons = UserDefaults.standard.stringArray(forKey: "favoritesWeapons") ?? []
        favoriteWeapons = initFavoriteWeapons
    }
    
    // MARK: Add Agent to favorites
    private func setFavoriteAgent(agentId: String) {
        favoriteAgents.append(agentId)
        UserDefaults.standard.set(favoriteAgents, forKey: "favoritesAgents")
    }
    
    // MARK: Remove Agent from favorites
    private func removeFavoriteAgent(agentId: String) {
        if let index = favoriteAgents.firstIndex(of: agentId) {
            favoriteAgents.remove(at: index)
            UserDefaults.standard.set(favoriteAgents, forKey: "favoritesAgents")
        }
    }
    
    // MARK: Add Weapon to favorites
    private func setFavoriteWeapon(weaponId: String) {
        favoriteWeapons.append(weaponId)
        UserDefaults.standard.set(favoriteWeapons, forKey: "favoritesWeapons")
    }
    
    // MARK: Remove Weapon from favorites
    private func removeFavoriteWeapon(weaponId: String) {
        if let index = favoriteWeapons.firstIndex(of: weaponId) {
            favoriteWeapons.remove(at: index)
            UserDefaults.standard.set(favoriteWeapons, forKey: "favoritesWeapons")
        }
    }
    
    // MARK: Favorite button pressed
    func onFavoriteAgentPressed(agentId: String, isFavorite: Bool) {
        if isFavorite {
            removeFavoriteAgent(agentId: agentId)
        } else {
            setFavoriteAgent(agentId: agentId)
        }
    }
    
    func onFavoriteWeaponPressed(weaponId: String, isFavorite: Bool) {
        if isFavorite {
            removeFavoriteWeapon(weaponId: weaponId)
        } else {
            setFavoriteWeapon(weaponId: weaponId)
        }
    }
}
