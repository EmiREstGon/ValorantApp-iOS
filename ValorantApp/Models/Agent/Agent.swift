//
//  AgentModel.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 24/5/23.
//

import Foundation

struct Agent: Codable {
    let uuid: String
    let displayName: String
    let description: String
    let displayIcon: String
    let fullPortrait: String
    let killfeedPortrait: String
    let background: String
    let role: Role?
    var abilities: [Ability]?
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case displayName
        case description
        case displayIcon
        case fullPortrait
        case killfeedPortrait
        case background
        case role
        case abilities
    }
}
