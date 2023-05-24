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
    
    // MARK: Favorites init
    init() {
        let initFavorites = UserDefaults.standard.stringArray(forKey: "favoritesAgents") ?? []
        favoriteAgents = initFavorites
    }
    
    // MARK: Add Agent to favorites
    private func setFavoriteAgent(agentId: String) {
        favoriteAgents.append(agentId)
        UserDefaults.standard.set(favoriteAgents, forKey: "favoritesAgents")
    }
    
    // MARK: Remove Agent from favorites
    private func removeFavoriteAgent(agentId: String) {
        let agentIndex = favoriteAgents.firstIndex { agent in
            agentId == agent
        }
        
        if let index = agentIndex {
            favoriteAgents.remove(at: index)
            UserDefaults.standard.set(favoriteAgents, forKey: "favoritesAgents")
        }
        
    }
    
    // MARK: Favorite button pressed
    func onFavoritePressed(agentId: String, isFavorite: Bool) {
        if isFavorite {
            removeFavoriteAgent(agentId: agentId)
        } else {
            setFavoriteAgent(agentId: agentId)
        }
    }
}
