//
//  WeaponModel.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 29/5/23.
//

import Foundation

struct WeaponModel: Codable {
    let weapons: [Weapon]
    
    enum CodingKeys: String, CodingKey {
        case weapons = "data"
    }
}
