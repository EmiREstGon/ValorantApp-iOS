//
//  Weapon.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 29/5/23.
//

import Foundation

struct Weapon: Codable {
    let uuid: String
    let displayName: String
    let displayIcon: String?
    let weaponStats: WeaponStats?
    let shopData: ShopData?
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case displayName
        case displayIcon
        case weaponStats
        case shopData
    }
}
