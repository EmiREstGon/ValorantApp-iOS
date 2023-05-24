//
//  WeaponStats.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 5/6/23.
//

import Foundation

struct WeaponStats: Codable {
    let fireRate: Double
    let magazineSize: Int
    let runSpeedMultiplier: Double
    let equipTimeSeconds: Double
    let reloadTimeSeconds: Double
    let firstBulletAccuracy: Double
    let shotgunPelletCount: Int
    let wallPenetration: String
}
